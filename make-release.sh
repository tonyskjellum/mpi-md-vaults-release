#!/usr/bin/env bash
# Cut a release of the MPI vaults into this PUBLIC repository.
#
#   ./make-release.sh prepare <private-tag> [--no-push]
#       Copy the released vaults out of the private mpi-md-vaults repository at
#       <private-tag>, rebuild and verify the hypervault, commit on a branch
#       release-prep/<date>, push the branch and open a pull request.
#   ./make-release.sh tag [--no-push]
#       After that pull request is merged: verify main and tag it
#       release/<date> and hypervault/<date>, then push those two tags by name.
#
#   MPI2MD_DIR   mpi2md checkout holding mpihyper.py (required, must be clean)
#   SOURCE_DIR   private mpi-md-vaults checkout (default: ../mpi-md-vaults)
#   --no-push    do everything locally; push nothing, open nothing
#
# Only a copied tree ever reaches this repository; the private history never
# does. What is released is decided here, not in the private repository: the
# vaults listed in this repository's hypervault.json. To add a newly ratified
# release, edit hypervault.json (release and edge) and run `prepare` with that
# edit uncommitted; it is committed with the vaults. Draft releases are refused.
set -euo pipefail

PUBLIC_REPO=tonyskjellum/mpi-md-vaults-release
PRIVATE_REPO=tonyskjellum/mpi-md-vaults
url_re() { printf '^(git@github\\.com:|ssh://git@github\\.com/|https://github\\.com/)%s(\\.git)?/?$' "${1//./\\.}"; }
die() { echo "make-release: $*" >&2; exit 1; }

ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || die "run inside the $PUBLIC_REPO checkout"
cd "$ROOT"
[[ "$(git remote get-url origin)" =~ $(url_re "$PUBLIC_REPO") ]] || die "origin of $ROOT is not $PUBLIC_REPO"

MODE="${1:-}"; shift || true
TAG=""; PUSH=1
for a in "$@"; do
  case "$a" in
    --no-push) PUSH=0 ;;
    -*) die "unknown option $a" ;;
    *) [ -z "$TAG" ] || die "one tag only"; TAG="$a" ;;
  esac
done

MPI2MD="${MPI2MD_DIR:-}"
[ -n "$MPI2MD" ] && [ -f "$MPI2MD/mpihyper.py" ] || die "set MPI2MD_DIR to the mpi2md checkout holding mpihyper.py"
[ -z "$(git -C "$MPI2MD" status --porcelain)" ] || die "$MPI2MD has uncommitted changes; the provenance would record a dirty generator"
hyper() { python3 "$MPI2MD/mpihyper.py" --vaults "$1/vaults" --out "$1/hypervault" --config "$1/hypervault.json" --renames "$1/renames.json" "${@:2}"; }

sync_main() {
  [ "$(git branch --show-current)" = main ] || die "switch to main first"
  git fetch -q --tags origin
  git merge -q --ff-only origin/main || die "main has diverged from origin/main"
  [ "$(git rev-parse main)" = "$(git rev-parse origin/main)" ] || die "main has commits origin/main does not; push or drop them first"
}

# Anything that identifies a machine or a person does not belong in a public tree.
leak_scan() {
  if git grep "$@" -I -l -E '/Users/|/home/[a-z]|@gmail\.com' -- . ; then
    echo "make-release: the files above contain a local path or an email address; nothing was pushed" >&2
    return 1
  fi
}

prepare() {
  [ -n "$TAG" ] || die "usage: $0 prepare <private-tag> [--no-push]"
  local dirty; dirty="$(git status --porcelain | grep -v '^ M hypervault\.json$' || true)"
  [ -z "$dirty" ] || die "working tree must be clean (an edit to hypervault.json is the one exception)"
  # Set an uncommitted hypervault.json aside while main is brought up to date.
  local CFG=""
  if [ -n "$(git status --porcelain -- hypervault.json)" ]; then
    CFG="$(mktemp)"; cp hypervault.json "$CFG"; git checkout -q -- hypervault.json
  fi
  sync_main
  if [ -n "$CFG" ]; then cp "$CFG" hypervault.json; rm -f "$CFG"; fi

  local SRC="${SOURCE_DIR:-$ROOT/../mpi-md-vaults}"
  [ -d "$SRC/.git" ] || die "no private checkout at $SRC (set SOURCE_DIR)"
  [[ "$(git -C "$SRC" remote get-url origin)" =~ $(url_re "$PRIVATE_REPO") ]] || die "$SRC is not a checkout of $PRIVATE_REPO"
  git -C "$SRC" fetch -q --tags origin
  local SRC_COMMIT; SRC_COMMIT="$(git -C "$SRC" rev-parse --verify -q "$TAG^{commit}")" || die "no tag $TAG in $SRC"

  # The source tag must itself be consistent: its hypervault verifies against its vaults.
  X="$(mktemp -d)"; trap 'rm -rf "$X"' EXIT
  git -C "$SRC" archive --format=tar "$TAG" vaults hypervault hypervault.json renames.json | tar -x -C "$X"
  hyper "$X" --verify >/dev/null || die "the hypervault at $TAG does not verify against its own vaults"

  # The release set comes from THIS repository's config; drafts are refused on either side.
  local DIRS
  DIRS="$(python3 - "$ROOT/hypervault.json" "$X/hypervault.json" <<'PY'
import json, sys
rel = json.load(open(sys.argv[1]))["releases"]
src = {r["dir"]: r for r in json.load(open(sys.argv[2]))["releases"]}
for r in rel:
    if r.get("draft"): sys.exit(f"hypervault.json here lists a draft: {r['label']}")
    if r["dir"] not in src: sys.exit(f"{r['dir']} is not in the private tag")
    if src[r["dir"]].get("draft"): sys.exit(f"{r['label']} is a draft in the private repository")
    print(r["dir"])
PY
)" || die "release set rejected"

  local DATE BR n; DATE="$(date +%Y-%m-%d)"; BR="release-prep/$DATE"; n=2
  while git rev-parse -q --verify "refs/heads/$BR" >/dev/null || git ls-remote -q --exit-code --heads origin "$BR" >/dev/null; do BR="release-prep/$DATE.$n"; n=$((n+1)); done
  git switch -q -c "$BR"
  abandon() { git reset -q --hard; git switch -q main; git branch -q -D "$BR"; }

  rm -rf vaults; mkdir vaults
  for d in $DIRS; do cp -Rp "$X/vaults/$d" vaults/; done
  cp -p "$X/renames.json" renames.json
  git add -A vaults renames.json hypervault.json
  for d in $DIRS; do
    [ "$(git write-tree --prefix="vaults/$d/")" = "$(git -C "$SRC" rev-parse "$TAG:vaults/$d")" ] \
      || { abandon; die "vaults/$d differs from $TAG:vaults/$d after copying"; }
  done
  if git diff --cached --quiet; then abandon; die "the vaults at $TAG are already what main holds; nothing to release"; fi
  leak_scan --cached || { abandon; exit 1; }
  git commit -q -m "Import the released vaults from $PRIVATE_REPO at $TAG" \
               -m "Private commit $SRC_COMMIT. Vault trees are identical to the tag's."

  hyper "$ROOT" | tail -3
  hyper "$ROOT" --verify

  local GEN; GEN="$(git -C "$MPI2MD" rev-parse HEAD)"
  {
    echo "# Release record"; echo
    echo "Cut $DATE from \`$PRIVATE_REPO\` at tag \`$TAG\` (commit \`$SRC_COMMIT\`),"
    echo "whose hypervault was verified consistent with its vaults before they were copied."; echo
    echo "Included: $(python3 -c 'import json,sys;print(", ".join(r["label"] for r in json.load(open(sys.argv[1]))["releases"]))' hypervault.json),"
    echo "unchanged. Not included: draft versions of the standard, and the private repository's"
    echo "build logs, work logs and plans. \`hypervault/\` was rebuilt over the included releases"
    echo "by \`mpi2md\` commit \`$GEN\`; its \`PROVENANCE.json\` names the commit of this"
    echo "repository that held the inputs."; echo
    echo '| vault | git tree hash (identical in both repositories) |'
    echo '|-------|-----------------------------------------------|'
    for d in $DIRS; do echo "| \`$d\` | \`$(git rev-parse "HEAD:vaults/$d")\` |"; done
  } > RELEASE.md
  git add -A hypervault RELEASE.md
  leak_scan --cached || { abandon; exit 1; }
  git commit -q -m "Rebuild the hypervault and the release record for $TAG" \
               -m "Generated by mpi2md mpihyper.py at $GEN."

  if [ "$PUSH" = 0 ]; then echo "prepared $BR locally (--no-push): nothing pushed"; return; fi
  git push -q -u origin "$BR"
  gh pr create -R "$PUBLIC_REPO" --base main --head "$BR" \
    --title "Release from $TAG" \
    --body "Vaults copied from the private repository at \`$TAG\`; hypervault rebuilt and verified. See RELEASE.md. After merging, run \`./make-release.sh tag\`."
  echo "next: review and merge the PR, then: ./make-release.sh tag"
}

tag() {
  [ -z "$TAG" ] || die "usage: $0 tag [--no-push]"
  [ -z "$(git status --porcelain)" ] || die "working tree must be clean"
  sync_main
  [ -z "$(git tag --points-at HEAD 'release/*')" ] || die "main is already tagged $(git tag --points-at HEAD 'release/*')"
  MPI2MD_DIR="$MPI2MD" ./build-hypervault.sh --tag
  local HT; HT="$(git tag --points-at HEAD 'hypervault/*' | sort | tail -1)"
  local RT n; RT="release/$(date +%Y-%m-%d)"; n=2
  while git rev-parse -q --verify "refs/tags/$RT" >/dev/null; do RT="release/$(date +%Y-%m-%d).$n"; n=$((n+1)); done
  git tag -a "$RT" -m "MPI standard vaults, $RT. See RELEASE.md."
  if [ "$PUSH" = 0 ]; then echo "tagged $RT and $HT locally (--no-push): nothing pushed"; return; fi
  git push origin "refs/tags/$RT" "refs/tags/$HT"
  echo "released: $RT ($HT)"
}

case "$MODE" in
  prepare) prepare ;;
  tag) tag ;;
  *) sed -n '2,20p' "$0" | sed 's/^# \{0,1\}//'; exit 2 ;;
esac

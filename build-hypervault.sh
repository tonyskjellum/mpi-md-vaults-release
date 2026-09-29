#!/usr/bin/env bash
# Rebuild the longitudinal vault from the per-release vaults -- the ONE command.
#   ./build-hypervault.sh            build hypervault/ from vaults/
#   ./build-hypervault.sh --verify   check hypervault/ is consistent with vaults/
#   ./build-hypervault.sh --tag      verify, require a clean tree, then create an annotated
#                                    tag hypervault/<date> whose message is PROVENANCE.json
# The generator lives in the mpi2md repo (MPI2MD_DIR, default ../mpi2md-gitrepo).
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
MPI2MD="${MPI2MD_DIR:-$HERE/../mpi2md-gitrepo}"
[ -f "$MPI2MD/mpihyper.py" ] || { echo "mpihyper.py not found under $MPI2MD (set MPI2MD_DIR)"; exit 1; }
cd "$HERE"
case "${1:-}" in
  --verify) python3 "$MPI2MD/mpihyper.py" --vaults vaults --out hypervault --config hypervault.json --renames renames.json --verify ;;
  --tag)
    python3 "$MPI2MD/mpihyper.py" --vaults vaults --out hypervault --config hypervault.json --renames renames.json --verify || exit 1
    if [ -n "$(git status --porcelain)" ]; then echo "commit first (vaults and the rebuilt hypervault), then --tag"; exit 1; fi
    T="hypervault/$(date +%Y-%m-%d)"; n=2; while git rev-parse -q --verify "refs/tags/$T" >/dev/null; do T="hypervault/$(date +%Y-%m-%d).$n"; n=$((n+1)); done
    git tag -a "$T" -F hypervault/PROVENANCE.json && echo "tagged $T" ;;
  *) python3 "$MPI2MD/mpihyper.py" --vaults vaults --out hypervault --config hypervault.json --renames renames.json ;;
esac

# MPI standard vaults — release

Machine-readable renderings of every released MPI standard that has LaTeX
sources, MPI-1.3 through MPI-5.0, produced by the `mpi2md` toolset: one
Obsidian vault per release under `vaults/`, and one longitudinal vault over all
of them under `hypervault/`.

Read `NOTICE.md` first: it carries the copyright notice and title of each
source document, which the MPI documents' copying permission requires to
accompany them. The normative text of each standard remains the PDF published
by the MPI Forum at <https://www.mpi-forum.org/docs/>.

## The per-release vaults (`vaults/`)

Each vault holds:

* `signatures.json` — the signature database: C / Fortran 2008 / `mpif.h`
  prototypes, argument intents, C++ bindings for the 2.x standards, examples;
* `API/MPI_*.md` — one note per routine;
* `sections/*.md` — chapter prose with wikilinks and callouts, including the
  `changes` chapter;
* `MPI-API-MOC.md` — the map of content;
* `qa-report.{json,html}` — the QA dashboard.

| vault          | release | routines | examples | validation at build                      |
|----------------|---------|---------:|---------:|------------------------------------------|
| `vault-mpi-50` | MPI-5.0 |      535 |      214 | all chapters clean; crosscheck exact     |
| `vault-mpi-41` | MPI-4.1 |      507 |      210 | all chapters clean; crosscheck exact     |
| `vault-mpi-40` | MPI-4.0 |      483 |      177 | all chapters clean; crosscheck exact     |
| `vault-mpi-31` | MPI-3.1 |      414 |      155 | all chapters clean; crosscheck exact     |
| `vault-mpi-30` | MPI-3.0 |      404 |      174 | all chapters clean; crosscheck exact     |
| `vault-mpi-22` | MPI-2.2 |      313 |      145 | all chapters clean; crosscheck exact     |
| `vault-mpi-21` | MPI-2.1 |      306 |      134 | all chapters clean; crosscheck exact     |
| `vault-mpi-20` | MPI-2.0 |      194 |       60 | all chapters clean; crosscheck exact     |
| `vault-mpi-13` | MPI-1.3 |      129 |       77 | all chapters clean; crosscheck 125 of 128 (the 1993 document is inconsistent with itself: annex return type of `MPI_Wtime`/`MPI_Wtick`, `MPI_Buffer_detach` argument name, `MPI_op_free` spelling) |

"Crosscheck exact" means every C prototype present both in the chapter bodies
and in the standard's own C binding appendix has identical text. MPI-1.0 and
MPI-1.1 exist only as PostScript and are not included. Routine and example
counts are the entries of each vault's `signatures.json`.

Draft versions of the standard are deliberately not included: this release
contains only standards the MPI Forum has ratified.

## The longitudinal vault (`hypervault/`)

`hypervault/` is one Obsidian vault over all nine releases: the nine vaults
under `versions/`, and a generated `timeline/` — routine biographies, section
histories with marked diffs along every edge, per-edge deltas, and the
routines × releases matrix (`timeline/Standard.md`). Open `Hypervault.md`.

`hypervault.json` gives the releases in order and the edges of the release
DAG (1.3 and 2.0 both feed 2.1). `renames.json` lists hand-curated routine
renames, each with its source in the standard.

Known limitation: 225 link targets that name LaTeX cross-reference labels
(`sec-*`, `fig-*`, …) do not resolve in the per-release vaults, and so do not
resolve in the hypervault either.

## Provenance and verification

`hypervault/PROVENANCE.json` records the SHA-256 of every input vault, of
`hypervault.json` and of `renames.json`, the `mpi2md` commit of the generator,
and the commit of this repository that held the inputs. The release tag's
message is that file.

The vaults in `vaults/` are byte-identical to those in the development
repository from which this release was cut; `RELEASE.md` records the commits
and the per-vault git tree hashes, so the identity can be checked with
`git rev-parse <commit>:vaults/<vault>` on both sides.

With the `mpi2md` generator available,

    MPI2MD_DIR=/path/to/mpi2md ./build-hypervault.sh --verify

exits 0 only if `hypervault/` is consistent with the vaults and configuration
it was built from.

## Scholarly Publication(s)

The EuroMPI 2026 Poster Describing the initial release of this work is here: https://doi.org/10.6084/m9.figshare.34020462 .

## Acknowledgment

Support from the National Science Foundation (NSF) Under Grants 2450093 and 2514054 is gratefully acknowledged. Any opinions, findings, and conclusions or recommendations expressed in this material are those of the author(s) and do not necessarily reflect the views of the National Science Foundation.

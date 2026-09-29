# Release record

Cut 2026-09-28 from `tonyskjellum/mpi-md-vaults` at commit `6034c5e1254b17e75ca74d7ec020ee9d778d9cfa`,
whose `vaults/` and `hypervault/` are content-identical to its tag `hypervault/2026-09-08.2`
(verified with `build-hypervault.sh --verify` against `mpi2md` `3e361b00ceb58f72039f015692dad138c5f839c0`).

Included: the nine ratified releases, MPI-1.3 through MPI-5.0, unchanged. Excluded:
the MPI-5.x draft vault, build logs, work logs and plans. `hypervault/` was
rebuilt over the nine releases by the same generator commit; its
`PROVENANCE.json` names the commit of this repository that held the inputs.

| vault | git tree hash (identical in both repositories) |
|-------|-----------------------------------------------|
| `vault-mpi-13` | `b21020d825db7556d5faacd4d380bfa1c4756167` |
| `vault-mpi-20` | `d93a178d08748b6277fcf381bfeddc5d8cedb7a9` |
| `vault-mpi-21` | `d6d43e8b80baa2c5534fab261542c909cbf6022d` |
| `vault-mpi-22` | `cc139d0f7cd02a6a84a89b86479f8f7cfeb2d62f` |
| `vault-mpi-30` | `9f720bd1cb1422a6f2ae7d93a10f2be493169504` |
| `vault-mpi-31` | `08213dbd1a828708873e5a007fd7ab35502a8fb3` |
| `vault-mpi-40` | `6f502964e401d59dc3b5677bafc5ebbd8e848b25` |
| `vault-mpi-41` | `48dfd67d12f2b04a90eb62207e109dc1f7161510` |
| `vault-mpi-50` | `1867024632bf278c8903954dbb7bfbda5920dd32` |

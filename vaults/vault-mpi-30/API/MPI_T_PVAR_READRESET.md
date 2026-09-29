---
title: MPI_T_PVAR_READRESET
c_name: MPI_T_pvar_readreset
lis_name: MPI_T_PVAR_READRESET
chapter: tools
aliases: [MPI_T_PVAR_READRESET, MPI_T_pvar_readreset]
tags: [mpi/function, mpi/tools]
---

# MPI_T_PVAR_READRESET

**C**
```c
int MPI_T_pvar_readreset(MPI_T_pvar_session session, MPI_T_pvar_handle handle, void* buf)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | identifier of performance experiment session (handle) |
| `handle` | IN | handle of a performance variable (handle) |
| `buf` | OUT | initial address of storage location for variable value (choice) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

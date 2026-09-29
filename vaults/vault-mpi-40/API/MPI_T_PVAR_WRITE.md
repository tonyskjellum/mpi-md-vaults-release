---
title: MPI_T_PVAR_WRITE
c_name: MPI_T_pvar_write
lis_name: MPI_T_PVAR_WRITE
chapter: tools
aliases: [MPI_T_PVAR_WRITE, MPI_T_pvar_write]
tags: [mpi/function, mpi/tools]
---

# MPI_T_PVAR_WRITE

**C**
```c
int MPI_T_pvar_write(MPI_T_pvar_session pe_session, MPI_T_pvar_handle handle, const void *buf)
```

| Parameter | Intent | Description |
|---|---|---|
| `pe_session` | IN | identifier of performance experiment session (handle) |
| `handle` | IN | handle of a performance variable (handle) |
| `buf` | IN | initial address of storage location for variable value (choice) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

---
title: MPI_T_PVAR_READ
c_name: MPI_T_pvar_read
lis_name: MPI_T_PVAR_READ
chapter: tools
aliases: [MPI_T_PVAR_READ, MPI_T_pvar_read]
tags: [mpi/function, mpi/tools]
---

# MPI_T_PVAR_READ

**C**
```c
int MPI_T_pvar_read(MPI_T_pvar_session pe_session, MPI_T_pvar_handle handle, void *buf)
```

| Parameter | Intent | Description |
|---|---|---|
| `pe_session` | IN | identifier of performance experiment session (handle) |
| `handle` | IN | handle of a performance variable (handle) |
| `buf` | OUT | initial address of storage location for variable value (choice) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

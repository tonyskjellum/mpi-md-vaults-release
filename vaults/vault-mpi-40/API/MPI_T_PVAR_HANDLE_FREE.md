---
title: MPI_T_PVAR_HANDLE_FREE
c_name: MPI_T_pvar_handle_free
lis_name: MPI_T_PVAR_HANDLE_FREE
chapter: tools
aliases: [MPI_T_PVAR_HANDLE_FREE, MPI_T_pvar_handle_free]
tags: [mpi/function, mpi/tools]
---

# MPI_T_PVAR_HANDLE_FREE

**C**
```c
int MPI_T_pvar_handle_free(MPI_T_pvar_session pe_session, MPI_T_pvar_handle *handle)
```

| Parameter | Intent | Description |
|---|---|---|
| `pe_session` | IN | identifier of performance experiment session (handle) |
| `handle` | INOUT | handle to be freed (handle) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

---
title: MPI_T_PVAR_HANDLE_ALLOC
c_name: MPI_T_pvar_handle_alloc
lis_name: MPI_T_PVAR_HANDLE_ALLOC
chapter: tools
aliases: [MPI_T_PVAR_HANDLE_ALLOC, MPI_T_pvar_handle_alloc]
tags: [mpi/function, mpi/tools]
---

# MPI_T_PVAR_HANDLE_ALLOC

**C**
```c
int MPI_T_pvar_handle_alloc(MPI_T_pvar_session pe_session, int pvar_index, void *obj_handle, MPI_T_pvar_handle *handle, int *count)
```

| Parameter | Intent | Description |
|---|---|---|
| `pe_session` | INOUT | identifier of performance experiment session (handle) |
| `pvar_index` | IN | index of performance variable for which handle is to be allocated (integer) |
| `obj_handle` | IN | reference to a handle of the MPI object to which this variable is supposed to be bound (pointer) |
| `handle` | OUT | allocated handle (handle) |
| `count` | OUT | number of elements used to represent this variable (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

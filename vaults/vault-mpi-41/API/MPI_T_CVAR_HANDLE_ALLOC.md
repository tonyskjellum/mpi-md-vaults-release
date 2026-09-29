---
title: MPI_T_CVAR_HANDLE_ALLOC
c_name: MPI_T_cvar_handle_alloc
lis_name: MPI_T_CVAR_HANDLE_ALLOC
chapter: tools
aliases: [MPI_T_CVAR_HANDLE_ALLOC, MPI_T_cvar_handle_alloc]
tags: [mpi/function, mpi/tools]
---

# MPI_T_CVAR_HANDLE_ALLOC

**C**
```c
int MPI_T_cvar_handle_alloc(int cvar_index, void *obj_handle, MPI_T_cvar_handle *handle, int *count)
```

| Parameter | Intent | Description |
|---|---|---|
| `cvar_index` | IN | index of control variable for which handle is to be allocated (index) |
| `obj_handle` | IN | reference to a handle of the MPI object to which this variable is supposed to be bound (pointer) |
| `handle` | OUT | allocated handle (handle) |
| `count` | OUT | number of elements used to represent this variable (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

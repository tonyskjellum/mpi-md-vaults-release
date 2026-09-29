---
title: MPI_T_CVAR_WRITE
c_name: MPI_T_cvar_write
lis_name: MPI_T_CVAR_WRITE
chapter: tools
aliases: [MPI_T_CVAR_WRITE, MPI_T_cvar_write]
tags: [mpi/function, mpi/tools]
---

# MPI_T_CVAR_WRITE

**C**
```c
int MPI_T_cvar_write(MPI_T_cvar_handle handle, const void* buf)
```

| Parameter | Intent | Description |
|---|---|---|
| `handle` | IN | handle to the control variable to be written (handle) |
| `buf` | IN | initial address of storage location for variable value (choice) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

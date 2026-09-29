---
title: MPI_T_CVAR_READ
c_name: MPI_T_cvar_read
lis_name: MPI_T_CVAR_READ
chapter: tools
aliases: [MPI_T_CVAR_READ, MPI_T_cvar_read]
tags: [mpi/function, mpi/tools]
---

# MPI_T_CVAR_READ

**C**
```c
int MPI_T_cvar_read(MPI_T_cvar_handle handle, void *buf)
```

| Parameter | Intent | Description |
|---|---|---|
| `handle` | IN | handle to the control variable to be read (handle) |
| `buf` | OUT | initial address of storage location for variable value (choice) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

---
title: MPI_T_INIT_THREAD
c_name: MPI_T_init_thread
lis_name: MPI_T_INIT_THREAD
chapter: tools
aliases: [MPI_T_INIT_THREAD, MPI_T_init_thread]
tags: [mpi/function, mpi/tools]
---

# MPI_T_INIT_THREAD

**C**
```c
int MPI_T_init_thread(int required, int *provided)
```

| Parameter | Intent | Description |
|---|---|---|
| `required` | IN | desired level of thread support (integer) |
| `provided` | OUT | provided level of thread support (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

---
title: MPI_INIT_THREAD
c_name: MPI_Init_thread
lis_name: MPI_INIT_THREAD
chapter: ei
aliases: [MPI_INIT_THREAD, MPI_Init_thread]
tags: [mpi/function, mpi/ei]
---

# MPI_INIT_THREAD

**C**
```c
int MPI_Init_thread(int *argc, char *((*argv)[]), int required, int *provided)
```

**C++**
```cpp
int MPI::Init_thread(int& argc, char**& argv, int required)
int MPI::Init_thread(int required)
```

| Parameter | Intent | Description |
|---|---|---|
| `required` | IN | desired level of thread support (integer) |
| `provided` | OUT | provided level of thread support (integer) |

**Fortran (mpif.h)**
```fortran
MPI_INIT_THREAD(REQUIRED, PROVIDED, IERROR)
  INTEGER REQUIRED, PROVIDED, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

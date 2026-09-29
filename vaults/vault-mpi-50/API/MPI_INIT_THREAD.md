---
title: MPI_INIT_THREAD
c_name: MPI_Init_thread
lis_name: MPI_INIT_THREAD
chapter: dynamic
aliases: [MPI_INIT_THREAD, MPI_Init_thread]
tags: [mpi/function, mpi/dynamic]
---

# MPI_INIT_THREAD

**C**
```c
int MPI_Init_thread(int *argc, char ***argv, int required, int *provided)
```

| Parameter | Intent | Description |
|---|---|---|
| `required` | IN | desired level of thread support (integer) |
| `provided` | OUT | provided level of thread support (integer) |

**Fortran 2008**
```fortran
MPI_Init_thread(required, provided, ierror)
  INTEGER, INTENT(IN) :: required
  INTEGER, INTENT(OUT) :: provided
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INIT_THREAD(REQUIRED, PROVIDED, IERROR)
  INTEGER REQUIRED, PROVIDED, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

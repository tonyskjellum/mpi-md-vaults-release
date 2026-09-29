---
title: MPI_IS_THREAD_MAIN
c_name: MPI_Is_thread_main
lis_name: MPI_IS_THREAD_MAIN
chapter: dynamic
aliases: [MPI_IS_THREAD_MAIN, MPI_Is_thread_main]
tags: [mpi/function, mpi/dynamic]
---

# MPI_IS_THREAD_MAIN

**C**
```c
int MPI_Is_thread_main(int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `flag` | OUT | true if calling thread is main thread, false otherwise (logical) |

**Fortran 2008**
```fortran
MPI_Is_thread_main(flag, ierror)
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_IS_THREAD_MAIN(FLAG, IERROR)
  LOGICAL FLAG
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

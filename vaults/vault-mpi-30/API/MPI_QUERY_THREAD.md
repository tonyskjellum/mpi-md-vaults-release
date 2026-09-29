---
title: MPI_QUERY_THREAD
c_name: MPI_Query_thread
lis_name: MPI_QUERY_THREAD
chapter: ei
aliases: [MPI_QUERY_THREAD, MPI_Query_thread]
tags: [mpi/function, mpi/ei]
---

# MPI_QUERY_THREAD

**C**
```c
int MPI_Query_thread(int *provided)
```

| Parameter | Intent | Description |
|---|---|---|
| `provided` | OUT | provided level of thread support (integer) |

**Fortran 2008**
```fortran
MPI_Query_thread(provided, ierror) BIND(C)
  INTEGER, INTENT(OUT) :: provided
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_QUERY_THREAD(PROVIDED, IERROR)
  INTEGER PROVIDED, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

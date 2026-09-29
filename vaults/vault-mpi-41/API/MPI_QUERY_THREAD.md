---
title: MPI_QUERY_THREAD
c_name: MPI_Query_thread
lis_name: MPI_QUERY_THREAD
chapter: dynamic
aliases: [MPI_QUERY_THREAD, MPI_Query_thread]
tags: [mpi/function, mpi/dynamic]
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
MPI_Query_thread(provided, ierror)
  INTEGER, INTENT(OUT) :: provided
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_QUERY_THREAD(PROVIDED, IERROR)
  INTEGER PROVIDED, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

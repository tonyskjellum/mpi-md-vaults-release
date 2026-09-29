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

**C++**
```cpp
int MPI::Query_thread()
```

| Parameter | Intent | Description |
|---|---|---|
| `provided` | OUT | provided level of thread support (integer) |

**Fortran (mpif.h)**
```fortran
MPI_QUERY_THREAD(PROVIDED, IERROR)
  INTEGER PROVIDED, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

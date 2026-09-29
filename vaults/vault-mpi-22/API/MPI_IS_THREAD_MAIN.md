---
title: MPI_IS_THREAD_MAIN
c_name: MPI_Is_thread_main
lis_name: MPI_IS_THREAD_MAIN
chapter: ei
aliases: [MPI_IS_THREAD_MAIN, MPI_Is_thread_main]
tags: [mpi/function, mpi/ei]
---

# MPI_IS_THREAD_MAIN

**C**
```c
int MPI_Is_thread_main(int *flag)
```

**C++**
```cpp
bool MPI::Is_thread_main()
```

| Parameter | Intent | Description |
|---|---|---|
| `flag` | OUT | true if calling thread is main thread, false otherwise (logical) |

**Fortran (mpif.h)**
```fortran
MPI_IS_THREAD_MAIN(FLAG, IERROR)
  LOGICAL FLAG
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

---
title: MPI_FREE_MEM
c_name: MPI_Free_mem
lis_name: MPI_FREE_MEM
chapter: inquiry
aliases: [MPI_FREE_MEM, MPI_Free_mem]
tags: [mpi/function, mpi/inquiry]
---

# MPI_FREE_MEM

**C**
```c
int MPI_Free_mem(void *base)
```

| Parameter | Intent | Description |
|---|---|---|
| `base` | IN | initial address of memory segment allocated by `MPI_ALLOC_MEM` (choice) |

**Fortran 2008**
```fortran
MPI_Free_mem(base, ierror) BIND(C)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: base
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FREE_MEM(BASE, IERROR)
  <type> BASE(*)
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

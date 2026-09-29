---
title: MPI_FREE_MEM
c_name: MPI_Free_mem
lis_name: MPI_FREE_MEM
chapter: misc
aliases: [MPI_FREE_MEM, MPI_Free_mem]
tags: [mpi/function, mpi/misc]
---

# MPI_FREE_MEM

**C**
```c
int MPI_Free_mem(void *base)
```

**C++**
```cpp
void MPI::Free_mem(void *base)
```

| Parameter | Intent | Description |
|---|---|---|
| `base` | IN | initial address of memory segment allocated by `MPI_ALLOC_MEM` (choice) |

**Fortran (mpif.h)**
```fortran
MPI_FREE_MEM(BASE, IERROR)
  <type> BASE(*)
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.

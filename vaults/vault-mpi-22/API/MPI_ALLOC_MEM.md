---
title: MPI_ALLOC_MEM
c_name: MPI_Alloc_mem
lis_name: MPI_ALLOC_MEM
chapter: inquiry
aliases: [MPI_ALLOC_MEM, MPI_Alloc_mem]
tags: [mpi/function, mpi/inquiry]
---

# MPI_ALLOC_MEM

**C**
```c
int MPI_Alloc_mem(MPI_Aint size, MPI_Info info, void *baseptr)
```

**C++**
```cpp
void* MPI::Alloc_mem(MPI::Aint size, const MPI::Info& info)
```

| Parameter | Intent | Description |
|---|---|---|
| `size` | IN | size of memory segment in bytes (non-negative integer) |
| `info` | IN | info argument (handle) |
| `baseptr` | OUT | pointer to beginning of memory segment allocated |

**Fortran (mpif.h)**
```fortran
MPI_ALLOC_MEM(SIZE, INFO, BASEPTR, IERROR)
  INTEGER INFO, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

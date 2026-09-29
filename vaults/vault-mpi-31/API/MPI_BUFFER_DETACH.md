---
title: MPI_BUFFER_DETACH
c_name: MPI_Buffer_detach
lis_name: MPI_BUFFER_DETACH
chapter: pt2pt
aliases: [MPI_BUFFER_DETACH, MPI_Buffer_detach]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_BUFFER_DETACH

**C**
```c
int MPI_Buffer_detach(void* buffer_addr, int* size)
```

| Parameter | Intent | Description |
|---|---|---|
| `buffer_addr` | OUT | initial buffer address (choice) |
| `size` | OUT | buffer size, in bytes (non-negative integer) |

**Fortran 2008**
```fortran
MPI_Buffer_detach(buffer_addr, size, ierror)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  TYPE(C_PTR), INTENT(OUT) :: buffer_addr
  INTEGER, INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_BUFFER_DETACH(BUFFER_ADDR, SIZE, IERROR)
  <type> BUFFER_ADDR(*)
  INTEGER SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

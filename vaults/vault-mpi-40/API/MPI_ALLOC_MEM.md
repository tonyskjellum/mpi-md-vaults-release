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

| Parameter | Intent | Description |
|---|---|---|
| `size` | IN | size of memory segment in bytes (non-negative integer) |
| `info` | IN | info argument (handle) |
| `baseptr` | OUT | pointer to beginning of memory segment allocated |

**Fortran 2008**
```fortran
MPI_Alloc_mem(size, info, baseptr, ierror)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(C_PTR), INTENT(OUT) :: baseptr
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ALLOC_MEM(SIZE, INFO, BASEPTR, IERROR)
  INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR
  INTEGER INFO, IERROR
```

_Interface printed only in the binding annex:_
```fortran
INTERFACE MPI_ALLOC_MEM
SUBROUTINE MPI_ALLOC_MEM(SIZE, INFO, BASEPTR, IERROR)
IMPORT :: MPI_ADDRESS_KIND
INTEGER :: INFO, IERROR
INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE, BASEPTR
END SUBROUTINE
SUBROUTINE MPI_ALLOC_MEM_CPTR(SIZE, INFO, BASEPTR, IERROR)
USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
IMPORT :: MPI_ADDRESS_KIND
INTEGER :: INFO, IERROR
INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE
TYPE(C_PTR) :: BASEPTR
END SUBROUTINE
END INTERFACE
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

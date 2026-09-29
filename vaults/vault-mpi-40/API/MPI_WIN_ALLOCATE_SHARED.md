---
title: MPI_WIN_ALLOCATE_SHARED
c_name: MPI_Win_allocate_shared
lis_name: MPI_WIN_ALLOCATE_SHARED
chapter: one-side
aliases: [MPI_WIN_ALLOCATE_SHARED, MPI_Win_allocate_shared, MPI_Win_allocate_shared_c]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_ALLOCATE_SHARED

**C**
```c
int MPI_Win_allocate_shared(MPI_Aint size, int disp_unit, MPI_Info info, MPI_Comm comm, void *baseptr, MPI_Win *win)
int MPI_Win_allocate_shared_c(MPI_Aint size, MPI_Aint disp_unit, MPI_Info info, MPI_Comm comm, void *baseptr, MPI_Win *win)
```

| Parameter | Intent | Description |
|---|---|---|
| `size` | IN | size of local window in bytes (non-negative integer) |
| `disp_unit` | IN | local unit size for displacements, in bytes (positive integer) |
| `info` | IN | info argument (handle) |
| `comm` | IN | intra-communicator (handle) |
| `baseptr` | OUT | address of local allocated window segment (choice) |
| `win` | OUT | window object returned by the call (handle) |

**Fortran 2008**
```fortran
MPI_Win_allocate_shared(size, disp_unit, info, comm, baseptr, win, ierror)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
  INTEGER, INTENT(IN) :: disp_unit
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(C_PTR), INTENT(OUT) :: baseptr
  TYPE(MPI_Win), INTENT(OUT) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Win_allocate_shared(size, disp_unit, info, comm, baseptr, win, ierror) !(_c)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size, disp_unit
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(C_PTR), INTENT(OUT) :: baseptr
  TYPE(MPI_Win), INTENT(OUT) :: win
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_ALLOCATE_SHARED(SIZE, DISP_UNIT, INFO, COMM, BASEPTR, WIN, IERROR)
  INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR
  INTEGER DISP_UNIT, INFO, COMM, WIN, IERROR
```

_Interface printed only in the binding annex:_
```fortran
INTERFACE MPI_WIN_ALLOCATE_SHARED
SUBROUTINE MPI_WIN_ALLOCATE_SHARED(SIZE, DISP_UNIT, INFO, COMM, &
BASEPTR, WIN, IERROR)
IMPORT :: MPI_ADDRESS_KIND
INTEGER :: DISP_UNIT, INFO, COMM, WIN, IERROR
INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE, BASEPTR
END SUBROUTINE
SUBROUTINE MPI_WIN_ALLOCATE_SHARED_CPTR(SIZE, DISP_UNIT, INFO, COMM, &
BASEPTR, WIN, IERROR)
USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
IMPORT :: MPI_ADDRESS_KIND
INTEGER :: DISP_UNIT, INFO, COMM, WIN, IERROR
INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE
TYPE(C_PTR) :: BASEPTR
END SUBROUTINE
END INTERFACE
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.

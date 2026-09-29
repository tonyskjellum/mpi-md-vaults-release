---
title: MPI_WIN_SHARED_QUERY
c_name: MPI_Win_shared_query
lis_name: MPI_WIN_SHARED_QUERY
chapter: one-side
aliases: [MPI_WIN_SHARED_QUERY, MPI_Win_shared_query, MPI_Win_shared_query_c]
tags: [mpi/function, mpi/one-side]
---

# MPI_WIN_SHARED_QUERY

**C**
```c
int MPI_Win_shared_query(MPI_Win win, int rank, MPI_Aint *size, int *disp_unit, void *baseptr)
int MPI_Win_shared_query_c(MPI_Win win, int rank, MPI_Aint *size, MPI_Aint *disp_unit, void *baseptr)
```

| Parameter | Intent | Description |
|---|---|---|
| `win` | IN | shared memory window object (handle) |
| `rank` | IN | rank in the group of window win or `MPI_PROC_NULL` (non-negative integer) |
| `size` | OUT | size of the window segment (non-negative integer) |
| `disp_unit` | OUT | local unit size for displacements, in bytes (positive integer) |
| `baseptr` | OUT | address for load/store access to window segment (choice) |

**Fortran 2008**
```fortran
MPI_Win_shared_query(win, rank, size, disp_unit, baseptr, ierror)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, INTENT(IN) :: rank
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size
  INTEGER, INTENT(OUT) :: disp_unit
  TYPE(C_PTR), INTENT(OUT) :: baseptr
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Win_shared_query(win, rank, size, disp_unit, baseptr, ierror) !(_c)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  TYPE(MPI_Win), INTENT(IN) :: win
  INTEGER, INTENT(IN) :: rank
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size, disp_unit
  TYPE(C_PTR), INTENT(OUT) :: baseptr
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_WIN_SHARED_QUERY(WIN, RANK, SIZE, DISP_UNIT, BASEPTR, IERROR)
  INTEGER WIN, RANK, DISP_UNIT, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) SIZE, BASEPTR
```

_Interface printed only in the binding annex:_
```fortran
INTERFACE MPI_WIN_SHARED_QUERY
SUBROUTINE MPI_WIN_SHARED_QUERY(WIN, RANK, SIZE, DISP_UNIT, &
BASEPTR, IERROR)
IMPORT :: MPI_ADDRESS_KIND
INTEGER :: WIN, RANK, DISP_UNIT, IERROR
INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE, BASEPTR
END SUBROUTINE
SUBROUTINE MPI_WIN_SHARED_QUERY_CPTR(WIN, RANK, SIZE, DISP_UNIT, &
BASEPTR, IERROR)
USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
IMPORT :: MPI_ADDRESS_KIND
INTEGER :: WIN, RANK, DISP_UNIT, IERROR
INTEGER(KIND=MPI_ADDRESS_KIND) :: SIZE
TYPE(C_PTR) :: BASEPTR
END SUBROUTINE
END INTERFACE
```


> [!info] Semantics
> See the chapter note [[one-side]] for the normative text.

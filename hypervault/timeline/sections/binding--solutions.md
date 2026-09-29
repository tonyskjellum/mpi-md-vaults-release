---
title: "Solutions"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Solutions

Chapter **binding** · in [[versions/v30/sections/binding#Solutions|MPI-3.0]], [[versions/v31/sections/binding#Solutions|MPI-3.1]], [[versions/v40/sections/binding#Solutions|MPI-4.0]], [[versions/v41/sections/binding#Solutions|MPI-4.1]], [[versions/v50/sections/binding#Solutions|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

Each of these methods solves the problems of code movement and register optimization, but may incur various degrees of performance impact, and may not be usable in every application context. These methods may not be guaranteed by the Fortran standard, but they must be guaranteed by a MPI-3.0 (and later) compliant MPI library and associated compiler suite according to the requirements listed in ~~Section [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page~~ [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] . The performance impact of using [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] is expected to be low, that of using module variables or the `ASYNCHRONOUS` attribute is expected to be low to medium, and that of using the `VOLATILE` attribute is expected to be high or very high. Note that there is one attribute that cannot be used for this purpose: the Fortran `TARGET` attribute does not solve code movement problems in MPI applications.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

USE mpi_f08 REAL, ASYNCHRONOUS :: b(0:101) ! elements 0 and 101 are halo cells REAL :: bnew(0:101) ! elements 1 and 100 are newly computed TYPE(MPI_Request) :: req(4) INTEGER :: left, right, i CALL MPI_Cart_shift(...,left,right,...) CALL MPI_Irecv(b( 0), ..., left, ..., req(1), ...) CALL MPI_Irecv(b(101), ..., right, ..., req(2), ...) CALL MPI_Isend(b( 1), ..., left, ..., req(3), ...) CALL MPI_Isend(b(100), ..., right, ..., req(4), ...) #ifdef WITHOUT_OVERLAPPING_COMMUNICATION_AND_COMPUTATION ! Case (a) CALL ~~MPI_Waitall(4,req,...)~~ ==MPI_Waitall(4, req, ...)== DO i=1,100 ! compute all new local data bnew(i) = function(b(i-1), b(i), b(i+1)) END DO #endif #ifdef WITH_OVERLAPPING_COMMUNICATION_AND_COMPUTATION ! Case (b) DO i=2,99 ! compute only elements for which halo data is not needed bnew(i) = function(b(i-1), b(i), b(i+1)) END DO CALL ~~MPI_Waitall(4,req,...)~~ ==MPI_Waitall(4, req, ...)== i=1 ! compute leftmost element bnew(i) = function(b(i-1), b(i), b(i+1)) i=100 ! compute rightmost element bnew(i) = function(b(i-1), b(i), b(i+1)) #endif

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~    USE mpi_f08     REAL, ASYNCHRONOUS :: b(0:101) ! elements 0 and 101 are halo cells     REAL :: bnew(0:101)            ! elements 1 and 100 are newly computed     TYPE(MPI_Request) :: req(4)     INTEGER :: left, right, i     CALL MPI_Cart_shift(...,left,right,...)     CALL MPI_Irecv(b(  0), ..., left,  ..., req(1), ...)     CALL MPI_Irecv(b(101), ..., right, ..., req(2), ...)     CALL MPI_Isend(b(  1), ..., left,  ..., req(3), ...)     CALL MPI_Isend(b(100), ..., right, ..., req(4), ...)     #ifdef WITHOUT_OVERLAPPING_COMMUNICATION_AND_COMPUTATION     ! Case (a)       CALL MPI_Waitall(4, req, ...)       DO i=1,100 ! compute all new local data         bnew(i) = function(b(i-1), b(i), b(i+1))       END DO     #endif     #ifdef WITH_OVERLAPPING_COMMUNICATION_AND_COMPUTATION     ! Case (b)       DO i=2,99  ! compute  only elements for which halo data is not needed         bnew(i) = function(b(i-1), b(i), b(i+1))       END DO       CALL MPI_Waitall(4, req, ...)       i=1 ! compute leftmost element         bnew(i) = function(b(i-1), b(i), b(i+1))       i=100 ! compute rightmost element         bnew(i) = function(b(i-1), b(i), b(i+1))     #endif~~

==(code block added)==
``` [MPI08dirs]Fortran
USE mpi_f08
REAL, ASYNCHRONOUS :: b(0:101) ! elements 0 and 101 are halo cells
REAL :: bnew(0:101)            ! elements 1 and 100 are newly computed
TYPE(MPI_Request) :: req(4)
INTEGER :: left, right, i
CALL MPI_Cart_shift(...,left,right,...)
CALL MPI_Irecv(b(  0), ..., left,  ..., req(1), ...)
CALL MPI_Irecv(b(101), ..., right, ..., req(2), ...)
CALL MPI_Isend(b(  1), ..., left,  ..., req(3), ...)
CALL MPI_Isend(b(100), ..., right, ..., req(4), ...)

#ifdef WITHOUT_OVERLAPPING_COMMUNICATION_AND_COMPUTATION
! Case (a)
  CALL MPI_Waitall(4, req, ...)
  DO i=1,100 ! compute all new local data
    bnew(i) = function(b(i-1), b(i), b(i+1))
  END DO
#endif

#ifdef WITH_OVERLAPPING_COMMUNICATION_AND_COMPUTATION
! Case (b)
  DO i=2,99  ! compute  only elements for which halo data is not needed
    bnew(i) = function(b(i-1), b(i), b(i+1))
  END DO
  CALL MPI_Waitall(4, req, ...)
  i=1 ! compute leftmost element
    bnew(i) = function(b(i-1), b(i), b(i+1))
  i=100 ! compute rightmost element
    bnew(i) = function(b(i-1), b(i), b(i+1))
#endif
```

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Solutions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Solutions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Solutions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Solutions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Solutions]]

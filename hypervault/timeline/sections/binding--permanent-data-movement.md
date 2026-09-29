---
title: "Permanent Data Movement"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Permanent Data Movement

Chapter **binding** · in [[versions/v30/sections/binding#Permanent Data Movement|MPI-3.0]], [[versions/v31/sections/binding#Permanent Data Movement|MPI-3.1]], [[versions/v40/sections/binding#Permanent Data Movement|MPI-4.0]], [[versions/v41/sections/binding#Permanent Data Movement|MPI-4.1]], [[versions/v50/sections/binding#Permanent Data Movement|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

- ~~Nonblocking~~ ==All nonblocking== MPI operations ~~(communication, one-sided, I/O)~~ if the internally used pointers to the buffers are not updated by the Fortran runtime, or if within an MPI process, the data movement is executed in parallel with the MPI operation.

This problem can be also solved by using the `ASYNCHRONOUS` attribute for such buffers. This MPI standard requires that the problems with permanent data movement do not occur by imposing suitable restrictions on the MPI library together with the compiler used; see ~~Section [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page~~ [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

USE mpi_f08 REAL :: b(0:101) ! elements 0 and 101 are halo cells REAL :: bnew(0:101) ! elements 1 and 100 are newly computed INTEGER :: i CALL separated_sections(b(0), b(1:100), b(101), bnew(0:101)) i=1 ! compute leftmost element bnew(i) = function(b(i-1), b(i), b(i+1)) i=100 ! compute rightmost element bnew(i) = function(b(i-1), b(i), b(i+1)) END SUBROUTINE separated_sections(b_lefthalo, b_inner, b_righthalo, bnew) USE mpi_f08 REAL, ASYNCHRONOUS :: b_lefthalo(0:0), b_inner(1:100), b_righthalo(101:101) REAL :: bnew(0:101) ! elements 1 and 100 are newly computed TYPE(MPI_Request) :: req(4) INTEGER :: left, right, i CALL ~~MPI_Cart_shift(...,left,right,...)~~ ==MPI_Cart_shift(...,left, right,...)== CALL MPI_Irecv(b_lefthalo ( 0), ..., left, ..., req(1), ...) CALL MPI_Irecv(b_righthalo(101), ..., right, ..., req(2), ...) ! b_lefthalo and b_righthalo is written asynchronously. ! There is no other concurrent access to b_lefthalo and b_righthalo. CALL MPI_Isend(b_inner( 1), ..., left, ..., req(3), ...) CALL MPI_Isend(b_inner(100), ..., right, ..., req(4), ...) DO i=2,99 ! compute only elements for which halo data is not needed bnew(i) = function(b_inner(i-1), b_inner(i), b_inner(i+1)) ! b_inner is read and sent at the same time. ! This is allowed based on the rules for ASYNCHRONOUS. END DO CALL ~~MPI_Waitall(4,req,...)~~ ==MPI_Waitall(4, req,...)== END SUBROUTINE

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~    USE mpi_f08     REAL :: b(0:101)     ! elements 0 and 101 are halo cells     REAL :: bnew(0:101)  ! elements 1 and 100 are newly computed     INTEGER :: i     CALL separated_sections(b(0), b(1:100), b(101), bnew(0:101))     i=1 ! compute leftmost element       bnew(i) = function(b(i-1), b(i), b(i+1))     i=100 ! compute rightmost element       bnew(i) = function(b(i-1), b(i), b(i+1))     END     SUBROUTINE separated_sections(b_lefthalo, b_inner, b_righthalo, bnew)     USE mpi_f08     REAL, ASYNCHRONOUS :: b_lefthalo(0:0), b_inner(1:100), b_righthalo(101:101)     REAL :: bnew(0:101)  ! elements 1 and 100 are newly computed     TYPE(MPI_Request) :: req(4)     INTEGER :: left, right, i     CALL MPI_Cart_shift(...,left, right,...)     CALL MPI_Irecv(b_lefthalo (  0), ..., left,  ..., req(1), ...)     CALL MPI_Irecv(b_righthalo(101), ..., right, ..., req(2), ...)     ! b_lefthalo and b_righthalo is written asynchronously.     ! There is no other concurrent access to b_lefthalo and b_righthalo.     CALL MPI_Isend(b_inner(  1),     ..., left,  ..., req(3), ...)     CALL MPI_Isend(b_inner(100),     ..., right, ..., req(4), ...)     DO i=2,99  ! compute  only elements for which halo data is not needed       bnew(i) = function(b_inner(i-1), b_inner(i), b_inner(i+1))       ! b_inner is read and sent at the same time.       ! This is allowed based on the rules for ASYNCHRONOUS.     END DO     CALL MPI_Waitall(4, req,...)     END SUBROUTINE~~

==    [language={[MPI08dirs]Fortran},basicstyle=]     USE mpi_f08     REAL :: b(0:101)     ! elements 0 and 101 are halo cells     REAL :: bnew(0:101)  ! elements 1 and 100 are newly computed     INTEGER :: i     CALL separated_sections(b(0), b(1:100), b(101), bnew(0:101))     i=1 ! compute leftmost element       bnew(i) = function(b(i-1), b(i), b(i+1))     i=100 ! compute rightmost element       bnew(i) = function(b(i-1), b(i), b(i+1))     END==

==    SUBROUTINE separated_sections(b_lefthalo, b_inner, b_righthalo, bnew)     USE mpi_f08     REAL, ASYNCHRONOUS :: b_lefthalo(0:0), b_inner(1:100), b_righthalo(101:101)     REAL :: bnew(0:101)  ! elements 1 and 100 are newly computed     TYPE(MPI_Request) :: req(4)     INTEGER :: left, right, i     CALL MPI_Cart_shift(...,left, right,...)     CALL MPI_Irecv(b_lefthalo (  0), ..., left,  ..., req(1), ...)     CALL MPI_Irecv(b_righthalo(101), ..., right, ..., req(2), ...)     ! b_lefthalo and b_righthalo is written asynchronously.     ! There is no other concurrent access to b_lefthalo and b_righthalo.     CALL MPI_Isend(b_inner(  1),     ..., left,  ..., req(3), ...)     CALL MPI_Isend(b_inner(100),     ..., right, ..., req(4), ...)==

==    DO i=2,99  ! compute  only elements for which halo data is not needed       bnew(i) = function(b_inner(i-1), b_inner(i), b_inner(i+1))       ! b_inner is read and sent at the same time.       ! This is allowed based on the rules for ASYNCHRONOUS.     END DO     CALL MPI_Waitall(4, req,...)     END SUBROUTINE==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Permanent Data Movement]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Permanent Data Movement]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Permanent Data Movement]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Permanent Data Movement]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Permanent Data Movement]]

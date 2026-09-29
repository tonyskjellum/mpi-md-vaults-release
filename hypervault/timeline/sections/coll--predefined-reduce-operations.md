---
title: "Predefined reduce operations"
chapter: coll
present_in: ["MPI-1.3"]
tags: [mpi/section, mpi/coll]
---

# Predefined reduce operations

Chapter **coll** · in [[versions/v13/sections/coll#Predefined reduce operations|MPI-1.3]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (5 changed paragraphs)

~~The following predefined operations are supplied for [[versions/v21/API/MPI_REDUCE|MPI_REDUCE]] and related functions [[versions/v21/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v21/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , and [[versions/v21/API/MPI_SCAN|MPI_SCAN]] . These operations are invoked by placing the following in `op`.~~

==The following predefined operations are supplied for [[versions/v21/API/MPI_REDUCE|MPI_REDUCE]] and related functions [[versions/v21/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v21/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] ,==

==[[versions/v21/API/MPI_SCAN|MPI_SCAN]] , and [[versions/v21/API/MPI_EXSCAN|MPI_EXSCAN]] .==

==These operations are invoked by placing the following in `op`.==

logical ~~xor~~ ==exclusive or (xor)==

bit-wise ~~xor~~ ==exclusive or (xor)==

~~The two operations MPI_MINLOC and MPI_MAXLOC are discussed separately in Sec. [[coll-minloc-maxloc]] . For the other predefined operations, we enumerate below the allowed combinations of `op` and `datatype` arguments. First, define groups of MPI basic datatypes in the following way.~~

~~`MPI_INT, MPI_LONG, MPI_SHORT, MPI_UNSIGNED_SHORT, MPI_UNSIGNED, MPI_UNSIGNED_LONG`~~

==The two operations MPI_MINLOC and MPI_MAXLOC are discussed separately in Section [[coll-minloc-maxloc]] . For the other predefined operations, we enumerate below the allowed combinations of `op` and `datatype` arguments. First, define groups of MPI basic datatypes in the following way.==

==`MPI_INT`, `MPI_LONG`, `MPI_SHORT`,==

==`MPI_UNSIGNED_SHORT`, `MPI_UNSIGNED`,==

==`MPI_UNSIGNED_LONG`,==

==`MPI_LONG_LONG_INT`,==

==`MPI_LONG_LONG` (as synonym),==

==`MPI_UNSIGNED_LONG_LONG`,==

==`MPI_SIGNED_CHAR`, `MPI_UNSIGNED_CHAR`==

~~`MPI_FLOAT, MPI_DOUBLE, MPI_REAL, MPI_DOUBLE_PRECISION, MPI_LONG_DOUBLE`~~

==`MPI_FLOAT`, `MPI_DOUBLE`, `MPI_REAL`,==

==`MPI_DOUBLE_PRECISION`==

==`MPI_LONG_DOUBLE`==

~~C integer, Fortran integer, Floating point~~

~~C integer, Fortran integer, Floating point, Complex~~

~~C integer, Logical~~

~~C integer, Fortran integer, Byte~~

==MPI_MINC integer, Fortran integer, Floating point==

==MPI_PRODC integer, Fortran integer, Floating point, Complex==

==MPI_LORMPI_LXORC integer, Logical==

==MPI_BORMPI_BXORC integer, Fortran integer, Byte==

==The following examples use intracommunicators.==

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

The two operations ~~MPI_MINLOC~~ ==`MPI_MINLOC`== and ~~MPI_MAXLOC~~ ==`MPI_MAXLOC`== are discussed separately in Section [[coll-minloc-maxloc]] . For the other predefined operations, we enumerate below the allowed combinations of `op` and `datatype` arguments. First, define groups of MPI basic datatypes in the following way.

~~`MPI_SIGNED_CHAR`, `MPI_UNSIGNED_CHAR`~~

~~`MPI_INTEGER`~~

==`MPI_SIGNED_CHAR`,==

==`MPI_UNSIGNED_CHAR`,==

==`MPI_INT8_T`, `MPI_INT16_T`,==

==`MPI_INT32_T`, `MPI_INT64_T`,==

==`MPI_UINT8_T`, `MPI_UINT16_T`,==

==`MPI_UINT32_T`, `MPI_UINT64_T`==

==`MPI_INTEGER`, `MPI_AINT`, `MPI_OFFSET`,==

==and handles returned from==

==`MPI_TYPE_CREATE_F90_INTEGER`,==

==and if available: `MPI_INTEGER1`,==

==`MPI_INTEGER2`, `MPI_INTEGER4`,==

==`MPI_INTEGER8`, `MPI_INTEGER16`==

~~`MPI_LOGICAL`~~

~~`MPI_COMPLEX`~~

==and handles returned from==

==`MPI_TYPE_CREATE_F90_REAL`,==

==and if available: `MPI_REAL2`,==

==`MPI_REAL4`, `MPI_REAL8`, `MPI_REAL16`==

==`MPI_LOGICAL`, `MPI_C_BOOL`==

==`MPI_COMPLEX`,==

==`MPI_C_FLOAT_COMPLEX`,==

==`MPI_C_DOUBLE_COMPLEX`,==

==`MPI_C_LONG_DOUBLE_COMPLEX`,==

==and handles returned from==

==`MPI_TYPE_CREATE_F90_COMPLEX`,==

==and if available: `MPI_DOUBLE_COMPLEX`,==

==`MPI_COMPLEX4`, `MPI_COMPLEX8`,==

==`MPI_COMPLEX16`, `MPI_COMPLEX32`==

~~MPI_MINC~~ ==MPI_MIN`C== integer, Fortran integer, Floating ~~point~~ ==point`==

~~MPI_PRODC~~ ==MPI_PROD`C== integer, Fortran integer, Floating point, ~~Complex~~ ==Complex`==

~~MPI_LORMPI_LXORC~~ ==MPI_LORMPI_LXOR`C== integer, ~~Logical~~ ==Logical`==

~~MPI_BORMPI_BXORC~~ ==MPI_BORMPI_BXOR`C== integer, Fortran integer, ~~Byte~~ ==Byte`==

### MPI-2.2 → MPI-3.0  (9 changed paragraphs)

~~The following predefined operations are supplied for [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] and related functions [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] ,~~

~~[[versions/v30/API/MPI_SCAN|MPI_SCAN]] , and [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]] .~~

~~These operations are invoked by placing the following in `op`.~~

==The following predefined operations are supplied for [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] and related functions [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v30/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] ,==

==[[versions/v30/API/MPI_SCAN|MPI_SCAN]] , [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]] , all nonblocking variants of those (see Section [[versions/v30/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[versions/v30/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] . These operations are invoked by placing the following in `op`.==

`MPI_INTEGER`, ~~`MPI_AINT`, `MPI_OFFSET`,~~

~~`MPI_LOGICAL`, `MPI_C_BOOL`~~

~~`MPI_COMPLEX`,~~

~~`MPI_C_FLOAT_COMPLEX`,~~

==`MPI_LOGICAL`,`MPI_C_BOOL`,==

==`MPI_CXX_BOOL`==

==`MPI_COMPLEX`, `MPI_C_COMPLEX`,==

==`MPI_C_FLOAT_COMPLEX` (as synonym),==

==`MPI_CXX_FLOAT_COMPLEX`,==

==`MPI_CXX_DOUBLE_COMPLEX`,==

==`MPI_CXX_LONG_DOUBLE_COMPLEX`,==

~~Now, the valid datatypes for each option is specified below.~~

==`MPI_AINT`, `MPI_OFFSET`, `MPI_COUNT`==

==Now, the valid datatypes for each operation are specified below.==

~~MPI_MIN`C integer, Fortran integer, Floating point`~~

~~MPI_PROD`C integer, Fortran integer, Floating point, Complex`~~

==MPI_MIN`C integer, Fortran integer, Floating point,`==

==Multi-language types==

==MPI_PROD`C integer, Fortran integer, Floating point, Complex,`==

==Multi-language types==

~~MPI_BORMPI_BXOR`C integer, Fortran integer, Byte`~~

==MPI_BORMPI_BXOR`C integer, Fortran integer, Byte, Multi-language types`==

==These operations together with all listed datatypes are valid in all supported programming languages, see also Reduce Operations on page [[versions/v30/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] in Section [[versions/v30/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] .==

! global sum CALL MPI_REDUCE(sum, c, 1, MPI_REAL, MPI_SUM, 0, comm, ierr) RETURN ==END==

! return result at node zero (and garbage at the other nodes) RETURN ==END==

### MPI-3.0 → MPI-3.1  (7 changed paragraphs)

~~The following predefined operations are supplied for [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] and related functions [[versions/v31/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v31/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v31/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] ,~~

~~[[versions/v31/API/MPI_SCAN|MPI_SCAN]] , [[versions/v31/API/MPI_EXSCAN|MPI_EXSCAN]] , all nonblocking variants of those (see Section [[versions/v31/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[versions/v31/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] . These operations are invoked by placing the following in `op`.~~

==The following predefined operations are supplied for [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] and related functions [[versions/v31/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v31/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v31/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v31/API/MPI_SCAN|MPI_SCAN]] , [[versions/v31/API/MPI_EXSCAN|MPI_EXSCAN]] , all nonblocking variants of those (see Section [[versions/v31/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[versions/v31/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] . These operations are invoked by placing the following in `op`.==

~~`MPI_TYPE_CREATE_F90_INTEGER`,~~ ==[[versions/v31/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] ,==

~~`MPI_TYPE_CREATE_F90_REAL`,~~ ==[[versions/v31/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] ,==

~~`MPI_TYPE_CREATE_F90_COMPLEX`,~~ ==[[versions/v31/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] ,==

These operations together with all listed datatypes are valid in all supported programming languages, see also Reduce Operations ~~on page [[versions/v31/sections/binding#MPI Opaque Objects|MPI Opaque Objects]]~~ in ~~Section~~ [[versions/v31/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] .

A routine that computes the dot product of two vectors that are distributed across a group of processes and returns the answer at node zero.

A routine that computes the product of a vector and an array that are distributed across a group of processes and returns the answer at node zero.

### MPI-3.1 → MPI-4.0  (10 changed paragraphs)

`MPI_UINT32_T`, ==and== `MPI_UINT64_T`

~~`MPI_INTEGER`,~~ ==`MPI_INTEGER`==

[[versions/v40/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] ~~,~~

~~and~~ ==and,== if ~~available:~~ ==available,== `MPI_INTEGER1`,

`MPI_INTEGER8`, ==and== `MPI_INTEGER16`

~~`MPI_DOUBLE_PRECISION`~~ ==`MPI_DOUBLE_PRECISION`,==

~~`MPI_LONG_DOUBLE`~~ ==`MPI_LONG_DOUBLE`,==

[[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] ~~,~~

~~and~~ ==and,== if ~~available:~~ ==available,== `MPI_REAL2`,

`MPI_REAL4`, `MPI_REAL8`, ==and== `MPI_REAL16`

~~`MPI_LOGICAL`,`MPI_C_BOOL`,~~ ==`MPI_LOGICAL`, `MPI_C_BOOL`,==

==and== `MPI_CXX_BOOL`

[[versions/v40/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] ~~,~~

~~and~~ ==and,== if ~~available:~~ ==available,== `MPI_DOUBLE_COMPLEX`,

`MPI_COMPLEX16`, ==and== `MPI_COMPLEX32`

`MPI_AINT`, `MPI_OFFSET`, ==and== `MPI_COUNT`

These operations together with all listed datatypes are valid in all supported programming languages, see also Reduce Operations ==on page [[versions/v40/sections/binding#MPI Opaque Objects|MPI Opaque Objects]]== in ==Section== [[versions/v40/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] .

The following examples use ~~intracommunicators.~~ ==intra-communicators.==

SUBROUTINE PAR_BLAS2(m, n, a, b, c, comm) REAL a(m), b(m,n) ! local slice of array REAL c(n) ! result REAL sum(n) INTEGER ==m,== n, comm, i, j, ierr

! local sum DO ~~j= 1, n~~ ==j=1,n== sum(j) = 0.0 DO ~~i = 1, m~~ ==i=1,m== sum(j) = sum(j) + a(i)*b(i,j) END DO END DO

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

~~MPI_MIN`C~~ ==MPI_MINC== integer, Fortran integer, Floating ~~point,`~~ ==point,==

~~MPI_PROD`C~~ ==MPI_PRODC== integer, Fortran integer, Floating point, ~~Complex,`~~ ==Complex,==

~~MPI_LORMPI_LXOR`C~~ ==MPI_LORMPI_LXORC== integer, ~~Logical`~~ ==Logical==

~~MPI_BORMPI_BXOR`C~~ ==MPI_BORMPI_BXORC== integer, Fortran integer, Byte, Multi-language ~~types`~~ ==types==

These operations together with all listed datatypes are valid in all supported programming languages, see also Reduce Operations ~~on page [[versions/v41/sections/binding#MPI Opaque Objects|MPI Opaque Objects]]~~ in Section [[versions/v41/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] .

~~A routine that computes the dot product of two vectors that are distributed across a group of processes and returns the answer at node zero.~~

~~    SUBROUTINE PAR_BLAS1(m, a, b, c, comm)     REAL a(m), b(m)       ! local slice of array     REAL c                ! result (at node zero)     REAL sum     INTEGER m, comm, i, ierr~~

~~    ! local sum     sum = 0.0     DO i = 1, m        sum = sum + a(i)*b(i)     END DO~~

~~    ! global sum     CALL MPI_REDUCE(sum, c, 1, MPI_REAL, MPI_SUM, 0, comm, ierr)     RETURN     END~~

~~A routine that computes the product of a vector and an array that are distributed across a group of processes and returns the answer at node zero.~~

~~    SUBROUTINE PAR_BLAS2(m, n, a, b, c, comm)     REAL a(m), b(m,n)    ! local slice of array     REAL c(n)            ! result     REAL sum(n)     INTEGER m, n, comm, i, j, ierr~~

~~    ! local sum     DO j=1,n        sum(j) = 0.0        DO i=1,m           sum(j) = sum(j) + a(i)*b(i,j)        END DO     END DO~~

~~    ! global sum     CALL MPI_REDUCE(sum, c, n, MPI_REAL, MPI_SUM, 0, comm, ierr)~~

~~    ! return result at node zero (and garbage at the other nodes)     RETURN     END~~

==A routine that computes the dot product of two vectors that are distributed across a group of MPI processes and returns the answer at node zero.==

==(code block added)==
``` [MPI]Fortran
SUBROUTINE PAR_BLAS1(m, a, b, c, comm)
USE MPI
REAL a(m), b(m)       ! local slice of array
REAL c                ! result (at node zero)
REAL sum
INTEGER m, comm, i, ierr

! local sum
sum = 0.0
DO i = 1, m
   sum = sum + a(i)*b(i)
END DO

! global sum
CALL MPI_REDUCE(sum, c, 1, MPI_REAL, MPI_SUM, 0, comm, ierr)
RETURN
END
```

==A routine that computes the product of a vector and an array that are distributed across a group of MPI processes and returns the answer at node zero.==

==(code block added)==
``` [MPI]Fortran
SUBROUTINE PAR_BLAS2(m, n, a, b, c, comm)
USE MPI
REAL a(m), b(m,n)    ! local slice of array
REAL c(n)            ! result
REAL sum(n)
INTEGER m, n, comm, i, j, ierr

! local sum
DO j=1,n
   sum(j) = 0.0
   DO i=1,m
      sum(j) = sum(j) + a(i)*b(i,j)
   END DO
END DO

! global sum
CALL MPI_REDUCE(sum, c, n, MPI_REAL, MPI_SUM, 0, comm, ierr)

! return result at node zero (and garbage at the other nodes)
RETURN
END
```

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

~~and `MPI_CXX_BOOL`~~

==`MPI_CXX_BOOL`,==

==and, if available, `MPI_LOGICAL1`,==

==`MPI_LOGICAL2`, `MPI_LOGICAL4`,==

==`MPI_LOGICAL8`, and `MPI_LOGICAL16`,==

MPI_BORMPI_BXORC integer, Fortran integer, Byte, ~~Multi-language~~ ==Multi-/language== types

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Predefined reduce operations]]

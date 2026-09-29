---
title: "All-Reduce"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# All-Reduce

Chapter **coll** · in [[versions/v13/sections/coll#All-Reduce|MPI-1.3]], [[versions/v21/sections/coll#All-Reduce|MPI-2.1]], [[versions/v22/sections/coll#All-Reduce|MPI-2.2]], [[versions/v30/sections/coll#All-Reduce|MPI-3.0]], [[versions/v31/sections/coll#All-Reduce|MPI-3.1]], [[versions/v40/sections/coll#All-Reduce|MPI-4.0]], [[versions/v41/sections/coll#All-Reduce|MPI-4.1]], [[versions/v50/sections/coll#All-Reduce|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~MPI includes variants of each of the reduce operations where the result is returned to all processes in the group. MPI requires that all processes participating in these operations receive identical results.~~

==MPI includes==

==a variant==

==of the reduce operations where the result is returned to all processes in==

==a==

==group. MPI requires that all processes==

==from the same group==

==participating in these operations receive identical results.==

~~Same as `MPI_REDUCE` except that the result appears in the receive buffer of all the group members.~~

==If `comm` is an intracommunicator, `MPI_ALLREDUCE` behaves the==

==same as `MPI_REDUCE` except that the result appears in the receive buffer of all the group members.==

==The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf`==

==at all processes.==

==In this case,==

==the input data is taken at each process from the receive buffer, where it will be replaced by the output data.==

==If `comm` is an intercommunicator, then the result of the reduction of the data provided by processes in group A is stored at each process in group B, and vice versa.==

==Both groups should provide `count` and `datatype` arguments that specify the same type signature.==

==The following example uses an intracommunicator.==

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~a variant~~

~~of the reduce operations where the result is returned to all processes in~~

~~a~~

~~group. MPI requires that all processes~~

~~from the same group~~

~~participating in these operations receive identical results.~~

==a variant of the reduce operations where the result is returned to all processes in==

==a group. MPI requires that all processes from the same group participating in these operations receive identical results.==

~~If `comm` is an intracommunicator, `MPI_ALLREDUCE` behaves the~~

~~same as `MPI_REDUCE` except that the result appears in the receive buffer of all the group members.~~

==If `comm` is an intracommunicator, `MPI_ALLREDUCE` behaves the same as `MPI_REDUCE` except that the result appears in the receive buffer of all the group members.==

~~In this case,~~

~~the input data is taken at each process from the receive buffer, where it will be replaced by the output data.~~

==In this case, the input data is taken at each process from the receive buffer, where it will be replaced by the output data.==

! return result at all nodes RETURN ==END==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~MPI includes~~

~~a variant of the reduce operations where the result is returned to all processes in~~

~~a group. MPI requires that all processes from the same group participating in these operations receive identical results.~~

==MPI includes a variant of the reduce operations where the result is returned to all processes in a group. MPI requires that all processes from the same group participating in these operations receive identical results.==

If `comm` is an intracommunicator, ~~`MPI_ALLREDUCE`~~ ==[[versions/v31/API/MPI_ALLREDUCE|MPI_ALLREDUCE]]== behaves the same as ~~`MPI_REDUCE`~~ ==[[versions/v31/API/MPI_REDUCE|MPI_REDUCE]]== except that the result appears in the receive buffer of all the group members.

~~The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf`~~

~~at all processes.~~

~~In this case, the input data is taken at each process from the receive buffer, where it will be replaced by the output data.~~

~~If `comm` is an intercommunicator, then the result of the reduction of the data provided by processes in group A is stored at each process in group B, and vice versa.~~

~~Both groups should provide `count` and `datatype` arguments that specify the same type signature.~~

==The “in place” option for intracommunicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. In this case, the input data is taken at each process from the receive buffer, where it will be replaced by the output data.==

==If `comm` is an intercommunicator, then the result of the reduction of the data provided by processes in group A is stored at each process in group B, and vice versa. Both groups should provide `count` and `datatype` arguments that specify the same type signature.==

A routine that computes the product of a vector and an array that are distributed across a group of processes and returns the answer at all nodes (see also Example [[coll-exblas2]] ).

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== [[versions/v40/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] behaves the same as [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] except that the result appears in the receive buffer of all the group members.

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. In this case, the input data is taken at each process from the receive buffer, where it will be replaced by the output data.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the result of the reduction of the data provided by processes in group A is stored at each process in group B, and vice versa. Both groups should provide `count` and `datatype` arguments that specify the same type signature.

The following example uses an ~~intracommunicator.~~ ==intra-communicator.==

! local sum DO ~~j= 1, n~~ ==j=1,n== sum(j) = 0.0 DO ~~i = 1, m~~ ==i=1,m== sum(j) = sum(j) + a(i)*b(i,j) END DO END DO

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

MPI includes a variant of the reduce operations where the result is returned to all ==MPI== processes in a group. MPI requires that all ==MPI== processes from the same group participating in these operations receive identical results.

The “in place” option for intra-communicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. ==value `MPI_IN_PLACE` to the argument `sendbuf` at all MPI processes.== In this case, the input data is taken at each ==MPI== process from the receive buffer, where it will be replaced by the output data.

If `comm` is an inter-communicator, then the result of the reduction of the data provided by ==MPI== processes in group A is stored at each ==MPI== process in group B, and vice versa. Both groups should provide `count` and `datatype` arguments that specify the same type signature.

~~A routine that computes the product of a vector and an array that are distributed across a group of processes and returns the answer at all nodes (see also Example [[coll-exblas2]] ).~~

~~    SUBROUTINE PAR_BLAS2(m, n, a, b, c, comm)     REAL a(m), b(m,n)    ! local slice of array     REAL c(n)            ! result     REAL sum(n)     INTEGER n, comm, i, j, ierr~~

~~    ! local sum     DO j=1,n        sum(j) = 0.0        DO i=1,m           sum(j) = sum(j) + a(i)*b(i,j)        END DO     END DO~~

~~    ! global sum     CALL MPI_ALLREDUCE(sum, c, n, MPI_REAL, MPI_SUM, comm, ierr)~~

~~    ! return result at all nodes     RETURN     END~~

==A routine that computes the product of a vector and an array that are distributed across a group of MPI processes and returns the answer at all nodes (see also Example [[coll-exblas2]] ).==

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
CALL MPI_ALLREDUCE(sum, c, n, MPI_REAL, MPI_SUM, comm, ierr)

! return result at all nodes
RETURN
END
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The “in place” option for intra-communicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all ~~processes. value `MPI_IN_PLACE` to the argument `sendbuf` at all MPI~~ processes. In this case, the input data is taken at each MPI process from the receive buffer, where it will be replaced by the output data.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#All-Reduce]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#All-Reduce]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#All-Reduce]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#All-Reduce]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#All-Reduce]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#All-Reduce]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#All-Reduce]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#All-Reduce]]

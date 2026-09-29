---
title: MPI_REDUCE_SCATTER_BLOCK
c_name: MPI_Reduce_scatter_block
lis_name: MPI_REDUCE_SCATTER_BLOCK
chapter: coll
aliases: [MPI_REDUCE_SCATTER_BLOCK, MPI_Reduce_scatter_block, MPI_Reduce_scatter_block_c]
tags: [mpi/function, mpi/coll]
---

# MPI_REDUCE_SCATTER_BLOCK

**C**
```c
int MPI_Reduce_scatter_block(const void *sendbuf, void *recvbuf, int recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
int MPI_Reduce_scatter_block_c(const void *sendbuf, void *recvbuf, MPI_Count recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `recvcount` | IN | element count per block (nonnegative integer) |
| `datatype` | IN | datatype of elements of send and receive buffers (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | communicator (handle) |

**Fortran 2008**
```fortran
MPI_Reduce_scatter_block(sendbuf, recvbuf, recvcount, datatype, op, comm, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  TYPE(*), DIMENSION(..) :: recvbuf
  INTEGER, INTENT(IN) :: recvcount
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Reduce_scatter_block(sendbuf, recvbuf, recvcount, datatype, op, comm, ierror) !(_c)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  TYPE(*), DIMENSION(..) :: recvbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: recvcount
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REDUCE_SCATTER_BLOCK(SENDBUF, RECVBUF, RECVCOUNT, DATATYPE, OP, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER RECVCOUNT, DATATYPE, OP, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

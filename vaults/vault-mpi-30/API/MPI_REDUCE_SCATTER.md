---
title: MPI_REDUCE_SCATTER
c_name: MPI_Reduce_scatter
lis_name: MPI_REDUCE_SCATTER
chapter: coll
aliases: [MPI_REDUCE_SCATTER, MPI_Reduce_scatter]
tags: [mpi/function, mpi/coll]
---

# MPI_REDUCE_SCATTER

**C**
```c
int MPI_Reduce_scatter(const void* sendbuf, void* recvbuf, const int recvcounts[], MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `recvcounts` | IN | non-negative integer array (of length group size) specifying the number of elements of the result distributed to each process. |
| `datatype` | IN | data type of elements of send and receive buffers (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | communicator (handle) |

**Fortran 2008**
```fortran
MPI_Reduce_scatter(sendbuf, recvbuf, recvcounts, datatype, op, comm, ierror) BIND(C)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  TYPE(*), DIMENSION(..) :: recvbuf
  INTEGER, INTENT(IN) :: recvcounts(*)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REDUCE_SCATTER(SENDBUF, RECVBUF, RECVCOUNTS, DATATYPE, OP, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER RECVCOUNTS(*), DATATYPE, OP, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

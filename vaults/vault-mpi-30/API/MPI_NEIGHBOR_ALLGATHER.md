---
title: MPI_NEIGHBOR_ALLGATHER
c_name: MPI_Neighbor_allgather
lis_name: MPI_NEIGHBOR_ALLGATHER
chapter: topol
aliases: [MPI_NEIGHBOR_ALLGATHER, MPI_Neighbor_allgather]
tags: [mpi/function, mpi/topol]
---

# MPI_NEIGHBOR_ALLGATHER

**C**
```c
int MPI_Neighbor_allgather(const void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcount` | IN | number of elements sent to each neighbor (non-negative integer) |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `recvcount` | IN | number of elements received from each neighbor (non-negative integer) |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `comm` | IN | communicator with topology structure (handle) |

**Fortran 2008**
```fortran
MPI_Neighbor_allgather(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, ierror) BIND(C)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  TYPE(*), DIMENSION(..) :: recvbuf
  INTEGER, INTENT(IN) :: sendcount, recvcount
  TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_NEIGHBOR_ALLGATHER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, COMM, IERROR)
  $<$type$>$ SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.

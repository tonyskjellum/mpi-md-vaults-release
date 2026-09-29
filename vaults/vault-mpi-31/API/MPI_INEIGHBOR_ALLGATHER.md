---
title: MPI_INEIGHBOR_ALLGATHER
c_name: MPI_Ineighbor_allgather
lis_name: MPI_INEIGHBOR_ALLGATHER
chapter: topol
aliases: [MPI_INEIGHBOR_ALLGATHER, MPI_Ineighbor_allgather]
tags: [mpi/function, mpi/topol]
---

# MPI_INEIGHBOR_ALLGATHER

**C**
```c
int MPI_Ineighbor_allgather(const void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request)
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
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Ineighbor_allgather(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, comm, request, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
  INTEGER, INTENT(IN) :: sendcount, recvcount
  TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INEIGHBOR_ALLGATHER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, COMM, REQUEST, IERROR)
  $<$type$>$ SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[topol]] for the normative text.

---
title: MPI_IALLGATHERV
c_name: MPI_Iallgatherv
lis_name: MPI_IALLGATHERV
chapter: coll
aliases: [MPI_IALLGATHERV, MPI_Iallgatherv]
tags: [mpi/function, mpi/coll]
---

# MPI_IALLGATHERV

**C**
```c
int MPI_Iallgatherv(const void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, const int recvcounts[], const int displs[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Request* request)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcount` | IN | number of elements in send buffer (non-negative integer) |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcounts` | IN | non-negative integer array (of length group size) containing the number of elements that are received from each process |
| `displs` | IN | integer array (of length group size). Entry `i` specifies the displacement (relative to `recvbuf`) at which to place the incoming data from process `i` |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Iallgatherv(sendbuf, sendcount, sendtype, recvbuf, recvcounts, displs, recvtype, comm, request, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
  INTEGER, INTENT(IN) :: sendcount
  INTEGER, INTENT(IN), ASYNCHRONOUS :: recvcounts(*), displs(*)
  TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_IALLGATHERV(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNTS, DISPLS, RECVTYPE, COMM, REQUEST, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNT, SENDTYPE, RECVCOUNTS(*), DISPLS(*), RECVTYPE, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

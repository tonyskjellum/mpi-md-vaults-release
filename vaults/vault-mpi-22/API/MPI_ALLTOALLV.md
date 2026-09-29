---
title: MPI_ALLTOALLV
c_name: MPI_Alltoallv
lis_name: MPI_ALLTOALLV
chapter: coll
aliases: [MPI_ALLTOALLV, MPI_Alltoallv]
tags: [mpi/function, mpi/coll]
---

# MPI_ALLTOALLV

**C**
```c
int MPI_Alltoallv(void* sendbuf, int *sendcounts, int *sdispls, MPI_Datatype sendtype, void* recvbuf, int *recvcounts, int *rdispls, MPI_Datatype recvtype, MPI_Comm comm)
```

**C++**
```cpp
void MPI::Comm::Alltoallv(const void* sendbuf, const int sendcounts[], const int sdispls[], const MPI::Datatype& sendtype, void* recvbuf, const int recvcounts[], const int rdispls[], const MPI::Datatype& recvtype) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcounts` | IN | non-negative integer array (of length group size) specifying the number of elements to send to each processor |
| `sdispls` | IN | integer array (of length group size). Entry `j` specifies the displacement (relative to `sendbuf` from which to take the outgoing data destined for process `j` |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcounts` | IN | non-negative integer array (of length group size) specifying the number of elements that can be received from each processor |
| `rdispls` | IN | integer array (of length group size). Entry `i` specifies the displacement (relative to `recvbuf` at which to place the incoming data from process `i` |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_ALLTOALLV(SENDBUF, SENDCOUNTS, SDISPLS, SENDTYPE, RECVBUF, RECVCOUNTS, RDISPLS, RECVTYPE, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNTS(*), SDISPLS(*), SENDTYPE, RECVCOUNTS(*), RDISPLS(*), RECVTYPE, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

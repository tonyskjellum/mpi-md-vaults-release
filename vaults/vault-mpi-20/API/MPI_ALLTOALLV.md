---
title: MPI_ALLTOALLV
c_name: MPI_ALLTOALLV
lis_name: MPI_ALLTOALLV
chapter: collective
aliases: [MPI_ALLTOALLV]
tags: [mpi/function, mpi/collective]
---

# MPI_ALLTOALLV

**C++**
```cpp
void MPI::Comm::Alltoallv(const void* sendbuf, const int sendcounts[], const int sdispls[], const MPI::Datatype& sendtype, void* recvbuf, const int recvcounts[], const int rdispls[], const MPI::Datatype& recvtype) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcounts` | IN | integer array equal to the group size specifying the number of elements to send to each processor |
| `sdispls` | IN | integer array (of length group size). Entry `j` specifies the displacement (relative to `sendbuf`) from which to take the outgoing data destined for process `j` |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcounts` | IN | integer array equal to the group size specifying the number of elements that can be received from each processor |
| `rdispls` | IN | integer array (of length group size). Entry `i` specifies the displacement (relative to `recvbuf`) at which to place the incoming data from process `i` |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

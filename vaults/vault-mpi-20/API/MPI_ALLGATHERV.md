---
title: MPI_ALLGATHERV
c_name: MPI_ALLGATHERV
lis_name: MPI_ALLGATHERV
chapter: collective
aliases: [MPI_ALLGATHERV]
tags: [mpi/function, mpi/collective]
---

# MPI_ALLGATHERV

**C++**
```cpp
void MPI::Comm::Allgatherv(const void* sendbuf, int sendcount, const MPI::Datatype& sendtype, void* recvbuf, const int recvcounts[], const int displs[], const MPI::Datatype& recvtype) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcount` | IN | number of elements in send buffer (integer) |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcounts` | IN | integer array (of length group size) containing the number of elements that are received from each process |
| `displs` | IN | integer array (of length group size). Entry `i` specifies the displacement (relative to `recvbuf`) at which to place the incoming data from process `i` |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

---
title: MPI_GATHERV
c_name: MPI_GATHERV
lis_name: MPI_GATHERV
chapter: collective
aliases: [MPI_GATHERV]
tags: [mpi/function, mpi/collective]
---

# MPI_GATHERV

**C++**
```cpp
void MPI::Comm::Gatherv(const void* sendbuf, int sendcount, const MPI::Datatype& sendtype, void* recvbuf, const int recvcounts[], const int displs[], const MPI::Datatype& recvtype, int root) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcount` | IN | number of elements in send buffer (integer) |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice, significant only at root) |
| `recvcounts` | IN | integer array (of length group size) containing the number of elements that are received from each process (significant only at root) |
| `displs` | IN | integer array (of length group size). Entry `i` specifies the displacement relative to `recvbuf` at which to place the incoming data from process `i` (significant only at root) |
| `recvtype` | IN | data type of recv buffer elements (handle, significant only at root) |
| `root` | IN | rank of receiving process (integer) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

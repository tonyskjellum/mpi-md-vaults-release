---
title: MPI_SCATTERV
c_name: MPI_SCATTERV
lis_name: MPI_SCATTERV
chapter: collective
aliases: [MPI_SCATTERV]
tags: [mpi/function, mpi/collective]
---

# MPI_SCATTERV

**C++**
```cpp
void MPI::Comm::Scatterv(const void* sendbuf, const int sendcounts[], const int displs[], const MPI::Datatype& sendtype, void* recvbuf, int recvcount, const MPI::Datatype& recvtype, int root) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | address of send buffer (choice, significant only at root) |
| `sendcounts` | IN | integer array (of length group size) specifying the number of elements to send to each processor |
| `displs` | IN | integer array (of length group size). Entry `i` specifies the displacement (relative to `sendbuf` from which to take the outgoing data to process `i` |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcount` | IN | number of elements in receive buffer (integer) |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `root` | IN | rank of sending process (integer) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

---
title: MPI_GATHER
c_name: MPI_GATHER
lis_name: MPI_GATHER
chapter: collective
aliases: [MPI_GATHER]
tags: [mpi/function, mpi/collective]
---

# MPI_GATHER

**C++**
```cpp
void MPI::Comm::Gather(const void* sendbuf, int sendcount, const MPI::Datatype& sendtype, void* recvbuf, int recvcount, const MPI::Datatype& recvtype, int root) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcount` | IN | number of elements in send buffer (integer) |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice, significant only at root) |
| `recvcount` | IN | number of elements for any single receive (integer, significant only at root) |
| `recvtype` | IN | data type of recv buffer elements (handle, significant only at root) |
| `root` | IN | rank of receiving process (integer) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

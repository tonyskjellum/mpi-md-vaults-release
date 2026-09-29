---
title: MPI_SCATTER
c_name: MPI_SCATTER
lis_name: MPI_SCATTER
chapter: collective
aliases: [MPI_SCATTER]
tags: [mpi/function, mpi/collective]
---

# MPI_SCATTER

**C++**
```cpp
void MPI::Comm::Scatter(const void* sendbuf, int sendcount, const MPI::Datatype& sendtype, void* recvbuf, int recvcount, const MPI::Datatype& recvtype, int root) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | address of send buffer (choice, significant only at root) |
| `sendcount` | IN | number of elements sent to each process (integer, significant only at root) |
| `sendtype` | IN | data type of send buffer elements (handle, significant only at root) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcount` | IN | number of elements in receive buffer (integer) |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `root` | IN | rank of sending process (integer) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

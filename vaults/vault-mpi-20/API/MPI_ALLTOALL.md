---
title: MPI_ALLTOALL
c_name: MPI_ALLTOALL
lis_name: MPI_ALLTOALL
chapter: collective
aliases: [MPI_ALLTOALL]
tags: [mpi/function, mpi/collective]
---

# MPI_ALLTOALL

**C++**
```cpp
void MPI::Comm::Alltoall(const void* sendbuf, int sendcount, const MPI::Datatype& sendtype, void* recvbuf, int recvcount, const MPI::Datatype& recvtype) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcount` | IN | number of elements sent to each process (integer) |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcount` | IN | number of elements received from any process (integer) |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

---
title: MPI_ALLREDUCE
c_name: MPI_ALLREDUCE
lis_name: MPI_ALLREDUCE
chapter: collective
aliases: [MPI_ALLREDUCE]
tags: [mpi/function, mpi/collective]
---

# MPI_ALLREDUCE

**C++**
```cpp
void MPI::Comm::Allreduce(const void* sendbuf, void* recvbuf, int count, const MPI::Datatype& datatype, const MPI::Op& op) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `count` | IN | number of elements in send buffer (integer) |
| `datatype` | IN | data type of elements of send buffer (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

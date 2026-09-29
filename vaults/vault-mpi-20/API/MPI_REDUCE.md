---
title: MPI_REDUCE
c_name: MPI_REDUCE
lis_name: MPI_REDUCE
chapter: collective
aliases: [MPI_REDUCE]
tags: [mpi/function, mpi/collective]
---

# MPI_REDUCE

**C++**
```cpp
void MPI::Comm::Reduce(const void* sendbuf, void* recvbuf, int count, const MPI::Datatype& datatype, const MPI::Op& op, int root) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | address of send buffer (choice) |
| `recvbuf` | OUT | address of receive buffer (choice, significant only at root) |
| `count` | IN | number of elements in send buffer (integer) |
| `datatype` | IN | data type of elements of send buffer (handle) |
| `op` | IN | reduce operation (handle) |
| `root` | IN | rank of root process (integer) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

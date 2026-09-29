---
title: MPI_REDUCE_SCATTER
c_name: MPI_REDUCE_SCATTER
lis_name: MPI_REDUCE_SCATTER
chapter: collective
aliases: [MPI_REDUCE_SCATTER]
tags: [mpi/function, mpi/collective]
---

# MPI_REDUCE_SCATTER

**C++**
```cpp
void MPI::Comm::Reduce_scatter(const void* sendbuf, void* recvbuf, int recvcounts[], const MPI::Datatype& datatype, const MPI::Op& op) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `recvcounts` | IN | integer array specifying the number of elements in result distributed to each process. Array must be identical on all calling processes. |
| `datatype` | IN | data type of elements of input buffer (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

---
title: MPI_BCAST
c_name: MPI_BCAST
lis_name: MPI_BCAST
chapter: collective
aliases: [MPI_BCAST]
tags: [mpi/function, mpi/collective]
---

# MPI_BCAST

**C++**
```cpp
void MPI::Comm::Bcast(void* buffer, int count, const MPI::Datatype& datatype, int root) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `buffer` | INOUT | starting address of buffer (choice) |
| `count` | IN | number of entries in buffer (integer) |
| `datatype` | IN | data type of buffer (handle) |
| `root` | IN | rank of broadcast root (integer) |
| `comm` | IN | communicator (handle) |


> [!info] Semantics
> See the chapter note [[collective]] for the normative text.

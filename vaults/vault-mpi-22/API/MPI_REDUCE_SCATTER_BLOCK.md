---
title: MPI_REDUCE_SCATTER_BLOCK
c_name: MPI_Reduce_scatter_block
lis_name: MPI_REDUCE_SCATTER_BLOCK
chapter: coll
aliases: [MPI_REDUCE_SCATTER_BLOCK, MPI_Reduce_scatter_block]
tags: [mpi/function, mpi/coll]
---

# MPI_REDUCE_SCATTER_BLOCK

**C**
```c
int MPI_Reduce_scatter_block(void* sendbuf, void* recvbuf, int recvcount, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
```

**C++**
```cpp
void MPI::Comm::Reduce_scatter_block(const void* sendbuf, void* recvbuf, int recvcount, const MPI::Datatype& datatype, const MPI::Op& op) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `recvcount` | IN | element count per block (non-negative integer) |
| `datatype` | IN | data type of elements of send and receive buffers (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_REDUCE_SCATTER_BLOCK(SENDBUF, RECVBUF, RECVCOUNT, DATATYPE, OP, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER RECVCOUNT, DATATYPE, OP, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

---
title: MPI_REDUCE_SCATTER
c_name: MPI_Reduce_scatter
lis_name: MPI_REDUCE_SCATTER
chapter: coll
aliases: [MPI_REDUCE_SCATTER, MPI_Reduce_scatter]
tags: [mpi/function, mpi/coll]
---

# MPI_REDUCE_SCATTER

**C**
```c
int MPI_Reduce_scatter(void* sendbuf, void* recvbuf, int *recvcounts, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm)
```

**C++**
```cpp
void MPI::Comm::Reduce_scatter(const void* sendbuf, void* recvbuf, int recvcounts[], const MPI::Datatype& datatype, const MPI::Op& op) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `recvcounts` | IN | non-negative integer array specifying the number of elements in result distributed to each process. Array must be identical on all calling processes. |
| `datatype` | IN | data type of elements of input buffer (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_REDUCE_SCATTER(SENDBUF, RECVBUF, RECVCOUNTS, DATATYPE, OP, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER RECVCOUNTS(*), DATATYPE, OP, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

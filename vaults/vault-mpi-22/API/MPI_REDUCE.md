---
title: MPI_REDUCE
c_name: MPI_Reduce
lis_name: MPI_REDUCE
chapter: coll
aliases: [MPI_REDUCE, MPI_Reduce]
tags: [mpi/function, mpi/coll]
---

# MPI_REDUCE

**C**
```c
int MPI_Reduce(void* sendbuf, void* recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm)
```

**C++**
```cpp
void MPI::Comm::Reduce(const void* sendbuf, void* recvbuf, int count, const MPI::Datatype& datatype, const MPI::Op& op, int root) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | address of send buffer (choice) |
| `recvbuf` | OUT | address of receive buffer (choice, significant only at root) |
| `count` | IN | number of elements in send buffer (non-negative integer) |
| `datatype` | IN | data type of elements of send buffer (handle) |
| `op` | IN | reduce operation (handle) |
| `root` | IN | rank of root process (integer) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_REDUCE(SENDBUF, RECVBUF, COUNT, DATATYPE, OP, ROOT, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER COUNT, DATATYPE, OP, ROOT, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

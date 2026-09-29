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

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | address of send buffer (choice) |
| `recvbuf` | OUT | address of receive buffer (choice, significant only at root) |
| `count` | IN | number of elements in send buffer (integer) |
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

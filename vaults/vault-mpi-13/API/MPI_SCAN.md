---
title: MPI_SCAN
c_name: MPI_Scan
lis_name: MPI_SCAN
chapter: coll
aliases: [MPI_SCAN, MPI_Scan]
tags: [mpi/function, mpi/coll]
---

# MPI_SCAN

**C**
```c
int MPI_Scan(void* sendbuf, void* recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm )
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `count` | IN | number of elements in input buffer (integer) |
| `datatype` | IN | data type of elements of input buffer (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_SCAN(SENDBUF, RECVBUF, COUNT, DATATYPE, OP, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER COUNT, DATATYPE, OP, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

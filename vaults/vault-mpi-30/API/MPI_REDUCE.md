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
int MPI_Reduce(const void* sendbuf, void* recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm)
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

**Fortran 2008**
```fortran
MPI_Reduce(sendbuf, recvbuf, count, datatype, op, root, comm, ierror) BIND(C)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  TYPE(*), DIMENSION(..) :: recvbuf
  INTEGER, INTENT(IN) :: count, root
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REDUCE(SENDBUF, RECVBUF, COUNT, DATATYPE, OP, ROOT, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER COUNT, DATATYPE, OP, ROOT, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

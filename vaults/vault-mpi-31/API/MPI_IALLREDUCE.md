---
title: MPI_IALLREDUCE
c_name: MPI_Iallreduce
lis_name: MPI_IALLREDUCE
chapter: coll
aliases: [MPI_IALLREDUCE, MPI_Iallreduce]
tags: [mpi/function, mpi/coll]
---

# MPI_IALLREDUCE

**C**
```c
int MPI_Iallreduce(const void* sendbuf, void* recvbuf, int count, MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `recvbuf` | OUT | starting address of receive buffer (choice) |
| `count` | IN | number of elements in send buffer (non-negative integer) |
| `datatype` | IN | data type of elements of send buffer (handle) |
| `op` | IN | operation (handle) |
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Iallreduce(sendbuf, recvbuf, count, datatype, op, comm, request, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_IALLREDUCE(SENDBUF, RECVBUF, COUNT, DATATYPE, OP, COMM, REQUEST, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER COUNT, DATATYPE, OP, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

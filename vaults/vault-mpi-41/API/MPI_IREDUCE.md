---
title: MPI_IREDUCE
c_name: MPI_Ireduce
lis_name: MPI_IREDUCE
chapter: coll
aliases: [MPI_IREDUCE, MPI_Ireduce, MPI_Ireduce_c]
tags: [mpi/function, mpi/coll]
---

# MPI_IREDUCE

**C**
```c
int MPI_Ireduce(const void *sendbuf, void *recvbuf, int count, MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm, MPI_Request *request)
int MPI_Ireduce_c(const void *sendbuf, void *recvbuf, MPI_Count count, MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | address of send buffer (choice) |
| `recvbuf` | OUT | address of receive buffer (choice, significant only at root) |
| `count` | IN | number of elements in send buffer (non-negative integer) |
| `datatype` | IN | datatype of elements of send buffer (handle) |
| `op` | IN | reduce operation (handle) |
| `root` | IN | rank of the root (integer) |
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Ireduce(sendbuf, recvbuf, count, datatype, op, root, comm, request, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
  INTEGER, INTENT(IN) :: count, root
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Ireduce(sendbuf, recvbuf, count, datatype, op, root, comm, request, ierror) !(_c)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: sendbuf
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: recvbuf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Op), INTENT(IN) :: op
  INTEGER, INTENT(IN) :: root
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_IREDUCE(SENDBUF, RECVBUF, COUNT, DATATYPE, OP, ROOT, COMM, REQUEST, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER COUNT, DATATYPE, OP, ROOT, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

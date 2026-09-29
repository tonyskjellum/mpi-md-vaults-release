---
title: MPI_GATHER
c_name: MPI_Gather
lis_name: MPI_GATHER
chapter: coll
aliases: [MPI_GATHER, MPI_Gather]
tags: [mpi/function, mpi/coll]
---

# MPI_GATHER

**C**
```c
int MPI_Gather(const void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcount` | IN | number of elements in send buffer (non-negative integer) |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice, significant only at root) |
| `recvcount` | IN | number of elements for any single receive (non-negative integer, significant only at root) |
| `recvtype` | IN | data type of recv buffer elements (significant only at root) (handle) |
| `root` | IN | rank of receiving process (integer) |
| `comm` | IN | communicator (handle) |

**Fortran 2008**
```fortran
MPI_Gather(sendbuf, sendcount, sendtype, recvbuf, recvcount, recvtype, root, comm, ierror) BIND(C)
  TYPE(*), DIMENSION(..), INTENT(IN) :: sendbuf
  TYPE(*), DIMENSION(..) :: recvbuf
  INTEGER, INTENT(IN) :: sendcount, recvcount, root
  TYPE(MPI_Datatype), INTENT(IN) :: sendtype, recvtype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GATHER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, ROOT, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, ROOT, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

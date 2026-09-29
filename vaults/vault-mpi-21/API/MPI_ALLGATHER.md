---
title: MPI_ALLGATHER
c_name: MPI_Allgather
lis_name: MPI_ALLGATHER
chapter: coll
aliases: [MPI_ALLGATHER, MPI_Allgather]
tags: [mpi/function, mpi/coll]
---

# MPI_ALLGATHER

**C**
```c
int MPI_Allgather(void* sendbuf, int sendcount, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, MPI_Comm comm)
```

**C++**
```cpp
void MPI::Comm::Allgather(const void* sendbuf, int sendcount, const MPI::Datatype& sendtype, void* recvbuf, int recvcount, const MPI::Datatype& recvtype) const = 0
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | starting address of send buffer (choice) |
| `sendcount` | IN | number of elements in send buffer (non-negative integer) |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcount` | IN | number of elements received from any process (non-negative integer) |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_ALLGATHER(SENDBUF, SENDCOUNT, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNT, SENDTYPE, RECVCOUNT, RECVTYPE, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

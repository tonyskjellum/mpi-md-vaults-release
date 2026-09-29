---
title: MPI_SCATTERV
c_name: MPI_Scatterv
lis_name: MPI_SCATTERV
chapter: coll
aliases: [MPI_SCATTERV, MPI_Scatterv]
tags: [mpi/function, mpi/coll]
---

# MPI_SCATTERV

**C**
```c
int MPI_Scatterv(void* sendbuf, int *sendcounts, int *displs, MPI_Datatype sendtype, void* recvbuf, int recvcount, MPI_Datatype recvtype, int root, MPI_Comm comm)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | address of send buffer (choice, significant only at root) |
| `sendcounts` | IN | integer array (of length group size) specifying the number of elements to send to each processor |
| `displs` | IN | integer array (of length group size). Entry `i` specifies the displacement (relative to `sendbuf` from which to take the outgoing data to process `i` |
| `sendtype` | IN | data type of send buffer elements (handle) |
| `recvbuf` | OUT | address of receive buffer (choice) |
| `recvcount` | IN | number of elements in receive buffer (integer) |
| `recvtype` | IN | data type of receive buffer elements (handle) |
| `root` | IN | rank of sending process (integer) |
| `comm` | IN | communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_SCATTERV(SENDBUF, SENDCOUNTS, DISPLS, SENDTYPE, RECVBUF, RECVCOUNT, RECVTYPE, ROOT, COMM, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNTS(*), DISPLS(*), SENDTYPE, RECVCOUNT, RECVTYPE, ROOT, COMM, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

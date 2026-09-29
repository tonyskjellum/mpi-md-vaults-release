---
title: MPI_SENDRECV
c_name: MPI_Sendrecv
lis_name: MPI_SENDRECV
chapter: pt2pt
aliases: [MPI_SENDRECV, MPI_Sendrecv]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_SENDRECV

**C**
```c
int MPI_Sendrecv(void *sendbuf, int sendcount, MPI_Datatype sendtype, int dest, int sendtag, void *recvbuf, int recvcount, MPI_Datatype recvtype, int source, int recvtag, MPI_Comm comm, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `sendbuf` | IN | initial address of send buffer (choice) |
| `sendcount` | IN | number of elements in send buffer (integer) |
| `sendtype` | IN | type of elements in send buffer (handle) |
| `dest` | IN | rank of destination (integer) |
| `sendtag` | IN | send tag (integer) |
| `recvbuf` | OUT | initial address of receive buffer (choice) |
| `recvcount` | IN | number of elements in receive buffer (integer) |
| `recvtype` | IN | type of elements in receive buffer (handle) |
| `source` | IN | rank of source (integer) |
| `recvtag` | IN | receive tag (integer) |
| `comm` | IN | communicator (handle) |
| `status` | OUT | status object (Status) |

**Fortran (mpif.h)**
```fortran
MPI_SENDRECV(SENDBUF, SENDCOUNT, SENDTYPE, DEST, SENDTAG, RECVBUF, RECVCOUNT, RECVTYPE, SOURCE, RECVTAG, COMM, STATUS, IERROR)
  <type> SENDBUF(*), RECVBUF(*)
  INTEGER SENDCOUNT, SENDTYPE, DEST, SENDTAG, RECVCOUNT, RECVTYPE, SOURCE, RECVTAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

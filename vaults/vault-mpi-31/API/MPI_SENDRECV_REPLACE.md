---
title: MPI_SENDRECV_REPLACE
c_name: MPI_Sendrecv_replace
lis_name: MPI_SENDRECV_REPLACE
chapter: pt2pt
aliases: [MPI_SENDRECV_REPLACE, MPI_Sendrecv_replace]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_SENDRECV_REPLACE

**C**
```c
int MPI_Sendrecv_replace(void* buf, int count, MPI_Datatype datatype, int dest, int sendtag, int source, int recvtag, MPI_Comm comm, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | INOUT | initial address of send and receive buffer (choice) |
| `count` | IN | number of elements in send and receive buffer (non-negative integer) |
| `datatype` | IN | type of elements in send and receive buffer (handle) |
| `dest` | IN | rank of destination (integer) |
| `sendtag` | IN | send message tag (integer) |
| `source` | IN | rank of source or `MPI_ANY_SOURCE` (integer) |
| `recvtag` | IN | receive message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | communicator (handle) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_Sendrecv_replace(buf, count, datatype, dest, sendtag, source, recvtag, comm, status, ierror)
  TYPE(*), DIMENSION(..) :: buf
  INTEGER, INTENT(IN) :: count, dest, sendtag, source, recvtag
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SENDRECV_REPLACE(BUF, COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, STATUS, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM,
  STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

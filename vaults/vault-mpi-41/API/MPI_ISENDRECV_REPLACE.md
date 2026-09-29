---
title: MPI_ISENDRECV_REPLACE
c_name: MPI_Isendrecv_replace
lis_name: MPI_ISENDRECV_REPLACE
chapter: pt2pt
aliases: [MPI_ISENDRECV_REPLACE, MPI_Isendrecv_replace, MPI_Isendrecv_replace_c]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_ISENDRECV_REPLACE

**C**
```c
int MPI_Isendrecv_replace(void *buf, int count, MPI_Datatype datatype, int dest, int sendtag, int source, int recvtag, MPI_Comm comm, MPI_Request *request)
int MPI_Isendrecv_replace_c(void *buf, MPI_Count count, MPI_Datatype datatype, int dest, int sendtag, int source, int recvtag, MPI_Comm comm, MPI_Request *request)
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
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Isendrecv_replace(buf, count, datatype, dest, sendtag, source, recvtag, comm, request, ierror)
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
  INTEGER, INTENT(IN) :: count, dest, sendtag, source, recvtag
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Isendrecv_replace(buf, count, datatype, dest, sendtag, source, recvtag, comm, request, ierror) !(_c)
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: dest, sendtag, source, recvtag
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ISENDRECV_REPLACE(BUF, COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, DEST, SENDTAG, SOURCE, RECVTAG, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

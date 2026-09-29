---
title: MPI_BSEND_INIT
c_name: MPI_Bsend_init
lis_name: MPI_BSEND_INIT
chapter: pt2pt
aliases: [MPI_BSEND_INIT, MPI_Bsend_init]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_BSEND_INIT

**C**
```c
int MPI_Bsend_init(const void* buf, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | IN | initial address of send buffer (choice) |
| `count` | IN | number of elements sent (non-negative integer) |
| `datatype` | IN | type of each element (handle) |
| `dest` | IN | rank of destination (integer) |
| `tag` | IN | message tag (integer) |
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Bsend_init(buf, count, datatype, dest, tag, comm, request, ierror)
  TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
  INTEGER, INTENT(IN) :: count, dest, tag
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_BSEND_INIT(BUF, COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, DEST, TAG, COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

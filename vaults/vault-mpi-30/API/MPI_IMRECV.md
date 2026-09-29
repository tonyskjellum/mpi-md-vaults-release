---
title: MPI_IMRECV
c_name: MPI_Imrecv
lis_name: MPI_IMRECV
chapter: pt2pt
aliases: [MPI_IMRECV, MPI_Imrecv]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_IMRECV

**C**
```c
int MPI_Imrecv(void* buf, int count, MPI_Datatype datatype, MPI_Message *message, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `buf` | OUT | initial address of receive buffer (choice) |
| `count` | IN | number of elements in receive buffer (non-negative integer) |
| `datatype` | IN | datatype of each receive buffer element (handle) |
| `message` | INOUT | message (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Imrecv(buf, count, datatype, message, request, ierror) BIND(C)
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
  INTEGER, INTENT(IN) :: count
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  TYPE(MPI_Message), INTENT(INOUT) :: message
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_IMRECV(BUF, COUNT, DATATYPE, MESSAGE, REQUEST, IERROR)
  <type> BUF(*)
  INTEGER COUNT, DATATYPE, MESSAGE, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

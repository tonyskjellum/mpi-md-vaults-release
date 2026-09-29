---
title: MPI_COMM_IFLUSH_BUFFER
c_name: MPI_Comm_iflush_buffer
lis_name: MPI_COMM_IFLUSH_BUFFER
chapter: pt2pt
aliases: [MPI_COMM_IFLUSH_BUFFER, MPI_Comm_iflush_buffer]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_COMM_IFLUSH_BUFFER

**C**
```c
int MPI_Comm_iflush_buffer(MPI_Comm comm, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Comm_iflush_buffer(comm, request, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_IFLUSH_BUFFER(COMM, REQUEST, IERROR)
  INTEGER COMM, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

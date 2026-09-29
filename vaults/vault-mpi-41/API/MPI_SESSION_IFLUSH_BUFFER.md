---
title: MPI_SESSION_IFLUSH_BUFFER
c_name: MPI_Session_iflush_buffer
lis_name: MPI_SESSION_IFLUSH_BUFFER
chapter: pt2pt
aliases: [MPI_SESSION_IFLUSH_BUFFER, MPI_Session_iflush_buffer]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_SESSION_IFLUSH_BUFFER

**C**
```c
int MPI_Session_iflush_buffer(MPI_Session session, MPI_Request *request)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session (handle) |
| `request` | OUT | communication request (handle) |

**Fortran 2008**
```fortran
MPI_Session_iflush_buffer(session, request, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  TYPE(MPI_Request), INTENT(OUT) :: request
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_IFLUSH_BUFFER(SESSION, REQUEST, IERROR)
  INTEGER SESSION, REQUEST, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

---
title: MPI_SESSION_FLUSH_BUFFER
c_name: MPI_Session_flush_buffer
lis_name: MPI_SESSION_FLUSH_BUFFER
chapter: pt2pt
aliases: [MPI_SESSION_FLUSH_BUFFER, MPI_Session_flush_buffer]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_SESSION_FLUSH_BUFFER

**C**
```c
int MPI_Session_flush_buffer(MPI_Session session)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session (handle) |

**Fortran 2008**
```fortran
MPI_Session_flush_buffer(session, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_FLUSH_BUFFER(SESSION, IERROR)
  INTEGER SESSION, IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

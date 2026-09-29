---
title: MPI_SESSION_ATTACH_BUFFER
c_name: MPI_Session_attach_buffer
lis_name: MPI_SESSION_ATTACH_BUFFER
chapter: pt2pt
aliases: [MPI_SESSION_ATTACH_BUFFER, MPI_Session_attach_buffer, MPI_Session_attach_buffer_c]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_SESSION_ATTACH_BUFFER

**C**
```c
int MPI_Session_attach_buffer(MPI_Session session, void *buffer, int size)
int MPI_Session_attach_buffer_c(MPI_Session session, void *buffer, MPI_Count size)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session (handle) |
| `buffer` | IN | initial buffer address (choice) |
| `size` | IN | buffer size, in bytes (non-negative integer) |

**Fortran 2008**
```fortran
MPI_Session_attach_buffer(session, buffer, size, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
  INTEGER, INTENT(IN) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Session_attach_buffer(session, buffer, size, ierror) !(_c)
  TYPE(MPI_Session), INTENT(IN) :: session
  TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buffer
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_ATTACH_BUFFER(SESSION, BUFFER, SIZE, IERROR)
  INTEGER SESSION, SIZE, IERROR
  <type> BUFFER(*)
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

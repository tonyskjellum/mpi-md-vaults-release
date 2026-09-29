---
title: MPI_SESSION_SET_ERRHANDLER
c_name: MPI_Session_set_errhandler
lis_name: MPI_SESSION_SET_ERRHANDLER
chapter: inquiry
aliases: [MPI_SESSION_SET_ERRHANDLER, MPI_Session_set_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_SESSION_SET_ERRHANDLER

**C**
```c
int MPI_Session_set_errhandler(MPI_Session session, MPI_Errhandler errhandler)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | INOUT | session (handle) |
| `errhandler` | IN | new error handler for session (handle) |

**Fortran 2008**
```fortran
MPI_Session_set_errhandler(session, errhandler, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_SET_ERRHANDLER(SESSION, ERRHANDLER, IERROR)
  INTEGER SESSION, ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

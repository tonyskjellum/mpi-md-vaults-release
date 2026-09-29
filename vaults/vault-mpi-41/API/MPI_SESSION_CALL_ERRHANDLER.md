---
title: MPI_SESSION_CALL_ERRHANDLER
c_name: MPI_Session_call_errhandler
lis_name: MPI_SESSION_CALL_ERRHANDLER
chapter: inquiry
aliases: [MPI_SESSION_CALL_ERRHANDLER, MPI_Session_call_errhandler]
tags: [mpi/function, mpi/inquiry]
---

# MPI_SESSION_CALL_ERRHANDLER

**C**
```c
int MPI_Session_call_errhandler(MPI_Session session, int errorcode)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session with error handler (handle) |
| `errorcode` | IN | error code (integer) |

**Fortran 2008**
```fortran
MPI_Session_call_errhandler(session, errorcode, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  INTEGER, INTENT(IN) :: errorcode
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_CALL_ERRHANDLER(SESSION, ERRORCODE, IERROR)
  INTEGER SESSION, ERRORCODE, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

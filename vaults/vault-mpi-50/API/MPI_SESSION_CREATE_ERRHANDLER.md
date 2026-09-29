---
title: MPI_SESSION_CREATE_ERRHANDLER
c_name: MPI_Session_create_errhandler
lis_name: MPI_SESSION_CREATE_ERRHANDLER
chapter: inquiry
aliases: [MPI_SESSION_CREATE_ERRHANDLER, MPI_Session_create_errhandler, MPI_Session_errhandler_function]
tags: [mpi/function, mpi/inquiry]
---

# MPI_SESSION_CREATE_ERRHANDLER

**C**
```c
int MPI_Session_create_errhandler(MPI_Session_errhandler_function *session_errhandler_fn, MPI_Errhandler *errhandler)
typedef void MPI_Session_errhandler_function(MPI_Session *session, int *error_code, ...);
```

| Parameter | Intent | Description |
|---|---|---|
| `session_errhandler_fn` | IN | user defined error handling procedure (function) |
| `errhandler` | OUT | MPI error handler (handle) |

**Fortran 2008**
```fortran
MPI_Session_create_errhandler(session_errhandler_fn, errhandler, ierror)
  PROCEDURE(MPI_Session_errhandler_function) :: session_errhandler_fn
  TYPE(MPI_Errhandler), INTENT(OUT) :: errhandler
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_CREATE_ERRHANDLER(SESSION_ERRHANDLER_FN, ERRHANDLER, IERROR)
  EXTERNAL SESSION_ERRHANDLER_FN
  INTEGER ERRHANDLER, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

---
title: MPI_SESSION_INIT
c_name: MPI_Session_init
lis_name: MPI_SESSION_INIT
chapter: dynamic
aliases: [MPI_SESSION_INIT, MPI_Session_init]
tags: [mpi/function, mpi/dynamic]
---

# MPI_SESSION_INIT

**C**
```c
int MPI_Session_init(MPI_Info info, MPI_Errhandler errhandler, MPI_Session *session)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | IN | info object to specify thread support level and MPI implementation specific resources (handle) |
| `errhandler` | IN | error handler to invoke in the event that an error is encountered during this function call (handle) |
| `session` | OUT | new session (handle) |

**Fortran 2008**
```fortran
MPI_Session_init(info, errhandler, session, ierror)
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
  TYPE(MPI_Session), INTENT(OUT) :: session
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_INIT(INFO, ERRHANDLER, SESSION, IERROR)
  INTEGER INFO, ERRHANDLER, SESSION, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

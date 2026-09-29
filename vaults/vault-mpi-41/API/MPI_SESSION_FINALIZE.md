---
title: MPI_SESSION_FINALIZE
c_name: MPI_Session_finalize
lis_name: MPI_SESSION_FINALIZE
chapter: dynamic
aliases: [MPI_SESSION_FINALIZE, MPI_Session_finalize]
tags: [mpi/function, mpi/dynamic]
---

# MPI_SESSION_FINALIZE

**C**
```c
int MPI_Session_finalize(MPI_Session *session)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | INOUT | session to be finalized (handle) |

**Fortran 2008**
```fortran
MPI_Session_finalize(session, ierror)
  TYPE(MPI_Session), INTENT(INOUT) :: session
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_FINALIZE(SESSION, IERROR)
  INTEGER SESSION, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

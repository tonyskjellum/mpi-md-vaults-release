---
title: MPI_SESSION_GET_INFO
c_name: MPI_Session_get_info
lis_name: MPI_SESSION_GET_INFO
chapter: dynamic
aliases: [MPI_SESSION_GET_INFO, MPI_Session_get_info]
tags: [mpi/function, mpi/dynamic]
---

# MPI_SESSION_GET_INFO

**C**
```c
int MPI_Session_get_info(MPI_Session session, MPI_Info *info_used)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session (handle) |
| `info_used` | OUT | see explanation below (handle) |

**Fortran 2008**
```fortran
MPI_Session_get_info(session, info_used, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  TYPE(MPI_Info), INTENT(OUT) :: info_used
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_GET_INFO(SESSION, INFO_USED, IERROR)
  INTEGER SESSION, INFO_USED, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

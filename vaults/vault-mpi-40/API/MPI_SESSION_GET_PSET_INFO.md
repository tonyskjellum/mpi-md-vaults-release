---
title: MPI_SESSION_GET_PSET_INFO
c_name: MPI_Session_get_pset_info
lis_name: MPI_SESSION_GET_PSET_INFO
chapter: dynamic
aliases: [MPI_SESSION_GET_PSET_INFO, MPI_Session_get_pset_info]
tags: [mpi/function, mpi/dynamic]
---

# MPI_SESSION_GET_PSET_INFO

**C**
```c
int MPI_Session_get_pset_info(MPI_Session session, const char *pset_name, MPI_Info *info)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session (handle) |
| `pset_name` | IN | name of process set (string) |
| `info` | OUT | info object containing information about the given process set (handle) |

**Fortran 2008**
```fortran
MPI_Session_get_pset_info(session, pset_name, info, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  CHARACTER(LEN=*), INTENT(IN) :: pset_name
  TYPE(MPI_Info), INTENT(OUT) :: info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_GET_PSET_INFO(SESSION, PSET_NAME, INFO, IERROR)
  INTEGER SESSION, INFO, IERROR
  CHARACTER*(*) PSET_NAME
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

---
title: MPI_GROUP_FROM_SESSION_PSET
c_name: MPI_Group_from_session_pset
lis_name: MPI_GROUP_FROM_SESSION_PSET
chapter: context
aliases: [MPI_GROUP_FROM_SESSION_PSET, MPI_Group_from_session_pset]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_FROM_SESSION_PSET

**C**
```c
int MPI_Group_from_session_pset(MPI_Session session, const char *pset_name, MPI_Group *newgroup)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session (handle) |
| `pset_name` | IN | name of process set to use to create the new group (string) |
| `newgroup` | OUT | new group derived from supplied session and process set (handle) |

**Fortran 2008**
```fortran
MPI_Group_from_session_pset(session, pset_name, newgroup, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  CHARACTER(LEN=*), INTENT(IN) :: pset_name
  TYPE(MPI_Group), INTENT(OUT) :: newgroup
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GROUP_FROM_SESSION_PSET(SESSION, PSET_NAME, NEWGROUP, IERROR)
  INTEGER SESSION, NEWGROUP, IERROR
  CHARACTER*(*) PSET_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

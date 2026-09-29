---
title: MPI_INTERCOMM_CREATE_FROM_GROUPS
c_name: MPI_Intercomm_create_from_groups
lis_name: MPI_INTERCOMM_CREATE_FROM_GROUPS
chapter: context
aliases: [MPI_INTERCOMM_CREATE_FROM_GROUPS, MPI_Intercomm_create_from_groups]
tags: [mpi/function, mpi/context]
---

# MPI_INTERCOMM_CREATE_FROM_GROUPS

**C**
```c
int MPI_Intercomm_create_from_groups(MPI_Group local_group, int local_leader, MPI_Group remote_group, int remote_leader, const char *stringtag, MPI_Info info, MPI_Errhandler errhandler, MPI_Comm *newintercomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `local_group` | IN | local group (handle) |
| `local_leader` | IN | rank of local group leader in `local_group` (integer) |
| `remote_group` | IN | remote group, significant only at `local_leader` (handle) |
| `remote_leader` | IN | rank of remote group leader in `remote_group`, significant only at `local_leader` (integer) |
| `stringtag` | IN | unique identifier for this operation (string) |
| `info` | IN | info object (handle) |
| `errhandler` | IN | error handler to be attached to new inter-communicator (handle) |
| `newintercomm` | OUT | new inter-communicator (handle) |

**Fortran 2008**
```fortran
MPI_Intercomm_create_from_groups(local_group, local_leader, remote_group, remote_leader, stringtag, info, errhandler, newintercomm, ierror)
  TYPE(MPI_Group), INTENT(IN) :: local_group, remote_group
  INTEGER, INTENT(IN) :: local_leader, remote_leader
  CHARACTER(LEN=*), INTENT(IN) :: stringtag
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
  TYPE(MPI_Comm), INTENT(OUT) :: newintercomm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INTERCOMM_CREATE_FROM_GROUPS(LOCAL_GROUP, LOCAL_LEADER, REMOTE_GROUP, REMOTE_LEADER, STRINGTAG, INFO, ERRHANDLER, NEWINTERCOMM, IERROR)
  INTEGER LOCAL_GROUP, LOCAL_LEADER, REMOTE_GROUP, REMOTE_LEADER, INFO, ERRHANDLER, NEWINTERCOMM, IERROR
  CHARACTER*(*) STRINGTAG
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

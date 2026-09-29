---
title: MPI_COMM_CREATE_GROUP
c_name: MPI_Comm_create_group
lis_name: MPI_COMM_CREATE_GROUP
chapter: context
aliases: [MPI_COMM_CREATE_GROUP, MPI_Comm_create_group]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_CREATE_GROUP

**C**
```c
int MPI_Comm_create_group(MPI_Comm comm, MPI_Group group, int tag, MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | intracommunicator (handle) |
| `group` | IN | group, which is a subset of the group of `comm` (handle) |
| `tag` | IN | tag (integer) |
| `newcomm` | OUT | new communicator (handle) |

**Fortran 2008**
```fortran
MPI_Comm_create_group(comm, group, tag, newcomm, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Group), INTENT(IN) :: group
  INTEGER, INTENT(IN) :: tag
  TYPE(MPI_Comm), INTENT(OUT) :: newcomm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_CREATE_GROUP(COMM, GROUP, TAG, NEWCOMM, IERROR)
  INTEGER COMM, GROUP, TAG, NEWCOMM, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

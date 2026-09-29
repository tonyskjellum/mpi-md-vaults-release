---
title: MPI_COMM_REMOTE_GROUP
c_name: MPI_Comm_remote_group
lis_name: MPI_COMM_REMOTE_GROUP
chapter: context
aliases: [MPI_COMM_REMOTE_GROUP, MPI_Comm_remote_group]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_REMOTE_GROUP

**C**
```c
int MPI_Comm_remote_group(MPI_Comm comm, MPI_Group *group)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | inter-communicator (handle) |
| `group` | OUT | remote group corresponding to `comm` (handle) |

**Fortran 2008**
```fortran
MPI_Comm_remote_group(comm, group, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Group), INTENT(OUT) :: group
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_REMOTE_GROUP(COMM, GROUP, IERROR)
  INTEGER COMM, GROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

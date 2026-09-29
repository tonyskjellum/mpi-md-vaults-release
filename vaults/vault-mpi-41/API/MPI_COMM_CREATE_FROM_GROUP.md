---
title: MPI_COMM_CREATE_FROM_GROUP
c_name: MPI_Comm_create_from_group
lis_name: MPI_COMM_CREATE_FROM_GROUP
chapter: context
aliases: [MPI_COMM_CREATE_FROM_GROUP, MPI_Comm_create_from_group]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_CREATE_FROM_GROUP

**C**
```c
int MPI_Comm_create_from_group(MPI_Group group, const char *stringtag, MPI_Info info, MPI_Errhandler errhandler, MPI_Comm *newcomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group (handle) |
| `stringtag` | IN | unique identifier for this operation (string) |
| `info` | IN | info object (handle) |
| `errhandler` | IN | error handler to be attached to new intra-communicator (handle) |
| `newcomm` | OUT | new communicator (handle) |

**Fortran 2008**
```fortran
MPI_Comm_create_from_group(group, stringtag, info, errhandler, newcomm, ierror)
  TYPE(MPI_Group), INTENT(IN) :: group
  CHARACTER(LEN=*), INTENT(IN) :: stringtag
  TYPE(MPI_Info), INTENT(IN) :: info
  TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
  TYPE(MPI_Comm), INTENT(OUT) :: newcomm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_CREATE_FROM_GROUP(GROUP, STRINGTAG, INFO, ERRHANDLER, NEWCOMM, IERROR)
  INTEGER GROUP, INFO, ERRHANDLER, NEWCOMM, IERROR
  CHARACTER*(*) STRINGTAG
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

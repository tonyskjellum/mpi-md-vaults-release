---
title: MPI_COMM_SET_NAME
c_name: MPI_Comm_set_name
lis_name: MPI_COMM_SET_NAME
chapter: context
aliases: [MPI_COMM_SET_NAME, MPI_Comm_set_name]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_SET_NAME

**C**
```c
int MPI_Comm_set_name(MPI_Comm comm, const char *comm_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator whose identifier is to be set (handle) |
| `comm_name` | IN | the character string which is remembered as the name (string) |

**Fortran 2008**
```fortran
MPI_Comm_set_name(comm, comm_name, ierror) BIND(C)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  CHARACTER(LEN=*), INTENT(IN) :: comm_name
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_SET_NAME(COMM, COMM_NAME, IERROR)
  INTEGER COMM, IERROR
  CHARACTER*(*) COMM_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

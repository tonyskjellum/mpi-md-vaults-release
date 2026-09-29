---
title: MPI_COMM_GET_NAME
c_name: MPI_Comm_get_name
lis_name: MPI_COMM_GET_NAME
chapter: context
aliases: [MPI_COMM_GET_NAME, MPI_Comm_get_name]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_GET_NAME

**C**
```c
int MPI_Comm_get_name(MPI_Comm comm, char *comm_name, int *resultlen)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator whose name is to be returned (handle) |
| `comm_name` | OUT | the name previously stored on the communicator, or an empty string if no such name exists (string) |
| `resultlen` | OUT | length of returned name (integer) |

**Fortran 2008**
```fortran
MPI_Comm_get_name(comm, comm_name, resultlen, ierror) BIND(C)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  CHARACTER(LEN=MPI_MAX_OBJECT_NAME), INTENT(OUT) :: comm_name
  INTEGER, INTENT(OUT) :: resultlen
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_GET_NAME(COMM, COMM_NAME, RESULTLEN, IERROR)
  INTEGER COMM, RESULTLEN, IERROR
  CHARACTER*(*) COMM_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

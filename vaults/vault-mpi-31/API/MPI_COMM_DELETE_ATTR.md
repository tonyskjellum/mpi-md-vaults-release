---
title: MPI_COMM_DELETE_ATTR
c_name: MPI_Comm_delete_attr
lis_name: MPI_COMM_DELETE_ATTR
chapter: context
aliases: [MPI_COMM_DELETE_ATTR, MPI_Comm_delete_attr]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_DELETE_ATTR

**C**
```c
int MPI_Comm_delete_attr(MPI_Comm comm, int comm_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator from which the attribute is deleted (handle) |
| `comm_keyval` | IN | key value (integer) |

**Fortran 2008**
```fortran
MPI_Comm_delete_attr(comm, comm_keyval, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: comm_keyval
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_DELETE_ATTR(COMM, COMM_KEYVAL, IERROR)
  INTEGER COMM, COMM_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

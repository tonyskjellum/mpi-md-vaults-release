---
title: MPI_COMM_SET_ATTR
c_name: MPI_Comm_set_attr
lis_name: MPI_COMM_SET_ATTR
chapter: context
aliases: [MPI_COMM_SET_ATTR, MPI_Comm_set_attr]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_SET_ATTR

**C**
```c
int MPI_Comm_set_attr(MPI_Comm comm, int comm_keyval, void *attribute_val)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator from which attribute will be attached (handle) |
| `comm_keyval` | IN | key value (integer) |
| `attribute_val` | IN | attribute value |

**Fortran 2008**
```fortran
MPI_Comm_set_attr(comm, comm_keyval, attribute_val, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: comm_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: attribute_val
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_SET_ATTR(COMM, COMM_KEYVAL, ATTRIBUTE_VAL, IERROR)
  INTEGER COMM, COMM_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

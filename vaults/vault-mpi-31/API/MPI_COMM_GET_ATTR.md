---
title: MPI_COMM_GET_ATTR
c_name: MPI_Comm_get_attr
lis_name: MPI_COMM_GET_ATTR
chapter: context
aliases: [MPI_COMM_GET_ATTR, MPI_Comm_get_attr]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_GET_ATTR

**C**
```c
int MPI_Comm_get_attr(MPI_Comm comm, int comm_keyval, void *attribute_val, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator to which the attribute is attached (handle) |
| `comm_keyval` | IN | key value (integer) |
| `attribute_val` | OUT | attribute value, unless `flag = false` |
| `flag` | OUT | `false` if no attribute is associated with the key (logical) |

**Fortran 2008**
```fortran
MPI_Comm_get_attr(comm, comm_keyval, attribute_val, flag, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(IN) :: comm_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: attribute_val
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_COMM_GET_ATTR(COMM, COMM_KEYVAL, ATTRIBUTE_VAL, FLAG, IERROR)
  INTEGER COMM, COMM_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

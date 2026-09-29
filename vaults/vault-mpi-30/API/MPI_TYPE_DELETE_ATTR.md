---
title: MPI_TYPE_DELETE_ATTR
c_name: MPI_Type_delete_attr
lis_name: MPI_TYPE_DELETE_ATTR
chapter: context
aliases: [MPI_TYPE_DELETE_ATTR, MPI_Type_delete_attr]
tags: [mpi/function, mpi/context]
---

# MPI_TYPE_DELETE_ATTR

**C**
```c
int MPI_Type_delete_attr(MPI_Datatype datatype, int type_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | INOUT | datatype from which the attribute is deleted (handle) |
| `type_keyval` | IN | key value (integer) |

**Fortran 2008**
```fortran
MPI_Type_delete_attr(datatype, type_keyval, ierror) BIND(C)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: type_keyval
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_DELETE_ATTR(DATATYPE, TYPE_KEYVAL, IERROR)
  INTEGER DATATYPE, TYPE_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

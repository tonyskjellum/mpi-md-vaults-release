---
title: MPI_TYPE_SET_ATTR
c_name: MPI_Type_set_attr
lis_name: MPI_TYPE_SET_ATTR
chapter: context
aliases: [MPI_TYPE_SET_ATTR, MPI_Type_set_attr]
tags: [mpi/function, mpi/context]
---

# MPI_TYPE_SET_ATTR

**C**
```c
int MPI_Type_set_attr(MPI_Datatype datatype, int type_keyval, void *attribute_val)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | INOUT | datatype to which attribute will be attached (handle) |
| `type_keyval` | IN | key value (integer) |
| `attribute_val` | IN | attribute value |

**Fortran 2008**
```fortran
MPI_Type_set_attr(datatype, type_keyval, attribute_val, ierror) BIND(C)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: type_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: attribute_val
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_SET_ATTR(DATATYPE, TYPE_KEYVAL, ATTRIBUTE_VAL, IERROR)
  INTEGER DATATYPE, TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

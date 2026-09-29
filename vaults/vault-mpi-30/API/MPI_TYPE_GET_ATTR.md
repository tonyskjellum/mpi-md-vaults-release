---
title: MPI_TYPE_GET_ATTR
c_name: MPI_Type_get_attr
lis_name: MPI_TYPE_GET_ATTR
chapter: context
aliases: [MPI_TYPE_GET_ATTR, MPI_Type_get_attr]
tags: [mpi/function, mpi/context]
---

# MPI_TYPE_GET_ATTR

**C**
```c
int MPI_Type_get_attr(MPI_Datatype datatype, int type_keyval, void *attribute_val, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype to which the attribute is attached (handle) |
| `type_keyval` | IN | key value (integer) |
| `attribute_val` | OUT | attribute value, unless `flag = false` |
| `flag` | OUT | `false` if no attribute is associated with the key (logical) |

**Fortran 2008**
```fortran
MPI_Type_get_attr(datatype, type_keyval, attribute_val, flag, ierror) BIND(C)
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: type_keyval
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: attribute_val
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_ATTR(DATATYPE, TYPE_KEYVAL, ATTRIBUTE_VAL, FLAG, IERROR)
  INTEGER DATATYPE, TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

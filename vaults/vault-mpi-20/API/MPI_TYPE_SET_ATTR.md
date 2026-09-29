---
title: MPI_TYPE_SET_ATTR
c_name: MPI_Type_set_attr
lis_name: MPI_TYPE_SET_ATTR
chapter: ei
aliases: [MPI_TYPE_SET_ATTR, MPI_Type_set_attr]
tags: [mpi/function, mpi/ei]
---

# MPI_TYPE_SET_ATTR

**C**
```c
int MPI_Type_set_attr(MPI_Datatype type, int type_keyval, void *attribute_val)
```

**C++**
```cpp
void MPI::Datatype::Set_attr(int type_keyval, const void* attribute_val)
```

| Parameter | Intent | Description |
|---|---|---|
| `type` | INOUT | datatype to which attribute will be attached (handle) |
| `type_keyval` | IN | key value (integer) |
| `attribute_val` | IN | attribute value |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_SET_ATTR(TYPE, TYPE_KEYVAL, ATTRIBUTE_VAL, IERROR)
  INTEGER TYPE, TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

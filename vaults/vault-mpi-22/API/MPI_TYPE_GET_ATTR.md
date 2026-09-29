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
int MPI_Type_get_attr(MPI_Datatype type, int type_keyval, void *attribute_val, int *flag)
```

**C++**
```cpp
bool MPI::Datatype::Get_attr(int type_keyval, void* attribute_val) const
```

| Parameter | Intent | Description |
|---|---|---|
| `type` | IN | datatype to which the attribute is attached (handle) |
| `type_keyval` | IN | key value (integer) |
| `attribute_val` | OUT | attribute value, unless `flag = false` |
| `flag` | OUT | `false` if no attribute is associated with the key (logical) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_ATTR(TYPE, TYPE_KEYVAL, ATTRIBUTE_VAL, FLAG, IERROR)
  INTEGER TYPE, TYPE_KEYVAL, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

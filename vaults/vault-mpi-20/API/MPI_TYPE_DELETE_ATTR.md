---
title: MPI_TYPE_DELETE_ATTR
c_name: MPI_Type_delete_attr
lis_name: MPI_TYPE_DELETE_ATTR
chapter: ei
aliases: [MPI_TYPE_DELETE_ATTR, MPI_Type_delete_attr]
tags: [mpi/function, mpi/ei]
---

# MPI_TYPE_DELETE_ATTR

**C**
```c
int MPI_Type_delete_attr(MPI_Datatype type, int type_keyval)
```

**C++**
```cpp
void MPI::Datatype::Delete_attr(int type_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `type` | INOUT | datatype from which the attribute is deleted (handle) |
| `type_keyval` | IN | key value (integer) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_DELETE_ATTR(TYPE, TYPE_KEYVAL, IERROR)
  INTEGER TYPE, TYPE_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

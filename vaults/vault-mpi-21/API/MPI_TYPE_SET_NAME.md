---
title: MPI_TYPE_SET_NAME
c_name: MPI_Type_set_name
lis_name: MPI_TYPE_SET_NAME
chapter: context
aliases: [MPI_TYPE_SET_NAME, MPI_Type_set_name]
tags: [mpi/function, mpi/context]
---

# MPI_TYPE_SET_NAME

**C**
```c
int MPI_Type_set_name(MPI_Datatype type, char *type_name)
```

**C++**
```cpp
void MPI::Datatype::Set_name(const char* type_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `type` | INOUT | datatype whose identifier is to be set (handle) |
| `type_name` | IN | the character string which is remembered as the name (string) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_SET_NAME(TYPE, TYPE_NAME, IERROR)
  INTEGER TYPE, IERROR
  CHARACTER*(*) TYPE_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

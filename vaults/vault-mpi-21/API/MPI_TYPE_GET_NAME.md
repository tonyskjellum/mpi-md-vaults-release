---
title: MPI_TYPE_GET_NAME
c_name: MPI_Type_get_name
lis_name: MPI_TYPE_GET_NAME
chapter: context
aliases: [MPI_TYPE_GET_NAME, MPI_Type_get_name]
tags: [mpi/function, mpi/context]
---

# MPI_TYPE_GET_NAME

**C**
```c
int MPI_Type_get_name(MPI_Datatype type, char *type_name, int *resultlen)
```

**C++**
```cpp
void MPI::Datatype::Get_name(char* type_name, int& resultlen) const
```

| Parameter | Intent | Description |
|---|---|---|
| `type` | IN | datatype whose name is to be returned (handle) |
| `type_name` | OUT | the name previously stored on the datatype, or a empty string if no such name exists (string) |
| `resultlen` | OUT | length of returned name (integer) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_GET_NAME(TYPE, TYPE_NAME, RESULTLEN, IERROR)
  INTEGER TYPE, RESULTLEN, IERROR
  CHARACTER*(*) TYPE_NAME
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

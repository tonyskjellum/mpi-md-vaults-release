---
title: MPI_TYPE_FREE_KEYVAL
c_name: MPI_Type_free_keyval
lis_name: MPI_TYPE_FREE_KEYVAL
chapter: ei
aliases: [MPI_TYPE_FREE_KEYVAL, MPI_Type_free_keyval]
tags: [mpi/function, mpi/ei]
---

# MPI_TYPE_FREE_KEYVAL

**C**
```c
int MPI_Type_free_keyval(int *type_keyval)
```

**C++**
```cpp
static void MPI::Datatype::Free_keyval(int& type_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `type_keyval` | INOUT | key value (integer) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_FREE_KEYVAL(TYPE_KEYVAL, IERROR)
  INTEGER TYPE_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

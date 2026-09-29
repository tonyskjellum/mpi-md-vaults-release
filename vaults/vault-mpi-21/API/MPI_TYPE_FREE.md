---
title: MPI_TYPE_FREE
c_name: MPI_Type_free
lis_name: MPI_TYPE_FREE
chapter: datatypes
aliases: [MPI_TYPE_FREE, MPI_Type_free]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_FREE

**C**
```c
int MPI_Type_free(MPI_Datatype *datatype)
```

**C++**
```cpp
void MPI::Datatype::Free()
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | INOUT | datatype that is freed (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_FREE(DATATYPE, IERROR)
  INTEGER DATATYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.

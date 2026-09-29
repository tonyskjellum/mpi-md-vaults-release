---
title: MPI_TYPE_DUP
c_name: MPI_Type_dup
lis_name: MPI_TYPE_DUP
chapter: datatypes
aliases: [MPI_TYPE_DUP, MPI_Type_dup]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_DUP

**C**
```c
int MPI_Type_dup(MPI_Datatype type, MPI_Datatype *newtype)
```

**C++**
```cpp
MPI::Datatype MPI::Datatype::Dup() const
```

| Parameter | Intent | Description |
|---|---|---|
| `type` | IN | datatype (handle) |
| `newtype` | OUT | copy of `type` (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_DUP(TYPE, NEWTYPE, IERROR)
  INTEGER TYPE, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.

---
title: MPI_TYPE_MATCH_SIZE
c_name: MPI_Type_match_size
lis_name: MPI_TYPE_MATCH_SIZE
chapter: binding
aliases: [MPI_TYPE_MATCH_SIZE, MPI_Type_match_size]
tags: [mpi/function, mpi/binding]
---

# MPI_TYPE_MATCH_SIZE

**C**
```c
int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *type)
```

**C++**
```cpp
static MPI::Datatype MPI::Datatype::Match_size(int typeclass, int size)
```

| Parameter | Intent | Description |
|---|---|---|
| `typeclass` | IN | generic type specifier (integer) |
| `size` | IN | size, in bytes, of representation (integer) |
| `type` | OUT | datatype with correct type, size (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_MATCH_SIZE(TYPECLASS, SIZE, TYPE, IERROR)
  INTEGER TYPECLASS, SIZE, TYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[binding]] for the normative text.

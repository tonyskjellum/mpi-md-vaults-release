---
title: MPI_TYPE_SIZE
c_name: MPI_Type_size
lis_name: MPI_TYPE_SIZE
chapter: datatypes
aliases: [MPI_TYPE_SIZE, MPI_Type_size]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_SIZE

**C**
```c
int MPI_Type_size(MPI_Datatype datatype, int *size)
```

**C++**
```cpp
int MPI::Datatype::Get_size() const
```

| Parameter | Intent | Description |
|---|---|---|
| `datatype` | IN | datatype (handle) |
| `size` | OUT | datatype size (integer) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_SIZE(DATATYPE, SIZE, IERROR)
  INTEGER DATATYPE, SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.

---
title: MPI_TYPE_CREATE_F90_INTEGER
c_name: MPI_Type_create_f90_integer
lis_name: MPI_TYPE_CREATE_F90_INTEGER
chapter: binding
aliases: [MPI_TYPE_CREATE_F90_INTEGER, MPI_Type_create_f90_integer]
tags: [mpi/function, mpi/binding]
---

# MPI_TYPE_CREATE_F90_INTEGER

**C**
```c
int MPI_Type_create_f90_integer(int r, MPI_Datatype *newtype)
```

**C++**
```cpp
static MPI::Datatype MPI::Datatype::Create_f90_integer(int r)
```

| Parameter | Intent | Description |
|---|---|---|
| `r` | IN | decimal exponent range, i.e., number of decimal digits (integer) |
| `newtype` | OUT | the requested MPI datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_F90_INTEGER(R, NEWTYPE, IERROR)
  INTEGER R, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[binding]] for the normative text.

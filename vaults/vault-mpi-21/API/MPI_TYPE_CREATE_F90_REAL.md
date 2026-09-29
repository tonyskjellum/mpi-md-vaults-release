---
title: MPI_TYPE_CREATE_F90_REAL
c_name: MPI_Type_create_f90_real
lis_name: MPI_TYPE_CREATE_F90_REAL
chapter: binding
aliases: [MPI_TYPE_CREATE_F90_REAL, MPI_Type_create_f90_real]
tags: [mpi/function, mpi/binding]
---

# MPI_TYPE_CREATE_F90_REAL

**C**
```c
int MPI_Type_create_f90_real(int p, int r, MPI_Datatype *newtype)
```

**C++**
```cpp
static MPI::Datatype MPI::Datatype::Create_f90_real(int p, int r)
```

| Parameter | Intent | Description |
|---|---|---|
| `p` | IN | precision, in decimal digits (integer) |
| `r` | IN | decimal exponent range (integer) |
| `newtype` | OUT | the requested MPI datatype (handle) |

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_F90_REAL(P, R, NEWTYPE, IERROR)
  INTEGER P, R, NEWTYPE, IERROR
```


> [!info] Semantics
> See the chapter note [[binding]] for the normative text.

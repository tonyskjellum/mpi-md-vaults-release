---
title: MPI_ADD_ERROR_CLASS
c_name: MPI_Add_error_class
lis_name: MPI_ADD_ERROR_CLASS
chapter: ei
aliases: [MPI_ADD_ERROR_CLASS, MPI_Add_error_class]
tags: [mpi/function, mpi/ei]
---

# MPI_ADD_ERROR_CLASS

**C**
```c
int MPI_Add_error_class(int *errorclass)
```

**C++**
```cpp
int MPI::Add_error_class()
```

| Parameter | Intent | Description |
|---|---|---|
| `errorclass` | OUT | value for the new error class (integer) |

**Fortran (mpif.h)**
```fortran
MPI_ADD_ERROR_CLASS(ERRORCLASS, IERROR)
  INTEGER ERRORCLASS, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

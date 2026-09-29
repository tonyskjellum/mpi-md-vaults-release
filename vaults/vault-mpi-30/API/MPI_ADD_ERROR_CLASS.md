---
title: MPI_ADD_ERROR_CLASS
c_name: MPI_Add_error_class
lis_name: MPI_ADD_ERROR_CLASS
chapter: inquiry
aliases: [MPI_ADD_ERROR_CLASS, MPI_Add_error_class]
tags: [mpi/function, mpi/inquiry]
---

# MPI_ADD_ERROR_CLASS

**C**
```c
int MPI_Add_error_class(int *errorclass)
```

| Parameter | Intent | Description |
|---|---|---|
| `errorclass` | OUT | value for the new error class (integer) |

**Fortran 2008**
```fortran
MPI_Add_error_class(errorclass, ierror) BIND(C)
  INTEGER, INTENT(OUT) :: errorclass
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ADD_ERROR_CLASS(ERRORCLASS, IERROR)
  INTEGER ERRORCLASS, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

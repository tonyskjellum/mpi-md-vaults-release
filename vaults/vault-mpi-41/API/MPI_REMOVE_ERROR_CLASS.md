---
title: MPI_REMOVE_ERROR_CLASS
c_name: MPI_Remove_error_class
lis_name: MPI_REMOVE_ERROR_CLASS
chapter: inquiry
aliases: [MPI_REMOVE_ERROR_CLASS, MPI_Remove_error_class]
tags: [mpi/function, mpi/inquiry]
---

# MPI_REMOVE_ERROR_CLASS

**C**
```c
int MPI_Remove_error_class(int errorclass)
```

| Parameter | Intent | Description |
|---|---|---|
| `errorclass` | IN | value for the error class to remove (integer) |

**Fortran 2008**
```fortran
MPI_Remove_error_class(errorclass, ierror)
  INTEGER, INTENT(IN) :: errorclass
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_REMOVE_ERROR_CLASS(ERRORCLASS, IERROR)
  INTEGER ERRORCLASS, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

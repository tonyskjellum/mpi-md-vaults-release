---
title: MPI_ERROR_CLASS
c_name: MPI_Error_class
lis_name: MPI_ERROR_CLASS
chapter: inquiry
aliases: [MPI_ERROR_CLASS, MPI_Error_class]
tags: [mpi/function, mpi/inquiry]
---

# MPI_ERROR_CLASS

**C**
```c
int MPI_Error_class(int errorcode, int *errorclass)
```

| Parameter | Intent | Description |
|---|---|---|
| `errorcode` | IN | Error code returned by an MPI routine |
| `errorclass` | OUT | Error class associated with errorcode |

**Fortran (mpif.h)**
```fortran
MPI_ERROR_CLASS(ERRORCODE, ERRORCLASS, IERROR)
  INTEGER ERRORCODE, ERRORCLASS, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

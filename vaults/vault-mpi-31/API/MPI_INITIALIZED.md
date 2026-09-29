---
title: MPI_INITIALIZED
c_name: MPI_Initialized
lis_name: MPI_INITIALIZED
chapter: inquiry
aliases: [MPI_INITIALIZED, MPI_Initialized]
tags: [mpi/function, mpi/inquiry]
---

# MPI_INITIALIZED

**C**
```c
int MPI_Initialized(int *flag)
```



**Fortran 2008**
```fortran
MPI_Initialized(flag, ierror)
  LOGICAL, INTENT(OUT) :: flag
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INITIALIZED(FLAG, IERROR)
  LOGICAL FLAG
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

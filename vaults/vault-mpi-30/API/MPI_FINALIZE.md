---
title: MPI_FINALIZE
c_name: MPI_Finalize
lis_name: MPI_FINALIZE
chapter: inquiry
aliases: [MPI_FINALIZE, MPI_Finalize]
tags: [mpi/function, mpi/inquiry]
---

# MPI_FINALIZE

**C**
```c
int MPI_Finalize(void)
```



**Fortran 2008**
```fortran
MPI_Finalize(ierror) BIND(C)
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FINALIZE(IERROR)
  INTEGER IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

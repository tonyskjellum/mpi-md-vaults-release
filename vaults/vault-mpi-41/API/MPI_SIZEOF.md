---
title: MPI_SIZEOF
c_name: MPI_Sizeof
lis_name: MPI_SIZEOF
chapter: deprecated
aliases: [MPI_SIZEOF, MPI_Sizeof]
tags: [mpi/function, mpi/deprecated]
---

# MPI_SIZEOF

| Parameter | Intent | Description |
|---|---|---|
| `x` | IN | a Fortran variable of numeric intrinsic type (choice) |
| `size` | OUT | size of machine representation of that type (integer) |

**Fortran 2008**
```fortran
MPI_Sizeof(x, size, ierror)
  TYPE(*), DIMENSION(..) :: x
  INTEGER, INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SIZEOF(X, SIZE, IERROR)
  <type> X
  INTEGER SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.

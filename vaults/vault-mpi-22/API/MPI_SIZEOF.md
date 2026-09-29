---
title: MPI_SIZEOF
c_name: MPI_SIZEOF
lis_name: MPI_SIZEOF
chapter: binding
aliases: [MPI_SIZEOF]
tags: [mpi/function, mpi/binding]
---

# MPI_SIZEOF

| Parameter | Intent | Description |
|---|---|---|
| `x` | IN | a Fortran variable of numeric intrinsic type (choice) |
| `size` | OUT | size of machine representation of that type (integer) |

**Fortran (mpif.h)**
```fortran
MPI_SIZEOF(X, SIZE, IERROR)
  <type> X
  INTEGER SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[binding]] for the normative text.

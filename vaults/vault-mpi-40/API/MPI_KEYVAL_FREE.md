---
title: MPI_KEYVAL_FREE
c_name: MPI_Keyval_free
lis_name: MPI_KEYVAL_FREE
chapter: deprecated
aliases: [MPI_KEYVAL_FREE, MPI_Keyval_free]
tags: [mpi/function, mpi/deprecated]
---

# MPI_KEYVAL_FREE

**C**
```c
int MPI_Keyval_free(int *keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `keyval` | INOUT | Frees the integer key value (integer) |

**Fortran (mpif.h)**
```fortran
MPI_KEYVAL_FREE(KEYVAL, IERROR)
  INTEGER KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.

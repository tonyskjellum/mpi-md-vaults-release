---
title: MPI_TYPE_FREE_KEYVAL
c_name: MPI_Type_free_keyval
lis_name: MPI_TYPE_FREE_KEYVAL
chapter: context
aliases: [MPI_TYPE_FREE_KEYVAL, MPI_Type_free_keyval]
tags: [mpi/function, mpi/context]
---

# MPI_TYPE_FREE_KEYVAL

**C**
```c
int MPI_Type_free_keyval(int *type_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `type_keyval` | INOUT | key value (integer) |

**Fortran 2008**
```fortran
MPI_Type_free_keyval(type_keyval, ierror) BIND(C)
  INTEGER, INTENT(INOUT) :: type_keyval
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_FREE_KEYVAL(TYPE_KEYVAL, IERROR)
  INTEGER TYPE_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

---
title: MPI_ATTR_PUT
c_name: MPI_Attr_put
lis_name: MPI_ATTR_PUT
chapter: deprecated
aliases: [MPI_ATTR_PUT, MPI_Attr_put]
tags: [mpi/function, mpi/deprecated]
---

# MPI_ATTR_PUT

**C**
```c
int MPI_Attr_put(MPI_Comm comm, int keyval, void* attribute_val)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator to which attribute will be attached (handle) |
| `keyval` | IN | key value, as returned by `MPI_KEYVAL_CREATE` (integer) |
| `attribute_val` | IN | attribute value |

**Fortran (mpif.h)**
```fortran
MPI_ATTR_PUT(COMM, KEYVAL, ATTRIBUTE_VAL, IERROR)
  INTEGER COMM, KEYVAL, ATTRIBUTE_VAL, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.

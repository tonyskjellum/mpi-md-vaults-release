---
title: MPI_ATTR_GET
c_name: MPI_Attr_get
lis_name: MPI_ATTR_GET
chapter: context
aliases: [MPI_ATTR_GET, MPI_Attr_get]
tags: [mpi/function, mpi/context]
---

# MPI_ATTR_GET

**C**
```c
int MPI_Attr_get(MPI_Comm comm, int keyval, void *attribute_val, int *flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator to which attribute is attached (handle) |
| `keyval` | IN | key value (integer) |
| `attribute_val` | OUT | attribute value, unless `flag` = false |
| `flag` | OUT | `true` if an attribute value was extracted; `false` if no attribute is associated with the key |

**Fortran (mpif.h)**
```fortran
MPI_ATTR_GET(COMM, KEYVAL, ATTRIBUTE_VAL, FLAG, IERROR)
  INTEGER COMM, KEYVAL, ATTRIBUTE_VAL, IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

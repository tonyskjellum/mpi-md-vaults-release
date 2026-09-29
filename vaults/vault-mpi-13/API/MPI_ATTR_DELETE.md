---
title: MPI_ATTR_DELETE
c_name: MPI_Attr_delete
lis_name: MPI_ATTR_DELETE
chapter: context
aliases: [MPI_ATTR_DELETE, MPI_Attr_delete]
tags: [mpi/function, mpi/context]
---

# MPI_ATTR_DELETE

**C**
```c
int MPI_Attr_delete(MPI_Comm comm, int keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator to which attribute is attached (handle) |
| `keyval` | IN | The key value of the deleted attribute (integer) |

**Fortran (mpif.h)**
```fortran
MPI_ATTR_DELETE(COMM, KEYVAL, IERROR)
  INTEGER COMM, KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

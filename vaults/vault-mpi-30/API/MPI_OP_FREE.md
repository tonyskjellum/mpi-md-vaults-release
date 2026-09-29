---
title: MPI_OP_FREE
c_name: MPI_Op_free
lis_name: MPI_OP_FREE
chapter: coll
aliases: [MPI_OP_FREE, MPI_Op_free]
tags: [mpi/function, mpi/coll]
---

# MPI_OP_FREE

**C**
```c
int MPI_Op_free(MPI_Op *op)
```

| Parameter | Intent | Description |
|---|---|---|
| `op` | INOUT | operation (handle) |

**Fortran 2008**
```fortran
MPI_Op_free(op, ierror) BIND(C)
  TYPE(MPI_Op), INTENT(INOUT) :: op
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_OP_FREE(OP, IERROR)
  INTEGER OP, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

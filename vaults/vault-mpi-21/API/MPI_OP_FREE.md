---
title: MPI_OP_FREE
c_name: MPI_op_free
lis_name: MPI_OP_FREE
chapter: coll
aliases: [MPI_OP_FREE, MPI_op_free]
tags: [mpi/function, mpi/coll]
---

# MPI_OP_FREE

**C**
```c
int MPI_op_free( MPI_Op *op)
```

**C++**
```cpp
void MPI::Op::Free()
```

| Parameter | Intent | Description |
|---|---|---|
| `op` | INOUT | operation (handle) |

**Fortran (mpif.h)**
```fortran
MPI_OP_FREE( OP, IERROR)
  INTEGER OP, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

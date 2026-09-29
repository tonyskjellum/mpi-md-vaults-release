---
title: MPI_OP_COMMUTATIVE
c_name: MPI_Op_commutative
lis_name: MPI_OP_COMMUTATIVE
chapter: coll
aliases: [MPI_OP_COMMUTATIVE, MPI_Op_commutative]
tags: [mpi/function, mpi/coll]
---

# MPI_OP_COMMUTATIVE

**C**
```c
int MPI_Op_commutative(MPI_Op op, int *commute)
```

**C++**
```cpp
bool MPI::Op::Is_commutative() const
```

| Parameter | Intent | Description |
|---|---|---|
| `op` | IN | operation (handle) |
| `commute` | OUT | `true` if `op` is commutative, `false` otherwise (logical) |

**Fortran (mpif.h)**
```fortran
MPI_OP_COMMUTATIVE(OP, COMMUTE, IERROR)
  LOGICAL COMMUTE
  INTEGER OP, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

---
title: MPI_OP_CREATE
c_name: MPI_Op_create
lis_name: MPI_OP_CREATE
chapter: coll
aliases: [MPI_OP_CREATE, MPI_Op_create, MPI_User_function]
tags: [mpi/function, mpi/coll]
---

# MPI_OP_CREATE

**C**
```c
int MPI_Op_create(MPI_User_function *function, int commute, MPI_Op *op)
typedef void MPI_User_function(void *invec, void *inoutvec, int *len, MPI_Datatype *datatype);
```

**C++**
```cpp
void MPI::Op::Init(MPI::User_function* function, bool commute)
typedef void MPI::User_function(const void* invec, void *inoutvec, int len, const Datatype& datatype);
```

| Parameter | Intent | Description |
|---|---|---|
| `function` | IN | user defined function (function) |
| `commute` | IN | `true` if commutative; `false` otherwise. |
| `op` | OUT | operation (handle) |

**Fortran (mpif.h)**
```fortran
MPI_OP_CREATE( FUNCTION, COMMUTE, OP, IERROR)
  EXTERNAL FUNCTION
  LOGICAL COMMUTE
  INTEGER OP, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

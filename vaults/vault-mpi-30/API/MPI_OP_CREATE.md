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
int MPI_Op_create(MPI_User_function* user_fn, int commute, MPI_Op* op)
typedef void MPI_User_function(void* invec, void* inoutvec, int *len, MPI_Datatype *datatype);
```

| Parameter | Intent | Description |
|---|---|---|
| `user_fn` | IN | user defined function (function) |
| `commute` | IN | `true` if commutative; `false` otherwise. |
| `op` | OUT | operation (handle) |

**Fortran 2008**
```fortran
MPI_Op_create(user_fn, commute, op, ierror) BIND(C)
  PROCEDURE(MPI_User_function) :: user_fn
  LOGICAL, INTENT(IN) :: commute
  TYPE(MPI_Op), INTENT(OUT) :: op
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_OP_CREATE( USER_FN, COMMUTE, OP, IERROR)
  EXTERNAL USER_FN
  LOGICAL COMMUTE
  INTEGER OP, IERROR
```


> [!info] Semantics
> See the chapter note [[coll]] for the normative text.

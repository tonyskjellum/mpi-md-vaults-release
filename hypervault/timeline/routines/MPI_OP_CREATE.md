---
title: MPI_OP_CREATE
c_name: MPI_Op_create
chapter: coll
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_OP_CREATE, MPI_Op_create]
tags: [mpi/routine, mpi/coll]
---

# MPI_OP_CREATE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_OP_CREATE|MPI-1.3]] · [[versions/v21/API/MPI_OP_CREATE|MPI-2.1]] Δ · [[versions/v22/API/MPI_OP_CREATE|MPI-2.2]] · [[versions/v30/API/MPI_OP_CREATE|MPI-3.0]] Δ · [[versions/v31/API/MPI_OP_CREATE|MPI-3.1]] Δ · [[versions/v40/API/MPI_OP_CREATE|MPI-4.0]] Δ · [[versions/v41/API/MPI_OP_CREATE|MPI-4.1]] · [[versions/v50/API/MPI_OP_CREATE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_Op_create(MPI_User_function *function, int commute, MPI_Op *op)
```

**MPI-2.1–MPI-2.2**
```c
int MPI_Op_create(MPI_User_function *function, int commute, MPI_Op *op)
typedef void MPI_User_function(void *invec, void *inoutvec, int *len, MPI_Datatype *datatype);
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Op_create(MPI_User_function* user_fn, int commute, MPI_Op* op)
typedef void MPI_User_function(void* invec, void* inoutvec, int *len, MPI_Datatype *datatype);
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Op_create(MPI_User_function *user_fn, int commute, MPI_Op *op)
int MPI_Op_create_c(MPI_User_function_c *user_fn, int commute, MPI_Op *op)
typedef void MPI_User_function(void *invec, void *inoutvec, int *len, MPI_Datatype *datatype);
typedef void MPI_User_function_c(void *invec, void *inoutvec, MPI_Count *len, MPI_Datatype *datatype);
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Op::Init(MPI::User_function* function, bool commute)
typedef void MPI::User_function(const void* invec, void *inoutvec, int len, const Datatype& datatype);
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Op_create(user_fn, commute, op, ierror) BIND(C)
    PROCEDURE(MPI_User_function) :: user_fn
    LOGICAL, INTENT(IN) :: commute
    TYPE(MPI_Op), INTENT(OUT) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Op_create(user_fn, commute, op, ierror)
    PROCEDURE(MPI_User_function) :: user_fn
    LOGICAL, INTENT(IN) :: commute
    TYPE(MPI_Op), INTENT(OUT) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Op_create(user_fn, commute, op, ierror)
    PROCEDURE(MPI_User_function) :: user_fn
    LOGICAL, INTENT(IN) :: commute
    TYPE(MPI_Op), INTENT(OUT) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Op_create_c(user_fn, commute, op, ierror) !(_c)
    PROCEDURE(MPI_User_function_c) :: user_fn
    LOGICAL, INTENT(IN) :: commute
    TYPE(MPI_Op), INTENT(OUT) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-2.2**
```fortran
MPI_OP_CREATE( FUNCTION, COMMUTE, OP, IERROR)
    EXTERNAL FUNCTION
    LOGICAL COMMUTE
    INTEGER OP, IERROR
```

**MPI-3.0–MPI-3.1**
```fortran
MPI_OP_CREATE( USER_FN, COMMUTE, OP, IERROR)
    EXTERNAL USER_FN
    LOGICAL COMMUTE
    INTEGER OP, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_OP_CREATE(USER_FN, COMMUTE, OP, IERROR)
    EXTERNAL USER_FN
    LOGICAL COMMUTE
    INTEGER OP, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `function` | IN | **MPI-1.3–MPI-2.2:** user defined function (function)<br>_MPI-3.0–MPI-5.0: absent_ |
| `commute` | IN | **MPI-1.3–MPI-5.0:** `true` if commutative; `false` otherwise. |
| `op` | OUT | **MPI-1.3–MPI-5.0:** operation (handle) |
| `user_fn` | IN | _MPI-1.3–MPI-2.2: absent_<br>**MPI-3.0–MPI-5.0:** user defined function (function) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_OP_CREATE|API note]] · chapter [[versions/v13/sections/coll|coll]]
- MPI-2.1: [[versions/v21/API/MPI_OP_CREATE|API note]] · chapter [[versions/v21/sections/coll|coll]]
- MPI-2.2: [[versions/v22/API/MPI_OP_CREATE|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_OP_CREATE|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_OP_CREATE|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_OP_CREATE|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_OP_CREATE|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_OP_CREATE|API note]] · chapter [[versions/v50/sections/coll|coll]]

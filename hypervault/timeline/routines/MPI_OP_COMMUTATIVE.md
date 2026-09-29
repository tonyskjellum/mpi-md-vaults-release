---
title: MPI_OP_COMMUTATIVE
c_name: MPI_Op_commutative
chapter: coll
introduced: "MPI-2.2"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_OP_COMMUTATIVE, MPI_Op_commutative]
tags: [mpi/routine, mpi/coll]
---

# MPI_OP_COMMUTATIVE

**Introduced** in MPI-2.2.

Releases: [[versions/v22/API/MPI_OP_COMMUTATIVE|MPI-2.2]] · [[versions/v30/API/MPI_OP_COMMUTATIVE|MPI-3.0]] Δ · [[versions/v31/API/MPI_OP_COMMUTATIVE|MPI-3.1]] Δ · [[versions/v40/API/MPI_OP_COMMUTATIVE|MPI-4.0]] Δ · [[versions/v41/API/MPI_OP_COMMUTATIVE|MPI-4.1]] · [[versions/v50/API/MPI_OP_COMMUTATIVE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.2–MPI-5.0**
```c
int MPI_Op_commutative(MPI_Op op, int *commute)
```

## C++

**MPI-2.2**
```c
bool MPI::Op::Is_commutative() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Op_commutative(op, commute, ierror) BIND(C)
    TYPE(MPI_Op), INTENT(IN) :: op
    LOGICAL, INTENT(OUT) :: commute
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Op_commutative(op, commute, ierror)
    TYPE(MPI_Op), INTENT(IN) :: op
    LOGICAL, INTENT(OUT) :: commute
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.2–MPI-3.1**
```fortran
MPI_OP_COMMUTATIVE(OP, COMMUTE, IERROR)
    LOGICAL COMMUTE
    INTEGER OP, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_OP_COMMUTATIVE(OP, COMMUTE, IERROR)
    INTEGER OP, IERROR
    LOGICAL COMMUTE
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `op` | IN | **MPI-2.2–MPI-5.0:** operation (handle) |
| `commute` | OUT | **MPI-2.2–MPI-5.0:** `true` if `op` is commutative, `false` otherwise (logical) |

## Named in the change log of

[[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.2: [[versions/v22/API/MPI_OP_COMMUTATIVE|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_OP_COMMUTATIVE|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_OP_COMMUTATIVE|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_OP_COMMUTATIVE|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_OP_COMMUTATIVE|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_OP_COMMUTATIVE|API note]] · chapter [[versions/v50/sections/coll|coll]]

---
title: MPI_OP_FREE
c_name: MPI_Op_free
chapter: coll
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_OP_FREE, MPI_Op_free]
tags: [mpi/routine, mpi/coll]
---

# MPI_OP_FREE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_OP_FREE|MPI-1.3]] · [[versions/v20/API/MPI_OP_FREE|MPI-2.0]] · [[versions/v21/API/MPI_OP_FREE|MPI-2.1]] Δ · [[versions/v22/API/MPI_OP_FREE|MPI-2.2]] · [[versions/v30/API/MPI_OP_FREE|MPI-3.0]] Δ · [[versions/v31/API/MPI_OP_FREE|MPI-3.1]] Δ · [[versions/v40/API/MPI_OP_FREE|MPI-4.0]] · [[versions/v41/API/MPI_OP_FREE|MPI-4.1]] · [[versions/v50/API/MPI_OP_FREE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_op_free( MPI_Op *op)
```

**MPI-2.0**
_(no C binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI_op_free( MPI_Op *op)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Op_free(MPI_Op *op)
```

## C++

**MPI-1.3–MPI-2.0**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Op::Free()
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Op_free(op, ierror) BIND(C)
    TYPE(MPI_Op), INTENT(INOUT) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Op_free(op, ierror)
    TYPE(MPI_Op), INTENT(INOUT) :: op
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3**
```fortran
MPI_OP_FREE( OP, IERROR)
    INTEGER OP, IERROR
```

**MPI-2.0**
_(no mpif.h binding)_

**MPI-2.1–MPI-2.2**
```fortran
MPI_OP_FREE( OP, IERROR)
    INTEGER OP, IERROR
```

**MPI-3.0–MPI-5.0**
```fortran
MPI_OP_FREE(OP, IERROR)
    INTEGER OP, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `op` | IN/INOUT | **MPI-1.3:** operation (handle)<br>**MPI-2.0:** operation (handle)<br>**MPI-2.1–MPI-5.0:** operation (handle) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_OP_FREE|API note]] · chapter [[versions/v13/sections/coll|coll]]
- MPI-2.0: [[versions/v20/API/MPI_OP_FREE|API note]] · chapter [[versions/v20/sections/misc-1.2|misc-1.2]]
- MPI-2.1: [[versions/v21/API/MPI_OP_FREE|API note]] · chapter [[versions/v21/sections/coll|coll]]
- MPI-2.2: [[versions/v22/API/MPI_OP_FREE|API note]] · chapter [[versions/v22/sections/coll|coll]]
- MPI-3.0: [[versions/v30/API/MPI_OP_FREE|API note]] · chapter [[versions/v30/sections/coll|coll]]
- MPI-3.1: [[versions/v31/API/MPI_OP_FREE|API note]] · chapter [[versions/v31/sections/coll|coll]]
- MPI-4.0: [[versions/v40/API/MPI_OP_FREE|API note]] · chapter [[versions/v40/sections/coll|coll]]
- MPI-4.1: [[versions/v41/API/MPI_OP_FREE|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_OP_FREE|API note]] · chapter [[versions/v50/sections/coll|coll]]

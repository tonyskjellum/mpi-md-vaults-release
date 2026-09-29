---
title: MPI_PACK_SIZE
c_name: MPI_Pack_size
chapter: datatypes
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PACK_SIZE, MPI_Pack_size]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_PACK_SIZE

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_PACK_SIZE|MPI-1.3]] · [[versions/v21/API/MPI_PACK_SIZE|MPI-2.1]] Δ · [[versions/v22/API/MPI_PACK_SIZE|MPI-2.2]] · [[versions/v30/API/MPI_PACK_SIZE|MPI-3.0]] Δ · [[versions/v31/API/MPI_PACK_SIZE|MPI-3.1]] Δ · [[versions/v40/API/MPI_PACK_SIZE|MPI-4.0]] Δ · [[versions/v41/API/MPI_PACK_SIZE|MPI-4.1]] · [[versions/v50/API/MPI_PACK_SIZE|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-3.1**
```c
int MPI_Pack_size(int incount, MPI_Datatype datatype, MPI_Comm comm, int *size)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Pack_size(int incount, MPI_Datatype datatype, MPI_Comm comm, int *size)
int MPI_Pack_size_c(MPI_Count incount, MPI_Datatype datatype, MPI_Comm comm, MPI_Count *size)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI::Datatype::Pack_size(int incount, const MPI::Comm& comm) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Pack_size(incount, datatype, comm, size, ierror) BIND(C)
    INTEGER, INTENT(IN) :: incount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Pack_size(incount, datatype, comm, size, ierror)
    INTEGER, INTENT(IN) :: incount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Pack_size(incount, datatype, comm, size, ierror)
    INTEGER, INTENT(IN) :: incount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Pack_size(incount, datatype, comm, size, ierror) !(_c)
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: incount
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_PACK_SIZE(INCOUNT, DATATYPE, COMM, SIZE, IERROR)
    INTEGER INCOUNT, DATATYPE, COMM, SIZE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `incount` | IN | **MPI-1.3:** count argument to packing call (integer)<br>**MPI-2.1–MPI-4.1:** count argument to packing call (non-negative integer)<br>**MPI-5.0:** count argument to packing call (nonnegative integer) |
| `datatype` | IN | **MPI-1.3–MPI-5.0:** datatype argument to packing call (handle) |
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator argument to packing call (handle) |
| `size` | OUT | **MPI-1.3:** upper bound on size of packed message, in bytes (integer)<br>**MPI-2.1–MPI-4.1:** upper bound on size of packed message, in bytes (non-negative integer)<br>**MPI-5.0:** upper bound on size of packed message, in bytes (nonnegative integer) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_PACK_SIZE|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_PACK_SIZE|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_PACK_SIZE|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_PACK_SIZE|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_PACK_SIZE|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_PACK_SIZE|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_PACK_SIZE|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_PACK_SIZE|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]

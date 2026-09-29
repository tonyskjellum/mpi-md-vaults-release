---
title: MPI_TYPE_MATCH_SIZE
c_name: MPI_Type_match_size
chapter: binding
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_MATCH_SIZE, MPI_Type_match_size]
tags: [mpi/routine, mpi/binding]
---

# MPI_TYPE_MATCH_SIZE

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_MATCH_SIZE|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_MATCH_SIZE|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_MATCH_SIZE|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_MATCH_SIZE|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_MATCH_SIZE|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_MATCH_SIZE|MPI-4.0]] · [[versions/v41/API/MPI_TYPE_MATCH_SIZE|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_MATCH_SIZE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *type)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *datatype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
static MPI::Datatype MPI::Datatype::Match_size(int typeclass, int size)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_match_size(typeclass, size, datatype, ierror) BIND(C)
    INTEGER, INTENT(IN) :: typeclass, size
    TYPE(MPI_Datatype), INTENT(OUT) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Type_match_size(typeclass, size, datatype, ierror)
    INTEGER, INTENT(IN) :: typeclass, size
    TYPE(MPI_Datatype), INTENT(OUT) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-2.2**
```fortran
MPI_TYPE_MATCH_SIZE(TYPECLASS, SIZE, TYPE, IERROR)
    INTEGER TYPECLASS, SIZE, TYPE, IERROR
```

**MPI-3.0–MPI-5.0**
```fortran
MPI_TYPE_MATCH_SIZE(TYPECLASS, SIZE, DATATYPE, IERROR)
    INTEGER TYPECLASS, SIZE, DATATYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `typeclass` | IN | **MPI-2.0–MPI-5.0:** generic type specifier (integer) |
| `size` | IN | **MPI-2.0–MPI-5.0:** size, in bytes, of representation (integer) |
| `type` | OUT | **MPI-2.0–MPI-2.2:** datatype with correct type, size (handle)<br>_MPI-3.0–MPI-5.0: absent_ |
| `datatype` | OUT | _MPI-2.0–MPI-2.2: absent_<br>**MPI-3.0–MPI-5.0:** datatype with correct type, size (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_MATCH_SIZE|API note]] · chapter [[versions/v20/sections/binding|binding]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_MATCH_SIZE|API note]] · chapter [[versions/v21/sections/binding|binding]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_MATCH_SIZE|API note]] · chapter [[versions/v22/sections/binding|binding]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_MATCH_SIZE|API note]] · chapter [[versions/v30/sections/binding|binding]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_MATCH_SIZE|API note]] · chapter [[versions/v31/sections/binding|binding]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_MATCH_SIZE|API note]] · chapter [[versions/v40/sections/binding|binding]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_MATCH_SIZE|API note]] · chapter [[versions/v41/sections/binding|binding]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_MATCH_SIZE|API note]] · chapter [[versions/v50/sections/binding|binding]]

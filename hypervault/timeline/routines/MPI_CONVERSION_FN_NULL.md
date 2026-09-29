---
title: MPI_CONVERSION_FN_NULL
c_name: MPI_CONVERSION_FN_NULL
chapter: appLang-C
introduced: "MPI-3.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_CONVERSION_FN_NULL]
tags: [mpi/routine, mpi/appLang-C]
---

# MPI_CONVERSION_FN_NULL

**Introduced** in MPI-3.1.

Releases: [[versions/v31/API/MPI_CONVERSION_FN_NULL|MPI-3.1]] · [[versions/v40/API/MPI_CONVERSION_FN_NULL|MPI-4.0]] Δ · [[versions/v41/API/MPI_CONVERSION_FN_NULL|MPI-4.1]] · [[versions/v50/API/MPI_CONVERSION_FN_NULL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.1–MPI-5.0**
```c
int MPI_CONVERSION_FN_NULL(void *userbuf, MPI_Datatype datatype, int count, void *filebuf, MPI_Offset position, void *extra_state)
```

## Fortran 2008

**MPI-3.1–MPI-5.0**
```fortran
MPI_CONVERSION_FN_NULL(userbuf, datatype, count, filebuf, position, extra_state, ierror)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(C_PTR), VALUE :: userbuf, filebuf
    TYPE(MPI_Datatype) :: datatype
    INTEGER :: count, ierror
    INTEGER(KIND=MPI_OFFSET_KIND) :: position
    INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state
```

## mpif.h

**MPI-3.1**
```fortran
MPI_CONVERSION_FN_NULL(USERBUF, DATATYPE, COUNT, FILEBUF, POSITION, EXTRA_STATE, IERROR)
    <TYPE> USERBUF(*), FILEBUF(*)
    INTEGER COUNT, DATATYPE, IERROR
    INTEGER(KIND=MPI_OFFSET_KIND) POSITION
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_CONVERSION_FN_NULL(USERBUF, DATATYPE, COUNT, FILEBUF, POSITION, EXTRA_STATE, IERROR)
    <TYPE> USERBUF(*), FILEBUF(*)
    INTEGER DATATYPE, COUNT, IERROR
    INTEGER(KIND=MPI_OFFSET_KIND) POSITION
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.1: [[versions/v31/API/MPI_CONVERSION_FN_NULL|API note]] · chapter [[versions/v31/sections/appLang-C|appLang-C]]
- MPI-4.0: [[versions/v40/API/MPI_CONVERSION_FN_NULL|API note]] · chapter [[versions/v40/sections/appLang-C|appLang-C]]
- MPI-4.1: [[versions/v41/API/MPI_CONVERSION_FN_NULL|API note]] · chapter [[versions/v41/sections/appLang-C|appLang-C]]
- MPI-5.0: [[versions/v50/API/MPI_CONVERSION_FN_NULL|API note]] · chapter [[versions/v50/sections/appLang-C|appLang-C]]

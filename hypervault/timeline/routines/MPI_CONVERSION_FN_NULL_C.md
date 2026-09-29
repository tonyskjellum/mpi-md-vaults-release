---
title: MPI_CONVERSION_FN_NULL_C
c_name: MPI_CONVERSION_FN_NULL_C
chapter: appLang-C
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_CONVERSION_FN_NULL_C]
tags: [mpi/routine, mpi/appLang-C]
---

# MPI_CONVERSION_FN_NULL_C

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_CONVERSION_FN_NULL_C|MPI-4.0]] · [[versions/v41/API/MPI_CONVERSION_FN_NULL_C|MPI-4.1]] · [[versions/v50/API/MPI_CONVERSION_FN_NULL_C|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_CONVERSION_FN_NULL_C(void *userbuf, MPI_Datatype datatype, MPI_Count count, void *filebuf, MPI_Offset position, void *extra_state)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_CONVERSION_FN_NULL_C(userbuf, datatype, count, filebuf, position, extra_state, ierror) !(_c)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(C_PTR), VALUE :: userbuf, filebuf
    TYPE(MPI_Datatype) :: datatype
    INTEGER(KIND=MPI_COUNT_KIND) :: count
    INTEGER(KIND=MPI_OFFSET_KIND) :: position
    INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state
    INTEGER :: ierror
```

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_CONVERSION_FN_NULL_C|API note]] · chapter [[versions/v40/sections/appLang-C|appLang-C]]
- MPI-4.1: [[versions/v41/API/MPI_CONVERSION_FN_NULL_C|API note]] · chapter [[versions/v41/sections/appLang-C|appLang-C]]
- MPI-5.0: [[versions/v50/API/MPI_CONVERSION_FN_NULL_C|API note]] · chapter [[versions/v50/sections/appLang-C|appLang-C]]

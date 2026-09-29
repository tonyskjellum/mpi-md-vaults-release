---
title: MPI_TYPE_CREATE_HINDEXED_BLOCK
c_name: MPI_Type_create_hindexed_block
chapter: datatypes
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_CREATE_HINDEXED_BLOCK, MPI_Type_create_hindexed_block]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_CREATE_HINDEXED_BLOCK

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI-3.0]] · [[versions/v31/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Type_create_hindexed_block(int count, int blocklength, const MPI_Aint array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_create_hindexed_block(int count, int blocklength, const MPI_Aint array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_create_hindexed_block_c(MPI_Count count, MPI_Count blocklength, const MPI_Count array_of_displacements[], MPI_Datatype oldtype, MPI_Datatype *newtype)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Type_create_hindexed_block(count, blocklength, array_of_displacements, oldtype, newtype, ierror) BIND(C)
    INTEGER, INTENT(IN) :: count, blocklength
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_create_hindexed_block(count, blocklength, array_of_displacements, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: count, blocklength
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) ::
    array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_create_hindexed_block(count, blocklength, array_of_displacements, oldtype, newtype, ierror)
    INTEGER, INTENT(IN) :: count, blocklength
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_create_hindexed_block(count, blocklength, array_of_displacements, oldtype, newtype, ierror) !(_c)
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count, blocklength, array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: oldtype
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-5.0**
```fortran
MPI_TYPE_CREATE_HINDEXED_BLOCK(COUNT, BLOCKLENGTH, ARRAY_OF_DISPLACEMENTS, OLDTYPE, NEWTYPE, IERROR)
    INTEGER COUNT, BLOCKLENGTH, OLDTYPE, NEWTYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_DISPLACEMENTS(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-3.0–MPI-3.1:** length of array of displacements (non-negative integer)<br>**MPI-4.0–MPI-4.1:** number of blocks---also number of entries in `array_of_displacements` (non-negative integer)<br>**MPI-5.0:** number of blocks---also number of entries in `array_of_displacements` (nonnegative integer) |
| `blocklength` | IN | **MPI-3.0–MPI-3.1:** size of block (non-negative integer)<br>**MPI-4.0–MPI-4.1:** number of elements in each block (non-negative integer)<br>**MPI-5.0:** number of elements in each block (nonnegative integer) |
| `array_of_displacements` | IN | **MPI-3.0–MPI-3.1:** byte displacement of each block (array of integer)<br>**MPI-4.0–MPI-5.0:** byte displacement of each block (array of integers) |
| `oldtype` | IN | **MPI-3.0–MPI-5.0:** old datatype (handle) |
| `newtype` | OUT | **MPI-3.0–MPI-5.0:** new datatype (handle) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]

---
title: MPI_TYPE_CREATE_STRUCT
c_name: MPI_Type_create_struct
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_CREATE_STRUCT, MPI_Type_create_struct]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_CREATE_STRUCT

**Introduced** in MPI-2.0 · **continues** [[timeline/routines/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]].

Releases: [[versions/v20/API/MPI_TYPE_CREATE_STRUCT|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_CREATE_STRUCT|MPI-2.1]] Δ · [[versions/v22/API/MPI_TYPE_CREATE_STRUCT|MPI-2.2]] Δ · [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_CREATE_STRUCT|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_CREATE_STRUCT|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_CREATE_STRUCT|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_CREATE_STRUCT|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Type_create_struct(int count, int array_of_blocklengths[], MPI_Aint array_of_displacements[], MPI_Datatype array_of_types[], MPI_Datatype *newtype)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_Type_create_struct(int count, const int array_of_blocklengths[], const MPI_Aint array_of_displacements[], const MPI_Datatype array_of_types[], MPI_Datatype *newtype)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_create_struct(int count, const int array_of_blocklengths[], const MPI_Aint array_of_displacements[], const MPI_Datatype array_of_types[], MPI_Datatype *newtype)
int MPI_Type_create_struct_c(MPI_Count count, const MPI_Count array_of_blocklengths[], const MPI_Count array_of_displacements[], const MPI_Datatype array_of_types[], MPI_Datatype *newtype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
static MPI::Datatype MPI::Datatype::Create_struct(int count, const int array_of_blocklengths[], const MPI::Aint array_of_displacements[], const MPI::Datatype array_of_types[])
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_create_struct(count, array_of_blocklengths, array_of_displacements, array_of_types, newtype, ierror) BIND(C)
    INTEGER, INTENT(IN) :: count, array_of_blocklengths(count)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: array_of_types(count)
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_create_struct(count, array_of_blocklengths, array_of_displacements, array_of_types, newtype, ierror)
    INTEGER, INTENT(IN) :: count, array_of_blocklengths(count)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) ::
    array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: array_of_types(count)
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_create_struct(count, array_of_blocklengths, array_of_displacements, array_of_types, newtype, ierror)
    INTEGER, INTENT(IN) :: count, array_of_blocklengths(count)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: array_of_types(count)
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_create_struct(count, array_of_blocklengths, array_of_displacements, array_of_types, newtype, ierror) !(_c)
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count, array_of_blocklengths(count), array_of_displacements(count)
    TYPE(MPI_Datatype), INTENT(IN) :: array_of_types(count)
    TYPE(MPI_Datatype), INTENT(OUT) :: newtype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.0**
```fortran
MPI_TYPE_CREATE_STRUCT(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, ARRAY_OF_TYPES, NEWTYPE, IERROR)
    INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_TYPES(*), NEWTYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_DISPLACEMENTS(*)
```

**MPI-3.1**
```fortran
MPI_TYPE_CREATE_STRUCT(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, ARRAY_OF_TYPES, NEWTYPE, IERROR)
    INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_TYPES(*), NEWTYPE,
    IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_DISPLACEMENTS(*)
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_TYPE_CREATE_STRUCT(COUNT, ARRAY_OF_BLOCKLENGTHS, ARRAY_OF_DISPLACEMENTS, ARRAY_OF_TYPES, NEWTYPE, IERROR)
    INTEGER COUNT, ARRAY_OF_BLOCKLENGTHS(*), ARRAY_OF_TYPES(*), NEWTYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_DISPLACEMENTS(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-2.0:** number of blocks (integer) --- also number of entries in arrays `array_of_types`, `array_of_displacements` and `array_of_blocklengths`<br>**MPI-2.1:** number of blocks (nonnegative integer) --- also number of entries in arrays `array_of_types`, `array_of_displacements` and `array_of_blocklengths`<br>**MPI-2.2–MPI-3.1:** number of blocks (non-negative integer) --- also number of entries in arrays `array_of_types`, `array_of_displacements` and `array_of_blocklengths`<br>**MPI-4.0–MPI-4.1:** number of blocks---also number of entries in arrays `array_of_types`, `array_of_displacements`, and `array_of_blocklengths` (non-negative integer)<br>**MPI-5.0:** number of blocks---also number of entries in arrays `array_of_types`, `array_of_displacements`, and `array_of_blocklengths` (nonnegative integer) |
| `array_of_blocklength` | IN | **MPI-2.0:** number of elements in each block (array of integer)<br>**MPI-2.1:** number of elements in each block (array of nonnegative integer)<br>**MPI-2.2–MPI-3.1:** number of elements in each block (array of non-negative integer)<br>_MPI-4.0–MPI-5.0: absent_ |
| `array_of_displacements` | IN | **MPI-2.0–MPI-3.1:** byte displacement of each block (array of integer)<br>**MPI-4.0–MPI-5.0:** byte displacement of each block (array of integers) |
| `array_of_types` | IN | **MPI-2.0–MPI-3.1:** type of elements in each block (array of handles to datatype objects)<br>**MPI-4.0–MPI-5.0:** type of elements in each block (array of handles) |
| `newtype` | OUT | **MPI-2.0–MPI-5.0:** new datatype (handle) |
| `array_of_blocklengths` | IN | _MPI-2.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-4.1:** number of elements in each block (array of non-negative integers)<br>**MPI-5.0:** number of elements in each block (array of nonnegative integers) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_CREATE_STRUCT|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_CREATE_STRUCT|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_CREATE_STRUCT|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_CREATE_STRUCT|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_CREATE_STRUCT|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_CREATE_STRUCT|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_CREATE_STRUCT|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]

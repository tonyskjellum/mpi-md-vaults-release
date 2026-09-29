---
title: MPI_TYPE_GET_CONTENTS
c_name: MPI_Type_get_contents
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_GET_CONTENTS, MPI_Type_get_contents]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_GET_CONTENTS

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_GET_CONTENTS|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_GET_CONTENTS|MPI-2.1]] Δ · [[versions/v22/API/MPI_TYPE_GET_CONTENTS|MPI-2.2]] Δ · [[versions/v30/API/MPI_TYPE_GET_CONTENTS|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_GET_CONTENTS|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_GET_CONTENTS|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_GET_CONTENTS|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_GET_CONTENTS|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-3.1**
```c
int MPI_Type_get_contents(MPI_Datatype datatype, int max_integers, int max_addresses, int max_datatypes, int array_of_integers[], MPI_Aint array_of_addresses[], MPI_Datatype array_of_datatypes[])
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_get_contents(MPI_Datatype datatype, int max_integers, int max_addresses, int max_datatypes, int array_of_integers[], MPI_Aint array_of_addresses[], MPI_Datatype array_of_datatypes[])
int MPI_Type_get_contents_c(MPI_Datatype datatype, MPI_Count max_integers, MPI_Count max_addresses, MPI_Count max_large_counts, MPI_Count max_datatypes, int array_of_integers[], MPI_Aint array_of_addresses[], MPI_Count array_of_large_counts[], MPI_Datatype array_of_datatypes[])
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Datatype::Get_contents(int max_integers, int max_addresses, int max_datatypes, int array_of_integers[], MPI::Aint array_of_addresses[], MPI::Datatype array_of_datatypes[]) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_get_contents(datatype, max_integers, max_addresses, max_datatypes, array_of_integers, array_of_addresses, array_of_datatypes, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: max_integers, max_addresses, max_datatypes
    INTEGER, INTENT(OUT) :: array_of_integers(max_integers)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: array_of_addresses(max_addresses)
    TYPE(MPI_Datatype), INTENT(OUT) :: array_of_datatypes(max_datatypes)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_get_contents(datatype, max_integers, max_addresses, max_datatypes, array_of_integers, array_of_addresses, array_of_datatypes, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: max_integers, max_addresses, max_datatypes
    INTEGER, INTENT(OUT) :: array_of_integers(max_integers)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: array_of_addresses(max_addresses)
    TYPE(MPI_Datatype), INTENT(OUT) :: array_of_datatypes(max_datatypes)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_get_contents(datatype, max_integers, max_addresses, max_datatypes, array_of_integers, array_of_addresses, array_of_datatypes, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(IN) :: max_integers, max_addresses, max_datatypes
    INTEGER, INTENT(OUT) :: array_of_integers(max_integers)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: array_of_addresses(max_addresses)
    TYPE(MPI_Datatype), INTENT(OUT) :: array_of_datatypes(max_datatypes)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_get_contents(datatype, max_integers, max_addresses, max_large_counts, max_datatypes, array_of_integers, array_of_addresses, array_of_large_counts, array_of_datatypes, ierror) !(_c)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: max_integers, max_addresses, max_large_counts, max_datatypes
    INTEGER, INTENT(OUT) :: array_of_integers(max_integers)
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: array_of_addresses(max_addresses)
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: array_of_large_counts(max_large_counts)
    TYPE(MPI_Datatype), INTENT(OUT) :: array_of_datatypes(max_datatypes)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_TYPE_GET_CONTENTS(DATATYPE, MAX_INTEGERS, MAX_ADDRESSES, MAX_DATATYPES, ARRAY_OF_INTEGERS, ARRAY_OF_ADDRESSES, ARRAY_OF_DATATYPES, IERROR)
    INTEGER DATATYPE, MAX_INTEGERS, MAX_ADDRESSES, MAX_DATATYPES, ARRAY_OF_INTEGERS(*), ARRAY_OF_DATATYPES(*), IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ARRAY_OF_ADDRESSES(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `datatype` | IN | **MPI-2.0–MPI-3.1:** datatype to access (handle)<br>**MPI-4.0–MPI-5.0:** datatype to decode (handle) |
| `max_integers` | IN | **MPI-2.0:** number of elements in `array_of_integers` (non-negative integer)<br>**MPI-2.1:** number of elements in `array_of_integers` (nonnegative integer)<br>**MPI-2.2–MPI-4.1:** number of elements in `array_of_integers` (non-negative integer)<br>**MPI-5.0:** number of elements in `array_of_integers` (nonnegative integer) |
| `max_addresses` | IN | **MPI-2.0:** number of elements in `array_of_addresses` (non-negative integer)<br>**MPI-2.1:** number of elements in `array_of_addresses` (nonnegative integer)<br>**MPI-2.2–MPI-4.1:** number of elements in `array_of_addresses` (non-negative integer)<br>**MPI-5.0:** number of elements in `array_of_addresses` (nonnegative integer) |
| `max_datatypes` | IN | **MPI-2.0:** number of elements in `array_of_datatypes` (non-negative integer)<br>**MPI-2.1:** number of elements in `array_of_datatypes` (nonnegative integer)<br>**MPI-2.2–MPI-4.1:** number of elements in `array_of_datatypes` (non-negative integer)<br>**MPI-5.0:** number of elements in `array_of_datatypes` (nonnegative integer) |
| `array_of_integers` | OUT | **MPI-2.0–MPI-5.0:** contains integer arguments used in constructing `datatype` (array of integers) |
| `array_of_addresses` | OUT | **MPI-2.0–MPI-5.0:** contains address arguments used in constructing `datatype` (array of integers) |
| `array_of_datatypes` | OUT | **MPI-2.0–MPI-5.0:** contains datatype arguments used in constructing `datatype` (array of handles) |
| `max_large_counts` | IN | _MPI-2.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-4.1:** number of elements in `array_of_large_counts` (non-negative integer, only present for large count variants)<br>**MPI-5.0:** number of elements in `array_of_large_counts` (nonnegative integer, only present for large count variants) |
| `array_of_large_counts` | OUT | _MPI-2.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-5.0:** contains large count arguments used in constructing `datatype` (array of integers, only present for large count variants) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_GET_CONTENTS|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_GET_CONTENTS|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_GET_CONTENTS|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_GET_CONTENTS|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_GET_CONTENTS|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_GET_CONTENTS|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_GET_CONTENTS|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_GET_CONTENTS|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]

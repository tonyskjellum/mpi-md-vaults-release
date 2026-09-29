---
title: MPI_TYPE_GET_ENVELOPE
c_name: MPI_Type_get_envelope
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_GET_ENVELOPE, MPI_Type_get_envelope]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_GET_ENVELOPE

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_TYPE_GET_ENVELOPE|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_GET_ENVELOPE|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_GET_ENVELOPE|MPI-2.2]] Δ · [[versions/v30/API/MPI_TYPE_GET_ENVELOPE|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_GET_ENVELOPE|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_GET_ENVELOPE|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_GET_ENVELOPE|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_GET_ENVELOPE|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-3.1**
```c
int MPI_Type_get_envelope(MPI_Datatype datatype, int *num_integers, int *num_addresses, int *num_datatypes, int *combiner)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_get_envelope(MPI_Datatype datatype, int *num_integers, int *num_addresses, int *num_datatypes, int *combiner)
int MPI_Type_get_envelope_c(MPI_Datatype datatype, MPI_Count *num_integers, MPI_Count *num_addresses, MPI_Count *num_large_counts, MPI_Count *num_datatypes, int *combiner)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Datatype::Get_envelope(int& num_integers, int& num_addresses, int& num_datatypes, int& combiner) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_get_envelope(datatype, num_integers, num_addresses, num_datatypes, combiner, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(OUT) :: num_integers, num_addresses, num_datatypes, combiner
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_get_envelope(datatype, num_integers, num_addresses, num_datatypes, combiner, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(OUT) :: num_integers, num_addresses, num_datatypes, combiner
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_get_envelope(datatype, num_integers, num_addresses, num_datatypes, combiner, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, INTENT(OUT) :: num_integers, num_addresses, num_datatypes, combiner
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_get_envelope(datatype, num_integers, num_addresses, num_large_counts, num_datatypes, combiner, ierror) !(_c)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: num_integers, num_addresses, num_large_counts, num_datatypes
    INTEGER, INTENT(OUT) :: combiner
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_TYPE_GET_ENVELOPE(DATATYPE, NUM_INTEGERS, NUM_ADDRESSES, NUM_DATATYPES, COMBINER, IERROR)
    INTEGER DATATYPE, NUM_INTEGERS, NUM_ADDRESSES, NUM_DATATYPES, COMBINER, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `datatype` | IN | **MPI-2.0–MPI-3.1:** datatype to access (handle)<br>**MPI-4.0–MPI-5.0:** datatype to decode (handle) |
| `num_integers` | OUT | **MPI-2.0–MPI-2.1:** number of input integers used in the call constructing `combiner` (nonnegative integer)<br>**MPI-2.2–MPI-3.1:** number of input integers used in the call constructing `combiner` (non-negative integer)<br>**MPI-4.0–MPI-4.1:** number of input integers used in call constructing `combiner` (non-negative integer)<br>**MPI-5.0:** number of input integers used in call constructing `combiner` (nonnegative integer) |
| `num_addresses` | OUT | **MPI-2.0–MPI-2.1:** number of input addresses used in the call constructing `combiner` (nonnegative integer)<br>**MPI-2.2–MPI-3.1:** number of input addresses used in the call constructing `combiner` (non-negative integer)<br>**MPI-4.0–MPI-4.1:** number of input addresses used in call constructing `combiner` (non-negative integer)<br>**MPI-5.0:** number of input addresses used in call constructing `combiner` (nonnegative integer) |
| `num_datatypes` | OUT | **MPI-2.0–MPI-2.1:** number of input datatypes used in the call constructing `combiner` (nonnegative integer)<br>**MPI-2.2–MPI-3.1:** number of input datatypes used in the call constructing `combiner` (non-negative integer)<br>**MPI-4.0–MPI-4.1:** number of input datatypes used in call constructing `combiner` (non-negative integer)<br>**MPI-5.0:** number of input datatypes used in call constructing `combiner` (nonnegative integer) |
| `combiner` | OUT | **MPI-2.0–MPI-5.0:** combiner (state) |
| `num_large_counts` | OUT | _MPI-2.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-4.1:** number of input large counts used in call constructing `combiner` (non-negative integer, only present for large count variants)<br>**MPI-5.0:** number of input large counts used in call constructing `combiner` (nonnegative integer, only present for large count variants) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_GET_ENVELOPE|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_GET_ENVELOPE|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_GET_ENVELOPE|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_GET_ENVELOPE|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_GET_ENVELOPE|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_GET_ENVELOPE|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_GET_ENVELOPE|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_GET_ENVELOPE|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]

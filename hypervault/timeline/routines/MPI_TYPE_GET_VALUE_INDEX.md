---
title: MPI_TYPE_GET_VALUE_INDEX
c_name: MPI_Type_get_value_index
chapter: coll
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_GET_VALUE_INDEX, MPI_Type_get_value_index]
tags: [mpi/routine, mpi/coll]
---

# MPI_TYPE_GET_VALUE_INDEX

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_GET_VALUE_INDEX|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Type_get_value_index(MPI_Datatype value_type, MPI_Datatype index_type, MPI_Datatype *pair_type)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Type_get_value_index(value_type, index_type, pair_type, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: value_type, index_type
    TYPE(MPI_Datatype), INTENT(OUT) :: pair_type
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_TYPE_GET_VALUE_INDEX(VALUE_TYPE, INDEX_TYPE, PAIR_TYPE, IERROR)
    INTEGER VALUE_TYPE, INDEX_TYPE, PAIR_TYPE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `value_type` | IN | **MPI-4.1–MPI-5.0:** datatype of the value in pair (handle) |
| `index_type` | IN | **MPI-4.1–MPI-5.0:** datatype of the index in pair (handle) |
| `pair_type` | OUT | **MPI-4.1–MPI-5.0:** datatype of the value-index pair (handle) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_TYPE_GET_VALUE_INDEX|API note]] · chapter [[versions/v41/sections/coll|coll]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_GET_VALUE_INDEX|API note]] · chapter [[versions/v50/sections/coll|coll]]

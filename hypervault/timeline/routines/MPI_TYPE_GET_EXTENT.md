---
title: MPI_TYPE_GET_EXTENT
c_name: MPI_Type_get_extent
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TYPE_GET_EXTENT, MPI_Type_get_extent]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_TYPE_GET_EXTENT

**Introduced** in MPI-2.0 · **continues** [[timeline/routines/MPI_TYPE_EXTENT|MPI_TYPE_EXTENT]] · **continues** [[timeline/routines/MPI_TYPE_LB|MPI_TYPE_LB]] · **continues** [[timeline/routines/MPI_TYPE_UB|MPI_TYPE_UB]].

Releases: [[versions/v20/API/MPI_TYPE_GET_EXTENT|MPI-2.0]] · [[versions/v21/API/MPI_TYPE_GET_EXTENT|MPI-2.1]] · [[versions/v22/API/MPI_TYPE_GET_EXTENT|MPI-2.2]] · [[versions/v30/API/MPI_TYPE_GET_EXTENT|MPI-3.0]] Δ · [[versions/v31/API/MPI_TYPE_GET_EXTENT|MPI-3.1]] Δ · [[versions/v40/API/MPI_TYPE_GET_EXTENT|MPI-4.0]] Δ · [[versions/v41/API/MPI_TYPE_GET_EXTENT|MPI-4.1]] · [[versions/v50/API/MPI_TYPE_GET_EXTENT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-3.1**
```c
int MPI_Type_get_extent(MPI_Datatype datatype, MPI_Aint *lb, MPI_Aint *extent)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Type_get_extent(MPI_Datatype datatype, MPI_Aint *lb, MPI_Aint *extent)
int MPI_Type_get_extent_c(MPI_Datatype datatype, MPI_Count *lb, MPI_Count *extent)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Datatype::Get_extent(MPI::Aint& lb, MPI::Aint& extent) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Type_get_extent(datatype, lb, extent, ierror) BIND(C)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: lb, extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Type_get_extent(datatype, lb, extent, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: lb, extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Type_get_extent(datatype, lb, extent, ierror)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: lb, extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Type_get_extent(datatype, lb, extent, ierror) !(_c)
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: lb, extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.0**
```fortran
MPI_TYPE_GET_EXTENT(DATATYPE, LB, EXTENT, IERROR)
    INTEGER DATATYPE, IERROR
    INTEGER(KIND = MPI_ADDRESS_KIND) LB, EXTENT
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_TYPE_GET_EXTENT(DATATYPE, LB, EXTENT, IERROR)
    INTEGER DATATYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) LB, EXTENT
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `datatype` | IN | **MPI-2.0–MPI-5.0:** datatype to get information on (handle) |
| `lb` | OUT | **MPI-2.0–MPI-5.0:** lower bound of datatype (integer) |
| `extent` | OUT | **MPI-2.0–MPI-5.0:** extent of datatype (integer) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_TYPE_GET_EXTENT|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_TYPE_GET_EXTENT|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_TYPE_GET_EXTENT|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_TYPE_GET_EXTENT|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_TYPE_GET_EXTENT|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_TYPE_GET_EXTENT|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_TYPE_GET_EXTENT|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_TYPE_GET_EXTENT|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]

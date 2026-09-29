---
title: MPI_GET_ADDRESS
c_name: MPI_Get_address
chapter: datatypes
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GET_ADDRESS, MPI_Get_address]
tags: [mpi/routine, mpi/datatypes]
---

# MPI_GET_ADDRESS

**Introduced** in MPI-2.0 · **continues** [[timeline/routines/MPI_ADDRESS|MPI_ADDRESS]].

Releases: [[versions/v20/API/MPI_GET_ADDRESS|MPI-2.0]] · [[versions/v21/API/MPI_GET_ADDRESS|MPI-2.1]] · [[versions/v22/API/MPI_GET_ADDRESS|MPI-2.2]] · [[versions/v30/API/MPI_GET_ADDRESS|MPI-3.0]] Δ · [[versions/v31/API/MPI_GET_ADDRESS|MPI-3.1]] Δ · [[versions/v40/API/MPI_GET_ADDRESS|MPI-4.0]] Δ · [[versions/v41/API/MPI_GET_ADDRESS|MPI-4.1]] · [[versions/v50/API/MPI_GET_ADDRESS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Get_address(void *location, MPI_Aint *address)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Get_address(const void *location, MPI_Aint *address)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Aint MPI::Get_address(void* location)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Get_address(location, address, ierror) BIND(C)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: location
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: address
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Get_address(location, address, ierror)
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: location
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: address
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_GET_ADDRESS(LOCATION, ADDRESS, IERROR)
    <type> LOCATION(*)
    INTEGER IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) ADDRESS
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_GET_ADDRESS(LOCATION, ADDRESS, IERROR)
    <type> LOCATION(*)
    INTEGER(KIND=MPI_ADDRESS_KIND) ADDRESS
    INTEGER IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `location` | IN | **MPI-2.0–MPI-5.0:** location in caller memory (choice) |
| `address` | OUT | **MPI-2.0–MPI-5.0:** address of location (integer) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_GET_ADDRESS|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_GET_ADDRESS|API note]] · chapter [[versions/v21/sections/datatypes|datatypes]]
- MPI-2.2: [[versions/v22/API/MPI_GET_ADDRESS|API note]] · chapter [[versions/v22/sections/datatypes|datatypes]]
- MPI-3.0: [[versions/v30/API/MPI_GET_ADDRESS|API note]] · chapter [[versions/v30/sections/datatypes|datatypes]]
- MPI-3.1: [[versions/v31/API/MPI_GET_ADDRESS|API note]] · chapter [[versions/v31/sections/datatypes|datatypes]]
- MPI-4.0: [[versions/v40/API/MPI_GET_ADDRESS|API note]] · chapter [[versions/v40/sections/datatypes|datatypes]]
- MPI-4.1: [[versions/v41/API/MPI_GET_ADDRESS|API note]] · chapter [[versions/v41/sections/datatypes|datatypes]]
- MPI-5.0: [[versions/v50/API/MPI_GET_ADDRESS|API note]] · chapter [[versions/v50/sections/datatypes|datatypes]]

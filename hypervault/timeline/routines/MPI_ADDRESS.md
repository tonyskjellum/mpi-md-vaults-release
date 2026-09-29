---
title: MPI_ADDRESS
c_name: MPI_Address
chapter: deprecated
introduced: "MPI-1.3"
deprecated: "MPI-2.1"
removed: "MPI-3.0"
continued_as: "MPI_GET_ADDRESS"
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2"]
aliases: [MPI_ADDRESS, MPI_Address]
tags: [mpi/routine, mpi/deprecated]
---

# MPI_ADDRESS

**Introduced** in MPI-1.3 · **deprecated** in MPI-2.1 · **removed** in MPI-3.0 · **continued as** [[timeline/routines/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] (MPI-2.0 deprecated names and functions).

Releases: [[versions/v13/API/MPI_ADDRESS|MPI-1.3]] · [[versions/v21/API/MPI_ADDRESS|MPI-2.1]] † · [[versions/v22/API/MPI_ADDRESS|MPI-2.2]] † · ~~MPI-3.0~~

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-2.2**
```c
int MPI_Address(void* location, MPI_Aint *address)
```

## mpif.h

**MPI-1.3–MPI-2.2**
```fortran
MPI_ADDRESS(LOCATION, ADDRESS, IERROR)
    <type> LOCATION(*)
    INTEGER ADDRESS, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `location` | IN | **MPI-1.3–MPI-2.2:** location in caller memory (choice) |
| `address` | OUT | **MPI-1.3–MPI-2.2:** address of location (integer) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_ADDRESS|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_ADDRESS|API note]] · chapter [[versions/v21/sections/deprecated|deprecated]]
- MPI-2.2: [[versions/v22/API/MPI_ADDRESS|API note]] · chapter [[versions/v22/sections/deprecated|deprecated]]

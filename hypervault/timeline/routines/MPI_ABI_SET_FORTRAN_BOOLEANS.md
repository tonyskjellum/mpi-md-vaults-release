---
title: MPI_ABI_SET_FORTRAN_BOOLEANS
c_name: MPI_Abi_set_fortran_booleans
chapter: abi
introduced: "MPI-5.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-5.0"]
aliases: [MPI_ABI_SET_FORTRAN_BOOLEANS, MPI_Abi_set_fortran_booleans]
tags: [mpi/routine, mpi/abi]
---

# MPI_ABI_SET_FORTRAN_BOOLEANS

**Introduced** in MPI-5.0.

Releases: [[versions/v50/API/MPI_ABI_SET_FORTRAN_BOOLEANS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-5.0**
```c
int MPI_Abi_set_fortran_booleans(int logical_size, void *logical_true, void *logical_false)
```

## Fortran 2008

**MPI-5.0**
```fortran
MPI_Abi_set_fortran_booleans(logical_size, logical_true, logical_false, ierror)
    INTEGER, INTENT(IN) :: logical_size
    LOGICAL, INTENT(IN) :: logical_true, logical_false
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-5.0**
```fortran
MPI_ABI_SET_FORTRAN_BOOLEANS(LOGICAL_SIZE, LOGICAL_TRUE, LOGICAL_FALSE, IERROR)
    INTEGER LOGICAL_SIZE, IERROR
    LOGICAL LOGICAL_TRUE, LOGICAL_FALSE
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `logical_size` | IN | **MPI-5.0:** the size of Fortran `LOGICAL` in bytes (integer) |
| `logical_true` | IN | **MPI-5.0:** the Fortran literal value `.TRUE.` (logical) |
| `logical_false` | IN | **MPI-5.0:** the Fortran literal value `.FALSE.` (logical) |

## Named in the change log of

[[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-5.0: [[versions/v50/API/MPI_ABI_SET_FORTRAN_BOOLEANS|API note]] · chapter [[versions/v50/sections/abi|abi]]

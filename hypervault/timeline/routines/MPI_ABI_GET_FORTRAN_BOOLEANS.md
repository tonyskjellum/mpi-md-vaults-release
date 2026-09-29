---
title: MPI_ABI_GET_FORTRAN_BOOLEANS
c_name: MPI_Abi_get_fortran_booleans
chapter: abi
introduced: "MPI-5.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-5.0"]
aliases: [MPI_ABI_GET_FORTRAN_BOOLEANS, MPI_Abi_get_fortran_booleans]
tags: [mpi/routine, mpi/abi]
---

# MPI_ABI_GET_FORTRAN_BOOLEANS

**Introduced** in MPI-5.0.

Releases: [[versions/v50/API/MPI_ABI_GET_FORTRAN_BOOLEANS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-5.0**
```c
int MPI_Abi_get_fortran_booleans(int logical_size, void *logical_true, void *logical_false, int *is_set)
```

## Fortran 2008

**MPI-5.0**
```fortran
MPI_Abi_get_fortran_booleans(logical_size, logical_true, logical_false, is_set, ierror)
    INTEGER, INTENT(IN) :: logical_size
    LOGICAL, INTENT(OUT) :: logical_true, logical_false, is_set
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-5.0**
```fortran
MPI_ABI_GET_FORTRAN_BOOLEANS(LOGICAL_SIZE, LOGICAL_TRUE, LOGICAL_FALSE, IS_SET, IERROR)
    INTEGER LOGICAL_SIZE, IERROR
    LOGICAL LOGICAL_TRUE, LOGICAL_FALSE, IS_SET
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `logical_size` | IN | **MPI-5.0:** the size of Fortran `LOGICAL` in bytes (integer) |
| `logical_true` | OUT | **MPI-5.0:** the Fortran literal value `.TRUE.` (logical) |
| `logical_false` | OUT | **MPI-5.0:** the Fortran literal value `.FALSE.` (logical) |
| `is_set` | OUT | **MPI-5.0:** flag to indicate whether the logical boolean values were set previously (logical) |

## Per-release notes

- MPI-5.0: [[versions/v50/API/MPI_ABI_GET_FORTRAN_BOOLEANS|API note]] · chapter [[versions/v50/sections/abi|abi]]

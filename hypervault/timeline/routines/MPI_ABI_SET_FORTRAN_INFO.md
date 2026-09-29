---
title: MPI_ABI_SET_FORTRAN_INFO
c_name: MPI_Abi_set_fortran_info
chapter: abi
introduced: "MPI-5.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-5.0"]
aliases: [MPI_ABI_SET_FORTRAN_INFO, MPI_Abi_set_fortran_info]
tags: [mpi/routine, mpi/abi]
---

# MPI_ABI_SET_FORTRAN_INFO

**Introduced** in MPI-5.0.

Releases: [[versions/v50/API/MPI_ABI_SET_FORTRAN_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-5.0**
```c
int MPI_Abi_set_fortran_info(MPI_Info info)
```

## Fortran 2008

**MPI-5.0**
```fortran
MPI_Abi_set_fortran_info(info, ierror)
    TYPE(MPI_Info), INTENT(IN) :: info
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-5.0**
```fortran
MPI_ABI_SET_FORTRAN_INFO(INFO, IERROR)
    INTEGER INFO, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `info` | IN | **MPI-5.0:** Fortran ABI details info object (handle) |

## Named in the change log of

[[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-5.0: [[versions/v50/API/MPI_ABI_SET_FORTRAN_INFO|API note]] · chapter [[versions/v50/sections/abi|abi]]

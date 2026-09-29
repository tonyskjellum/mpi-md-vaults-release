---
title: MPI_ABI_GET_VERSION
c_name: MPI_Abi_get_version
chapter: abi
introduced: "MPI-5.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-5.0"]
aliases: [MPI_ABI_GET_VERSION, MPI_Abi_get_version]
tags: [mpi/routine, mpi/abi]
---

# MPI_ABI_GET_VERSION

**Introduced** in MPI-5.0.

Releases: [[versions/v50/API/MPI_ABI_GET_VERSION|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-5.0**
```c
int MPI_Abi_get_version(int *abi_major, int *abi_minor)
```

## Fortran 2008

**MPI-5.0**
```fortran
MPI_Abi_get_version(abi_major, abi_minor, ierror)
    INTEGER, INTENT(OUT) :: abi_major, abi_minor
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-5.0**
```fortran
MPI_ABI_GET_VERSION(ABI_MAJOR, ABI_MINOR, IERROR)
    INTEGER ABI_MAJOR, ABI_MINOR, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `abi_major` | OUT | **MPI-5.0:** ABI major version (integer) |
| `abi_minor` | OUT | **MPI-5.0:** ABI minor version (integer) |

## Named in the change log of

[[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-5.0: [[versions/v50/API/MPI_ABI_GET_VERSION|API note]] · chapter [[versions/v50/sections/abi|abi]]

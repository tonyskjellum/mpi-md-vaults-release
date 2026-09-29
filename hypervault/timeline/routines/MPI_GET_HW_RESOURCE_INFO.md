---
title: MPI_GET_HW_RESOURCE_INFO
c_name: MPI_Get_hw_resource_info
chapter: inquiry
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_GET_HW_RESOURCE_INFO, MPI_Get_hw_resource_info]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_GET_HW_RESOURCE_INFO

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_GET_HW_RESOURCE_INFO|MPI-4.1]] · [[versions/v50/API/MPI_GET_HW_RESOURCE_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Get_hw_resource_info(MPI_Info *hw_info)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Get_hw_resource_info(hw_info, ierror)
    TYPE(MPI_Info), INTENT(OUT) :: hw_info
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_GET_HW_RESOURCE_INFO(HW_INFO, IERROR)
    INTEGER HW_INFO, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `hw_info` | OUT | **MPI-4.1–MPI-5.0:** info object created (handle) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_GET_HW_RESOURCE_INFO|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_GET_HW_RESOURCE_INFO|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]

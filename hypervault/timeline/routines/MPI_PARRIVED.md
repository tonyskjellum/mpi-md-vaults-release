---
title: MPI_PARRIVED
c_name: MPI_Parrived
chapter: part
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PARRIVED, MPI_Parrived]
tags: [mpi/routine, mpi/part]
---

# MPI_PARRIVED

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_PARRIVED|MPI-4.0]] · [[versions/v41/API/MPI_PARRIVED|MPI-4.1]] · [[versions/v50/API/MPI_PARRIVED|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Parrived(MPI_Request request, int partition, int *flag)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Parrived(request, partition, flag, ierror)
    TYPE(MPI_Request), INTENT(IN) :: request
    INTEGER, INTENT(IN) :: partition
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_PARRIVED(REQUEST, PARTITION, FLAG, IERROR)
    INTEGER REQUEST, PARTITION, IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `request` | IN | **MPI-4.0–MPI-5.0:** partitioned communication request (handle) |
| `partition` | IN | **MPI-4.0–MPI-4.1:** partition to be tested (non-negative integer)<br>**MPI-5.0:** partition to be tested (nonnegative integer) |
| `flag` | OUT | **MPI-4.0–MPI-5.0:** `true` if operation completed on the specified partition, `false` if not (logical) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_PARRIVED|API note]] · chapter [[versions/v40/sections/part|part]]
- MPI-4.1: [[versions/v41/API/MPI_PARRIVED|API note]] · chapter [[versions/v41/sections/part|part]]
- MPI-5.0: [[versions/v50/API/MPI_PARRIVED|API note]] · chapter [[versions/v50/sections/part|part]]

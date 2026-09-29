---
title: MPI_PREADY_RANGE
c_name: MPI_Pready_range
chapter: part
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PREADY_RANGE, MPI_Pready_range]
tags: [mpi/routine, mpi/part]
---

# MPI_PREADY_RANGE

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_PREADY_RANGE|MPI-4.0]] · [[versions/v41/API/MPI_PREADY_RANGE|MPI-4.1]] · [[versions/v50/API/MPI_PREADY_RANGE|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Pready_range(int partition_low, int partition_high, MPI_Request request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Pready_range(partition_low, partition_high, request, ierror)
    INTEGER, INTENT(IN) :: partition_low, partition_high
    TYPE(MPI_Request), INTENT(IN) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_PREADY_RANGE(PARTITION_LOW, PARTITION_HIGH, REQUEST, IERROR)
    INTEGER PARTITION_LOW, PARTITION_HIGH, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `partition_low` | IN | **MPI-4.0–MPI-4.1:** lowest partition ready for transfer (non-negative integer)<br>**MPI-5.0:** lowest partition ready for transfer (nonnegative integer) |
| `partition_high` | IN | **MPI-4.0–MPI-4.1:** highest partition ready for transfer (non-negative integer)<br>**MPI-5.0:** highest partition ready for transfer (nonnegative integer) |
| `request` | INOUT | **MPI-4.0–MPI-5.0:** partitioned communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_PREADY_RANGE|API note]] · chapter [[versions/v40/sections/part|part]]
- MPI-4.1: [[versions/v41/API/MPI_PREADY_RANGE|API note]] · chapter [[versions/v41/sections/part|part]]
- MPI-5.0: [[versions/v50/API/MPI_PREADY_RANGE|API note]] · chapter [[versions/v50/sections/part|part]]

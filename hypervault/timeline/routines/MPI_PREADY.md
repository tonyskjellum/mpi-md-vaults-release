---
title: MPI_PREADY
c_name: MPI_Pready
chapter: part
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PREADY, MPI_Pready]
tags: [mpi/routine, mpi/part]
---

# MPI_PREADY

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_PREADY|MPI-4.0]] · [[versions/v41/API/MPI_PREADY|MPI-4.1]] · [[versions/v50/API/MPI_PREADY|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Pready(int partition, MPI_Request request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Pready(partition, request, ierror)
    INTEGER, INTENT(IN) :: partition
    TYPE(MPI_Request), INTENT(IN) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_PREADY(PARTITION, REQUEST, IERROR)
    INTEGER PARTITION, REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `partition` | IN | **MPI-4.0–MPI-4.1:** partition to mark ready for transfer (non-negative integer)<br>**MPI-5.0:** partition to mark ready for transfer (nonnegative integer) |
| `request` | INOUT | **MPI-4.0–MPI-5.0:** partitioned communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_PREADY|API note]] · chapter [[versions/v40/sections/part|part]]
- MPI-4.1: [[versions/v41/API/MPI_PREADY|API note]] · chapter [[versions/v41/sections/part|part]]
- MPI-5.0: [[versions/v50/API/MPI_PREADY|API note]] · chapter [[versions/v50/sections/part|part]]

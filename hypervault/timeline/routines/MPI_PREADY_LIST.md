---
title: MPI_PREADY_LIST
c_name: MPI_Pready_list
chapter: part
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PREADY_LIST, MPI_Pready_list]
tags: [mpi/routine, mpi/part]
---

# MPI_PREADY_LIST

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_PREADY_LIST|MPI-4.0]] · [[versions/v41/API/MPI_PREADY_LIST|MPI-4.1]] · [[versions/v50/API/MPI_PREADY_LIST|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_Pready_list(int length, const int array_of_partitions[], MPI_Request request)
```

## Fortran 2008

**MPI-4.0–MPI-5.0**
```fortran
MPI_Pready_list(length, array_of_partitions, request, ierror)
    INTEGER, INTENT(IN) :: length, array_of_partitions(length)
    TYPE(MPI_Request), INTENT(IN) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.0–MPI-5.0**
```fortran
MPI_PREADY_LIST(LENGTH, ARRAY_OF_PARTITIONS, REQUEST, IERROR)
    INTEGER LENGTH, ARRAY_OF_PARTITIONS(*), REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `length` | IN | **MPI-4.0–MPI-5.0:** list length (integer) |
| `array_of_partitions` | IN | **MPI-4.0–MPI-4.1:** array of partitions (array of non-negative integers)<br>**MPI-5.0:** array of partitions (array of nonnegative integers) |
| `request` | INOUT | **MPI-4.0–MPI-5.0:** partitioned communication request (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_PREADY_LIST|API note]] · chapter [[versions/v40/sections/part|part]]
- MPI-4.1: [[versions/v41/API/MPI_PREADY_LIST|API note]] · chapter [[versions/v41/sections/part|part]]
- MPI-5.0: [[versions/v50/API/MPI_PREADY_LIST|API note]] · chapter [[versions/v50/sections/part|part]]

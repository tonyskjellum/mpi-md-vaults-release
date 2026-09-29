---
title: MPI_COMM_DETACH_BUFFER
c_name: MPI_Comm_detach_buffer
chapter: pt2pt
introduced: "MPI-4.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_DETACH_BUFFER, MPI_Comm_detach_buffer]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_COMM_DETACH_BUFFER

**Introduced** in MPI-4.1.

Releases: [[versions/v41/API/MPI_COMM_DETACH_BUFFER|MPI-4.1]] · [[versions/v50/API/MPI_COMM_DETACH_BUFFER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.1–MPI-5.0**
```c
int MPI_Comm_detach_buffer(MPI_Comm comm, void *buffer_addr, int *size)
int MPI_Comm_detach_buffer_c(MPI_Comm comm, void *buffer_addr, MPI_Count *size)
```

## Fortran 2008

**MPI-4.1–MPI-5.0**
```fortran
MPI_Comm_detach_buffer(comm, buffer_addr, size, ierror)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(C_PTR), INTENT(OUT) :: buffer_addr
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Comm_detach_buffer(comm, buffer_addr, size, ierror) !(_c)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(C_PTR), INTENT(OUT) :: buffer_addr
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-4.1–MPI-5.0**
```fortran
MPI_COMM_DETACH_BUFFER(COMM, BUFFER_ADDR, SIZE, IERROR)
    INTEGER COMM, SIZE, IERROR
    <type> BUFFER_ADDR(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-4.1–MPI-5.0:** communicator (handle) |
| `buffer_addr` | OUT | **MPI-4.1–MPI-5.0:** initial buffer address (choice) |
| `size` | OUT | **MPI-4.1–MPI-5.0:** buffer size, in bytes (integer) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-4.1: [[versions/v41/API/MPI_COMM_DETACH_BUFFER|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_DETACH_BUFFER|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]

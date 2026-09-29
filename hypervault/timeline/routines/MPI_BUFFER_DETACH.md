---
title: MPI_BUFFER_DETACH
c_name: MPI_Buffer_detach
chapter: pt2pt
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_BUFFER_DETACH, MPI_Buffer_detach]
tags: [mpi/routine, mpi/pt2pt]
---

# MPI_BUFFER_DETACH

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_BUFFER_DETACH|MPI-1.3]] · [[versions/v21/API/MPI_BUFFER_DETACH|MPI-2.1]] Δ · [[versions/v22/API/MPI_BUFFER_DETACH|MPI-2.2]] · [[versions/v30/API/MPI_BUFFER_DETACH|MPI-3.0]] Δ · [[versions/v31/API/MPI_BUFFER_DETACH|MPI-3.1]] Δ · [[versions/v40/API/MPI_BUFFER_DETACH|MPI-4.0]] Δ · [[versions/v41/API/MPI_BUFFER_DETACH|MPI-4.1]] · [[versions/v50/API/MPI_BUFFER_DETACH|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3**
```c
int MPI_Buffer_detach( void* buffer_addr, int* size)
```

**MPI-2.1–MPI-3.1**
```c
int MPI_Buffer_detach(void* buffer_addr, int* size)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Buffer_detach(void *buffer_addr, int *size)
int MPI_Buffer_detach_c(void *buffer_addr, MPI_Count *size)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI::Detach_buffer(void*& buffer)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Buffer_detach(buffer_addr, size, ierror) BIND(C)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(C_PTR), INTENT(OUT) :: buffer_addr
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Buffer_detach(buffer_addr, size, ierror)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(C_PTR), INTENT(OUT) :: buffer_addr
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Buffer_detach(buffer_addr, size, ierror)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(C_PTR), INTENT(OUT) :: buffer_addr
    INTEGER, INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_Buffer_detach(buffer_addr, size, ierror) !(_c)
    USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
    TYPE(C_PTR), INTENT(OUT) :: buffer_addr
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3**
```fortran
MPI_BUFFER_DETACH( BUFFER_ADDR, SIZE, IERROR)
    <type> BUFFER_ADDR(*)
    INTEGER SIZE, IERROR
```

**MPI-2.1–MPI-5.0**
```fortran
MPI_BUFFER_DETACH(BUFFER_ADDR, SIZE, IERROR)
    <type> BUFFER_ADDR(*)
    INTEGER SIZE, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `buffer_addr` | OUT | **MPI-1.3–MPI-5.0:** initial buffer address (choice) |
| `size` | OUT | **MPI-1.3:** buffer size, in bytes (integer)<br>**MPI-2.1–MPI-3.1:** buffer size, in bytes (non-negative integer)<br>**MPI-4.0–MPI-5.0:** buffer size, in bytes (integer) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_BUFFER_DETACH|API note]] · chapter [[versions/v13/sections/pt2pt|pt2pt]]
- MPI-2.1: [[versions/v21/API/MPI_BUFFER_DETACH|API note]] · chapter [[versions/v21/sections/pt2pt|pt2pt]]
- MPI-2.2: [[versions/v22/API/MPI_BUFFER_DETACH|API note]] · chapter [[versions/v22/sections/pt2pt|pt2pt]]
- MPI-3.0: [[versions/v30/API/MPI_BUFFER_DETACH|API note]] · chapter [[versions/v30/sections/pt2pt|pt2pt]]
- MPI-3.1: [[versions/v31/API/MPI_BUFFER_DETACH|API note]] · chapter [[versions/v31/sections/pt2pt|pt2pt]]
- MPI-4.0: [[versions/v40/API/MPI_BUFFER_DETACH|API note]] · chapter [[versions/v40/sections/pt2pt|pt2pt]]
- MPI-4.1: [[versions/v41/API/MPI_BUFFER_DETACH|API note]] · chapter [[versions/v41/sections/pt2pt|pt2pt]]
- MPI-5.0: [[versions/v50/API/MPI_BUFFER_DETACH|API note]] · chapter [[versions/v50/sections/pt2pt|pt2pt]]

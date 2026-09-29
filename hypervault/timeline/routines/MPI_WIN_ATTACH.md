---
title: MPI_WIN_ATTACH
c_name: MPI_Win_attach
chapter: one-side
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WIN_ATTACH, MPI_Win_attach]
tags: [mpi/routine, mpi/one-side]
---

# MPI_WIN_ATTACH

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_WIN_ATTACH|MPI-3.0]] · [[versions/v31/API/MPI_WIN_ATTACH|MPI-3.1]] Δ · [[versions/v40/API/MPI_WIN_ATTACH|MPI-4.0]] Δ · [[versions/v41/API/MPI_WIN_ATTACH|MPI-4.1]] · [[versions/v50/API/MPI_WIN_ATTACH|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_Win_attach(MPI_Win win, void *base, MPI_Aint size)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Win_attach(win, base, size, ierror) BIND(C)
    TYPE(MPI_Win), INTENT(IN) :: win
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Win_attach(win, base, size, ierror)
    TYPE(MPI_Win), INTENT(IN) :: win
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: base
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: size
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_WIN_ATTACH(WIN, BASE, SIZE, IERROR)
    INTEGER WIN, IERROR
    <type> BASE(*)
    INTEGER (KIND=MPI_ADDRESS_KIND) SIZE
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_WIN_ATTACH(WIN, BASE, SIZE, IERROR)
    INTEGER WIN, IERROR
    <type> BASE(*)
    INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `win` | IN | **MPI-3.0–MPI-5.0:** window object (handle) |
| `base` | IN | **MPI-3.0–MPI-3.1:** initial address of memory to be attached<br>**MPI-4.0–MPI-5.0:** initial address of memory to be attached (choice) |
| `size` | IN | **MPI-3.0–MPI-3.1:** size of memory to be attached in bytes<br>**MPI-4.0–MPI-4.1:** size of memory to be attached in bytes (non-negative integer)<br>**MPI-5.0:** size of memory to be attached in bytes (nonnegative integer) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_WIN_ATTACH|API note]] · chapter [[versions/v30/sections/one-side|one-side]]
- MPI-3.1: [[versions/v31/API/MPI_WIN_ATTACH|API note]] · chapter [[versions/v31/sections/one-side|one-side]]
- MPI-4.0: [[versions/v40/API/MPI_WIN_ATTACH|API note]] · chapter [[versions/v40/sections/one-side|one-side]]
- MPI-4.1: [[versions/v41/API/MPI_WIN_ATTACH|API note]] · chapter [[versions/v41/sections/one-side|one-side]]
- MPI-5.0: [[versions/v50/API/MPI_WIN_ATTACH|API note]] · chapter [[versions/v50/sections/one-side|one-side]]

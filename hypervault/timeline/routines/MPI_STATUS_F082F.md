---
title: MPI_STATUS_F082F
c_name: MPI_Status_f082f
chapter: binding
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_STATUS_F082F, MPI_Status_f082f]
tags: [mpi/routine, mpi/binding]
---

# MPI_STATUS_F082F

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_STATUS_F082F|MPI-3.0]] · [[versions/v31/API/MPI_STATUS_F082F|MPI-3.1]] Δ · [[versions/v40/API/MPI_STATUS_F082F|MPI-4.0]] Δ · [[versions/v41/API/MPI_STATUS_F082F|MPI-4.1]] · [[versions/v50/API/MPI_STATUS_F082F|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Status_f082f(MPI_F08_status *f08_status, MPI_Fint *f_status)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Status_f082f(const MPI_F08_status *f08_status, MPI_Fint *f_status)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Status_f082f(f08_status, f_status, ierror) BIND(C)
    TYPE(MPI_Status), INTENT(IN) :: f08_status
    INTEGER, INTENT(OUT) :: f_status(MPI_STATUS_SIZE)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Status_f082f(f08_status, f_status, ierror)
    TYPE(MPI_Status), INTENT(IN) :: f08_status
    INTEGER, INTENT(OUT) :: f_status(MPI_STATUS_SIZE)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_STATUS_F082F(F08_STATUS, F_STATUS, IERROR)
    TYPE(MPI_Status) :: F08_STATUS
    INTEGER :: F_STATUS(MPI_STATUS_SIZE)
    INTEGER IERROR
```

**MPI-4.0–MPI-5.0**
_(no mpif.h binding)_

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `f08_status` | IN | **MPI-3.0–MPI-3.1:** status object declared as named type<br>**MPI-4.0–MPI-5.0:** status object declared as named type (status) |
| `f_status` | OUT | **MPI-3.0–MPI-3.1:** status object declared as array<br>**MPI-4.0–MPI-5.0:** status object declared as array (status) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_STATUS_F082F|API note]] · chapter [[versions/v30/sections/binding|binding]]
- MPI-3.1: [[versions/v31/API/MPI_STATUS_F082F|API note]] · chapter [[versions/v31/sections/binding|binding]]
- MPI-4.0: [[versions/v40/API/MPI_STATUS_F082F|API note]] · chapter [[versions/v40/sections/binding|binding]]
- MPI-4.1: [[versions/v41/API/MPI_STATUS_F082F|API note]] · chapter [[versions/v41/sections/binding|binding]]
- MPI-5.0: [[versions/v50/API/MPI_STATUS_F082F|API note]] · chapter [[versions/v50/sections/binding|binding]]

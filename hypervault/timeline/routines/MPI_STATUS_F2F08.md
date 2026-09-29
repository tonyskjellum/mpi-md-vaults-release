---
title: MPI_STATUS_F2F08
c_name: MPI_Status_f2f08
chapter: binding
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_STATUS_F2F08, MPI_Status_f2f08]
tags: [mpi/routine, mpi/binding]
---

# MPI_STATUS_F2F08

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_STATUS_F2F08|MPI-3.0]] · [[versions/v31/API/MPI_STATUS_F2F08|MPI-3.1]] Δ · [[versions/v40/API/MPI_STATUS_F2F08|MPI-4.0]] Δ · [[versions/v41/API/MPI_STATUS_F2F08|MPI-4.1]] · [[versions/v50/API/MPI_STATUS_F2F08|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_Status_f2f08(MPI_Fint *f_status, MPI_F08_status *f08_status)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_Status_f2f08(const MPI_Fint *f_status, MPI_F08_status *f08_status)
```

## Fortran 2008

**MPI-3.0**
```fortran
MPI_Status_f2f08(f_status, f08_status, ierror) BIND(C)
    INTEGER, INTENT(IN) :: f_status(MPI_STATUS_SIZE)
    TYPE(MPI_Status), INTENT(OUT) :: f08_status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Status_f2f08(f_status, f08_status, ierror)
    INTEGER, INTENT(IN) :: f_status(MPI_STATUS_SIZE)
    TYPE(MPI_Status), INTENT(OUT) :: f08_status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.0–MPI-3.1**
```fortran
MPI_STATUS_F2F08(F_STATUS, F08_STATUS, IERROR)
    INTEGER :: F_STATUS(MPI_STATUS_SIZE)
    TYPE(MPI_Status) :: F08_STATUS
    INTEGER IERROR
```

**MPI-4.0–MPI-5.0**
_(no mpif.h binding)_

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `f_status` | IN | **MPI-3.0–MPI-3.1:** status object declared as array<br>**MPI-4.0–MPI-5.0:** status object declared as array (status) |
| `f08_status` | OUT | **MPI-3.0–MPI-3.1:** status object declared as named type<br>**MPI-4.0–MPI-5.0:** status object declared as named type (status) |

## Named in the change log of

[[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_STATUS_F2F08|API note]] · chapter [[versions/v30/sections/binding|binding]]
- MPI-3.1: [[versions/v31/API/MPI_STATUS_F2F08|API note]] · chapter [[versions/v31/sections/binding|binding]]
- MPI-4.0: [[versions/v40/API/MPI_STATUS_F2F08|API note]] · chapter [[versions/v40/sections/binding|binding]]
- MPI-4.1: [[versions/v41/API/MPI_STATUS_F2F08|API note]] · chapter [[versions/v41/sections/binding|binding]]
- MPI-5.0: [[versions/v50/API/MPI_STATUS_F2F08|API note]] · chapter [[versions/v50/sections/binding|binding]]

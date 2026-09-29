---
title: MPI_WTIME
c_name: MPI_Wtime
chapter: inquiry
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_WTIME, MPI_Wtime]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_WTIME

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_WTIME|MPI-1.3]] · [[versions/v21/API/MPI_WTIME|MPI-2.1]] Δ · [[versions/v22/API/MPI_WTIME|MPI-2.2]] · [[versions/v30/API/MPI_WTIME|MPI-3.0]] Δ · [[versions/v31/API/MPI_WTIME|MPI-3.1]] Δ · [[versions/v40/API/MPI_WTIME|MPI-4.0]] · [[versions/v41/API/MPI_WTIME|MPI-4.1]] · [[versions/v50/API/MPI_WTIME|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
double MPI_Wtime(void)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
double MPI::Wtime()
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
DOUBLE PRECISION MPI_Wtime() BIND(C)
```

**MPI-3.1–MPI-5.0**
```fortran
DOUBLE PRECISION MPI_Wtime()
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
DOUBLE PRECISION MPI_WTIME()
```

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_WTIME|API note]] · chapter [[versions/v13/sections/inquiry|inquiry]]
- MPI-2.1: [[versions/v21/API/MPI_WTIME|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_WTIME|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_WTIME|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_WTIME|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_WTIME|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_WTIME|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_WTIME|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]

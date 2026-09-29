---
title: MPI_PCONTROL
c_name: MPI_Pcontrol
chapter: tools
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PCONTROL, MPI_Pcontrol]
tags: [mpi/routine, mpi/tools]
---

# MPI_PCONTROL

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_PCONTROL|MPI-1.3]] · [[versions/v21/API/MPI_PCONTROL|MPI-2.1]] Δ · [[versions/v22/API/MPI_PCONTROL|MPI-2.2]] Δ · [[versions/v30/API/MPI_PCONTROL|MPI-3.0]] Δ · [[versions/v31/API/MPI_PCONTROL|MPI-3.1]] Δ · [[versions/v40/API/MPI_PCONTROL|MPI-4.0]] · [[versions/v41/API/MPI_PCONTROL|MPI-4.1]] · [[versions/v50/API/MPI_PCONTROL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Pcontrol(const int level, ...)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
void MPI::Pcontrol(const int level, ...)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Pcontrol(level) BIND(C)
    INTEGER, INTENT(IN) :: level
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Pcontrol(level)
    INTEGER, INTENT(IN) :: level
```

## mpif.h

**MPI-1.3–MPI-2.1**
```fortran
MPI_PCONTROL(LEVEL)
    INTEGER LEVEL, ...
```

**MPI-2.2–MPI-5.0**
```fortran
MPI_PCONTROL(LEVEL)
    INTEGER LEVEL
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `level` | IN | **MPI-1.3–MPI-2.2:** Profiling level<br>**MPI-3.0–MPI-5.0:** Profiling level (integer) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_PCONTROL|API note]] · chapter [[versions/v13/sections/prof|prof]]
- MPI-2.1: [[versions/v21/API/MPI_PCONTROL|API note]] · chapter [[versions/v21/sections/prof|prof]]
- MPI-2.2: [[versions/v22/API/MPI_PCONTROL|API note]] · chapter [[versions/v22/sections/prof|prof]]
- MPI-3.0: [[versions/v30/API/MPI_PCONTROL|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_PCONTROL|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_PCONTROL|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_PCONTROL|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_PCONTROL|API note]] · chapter [[versions/v50/sections/tools|tools]]

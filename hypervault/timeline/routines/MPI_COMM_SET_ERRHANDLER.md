---
title: MPI_COMM_SET_ERRHANDLER
c_name: MPI_Comm_set_errhandler
chapter: inquiry
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_SET_ERRHANDLER, MPI_Comm_set_errhandler]
tags: [mpi/routine, mpi/inquiry]
---

# MPI_COMM_SET_ERRHANDLER

**Introduced** in MPI-2.0 · **continues** [[timeline/routines/MPI_ERRHANDLER_SET|MPI_ERRHANDLER_SET]].

Releases: [[versions/v20/API/MPI_COMM_SET_ERRHANDLER|MPI-2.0]] · [[versions/v21/API/MPI_COMM_SET_ERRHANDLER|MPI-2.1]] · [[versions/v22/API/MPI_COMM_SET_ERRHANDLER|MPI-2.2]] · [[versions/v30/API/MPI_COMM_SET_ERRHANDLER|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_SET_ERRHANDLER|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_SET_ERRHANDLER|MPI-4.0]] · [[versions/v41/API/MPI_COMM_SET_ERRHANDLER|MPI-4.1]] · [[versions/v50/API/MPI_COMM_SET_ERRHANDLER|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Comm_set_errhandler(MPI_Comm comm, MPI_Errhandler errhandler)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Comm::Set_errhandler(const MPI::Errhandler& errhandler)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_set_errhandler(comm, errhandler, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_set_errhandler(comm, errhandler, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Errhandler), INTENT(IN) :: errhandler
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_COMM_SET_ERRHANDLER(COMM, ERRHANDLER, IERROR)
    INTEGER COMM, ERRHANDLER, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | INOUT | **MPI-2.0–MPI-5.0:** communicator (handle) |
| `errhandler` | IN | **MPI-2.0–MPI-5.0:** new error handler for communicator (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_COMM_SET_ERRHANDLER|API note]] · chapter [[versions/v20/sections/misc|misc]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_SET_ERRHANDLER|API note]] · chapter [[versions/v21/sections/inquiry|inquiry]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_SET_ERRHANDLER|API note]] · chapter [[versions/v22/sections/inquiry|inquiry]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_SET_ERRHANDLER|API note]] · chapter [[versions/v30/sections/inquiry|inquiry]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_SET_ERRHANDLER|API note]] · chapter [[versions/v31/sections/inquiry|inquiry]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_SET_ERRHANDLER|API note]] · chapter [[versions/v40/sections/inquiry|inquiry]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_SET_ERRHANDLER|API note]] · chapter [[versions/v41/sections/inquiry|inquiry]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_SET_ERRHANDLER|API note]] · chapter [[versions/v50/sections/inquiry|inquiry]]

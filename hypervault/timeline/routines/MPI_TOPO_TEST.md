---
title: MPI_TOPO_TEST
c_name: MPI_Topo_test
chapter: topol
introduced: "MPI-1.3"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_TOPO_TEST, MPI_Topo_test]
tags: [mpi/routine, mpi/topol]
---

# MPI_TOPO_TEST

**Introduced** in MPI-1.3.

Releases: [[versions/v13/API/MPI_TOPO_TEST|MPI-1.3]] · [[versions/v21/API/MPI_TOPO_TEST|MPI-2.1]] Δ · [[versions/v22/API/MPI_TOPO_TEST|MPI-2.2]] · [[versions/v30/API/MPI_TOPO_TEST|MPI-3.0]] Δ · [[versions/v31/API/MPI_TOPO_TEST|MPI-3.1]] Δ · [[versions/v40/API/MPI_TOPO_TEST|MPI-4.0]] · [[versions/v41/API/MPI_TOPO_TEST|MPI-4.1]] · [[versions/v50/API/MPI_TOPO_TEST|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-1.3–MPI-5.0**
```c
int MPI_Topo_test(MPI_Comm comm, int *status)
```

## C++

**MPI-1.3**
_(no C++ binding)_

**MPI-2.1–MPI-2.2**
```c
int MPI::Comm::Get_topology() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-1.3–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Topo_test(comm, status, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Topo_test(comm, status, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    INTEGER, INTENT(OUT) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-1.3–MPI-5.0**
```fortran
MPI_TOPO_TEST(COMM, STATUS, IERROR)
    INTEGER COMM, STATUS, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-1.3–MPI-5.0:** communicator (handle) |
| `status` | OUT | **MPI-1.3–MPI-5.0:** topology type of communicator `comm` (state) |

## Per-release notes

- MPI-1.3: [[versions/v13/API/MPI_TOPO_TEST|API note]] · chapter [[versions/v13/sections/topol|topol]]
- MPI-2.1: [[versions/v21/API/MPI_TOPO_TEST|API note]] · chapter [[versions/v21/sections/topol|topol]]
- MPI-2.2: [[versions/v22/API/MPI_TOPO_TEST|API note]] · chapter [[versions/v22/sections/topol|topol]]
- MPI-3.0: [[versions/v30/API/MPI_TOPO_TEST|API note]] · chapter [[versions/v30/sections/topol|topol]]
- MPI-3.1: [[versions/v31/API/MPI_TOPO_TEST|API note]] · chapter [[versions/v31/sections/topol|topol]]
- MPI-4.0: [[versions/v40/API/MPI_TOPO_TEST|API note]] · chapter [[versions/v40/sections/topol|topol]]
- MPI-4.1: [[versions/v41/API/MPI_TOPO_TEST|API note]] · chapter [[versions/v41/sections/topol|topol]]
- MPI-5.0: [[versions/v50/API/MPI_TOPO_TEST|API note]] · chapter [[versions/v50/sections/topol|topol]]

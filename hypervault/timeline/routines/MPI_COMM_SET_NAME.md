---
title: MPI_COMM_SET_NAME
c_name: MPI_Comm_set_name
chapter: context
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_SET_NAME, MPI_Comm_set_name]
tags: [mpi/routine, mpi/context]
---

# MPI_COMM_SET_NAME

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_COMM_SET_NAME|MPI-2.0]] · [[versions/v21/API/MPI_COMM_SET_NAME|MPI-2.1]] · [[versions/v22/API/MPI_COMM_SET_NAME|MPI-2.2]] · [[versions/v30/API/MPI_COMM_SET_NAME|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_SET_NAME|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_SET_NAME|MPI-4.0]] · [[versions/v41/API/MPI_COMM_SET_NAME|MPI-4.1]] Δ · [[versions/v50/API/MPI_COMM_SET_NAME|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Comm_set_name(MPI_Comm comm, char *comm_name)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Comm_set_name(MPI_Comm comm, const char *comm_name)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Comm::Set_name(const char* comm_name)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_set_name(comm, comm_name, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    CHARACTER(LEN=*), INTENT(IN) :: comm_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_set_name(comm, comm_name, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    CHARACTER(LEN=*), INTENT(IN) :: comm_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_COMM_SET_NAME(COMM, COMM_NAME, IERROR)
    INTEGER COMM, IERROR
    CHARACTER*(*) COMM_NAME
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | INOUT | **MPI-2.0–MPI-5.0:** communicator whose identifier is to be set (handle) |
| `comm_name` | IN | **MPI-2.0–MPI-4.0:** the character string which is remembered as the name (string)<br>**MPI-4.1–MPI-5.0:** the character string that is remembered as the name (string) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_COMM_SET_NAME|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_SET_NAME|API note]] · chapter [[versions/v21/sections/context|context]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_SET_NAME|API note]] · chapter [[versions/v22/sections/context|context]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_SET_NAME|API note]] · chapter [[versions/v30/sections/context|context]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_SET_NAME|API note]] · chapter [[versions/v31/sections/context|context]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_SET_NAME|API note]] · chapter [[versions/v40/sections/context|context]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_SET_NAME|API note]] · chapter [[versions/v41/sections/context|context]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_SET_NAME|API note]] · chapter [[versions/v50/sections/context|context]]

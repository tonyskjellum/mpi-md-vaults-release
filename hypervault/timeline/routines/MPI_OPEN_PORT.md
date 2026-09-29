---
title: MPI_OPEN_PORT
c_name: MPI_Open_port
chapter: dynamic
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_OPEN_PORT, MPI_Open_port]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_OPEN_PORT

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_OPEN_PORT|MPI-2.0]] · [[versions/v21/API/MPI_OPEN_PORT|MPI-2.1]] · [[versions/v22/API/MPI_OPEN_PORT|MPI-2.2]] · [[versions/v30/API/MPI_OPEN_PORT|MPI-3.0]] Δ · [[versions/v31/API/MPI_OPEN_PORT|MPI-3.1]] Δ · [[versions/v40/API/MPI_OPEN_PORT|MPI-4.0]] Δ · [[versions/v41/API/MPI_OPEN_PORT|MPI-4.1]] · [[versions/v50/API/MPI_OPEN_PORT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Open_port(MPI_Info info, char *port_name)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Open_port(const MPI::Info& info, char* port_name)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Open_port(info, port_name, ierror) BIND(C)
    TYPE(MPI_Info), INTENT(IN) :: info
    CHARACTER(LEN=MPI_MAX_PORT_NAME), INTENT(OUT) :: port_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Open_port(info, port_name, ierror)
    TYPE(MPI_Info), INTENT(IN) :: info
    CHARACTER(LEN=MPI_MAX_PORT_NAME), INTENT(OUT) :: port_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_OPEN_PORT(INFO, PORT_NAME, IERROR)
    CHARACTER*(*) PORT_NAME
    INTEGER INFO, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_OPEN_PORT(INFO, PORT_NAME, IERROR)
    INTEGER INFO, IERROR
    CHARACTER*(*) PORT_NAME
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `info` | IN | **MPI-2.0–MPI-5.0:** implementation-specific information on how to establish an address (handle) |
| `port_name` | OUT | **MPI-2.0–MPI-5.0:** newly established port (string) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_OPEN_PORT|API note]] · chapter [[versions/v20/sections/dynamic|dynamic]]
- MPI-2.1: [[versions/v21/API/MPI_OPEN_PORT|API note]] · chapter [[versions/v21/sections/dynamic|dynamic]]
- MPI-2.2: [[versions/v22/API/MPI_OPEN_PORT|API note]] · chapter [[versions/v22/sections/dynamic|dynamic]]
- MPI-3.0: [[versions/v30/API/MPI_OPEN_PORT|API note]] · chapter [[versions/v30/sections/dynamic|dynamic]]
- MPI-3.1: [[versions/v31/API/MPI_OPEN_PORT|API note]] · chapter [[versions/v31/sections/dynamic|dynamic]]
- MPI-4.0: [[versions/v40/API/MPI_OPEN_PORT|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_OPEN_PORT|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_OPEN_PORT|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]

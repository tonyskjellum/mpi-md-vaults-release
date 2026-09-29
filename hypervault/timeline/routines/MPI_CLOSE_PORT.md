---
title: MPI_CLOSE_PORT
c_name: MPI_Close_port
chapter: dynamic
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_CLOSE_PORT, MPI_Close_port]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_CLOSE_PORT

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_CLOSE_PORT|MPI-2.0]] · [[versions/v21/API/MPI_CLOSE_PORT|MPI-2.1]] · [[versions/v22/API/MPI_CLOSE_PORT|MPI-2.2]] · [[versions/v30/API/MPI_CLOSE_PORT|MPI-3.0]] Δ · [[versions/v31/API/MPI_CLOSE_PORT|MPI-3.1]] Δ · [[versions/v40/API/MPI_CLOSE_PORT|MPI-4.0]] · [[versions/v41/API/MPI_CLOSE_PORT|MPI-4.1]] · [[versions/v50/API/MPI_CLOSE_PORT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Close_port(char *port_name)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Close_port(const char *port_name)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Close_port(const char* port_name)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Close_port(port_name, ierror) BIND(C)
    CHARACTER(LEN=*), INTENT(IN) :: port_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Close_port(port_name, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: port_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_CLOSE_PORT(PORT_NAME, IERROR)
    CHARACTER*(*) PORT_NAME
    INTEGER IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `port_name` | IN | **MPI-2.0–MPI-5.0:** a port (string) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_CLOSE_PORT|API note]] · chapter [[versions/v20/sections/dynamic|dynamic]]
- MPI-2.1: [[versions/v21/API/MPI_CLOSE_PORT|API note]] · chapter [[versions/v21/sections/dynamic|dynamic]]
- MPI-2.2: [[versions/v22/API/MPI_CLOSE_PORT|API note]] · chapter [[versions/v22/sections/dynamic|dynamic]]
- MPI-3.0: [[versions/v30/API/MPI_CLOSE_PORT|API note]] · chapter [[versions/v30/sections/dynamic|dynamic]]
- MPI-3.1: [[versions/v31/API/MPI_CLOSE_PORT|API note]] · chapter [[versions/v31/sections/dynamic|dynamic]]
- MPI-4.0: [[versions/v40/API/MPI_CLOSE_PORT|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_CLOSE_PORT|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_CLOSE_PORT|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]

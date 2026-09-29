---
title: MPI_PUBLISH_NAME
c_name: MPI_Publish_name
chapter: dynamic
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_PUBLISH_NAME, MPI_Publish_name]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_PUBLISH_NAME

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_PUBLISH_NAME|MPI-2.0]] · [[versions/v21/API/MPI_PUBLISH_NAME|MPI-2.1]] · [[versions/v22/API/MPI_PUBLISH_NAME|MPI-2.2]] · [[versions/v30/API/MPI_PUBLISH_NAME|MPI-3.0]] Δ · [[versions/v31/API/MPI_PUBLISH_NAME|MPI-3.1]] Δ · [[versions/v40/API/MPI_PUBLISH_NAME|MPI-4.0]] Δ · [[versions/v41/API/MPI_PUBLISH_NAME|MPI-4.1]] · [[versions/v50/API/MPI_PUBLISH_NAME|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Publish_name(char *service_name, MPI_Info info, char *port_name)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Publish_name(const char *service_name, MPI_Info info, const char *port_name)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::Publish_name(const char* service_name, const MPI::Info& info, const char* port_name)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Publish_name(service_name, info, port_name, ierror) BIND(C)
    TYPE(MPI_Info), INTENT(IN) :: info
    CHARACTER(LEN=*), INTENT(IN) :: service_name, port_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Publish_name(service_name, info, port_name, ierror)
    TYPE(MPI_Info), INTENT(IN) :: info
    CHARACTER(LEN=*), INTENT(IN) :: service_name, port_name
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Publish_name(service_name, info, port_name, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: service_name, port_name
    TYPE(MPI_Info), INTENT(IN) :: info
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_PUBLISH_NAME(SERVICE_NAME, INFO, PORT_NAME, IERROR)
    INTEGER INFO, IERROR
    CHARACTER*(*) SERVICE_NAME, PORT_NAME
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_PUBLISH_NAME(SERVICE_NAME, INFO, PORT_NAME, IERROR)
    CHARACTER*(*) SERVICE_NAME, PORT_NAME
    INTEGER INFO, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `service_name` | IN | **MPI-2.0–MPI-5.0:** a service name to associate with the port (string) |
| `info` | IN | **MPI-2.0–MPI-5.0:** implementation-specific information (handle) |
| `port_name` | IN | **MPI-2.0–MPI-5.0:** a port name (string) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_PUBLISH_NAME|API note]] · chapter [[versions/v20/sections/dynamic|dynamic]]
- MPI-2.1: [[versions/v21/API/MPI_PUBLISH_NAME|API note]] · chapter [[versions/v21/sections/dynamic|dynamic]]
- MPI-2.2: [[versions/v22/API/MPI_PUBLISH_NAME|API note]] · chapter [[versions/v22/sections/dynamic|dynamic]]
- MPI-3.0: [[versions/v30/API/MPI_PUBLISH_NAME|API note]] · chapter [[versions/v30/sections/dynamic|dynamic]]
- MPI-3.1: [[versions/v31/API/MPI_PUBLISH_NAME|API note]] · chapter [[versions/v31/sections/dynamic|dynamic]]
- MPI-4.0: [[versions/v40/API/MPI_PUBLISH_NAME|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_PUBLISH_NAME|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_PUBLISH_NAME|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]

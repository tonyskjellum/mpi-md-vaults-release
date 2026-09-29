---
title: MPI_COMM_ACCEPT
c_name: MPI_Comm_accept
chapter: dynamic
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_ACCEPT, MPI_Comm_accept]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_COMM_ACCEPT

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_COMM_ACCEPT|MPI-2.0]] · [[versions/v21/API/MPI_COMM_ACCEPT|MPI-2.1]] · [[versions/v22/API/MPI_COMM_ACCEPT|MPI-2.2]] · [[versions/v30/API/MPI_COMM_ACCEPT|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_ACCEPT|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_ACCEPT|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_ACCEPT|MPI-4.1]] Δ · [[versions/v50/API/MPI_COMM_ACCEPT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Comm_accept(char *port_name, MPI_Info info, int root, MPI_Comm comm, MPI_Comm *newcomm)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Comm_accept(const char *port_name, MPI_Info info, int root, MPI_Comm comm, MPI_Comm *newcomm)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Intercomm MPI::Intracomm::Accept(const char* port_name, const MPI::Info& info, int root) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_accept(port_name, info, root, comm, newcomm, ierror) BIND(C)
    CHARACTER(LEN=*), INTENT(IN) :: port_name
    TYPE(MPI_Info), INTENT(IN) :: info
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_accept(port_name, info, root, comm, newcomm, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: port_name
    TYPE(MPI_Info), INTENT(IN) :: info
    INTEGER, INTENT(IN) :: root
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: newcomm
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_COMM_ACCEPT(PORT_NAME, INFO, ROOT, COMM, NEWCOMM, IERROR)
    CHARACTER*(*) PORT_NAME
    INTEGER INFO, ROOT, COMM, NEWCOMM, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `port_name` | IN | **MPI-2.0–MPI-3.1:** port name (string, used only on `root`)<br>**MPI-4.0–MPI-5.0:** port name (string, significant only at root) |
| `info` | IN | **MPI-2.0–MPI-3.1:** implementation-dependent information (handle, used only on `root`)<br>**MPI-4.0–MPI-5.0:** implementation-dependent information (handle, significant only at root) |
| `root` | IN | **MPI-2.0–MPI-4.0:** rank in `comm` of root node (integer)<br>**MPI-4.1–MPI-5.0:** rank of root in `comm` (integer) |
| `comm` | IN | **MPI-2.0–MPI-3.1:** intracommunicator over which call is collective (handle)<br>**MPI-4.0–MPI-5.0:** intra-communicator over which call is collective (handle) |
| `newcomm` | OUT | **MPI-2.0–MPI-3.1:** intercommunicator with client as remote group (handle)<br>**MPI-4.0–MPI-5.0:** inter-communicator with client as remote group (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_COMM_ACCEPT|API note]] · chapter [[versions/v20/sections/dynamic|dynamic]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_ACCEPT|API note]] · chapter [[versions/v21/sections/dynamic|dynamic]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_ACCEPT|API note]] · chapter [[versions/v22/sections/dynamic|dynamic]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_ACCEPT|API note]] · chapter [[versions/v30/sections/dynamic|dynamic]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_ACCEPT|API note]] · chapter [[versions/v31/sections/dynamic|dynamic]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_ACCEPT|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_ACCEPT|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_ACCEPT|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]

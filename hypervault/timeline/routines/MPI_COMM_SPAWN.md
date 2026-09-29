---
title: MPI_COMM_SPAWN
c_name: MPI_Comm_spawn
chapter: dynamic
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_SPAWN, MPI_Comm_spawn]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_COMM_SPAWN

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_COMM_SPAWN|MPI-2.0]] · [[versions/v21/API/MPI_COMM_SPAWN|MPI-2.1]] · [[versions/v22/API/MPI_COMM_SPAWN|MPI-2.2]] · [[versions/v30/API/MPI_COMM_SPAWN|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_SPAWN|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_SPAWN|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_SPAWN|MPI-4.1]] · [[versions/v50/API/MPI_COMM_SPAWN|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Comm_spawn(char *command, char *argv[], int maxprocs, MPI_Info info, int root, MPI_Comm comm, MPI_Comm *intercomm, int array_of_errcodes[])
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Comm_spawn(const char *command, char *argv[], int maxprocs, MPI_Info info, int root, MPI_Comm comm, MPI_Comm *intercomm, int array_of_errcodes[])
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Intercomm MPI::Intracomm::Spawn(const char* command, const char* argv[], int maxprocs, const MPI::Info& info, int root, int array_of_errcodes[]) const
MPI::Intercomm MPI::Intracomm::Spawn(const char* command, const char* argv[], int maxprocs, const MPI::Info& info, int root) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_spawn(command, argv, maxprocs, info, root, comm, intercomm, array_of_errcodes, ierror) BIND(C)
    CHARACTER(LEN=*), INTENT(IN) :: command, argv(*)
    INTEGER, INTENT(IN) :: maxprocs, root
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: intercomm
    INTEGER :: array_of_errcodes(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Comm_spawn(command, argv, maxprocs, info, root, comm, intercomm, array_of_errcodes, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: command, argv(*)
    INTEGER, INTENT(IN) :: maxprocs, root
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: intercomm
    INTEGER :: array_of_errcodes(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_COMM_SPAWN(COMMAND, ARGV, MAXPROCS, INFO, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES, IERROR)
    CHARACTER*(*) COMMAND, ARGV(*)
    INTEGER INFO, MAXPROCS, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES(*), IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_COMM_SPAWN(COMMAND, ARGV, MAXPROCS, INFO, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES, IERROR)
    CHARACTER*(*) COMMAND, ARGV(*)
    INTEGER MAXPROCS, INFO, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES(*), IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `command` | IN | **MPI-2.0–MPI-5.0:** name of program to be spawned (string, significant only at root) |
| `argv` | IN | **MPI-2.0–MPI-5.0:** arguments to `command` (array of strings, significant only at root) |
| `maxprocs` | IN | **MPI-2.0–MPI-5.0:** maximum number of processes to start (integer, significant only at root) |
| `info` | IN | **MPI-2.0–MPI-5.0:** a set of key-value pairs telling the runtime system where and how to start the processes (handle, significant only at root) |
| `root` | IN | **MPI-2.0–MPI-5.0:** rank of process in which previous arguments are examined (integer) |
| `comm` | IN | **MPI-2.0–MPI-3.1:** intracommunicator containing group of spawning processes (handle)<br>**MPI-4.0–MPI-5.0:** intra-communicator containing group of spawning processes (handle) |
| `intercomm` | OUT | **MPI-2.0–MPI-3.1:** intercommunicator between original group and the newly spawned group (handle)<br>**MPI-4.0–MPI-5.0:** inter-communicator between original group and the newly spawned group (handle) |
| `array_of_errcodes` | OUT | **MPI-2.0–MPI-3.1:** one code per process (array of integer)<br>**MPI-4.0–MPI-5.0:** one code per process (array of integers) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_COMM_SPAWN|API note]] · chapter [[versions/v20/sections/dynamic|dynamic]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_SPAWN|API note]] · chapter [[versions/v21/sections/dynamic|dynamic]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_SPAWN|API note]] · chapter [[versions/v22/sections/dynamic|dynamic]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_SPAWN|API note]] · chapter [[versions/v30/sections/dynamic|dynamic]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_SPAWN|API note]] · chapter [[versions/v31/sections/dynamic|dynamic]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_SPAWN|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_SPAWN|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_SPAWN|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]

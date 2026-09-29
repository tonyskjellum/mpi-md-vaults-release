---
title: MPI_COMM_SPAWN_MULTIPLE
c_name: MPI_Comm_spawn_multiple
chapter: dynamic
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_COMM_SPAWN_MULTIPLE, MPI_Comm_spawn_multiple]
tags: [mpi/routine, mpi/dynamic]
---

# MPI_COMM_SPAWN_MULTIPLE

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_COMM_SPAWN_MULTIPLE|MPI-2.0]] · [[versions/v21/API/MPI_COMM_SPAWN_MULTIPLE|MPI-2.1]] · [[versions/v22/API/MPI_COMM_SPAWN_MULTIPLE|MPI-2.2]] · [[versions/v30/API/MPI_COMM_SPAWN_MULTIPLE|MPI-3.0]] Δ · [[versions/v31/API/MPI_COMM_SPAWN_MULTIPLE|MPI-3.1]] Δ · [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|MPI-4.0]] Δ · [[versions/v41/API/MPI_COMM_SPAWN_MULTIPLE|MPI-4.1]] · [[versions/v50/API/MPI_COMM_SPAWN_MULTIPLE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_Comm_spawn_multiple(int count, char *array_of_commands[], char **array_of_argv[], int array_of_maxprocs[], MPI_Info array_of_info[], int root, MPI_Comm comm, MPI_Comm *intercomm, int array_of_errcodes[])
```

**MPI-3.0–MPI-5.0**
```c
int MPI_Comm_spawn_multiple(int count, char *array_of_commands[], char **array_of_argv[], const int array_of_maxprocs[], const MPI_Info array_of_info[], int root, MPI_Comm comm, MPI_Comm *intercomm, int array_of_errcodes[])
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Intercomm MPI::Intracomm::Spawn_multiple(int count, const char* array_of_commands[], const char** array_of_argv[], const int array_of_maxprocs[], const MPI::Info array_of_info[], int root, int array_of_errcodes[])
MPI::Intercomm MPI::Intracomm::Spawn_multiple(int count, const char* array_of_commands[], const char** array_of_argv[], const int array_of_maxprocs[], const MPI::Info array_of_info[], int root)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Comm_spawn_multiple(count, array_of_commands, array_of_argv, array_of_maxprocs, array_of_info, root, comm, intercomm, array_of_errcodes, ierror) BIND(C)
    INTEGER, INTENT(IN) :: count, array_of_maxprocs(*), root
    CHARACTER(LEN=*), INTENT(IN) :: array_of_commands(*)
    CHARACTER(LEN=*), INTENT(IN) :: array_of_argv(count, *)
    TYPE(MPI_Info), INTENT(IN) :: array_of_info(*)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: intercomm
    INTEGER :: array_of_errcodes(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_Comm_spawn_multiple(count, array_of_commands, array_of_argv, array_of_maxprocs, array_of_info, root, comm, intercomm, array_of_errcodes, ierror)
    INTEGER, INTENT(IN) :: count, array_of_maxprocs(*), root
    CHARACTER(LEN=*), INTENT(IN) :: array_of_commands(*)
    CHARACTER(LEN=*), INTENT(IN) :: array_of_argv(count, *)
    TYPE(MPI_Info), INTENT(IN) :: array_of_info(*)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: intercomm
    INTEGER :: array_of_errcodes(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_Comm_spawn_multiple(count, array_of_commands, array_of_argv, array_of_maxprocs, array_of_info, root, comm, intercomm, array_of_errcodes, ierror)
    INTEGER, INTENT(IN) :: count, array_of_maxprocs(*), root
    CHARACTER(LEN=*), INTENT(IN) :: array_of_commands(*), array_of_argv(count, *)
    TYPE(MPI_Info), INTENT(IN) :: array_of_info(*)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    TYPE(MPI_Comm), INTENT(OUT) :: intercomm
    INTEGER :: array_of_errcodes(*)
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_COMM_SPAWN_MULTIPLE(COUNT, ARRAY_OF_COMMANDS, ARRAY_OF_ARGV, ARRAY_OF_MAXPROCS, ARRAY_OF_INFO, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES, IERROR)
    INTEGER COUNT, ARRAY_OF_INFO(*), ARRAY_OF_MAXPROCS(*), ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES(*), IERROR
    CHARACTER*(*) ARRAY_OF_COMMANDS(*), ARRAY_OF_ARGV(COUNT, *)
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_COMM_SPAWN_MULTIPLE(COUNT, ARRAY_OF_COMMANDS, ARRAY_OF_ARGV, ARRAY_OF_MAXPROCS, ARRAY_OF_INFO, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES, IERROR)
    INTEGER COUNT, ARRAY_OF_MAXPROCS(*), ARRAY_OF_INFO(*), ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES(*), IERROR
    CHARACTER*(*) ARRAY_OF_COMMANDS(*), ARRAY_OF_ARGV(COUNT, *)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `count` | IN | **MPI-2.0–MPI-3.1:** number of commands (positive integer, significant to MPI only at root --- see advice to users)<br>**MPI-4.0–MPI-5.0:** number of commands (positive integer, significant only at root) |
| `array_of_commands` | IN | **MPI-2.0–MPI-5.0:** programs to be executed (array of strings, significant only at root) |
| `array_of_argv` | IN | **MPI-2.0–MPI-5.0:** arguments for `commands` (array of array of strings, significant only at root) |
| `array_of_maxprocs` | IN | **MPI-2.0–MPI-3.1:** maximum number of processes to start for each command (array of integer, significant only at root)<br>**MPI-4.0–MPI-5.0:** maximum number of processes to start for each command (array of integers, significant only at root) |
| `array_of_info` | IN | **MPI-2.0–MPI-5.0:** info objects telling the runtime system where and how to start processes (array of handles, significant only at root) |
| `root` | IN | **MPI-2.0–MPI-5.0:** rank of process in which previous arguments are examined (integer) |
| `comm` | IN | **MPI-2.0–MPI-3.1:** intracommunicator containing group of spawning processes (handle)<br>**MPI-4.0–MPI-5.0:** intra-communicator containing group of spawning processes (handle) |
| `intercomm` | OUT | **MPI-2.0–MPI-3.1:** intercommunicator between original group and newly spawned group (handle)<br>**MPI-4.0–MPI-5.0:** inter-communicator between original group and the newly spawned group (handle) |
| `array_of_errcodes` | OUT | **MPI-2.0–MPI-3.1:** one error code per process (array of integer)<br>**MPI-4.0–MPI-5.0:** one error code per process (array of integers) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_COMM_SPAWN_MULTIPLE|API note]] · chapter [[versions/v20/sections/dynamic|dynamic]]
- MPI-2.1: [[versions/v21/API/MPI_COMM_SPAWN_MULTIPLE|API note]] · chapter [[versions/v21/sections/dynamic|dynamic]]
- MPI-2.2: [[versions/v22/API/MPI_COMM_SPAWN_MULTIPLE|API note]] · chapter [[versions/v22/sections/dynamic|dynamic]]
- MPI-3.0: [[versions/v30/API/MPI_COMM_SPAWN_MULTIPLE|API note]] · chapter [[versions/v30/sections/dynamic|dynamic]]
- MPI-3.1: [[versions/v31/API/MPI_COMM_SPAWN_MULTIPLE|API note]] · chapter [[versions/v31/sections/dynamic|dynamic]]
- MPI-4.0: [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|API note]] · chapter [[versions/v40/sections/dynamic|dynamic]]
- MPI-4.1: [[versions/v41/API/MPI_COMM_SPAWN_MULTIPLE|API note]] · chapter [[versions/v41/sections/dynamic|dynamic]]
- MPI-5.0: [[versions/v50/API/MPI_COMM_SPAWN_MULTIPLE|API note]] · chapter [[versions/v50/sections/dynamic|dynamic]]

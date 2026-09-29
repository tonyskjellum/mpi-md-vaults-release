---
title: MPI_COMM_SPAWN_MULTIPLE
c_name: MPI_Comm_spawn_multiple
lis_name: MPI_COMM_SPAWN_MULTIPLE
chapter: dynamic
aliases: [MPI_COMM_SPAWN_MULTIPLE, MPI_Comm_spawn_multiple]
tags: [mpi/function, mpi/dynamic]
---

# MPI_COMM_SPAWN_MULTIPLE

**C**
```c
int MPI_Comm_spawn_multiple(int count, char *array_of_commands[], char **array_of_argv[], int array_of_maxprocs[], MPI_Info array_of_info[], int root, MPI_Comm comm, MPI_Comm *intercomm, int array_of_errcodes[])
```

**C++**
```cpp
MPI::Intercomm MPI::Intracomm::Spawn_multiple(int count, const char* array_of_commands[], const char** array_of_argv[], const int array_of_maxprocs[], const MPI::Info array_of_info[], int root, int array_of_errcodes[])
MPI::Intercomm MPI::Intracomm::Spawn_multiple(int count, const char* array_of_commands[], const char** array_of_argv[], const int array_of_maxprocs[], const MPI::Info array_of_info[], int root)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of commands (positive integer, significant to MPI only at root --- see advice to users) |
| `array_of_commands` | IN | programs to be executed (array of strings, significant only at root) |
| `array_of_argv` | IN | arguments for `commands` (array of array of strings, significant only at root) |
| `array_of_maxprocs` | IN | maximum number of processes to start for each command (array of integer, significant only at root) |
| `array_of_info` | IN | info objects telling the runtime system where and how to start processes (array of handles, significant only at root) |
| `root` | IN | rank of process in which previous arguments are examined (integer) |
| `comm` | IN | intracommunicator containing group of spawning processes (handle) |
| `intercomm` | OUT | intercommunicator between original group and newly spawned group (handle) |
| `array_of_errcodes` | OUT | one error code per process (array of integer) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_SPAWN_MULTIPLE(COUNT, ARRAY_OF_COMMANDS, ARRAY_OF_ARGV, ARRAY_OF_MAXPROCS, ARRAY_OF_INFO, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES, IERROR)
  INTEGER COUNT, ARRAY_OF_INFO(*), ARRAY_OF_MAXPROCS(*), ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES(*), IERROR
  CHARACTER*(*) ARRAY_OF_COMMANDS(*), ARRAY_OF_ARGV(COUNT, *)
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

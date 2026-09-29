---
title: MPI_COMM_SPAWN
c_name: MPI_Comm_spawn
lis_name: MPI_COMM_SPAWN
chapter: dynamic
aliases: [MPI_COMM_SPAWN, MPI_Comm_spawn]
tags: [mpi/function, mpi/dynamic]
---

# MPI_COMM_SPAWN

**C**
```c
int MPI_Comm_spawn(char *command, char *argv[], int maxprocs, MPI_Info info, int root, MPI_Comm comm, MPI_Comm *intercomm, int array_of_errcodes[])
```

**C++**
```cpp
MPI::Intercomm MPI::Intracomm::Spawn(const char* command, const char* argv[], int maxprocs, const MPI::Info& info, int root, int array_of_errcodes[]) const
MPI::Intercomm MPI::Intracomm::Spawn(const char* command, const char* argv[], int maxprocs, const MPI::Info& info, int root) const
```

| Parameter | Intent | Description |
|---|---|---|
| `command` | IN | name of program to be spawned (string, significant only at root) |
| `argv` | IN | arguments to `command` (array of strings, significant only at root) |
| `maxprocs` | IN | maximum number of processes to start (integer, significant only at root) |
| `info` | IN | a set of key-value pairs telling the runtime system where and how to start the processes (handle, significant only at root) |
| `root` | IN | rank of process in which previous arguments are examined (integer) |
| `comm` | IN | intracommunicator containing group of spawning processes (handle) |
| `intercomm` | OUT | intercommunicator between original group and the newly spawned group (handle) |
| `array_of_errcodes` | OUT | one code per process (array of integer) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_SPAWN(COMMAND, ARGV, MAXPROCS, INFO, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES, IERROR)
  CHARACTER*(*) COMMAND, ARGV(*)
  INTEGER INFO, MAXPROCS, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES(*), IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

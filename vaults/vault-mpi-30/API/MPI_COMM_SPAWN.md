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
int MPI_Comm_spawn(const char *command, char *argv[], int maxprocs, MPI_Info info, int root, MPI_Comm comm, MPI_Comm *intercomm, int array_of_errcodes[])
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

**Fortran 2008**
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

**Fortran (mpif.h)**
```fortran
MPI_COMM_SPAWN(COMMAND, ARGV, MAXPROCS, INFO, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES, IERROR)
  CHARACTER*(*) COMMAND, ARGV(*)
  INTEGER INFO, MAXPROCS, ROOT, COMM, INTERCOMM, ARRAY_OF_ERRCODES(*), IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

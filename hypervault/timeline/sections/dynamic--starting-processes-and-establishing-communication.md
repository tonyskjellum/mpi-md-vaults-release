---
title: "Starting Processes and Establishing Communication"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Starting Processes and Establishing Communication

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Starting Processes and Establishing Communication|MPI-2.0]], [[versions/v21/sections/dynamic#Starting Processes and Establishing Communication|MPI-2.1]], [[versions/v22/sections/dynamic#Starting Processes and Establishing Communication|MPI-2.2]], [[versions/v30/sections/dynamic#Starting Processes and Establishing Communication|MPI-3.0]], [[versions/v31/sections/dynamic#Starting Processes and Establishing Communication|MPI-3.1]], [[versions/v40/sections/dynamic#Starting Processes and Establishing Communication|MPI-4.0]], [[versions/v41/sections/dynamic#Starting Processes and Establishing Communication|MPI-4.1]], [[versions/v50/sections/dynamic#Starting Processes and Establishing Communication|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

> It is possible in MPI to start a static SPMD or MPMD application by starting first one process and having that process start its siblings with [[versions/v21/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . This practice is discouraged primarily for reasons of performance. If possible, it is preferable to start all processes at once, as a single ~~MPI-1~~ ==> > MPI > >== application.

[[versions/v21/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] tries to start `maxprocs` identical copies of the MPI program specified by `command`, establishing communication with them and returning an intercommunicator. The spawned processes are referred to as children. The children have their own ~~[[MPI_COMM_WORLD]] ,~~ ==MPI_COMM_WORLD,== which is separate from that of the parents. [[versions/v21/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] is collective over `comm`, and also may not return until [[versions/v21/API/MPI_INIT|MPI_INIT]] has been called in the children. Similarly, [[versions/v21/API/MPI_INIT|MPI_INIT]] in the children may not return until all parents have called [[versions/v21/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . In this sense, [[versions/v21/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] in the parents and [[versions/v21/API/MPI_INIT|MPI_INIT]] in the children form a collective operation over the union of parent and child processes. The intercommunicator returned by [[versions/v21/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] contains the parent processes in

~~The ordering of processes in the local and remote groups is the same as the as the ordering of the group of the `comm` in the parents and of MPI_COMM_WORLD of the children, respectively. This intercommunicator can be obtained in the children through the function [[versions/v21/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] .~~

==The ordering of processes in the local and remote groups is the same==

==as the==

==ordering of the group of the `comm` in the parents and of MPI_COMM_WORLD of the children, respectively. This intercommunicator can be obtained in the children through the function [[versions/v21/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] .==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

[[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] tries to start `maxprocs` identical copies of the MPI program specified by `command`, establishing communication with them and returning an intercommunicator. The spawned processes are referred to as children. The children have their own ~~MPI_COMM_WORLD,~~ ==`MPI_COMM_WORLD`,== which is separate from that of the parents. [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] is collective over `comm`, and also may not return until [[versions/v22/API/MPI_INIT|MPI_INIT]] has been called in the children. Similarly, [[versions/v22/API/MPI_INIT|MPI_INIT]] in the children may not return until all parents have called [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . In this sense, [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] in the parents and [[versions/v22/API/MPI_INIT|MPI_INIT]] in the children form a collective operation over the union of parent and child processes. The intercommunicator returned by [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] contains the parent processes in

ordering of the group of the `comm` in the parents and of ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== of the children, respectively. This intercommunicator can be obtained in the children through the function [[versions/v22/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] .

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

> It is possible in MPI to start a static SPMD or MPMD application by ==first== starting ~~first~~ one process and having that process start its siblings with [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . This practice is discouraged primarily for reasons of performance. If possible, it is preferable to start all processes at once, as a single > > MPI ~~> >~~ application.

~~[[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] tries to start `maxprocs` identical copies of the MPI program specified by `command`, establishing communication with them and returning an intercommunicator. The spawned processes are referred to as children. The children have their own `MPI_COMM_WORLD`, which is separate from that of the parents. [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] is collective over `comm`, and also may not return until [[versions/v30/API/MPI_INIT|MPI_INIT]] has been called in the children. Similarly, [[versions/v30/API/MPI_INIT|MPI_INIT]] in the children may not return until all parents have called [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . In this sense, [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] in the parents and [[versions/v30/API/MPI_INIT|MPI_INIT]] in the children form a collective operation over the union of parent and child processes. The intercommunicator returned by [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] contains the parent processes in~~

~~the local group and the child processes in the remote group.~~

~~The ordering of processes in the local and remote groups is the same~~

~~as the~~

~~ordering of the group of the `comm` in the parents and of `MPI_COMM_WORLD` of the children, respectively. This intercommunicator can be obtained in the children through the function [[versions/v30/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] .~~

==[[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] tries to start `maxprocs` identical copies of the MPI program specified by `command`, establishing communication with them and returning an intercommunicator. The spawned processes are referred to as children. The children have their own `MPI_COMM_WORLD`, which is separate from that of the parents. [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] is collective over `comm`, and also may not return until [[versions/v30/API/MPI_INIT|MPI_INIT]] has been called in the children. Similarly, [[versions/v30/API/MPI_INIT|MPI_INIT]] in the children may not return until all parents have called [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . In this sense, [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] in the parents and [[versions/v30/API/MPI_INIT|MPI_INIT]] in the children form a collective operation over the union of parent and child processes. The intercommunicator returned by [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] contains the parent processes in the local group and the child processes in the remote group. The ordering of processes in the local and remote groups is the same==

==as the ordering of the group of the `comm` in the parents and of `MPI_COMM_WORLD` of the children, respectively. This intercommunicator can be obtained in the children through the function [[versions/v30/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] .==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

> It is possible in MPI to start a static SPMD or MPMD application by first starting one process and having that process start its siblings with [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . This practice is discouraged primarily for reasons of performance. If possible, it is preferable to start all processes at once, as a single ~~> >~~ MPI application.

~~[[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] tries to start `maxprocs` identical copies of the MPI program specified by `command`, establishing communication with them and returning an intercommunicator. The spawned processes are referred to as children. The children have their own `MPI_COMM_WORLD`, which is separate from that of the parents. [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] is collective over `comm`, and also may not return until [[versions/v31/API/MPI_INIT|MPI_INIT]] has been called in the children. Similarly, [[versions/v31/API/MPI_INIT|MPI_INIT]] in the children may not return until all parents have called [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . In this sense, [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] in the parents and [[versions/v31/API/MPI_INIT|MPI_INIT]] in the children form a collective operation over the union of parent and child processes. The intercommunicator returned by [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] contains the parent processes in the local group and the child processes in the remote group. The ordering of processes in the local and remote groups is the same~~

~~as the ordering of the group of the `comm` in the parents and of `MPI_COMM_WORLD` of the children, respectively. This intercommunicator can be obtained in the children through the function [[versions/v31/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] .~~

==[[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] tries to start `maxprocs` identical copies of the MPI program specified by `command`, establishing communication with them and returning an intercommunicator. The spawned processes are referred to as children. The children have their own `MPI_COMM_WORLD`, which is separate from that of the parents. [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] is collective over `comm`, and also may not return until [[versions/v31/API/MPI_INIT|MPI_INIT]] has been called in the children. Similarly, [[versions/v31/API/MPI_INIT|MPI_INIT]] in the children may not return until all parents have called [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . In this sense, [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] in the parents and [[versions/v31/API/MPI_INIT|MPI_INIT]] in the children form a collective operation over the union of parent and child processes. The intercommunicator returned by [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] contains the parent processes in the local group and the child processes in the remote group. The ordering of processes in the local and remote groups is the same as the ordering of the group of the `comm` in the parents and of `MPI_COMM_WORLD` of the children, respectively. This intercommunicator can be obtained in the children through the function [[versions/v31/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] .==

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

The following routine starts a number of MPI processes and establishes communication with them, returning an ~~intercommunicator.~~ ==inter-communicator.==

> It is possible in MPI to start ~~a static~~ ==an== SPMD or MPMD application ==with a fixed number of processes after initialization== by first starting one process and having that process start its siblings with [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . This practice is discouraged primarily for reasons of performance. If possible, it is preferable to start all processes at once, as a single MPI application.

[[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] tries to start `maxprocs` identical copies of the MPI program specified by `command`, establishing communication with them and returning an ~~intercommunicator.~~ ==inter-/communicator.== The spawned processes are referred to as children. The children have their own `MPI_COMM_WORLD`, which is separate from that of the parents. [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] is collective over `comm`, and also may not return until [[versions/v40/API/MPI_INIT|MPI_INIT]] has been called in the children. Similarly, [[versions/v40/API/MPI_INIT|MPI_INIT]] in the children may not return until all parents have called [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . In this sense, [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] in the parents and [[versions/v40/API/MPI_INIT|MPI_INIT]] in the children form a collective operation over the union of parent and child processes. The ~~intercommunicator~~ ==inter-communicator== returned by [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] contains the parent processes in the local group and the child processes in the remote group. The ordering of processes in the local and remote groups is the same as the ordering of the group of the `comm` in the parents and of `MPI_COMM_WORLD` of the children, respectively. This ~~intercommunicator~~ ==inter-communicator== can be obtained in the children through the function [[versions/v40/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] .

> An implementation may automatically establish communication before [[versions/v40/API/MPI_INIT|MPI_INIT]] is called by the children. Thus, completion of [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] in the parent does not necessarily mean that [[versions/v40/API/MPI_INIT|MPI_INIT]] has been called in the children (although the returned ~~intercommunicator~~ ==inter-communicator== can be used immediately).

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==The arguments are:==

==`command`:   The `command` argument is a string containing the name of a program to be spawned. The string is null-terminated in C. In Fortran, leading and trailing spaces are stripped. MPI does not specify how to find the executable or how the working directory is determined. These rules are implementation-dependent and should be appropriate for the runtime environment.==

==> [!warning] Advice to implementors==

==> The implementation should use a natural rule for finding executables and determining working directories. For instance, a homogeneous system with a global file system might look first in the working directory of the spawning process, or might search the directories in a PATH environment variable as do Unix shells. An implementation should document its rules for finding executables and determining working directories, and a high-quality implementation should give the user some control over these rules.==

==If the program named in `command` does not call [[versions/v41/API/MPI_INIT|MPI_INIT]] , but instead forks a process that calls [[versions/v41/API/MPI_INIT|MPI_INIT]] , the results are undefined. Implementations may allow this case to work but are not required to.==

==> [!note] Advice to users==

==> MPI does not say what happens if the program you start is a shell script and that shell script starts a program that calls [[versions/v41/API/MPI_INIT|MPI_INIT]] . Though some implementations may allow you to do this, they may also have restrictions, such as requiring that arguments supplied to the shell script be supplied to the program, or requiring that certain parts of the environment not be changed.==

==`argv`:   `argv` is an array of strings containing arguments that are passed to the program. The first element of `argv` is the first argument passed to `command`, not, as is conventional in some contexts, the command itself. The argument list is terminated by `NULL` in C and an empty string in Fortran. In Fortran, leading and trailing spaces are always stripped, so that a string consisting of all spaces is considered an empty string. The constant `MPI_ARGV_NULL` may be used in C and Fortran to indicate an empty argument list. In C this constant is the same as `NULL`.==

==Examples of `argv` in C and Fortran==

==To run the program “ocean” with arguments “-gridfile” and “ocean1.grd” in C:==

==(code block added)==
``` [MPI]C
char command[] = "ocean";
char *argv[] = {"-gridfile", "ocean1.grd", NULL};
MPI_Comm_spawn(command, argv, ...);
```

==or, if not everything is known at compile time:==

==(code block added)==
``` [MPI]C
char *command;
char **argv;
command = "ocean";
argv=(char **)malloc(3 * sizeof(char *));
argv[0] = "-gridfile";
argv[1] = "ocean1.grd";
argv[2] = NULL;
MPI_Comm_spawn(command, argv, ...);
```

==In Fortran:==

==(code block added)==
``` [MPI]Fortran
CHARACTER*25 command, argv(3)
command = 'ocean'
argv(1) = '-gridfile'
argv(2) = 'ocean1.grd'
argv(3) = ' '
call MPI_COMM_SPAWN(command, argv, ...)
```

==Arguments are supplied to the program if this is allowed by the operating system. In C, the [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] argument `argv` differs from the `argv` argument of `main` in two respects. First, it is shifted by one element. Specifically, `argv[0]` of `main` is provided by the implementation and conventionally contains the name of the program (given by `command`). `argv[1]` of `main` corresponds to `argv[0]` in [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , `argv[2]` of `main` to `argv[1]` of [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , etc. Passing an `argv` of `MPI_ARGV_NULL` to [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] results in `main` receiving `argc` of 1 and an `argv` whose element 0 is (conventionally) the name of the program. Second, `argv` of [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] must be null-terminated, so that its length can be determined.==

==If a Fortran implementation supplies routines that allow a program to obtain its arguments, the arguments may be available through that mechanism. In C, if the operating system does not support arguments appearing in `argv` of `main()`, the MPI implementation may add the arguments to the `argv` that is passed to [[versions/v41/API/MPI_INIT|MPI_INIT]] .==

==`maxprocs`:   MPI tries to spawn `maxprocs` processes. If it is unable to spawn `maxprocs` processes, it raises an error of class `MPI_ERR_SPAWN`.==

==An implementation may allow the `info` argument to change the default behavior, such that if the implementation is unable to spawn all `maxprocs` processes, it may spawn a smaller number of processes instead of raising an error. In principle, the `info` argument may specify an arbitrary set $`\{m_i: 0 \leq m_i \leq \texttt{maxprocs}\}`$ of allowed values for the number of processes spawned. The set $`\{m_i\}`$ does not necessarily include the value `maxprocs`. If an implementation is able to spawn one of these allowed numbers of processes, [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] returns successfully and the number of spawned processes, $`m`$, is given by the size of the remote group of `intercomm`. If $`m`$ is less than `maxproc`, reasons why the other processes were not spawned are given in `array_of_errcodes` as described below. If it is not possible to spawn one of the allowed numbers of processes, [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] raises an error of class `MPI_ERR_SPAWN`.==

==A spawn call with the default behavior is called *hard*. A spawn call for which fewer than `maxprocs` processes may be returned is called `soft`. See [[versions/v41/sections/dynamic#Reserved Keys|Reserved Keys]] for more information on the `soft` key for `info`.==

==> [!note] Advice to users==

==> By default, requests are hard and MPI errors are fatal. This means that by default there will be a fatal error if MPI cannot spawn all the requested processes. If you want the behavior “spawn as many processes as possible, up to $`N`$,” you should do a soft spawn, where the set of allowed values $`\{m_i\}`$ is $`\{0, ..., N\}`$. However, this is not completely portable, as implementations are not required to support soft spawning.==

==`info`:   The `info` argument to all of the routines in this==

==chapter is an opaque handle of type `MPI_Info` in C and Fortran with the `mpi_f08` module and `INTEGER` in Fortran with the `mpi` module or the include file `mpif.h` (deprecated). It is a container for a number of user-specified (`key`,`value`) pairs. `key` and `value` are strings (null-terminated `char*` in C, `character*(*)` in Fortran). Routines to create and manipulate the `info` argument are described in [[Chapter]] subsec:info.==

==For the [[SPAWN]] calls, `info` provides additional (and possibly implementation-dependent) instructions to MPI and the runtime system on how to start processes. An application may pass `MPI_INFO_NULL` in C or Fortran. Portable programs not requiring detailed control over process locations should use `MPI_INFO_NULL`.==

==MPI does not specify the content of the `info` argument, except to reserve a number of special `key` values (see [[versions/v41/sections/dynamic#Reserved Keys|Reserved Keys]] ). The `info` argument is quite flexible and could even be used, for example, to specify the executable and its command-line arguments. In this case the `command` argument to [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] could be empty. The ability to do this follows from the fact that MPI does not specify how an executable is found, and the `info` argument can tell the runtime system where to “find” the executable (empty string). Of course, a program that does this will not be portable across MPI implementations.==

==`root`:   All arguments before the `root` argument are examined only on the process whose rank in `comm` is equal to `root`. The value of these arguments on other processes is ignored.==

==`array_of_errcodes`:   The `array_of_errcodes` is an array of length `maxprocs` in which MPI reports the status of each process that MPI was requested to start. If all `maxprocs` processes were spawned, `array_of_errcodes` is filled in with the value `MPI_SUCCESS`. If only $`m`$ ($`0 \leq m < \texttt{maxprocs}`$) processes are spawned, $`m`$ of the entries will contain `MPI_SUCCESS` and the rest will contain an implementation-specific error code indicating the reason MPI could not start the process. MPI does not specify which entries correspond to failed processes. An implementation may, for instance, fill in error codes in one-to-one correspondence with a detailed specification in the `info` argument. These error codes all belong to the error class `MPI_ERR_SPAWN` if there was no error in the argument list. In C or Fortran, an application may pass `MPI_ERRCODES_IGNORE` if it is not interested in the error codes.==

==> [!warning] Advice to implementors==

==> `MPI_ERRCODES_IGNORE` in Fortran is a special type of constant, like `MPI_BOTTOM`. See the discussion in [[versions/v41/sections/terms#Named Constants|Named Constants]] .==

==![[versions/v41/API/MPI_COMM_GET_PARENT]]==

==If a process was started with [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] or [[versions/v41/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , [[versions/v41/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] returns the “parent” inter-communicator of the current process. This parent inter-communicator is created implicitly inside of [[versions/v41/API/MPI_INIT|MPI_INIT]] and is the same inter-communicator returned by [[SPAWN]] in the parents.==

==If the process was not spawned, [[versions/v41/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] returns `MPI_COMM_NULL`.==

==After the parent communicator is freed or disconnected, [[versions/v41/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] returns `MPI_COMM_NULL`.==

==> [!note] Advice to users==

==> [[versions/v41/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] returns a handle to a single inter-communicator. Calling [[versions/v41/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] a second time returns a handle to the same inter-communicator. Freeing the handle with [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] or [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] will cause other references to the inter-communicator to become invalid (dangling). Note that calling [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] on the parent communicator is not useful.==

==> [!tip] Rationale==

==> The desire of the Forum was to create a constant `MPI_COMM_PARENT` similar to `MPI_COMM_WORLD`. Unfortunately such a constant cannot be used (syntactically) as an argument to [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , which is explicitly allowed.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Starting Processes and Establishing Communication]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Starting Processes and Establishing Communication]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Starting Processes and Establishing Communication]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Starting Processes and Establishing Communication]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Starting Processes and Establishing Communication]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Starting Processes and Establishing Communication]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Starting Processes and Establishing Communication]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Starting Processes and Establishing Communication]]

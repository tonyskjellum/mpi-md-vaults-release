---
title: "The `array_of_errcodes` argument"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/dynamic]
---

# The `array_of_errcodes` argument

Chapter **dynamic** · in [[versions/v20/sections/dynamic#The `array_of_errcodes` argument|MPI-2.0]], [[versions/v21/sections/dynamic#The `array_of_errcodes` argument|MPI-2.1]], [[versions/v22/sections/dynamic#The `array_of_errcodes` argument|MPI-2.2]], [[versions/v30/sections/dynamic#The `array_of_errcodes` argument|MPI-3.0]], [[versions/v31/sections/dynamic#The `array_of_errcodes` argument|MPI-3.1]], [[versions/v40/sections/dynamic#The `array_of_errcodes` argument|MPI-4.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

The `array_of_errcodes` is an array of length `maxprocs` in which MPI reports the status of each process that MPI was requested to start. If all `maxprocs` processes were spawned, `array_of_errcodes` is filled in with the value ~~[[MPI_SUCCESS]] .~~ ==MPI_SUCCESS.== If only $`m`$ ($`0 \leq m < \texttt{maxprocs}`$) processes are spawned, $`m`$ of the entries will contain ~~[[MPI_SUCCESS]]~~ ==MPI_SUCCESS== and the rest will contain an implementation-specific error code indicating the reason MPI could not start the process. MPI does not specify which entries correspond to failed processes. An implementation may, for instance, fill in error codes in one-to-one correspondence with a detailed specification in the `info` argument. These error codes all belong to the error class `MPI_ERR_SPAWN` if there was no error in the argument list.

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

The `array_of_errcodes` is an array of length `maxprocs` in which MPI reports the status of each process that MPI was requested to start. If all `maxprocs` processes were spawned, `array_of_errcodes` is filled in with the value ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.== If only $`m`$ ($`0 \leq m < \texttt{maxprocs}`$) processes are spawned, $`m`$ of the entries will contain ~~MPI_SUCCESS~~ ==`MPI_SUCCESS`== and the rest will contain an implementation-specific error code indicating the reason MPI could not start the process. MPI does not specify which entries correspond to failed processes. An implementation may, for instance, fill in error codes in one-to-one correspondence with a detailed specification in the `info` argument. These error codes all belong to the error class `MPI_ERR_SPAWN` if there was no error in the argument list.

In C or Fortran, an application may pass ~~MPI_ERRCODES_IGNORE~~ ==`MPI_ERRCODES_IGNORE`== if it is not interested in the error codes. In C++ this constant does not exist, and the `array_of_errcodes` argument may be omitted from the argument list.

> ~~MPI_ERRCODES_IGNORE~~ ==`MPI_ERRCODES_IGNORE`== in Fortran is a special type of constant, like ~~MPI_BOTTOM.~~ ==`MPI_BOTTOM`.== See the discussion in Section [[versions/v22/sections/terms#Named Constants|Named Constants]] on page [[versions/v22/sections/terms#Named Constants|Named Constants]] .

If the process was not spawned, [[versions/v22/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] returns ~~MPI_COMM_NULL.~~ ==`MPI_COMM_NULL`.==

After the parent communicator is freed or disconnected, [[versions/v22/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] returns ~~MPI_COMM_NULL.~~ ==`MPI_COMM_NULL`.==

> The desire of the Forum was to create a constant `MPI_COMM_PARENT` similar to ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.== Unfortunately such a constant cannot be used (syntactically) as an argument to [[versions/v22/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , which is explicitly allowed.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~In C or Fortran, an application may pass `MPI_ERRCODES_IGNORE` if it is not interested in the error codes. In C++ this constant does not exist, and the `array_of_errcodes` argument may be omitted from the argument list.~~

==In C or Fortran,==

==an application may pass `MPI_ERRCODES_IGNORE` if it is not interested in the error codes.==

> `MPI_ERRCODES_IGNORE` in Fortran is a special type ==> >== of constant, like `MPI_BOTTOM`. See the discussion in Section [[versions/v30/sections/terms#Named Constants|Named Constants]] on page [[versions/v30/sections/terms#Named Constants|Named Constants]] .

> [[versions/v30/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] returns a handle to a single intercommunicator. Calling [[versions/v30/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] a second time returns a handle to the same intercommunicator. Freeing the handle with [[versions/v30/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] or [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] will cause other references to the intercommunicator to become invalid (dangling). ~~> >~~ Note that calling [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] on the parent communicator is not useful.

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~The `array_of_errcodes` is an array of length `maxprocs` in which MPI reports the status of each process that MPI was requested to start. If all `maxprocs` processes were spawned, `array_of_errcodes` is filled in with the value `MPI_SUCCESS`. If only $`m`$ ($`0 \leq m < \texttt{maxprocs}`$) processes are spawned, $`m`$ of the entries will contain `MPI_SUCCESS` and the rest will contain an implementation-specific error code indicating the reason MPI could not start the process. MPI does not specify which entries correspond to failed processes. An implementation may, for instance, fill in error codes in one-to-one correspondence with a detailed specification in the `info` argument. These error codes all belong to the error class `MPI_ERR_SPAWN` if there was no error in the argument list.~~

~~In C or Fortran,~~

~~an application may pass `MPI_ERRCODES_IGNORE` if it is not interested in the error codes.~~

==The `array_of_errcodes` is an array of length `maxprocs` in which MPI reports the status of each process that MPI was requested to start. If all `maxprocs` processes were spawned, `array_of_errcodes` is filled in with the value `MPI_SUCCESS`. If only $`m`$ ($`0 \leq m < \texttt{maxprocs}`$) processes are spawned, $`m`$ of the entries will contain `MPI_SUCCESS` and the rest will contain an implementation-specific error code indicating the reason MPI could not start the process. MPI does not specify which entries correspond to failed processes. An implementation may, for instance, fill in error codes in one-to-one correspondence with a detailed specification in the `info` argument. These error codes all belong to the error class `MPI_ERR_SPAWN` if there was no error in the argument list. In C or Fortran, an application may pass `MPI_ERRCODES_IGNORE` if it is not interested in the error codes.==

> `MPI_ERRCODES_IGNORE` in Fortran is a special type ~~> >~~ of constant, like `MPI_BOTTOM`. See the discussion in ~~Section [[versions/v31/sections/terms#Named Constants|Named Constants]] on page~~ [[versions/v31/sections/terms#Named Constants|Named Constants]] .

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

If a process was started with [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] or [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , [[versions/v40/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] returns the “parent” ~~intercommunicator~~ ==inter-communicator== of the current process. This parent ~~intercommunicator~~ ==inter-communicator== is created implicitly inside of [[versions/v40/API/MPI_INIT|MPI_INIT]] and is the same ~~intercommunicator~~ ==inter-communicator== returned by [[SPAWN]] in the parents.

> [[versions/v40/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] returns a handle to a single ~~intercommunicator.~~ ==inter-communicator.== Calling [[versions/v40/API/MPI_COMM_GET_PARENT|MPI_COMM_GET_PARENT]] a second time returns a handle to the same ~~intercommunicator.~~ ==inter-communicator.== Freeing the handle with [[versions/v40/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] or [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] will cause other references to the ~~intercommunicator~~ ==inter-communicator== to become invalid (dangling). Note that calling [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] on the parent communicator is not useful.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#The `array_of_errcodes` argument]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#The `array_of_errcodes` argument]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#The `array_of_errcodes` argument]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#The `array_of_errcodes` argument]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#The `array_of_errcodes` argument]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#The `array_of_errcodes` argument]]

---
title: "Error Handlers for Communicators"
chapter: inquiry
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Error Handlers for Communicators

Chapter **inquiry** · in [[versions/v21/sections/inquiry#Error Handlers for Communicators|MPI-2.1]], [[versions/v22/sections/inquiry#Error Handlers for Communicators|MPI-2.2]], [[versions/v30/sections/inquiry#Error Handlers for Communicators|MPI-3.0]], [[versions/v31/sections/inquiry#Error Handlers for Communicators|MPI-3.1]], [[versions/v40/sections/inquiry#Error Handlers for Communicators|MPI-4.0]], [[versions/v41/sections/inquiry#Error Handlers for Communicators|MPI-4.1]], [[versions/v50/sections/inquiry#Error Handlers for Communicators|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

The user routine should be, in C, a function of type ~~`MPI_Comm_errhandler_fn`,~~ ==`MPI_Comm_errhandler_function`,== which is defined as

The second is the error code to be returned by the MPI routine that raised the error. If the routine would have returned ~~MPI_ERR_IN_STATUS,~~ ==`MPI_ERR_IN_STATUS`,== it is the error code returned in the status for the request that caused the error handler to be invoked.

~~> [!note] Advice to users~~

~~> Users are discouraged from using a Fortran > > `{COMM$`|`$WIN$`|`$FILE}\_ERRHANDLER_FN` > > since the routine expects a variable number of arguments. Some Fortran systems may allow this but some may fail to give the correct result or compile/link this code. Thus, it will not, in general, be possible to create portable code with a Fortran > > `{COMM$`|`$WIN$`|`$FILE}\_ERRHANDLER_FN` .~~

> A newly > > created communicator inherits the error handler that is associated with the “parent” communicator. In particular, the user can specify a “global” error handler for all communicators by associating this handler with the communicator ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== immediately after initialization.

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~Creates an error handler that can be attached to communicators. This function is identical to [[versions/v22/API/MPI_ERRHANDLER_CREATE|MPI_ERRHANDLER_CREATE]] ,~~

~~whose use is deprecated.~~

==Creates an error handler that can be attached to communicators.==

~~The first argument is the communicator in use.~~

~~The second is the error code to be returned by the MPI routine that raised the error. If the routine would have returned `MPI_ERR_IN_STATUS`, it is the error code returned in the status for the request that caused the error handler to be invoked.~~

~~The remaining arguments are “`stdargs`” arguments whose number and meaning is implementation-dependent. An implementation should clearly document these arguments. Addresses are used so that the handler may be written in Fortran.~~

~~This typedef replaces `MPI_Handler_function`, whose use is deprecated.~~

~~In Fortran, the user routine should be of the form:~~

~~In C++, the user routine should be of the form:~~

==The first argument is the communicator in use. The second is the error code to be returned by the MPI routine that raised the error. If the routine would have returned `MPI_ERR_IN_STATUS`, it is the error code returned in the status for the request that caused the error handler to be invoked. The remaining arguments are “`varargs`” arguments whose number and meaning is implementation-dependent. An implementation should clearly document these arguments. Addresses are used so that the handler may be written in Fortran.==

==With the Fortran `mpi_f08` module, the user routine `comm_errhandler_fn` should be of the form:==

==With the Fortran `mpi` module and `mpif.h`, the user routine `COMM_ERRHANDLER_FN` should be of the form:==

> The variable argument list is provided because it provides an > > ISO-standard ~~> >~~ hook for providing additional information to the error handler; without this hook, > > ISO C ~~> >~~ prohibits additional arguments.

> A newly ~~> >~~ created communicator inherits the error handler that is associated with the “parent” communicator. In particular, the user can specify a “global” error handler for all communicators by associating this handler with the communicator `MPI_COMM_WORLD` immediately after initialization.

~~Attaches a new error handler to a communicator. The error handler must be either a predefined error handler, or an error handler created by a call to [[versions/v30/API/MPI_COMM_CREATE_ERRHANDLER|MPI_COMM_CREATE_ERRHANDLER]] . This call is identical to [[versions/v22/API/MPI_ERRHANDLER_SET|MPI_ERRHANDLER_SET]] ,~~

~~whose use is deprecated.~~

==Attaches a new error handler to a communicator. The error handler must be either a predefined error handler, or an error handler created by a call to [[versions/v30/API/MPI_COMM_CREATE_ERRHANDLER|MPI_COMM_CREATE_ERRHANDLER]] .==

~~Retrieves the error handler currently associated with a communicator. This call is identical to [[versions/v22/API/MPI_ERRHANDLER_GET|MPI_ERRHANDLER_GET]] ,~~

~~whose use is deprecated.~~

~~Example: A library function may register at its entry point the current error handler for a communicator, set its own private error handler for this communicator, and restore before exiting the previous error handler.~~

==Retrieves the error handler currently associated with a communicator.==

==For example, a library function may register at its entry point the current error handler for a communicator, set its own private error handler for this communicator, and restore before exiting the previous error handler.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

> The variable argument list is provided because it provides an ~~> >~~ ISO-standard hook for providing additional information to the error handler; without this hook, ~~> >~~ ISO C prohibits additional arguments.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The first argument is the communicator in use. The second is the error code to be returned by the MPI routine that raised the error. If the routine would have returned `MPI_ERR_IN_STATUS`, it is the error code returned in the status for the request that caused the error handler to be invoked. The remaining arguments are “`varargs`” arguments whose number and meaning is ~~implementation-dependent.~~ ==implementation-/dependent.== An implementation should clearly document these arguments. Addresses are used so that the handler may be written in Fortran.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

With the Fortran `mpi` module and ~~`mpif.h`,~~ ==(deprecated) `mpif.h` include file,== the user routine `COMM_ERRHANDLER_FN` should be of the form:

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

~~Creates an error handler that can be attached to communicators.~~

~~The user routine should be, in C, a function of type `MPI_Comm_errhandler_function`, which is defined as~~

==Creates an error handler that can be attached to communicators. The user routine should be, in C, a function of type `MPI_Comm_errhandler_function`, which is defined as==

~~> [!note] Advice to users~~

~~> A newly created communicator inherits the error handler that is associated with the “parent” communicator. In particular, the user can specify a “global” error handler for all communicators by associating this handler with the communicator `MPI_COMM_WORLD` immediately after initialization.~~

==> [!note] Advice to users==

==> A newly created communicator inherits the error handler that is associated with the “parent” communicator. In the World Model, the user can specify an error handler for all communicators by associating this handler with the predefined communicators (i.e., `MPI_COMM_WORLD` and `MPI_COMM_SELF`) before creating other communicators.==

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Error Handlers for Communicators]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Error Handlers for Communicators]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Error Handlers for Communicators]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Error Handlers for Communicators]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Error Handlers for Communicators]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Error Handlers for Communicators]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Error Handlers for Communicators]]

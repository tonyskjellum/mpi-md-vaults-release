---
title: "Error Handlers"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Error Handlers

Chapter **one-side** · in [[versions/v20/sections/one-side#Error Handlers|MPI-2.0]], [[versions/v21/sections/one-side#Error Handlers|MPI-2.1]], [[versions/v22/sections/one-side#Error Handlers|MPI-2.2]], [[versions/v30/sections/one-side#Error Handlers|MPI-3.0]], [[versions/v31/sections/one-side#Error Handlers|MPI-3.1]], [[versions/v40/sections/one-side#Error Handlers|MPI-4.0]], [[versions/v41/sections/one-side#Error Handlers|MPI-4.1]], [[versions/v50/sections/one-side#Error Handlers|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

The default error handler associated with `win` is MPI_ERRORS_ARE_FATAL. Users may change this default by explicitly associating a new error handler with `win` (see Section ~~[[misc-sec-errhandler]]~~ ==[[versions/v21/sections/inquiry#Error Handling|Error Handling]]== , page ~~[[misc-sec-errhandler]]~~ ==[[versions/v21/sections/inquiry#Error Handling|Error Handling]]== ).

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The default error handler associated with `win` is ~~MPI_ERRORS_ARE_FATAL.~~ ==`MPI_ERRORS_ARE_FATAL`.== Users may change this default by explicitly associating a new error handler with `win` (see Section [[versions/v22/sections/inquiry#Error Handling|Error Handling]] , page [[versions/v22/sections/inquiry#Error Handling|Error Handling]] ).

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

Errors occurring during calls to ==routines that create MPI windows (e.g.,== [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] ==`(...,comm,...)`)== cause the error handler currently associated with `comm` to be invoked. All other RMA calls have an input `win` argument. When an error occurs during such a call, the error handler currently associated with `win` is invoked.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

Errors occurring during calls to routines that create MPI windows (e.g., [[versions/v31/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] ~~`(...,comm,...)`)~~ ==`(`$`...`$`,comm,`$`...`$`)`)== cause the error handler currently associated with `comm` to be invoked. All other RMA calls have an input `win` argument. When an error occurs during such a call, the error handler currently associated with `win` is invoked.

The default error handler associated with `win` is `MPI_ERRORS_ARE_FATAL`. Users may change this default by explicitly associating a new error handler with `win` (see ~~Section [[versions/v31/sections/inquiry#Error Handling|Error Handling]] , page~~ [[versions/v31/sections/inquiry#Error Handling|Error Handling]] ).

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The ~~default~~ error handler ==`MPI_ERRORS_ARE_FATAL` is== associated with `win` ~~is `MPI_ERRORS_ARE_FATAL`.~~ ==during its creation.== Users may change this default by explicitly associating a new error handler with `win` (see [[versions/v40/sections/inquiry#Error Handling|Error Handling]] ).

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Errors occurring during calls to routines that create MPI windows (e.g., [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] ~~`(`$`...`$`,comm,`$`...`$`)`)~~ ==)== cause ~~the~~ ==an== error ~~handler currently associated with `comm`~~ to be ~~invoked.~~ ==raised on the communicator provided to that procedure call.== All other RMA calls have an input ~~`win` argument. When an error occurs during such a call, the error handler currently associated with `win` is invoked.~~ ==window argument on which errors will be raised if they occur.==

The error handler `MPI_ERRORS_ARE_FATAL` is associated with ~~`win`~~ ==the window== during its creation. Users may change this default by explicitly associating a new error handler with ~~`win`~~ ==the window== (see [[versions/v41/sections/inquiry#Error Handling|Error Handling]] ).

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Error Handlers]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Error Handlers]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Error Handlers]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Error Handlers]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Error Handlers]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Error Handlers]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Error Handlers]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Error Handlers]]

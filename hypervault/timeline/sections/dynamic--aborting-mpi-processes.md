---
title: "Aborting MPI Processes"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Aborting MPI Processes

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Aborting MPI Processes|MPI-4.0]], [[versions/v41/sections/dynamic#Aborting MPI Processes|MPI-4.1]], [[versions/v50/sections/dynamic#Aborting MPI Processes|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

> After aborting a subset of processes, a high quality implementation should be able to provide error handling for communicators, windows, and files involving both aborted and ~~non-aborted~~ ==nonaborted== processes. As an example, if the user changes the error handler for `MPI_COMM_WORLD` to `MPI_ERRORS_RETURN` or a custom error handler, when a subset of `MPI_COMM_WORLD` is aborted, the remaining processes in `MPI_COMM_WORLD` should be able to continue communicating with each other and receive an appropriate error code when attempting communication with an aborted process (e.g., an error of class `MPI_ERR_PROC_ABORTED`). A high quality implementation should support equivalent behavior for communicators derived from sessions.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

> After aborting a subset of processes, a ~~high quality~~ ==high-quality== implementation should be able to provide error handling for communicators, windows, and files involving both aborted and nonaborted processes. As an example, if the user changes the error handler for `MPI_COMM_WORLD` to `MPI_ERRORS_RETURN` or a custom error handler, when a subset of `MPI_COMM_WORLD` is aborted, the remaining processes in `MPI_COMM_WORLD` should be able to continue communicating with each other and receive an appropriate error code when attempting communication with an aborted process (e.g., an error of class `MPI_ERR_PROC_ABORTED`). A ~~high quality~~ ==high-quality== implementation should support equivalent behavior for communicators derived from sessions.

> Whether the `errorcode` is returned from the executable or from the ~~> >~~ MPI process startup mechanism (e.g., `mpiexec`), is an aspect of quality of the MPI library but not mandatory.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Aborting MPI Processes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Aborting MPI Processes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Aborting MPI Processes]]

---
title: "Runtime Query Functions"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Runtime Query Functions

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Runtime Query Functions|MPI-4.0]], [[versions/v41/sections/dynamic#Runtime Query Functions|MPI-4.1]], [[versions/v50/sections/dynamic#Runtime Query Functions|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

This function is used to query properties of a specific process set. The returned ~~*info*~~ ==`info`== object can be queried with existing MPI info object query functions. One key/value pair must be defined, `mpi_size`. The value of the `mpi_size` key specifies the number of MPI processes in the process set. The user is responsible for freeing the returned `MPI_Info` object.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Runtime Query Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Runtime Query Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Runtime Query Functions]]

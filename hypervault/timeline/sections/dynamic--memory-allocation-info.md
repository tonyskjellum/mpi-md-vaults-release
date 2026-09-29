---
title: "Memory Allocation Info"
chapter: dynamic
present_in: ["MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Memory Allocation Info

Chapter **dynamic** · in [[versions/v41/sections/dynamic#Memory Allocation Info|MPI-4.1]], [[versions/v50/sections/dynamic#Memory Allocation Info|MPI-5.0]]

## Changes along the time axis

### MPI-4.0 → MPI-4.1

_Section appears in MPI-4.1._

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

A ~~comma separated~~ ==comma-separated== list of memory allocation kinds. ==When defaulted, the value returned must, at minimum, contain the kinds specified in `default` and may contain additional implementation-defined kinds. Different sessions may return different default values.== When set on the input info object in a call to [[versions/v50/API/MPI_SESSION_INIT|MPI_SESSION_INIT]] , [[versions/v50/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , or [[versions/v50/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , or when supplied as an argument to an MPI startup mechanism, this info key requests support for the specified memory allocation kinds.

When returned ~~in `MPI_INFO_ENV`,~~ ==by a call to [[versions/v50/API/MPI_COMM_GET_INFO|MPI_COMM_GET_INFO]] on `MPI_COMM_WORLD` or `MPI_COMM_SELF`,== this info key indicates the memory allocation kinds supported by the MPI library for all objects derived from the World Model. ==The value of `mpi_memory_alloc_kinds` on `MPI_COMM_WORLD` and `MPI_COMM_SELF` cannot be updated or deleted between MPI initialization ( [[versions/v50/API/MPI_INIT|MPI_INIT]] ) and MPI finalization ( [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] ) of the World Model.==

If the communicator, window, or file is derived from the World Model, the value of ~~this~~ ==the `mpi_memory_alloc_kinds`== info key must be identical to the value of ~~this~~ ==the `mpi_memory_alloc_kinds`== info key in ~~`MPI_INFO_ENV`~~ ==the info object returned by a call to [[versions/v50/API/MPI_COMM_GET_INFO|MPI_COMM_GET_INFO]] on `MPI_COMM_WORLD` or `MPI_COMM_SELF`== unless the user has asserted that support for memory allocation kinds can be restricted by setting `mpi_assert_memory_alloc_kinds` on that communicator, window, or file.

## Text by release

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Memory Allocation Info]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Memory Allocation Info]]

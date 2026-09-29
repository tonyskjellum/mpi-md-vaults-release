---
title: "Fetch and Op Function"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/one-side]
---

# Fetch and Op Function

Chapter **one-side** · in [[versions/v30/sections/one-side#Fetch and Op Function|MPI-3.0]], [[versions/v31/sections/one-side#Fetch and Op Function|MPI-3.1]], [[versions/v40/sections/one-side#Fetch and Op Function|MPI-4.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The origin and result buffers (`origin_addr` and `result_addr`) must be disjoint. Any of the predefined operations for [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] , as well as `MPI_NO_OP` or `MPI_REPLACE`, can be specified as `op`; user-defined functions cannot be used.~~

~~The `datatype` argument must be a predefined datatype.~~

~~The operation is executed atomically.~~

==The origin and result buffers (`origin_addr` and `result_addr`) must be disjoint. Any of the predefined operations for [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] , as well as `MPI_NO_OP` or `MPI_REPLACE`, can be specified as `op`; user-defined functions cannot be used. The `datatype` argument must be a predefined datatype. The operation is executed atomically.==

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Fetch and Op Function]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Fetch and Op Function]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Fetch and Op Function]]

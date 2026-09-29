---
title: "Processes Sets"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Processes Sets

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Processes Sets|MPI-4.0]], [[versions/v41/sections/dynamic#Processes Sets|MPI-4.1]], [[versions/v50/sections/dynamic#Processes Sets|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

*Figure: Examples of process sets. Illustrated are the two mandated process ~~sets - `mpi://WORLD`~~ ==sets—`mpi://WORLD`== and ~~`mpi://SELF` - along~~ ==`mpi://SELF`—along== with several optional ones that a runtime could define. In this example, [[versions/v41/API/MPI_SESSION_GET_NUM_PSETS|MPI_SESSION_GET_NUM_PSETS]] would return five at each MPI process.*

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

A process set caches ~~key/value tuples~~ ==(`key`,`value`) pairs== that are accessible to the application via an `MPI_Info` object. The `mpi_size` key is mandatory for all process sets.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Processes Sets]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Processes Sets]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Processes Sets]]

---
title: "Allowing User Functions at MPI Finalization"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Allowing User Functions at MPI Finalization

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Allowing User Functions at MPI Finalization|MPI-4.0]], [[versions/v41/sections/dynamic#Allowing User Functions at MPI Finalization|MPI-4.1]], [[versions/v50/sections/dynamic#Allowing User Functions at MPI Finalization|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

> Since attributes can be added from any supported language, the MPI implementation needs to remember the creating language so the correct callback is made. Implementations that use the attribute delete callback on `MPI_COMM_SELF` internally should register their internal callbacks before returning from [[versions/v50/API/MPI_INIT|MPI_INIT]] ~~/~~ ==or== [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , so that libraries or applications will not have portions of the MPI implementation shut down before the application-level callbacks are made.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Allowing User Functions at MPI Finalization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Allowing User Functions at MPI Finalization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Allowing User Functions at MPI Finalization]]

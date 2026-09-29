---
title: "Additional Support for Fortran Register-Memory-Synchronization"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Additional Support for Fortran Register-Memory-Synchronization

Chapter **binding** · in [[versions/v30/sections/binding#Additional Support for Fortran Register-Memory-Synchronization|MPI-3.0]], [[versions/v31/sections/binding#Additional Support for Fortran Register-Memory-Synchronization|MPI-3.1]], [[versions/v40/sections/binding#Additional Support for Fortran Register-Memory-Synchronization|MPI-4.0]], [[versions/v41/sections/binding#Additional Support for Fortran Register-Memory-Synchronization|MPI-4.1]], [[versions/v50/sections/binding#Additional Support for Fortran Register-Memory-Synchronization|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

As described in ~~Section [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] on page~~ [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] , a dummy call may be necessary to tell the compiler that registers are to be flushed for a given buffer or that accesses to a buffer may not be moved across a given point in the execution sequence. Only a Fortran binding exists for this call.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Additional Support for Fortran Register-Memory-Synchronization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Additional Support for Fortran Register-Memory-Synchronization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Additional Support for Fortran Register-Memory-Synchronization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Additional Support for Fortran Register-Memory-Synchronization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Additional Support for Fortran Register-Memory-Synchronization]]

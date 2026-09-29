---
title: "The `mpi` Module"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# The `mpi` Module

Chapter **binding** · in [[versions/v20/sections/binding#The `mpi` Module|MPI-2.0]], [[versions/v21/sections/binding#The `mpi` Module|MPI-2.1]], [[versions/v22/sections/binding#The `mpi` Module|MPI-2.2]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

An MPI implementation must provide a module named `mpi` that can be ~~`USE`d~~ ==`use`d== in a Fortran 90 program. This module must:

> The intent given by the MPI generic interface is not precisely defined and does not in all cases correspond to the correct Fortran `INTENT`. For instance, receiving into a buffer specified by a datatype with absolute addresses may require associating ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== with a dummy `OUT` argument. Moreover, “constants” such as ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== and ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== are not constants as defined by Fortran, but “special addresses” used in a nonstandard way. Finally, the MPI-1 generic intent is changed in several places by MPI-2. For instance, ~~MPI_IN_PLACE~~ ==`MPI_IN_PLACE`== changes the sense of an `OUT` argument to be `INOUT`.

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#The `mpi` Module]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#The `mpi` Module]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#The `mpi` Module]]

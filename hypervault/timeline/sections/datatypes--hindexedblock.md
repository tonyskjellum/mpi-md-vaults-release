---
title: "Hindexed_block"
chapter: datatypes
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/datatypes]
---

# Hindexed_block

Chapter **datatypes** · in [[versions/v30/sections/datatypes#Hindexed_block|MPI-3.0]], [[versions/v31/sections/datatypes#Hindexed_block|MPI-3.1]], [[versions/v40/sections/datatypes#Hindexed_block|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~This function is the same as [[versions/v30/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] except that the blocklength is the same for all blocks.~~

~~There are many codes using indirect addressing arising from unstructured grids where the blocksize is always 1 (gather/scatter). The following convenience function allows for constant blocksize and arbitrary displacements.~~

~~![[versions/v30/API/MPI_TYPE_CREATE_INDEXED_BLOCK]]~~

==The function [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] is identical to [[versions/v30/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] , except that block displacements in `array_of_displacements` are specified in bytes, rather than in multiples of the `oldtype` extent.==

==![[versions/v30/API/MPI_TYPE_CREATE_HINDEXED_BLOCK]]==

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Hindexed_block]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Hindexed_block]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Hindexed_block]]

---
title: "Indexed_block"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/datatypes]
---

# Indexed_block

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Indexed_block|MPI-2.1]], [[versions/v22/sections/datatypes#Indexed_block|MPI-2.2]], [[versions/v30/sections/datatypes#Indexed_block|MPI-3.0]], [[versions/v31/sections/datatypes#Indexed_block|MPI-3.1]], [[versions/v40/sections/datatypes#Indexed_block|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~This function is the same as [[versions/v31/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] except that the blocklength is the same for all blocks.~~

~~There are many codes using indirect addressing arising from unstructured grids where the blocksize is always 1 (gather/scatter). The following convenience function allows for constant blocksize and arbitrary displacements.~~

==This function is the same as [[versions/v31/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] except that the blocklength is the same for all blocks. There are many codes using indirect addressing arising from unstructured grids where the blocksize is always 1 (gather/scatter). The following convenience function allows for constant blocksize and arbitrary displacements.==

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Indexed_block]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Indexed_block]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Indexed_block]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Indexed_block]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Indexed_block]]

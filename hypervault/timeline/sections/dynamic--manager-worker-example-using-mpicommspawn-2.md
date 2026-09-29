---
title: "Manager-worker Example Using MPI_COMM_SPAWN"
chapter: dynamic
present_in: ["MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/dynamic]
---

# Manager-worker Example Using MPI_COMM_SPAWN

Chapter **dynamic** · in [[versions/v30/sections/dynamic#Manager-worker Example Using MPI_COMM_SPAWN|MPI-3.0]], [[versions/v31/sections/dynamic#Manager-worker Example Using MPI_COMM_SPAWN|MPI-3.1]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

~~MPI_Attr_get(MPI_COMM_WORLD,~~ ==MPI_Comm_get_attr(MPI_COMM_WORLD,== MPI_UNIVERSE_SIZE, &universe_sizep, &flag); if (!flag) { printf("This MPI does not support UNIVERSE_SIZE. How many\n\ processes total?"); scanf("%d", &universe_size); } else universe_size = *universe_sizep; if (universe_size == 1) error("No room to start workers");

/* * Parallel code here. * The manager is represented as the process with rank 0 in (the remote * group of) ~~MPI_COMM_PARENT.~~ ==the parent communicator.== If the workers need to communicate ==*== among ~~*~~ themselves, they can use MPI_COMM_WORLD. */

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Manager-worker Example Using MPI_COMM_SPAWN]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Manager-worker Example Using MPI_COMM_SPAWN]]

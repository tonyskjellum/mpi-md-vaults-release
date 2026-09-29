---
title: "Host Rank"
chapter: inquiry
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/inquiry]
---

# Host Rank

Chapter **inquiry** · in [[versions/v13/sections/inquiry#Host rank|MPI-1.3]], [[versions/v21/sections/inquiry#Host Rank|MPI-2.1]], [[versions/v22/sections/inquiry#Host Rank|MPI-2.2]], [[versions/v30/sections/inquiry#Host Rank|MPI-3.0]], [[versions/v31/sections/inquiry#Host Rank|MPI-3.1]], [[versions/v40/sections/inquiry#Host Rank|MPI-4.0]]

Heading by release: MPI-1.3: “Host rank”; MPI-2.1: “Host Rank”; MPI-2.2: “Host Rank”; MPI-3.0: “Host Rank”; MPI-3.1: “Host Rank”; MPI-4.0: “Host Rank”

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The value returned for ~~MPI_HOST~~ ==`MPI_HOST`== gets the rank of the `HOST` process in the group associated with communicator ~~MPI_COMM_WORLD,~~ ==`MPI_COMM_WORLD`,== if there is such. ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== is returned if there is no host. MPI does not specify what it means for a process to be a `HOST`, nor does it requires that a `HOST` exists.

The attribute ~~MPI_HOST~~ ==`MPI_HOST`== has the same value on all processes of ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The value returned for `MPI_HOST` gets the rank of the ~~`HOST`~~ ==*HOST*== process in the group associated with communicator `MPI_COMM_WORLD`, if there is such. `MPI_PROC_NULL` is returned if there is no host. MPI does not specify what it means for a process to be a ~~`HOST`,~~ ==*HOST*,== nor does it requires that a ~~`HOST`~~ ==*HOST*== exists.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/inquiry#Host rank]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Host Rank]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Host Rank]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Host Rank]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Host Rank]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Host Rank]]

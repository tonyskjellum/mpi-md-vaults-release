---
title: "Starting Processes"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Starting Processes

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Starting Processes|MPI-2.0]], [[versions/v21/sections/dynamic#Starting Processes|MPI-2.1]], [[versions/v22/sections/dynamic#Starting Processes|MPI-2.2]], [[versions/v30/sections/dynamic#Starting Processes|MPI-3.0]], [[versions/v31/sections/dynamic#Starting Processes|MPI-3.1]], [[versions/v40/sections/dynamic#Starting Processes|MPI-4.0]], [[versions/v41/sections/dynamic#Starting Processes|MPI-4.1]], [[versions/v50/sections/dynamic#Starting Processes|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

[[versions/v21/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] starts MPI processes and establishes communication with them, returning an intercommunicator. [[versions/v21/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] starts several different binaries (or the same binary with different arguments), placing them in the same ~~[[MPI_COMM_WORLD]]~~ ==MPI_COMM_WORLD== and returning an intercommunicator.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

MPI applications may start new processes through an interface to an external process ~~manager, which can range from a parallel operating system (CMOST) to layered software (POE) to an `rsh` command (p4).~~ ==manager.==

[[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] starts MPI processes and establishes communication with them, returning an intercommunicator. [[versions/v22/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] starts several different binaries (or the same binary with different arguments), placing them in the same ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== and returning an intercommunicator.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

MPI uses the ~~existing~~ group abstraction to represent processes. A process is identified by a (group, rank) pair.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

[[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] starts MPI processes and establishes communication with them, returning an ~~intercommunicator.~~ ==inter-/communicator.== [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] starts several different binaries (or the same binary with different arguments), placing them in the same `MPI_COMM_WORLD` and returning an ~~intercommunicator.~~ ==inter-communicator.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Starting Processes]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Starting Processes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Starting Processes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Starting Processes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Starting Processes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Starting Processes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Starting Processes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Starting Processes]]

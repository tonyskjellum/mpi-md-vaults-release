---
title: "Dynamic Communicator Allocation"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Dynamic Communicator Allocation

Chapter **context** · in [[versions/v13/sections/context#Dynamic communicator allocation|MPI-1.3]], [[versions/v21/sections/context#Dynamic communicator allocation|MPI-2.1]], [[versions/v22/sections/context#Dynamic communicator allocation|MPI-2.2]], [[versions/v30/sections/context#Dynamic Communicator Allocation|MPI-3.0]], [[versions/v31/sections/context#Dynamic Communicator Allocation|MPI-3.1]], [[versions/v40/sections/context#Dynamic Communicator Allocation|MPI-4.0]], [[versions/v41/sections/context#Dynamic Communicator Allocation|MPI-4.1]], [[versions/v50/sections/context#Dynamic Communicator Allocation|MPI-5.0]]

Heading by release: MPI-1.3: “Dynamic communicator allocation”; MPI-2.1: “Dynamic communicator allocation”; MPI-2.2: “Dynamic communicator allocation”; MPI-3.0: “Dynamic Communicator Allocation”; MPI-3.1: “Dynamic Communicator Allocation”; MPI-4.0: “Dynamic Communicator Allocation”; MPI-4.1: “Dynamic Communicator Allocation”; MPI-5.0: “Dynamic Communicator Allocation”

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

- messages are always selected by source (no use is made of ~~MPI_ANY_SOURCE).~~ ==`MPI_ANY_SOURCE`).==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Calls of parallel procedures are well-nested if a new parallel procedure is always invoked in a subset of a group executing the same parallel procedure. Thus, ==MPI== processes that execute the same parallel procedure have the same execution stack.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Dynamic communicator allocation]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Dynamic communicator allocation]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Dynamic communicator allocation]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Dynamic Communicator Allocation]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Dynamic Communicator Allocation]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Dynamic Communicator Allocation]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Dynamic Communicator Allocation]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Dynamic Communicator Allocation]]

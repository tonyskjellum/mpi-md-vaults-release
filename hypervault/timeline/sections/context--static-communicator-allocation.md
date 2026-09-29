---
title: "Static Communicator Allocation"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Static Communicator Allocation

Chapter **context** · in [[versions/v13/sections/context#Static communicator allocation|MPI-1.3]], [[versions/v21/sections/context#Static communicator allocation|MPI-2.1]], [[versions/v22/sections/context#Static communicator allocation|MPI-2.2]], [[versions/v30/sections/context#Static Communicator Allocation|MPI-3.0]], [[versions/v31/sections/context#Static Communicator Allocation|MPI-3.1]], [[versions/v40/sections/context#Static Communicator Allocation|MPI-4.0]], [[versions/v41/sections/context#Static Communicator Allocation|MPI-4.1]], [[versions/v50/sections/context#Static Communicator Allocation|MPI-5.0]]

Heading by release: MPI-1.3: “Static communicator allocation”; MPI-2.1: “Static communicator allocation”; MPI-2.2: “Static communicator allocation”; MPI-3.0: “Static Communicator Allocation”; MPI-3.1: “Static Communicator Allocation”; MPI-4.0: “Static Communicator Allocation”; MPI-4.1: “Static Communicator Allocation”; MPI-5.0: “Static Communicator Allocation”

## Changes along the time axis

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

This covers the case where, at any point in time, at most one invocation of a parallel procedure can be active at any ==MPI== process, and the group of executing ==MPI== processes is fixed. For example, all invocations of parallel procedures involve all ==MPI== processes, ==MPI== processes are single-threaded, and there are no recursive invocations.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Static communicator allocation]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Static communicator allocation]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Static communicator allocation]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Static Communicator Allocation]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Static Communicator Allocation]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Static Communicator Allocation]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Static Communicator Allocation]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Static Communicator Allocation]]

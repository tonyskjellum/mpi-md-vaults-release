---
title: "The General Case"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# The General Case

Chapter **context** · in [[versions/v13/sections/context#The General case|MPI-1.3]], [[versions/v21/sections/context#The General case|MPI-2.1]], [[versions/v22/sections/context#The General case|MPI-2.2]], [[versions/v30/sections/context#The General Case|MPI-3.0]], [[versions/v31/sections/context#The General Case|MPI-3.1]], [[versions/v40/sections/context#The General Case|MPI-4.0]], [[versions/v41/sections/context#The General Case|MPI-4.1]], [[versions/v50/sections/context#The General Case|MPI-5.0]]

Heading by release: MPI-1.3: “The General case”; MPI-2.1: “The General case”; MPI-2.2: “The General case”; MPI-3.0: “The General Case”; MPI-3.1: “The General Case”; MPI-4.0: “The General Case”; MPI-4.1: “The General Case”; MPI-5.0: “The General Case”

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

In the general case, there may be multiple concurrently active invocations of the same parallel procedure within the same group; invocations may not be well-nested. A new communicator needs to be created for each invocation. It is the user’s responsibility to make sure that, should two distinct parallel procedures be invoked concurrently on overlapping sets of processes, ~~then~~ communicator creation ~~be~~ ==is== properly coordinated.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

In the general case, there may be multiple concurrently active invocations of the same parallel procedure within the same group; invocations may not be well-nested. A new communicator needs to be created for each invocation. It is the user’s responsibility to make sure that, should two distinct parallel procedures be invoked concurrently on overlapping sets of ==MPI== processes, communicator creation is properly coordinated.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#The General case]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#The General case]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#The General case]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#The General Case]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#The General Case]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#The General Case]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#The General Case]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#The General Case]]

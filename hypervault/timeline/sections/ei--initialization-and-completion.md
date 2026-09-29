---
title: "Initialization and Completion"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/ei]
---

# Initialization and Completion

Chapter **ei** · in [[versions/v20/sections/ei#Initialization and Completion|MPI-2.0]], [[versions/v21/sections/ei#Initialization and Completion|MPI-2.1]], [[versions/v22/sections/ei#Initialization and Completion|MPI-2.2]], [[versions/v30/sections/ei#Initialization and Completion|MPI-3.0]], [[versions/v31/sections/ei#Initialization and Completion|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

The call to [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] should occur on the same thread that initialized MPI. We call this thread the **main thread**. The call should occur only after all ~~the~~ process threads have completed their MPI calls, and have no pending communications or I/O operations.

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Initialization and Completion]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Initialization and Completion]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Initialization and Completion]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Initialization and Completion]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Initialization and Completion]]

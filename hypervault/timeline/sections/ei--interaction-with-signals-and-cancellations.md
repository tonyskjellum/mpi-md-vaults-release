---
title: "Interaction with signals and cancellations"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/ei]
---

# Interaction with signals and cancellations

Chapter **ei** · in [[versions/v20/sections/ei#Interaction with signals and cancellations|MPI-2.0]], [[versions/v21/sections/ei#Interaction with signals and cancellations|MPI-2.1]], [[versions/v22/sections/ei#Interaction with signals and cancellations|MPI-2.2]], [[versions/v30/sections/ei#Interaction with signals and cancellations|MPI-3.0]], [[versions/v31/sections/ei#Interaction with signals and cancellations|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

> Few C library functions are signal safe, and many have cancellation points — points ~~where~~ ==at which== the thread executing them may be cancelled. The above restriction simplifies implementation (no need for the MPI library to be “async-cancel-safe” or ~~“async-signal-safe.”~~ ==“async-signal-safe”).==

> Users can catch signals in separate, non-MPI threads (e.g., by masking signals on MPI calling threads, and unmasking them in one or more non-MPI threads). ~~> >~~ A good programming practice is to have a distinct thread blocked in a call to `sigwait` for each user expected signal that may occur. Users must not catch signals used by the MPI implementation; as each MPI implementation is required to document the signals used internally, users can avoid these signals.

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Interaction with signals and cancellations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Interaction with signals and cancellations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Interaction with signals and cancellations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Interaction with signals and cancellations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Interaction with signals and cancellations]]

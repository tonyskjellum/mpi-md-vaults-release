---
title: "Probe"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/ei]
---

# Probe

Chapter **ei** · in [[versions/v20/sections/ei#Probe|MPI-2.0]], [[versions/v21/sections/ei#Probe|MPI-2.1]], [[versions/v22/sections/ei#Probe|MPI-2.2]], [[versions/v30/sections/ei#Probe|MPI-3.0]], [[versions/v31/sections/ei#Probe|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

A receive call that uses source and tag values returned by a preceding call to [[versions/v30/API/MPI_PROBE|MPI_PROBE]] or [[versions/v30/API/MPI_IPROBE|MPI_IPROBE]] will receive the message matched by the probe call only if there was no other matching receive after the probe and before that receive. In a multithreaded environment, it is up to the user to enforce this condition using suitable mutual exclusion logic. This can be enforced by making sure that each communicator is used by only one thread on each process. ==Alternatively, [[versions/v30/API/MPI_MPROBE|MPI_MPROBE]] or [[versions/v30/API/MPI_IMPROBE|MPI_IMPROBE]] can be used.==

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Probe]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Probe]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Probe]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Probe]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Probe]]

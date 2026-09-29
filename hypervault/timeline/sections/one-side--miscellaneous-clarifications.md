---
title: "Miscellaneous Clarifications"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Miscellaneous Clarifications

Chapter **one-side** · in [[versions/v20/sections/one-side#Miscellaneous Clarifications|MPI-2.0]], [[versions/v21/sections/one-side#Miscellaneous Clarifications|MPI-2.1]], [[versions/v22/sections/one-side#Miscellaneous Clarifications|MPI-2.2]], [[versions/v30/sections/one-side#Miscellaneous Clarifications|MPI-3.0]], [[versions/v31/sections/one-side#Miscellaneous Clarifications|MPI-3.1]], [[versions/v40/sections/one-side#Miscellaneous Clarifications|MPI-4.0]], [[versions/v41/sections/one-side#Miscellaneous Clarifications|MPI-4.1]], [[versions/v50/sections/one-side#Miscellaneous Clarifications|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

As in ~~message passing,~~ ==message-passing,== datatypes must be committed before they can be used in RMA communication.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

Once an RMA routine completes, it is safe to free any opaque objects passed as ~~argument~~ ==arguments== to that routine. For example, the `datatype` argument of a [[versions/v30/API/MPI_PUT|MPI_PUT]] call can be freed as soon as the call returns, even though the communication may not be complete.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Once an RMA ~~routine completes,~~ ==procedure call returns,== it is safe to free any opaque objects passed as arguments to that ~~routine.~~ ==procedure.== For example, the `datatype` argument of a [[versions/v41/API/MPI_PUT|MPI_PUT]] call can be freed as soon as the call returns, even though the communication may not be complete.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

Once an RMA procedure call returns, it is safe to free any opaque objects passed as arguments to that procedure. For example, the `datatype` argument of ~~a~~ ==an== [[versions/v50/API/MPI_PUT|MPI_PUT]] call can be freed as soon as the call returns, even though the communication may not be complete.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Miscellaneous Clarifications]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Miscellaneous Clarifications]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Miscellaneous Clarifications]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Miscellaneous Clarifications]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Miscellaneous Clarifications]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Miscellaneous Clarifications]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Miscellaneous Clarifications]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Miscellaneous Clarifications]]

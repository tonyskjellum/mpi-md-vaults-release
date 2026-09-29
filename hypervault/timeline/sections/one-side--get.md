---
title: "Get"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Get

Chapter **one-side** · in [[versions/v20/sections/one-side#Get|MPI-2.0]], [[versions/v21/sections/one-side#Get|MPI-2.1]], [[versions/v22/sections/one-side#Get|MPI-2.2]], [[versions/v30/sections/one-side#Get|MPI-3.0]], [[versions/v31/sections/one-side#Get|MPI-3.1]], [[versions/v40/sections/one-side#Get|MPI-4.0]], [[versions/v41/sections/one-side#Get|MPI-4.1]], [[versions/v50/sections/one-side#Get|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

Similar to [[versions/v30/API/MPI_PUT|MPI_PUT]] , except that the direction of data transfer is reversed. Data are copied from the target memory to the origin. The `origin_datatype` may not specify overlapping entries in the origin buffer. The target buffer must be contained within the target ==window or within attached memory in a dynamic== window, and the copied data must fit, without truncation, in the origin buffer.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Get]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Get]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Get]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Get]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Get]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Get]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Get]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Get]]

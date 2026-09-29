---
title: "Nonblocking Reduce"
chapter: coll
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Nonblocking Reduce

Chapter **coll** · in [[versions/v30/sections/coll#Nonblocking Reduce|MPI-3.0]], [[versions/v31/sections/coll#Nonblocking Reduce|MPI-3.1]], [[versions/v40/sections/coll#Nonblocking Reduce|MPI-4.0]], [[versions/v41/sections/coll#Nonblocking Reduce|MPI-4.1]], [[versions/v50/sections/coll#Nonblocking Reduce|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

> The implementation is explicitly allowed to use different algorithms for blocking and nonblocking reduction operations that might change the order of evaluation of the operations. However, as for [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] , it is strongly recommended that [[versions/v41/API/MPI_IREDUCE|MPI_IREDUCE]] be implemented so that the same result be obtained whenever the function is applied on the same arguments, appearing in the same order. Note that this may prevent optimizations that take advantage of the physical location of ==MPI== processes.

> For operations ~~which~~ ==that== are not truly associative, the result delivered upon completion of the nonblocking reduction may not exactly equal the result delivered by the blocking reduction, even when specifying the same arguments in the same order.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Nonblocking Reduce]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Nonblocking Reduce]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Nonblocking Reduce]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Nonblocking Reduce]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Nonblocking Reduce]]

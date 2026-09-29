---
title: "Scan"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Scan

Chapter **coll** · in [[versions/v13/sections/coll#Scan|MPI-1.3]], [[versions/v21/sections/coll#Scan|MPI-2.1]], [[versions/v22/sections/coll#Scan|MPI-2.2]], [[versions/v30/sections/coll#Scan|MPI-3.0]], [[versions/v31/sections/coll#Scan|MPI-3.1]], [[versions/v40/sections/coll#Scan|MPI-4.0]], [[versions/v41/sections/coll#Scan|MPI-4.1]], [[versions/v50/sections/coll#Scan|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~![[versions/v21/API/MPI_SCAN]]~~

~~`MPI_SCAN` is used to perform a prefix reduction on data distributed across the group. The operation returns, in the receive buffer of the process with rank `i`, the reduction of the values in the send buffers of processes with ranks `0,...,i` (inclusive). The type of operations supported, their semantics, and the constraints on send and receive buffers are as for `MPI_REDUCE`.~~

~~> [!tip] Rationale~~

~~> We have defined an inclusive scan, that is, the prefix reduction on process `i` includes the data from process `i`. An alternative is to define scan in an exclusive manner, where the result on `i` only includes data up to `i-1`. Both definitions are useful. The latter has some advantages: the inclusive scan can always be computed from the exclusive scan with no additional communication; for non-invertible operations such as max and min, communication is required to compute the exclusive scan from the inclusive scan. There is, however, a complication with exclusive scan since one must define the “unit” element for the reduction in this case. That is, one must explicitly say what occurs for process `0`. This was thought to be complex for user-defined operations and hence, the exclusive scan was dropped.~~

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Scan]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Scan]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Scan]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Scan]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Scan]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Scan]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Scan]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Scan]]

---
title: "Example using MPI_BCAST"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Example using MPI_BCAST

Chapter **coll** · in [[versions/v13/sections/coll#Example using `MPI_BCAST`|MPI-1.3]], [[versions/v21/sections/coll#Example using `MPI_BCAST`|MPI-2.1]], [[versions/v22/sections/coll#Example using `MPI_BCAST`|MPI-2.2]], [[versions/v30/sections/coll#Example using `MPI_BCAST`|MPI-3.0]], [[versions/v31/sections/coll#Example using MPI_BCAST|MPI-3.1]], [[versions/v40/sections/coll#Example using MPI_BCAST|MPI-4.0]], [[versions/v41/sections/coll#Example using MPI_BCAST|MPI-4.1]], [[versions/v50/sections/coll#Example using MPI_BCAST|MPI-5.0]]

Heading by release: MPI-1.3: “Example using `MPI_BCAST`”; MPI-2.1: “Example using `MPI_BCAST`”; MPI-2.2: “Example using `MPI_BCAST`”; MPI-3.0: “Example using `MPI_BCAST`”; MPI-3.1: “Example using MPI_BCAST”; MPI-4.0: “Example using MPI_BCAST”; MPI-4.1: “Example using MPI_BCAST”; MPI-5.0: “Example using MPI_BCAST”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~Z Broadcast 100 ints from process `0` to every process in the group.~~

==The examples in this section use intracommunicators.==

==Z Broadcast 100 `int`s from process `0` to every process in the group.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

MPI_Comm comm; int array[100]; int root=0; ... ~~MPI_Bcast( array,~~ ==MPI_Bcast(array,== 100, MPI_INT, root, comm);

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Z Broadcast 100 `int`s from process `0` to every process in the group.~~

==Z==

==Broadcast 100 `int`s from process `0` to every process in the group.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The examples in this section use ~~intracommunicators.~~ ==intra-communicators.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~Broadcast 100 `int`s from process `0` to every process in the group.~~

~~        MPI_Comm comm;         int array[100];         int root=0;         ...         MPI_Bcast(array, 100, MPI_INT, root, comm);~~

==Broadcast 100 `int`s from MPI process `0` to every MPI process in the group.==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int array[100];
int root=0;
...
MPI_Bcast(array, 100, MPI_INT, root, comm);
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Example using `MPI_BCAST`]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Example using `MPI_BCAST`]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Example using `MPI_BCAST`]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Example using `MPI_BCAST`]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Example using MPI_BCAST]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Example using MPI_BCAST]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Example using MPI_BCAST]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Example using MPI_BCAST]]

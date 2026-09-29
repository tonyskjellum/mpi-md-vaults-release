---
title: "Example using MPI_IBCAST"
chapter: coll
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Example using MPI_IBCAST

Chapter **coll** · in [[versions/v30/sections/coll#Example using `MPI_IBCAST`|MPI-3.0]], [[versions/v31/sections/coll#Example using MPI_IBCAST|MPI-3.1]], [[versions/v40/sections/coll#Example using MPI_IBCAST|MPI-4.0]], [[versions/v41/sections/coll#Example using MPI_IBCAST|MPI-4.1]], [[versions/v50/sections/coll#Example using MPI_IBCAST|MPI-5.0]]

Heading by release: MPI-3.0: “Example using `MPI_IBCAST`”; MPI-3.1: “Example using MPI_IBCAST”; MPI-4.0: “Example using MPI_IBCAST”; MPI-4.1: “Example using MPI_IBCAST”; MPI-5.0: “Example using MPI_IBCAST”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~Z Broadcast 100 ints from process `0` to every process in the group.~~

==The examples in this section use intracommunicators.==

==Z Broadcast 100 `int`s from process `0` to every process in the group.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The examples in this section use intracommunicators.~~

~~Z Broadcast 100 `int`s from process `0` to every process in the group.~~

~~        MPI_Comm comm;         int array[100];         int root=0;         ...         MPI_Bcast( array, 100, MPI_INT, root, comm);~~

~~As in many of our example code fragments, we assume that some of the variables (such as `comm` in the above) have been assigned appropriate values.~~

==The example in this section uses an intracommunicator.==

==Z Start a broadcast of 100 `int`s from process `0` to every process in the group, perform some computation on independent data, and then complete the outstanding broadcast operation.==

==        MPI_Comm comm;         int array1[100], array2[100];         int root=0;         MPI_Request req;         ...         MPI_Ibcast(array1, 100, MPI_INT, root, comm, &req);         compute(array2, 100);         MPI_Wait(&req, MPI_STATUS_IGNORE);==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Z Start a broadcast of 100 `int`s from process `0` to every process in the group, perform some computation on independent data, and then complete the outstanding broadcast operation.~~

==Z==

==Start a broadcast of 100 `int`s from process `0` to every process in the group, perform some computation on independent data, and then complete the outstanding broadcast operation.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The example in this section uses an ~~intracommunicator.~~ ==intra-communicator.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~Start a broadcast of 100 `int`s from process `0` to every process in the group, perform some computation on independent data, and then complete the outstanding broadcast operation.~~

~~        MPI_Comm comm;         int array1[100], array2[100];         int root=0;         MPI_Request req;         ...         MPI_Ibcast(array1, 100, MPI_INT, root, comm, &req);         compute(array2, 100);         MPI_Wait(&req, MPI_STATUS_IGNORE);~~

==Start a broadcast of 100 `int`s from MPI process `0` to every MPI process in the group, perform some computation on independent data, and then complete the outstanding broadcast operation.==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int array1[100], array2[100];
int root=0;
MPI_Request req;
...
MPI_Ibcast(array1, 100, MPI_INT, root, comm, &req);
compute(array2, 100);
MPI_Wait(&req, MPI_STATUS_IGNORE);
```

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Example using `MPI_IBCAST`]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Example using MPI_IBCAST]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Example using MPI_IBCAST]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Example using MPI_IBCAST]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Example using MPI_IBCAST]]

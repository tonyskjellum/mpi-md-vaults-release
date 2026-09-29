---
title: "Example using MPI_ALLGATHER"
chapter: coll
present_in: ["MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Example using MPI_ALLGATHER

Chapter **coll** · in [[versions/v22/sections/coll#Example using `MPI_ALLGATHER`|MPI-2.2]], [[versions/v30/sections/coll#Example using `MPI_ALLGATHER`|MPI-3.0]], [[versions/v31/sections/coll#Example using MPI_ALLGATHER|MPI-3.1]], [[versions/v40/sections/coll#Example using MPI_ALLGATHER|MPI-4.0]], [[versions/v41/sections/coll#Example using MPI_ALLGATHER|MPI-4.1]], [[versions/v50/sections/coll#Example using MPI_ALLGATHER|MPI-5.0]]

Heading by release: MPI-2.2: “Example using `MPI_ALLGATHER`”; MPI-3.0: “Example using `MPI_ALLGATHER`”; MPI-3.1: “Example using MPI_ALLGATHER”; MPI-4.0: “Example using MPI_ALLGATHER”; MPI-4.1: “Example using MPI_ALLGATHER”; MPI-5.0: “Example using MPI_ALLGATHER”

## Changes along the time axis

### MPI-2.1 → MPI-2.2

_Section appears in MPI-2.2._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

MPI_Comm comm; int gsize,sendarray[100]; int *rbuf; ... ~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); rbuf = (int *)malloc(gsize*100*sizeof(int)); ~~MPI_Allgather( sendarray,~~ ==MPI_Allgather(sendarray,== 100, MPI_INT, rbuf, 100, MPI_INT, comm);

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The all-gather version of Example [[coll-exA]] . Using ~~`MPI_ALLGATHER`,~~ ==[[versions/v31/API/MPI_ALLGATHER|MPI_ALLGATHER]] ,== we will gather 100 `int`s from every process in the group to every process.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The example in this section uses ~~intracommunicators.~~ ==intra-communicators.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~The all-gather version of Example [[coll-exA]] . Using [[versions/v41/API/MPI_ALLGATHER|MPI_ALLGATHER]] , we will gather 100 `int`s from every process in the group to every process.~~

~~        MPI_Comm comm;         int gsize,sendarray[100];         int *rbuf;         ...         MPI_Comm_size(comm, &gsize);         rbuf = (int *)malloc(gsize*100*sizeof(int));         MPI_Allgather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, comm);~~

~~After the call, every process has the group-wide concatenation of the sets of data.~~

==The all-gather version of Example [[coll-exA]] . Using [[versions/v41/API/MPI_ALLGATHER|MPI_ALLGATHER]] , we will gather 100 `int`s from every MPI process in the group to every MPI process.==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100];
int *rbuf;
...
MPI_Comm_size(comm, &gsize);
rbuf = (int *)malloc(gsize*100*sizeof(int));
MPI_Allgather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, comm);
```

==After the call, every MPI process has the group-wide concatenation of the sets of data.==

## Text by release

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Example using `MPI_ALLGATHER`]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Example using `MPI_ALLGATHER`]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Example using MPI_ALLGATHER]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Example using MPI_ALLGATHER]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Example using MPI_ALLGATHER]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Example using MPI_ALLGATHER]]

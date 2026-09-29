---
title: "Tag Values"
chapter: inquiry
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Tag Values

Chapter **inquiry** · in [[versions/v13/sections/inquiry#Tag values|MPI-1.3]], [[versions/v21/sections/inquiry#Tag Values|MPI-2.1]], [[versions/v22/sections/inquiry#Tag Values|MPI-2.2]], [[versions/v30/sections/inquiry#Tag Values|MPI-3.0]], [[versions/v31/sections/inquiry#Tag Values|MPI-3.1]], [[versions/v40/sections/inquiry#Tag Values|MPI-4.0]], [[versions/v41/sections/inquiry#Tag Values|MPI-4.1]], [[versions/v50/sections/inquiry#Tag Values|MPI-5.0]]

Heading by release: MPI-1.3: “Tag values”; MPI-2.1: “Tag Values”; MPI-2.2: “Tag Values”; MPI-3.0: “Tag Values”; MPI-3.1: “Tag Values”; MPI-4.0: “Tag Values”; MPI-4.1: “Tag Values”; MPI-5.0: “Tag Values”

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

Tag values range from `0` to the value returned for ~~MPI_TAG_UB~~ ==`MPI_TAG_UB`== inclusive. These values are guaranteed to be unchanging during the execution of an MPI program. In addition, the tag upper bound value must be *at least* 32767. An MPI implementation is free to make the value of ~~MPI_TAG_UB~~ ==`MPI_TAG_UB`== larger than this; for example, the value $`2^{30}-1`$ is also a legal value for ~~MPI_TAG_UB.~~ ==`MPI_TAG_UB`.==

The attribute ~~MPI_TAG_UB~~ ==`MPI_TAG_UB`== has the same value on all processes of ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

Tag values range from `0` to the value returned for ~~`MPI_TAG_UB`~~ ==`MPI_TAG_UB`,== inclusive. These values are guaranteed to be unchanging during the execution of an MPI program. In addition, the tag upper bound value must be *at least* 32767. An MPI implementation is free to make the value of `MPI_TAG_UB` larger than this; for example, the value $`2^{30}-1`$ is also a ~~legal~~ ==valid== value for `MPI_TAG_UB`.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~The~~ ==In the Sessions Model, the attribute `MPI_TAG_UB` is attached to all communicators created by [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] and [[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] , with the same value on all MPI processes in the communicator. In the World Model, the== attribute `MPI_TAG_UB` has the same value on all processes of `MPI_COMM_WORLD`.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

In the Sessions Model, the attribute `MPI_TAG_UB` is attached to all communicators created by [[versions/v50/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] and [[versions/v50/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] , with the same value on all MPI processes in the communicator. In the World Model, the attribute `MPI_TAG_UB` has the same value on all ==MPI== processes of `MPI_COMM_WORLD`.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/inquiry#Tag values]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Tag Values]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Tag Values]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Tag Values]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Tag Values]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Tag Values]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Tag Values]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Tag Values]]

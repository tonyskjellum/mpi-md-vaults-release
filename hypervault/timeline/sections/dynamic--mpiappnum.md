---
title: "`MPI_APPNUM`"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# `MPI_APPNUM`

Chapter **dynamic** · in [[versions/v20/sections/dynamic#MPI_APPNUM|MPI-2.0]], [[versions/v21/sections/dynamic#MPI_APPNUM|MPI-2.1]], [[versions/v22/sections/dynamic#`MPI_APPNUM`|MPI-2.2]], [[versions/v30/sections/dynamic#`MPI_APPNUM`|MPI-3.0]], [[versions/v31/sections/dynamic#`MPI_APPNUM`|MPI-3.1]], [[versions/v40/sections/dynamic#`MPI_APPNUM`|MPI-4.0]], [[versions/v41/sections/dynamic#`MPI_APPNUM`|MPI-4.1]], [[versions/v50/sections/dynamic#`MPI_APPNUM`|MPI-5.0]]

Heading by release: MPI-2.0: “MPI_APPNUM”; MPI-2.1: “MPI_APPNUM”; MPI-2.2: “`MPI_APPNUM`”; MPI-3.0: “`MPI_APPNUM`”; MPI-3.1: “`MPI_APPNUM`”; MPI-4.0: “`MPI_APPNUM`”; MPI-4.1: “`MPI_APPNUM`”; MPI-5.0: “`MPI_APPNUM`”

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

There is a predefined attribute ~~MPI_APPNUM~~ ==`MPI_APPNUM`== of ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.== In Fortran, the attribute is an integer value. In C, the attribute is a pointer to an integer value. If a process was spawned with [[versions/v22/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , ~~MPI_APPNUM~~ ==`MPI_APPNUM`== is the command number that generated the current process. Numbering starts from zero. If a process was spawned with [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , it will have ~~MPI_APPNUM~~ ==`MPI_APPNUM`== equal to zero.

Additionally, if the process was not started by a spawn call, but by an implementation-specific startup mechanism that can handle multiple process specifications, ~~MPI_APPNUM~~ ==`MPI_APPNUM`== should be set to the number of the corresponding process specification. In particular, if it is started with

~~MPI_APPNUM~~ ==`MPI_APPNUM`== should be set to the number of the corresponding specification.

If an application was not spawned with [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] or [[versions/v22/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , and ~~MPI_APPNUM~~ ==`MPI_APPNUM`== doesn’t make sense in the context of the implementation-specific startup mechanism, ~~MPI_APPNUM~~ ==`MPI_APPNUM`== is not set.

MPI implementations may optionally provide a mechanism to override the value of ~~MPI_APPNUM~~ ==`MPI_APPNUM`== through the `info` argument. MPI reserves the following key for all [[SPAWN]] calls.

- Value contains an integer that overrides the default value for ~~MPI_APPNUM~~ ==`MPI_APPNUM`== in the child.

> When a single application is started, it is able to figure out how many processes there are by looking at the size of ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.== An application consisting of multiple SPMD sub-applications has no way to find out how many sub-applications there are and to which sub-application the process belongs. While there are ways to figure it out in special cases, there is no general mechanism. ~~MPI_APPNUM~~ ==`MPI_APPNUM`== provides such a general mechanism.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

If an application was not spawned with [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] or [[versions/v30/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , and `MPI_APPNUM` ~~doesn’t~~ ==does not== make sense in the context of the implementation-specific startup mechanism, `MPI_APPNUM` is not set.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~-~~ ==`appnum`== Value contains an integer that overrides the default value for `MPI_APPNUM` in the child.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~`appnum`~~ ==`appnum`:== Value contains an integer that overrides the default value for `MPI_APPNUM` in the child.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#MPI_APPNUM]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#MPI_APPNUM]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#`MPI_APPNUM`]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#`MPI_APPNUM`]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#`MPI_APPNUM`]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#`MPI_APPNUM`]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#`MPI_APPNUM`]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#`MPI_APPNUM`]]

---
title: "The `maxprocs` argument"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/dynamic]
---

# The `maxprocs` argument

Chapter **dynamic** · in [[versions/v20/sections/dynamic#The `maxprocs` argument|MPI-2.0]], [[versions/v21/sections/dynamic#The `maxprocs` argument|MPI-2.1]], [[versions/v22/sections/dynamic#The `maxprocs` argument|MPI-2.2]], [[versions/v30/sections/dynamic#The `maxprocs` argument|MPI-3.0]], [[versions/v31/sections/dynamic#The `maxprocs` argument|MPI-3.1]], [[versions/v40/sections/dynamic#The `maxprocs` argument|MPI-4.0]]

## Changes along the time axis

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

A spawn call with the default behavior is called *hard*. A spawn call for which fewer than `maxprocs` processes may be returned is called ~~`soft`.~~ ==*`soft`*.== See ~~Section [[versions/v31/sections/dynamic#Reserved Keys|Reserved Keys]] on page~~ [[versions/v31/sections/dynamic#Reserved Keys|Reserved Keys]] for more information on the `soft` key for `info`.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

A spawn call with the default behavior is called *hard*. A spawn call for which fewer than `maxprocs` processes may be returned is called ~~*`soft`*.~~ ==`soft`.== See [[versions/v40/sections/dynamic#Reserved Keys|Reserved Keys]] for more information on the `soft` key for `info`.

> By default, requests are hard and MPI errors are fatal. This means that by default there will be a fatal error if MPI cannot spawn all the requested processes. If you want the behavior “spawn as many processes as possible, up to $`N`$,” you should do a soft spawn, where the set of allowed values $`\{m_i\}`$ is ~~$`\{0 ...~~ ==$`\{0, ...,== N\}`$. However, this is not completely portable, as implementations are not required to support soft spawning.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#The `maxprocs` argument]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#The `maxprocs` argument]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#The `maxprocs` argument]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#The `maxprocs` argument]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#The `maxprocs` argument]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#The `maxprocs` argument]]

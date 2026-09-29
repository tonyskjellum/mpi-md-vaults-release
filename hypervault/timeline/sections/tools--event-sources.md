---
title: "Event Sources"
chapter: tools
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Event Sources

Chapter **tools** · in [[versions/v40/sections/tools#Event Sources|MPI-4.0]], [[versions/v41/sections/tools#Event Sources|MPI-4.1]], [[versions/v50/sections/tools#Event Sources|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The following function can be used to query the number of event sources, ~~*num_sources*:~~ ==`num_sources`:==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The `ordering` argument ==is of type `MPI_T_source_order` and== returns whether event callbacks of this source will be invoked in chronological order, i.e., the timestamps reported by [[versions/v50/API/MPI_T_EVENT_GET_TIMESTAMP|MPI_T_EVENT_GET_TIMESTAMP]] of subsequent events of the same source are monotonically increasing. The value of `ordering` can be `MPI_T_SOURCE_ORDERED` or `MPI_T_SOURCE_UNORDERED`.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Event Sources]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Event Sources]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Event Sources]]

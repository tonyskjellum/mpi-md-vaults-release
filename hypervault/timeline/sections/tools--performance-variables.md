---
title: "Performance Variables"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Performance Variables

Chapter **tools** · in [[versions/v30/sections/tools#Performance Variables|MPI-3.0]], [[versions/v31/sections/tools#Performance Variables|MPI-3.1]], [[versions/v40/sections/tools#Performance Variables|MPI-4.0]], [[versions/v41/sections/tools#Performance Variables|MPI-4.1]], [[versions/v50/sections/tools#Performance Variables|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

The following section focuses on the ability to list and to query performance variables provided by the MPI implementation. Performance variables provide insight into MPI ~~implementation specific~~ ==implementation-specific== internals and can represent information such as the state of the MPI implementation (e.g., waiting blocked, receiving, not active), aggregated timing data for submodules, or queue sizes and lengths.

==Some performance variables and classes refer to *events*. In general, such events describe state transitions within software or hardware related to the performance of an MPI application. The events offered through the callback-driven event-notification interface described in Section [[versions/v40/sections/tools#Events|Events]] also refer to such state transitions; however, the set of state transitions referred to by performance variables and events as described in Section [[versions/v40/sections/tools#Events|Events]] may not be identical.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Some performance variables and classes refer to ~~*events*.~~ ==**events**.== In general, such events describe state transitions within software or hardware related to the performance of an MPI application. The events offered through the callback-driven event-notification interface described in Section [[versions/v41/sections/tools#Events|Events]] also refer to such state transitions; however, the set of state transitions referred to by performance variables and events as described in Section [[versions/v41/sections/tools#Events|Events]] may not be identical.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~Some performance variables and classes refer to **events**. In general, such events describe state transitions within software or hardware related to the performance of an MPI application. The events offered through the callback-driven event-notification interface described in Section [[versions/v50/sections/tools#Events|Events]] also refer to such state transitions; however, the set of state transitions referred to by performance variables and events as described in Section [[versions/v50/sections/tools#Events|Events]] may not be identical.~~

==Some performance variables and classes refer to **events**.==

==In general, such events describe state transitions within software or hardware related to the performance of an MPI application. The events offered through the callback-driven event-notification interface described in Section [[versions/v50/sections/tools#Events|Events]] also refer to such state transitions; however, the set of state transitions referred to by performance variables and events as described in Section [[versions/v50/sections/tools#Events|Events]] may not be identical.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Performance Variables]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Performance Variables]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Performance Variables]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Performance Variables]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Performance Variables]]

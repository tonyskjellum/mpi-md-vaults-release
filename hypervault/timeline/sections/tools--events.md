---
title: "Events"
chapter: tools
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Events

Chapter **tools** · in [[versions/v40/sections/tools#Events|MPI-4.0]], [[versions/v41/sections/tools#Events|MPI-4.1]], [[versions/v50/sections/tools#Events|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

During the execution of an MPI application, the MPI implementation can raise *events* of a specific type to inform the user of a state change in the implementation. ~~*Event types*~~ ==**Event types**== describe specific state changes within the MPI implementation. In comparison to aggregate performance variables, events provide per-instance information on such state changes. The MPI implementation is said to ~~*raise~~ ==**raise== an ~~event*~~ ==event**== when it invokes a callback function previously registered for the corresponding event type by the user. Each callback invocation for a specific event instance has a timestamp associated with it, which can be queried by the user, describing the time when the event was observed by the implementation. This decouples the observation of the state change from the communication of this information to the user. A timestamp in this context is a count of clock ticks elapsed since some time in the past and represented as a variable of type `MPI_Count`.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

During the execution of an MPI application, the MPI implementation can raise *events* of a specific type to inform the user of a state change in the implementation. **Event types** describe specific state changes within the MPI implementation. In comparison to aggregate performance variables, events provide per-instance information on such state changes. The MPI implementation is said to **raise an event** when it invokes a callback function previously registered ==by the user== for the corresponding event ~~type by the user.~~ ==type.== Each callback invocation for a specific event instance has a timestamp associated with it, which can be queried by the user, describing the time when the event was observed by the implementation. This decouples the observation of the state change from the communication of this information to the user. A timestamp in this context is a count of clock ticks elapsed since some time in the past and represented as a variable of type `MPI_Count`.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Events]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Events]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Events]]

---
title: "Reading Event Data"
chapter: tools
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Reading Event Data

Chapter **tools** · in [[versions/v40/sections/tools#Reading Event Data|MPI-4.0]], [[versions/v41/sections/tools#Reading Event Data|MPI-4.1]], [[versions/v50/sections/tools#Reading Event Data|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

[[versions/v50/API/MPI_T_EVENT_COPY|MPI_T_EVENT_COPY]] copies the event data as a whole into the user-provided `buffer`. The user must ~~assure~~ ==ensure== that the buffer is of at least the size of the extent of the event type, which can be computed from the type and displacement information returned by the corresponding call to [[versions/v50/API/MPI_T_EVENT_GET_INFO|MPI_T_EVENT_GET_INFO]] . The data may include padding bytes between individual elements of the event data in the buffer. A user can reconstruct the location and size of the data contained in the buffer through the information returned by [[versions/v50/API/MPI_T_EVENT_GET_INFO|MPI_T_EVENT_GET_INFO]] .

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Reading Event Data]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Reading Event Data]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Reading Event Data]]

---
title: "Inquire Processor Name"
chapter: inquiry
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Inquire Processor Name

Chapter **inquiry** · in [[versions/v30/sections/inquiry#Inquire Processor Name|MPI-3.0]], [[versions/v31/sections/inquiry#Inquire Processor Name|MPI-3.1]], [[versions/v40/sections/inquiry#Inquire Processor Name|MPI-4.0]], [[versions/v41/sections/inquiry#Inquire Processor Name|MPI-4.1]], [[versions/v50/sections/inquiry#Inquire Processor Name|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

This routine returns the name of the processor on which it was called at the moment of the call. The name is a character string for maximum flexibility. From this value it must be possible to identify a specific piece of hardware; possible values include “processor 9 in rack 4 of mpp.cs.org” and “231” (where 231 is the actual processor number in the running homogeneous system). The argument `name` must represent storage that is at least `MPI_MAX_PROCESSOR_NAME` characters long. ~~`MPI_GET_PROCESSOR_NAME`~~ ==[[versions/v31/API/MPI_GET_PROCESSOR_NAME|MPI_GET_PROCESSOR_NAME]]== may write up to this many characters into `name`.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> The user must provide at least `MPI_MAX_PROCESSOR_NAME` space to write the processor ~~name — processor~~ ==name—processor== names can be this long. The user should examine the output argument, `resultlen`, to determine the actual length of the name.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Inquire Processor Name]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Inquire Processor Name]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Inquire Processor Name]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Inquire Processor Name]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Inquire Processor Name]]

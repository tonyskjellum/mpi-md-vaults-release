---
title: "Ocean/Atmosphere — Relies on Name Publishing"
chapter: dynamic
present_in: ["MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/dynamic]
---

# Ocean/Atmosphere — Relies on Name Publishing

Chapter **dynamic** · in [[versions/v30/sections/dynamic#Ocean/Atmosphere — Relies on Name Publishing|MPI-3.0]], [[versions/v31/sections/dynamic#Ocean/Atmosphere — Relies on Name Publishing|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

MPI_Lookup_name("ocean", MPI_INFO_NULL, port_name); ~~MPI_Comm_connect( port_name,~~ ==MPI_Comm_connect(port_name,== MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Ocean/Atmosphere — Relies on Name Publishing]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Ocean/Atmosphere — Relies on Name Publishing]]

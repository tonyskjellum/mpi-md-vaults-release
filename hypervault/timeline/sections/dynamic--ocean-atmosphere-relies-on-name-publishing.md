---
title: "Ocean/Atmosphere - Relies on Name Publishing"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/dynamic]
---

# Ocean/Atmosphere - Relies on Name Publishing

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Ocean/Atmosphere - Relies on Name Publishing|MPI-2.0]], [[versions/v21/sections/dynamic#Ocean/Atmosphere - Relies on Name Publishing|MPI-2.1]], [[versions/v22/sections/dynamic#Ocean/Atmosphere - Relies on Name Publishing|MPI-2.2]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

MPI_Lookup_name("ocean", MPI_INFO_NULL, port_name); ~~MPI_Comm_connect( port_name,~~ ==MPI_Comm_connect(port_name,== MPI_INFO_NULL, 0, MPI_COMM_SELF, &intercomm);

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Ocean/Atmosphere - Relies on Name Publishing]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Ocean/Atmosphere - Relies on Name Publishing]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Ocean/Atmosphere - Relies on Name Publishing]]

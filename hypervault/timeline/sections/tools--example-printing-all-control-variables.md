---
title: "Example: Printing All Control Variables"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/tools]
---

# Example: Printing All Control Variables

Chapter **tools** · in [[versions/v30/sections/tools#Example: Printing All Control Variables|MPI-3.0]], [[versions/v31/sections/tools#Example: Printing All Control Variables|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

for (i=0; i<num; i++) { namelen=100; err=MPI_T_cvar_get_info(i, name, &namelen, &verbose, &datatype, NULL, NULL, NULL, /*no description */ &bind, &scope); if ~~(err!=MPI_SUCCESS)~~ ==(err!=MPI_SUCCESS || err!=MPI_T_ERR_INVALID_INDEX)== return err; printf("Var %i: %s\n", i, name); }

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Example: Printing All Control Variables]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Example: Printing All Control Variables]]

---
title: "Example: Reading the Value of a Control Variable"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/tools]
---

# Example: Reading the Value of a Control Variable

Chapter **tools** · in [[versions/v30/sections/tools#Example: Reading the Value of a Control Variable|MPI-3.0]], [[versions/v31/sections/tools#Example: Reading the Value of a Control Variable|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

int getValue_int_comm(int index, MPI_Comm comm, int *val) { int err,count; MPI_T_cvar_handle handle;

/* This example assumes that the variable index */ /* can be bound to a communicator */

err=MPI_T_cvar_handle_alloc(index,&comm,&handle,&count); if (err!=MPI_SUCCESS) return err;

/* The following assumes that the variable is */ /* represented by a single integer */

err=MPI_T_cvar_read(handle,val); if (err!=MPI_SUCCESS) return err;

err=MPI_T_cvar_handle_free(&handle); return err; }

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Example: Reading the Value of a Control Variable]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Example: Reading the Value of a Control Variable]]

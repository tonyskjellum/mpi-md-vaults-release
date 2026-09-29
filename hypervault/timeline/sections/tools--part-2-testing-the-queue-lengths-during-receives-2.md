---
title: "Part 2—Testing the Queue Lengths During Receives:"
chapter: tools
present_in: ["MPI-4.0"]
tags: [mpi/section, mpi/tools]
---

# Part 2—Testing the Queue Lengths During Receives:

Chapter **tools** · in [[versions/v40/sections/tools#Part 2—Testing the Queue Lengths During Receives:|MPI-4.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

int MPI_Recv(void *buf, int count, MPI_Datatype datatype, int source, int tag, MPI_Comm comm, MPI_Status *status) { int value, err;

if (comm==MPI_COMM_WORLD) { err=PMPI_T_pvar_read(session, handle, &value); if ((err==MPI_SUCCESS) && (value>THRESHOLD)) { /* tool identified receive called with long UMQ */ /* execute tool functionality, */ /* e.g., gather and print call stack */ } }

return PMPI_Recv(buf, count, datatype, source, tag, comm, status); }

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

if (comm==MPI_COMM_WORLD) { ~~err=PMPI_T_pvar_read(session,~~ ==err=PMPI_T_pvar_read(pe_session,== handle, &value); if ((err==MPI_SUCCESS) && (value>THRESHOLD)) { /* tool identified receive called with long UMQ */ /* execute tool functionality, */ /* e.g., gather and print call stack */ } }

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Part 2—Testing the Queue Lengths During Receives:]]

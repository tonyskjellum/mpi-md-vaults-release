---
title: "Example: Tool to Detect Receives with Long Unexpected Message Queues"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/tools]
---

# Example: Tool to Detect Receives with Long Unexpected Message Queues

Chapter **tools** · in [[versions/v30/sections/tools#Example: Tool to Detect Receives with Long Unexpected Message Queues|MPI-3.0]], [[versions/v31/sections/tools#Example: Tool to Detect Receives with Long Unexpected Message Queues|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The following example shows a sample tool to identify receive operations that occur during times with long message queues. This examples assumes that the MPI implementation exports a variable with the name ~~"`M`PI_T_UMQ_LENGTH"~~ ==“`MPI_T_UMQ_LENGTH`”== to represent the current length of the unexpected message queue. The tool is implemented as a PMPI tool using the MPI profiling interface.

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Example: Tool to Detect Receives with Long Unexpected Message Queues]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Example: Tool to Detect Receives with Long Unexpected Message Queues]]

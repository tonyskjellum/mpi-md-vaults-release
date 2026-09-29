---
title: "Persistent All-Gather"
chapter: coll
present_in: ["MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Persistent All-Gather

Chapter **coll** · in [[versions/v50/sections/coll#Persistent All-Gather|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~![[versions/v50/API/MPI_GATHER_INIT]]~~ ==![[versions/v50/API/MPI_ALLGATHER_INIT]]==

Creates a persistent collective communication request for the ~~gather operation.~~ ==allgather operation (see Section [[versions/v50/sections/coll#All-Gather|All-Gather]] ).==

~~![[versions/v50/API/MPI_GATHERV_INIT]]~~ ==![[versions/v50/API/MPI_ALLGATHERV_INIT]]==

Creates a persistent collective communication request for the ~~gatherv operation.~~ ==allgatherv operation (see Section [[versions/v50/sections/coll#All-Gather|All-Gather]] ).==

## Text by release

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Persistent All-Gather]]

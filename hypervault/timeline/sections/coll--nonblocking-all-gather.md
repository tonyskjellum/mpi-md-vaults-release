---
title: "Nonblocking All-Gather"
chapter: coll
present_in: ["MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Nonblocking All-Gather

Chapter **coll** · in [[versions/v50/sections/coll#Nonblocking All-Gather|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~![[versions/v50/API/MPI_IGATHER]]~~ ==![[versions/v50/API/MPI_IALLGATHER]]==

This call starts a nonblocking variant of ~~[[versions/v50/API/MPI_GATHER|MPI_GATHER]]~~ ==[[versions/v50/API/MPI_ALLGATHER|MPI_ALLGATHER]]== (see Section ~~[[versions/v50/sections/coll#Gather|Gather]]~~ ==[[versions/v50/sections/coll#All-Gather|All-Gather]]== ).

~~![[versions/v50/API/MPI_IGATHERV]]~~ ==![[versions/v50/API/MPI_IALLGATHERV]]==

This call starts a nonblocking variant of ~~[[versions/v50/API/MPI_GATHERV|MPI_GATHERV]]~~ ==[[versions/v50/API/MPI_ALLGATHERV|MPI_ALLGATHERV]]== (see Section ~~[[versions/v50/sections/coll#Gather|Gather]]~~ ==[[versions/v50/sections/coll#All-Gather|All-Gather]]== ).

## Text by release

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Nonblocking All-Gather]]

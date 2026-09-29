---
title: "Nonblocking Barrier Synchronization"
chapter: coll
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Nonblocking Barrier Synchronization

Chapter **coll** · in [[versions/v30/sections/coll#Nonblocking Barrier Synchronization|MPI-3.0]], [[versions/v31/sections/coll#Nonblocking Barrier Synchronization|MPI-3.1]], [[versions/v40/sections/coll#Nonblocking Barrier Synchronization|MPI-4.0]], [[versions/v41/sections/coll#Nonblocking Barrier Synchronization|MPI-4.1]], [[versions/v50/sections/coll#Nonblocking Barrier Synchronization|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

[[versions/v40/API/MPI_IBARRIER|MPI_IBARRIER]] is a nonblocking version of [[versions/v40/API/MPI_BARRIER|MPI_BARRIER]] . By calling [[versions/v40/API/MPI_IBARRIER|MPI_IBARRIER]] , a process notifies that it has reached the barrier. The call returns immediately, independent of whether other processes have called [[versions/v40/API/MPI_IBARRIER|MPI_IBARRIER]] . The usual barrier semantics are enforced at the corresponding completion operation (test or wait), which in the ~~intracommunicator~~ ==intra-communicator== case will complete only after all other processes in the communicator have called [[versions/v40/API/MPI_IBARRIER|MPI_IBARRIER]] . In the ~~intercommunicator~~ ==inter-communicator== case, it will complete when all processes in the remote group have called [[versions/v40/API/MPI_IBARRIER|MPI_IBARRIER]] .

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

[[versions/v41/API/MPI_IBARRIER|MPI_IBARRIER]] is a nonblocking version of [[versions/v41/API/MPI_BARRIER|MPI_BARRIER]] . By calling [[versions/v41/API/MPI_IBARRIER|MPI_IBARRIER]] , ~~a~~ ==an MPI== process notifies that it has reached the barrier. The call returns immediately, independent of whether other ==MPI== processes have called [[versions/v41/API/MPI_IBARRIER|MPI_IBARRIER]] . The usual barrier semantics are enforced at the corresponding completion operation (test or wait), which in the intra-communicator case will complete only after all other ==MPI== processes in the communicator have called [[versions/v41/API/MPI_IBARRIER|MPI_IBARRIER]] . In the inter-communicator case, it will complete when all ==MPI== processes in the remote group have called [[versions/v41/API/MPI_IBARRIER|MPI_IBARRIER]] .

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~[[versions/v50/API/MPI_IBARRIER|MPI_IBARRIER]] is~~ ==This call starts== a nonblocking ~~version~~ ==variant== of [[versions/v50/API/MPI_BARRIER|MPI_BARRIER]] ~~.~~ ==(see Section [[versions/v50/sections/coll#Barrier Synchronization|Barrier Synchronization]] ).== By calling [[versions/v50/API/MPI_IBARRIER|MPI_IBARRIER]] , an MPI process notifies that it has reached the barrier. The call returns immediately, independent of whether other MPI processes have called [[versions/v50/API/MPI_IBARRIER|MPI_IBARRIER]] . The usual barrier semantics are enforced at the corresponding completion operation (test or wait), which in the intra-communicator case will complete only after all other MPI processes in the communicator have called [[versions/v50/API/MPI_IBARRIER|MPI_IBARRIER]] . In the inter-communicator case, it will complete when all MPI processes in the remote group have called [[versions/v50/API/MPI_IBARRIER|MPI_IBARRIER]] .

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Nonblocking Barrier Synchronization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Nonblocking Barrier Synchronization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Nonblocking Barrier Synchronization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Nonblocking Barrier Synchronization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Nonblocking Barrier Synchronization]]

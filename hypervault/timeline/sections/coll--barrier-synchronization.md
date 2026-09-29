---
title: "Barrier Synchronization"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Barrier Synchronization

Chapter **coll** · in [[versions/v13/sections/coll#Barrier synchronization|MPI-1.3]], [[versions/v21/sections/coll#Barrier Synchronization|MPI-2.1]], [[versions/v22/sections/coll#Barrier Synchronization|MPI-2.2]], [[versions/v30/sections/coll#Barrier Synchronization|MPI-3.0]], [[versions/v31/sections/coll#Barrier Synchronization|MPI-3.1]], [[versions/v40/sections/coll#Barrier Synchronization|MPI-4.0]], [[versions/v41/sections/coll#Barrier Synchronization|MPI-4.1]], [[versions/v50/sections/coll#Barrier Synchronization|MPI-5.0]]

Heading by release: MPI-1.3: “Barrier synchronization”; MPI-2.1: “Barrier Synchronization”; MPI-2.2: “Barrier Synchronization”; MPI-3.0: “Barrier Synchronization”; MPI-3.1: “Barrier Synchronization”; MPI-4.0: “Barrier Synchronization”; MPI-4.1: “Barrier Synchronization”; MPI-5.0: “Barrier Synchronization”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

==If `comm` is an intracommunicator,==

==If `comm` is an intercommunicator, the barrier is performed across all processes in the intercommunicator. In this case, all processes in==

==one group (group A)==

==of the intercommunicator may exit the barrier when all of the processes in the==

==other group (group B)==

==have entered the barrier.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~If `comm` is an intercommunicator, the barrier is performed across all processes in the intercommunicator. In this case, all processes in~~

~~one group (group A)~~

~~of the intercommunicator may exit the barrier when all of the processes in the~~

~~other group (group B)~~

~~have entered the barrier.~~

==If `comm` is an intercommunicator, `MPI_BARRIER` involves two groups. The call returns at processes in one group (group A) of the intercommunicator only after all members of the other group (group B) have entered the call (and vice versa). A process may return from the call before all processes in its own group have entered the call.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~If `comm` is an intracommunicator,~~

~~`MPI_BARRIER` blocks the caller until all group members have called it. The call returns at any process only after all group members have entered the call.~~

==If `comm` is an intracommunicator, `MPI_BARRIER` blocks the caller until all group members have called it. The call returns at any process only after all group members have entered the call.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

If `comm` is an intracommunicator, ~~`MPI_BARRIER`~~ ==[[versions/v31/API/MPI_BARRIER|MPI_BARRIER]]== blocks the caller until all group members have called it. The call returns at any process only after all group members have entered the call.

If `comm` is an intercommunicator, ~~`MPI_BARRIER`~~ ==[[versions/v31/API/MPI_BARRIER|MPI_BARRIER]]== involves two groups. The call returns at processes in one group (group A) of the intercommunicator only after all members of the other group (group B) have entered the call (and vice versa). A process may return from the call before all processes in its own group have entered the call.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== [[versions/v40/API/MPI_BARRIER|MPI_BARRIER]] blocks the caller until all group members have called it. The call returns at any process only after all group members have entered the call.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== [[versions/v40/API/MPI_BARRIER|MPI_BARRIER]] involves two groups. The call returns at processes in one group (group A) of the ~~intercommunicator~~ ==inter-communicator== only after all members of the other group (group B) have entered the call (and vice versa). A process may return from the call before all processes in its own group have entered the call.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

If `comm` is an intra-communicator, [[versions/v41/API/MPI_BARRIER|MPI_BARRIER]] blocks the caller until all group members have called it. The call returns at any ==MPI== process only after all group members have entered the call.

If `comm` is an inter-communicator, [[versions/v41/API/MPI_BARRIER|MPI_BARRIER]] involves two groups. The call returns at ==MPI== processes in one group (group A) of the inter-communicator only after all members of the other group (group B) have entered the call (and vice versa). ~~A~~ ==An MPI== process may return from the call before all ==MPI== processes in its own group have entered the call.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Barrier synchronization]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Barrier Synchronization]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Barrier Synchronization]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Barrier Synchronization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Barrier Synchronization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Barrier Synchronization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Barrier Synchronization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Barrier Synchronization]]

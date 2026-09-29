---
title: "Specifics for Intercommunicator Collective Operations"
chapter: coll
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/coll]
---

# Specifics for Intercommunicator Collective Operations

Chapter **coll** · in [[versions/v21/sections/coll#Specifics for Intercommunicator Collective Operations|MPI-2.1]], [[versions/v22/sections/coll#Specifics for Intercommunicator Collective Operations|MPI-2.2]], [[versions/v30/sections/coll#Specifics for Intercommunicator Collective Operations|MPI-3.0]], [[versions/v31/sections/coll#Specifics for Intercommunicator Collective Operations|MPI-3.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

All processes in both groups identified by the intercommunicator must call the collective routine. ~~In addition, processes in the same group must call the routine with matching arguments.~~

the operation is ~~rooted (e.g., broadcast, gather, scatter),~~ ==in the All-To-One or One-To-All categories,== then the transfer is unidirectional. The direction of the transfer is indicated by a special value of the root argument.

root process uses the special root value ~~MPI_ROOT;~~ ==`MPI_ROOT`;== all other processes in the same group as the root use ~~MPI_PROC_NULL.~~ ==`MPI_PROC_NULL`.== All processes in the other group (the group that is the remote group relative to the root process) must call the collective routine and provide the rank of the root.

If the operation is ~~unrooted (e.g., alltoall),~~ ==in the All-To-All category,== then the transfer is bidirectional.

> ~~Rooted operations~~ ==Operations in the All-To-One and One-To-All categories== are unidirectional by nature, and there is a clear way of specifying direction. ~~Non-rooted operations, such as all-to-all,~~ ==> > Operations in the All-To-All category== will often occur as part of an exchange, where it makes sense to communicate in both directions at once.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~For intercommunicator collective communication, if~~

~~the operation is in the All-To-One or One-To-All categories, then the transfer is unidirectional. The direction of the transfer is indicated by a special value of the root argument.~~

==For intercommunicator collective communication, if the operation is in the All-To-One or One-To-All categories, then the transfer is unidirectional. The direction of the transfer is indicated by a special value of the root argument.==

~~For this, the~~

~~root process uses the special root value `MPI_ROOT`; all other processes in the same group as the root use `MPI_PROC_NULL`. All processes in the other group (the group that is the remote group relative to the root process) must call the collective routine and provide the rank of the root.~~

~~If the operation is in the All-To-All category, then the transfer is bidirectional.~~

==For this, the root process uses the special root value `MPI_ROOT`; all other processes in the same group as the root use `MPI_PROC_NULL`. All processes in the other group (the group that is the remote group relative to the root process) must call the collective routine and provide the rank of the root. If the operation is in the All-To-All category, then the transfer is bidirectional.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~For intercommunicator collective communication, if the operation is in the All-To-One or One-To-All categories, then the transfer is unidirectional. The direction of the transfer is indicated by a special value of the root argument.~~

~~In this case, for the group containing the root process, all processes in the group must call the routine using a special argument for the root.~~

~~For this, the root process uses the special root value `MPI_ROOT`; all other processes in the same group as the root use `MPI_PROC_NULL`. All processes in the other group (the group that is the remote group relative to the root process) must call the collective routine and provide the rank of the root. If the operation is in the All-To-All category, then the transfer is bidirectional.~~

==For intercommunicator collective communication, if the operation is in the All-To-One or One-To-All categories, then the transfer is unidirectional. The direction of the transfer is indicated by a special value of the root argument. In this case, for the group containing the root process, all processes in the group must call the routine using a special argument for the root. For this, the root process uses the special root value `MPI_ROOT`; all other processes in the same group as the root use `MPI_PROC_NULL`. All processes in the other group (the group that is the remote group relative to the root process) must call the collective routine and provide the rank of the root. If the operation is in the All-To-All category, then the transfer is bidirectional.==

> Operations in the All-To-One and One-To-All categories are unidirectional by nature, and there is a clear way of specifying direction. ~~> >~~ Operations in the All-To-All category will often occur as part of an exchange, where it makes sense to communicate in both directions at once.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

All processes in both groups identified by the ~~intercommunicator~~ ==inter-communicator== must call the collective routine.

Note that the “in place” option for ~~intracommunicators~~ ==intra-communicators== does not apply to ~~intercommunicators~~ ==inter-communicators== since in the ~~intercommunicator~~ ==inter-communicator== case there is no communication from a process to itself.

For ~~intercommunicator~~ ==inter-communicator== collective communication, if the operation is in the All-To-One or One-To-All categories, then the transfer is unidirectional. The direction of the transfer is indicated by a special value of the root argument. In this case, for the group containing the root process, all processes in the group must call the routine using a special argument for the root. For this, the root process uses the special root value `MPI_ROOT`; all other processes in the same group as the root use `MPI_PROC_NULL`. All processes in the other group (the group that is the remote group relative to the root process) must call the collective routine and provide the rank of the root. If the operation is in the All-To-All category, then the transfer is bidirectional.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

All ==MPI== processes in both groups identified by the inter-communicator must call the collective routine.

Note that the “in place” option for intra-communicators does not apply to inter-communicators since in the inter-communicator case there is no communication from ~~a~~ ==an MPI== process to itself.

For inter-communicator collective communication, if the operation is in the All-To-One or One-To-All categories, then the transfer is unidirectional. The direction of the transfer is indicated by a special value of the ~~root~~ ==`root`== argument. In this case, for the group containing the ~~root process,~~ ==root,== all ==MPI== processes in the group must call the routine using a special argument for the root. For this, the root ~~process~~ uses the special ~~root~~ value `MPI_ROOT`; all other ==MPI== processes in the same group as the root use `MPI_PROC_NULL`. All ==MPI== processes in the other group (the group that is the remote group relative to the ~~root process)~~ ==root)== must call the collective routine and provide the rank of the root. If the operation is in the All-To-All category, then the transfer is bidirectional.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Specifics for Intercommunicator Collective Operations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Specifics for Intercommunicator Collective Operations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Specifics for Intercommunicator Collective Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Specifics for Intercommunicator Collective Operations]]

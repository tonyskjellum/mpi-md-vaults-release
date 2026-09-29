---
title: "Establishing Communication"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Establishing Communication

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Establishing Communication|MPI-2.0]], [[versions/v21/sections/dynamic#Establishing Communication|MPI-2.1]], [[versions/v22/sections/dynamic#Establishing Communication|MPI-2.2]], [[versions/v30/sections/dynamic#Establishing Communication|MPI-3.0]], [[versions/v31/sections/dynamic#Establishing Communication|MPI-3.1]], [[versions/v40/sections/dynamic#Establishing Communication|MPI-4.0]], [[versions/v41/sections/dynamic#Establishing Communication|MPI-4.1]], [[versions/v50/sections/dynamic#Establishing Communication|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~In each of these situations, MPI must establish communication channels where none existed before, and there is no parent/child relationship. The routines described in this section establish communication between the two sets of processes by creating an MPI intercommunicator, where the two groups of the intercommunicator are the original sets of of processes.~~

==In each of these situations, MPI must establish communication channels where none existed before, and there is no parent/child relationship. The routines described in this section establish communication between the two sets of processes by creating an MPI intercommunicator, where the two groups of the intercommunicator==

==are the original sets of processes.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~In each of these situations, MPI must establish communication channels where none existed before, and there is no parent/child relationship. The routines described in this section establish communication between the two sets of processes by creating an MPI intercommunicator, where the two groups of the intercommunicator~~

~~are the original sets of processes.~~

==In each of these situations, MPI must establish communication channels where none existed before, and there is no parent/child relationship. The routines described in this section establish communication between the two sets of processes by creating an MPI intercommunicator, where the two groups of the intercommunicator are the original sets of processes.==

> While the names *client* and *server* are used throughout this section, MPI does not guarantee the traditional robustness of ~~client server~~ ==client/server== systems. The functionality described in this section is intended to allow two cooperating parts of the same application to communicate with one another. For instance, a client that gets a segmentation fault and dies, or one that ~~doesn’t~~ ==does not== participate in a collective operation may cause a server to crash or hang.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

In each of these situations, MPI must establish communication channels where none existed before, and there is no parent/child relationship. The routines described in this section establish communication between the two sets of processes by creating an MPI ~~intercommunicator,~~ ==inter-communicator,== where the two groups of the ~~intercommunicator~~ ==inter-communicator== are the original sets of processes.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Establishing contact between two groups of processes that do not share an existing communicator is a collective but asymmetric process. One group of processes indicates its willingness to accept connections from other groups of processes. We will call this group the (parallel) *server*, even if this is not a client/server type of application. The other group connects to the server; we will call it the ==(parallel)== *client*.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Establishing Communication]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Establishing Communication]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Establishing Communication]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Establishing Communication]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Establishing Communication]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Establishing Communication]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Establishing Communication]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Establishing Communication]]

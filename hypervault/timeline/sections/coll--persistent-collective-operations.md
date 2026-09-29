---
title: "Persistent Collective Operations"
chapter: coll
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Persistent Collective Operations

Chapter **coll** · in [[versions/v40/sections/coll#Persistent Collective Operations|MPI-4.0]], [[versions/v41/sections/coll#Persistent Collective Operations|MPI-4.1]], [[versions/v50/sections/coll#Persistent Collective Operations|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

Initialization calls for MPI persistent collective operations are ~~non-local~~ ==nonlocal== and follow all the existing rules for

According to the definitions in Section [[versions/v41/sections/terms#MPI Procedures|MPI Procedures]] , the persistent collective initialization procedures are incomplete. They are also ~~non-local~~ ==nonlocal== procedures because they may or may not return before they are called in all MPI processes of the ==MPI== process group associated with the specified communicator.

> This is one of the exceptions in which incomplete procedures are ~~non-local~~ ==nonlocal== and therefore blocking.

Once initialized, persistent collective operations can be started in any order and the order can differ among ==the MPI== processes in the communicator.

~~Once any process starts a persistent collective operation, it must complete that operation and all other processes in the communicator must eventually start (and complete) the same persistent collective operation.~~

~~Persistent collective~~

~~operations cannot be matched with blocking or nonblocking collective~~

~~operations.~~

~~Completion of a persistent collective operation makes the corresponding request inactive.~~

==Once any MPI process starts a persistent collective operation, it must complete that operation and all other MPI processes in the communicator must eventually start (and complete) the same persistent collective operation.==

==Persistent collective operations cannot be *matched* with blocking or nonblocking collective operations. Completion of a persistent collective operation makes the corresponding request inactive.==

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Persistent Collective Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Persistent Collective Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Persistent Collective Operations]]

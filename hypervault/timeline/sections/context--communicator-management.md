---
title: "Communicator Management"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Communicator Management

Chapter **context** · in [[versions/v13/sections/context#Communicator Management|MPI-1.3]], [[versions/v21/sections/context#Communicator Management|MPI-2.1]], [[versions/v22/sections/context#Communicator Management|MPI-2.2]], [[versions/v30/sections/context#Communicator Management|MPI-3.0]], [[versions/v31/sections/context#Communicator Management|MPI-3.1]], [[versions/v40/sections/context#Communicator Management|MPI-4.0]], [[versions/v41/sections/context#Communicator Management|MPI-4.1]], [[versions/v50/sections/context#Communicator Management|MPI-5.0]]

## Changes along the time axis

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

This section describes the manipulation of communicators in MPI. Operations that access communicators are ~~local and their execution does not require interprocess communication.~~ ==local.== Operations that create communicators are ~~collective and may require interprocess communication.~~ ==collective.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Communicator Management]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Communicator Management]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Communicator Management]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Communicator Management]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Communicator Management]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Communicator Management]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Communicator Management]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Communicator Management]]

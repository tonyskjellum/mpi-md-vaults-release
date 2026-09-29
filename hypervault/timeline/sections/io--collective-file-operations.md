---
title: "Collective File Operations"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Collective File Operations

Chapter **io** · in [[versions/v20/sections/io#Collective File Operations|MPI-2.0]], [[versions/v21/sections/io#Collective File Operations|MPI-2.1]], [[versions/v22/sections/io#Collective File Operations|MPI-2.2]], [[versions/v30/sections/io#Collective File Operations|MPI-3.0]], [[versions/v31/sections/io#Collective File Operations|MPI-3.1]], [[versions/v40/sections/io#Collective File Operations|MPI-4.0]], [[versions/v41/sections/io#Collective File Operations|MPI-4.1]], [[versions/v50/sections/io#Collective File Operations|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

please refer to the semantics set forth in ~~MPI-1 ,~~

Section ~~4.12.~~ ==[[coll-correct]] on page [[coll-correct]] .==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

Collective file operations are collective over a ~~dup~~ ==duplicate== of the communicator used to open the ~~file—this~~ ==file — this== duplicate communicator is implicitly specified via the file handle argument. Different processes can pass different values for other arguments of a collective routine unless specified otherwise.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Collective file operations are subject to the same restrictions as collective communication operations. For a complete discussion,~~

~~please refer to the semantics set forth in~~

~~Section [[coll-correct]] on page [[coll-correct]] .~~

==Collective file operations are subject to the same restrictions as collective communication operations. For a complete discussion, please refer to the semantics set forth in [[coll-correct]] .==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Collective file operations are collective over a duplicate of the communicator used to open the ~~file — this~~ ==file—this== duplicate communicator is implicitly specified via the file handle argument. Different processes can pass different values for other arguments of a collective routine unless specified otherwise.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Collective File Operations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Collective File Operations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Collective File Operations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Collective File Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Collective File Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Collective File Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Collective File Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Collective File Operations]]

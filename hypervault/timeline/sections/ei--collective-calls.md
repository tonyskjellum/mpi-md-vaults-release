---
title: "Collective calls"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/ei]
---

# Collective calls

Chapter **ei** · in [[versions/v20/sections/ei#Collective calls|MPI-2.0]], [[versions/v21/sections/ei#Collective calls|MPI-2.1]], [[versions/v22/sections/ei#Collective calls|MPI-2.2]], [[versions/v30/sections/ei#Collective calls|MPI-3.0]], [[versions/v31/sections/ei#Collective calls|MPI-3.1]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

==> [!note] Advice to users==

==> With three concurrent threads in each MPI process of a communicator `comm`, it is allowed that thread A in each MPI process calls a collective operation on `comm`, thread B calls a file operation on an existing filehandle that was formerly opened on `comm`, and thread C invokes one-sided operations on an existing window handle that was also formerly created on `comm`.==

==> [!tip] Rationale==

==> As already specified in [[versions/v21/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] and [[versions/v21/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , a file handle and a window handle inherit only the group of processes of the underlying communicator, but not the communicator itself. Accesses to communicators, window handles and file handles cannot affect one another.==

==> [!warning] Advice to implementors==

==> Advice to implementors. If the implementation of file or window operations internally uses MPI communication then a duplicated communicator may be cached on the file or window object.==

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~Matching of collective calls on a~~

~~communicator, window, or file handle is done according to the order in which the calls are issued~~

~~at each process. If concurrent threads issue such calls on the same communicator, window or file handle, it is up to the user to make sure the calls are correctly ordered, using interthread synchronization.~~

==Matching of collective calls on a communicator, window, or file handle is done according to the order in which the calls are issued at each process. If concurrent threads issue such calls on the same communicator, window or file handle, it is up to the user to make sure the calls are correctly ordered, using interthread synchronization.==

> As ~~already~~ specified in [[versions/v30/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] and [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , a file handle and a window handle inherit only the group of processes of the underlying communicator, but not the communicator itself. Accesses to communicators, window handles and file handles cannot affect one another.

> ~~Advice to implementors.~~ If the implementation of file or window operations internally uses MPI communication then a duplicated communicator may be cached on the file or window object.

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Collective calls]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Collective calls]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Collective calls]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Collective calls]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Collective calls]]

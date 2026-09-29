---
title: "Names, Addresses, Ports, and All That"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Names, Addresses, Ports, and All That

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Names, Addresses, Ports, and All That|MPI-2.0]], [[versions/v21/sections/dynamic#Names, Addresses, Ports, and All That|MPI-2.1]], [[versions/v22/sections/dynamic#Names, Addresses, Ports, and All That|MPI-2.2]], [[versions/v30/sections/dynamic#Names, Addresses, Ports, and All That|MPI-3.0]], [[versions/v31/sections/dynamic#Names, Addresses, Ports, and All That|MPI-3.1]], [[versions/v40/sections/dynamic#Names, Addresses, Ports, and All That|MPI-4.0]], [[versions/v41/sections/dynamic#Names, Addresses, Ports, and All That|MPI-4.1]], [[versions/v50/sections/dynamic#Names, Addresses, Ports, and All That|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~Almost all of the complexity in MPI client/server routines addresses the question “how does the client find out how to contact the server?” The difficulty, of course, is that there is no existing communication channel between them, yet they must somehow agree on a rendezvous point where they will establish communication — Catch 22.~~

==Almost all of the complexity in MPI client/server routines addresses the question “how does the client find out how to contact the server?” The difficulty, of course, is that there is no existing communication channel between them, yet they must somehow agree on a rendezvous point where they will establish communication —==

==Catch-22.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~Almost all of the complexity in MPI client/server routines addresses the question “how does the client find out how to contact the server?” The difficulty, of course, is that there is no existing communication channel between them, yet they must somehow agree on a rendezvous point where they will establish communication —~~

~~Catch-22.~~

==Almost all of the complexity in MPI client/server routines addresses the question “how does the client find out how to contact the server?” The difficulty, of course, is that there is no existing communication channel between them, yet they must somehow agree on a rendezvous point where they will establish communication.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

Agreeing on a rendezvous point always involves a third party. The third party may itself provide the rendezvous point or may communicate rendezvous information from server to client. Complicating matters might be the fact that a client ~~doesn’t~~ ==does not== really care what server it contacts, only that it be able to get in touch with one that can handle its request.

Ideally, MPI can accommodate a wide variety of run-time systems while retaining the ability to write ~~simple~~ ==simple,== portable code. The following should be compatible with MPI:

- The server prints out an address to the ~~terminal,~~ ==terminal;== the user gives this address to the client program.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Agreeing on a rendezvous point always involves a third party. The third party may itself provide the rendezvous point or may communicate rendezvous information from server to client. Complicating matters might be the fact that ~~a~~ ==it is not important to the== client ~~does not really care what~~ ==which particular== server it contacts, only that it be able to get in touch with one that can handle its request.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Names, Addresses, Ports, and All That]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Names, Addresses, Ports, and All That]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Names, Addresses, Ports, and All That]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Names, Addresses, Ports, and All That]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Names, Addresses, Ports, and All That]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Names, Addresses, Ports, and All That]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Names, Addresses, Ports, and All That]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Names, Addresses, Ports, and All That]]

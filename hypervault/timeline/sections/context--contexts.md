---
title: "Contexts"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Contexts

Chapter **context** · in [[versions/v13/sections/context#Contexts|MPI-1.3]], [[versions/v21/sections/context#Contexts|MPI-2.1]], [[versions/v22/sections/context#Contexts|MPI-2.2]], [[versions/v30/sections/context#Contexts|MPI-3.0]], [[versions/v31/sections/context#Contexts|MPI-3.1]], [[versions/v40/sections/context#Contexts|MPI-4.0]], [[versions/v41/sections/context#Contexts|MPI-4.1]], [[versions/v50/sections/context#Contexts|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

> Distinct communicators in the same process have distinct contexts. A context is essentially a system-managed tag (or tags) needed to make a communicator safe for point-to-point and MPI-defined collective communication. Safety means that collective and point-to-point communication within one communicator do not interfere, and that communication over distinct communicators don’t interfere. > > A possible implementation for a context is as a supplemental tag attached to messages on send and matched on receive. Each intra-communicator stores the value of its two tags (one for point-to-point and one for collective communication). Communicator-generating functions use a collective communication to agree on a new group-wide unique context. > > Analogously, in ~~inter-communication (which is strictly point-to-point communication),~~ ==> > inter-communication, > >== two context tags are stored per communicator, one used by group A to send and group B to receive, and a second used by group B to send and for group A to receive. > > Since contexts are not explicit objects, other implementations are also possible.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

> Distinct communicators in the same process have distinct contexts. A context is essentially a system-managed tag (or tags) needed to make a communicator safe for point-to-point and MPI-defined collective communication. Safety means that collective and point-to-point communication within one communicator do not interfere, and that communication over distinct communicators don’t interfere. > > A possible implementation for a context is as a supplemental tag attached to messages on send and matched on receive. Each intra-communicator stores the value of its two tags (one for point-to-point and one for collective communication). Communicator-generating functions use a collective communication to agree on a new group-wide unique context. > > Analogously, in ~~> >~~ inter-communication, > > two context tags are stored per communicator, one used by group A to send and group B to receive, and a second used by group B to send and for group A to receive. > > Since contexts are not explicit objects, other implementations are also possible.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

> Distinct communicators in the same process have distinct contexts. A context is essentially a system-managed tag (or tags) needed to make a communicator safe for point-to-point and MPI-defined collective communication. Safety means that collective and point-to-point communication within one communicator do not interfere, and that communication over distinct communicators don’t interfere. > > A possible implementation for a context is as a supplemental tag attached to messages on send and matched on receive. Each intra-communicator stores the value of its two tags (one for point-to-point and one for collective communication). Communicator-generating functions use a collective communication to agree on a new group-wide unique context. > > Analogously, in inter-communication, ~~> >~~ two context tags are stored per communicator, one used by group A to send and group B to receive, and a second used by group B to send and for group A to receive. > > Since contexts are not explicit objects, other implementations are also possible.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~A **context** is a property of communicators (defined next) that allows partitioning of the communication space. A message sent in one context cannot be received in another context. Furthermore, where permitted, collective operations are independent of pending point-to-point operations. Contexts are not explicit MPI objects; they appear only as part of the realization of communicators (below).~~

==A **context** is a property of communicators (defined next) that allows partitioning of the communication space. A message sent in one context cannot be received in another context. Furthermore, where permitted, collective operations are independent of *pending* point-to-point operations==

==and *decoupled MPI activities* of point-to-point operations. Contexts are not explicit MPI objects; they appear only as part of the realization of communicators (below).==

> Distinct communicators in the same ==MPI== process have distinct contexts. A context is essentially a system-managed tag (or tags) needed to make a communicator safe for point-to-point and MPI-defined collective communication. Safety means that collective and point-to-point communication within one communicator do not interfere, and that communication over distinct communicators ~~don’t~~ ==do not== interfere. > > A possible implementation for a context is as a supplemental tag attached to messages on send and matched on receive. Each intra-communicator stores the value of its two tags (one for point-to-point and one for collective communication). Communicator-generating functions use a collective communication to agree on a new group-wide unique context. > > Analogously, in inter-communication, two context tags are stored per communicator, one used by group A to send and group B to receive, and a second used by group B to send and for group A to receive. > > Since contexts are not explicit objects, other implementations are also possible.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Contexts]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Contexts]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Contexts]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Contexts]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Contexts]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Contexts]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Contexts]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Contexts]]

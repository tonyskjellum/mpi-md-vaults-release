---
title: "Communication Request Objects"
chapter: pt2pt
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Communication Request Objects

Chapter **pt2pt** · in [[versions/v21/sections/pt2pt#Communication Request Objects|MPI-2.1]], [[versions/v22/sections/pt2pt#Communication Request Objects|MPI-2.2]], [[versions/v30/sections/pt2pt#Communication Request Objects|MPI-3.0]], [[versions/v31/sections/pt2pt#Communication Request Objects|MPI-3.1]], [[versions/v40/sections/pt2pt#Communication Request Objects|MPI-4.0]], [[versions/v41/sections/pt2pt#Communication Request Objects|MPI-4.1]], [[versions/v50/sections/pt2pt#Communication Request Objects|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

Nonblocking communications use opaque ~~<span class="sans-serif">request</span>~~ ==**request**== objects to identify communication operations and match the operation that initiates the communication with the operation that terminates it. These are system objects that are accessed via a handle. A request object identifies various properties of a communication operation, such as the send mode, the communication buffer that is associated with it, its context, the tag and destination arguments to be used for a send, or the tag and source arguments to be used for a receive. In addition, this object stores information about the status of the pending communication operation.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Nonblocking ~~communications~~ ==communication operations== use opaque **request** objects to identify communication operations and match the operation that initiates the communication with the operation that terminates it. These are system objects that are accessed via a handle. A request object identifies various properties of a communication operation, such as the send mode, the communication buffer that is associated with it, its context, the tag and destination arguments to be used for a send, or the tag and source arguments to be used for a receive. In addition, this object stores information about the status of the ~~pending~~ ==*pending*== communication operation.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Communication Request Objects]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Communication Request Objects]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Communication Request Objects]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Communication Request Objects]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Communication Request Objects]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Communication Request Objects]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Communication Request Objects]]

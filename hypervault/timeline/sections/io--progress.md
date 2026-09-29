---
title: "Progress"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Progress

Chapter **io** · in [[versions/v20/sections/io#Progress|MPI-2.0]], [[versions/v21/sections/io#Progress|MPI-2.1]], [[versions/v22/sections/io#Progress|MPI-2.2]], [[versions/v30/sections/io#Progress|MPI-3.0]], [[versions/v31/sections/io#Progress|MPI-3.1]], [[versions/v40/sections/io#Progress|MPI-4.0]], [[versions/v41/sections/io#Progress|MPI-4.1]], [[versions/v50/sections/io#Progress|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

The ~~progress~~ ==*progress*== rules of MPI are both a promise to users and a set of constraints on implementors. In cases where the progress rules restrict possible implementation choices more than the interface specification alone, the progress rules take precedence.

Nonblocking data access routines inherit the following progress rule from nonblocking ~~point to point~~ ==point-to-point== communication: a nonblocking write is equivalent to a nonblocking send for which a receive is eventually posted, and a nonblocking read is equivalent to a nonblocking receive for which a send is eventually posted.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Progress]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Progress]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Progress]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Progress]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Progress]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Progress]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Progress]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Progress]]

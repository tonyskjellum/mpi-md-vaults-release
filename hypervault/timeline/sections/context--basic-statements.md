---
title: "Basic Statements"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Basic Statements

Chapter **context** · in [[versions/v13/sections/context#Basic Statements|MPI-1.3]], [[versions/v21/sections/context#Basic Statements|MPI-2.1]], [[versions/v22/sections/context#Basic Statements|MPI-2.2]], [[versions/v30/sections/context#Basic Statements|MPI-3.0]], [[versions/v31/sections/context#Basic Statements|MPI-3.1]], [[versions/v40/sections/context#Basic Statements|MPI-4.0]], [[versions/v41/sections/context#Basic Statements|MPI-4.1]], [[versions/v50/sections/context#Basic Statements|MPI-5.0]]

## Changes along the time axis

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

When a caller passes a communicator (that contains a context and group) to a callee, that communicator must be free of side effects throughout execution of the subprogram: there should be no active operations on that communicator that might involve the ==MPI== process. This provides one model in which libraries can be written, and work “safely.” For libraries so designated, the callee has permission to do whatever communication it likes with the communicator, and under the above guarantee knows that no other communications will interfere. Since we permit good implementations to create new communicators without synchronization (such as by preallocated contexts on communicators), this does not impose a significant overhead.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Basic Statements]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Basic Statements]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Basic Statements]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Basic Statements]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Basic Statements]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Basic Statements]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Basic Statements]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Basic Statements]]

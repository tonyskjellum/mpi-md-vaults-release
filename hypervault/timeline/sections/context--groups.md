---
title: "Groups."
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/context]
---

# Groups.

Chapter **context** · in [[versions/v13/sections/context#Groups.|MPI-1.3]], [[versions/v21/sections/context#Groups.|MPI-2.1]], [[versions/v22/sections/context#Groups.|MPI-2.2]], [[versions/v30/sections/context#Groups.|MPI-3.0]], [[versions/v31/sections/context#Groups.|MPI-3.1]], [[versions/v40/sections/context#Groups.|MPI-4.0]]

## Changes along the time axis

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~Groups define an ordered collection of processes, each with a rank, and it is this group that defines the low-level names for inter-process communication (ranks are used for sending and receiving). Thus, groups define a scope for process names in point-to-point communication. In addition, groups define the scope of collective operations. Groups may be manipulated separately from communicators in MPI, but only communicators can be used in communication operations.~~

==A **group** is an ordered set of MPI process identifiers (henceforth MPI processes); MPI processes are implementation-/dependent objects. Each MPI process in a group is associated with an integer **rank**. Ranks are consecutive and start from zero. Groups are represented by opaque **group objects**, and hence cannot be directly transferred from one MPI process to another. A group is used within a communicator to describe the participants in a communication “universe” and to rank such participants (thus giving them unique names within that “universe” of communication).==

==There is a special pre-defined group: `MPI_GROUP_EMPTY`, which is a group with no members. The predefined constant `MPI_GROUP_NULL` is the value used for invalid group handles.==

==> [!note] Advice to users==

==> `MPI_GROUP_EMPTY`, which is a valid handle to an empty group, should not be confused with `MPI_GROUP_NULL`, which in turn is an invalid handle. The former may be used as an argument to group procedures; the latter is not a valid input value for an input argument.==

==> [!warning] Advice to implementors==

==> Simple implementations of MPI will enumerate groups, such as in a table. However, more advanced data structures make sense in order to improve scalability and memory usage with large numbers of MPI processes. Such implementations are possible with MPI.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Groups.]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Groups.]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Groups.]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Groups.]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Groups.]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Groups.]]

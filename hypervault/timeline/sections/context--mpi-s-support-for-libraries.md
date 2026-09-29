---
title: "MPI’s Support for Libraries"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# MPI’s Support for Libraries

Chapter **context** · in [[versions/v13/sections/context#MPI’s Support for Libraries|MPI-1.3]], [[versions/v21/sections/context#MPI’s Support for Libraries|MPI-2.1]], [[versions/v22/sections/context#MPI’s Support for Libraries|MPI-2.2]], [[versions/v30/sections/context#MPI’s Support for Libraries|MPI-3.0]], [[versions/v31/sections/context#MPI’s Support for Libraries|MPI-3.1]], [[versions/v40/sections/context#MPI’s Support for Libraries|MPI-4.0]], [[versions/v41/sections/context#MPI’s Support for Libraries|MPI-4.1]], [[versions/v50/sections/context#MPI’s Support for Libraries|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~**Communicators** (see ) encapsulate all of these ideas in order to provide the appropriate scope for all communication operations in MPI. Communicators are divided into two kinds: intra-communicators for operations within a single group of processes, and inter-communicators, for point-to-point communication between two groups of processes.~~

==**Communicators** (see ) encapsulate all of these ideas in order to provide the appropriate scope for all communication operations in MPI. Communicators are divided into two kinds:==

==intra-communicators for operations within a single group of processes and inter-communicators for operations between two groups of==

==processes.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~intra-communicators for operations within a single group of processes and inter-communicators for operations between two groups of~~

~~processes.~~

==intra-communicators for operations within a single group of processes and inter-communicators for operations between two groups of processes.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~**Communicators** (see ) encapsulate all of these ideas in order to provide the appropriate scope for all communication operations in MPI. Communicators are divided into two kinds:~~

~~intra-communicators for operations within a single group of processes and inter-communicators for operations between two groups of processes.~~

==**Communicators** (see ) encapsulate all of these ideas in order to provide the appropriate scope for all communication operations in MPI. Communicators are divided into two kinds: intra-communicators for operations within a single group of processes and inter-communicators for operations between two groups of processes.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

- **Groups** of ==MPI== processes,

~~**Communicators** (see ) encapsulate all of these ideas in order to provide the appropriate scope for all communication operations in MPI. Communicators are divided into two kinds: intra-communicators for operations within a single group of processes and inter-communicators for operations between two groups of processes.~~

==**Communicators** (see ) encapsulate all of these ideas in order to provide the appropriate scope for all communication operations in MPI. Communicators are divided into two kinds: intra-communicators for operations within a single group of MPI processes and inter-communicators for operations between two groups of MPI processes.==

==**Caching.** Communicators (see below) provide a “caching” mechanism that allows one to associate new attributes with communicators, on par with MPI built-in features. This can be used by advanced users to adorn communicators further, and by MPI to implement some communicator functions. For example, the virtual-topology functions described in Chapter [[versions/v41/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]] are likely to be supported this way.==

==**Groups.** Groups define an ordered collection of MPI processes, each with a rank, and it is this group that defines the low-level names (ranks) for communication. Thus, groups define a scope for MPI process names in point-to-point communication. In addition, groups define the scope of collective operations. Groups may be manipulated separately from communicators in MPI, but only communicators can be used in communication operations.==

==**Intra-Communicators.** The most commonly used means for message-passing in MPI is via intra-communicators. Intra-communicators contain an instance of a group, contexts of communication for both point-to-point and collective communication, and the ability to include virtual topology and other attributes. These features work as follows:==

==- **Contexts** provide the ability to have separate safe “universes” of message-passing in MPI. A context is akin to an additional tag that differentiates messages. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are *pending* communication operations==

==  or *decoupled MPI activities* on “other” communicators, and avoids the need to synchronize entry or exit into library code. *Pending* communication==

==  or *decoupled MPI activities* of point-to-point operations are also guaranteed not to interfere with collective communication operations within a single communicator.==

==- **Groups** define the participants in the communication (see above) of a communicator.==

==- A **virtual topology** defines a special mapping of the MPI processes ranks in a group to and from a topology. Special constructors for communicators are defined in Chapter [[versions/v41/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]] to provide this feature. Intra-communicators as described in this chapter do not have topologies.==

==- **Attributes** define the local information that the user or library has added to a communicator for later reference.==

==> [!note] Advice to users==

==> The practice in many communication libraries is that there is a unique, predefined communication universe that includes all MPI processes available when the parallel program is initiated; the MPI processes are assigned consecutive ranks. Participants in a point-to-point communication are identified by their rank; a collective communication (such as broadcast) always involves all MPI processes. When using the World Model (Section [[versions/v41/sections/dynamic#The World Model|The World Model]] ), this practice can be followed in MPI by using the predefined communicator `MPI_COMM_WORLD`.==

==**Inter-Communicators.** The discussion has dealt so far with **intra-communication**: communication within a group. MPI also supports **inter-communication**: communication between two nonoverlapping groups. When an application is built by composing several parallel modules, it is convenient to allow one module to communicate with another using local ranks for addressing within the second module. This is especially convenient in a client-server computing paradigm, where either client or server are parallel. The support of inter-communication also provides a mechanism for the extension of MPI to a dynamic model where not all MPI processes are preallocated at initialization time. In such a situation, it becomes necessary to support communication across “universes.” Inter-communication is supported by objects called **inter-communicators**. These objects bind two groups together with communication contexts shared by both groups. For inter-communicators, these features work as follows:==

==- Contexts provide the ability to have a separate safe “universe” of message-passing between the two groups. A send operation in the local group is always matched by a receive operation in the remote group, and vice versa. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are *pending* communication operations==

==  or *decoupled MPI activities* on “other” communicators, and avoids the need to synchronize entry or exit into library code.==

==- A local and remote group specify the recipients and destinations for an inter-/communicator.==

==- Virtual topology is undefined for an inter-communicator.==

==- As before, attributes cache defines the local information that the user or library has added to a communicator for later reference.==

==MPI provides mechanisms for creating and manipulating inter-communicators. They are used for point-to-point and collective communication in a related manner to intra-communicators. Users who do not need inter-communication in their applications can safely ignore this extension. Users who require inter-communication between overlapping groups must layer this capability on top of MPI.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#MPI’s Support for Libraries]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#MPI’s Support for Libraries]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#MPI’s Support for Libraries]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#MPI’s Support for Libraries]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#MPI’s Support for Libraries]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#MPI’s Support for Libraries]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#MPI’s Support for Libraries]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#MPI’s Support for Libraries]]

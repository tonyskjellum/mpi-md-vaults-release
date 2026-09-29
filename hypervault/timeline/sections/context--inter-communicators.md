---
title: "Inter-Communicators."
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/context]
---

# Inter-Communicators.

Chapter **context** · in [[versions/v13/sections/context#Inter-communicators.|MPI-1.3]], [[versions/v21/sections/context#Inter-communicators.|MPI-2.1]], [[versions/v22/sections/context#Inter-communicators.|MPI-2.2]], [[versions/v30/sections/context#Inter-communicators.|MPI-3.0]], [[versions/v31/sections/context#Inter-communicators.|MPI-3.1]], [[versions/v40/sections/context#Inter-Communicators.|MPI-4.0]]

Heading by release: MPI-1.3: “Inter-communicators.”; MPI-2.1: “Inter-communicators.”; MPI-2.2: “Inter-communicators.”; MPI-3.0: “Inter-communicators.”; MPI-3.1: “Inter-communicators.”; MPI-4.0: “Inter-Communicators.”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~- **Contexts** provide the ability to have a separate safe “universe” of message passing between the two groups. A send in the local group is always a receive in the remote group, and vice versa. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are pending communications on “other” communicators, and avoids the need to synchronize entry or exit into library code. There is no general-purpose collective communication on inter-communicators, so contexts are used just to isolate point-to-point communication.~~

==- **Contexts** provide the ability to have a separate safe “universe” of message-passing between the two groups. A send in the local group is always a receive in the remote group, and vice versa. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are pending communications on “other” communicators, and avoids the need to synchronize entry or exit into library==

==  code.==

~~MPI provides mechanisms for creating and manipulating inter-communicators. They are used for point-to-point communication in an related manner to intra-communicators. Users who do not need inter-communication in their applications can safely ignore this extension. Users who need collective operations via inter-communicators must layer it on top of MPI. Users who require inter-communication between overlapping groups must also layer this capability on top of MPI.~~

==MPI provides mechanisms for creating and manipulating inter-communicators. They are used for point-to-point==

==and collective==

==communication in an related manner to intra-communicators. Users who do not need inter-communication in their applications can safely ignore this extension.==

==Users==

==who require inter-communication between overlapping groups==

==must layer==

==this capability on top of MPI.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~- **Contexts** provide the ability to have a separate safe “universe” of message-passing between the two groups. A send in the local group is always a receive in the remote group, and vice versa. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are pending communications on “other” communicators, and avoids the need to synchronize entry or exit into library~~

~~  code.~~

==- Contexts provide the ability to have a separate safe “universe” of message-passing between the two groups. A send in the local group is always a receive in the remote group, and vice versa. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are pending communications on “other” communicators, and avoids the need to synchronize entry or exit into library code.==

~~MPI provides mechanisms for creating and manipulating inter-communicators. They are used for point-to-point~~

~~and collective~~

~~communication in an related manner to intra-communicators. Users who do not need inter-communication in their applications can safely ignore this extension.~~

~~Users~~

~~who require inter-communication between overlapping groups~~

~~must layer~~

~~this capability on top of MPI.~~

==MPI provides mechanisms for creating and manipulating inter-communicators. They are used for point-to-point and collective communication in an related manner to intra-communicators. Users who do not need inter-communication in their applications can safely ignore this extension.==

==Users who require inter-communication between overlapping groups==

==must layer this capability on top of MPI.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~MPI provides mechanisms for creating and manipulating inter-communicators. They are used for point-to-point and collective communication in an related manner to intra-communicators. Users who do not need inter-communication in their applications can safely ignore this extension.~~

~~Users who require inter-communication between overlapping groups~~

~~must layer this capability on top of MPI.~~

==MPI provides mechanisms for creating and manipulating inter-communicators. They are used for point-to-point and collective communication in an related manner to intra-communicators. Users who do not need inter-communication in their applications can safely ignore this extension. Users who require inter-communication between overlapping groups must layer this capability on top of MPI.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

- Contexts provide the ability to have a separate safe “universe” of message-passing between the two groups. A send ==operation== in the local group is always ==matched by== a receive ==operation== in the remote group, and vice versa. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are pending communications on “other” communicators, and avoids the need to synchronize entry or exit into library code.

- A local and remote group specify the recipients and destinations for an ~~inter-com­mun­i­ca­tor.~~ ==inter-/communicator.==

MPI provides mechanisms for creating and manipulating inter-communicators. They are used for point-to-point and collective communication in ~~an~~ ==a== related manner to intra-communicators. Users who do not need inter-communication in their applications can safely ignore this extension. Users who require inter-communication between overlapping groups must layer this capability on top of MPI.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~The discussion has dealt so far with **intra-communication**: communication within a group. MPI also supports **inter-communication**: communication between two non-overlapping groups. When an application is built by composing several parallel modules, it is convenient to allow one module to communicate with another using local ranks for addressing within the second module. This is especially convenient in a client-server computing paradigm, where either client or server are parallel. The support of inter-communication also provides a mechanism for the extension of MPI to a dynamic model where not all processes are preallocated at initialization time. In such a situation, it becomes necessary to support communication across “universes.” Inter-communication is supported by objects called **inter-communicators**. These objects bind two groups together with communication contexts shared by both groups. For inter-communicators, these features work as follows:~~

~~- Contexts provide the ability to have a separate safe “universe” of message-passing between the two groups. A send operation in the local group is always matched by a receive operation in the remote group, and vice versa. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are pending communications on “other” communicators, and avoids the need to synchronize entry or exit into library code.~~

~~- A local and remote group specify the recipients and destinations for an inter-/communicator.~~

~~- Virtual topology is undefined for an inter-communicator.~~

~~- As before, attributes cache defines the local information that the user or library has added to a communicator for later reference.~~

~~MPI provides mechanisms for creating and manipulating inter-communicators. They are used for point-to-point and collective communication in a related manner to intra-communicators. Users who do not need inter-communication in their applications can safely ignore this extension. Users who require inter-communication between overlapping groups must layer this capability on top of MPI.~~

==Intra-communicators bring together the concepts of group and context. To support implementation-/specific optimizations, and application topologies (defined in the next chapter, Chapter [[versions/v41/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]] ), communicators may also “cache” additional information (see Section [[versions/v41/sections/context#Caching|Caching]] ). MPI communication operations reference communicators to determine the scope and the “communication universe” in which a point-to-point or collective operation is to operate.==

==Each communicator contains a group of valid participants; this group always includes the local MPI process. The source and destination of a message are identified by MPI process ranks within that group.==

==For collective communication, the intra-communicator specifies the set of MPI processes that participate in the collective operation (and their order, when significant). Thus, the communicator restricts the “spatial” scope of communication, and provides machine-independent MPI process addressing through ranks.==

==Intra-communicators are represented by opaque **intra-communicator objects**, and hence cannot be directly transferred from one MPI process to another.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Inter-communicators.]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Inter-communicators.]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Inter-communicators.]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Inter-communicators.]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Inter-communicators.]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Inter-Communicators.]]

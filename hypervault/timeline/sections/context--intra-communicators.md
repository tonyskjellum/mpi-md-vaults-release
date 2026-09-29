---
title: "Intra-Communicators."
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/context]
---

# Intra-Communicators.

Chapter **context** · in [[versions/v13/sections/context#Intra-communicators.|MPI-1.3]], [[versions/v21/sections/context#Intra-communicators.|MPI-2.1]], [[versions/v22/sections/context#Intra-communicators.|MPI-2.2]], [[versions/v30/sections/context#Intra-communicators.|MPI-3.0]], [[versions/v31/sections/context#Intra-communicators.|MPI-3.1]], [[versions/v40/sections/context#Intra-Communicators.|MPI-4.0]]

Heading by release: MPI-1.3: “Intra-communicators.”; MPI-2.1: “Intra-communicators.”; MPI-2.2: “Intra-communicators.”; MPI-3.0: “Intra-communicators.”; MPI-3.1: “Intra-communicators.”; MPI-4.0: “Intra-Communicators.”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

- **Contexts** provide the ability to have separate safe “universes” of ~~message passing~~ ==message-passing== in MPI. A context is akin to an additional tag that differentiates messages. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are pending communications on “other” communicators, and avoids the need to synchronize entry or exit into library code. Pending point-to-point communications are also guaranteed not to interfere with collective communications within a single communicator.

- A **virtual topology** defines a special mapping of the ranks in a group to and from a topology. Special constructors for communicators are defined in ~~chapter~~ ==Chapter== [[versions/v21/sections/topol#Process Topologies|Process Topologies]] to provide this feature. Intra-communicators as described in this chapter do not have topologies.

> The ~~current~~ practice in many communication libraries is that there is ==> >== a unique, predefined communication universe that includes all processes available when the parallel program is initiated; the processes are assigned consecutive ranks. Participants in a point-to-point communication are identified by their rank; a collective communication (such as broadcast) always involves all processes. This practice can be followed in MPI by using the predefined communicator `MPI_COMM_WORLD`. Users who are satisfied with this practice can plug in `MPI_COMM_WORLD` wherever a communicator argument is required, and can consequently disregard the rest of this chapter.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

> The practice in many communication libraries is that there is ~~> >~~ a unique, predefined communication universe that includes all processes available when the parallel program is initiated; the processes are assigned consecutive ranks. Participants in a point-to-point communication are identified by their rank; a collective communication (such as broadcast) always involves all processes. This practice can be followed in MPI by using the predefined communicator `MPI_COMM_WORLD`. Users who are satisfied with this practice can plug in `MPI_COMM_WORLD` wherever a communicator argument is required, and can consequently disregard the rest of this chapter.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

> The practice in many communication libraries is that there is a unique, predefined communication universe that includes all processes available when the parallel program is initiated; the processes are assigned consecutive ranks. Participants in a point-to-point communication are identified by their rank; a collective communication (such as broadcast) always involves all processes. This practice can be followed in MPI by using the predefined communicator `MPI_COMM_WORLD`. ~~Users~~ ==*Users== who are satisfied with this practice can plug in `MPI_COMM_WORLD` wherever a communicator argument is required, and can consequently disregard the rest of this ~~chapter.~~ ==chapter.*==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

The most commonly used means for ~~message passing~~ ==message-passing== in MPI is via intra-communicators. Intra-communicators contain an instance of a group, contexts of communication for both point-to-point and collective communication, and the ability to include virtual topology and other attributes. These features work as follows:

> The practice in many communication libraries is that there is a unique, predefined communication universe that includes all processes available when the parallel program is initiated; the processes are assigned consecutive ranks. Participants in a point-to-point communication are identified by their rank; a collective communication (such as broadcast) always involves all processes. ~~This~~ ==When using the World Model (Section [[versions/v40/sections/dynamic#The World Model|The World Model]] ), this== practice can be followed in MPI by using the predefined communicator `MPI_COMM_WORLD`. ~~*Users who are satisfied with this practice can plug in `MPI_COMM_WORLD` wherever a communicator argument is required, and can consequently disregard the rest of this chapter.*~~

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~The most commonly used means for message-passing in MPI is via intra-communicators. Intra-communicators contain an instance of a group, contexts of communication for both point-to-point and collective communication, and the ability to include virtual topology and other attributes. These features work as follows:~~

~~- **Contexts** provide the ability to have separate safe “universes” of message-passing in MPI. A context is akin to an additional tag that differentiates messages. The system manages this differentiation process. The use of separate communication contexts by distinct libraries (or distinct library invocations) insulates communication internal to the library execution from external communication. This allows the invocation of the library even if there are pending communications on “other” communicators, and avoids the need to synchronize entry or exit into library code. Pending point-to-point communications are also guaranteed not to interfere with collective communications within a single communicator.~~

~~- **Groups** define the participants in the communication (see above) of a communicator.~~

~~- A **virtual topology** defines a special mapping of the ranks in a group to and from a topology. Special constructors for communicators are defined in Chapter [[versions/v41/sections/topol#Process Topologies|Process Topologies]] to provide this feature. Intra-communicators as described in this chapter do not have topologies.~~

~~- **Attributes** define the local information that the user or library has added to a communicator for later reference.~~

~~> [!note] Advice to users~~

~~> The practice in many communication libraries is that there is a unique, predefined communication universe that includes all processes available when the parallel program is initiated; the processes are assigned consecutive ranks. Participants in a point-to-point communication are identified by their rank; a collective communication (such as broadcast) always involves all processes. When using the World Model (Section [[versions/v41/sections/dynamic#The World Model|The World Model]] ), this practice can be followed in MPI by using the predefined communicator `MPI_COMM_WORLD`.~~

==Intra-communicators bring together the concepts of group and context. To support implementation-/specific optimizations, and application topologies (defined in the next chapter, Chapter [[versions/v41/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]] ), communicators may also “cache” additional information (see Section [[versions/v41/sections/context#Caching|Caching]] ). MPI communication operations reference communicators to determine the scope and the “communication universe” in which a point-to-point or collective operation is to operate.==

==Each communicator contains a group of valid participants; this group always includes the local MPI process. The source and destination of a message are identified by MPI process ranks within that group.==

==For collective communication, the intra-communicator specifies the set of MPI processes that participate in the collective operation (and their order, when significant). Thus, the communicator restricts the “spatial” scope of communication, and provides machine-independent MPI process addressing through ranks.==

==Intra-communicators are represented by opaque **intra-communicator objects**, and hence cannot be directly transferred from one MPI process to another.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Intra-communicators.]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Intra-communicators.]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Intra-communicators.]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Intra-communicators.]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Intra-communicators.]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Intra-Communicators.]]

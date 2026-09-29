---
title: "Intra-Communicators"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Intra-Communicators

Chapter **context** · in [[versions/v13/sections/context#Intra-Communicators|MPI-1.3]], [[versions/v21/sections/context#Intra-Communicators|MPI-2.1]], [[versions/v22/sections/context#Intra-Communicators|MPI-2.2]], [[versions/v30/sections/context#Intra-Communicators|MPI-3.0]], [[versions/v31/sections/context#Intra-Communicators|MPI-3.1]], [[versions/v40/sections/context#Intra-Communicators|MPI-4.0]], [[versions/v41/sections/context#Intra-Communicators|MPI-4.1]], [[versions/v50/sections/context#Intra-Communicators|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

implementation-specific optimizations, and application topologies (defined in the next chapter, ~~chapter~~ ==Chapter== [[versions/v21/sections/topol#Process Topologies|Process Topologies]] ), communicators may also “cache” additional information (see ~~section~~ ==Section== [[versions/v21/sections/context#Caching|Caching]] ). MPI communication operations reference communicators to determine the scope and the “communication universe” in which a point-to-point or collective operation is to operate.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Intra-communicators bring together the concepts of group and context. To support~~

~~implementation-specific optimizations, and application topologies (defined in the next chapter, Chapter [[versions/v31/sections/topol#Process Topologies|Process Topologies]] ), communicators may also “cache” additional information (see Section [[versions/v31/sections/context#Caching|Caching]] ). MPI communication operations reference communicators to determine the scope and the “communication universe” in which a point-to-point or collective operation is to operate.~~

==Intra-communicators bring together the concepts of group and context. To support implementation-specific optimizations, and application topologies (defined in the next chapter, Chapter [[versions/v31/sections/topol#Process Topologies|Process Topologies]] ), communicators may also “cache” additional information (see Section [[versions/v31/sections/context#Caching|Caching]] ). MPI communication operations reference communicators to determine the scope and the “communication universe” in which a point-to-point or collective operation is to operate.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Intra-communicators bring together the concepts of group and context. To support ~~implementation-specific~~ ==implementation-/specific== optimizations, and application topologies (defined in the next chapter, Chapter [[versions/v40/sections/topol#Process Topologies|Process Topologies]] ), communicators may also “cache” additional information (see Section [[versions/v40/sections/context#Caching|Caching]] ). MPI communication operations reference communicators to determine the scope and the “communication universe” in which a point-to-point or collective operation is to operate.

Each communicator contains a group of valid participants; this group always includes the local process. The source and destination of a message ~~is~~ ==are== identified by process ~~rank~~ ==ranks== within that group.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Intra-communicators bring together the concepts of group and context. To support implementation-/specific optimizations, and application topologies (defined in the next chapter, Chapter ~~[[versions/v41/sections/topol#Process Topologies|Process Topologies]]~~ ==[[versions/v41/sections/topol#Virtual Topologies for MPI Processes|Virtual Topologies for MPI Processes]]== ), communicators may also “cache” additional information (see Section [[versions/v41/sections/context#Caching|Caching]] ). MPI communication operations reference communicators to determine the scope and the “communication universe” in which a point-to-point or collective operation is to operate.

Each communicator contains a group of valid participants; this group always includes the local ==MPI== process. The source and destination of a message are identified by ==MPI== process ranks within that group.

For collective communication, the intra-communicator specifies the set of ==MPI== processes that participate in the collective operation (and their order, when significant). Thus, the communicator restricts the “spatial” scope of communication, and provides machine-independent ==MPI== process addressing through ranks.

Intra-communicators are represented by opaque **intra-communicator objects**, and hence cannot be directly transferred from one ==MPI== process to another.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Intra-Communicators]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Intra-Communicators]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Intra-Communicators]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Intra-Communicators]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Intra-Communicators]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Intra-Communicators]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Intra-Communicators]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Intra-Communicators]]

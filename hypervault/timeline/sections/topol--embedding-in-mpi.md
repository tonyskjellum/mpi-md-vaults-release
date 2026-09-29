---
title: "Embedding in MPI"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Embedding in MPI

Chapter **topol** · in [[versions/v13/sections/topol#Embedding in MPI|MPI-1.3]], [[versions/v21/sections/topol#Embedding in MPI|MPI-2.1]], [[versions/v22/sections/topol#Embedding in MPI|MPI-2.2]], [[versions/v30/sections/topol#Embedding in MPI|MPI-3.0]], [[versions/v31/sections/topol#Embedding in MPI|MPI-3.1]], [[versions/v40/sections/topol#Embedding in MPI|MPI-4.0]], [[versions/v41/sections/topol#Embedding in MPI|MPI-4.1]], [[versions/v50/sections/topol#Embedding in MPI|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

The support for virtual topologies as defined in this chapter is consistent with other parts of MPI, and, whenever possible, makes use of functions that are defined elsewhere. Topology information is associated with communicators. It is added to communicators using the caching mechanism described in Chapter [[versions/v21/sections/context#Groups, Contexts, ==Communicators,== and ~~Communicators|Groups,~~ ==Caching|Groups,== Contexts, ==Communicators,== and ~~Communicators]]~~ ==Caching]]== .

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

==Information representing an MPI virtual topology may be added to a communicator at the time of its creation. If a communicator creation function adds information representing an MPI virtual topology to the output communicator it creates, then it either propagates the topology representation from the input communicator to the output communicator, or adds a new topology representation generated from the input parameters that describe a virtual topology. The description of every MPI communicator creation function explicitly states how topology information is handled. Communicator creation functions that create new topology representations are described in [[versions/v40/sections/topol#Topology Constructors|Topology Constructors]] .==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The support for ~~virtual topologies~~ ==*virtual topologies*== as defined in this chapter is consistent with other parts of MPI, and, whenever possible, makes use of functions that are defined elsewhere. Topology information is associated with communicators. It is added to communicators using the caching mechanism described in Chapter [[versions/v41/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] .

Information representing ~~an MPI virtual topology~~ ==a *virtual topology*== may be added to a communicator at the time of its creation. If a communicator creation function adds information representing ~~an MPI virtual topology~~ ==a *virtual topology*== to the output communicator it creates, then it either propagates the topology representation from the input communicator to the output communicator, or adds a new topology representation generated from the input parameters that describe a ~~virtual topology.~~ ==*virtual topology*.== The description of every MPI communicator creation function explicitly states how topology information is handled. Communicator creation functions that create new topology representations are described in [[versions/v41/sections/topol#Topology Constructors|Topology Constructors]] .

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#Embedding in MPI]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#Embedding in MPI]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Embedding in MPI]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Embedding in MPI]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Embedding in MPI]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Embedding in MPI]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Embedding in MPI]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Embedding in MPI]]

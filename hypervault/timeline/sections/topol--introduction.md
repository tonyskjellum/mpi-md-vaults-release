---
title: "Introduction"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Introduction

Chapter **topol** · in [[versions/v13/sections/topol#Introduction|MPI-1.3]], [[versions/v21/sections/topol#Introduction|MPI-2.1]], [[versions/v22/sections/topol#Introduction|MPI-2.2]], [[versions/v30/sections/topol#Introduction|MPI-3.0]], [[versions/v31/sections/topol#Introduction|MPI-3.1]], [[versions/v40/sections/topol#Introduction|MPI-4.0]], [[versions/v41/sections/topol#Introduction|MPI-4.1]], [[versions/v50/sections/topol#Introduction|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~As stated in chapter [[versions/v21/sections/context#Groups, Contexts, and Communicators|Groups, Contexts, and Communicators]] , a process group in MPI is a collection of `n` processes. Each process in the group is assigned a rank between `0` and `n-1`. In many parallel applications a linear ranking of processes does not adequately reflect the logical communication pattern of the processes (which is usually determined by the underlying problem geometry and the numerical algorithm used). Often the processes are arranged in topological patterns such as two- or three-dimensional grids. More generally, the logical process arrangement is described by a graph. In this chapter we will refer to this logical process arrangement as the “virtual topology.”~~

~~A clear distinction must be made between the virtual process topology and the topology of the underlying, physical hardware. The virtual topology can be exploited by the system in the assignment of processes to physical processors, if this helps to improve the communication performance on a given machine. How this mapping is done, however, is outside the scope of MPI. The description of the virtual topology, on the other hand, depends only on the application, and is machine-independent. The functions that are proposed in this chapter deal only with machine-independent mapping.~~

==As stated in Chapter [[versions/v21/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , a process group in MPI is a collection of `n` processes. Each process in the group is assigned a rank between `0` and `n-1`. In many parallel applications a linear ranking of processes does not adequately reflect the logical communication pattern of the processes (which is usually determined by the underlying problem geometry and the numerical algorithm used). Often the processes are arranged in topological patterns such as two- or three-dimensional grids. More generally, the logical process arrangement is described by a graph. In this chapter we will refer to this logical process arrangement as the “virtual topology.”==

==A clear distinction must be made between the virtual process topology and the topology of the underlying, physical hardware. The virtual topology can be exploited by the system in the assignment of processes to physical processors, if this helps to improve the communication performance on a given machine. How this mapping is done, however, is outside the scope of MPI. The description of the virtual topology, on the other hand, depends only on the application, and is machine-independent.==

==The functions that are described in this chapter deal only with machine-independent mapping.==

> Though physical mapping is not discussed, the existence of the virtual topology information may be used as advice by the runtime system. There are well-known techniques for mapping grid/torus structures to hardware to­po­logies such as hypercubes or grids. For more complicated graph structures good heuristics often yield nearly optimal results . On the other hand, if there is no way for the user to specify the logical process arrangement as a “virtual topology,” a random mapping is most likely to result. On some machines, this will lead to unnecessary contention in the interconnection network. Some details about predicted and measured performance improvements that result from good process-to-processor mapping on modern wormhole-routing architectures can be found in ==> >== . > > Besides possible performance benefits, the virtual topology can function as a convenient, process-naming structure, with ~~tremendous~~ ==> > significant > >== benefits for program readability and notational power in message-passing programming.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~A clear distinction must be made between the virtual process topology and the topology of the underlying, physical hardware. The virtual topology can be exploited by the system in the assignment of processes to physical processors, if this helps to improve the communication performance on a given machine. How this mapping is done, however, is outside the scope of MPI. The description of the virtual topology, on the other hand, depends only on the application, and is machine-independent.~~

~~The functions that are described in this chapter deal only with machine-independent mapping.~~

==A clear distinction must be made between the virtual process topology and the topology of the underlying, physical hardware. The virtual topology can be exploited by the system in the assignment of processes to physical processors, if this helps to improve the communication performance on a given machine. How this mapping is done, however, is outside the scope of MPI. The description of the virtual topology, on the other hand, depends only on the application, and is machine-independent. The functions that are described in this chapter deal with machine-independent mapping and communication on virtual process topologies.==

> Though physical mapping is not discussed, the existence of the virtual topology information may be used as advice by the runtime system. There are well-known techniques for mapping grid/torus structures to hardware to­po­logies such as hypercubes or grids. For more complicated graph structures good heuristics often yield nearly optimal results . On the other hand, if there is no way for the user to specify the logical process arrangement as a “virtual topology,” a random mapping is most likely to result. On some machines, this will lead to unnecessary contention in the interconnection network. Some details about predicted and measured performance improvements that result from good process-to-processor mapping on modern wormhole-routing architectures can be found in ~~> >~~ . > > Besides possible performance benefits, the virtual topology can function as a convenient, process-naming structure, with ~~> >~~ significant ~~> >~~ benefits for program readability and notational power in message-passing programming.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> Though physical mapping is not discussed, the existence of the virtual topology information may be used as advice by the runtime system. There are well-known techniques for mapping grid/torus structures to hardware ~~to­po­logies~~ ==topologies== such as hypercubes or grids. For more complicated graph structures good heuristics often yield nearly optimal results . On the other hand, if there is no way for the user to specify the logical process arrangement as a “virtual topology,” a random mapping is most likely to result. On some machines, this will lead to unnecessary contention in the interconnection network. Some details about predicted and measured performance improvements that result from good process-to-processor mapping on modern wormhole-routing architectures can be found in . > > Besides possible performance benefits, the virtual topology can function as a convenient, process-naming structure, with significant benefits for program readability and notational power in message-passing programming.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

This chapter discusses the MPI ~~topology~~ ==*virtual topology*== mechanism. A ~~topology~~ ==*virtual topology*== is an extra, optional attribute that one can give to an intra-communicator; ~~topologies~~ ==*virtual topologies*== cannot be added to inter-communicators. A ~~topology~~ ==*virtual topology*== can provide a convenient naming mechanism for the ==MPI== processes of a group (within a communicator), and additionally, may assist the runtime system in mapping the processes onto hardware.

As stated in Chapter [[versions/v41/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] , a ~~process~~ group in MPI is ~~a collection~~ ==an ordered set== of `n` ~~processes.~~ ==process identifiers (henceforth MPI processes).== Each ==MPI== process in the group is assigned a rank between `0` and `n-1`. In many parallel ~~applications~~ ==applications,== a linear ~~ranking~~ ==assignment== of ==integer ranks to the MPI== processes does not adequately reflect the logical communication pattern of the ==MPI== processes (which is usually determined by the underlying problem geometry and the numerical algorithm used). Often the ==MPI== processes are arranged in topological patterns such as two- or three-dimensional grids. More generally, the logical ==MPI== process arrangement is described by a graph. In this chapter we will refer to this logical ==MPI== process arrangement as the ~~“virtual topology.”~~ ==*virtual topology*.==

A clear distinction must be made between the ~~virtual process topology~~ ==*virtual topology*== and the topology of the underlying, physical hardware. The ~~virtual topology~~ ==*virtual topology*== can be exploited by the system in the assignment of processes to physical processors, if this helps to improve the communication performance on a given machine. How this mapping is done, however, is outside the scope of MPI. The description of the ~~virtual topology,~~ ==*virtual topology*,== on the other hand, depends only on the application, and is machine-independent. The functions that are described in this chapter deal with machine-independent mapping and communication on ~~virtual process topologies.~~ ==*virtual topologies*.==

> Though physical mapping is not discussed, the existence of the ~~virtual topology~~ ==*virtual topology*== information may be used as advice by the runtime system. There are well-known techniques for mapping grid/torus structures to hardware topologies such as hypercubes or grids. For more complicated graph structures good heuristics often yield nearly optimal results . On the other hand, if there is no way for the user to specify the logical process arrangement as a ~~“virtual topology,”~~ ==*virtual topology*,== a random mapping is most likely to result. On some machines, this will lead to unnecessary contention in the interconnection network. Some details about predicted and measured performance improvements that result from good process-to-processor mapping on ~~modern~~ wormhole-routing architectures can be found in . > > Besides possible performance benefits, the ~~virtual topology~~ ==*virtual topology*== can function as a convenient, process-naming structure, with significant benefits for program readability and notational power in message-passing programming.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#Introduction]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#Introduction]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Introduction]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Introduction]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Introduction]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Introduction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Introduction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Introduction]]

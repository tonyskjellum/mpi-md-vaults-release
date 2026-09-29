---
title: "Virtual Topologies"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Virtual Topologies

Chapter **topol** · in [[versions/v13/sections/topol#Virtual Topologies|MPI-1.3]], [[versions/v21/sections/topol#Virtual Topologies|MPI-2.1]], [[versions/v22/sections/topol#Virtual Topologies|MPI-2.2]], [[versions/v30/sections/topol#Virtual Topologies|MPI-3.0]], [[versions/v31/sections/topol#Virtual Topologies|MPI-3.1]], [[versions/v40/sections/topol#Virtual Topologies|MPI-4.0]], [[versions/v41/sections/topol#Virtual Topologies|MPI-4.1]], [[versions/v50/sections/topol#Virtual Topologies|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~The communication pattern of a set of processes can be represented by a graph. The nodes stand for the processes, and the edges connect processes that communicate with each other. MPI provides message-passing between any pair of processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined process graph does not prevent the corresponding processes from exchanging messages. It means rather that this connection is neglected in the virtual topology. This strategy implies that the topology gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping. Edges in the communication graph are not weighted, so that processes are either simply connected or not connected at all.~~

==The communication pattern of a set of processes can be represented by a graph. The nodes==

==represent processes,==

==and the edges connect processes that communicate with each other. MPI provides message-passing between any pair of processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined process graph does not prevent the corresponding processes from exchanging messages. It means rather that this connection is neglected in the virtual topology. This strategy implies that the topology gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping. Edges in the communication graph are not weighted, so that processes are either simply connected or not connected at all.==

> Experience with similar techniques in PARMACS ==> >== show that this information is usually sufficient for a good mapping. Additionally, a more precise specification is more difficult for the user to set up, and it would make the interface functions substantially more complicated.

Process coordinates in a ~~cartesian~~ ==Cartesian== structure begin their numbering at $`0`$. Row-major numbering is always used for the processes in a ~~cartesian~~ ==Cartesian== structure. This means that, for example, the relation between group rank and coordinates for four processes in a $`(2 \times 2)`$ grid is as follows.\

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~and the edges connect processes that communicate with each other. MPI provides message-passing between any pair of processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined process graph does not prevent the corresponding processes from exchanging messages. It means rather that this connection is neglected in the virtual topology. This strategy implies that the topology gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping. Edges in the communication graph are not weighted, so that processes are either simply connected or not connected at all.~~

~~> [!tip] Rationale~~

~~> Experience with similar techniques in PARMACS > > show that this information is usually sufficient for a good mapping. Additionally, a more precise specification is more difficult for the user to set up, and it would make the interface functions substantially more complicated.~~

==and the edges connect processes that communicate with each other. MPI provides message-passing between any pair of processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined process graph does not prevent the corresponding processes from exchanging messages. It means rather that this connection is neglected in the virtual topology. This strategy implies that the topology gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The communication pattern of a set of processes can be represented by a graph. The nodes~~

~~represent processes,~~

~~and the edges connect processes that communicate with each other. MPI provides message-passing between any pair of processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined process graph does not prevent the corresponding processes from exchanging messages. It means rather that this connection is neglected in the virtual topology. This strategy implies that the topology gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping.~~

~~Specifying the virtual topology in terms of a graph is sufficient for all applications. However, in many applications the graph structure is regular, and the detailed set-up of the graph would be inconvenient for the user and might be less efficient at run time. A large fraction of all parallel applications use process topologies like rings, two- or higher-dimensional grids, or tori. These structures are completely defined by the number of dimensions and the numbers of processes in each coordinate direction. Also, the mapping of grids and tori is generally an easier problem then that of general graphs. Thus, it is desirable to address these cases explicitly.~~

==The communication pattern of a set of processes can be represented by a graph. The nodes represent processes, and the edges connect processes that communicate with each other. MPI provides message-passing between any pair of processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined process graph does not prevent the corresponding processes from exchanging messages. It means rather that this connection is neglected in the virtual topology. This strategy implies that the topology gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping.==

==Specifying the virtual topology in terms of a graph is sufficient for all applications. However, in many applications the graph structure is regular, and the detailed set-up of the graph would be inconvenient for the user and might be less efficient at run time. A large fraction of all parallel applications use process topologies like rings, two- or higher-dimensional grids, or tori. These structures are completely defined by the number of dimensions and the numbers of processes in each coordinate direction. Also, the mapping of grids and tori is generally an easier problem than that of general graphs. Thus, it is desirable to address these cases explicitly.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

Process coordinates in a Cartesian structure begin their numbering at $`0`$. Row-major numbering is always used for the processes in a Cartesian structure. This means that, for example, the relation between group rank and coordinates for four processes in a $`(2 \times 2)`$ grid is as ~~follows.\~~ ==follows.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The communication pattern of a set of ==MPI== processes can be represented by a graph. The nodes represent ==MPI== processes, and the edges connect ==MPI== processes that communicate with each other. MPI provides message-passing between any pair of ==MPI== processes in a group. There is no requirement for opening a channel explicitly. Therefore, a “missing link” in the user-defined ~~process~~ graph ==of MPI processes== does not prevent the corresponding ==MPI== processes from exchanging messages. It means rather that this connection is neglected in the ~~virtual topology.~~ ==*virtual topology*.== This strategy implies that the ~~topology~~ ==*virtual topology*== gives no convenient way of naming this pathway of communication. Another possible consequence is that an automatic mapping tool (if one exists for the runtime environment) will not take account of this edge when mapping.

Specifying the ~~virtual topology~~ ==*virtual topology*== in terms of a graph is sufficient for all applications. However, in many applications the graph structure is regular, and the detailed set-up of the graph would be inconvenient for the user and might be less efficient at run time. A large fraction of all parallel applications use ==MPI== process topologies like rings, two- or higher-dimensional grids, or tori. These structures are completely defined by the number of dimensions and the numbers of ==MPI== processes in each coordinate direction. Also, the mapping of grids and tori is generally an easier problem than that of general graphs. Thus, it is desirable to address these cases explicitly.

~~Process~~ ==The== coordinates ==of MPI processes== in a Cartesian structure begin their numbering at $`0`$. Row-major numbering is always used for the ==MPI== processes in a Cartesian structure. This means that, for example, ~~the relation between group rank and coordinates~~ for four ==MPI== processes in a $`(2 \times 2)`$ ~~grid~~ ==grid, the relationship between their ranks in the group and their coordinates in the *virtual topology*== is as ~~follows.~~ ==follows:==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#Virtual Topologies]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#Virtual Topologies]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Virtual Topologies]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Virtual Topologies]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Virtual Topologies]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Virtual Topologies]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Virtual Topologies]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Virtual Topologies]]

---
title: "Neighborhood Gather"
chapter: topol
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Neighborhood Gather

Chapter **topol** · in [[versions/v30/sections/topol#Neighborhood Gather|MPI-3.0]], [[versions/v31/sections/topol#Neighborhood Gather|MPI-3.1]], [[versions/v40/sections/topol#Neighborhood Gather|MPI-4.0]], [[versions/v41/sections/topol#Neighborhood Gather|MPI-4.1]], [[versions/v50/sections/topol#Neighborhood Gather|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in ~~Section [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] on page~~ [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

==*Figure: Neighborhood gather communication example.*==

This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in ~~Section [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] on page~~ [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

The type signature associated with `sendcount, sendtype`, at process `j` must be equal to the type signature associated with ~~`recvcounts``[l],`~~ ==`recvcounts``[l]`,== `recvtype` at any other process with `srcs[l]==j`. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed. The data received from the `l`-th neighbor is placed into `recvbuf` beginning at offset `displs``[l]` elements (in terms of the `recvtype`).

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

~~MPI_Dist_graph_neighbors_count(comm,&indegree,&outdegree,&weighted);~~ ==MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);== int *srcs=(int*)malloc(indegree*sizeof(int)); int *dsts=(int*)malloc(outdegree*sizeof(int)); ~~MPI_Dist_graph_neighbors(comm,indegree,srcs,MPI_UNWEIGHTED, outdegree,dsts,MPI_UNWEIGHTED);~~ ==MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED, outdegree, dsts, MPI_UNWEIGHTED);== int ~~k,l;~~ ==k;==

/* assume sendbuf and recvbuf are of type (char*) */ for(k=0; k<outdegree; ++k) ~~MPI_Isend(sendbuf,sendcount,sendtype,dsts[k],...);~~ ==MPI_Isend(sendbuf, sendcount, sendtype,dsts[k],...);==

~~for(l=0; l<indegree; ++l) MPI_Irecv(recvbuf+l*recvcount*extent(recvtype),recvcount,recvtype, srcs[l],...);~~ ==for(k=0; k<indegree; ++k) MPI_Irecv(recvbuf+k*recvcount*extent(recvtype), recvcount, recvtype, srcs[k],...);==

*Figure: Neighborhood gather communication ~~example.*~~ ==example*==

The type signature associated with ~~`sendcount, sendtype`,~~ ==`sendcount`, `sendtype`,== at a process must be equal to the type signature associated with ~~`recvcount, recvtype`~~ ==`recvcount`, `recvtype`== at all other processes. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed.

==On a Cartesian virtual grid, the buffer usage in a given direction `d` with `dims[d]==3` and `1`, respectively during creation of the communicator is described in Figure [[versions/v40/sections/topol#Neighborhood Gather|Neighborhood Gather]] .==

==The figure may apply to any (or multiple) directions in the Cartesian topology. The grey buffers are required in all cases but are only accessed if during creation of the communicator, `periods[d]` was defined as non-zero (in C) or `.TRUE.` (in Fortran).==

==*Figure: Cartesian neighborhood allgather example for 3 and 1 processes in a dimension*==

~~MPI_Dist_graph_neighbors_count(comm,&indegree,&outdegree,&weighted);~~ ==MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);== int *srcs=(int*)malloc(indegree*sizeof(int)); int *dsts=(int*)malloc(outdegree*sizeof(int)); ~~MPI_Dist_graph_neighbors(comm,indegree,srcs,MPI_UNWEIGHTED, outdegree,dsts,MPI_UNWEIGHTED);~~ ==MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED, outdegree, dsts, MPI_UNWEIGHTED);== int ~~k,l;~~ ==k;==

/* assume sendbuf and recvbuf are of type (char*) */ for(k=0; k<outdegree; ++k) ~~MPI_Isend(sendbuf,sendcount,sendtype,dsts[k],...);~~ ==MPI_Isend(sendbuf, sendcount, sendtype, dsts[k],...);==

~~for(l=0; l<indegree; ++l) MPI_Irecv(recvbuf+displs[l]*extent(recvtype),recvcounts[l],recvtype, srcs[l],...);~~ ==for(k=0; k<indegree; ++k) MPI_Irecv(recvbuf+displs[k]*extent(recvtype), recvcounts[k], recvtype, srcs[k],...);==

The type signature associated with ~~`sendcount, sendtype`,~~ ==`sendcount`, `sendtype`,== at process ~~`j`~~ ==$`j`$== must be equal to the type signature associated with `recvcounts``[l]`, `recvtype` at any other process with ~~`srcs[l]==j`.~~ ==`srcs[l]==`$`j`$.== This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed. The data received from the `l`-th neighbor is placed into `recvbuf` beginning at offset `displs``[l]` elements (in terms of the `recvtype`).

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

In ~~this function,~~ ==the neighborhood gather operation,== each ==MPI== process $`i`$ gathers data items from each ==MPI== process $`j`$ if an edge $`(j,i)`$ exists in the topology graph, and each ==MPI== process $`i`$ sends the same data items to all ==MPI== processes $`j`$ where an edge $`(i,j)`$ exists. The send buffer is sent to each neighboring ==MPI== process and the $`l`$-th block in the receive buffer is received from the $`l`$-th neighbor.

~~This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:~~

~~    MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);     int *srcs=(int*)malloc(indegree*sizeof(int));     int *dsts=(int*)malloc(outdegree*sizeof(int));     MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,                              outdegree, dsts, MPI_UNWEIGHTED);     int k;~~

~~    /* assume sendbuf and recvbuf are of type (char*) */     for(k=0; k<outdegree; ++k)        MPI_Isend(sendbuf, sendcount, sendtype,dsts[k],...); ~~

~~    for(k=0; k<indegree; ++k)        MPI_Irecv(recvbuf+k*recvcount*extent(recvtype), recvcount, recvtype,                 srcs[k],...); ~~

~~    MPI_Waitall(...);~~

~~Figure [[versions/v41/sections/topol#Neighborhood Gather|Neighborhood Gather]] shows the neighborhood gather communication of one process with outgoing neighbors $`d_0... d_3`$ and incoming neighbors $`s_0... s_5`$. The process will send its `sendbuf` to all four `destinations` (outgoing neighbors) and it will receive the contribution from all six `sources` (incoming neighbors) into separate locations of its receive buffer.~~

==The [[versions/v41/API/MPI_NEIGHBOR_ALLGATHER|MPI_NEIGHBOR_ALLGATHER]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:==

==(code block added)==
``` [MPI]C
MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);
int *srcs=(int*)malloc(indegree*sizeof(int));
int *dsts=(int*)malloc(outdegree*sizeof(int));
MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,
                         outdegree, dsts, MPI_UNWEIGHTED);
int k;

/* assume sendbuf and recvbuf are of type (char*) */
for(k=0; k<outdegree; ++k) 
  MPI_Isend(sendbuf, sendcount, sendtype, dsts[k],...); 

for(k=0; k<indegree; ++k) 
  MPI_Irecv(recvbuf+k*recvcount*extent(recvtype), recvcount, recvtype,
            srcs[k],...); 

MPI_Waitall(...);
```

==Figure [[versions/v41/sections/topol#Neighborhood Gather|Neighborhood Gather]] shows the neighborhood gather communication of one MPI process with outgoing neighbors $`d_0... d_3`$ and incoming neighbors $`s_0... s_5`$. The MPI process will send its `sendbuf` to all four `destinations` (outgoing neighbors) and it will receive the contribution from all six `sources` (incoming neighbors) into separate locations of its receive buffer.==

All arguments are significant on all ==MPI== processes and the argument `comm` must have identical values on all ==MPI== processes.

The type signature associated with `sendcount`, ~~`sendtype`,~~ ==`sendtype`== at ~~a~~ ==an MPI== process must be equal to the type signature associated with `recvcount`, `recvtype` at all other ==MPI== processes. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating ==MPI== processes. Distinct type maps between sender and receiver are still allowed.

~~On a Cartesian virtual grid, the buffer usage in a given direction `d` with `dims[d]==3` and `1`, respectively during creation of the communicator is described in Figure [[versions/v41/sections/topol#Neighborhood Gather|Neighborhood Gather]] .~~

~~The figure may apply to any (or multiple) directions in the Cartesian topology. The grey buffers are required in all cases but are only accessed if during creation of the communicator, `periods[d]` was defined as non-zero (in C) or `.TRUE.` (in Fortran).~~

==Buffer usage of [[versions/v41/API/MPI_NEIGHBOR_ALLGATHER|MPI_NEIGHBOR_ALLGATHER]] in the case of a Cartesian virtual topology.==

==On a Cartesian virtual topology, the buffer usage in a given direction `d` with `dims[d]=3` and `1`, respectively during creation of the communicator is described in Figure [[versions/v41/sections/topol#Neighborhood Gather|Neighborhood Gather]] .==

==The figure may apply to any (or multiple) directions in the Cartesian topology. The grey buffers are required in all cases but are only accessed if during creation of the communicator, `periods[d]` was defined as nonzero (in C) or `.TRUE.` (in Fortran).==

~~This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:~~

~~    MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);     int *srcs=(int*)malloc(indegree*sizeof(int));     int *dsts=(int*)malloc(outdegree*sizeof(int));     MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,                              outdegree, dsts, MPI_UNWEIGHTED);     int k;~~

~~    /* assume sendbuf and recvbuf are of type (char*) */     for(k=0; k<outdegree; ++k)        MPI_Isend(sendbuf, sendcount, sendtype, dsts[k],...); ~~

~~    for(k=0; k<indegree; ++k)        MPI_Irecv(recvbuf+displs[k]*extent(recvtype), recvcounts[k], recvtype,                 srcs[k],...); ~~

~~    MPI_Waitall(...);~~

~~The type signature associated with `sendcount`, `sendtype`, at process $`j`$ must be equal to the type signature associated with `recvcounts``[l]`, `recvtype` at any other process with `srcs[l]==`$`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed. The data received from the `l`-th neighbor is placed into `recvbuf` beginning at offset `displs``[l]` elements (in terms of the `recvtype`).~~

==The [[versions/v41/API/MPI_NEIGHBOR_ALLGATHERV|MPI_NEIGHBOR_ALLGATHERV]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:==

==(code block added)==
``` [MPI]C
MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);
int *srcs=(int*)malloc(indegree*sizeof(int));
int *dsts=(int*)malloc(outdegree*sizeof(int));
MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,
                         outdegree, dsts, MPI_UNWEIGHTED);
int k;

/* assume sendbuf and recvbuf are of type (char*) */
for(k=0; k<outdegree; ++k) 
  MPI_Isend(sendbuf, sendcount, sendtype, dsts[k],...); 

for(k=0; k<indegree; ++k) 
  MPI_Irecv(recvbuf+displs[k]*extent(recvtype), recvcounts[k], recvtype,
            srcs[k],...); 

MPI_Waitall(...);
```

==The type signature associated with `sendcount`, `sendtype` at MPI process $`j`$ must be equal to the type signature associated with `recvcounts``[l]`, `recvtype` at any other MPI process with `srcs[l]=`$`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating MPI processes. Distinct type maps between sender and receiver are still allowed. The data received from the `l`-th neighbor is placed into `recvbuf` beginning at offset `displs``[l]` elements (in terms of the `recvtype`).==

All arguments are significant on all ==MPI== processes and the argument `comm` must have identical values on all ==MPI== processes.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Neighborhood Gather]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Neighborhood Gather]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Neighborhood Gather]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Neighborhood Gather]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Neighborhood Gather]]

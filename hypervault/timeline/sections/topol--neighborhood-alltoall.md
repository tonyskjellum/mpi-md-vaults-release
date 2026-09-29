---
title: "Neighborhood Alltoall"
chapter: topol
present_in: ["MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Neighborhood Alltoall

Chapter **topol** · in [[versions/v41/sections/topol#Neighborhood Alltoall|MPI-4.1]], [[versions/v50/sections/topol#Neighborhood Alltoall|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in ~~Section [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] on page~~ [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in ~~Section [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] on page~~ [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

The type signature associated with ~~`sendcounts``[k],`~~ ==`sendcounts``[k]`,== `sendtype` with `dsts[k]==j` at process `i` must be equal to the type signature associated with ~~`recvcounts``[l],`~~ ==`recvcounts``[l]`,== `recvtype` with `srcs[l]==i` at process `j`. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed. The data in the `sendbuf` beginning at offset `sdispls``[k]` elements (in terms of the `sendtype`) is sent to the `k`-th outgoing neighbor. The data received from the `l`-th incoming neighbor is placed into `recvbuf` beginning at offset `rdispls``[l]` elements (in terms of the `recvtype`).

This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in ~~Section [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] on page~~ [[versions/v31/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:

The type signature associated with ~~`sendcounts``[k],`~~ ==`sendcounts``[k]`,== `sendtypes``[k]` with `dsts[k]==j` at process `i` must be equal to the type signature associated with ~~`recvcounts``[l],`~~ ==`recvcounts``[l]`,== `recvtypes``[l]` with `srcs[l]==i` at process `j`. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed.

### MPI-3.1 → MPI-4.0  (7 changed paragraphs)

~~MPI_Dist_graph_neighbors_count(comm,&indegree,&outdegree,&weighted);~~ ==MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);== int *srcs=(int*)malloc(indegree*sizeof(int)); int *dsts=(int*)malloc(outdegree*sizeof(int)); ~~MPI_Dist_graph_neighbors(comm,indegree,srcs,MPI_UNWEIGHTED, outdegree,dsts,MPI_UNWEIGHTED);~~ ==MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED, outdegree, dsts, MPI_UNWEIGHTED);== int ~~k,l;~~ ==k;==

/* assume sendbuf and recvbuf are of type (char*) */ for(k=0; k<outdegree; ++k) ~~MPI_Isend(sendbuf+k*sendcount*extent(sendtype),sendcount,sendtype,~~ ==MPI_Isend(sendbuf+k*sendcount*extent(sendtype), sendcount, sendtype,== dsts[k],...);

~~for(l=0; l<indegree; ++l) MPI_Irecv(recvbuf+l*recvcount*extent(recvtype),recvcount,recvtype, srcs[l],...);~~ ==for(k=0; k<indegree; ++k) MPI_Irecv(recvbuf+k*recvcount*extent(recvtype), recvcount, recvtype, srcs[k],...);==

The type signature associated with ~~`sendcount, sendtype`,~~ ==`sendcount`, `sendtype`,== at a process must be equal to the type signature associated with ~~`recvcount, recvtype`~~ ==`recvcount`, `recvtype`== at any other process. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed.

==For a halo communication on a Cartesian grid, the buffer usage in a given direction `d` with `dims[d]==3` and `1`, respectively during creation of the communicator is described in Figure [[versions/v40/sections/topol#Neighbor Alltoall|Neighbor Alltoall]] .==

==The figure may apply to any (or multiple) directions in the Cartesian topology. The grey buffers are required in all cases but are only accessed if during creation of the communicator, `periods[d]` was defined as non-zero (in C) or `.TRUE.` (in Fortran).==

==If each array element of `sendbuf` and `recvbuf` are described by `sendcount`,`sendtype` and `recvbuf`,`recvtype`, then after [[versions/v40/API/MPI_NEIGHBOR_ALLTOALL|MPI_NEIGHBOR_ALLTOALL]] on a Cartesian communicator returned, the content of the `recvbuf` is as if the following code is executed:==

==\==

==` MPI_Cartdim_get(comm, &ndims);`\ `for( /*direction*/ d=0; d < ndims; d++) {`\ `MPI_Cart_shift(comm, /*direction*/ d, /*disp*/ 1, &rank_source, &rank_dest);`\ `MPI_Sendrecv(sendbuf[d*2`<u>`+0`</u>`],sendcount,sendtype,`<u>`rank_source`</u>`,/*sendtag*/d*2,  recvbuf[d*2`<u>`+1`</u>`],recvcount,recvtype,`<u>`rank_dest`</u>`, /*recvtag*/ d*2,  comm,&status);/*communication in direction of displacment -1*/`\ `MPI_Sendrecv(sendbuf[d*2`<u>`+1`</u>`],sendcount,sendtype,`<u>`rank_dest`</u>`, /*sendtag*/ d*2+1,  recvbuf[d*2`<u>`+0`</u>`],recvcount,recvtype,`<u>`rank_source`</u>`,/*recvtag*/d*2+1,  comm,&status);/*communication in direction of displacment +1*/`\ `} `==

==The first call to `MPI_Sendrecv` implements the solid arrows’ communication pattern in each diagram of Figure [[versions/v40/sections/topol#Neighbor Alltoall|Neighbor Alltoall]] , whereas the second call is for the dashed arrows’ pattern.==

==*Figure: Cartesian neighborhood alltoall example for 3 and 1 processes in a dimension*==

==> [!warning] Advice to implementors==

==> For a Cartesian topology, if the virtual grid in a direction `d` is periodic and `dims[d]` is equal to 1 or 2, then `rank_source` and `rank_dest` are identical, but still all `ndims` send and `ndims` receive operations use different buffers. If in this case, the two send and receive operations per direction or of all directions are internally parallelized, then the several send and receive operations for the same sender-receiver process pair shall be initiated in the same sequence on sender and receiver side or they shall be distinguished by different tags. The code above shows a valid sequence of operations and tags.==

~~MPI_Dist_graph_neighbors_count(comm,&indegree,&outdegree,&weighted);~~ ==MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);== int *srcs=(int*)malloc(indegree*sizeof(int)); int *dsts=(int*)malloc(outdegree*sizeof(int)); ~~MPI_Dist_graph_neighbors(comm,indegree,srcs,MPI_UNWEIGHTED, outdegree,dsts,MPI_UNWEIGHTED);~~ ==MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED, outdegree, dsts, MPI_UNWEIGHTED);== int ~~k,l;~~ ==k;==

/* assume sendbuf and recvbuf are of type (char*) */ for(k=0; k<outdegree; ++k) ~~MPI_Isend(sendbuf+sdispls[k]*extent(sendtype),sendcounts[k],sendtype,~~ ==MPI_Isend(sendbuf+sdispls[k]*extent(sendtype), sendcounts[k], sendtype,== dsts[k],...);

~~for(l=0; l<indegree; ++l) MPI_Irecv(recvbuf+rdispls[l]*extent(recvtype),recvcounts[l],recvtype, srcs[l],...);~~ ==for(k=0; k<indegree; ++k) MPI_Irecv(recvbuf+rdispls[k]*extent(recvtype), recvcounts[k], recvtype, srcs[k],...);==

The type signature associated with `sendcounts``[k]`, `sendtype` with ~~`dsts[k]==j`~~ ==`dsts[k]==`$`j`$== at process ~~`i`~~ ==$`i`$== must be equal to the type signature associated with `recvcounts``[l]`, `recvtype` with ~~`srcs[l]==i`~~ ==`srcs[l]==`$`i`$== at process ~~`j`.~~ ==$`j`$.== This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed. The data in the `sendbuf` beginning at offset `sdispls``[k]` elements (in terms of the `sendtype`) is sent to the `k`-th outgoing neighbor. The data received from the `l`-th incoming neighbor is placed into `recvbuf` beginning at offset `rdispls``[l]` elements (in terms of the `recvtype`).

~~MPI_Dist_graph_neighbors_count(comm,&indegree,&outdegree,&weighted);~~ ==MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);== int *srcs=(int*)malloc(indegree*sizeof(int)); int *dsts=(int*)malloc(outdegree*sizeof(int)); ~~MPI_Dist_graph_neighbors(comm,indegree,srcs,MPI_UNWEIGHTED, outdegree,dsts,MPI_UNWEIGHTED);~~ ==MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED, outdegree, dsts, MPI_UNWEIGHTED);== int ~~k,l;~~ ==k;==

/* assume sendbuf and recvbuf are of type (char*) */ for(k=0; k<outdegree; ++k) ~~MPI_Isend(sendbuf+sdispls[k],sendcounts[k], sendtypes[k],dsts[k],...);~~ ==MPI_Isend(sendbuf+sdispls[k], sendcounts[k], sendtypes[k], dsts[k],...);==

~~for(l=0; l<indegree; ++l) MPI_Irecv(recvbuf+rdispls[l],recvcounts[l], recvtypes[l],srcs[l],...);~~ ==for(k=0; k<indegree; ++k) MPI_Irecv(recvbuf+rdispls[k], recvcounts[k], recvtypes[k], srcs[k],...);==

The type signature associated with `sendcounts``[k]`, `sendtypes``[k]` with ~~`dsts[k]==j`~~ ==`dsts[k]==`$`j`$== at process ~~`i`~~ ==$`i`$== must be equal to the type signature associated with `recvcounts``[l]`, `recvtypes``[l]` with ~~`srcs[l]==i`~~ ==`srcs[l]==`$`i`$== at process ~~`j`.~~ ==$`j`$.== This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed.

### MPI-4.0 → MPI-4.1  (8 changed paragraphs)

In ~~this function,~~ ==the neighborhood alltoall operation,== each ==MPI== process $`i`$ receives data items from each ==MPI== process $`j`$ if an edge $`(j,i)`$ exists in the topology graph or Cartesian topology. Similarly, each ==MPI== process $`i`$ sends data items to all ==MPI== processes $`j`$ where an edge $`(i,j)`$ exists. This call is more general than [[versions/v41/API/MPI_NEIGHBOR_ALLGATHER|MPI_NEIGHBOR_ALLGATHER]] in that different data items can be sent to each neighbor. The $`k`$-th block in send buffer is sent to the $`k`$-th neighboring ==MPI== process and the $`l`$-th block in the receive buffer is received from the $`l`$-th neighbor.

~~This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:~~

~~    MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);     int *srcs=(int*)malloc(indegree*sizeof(int));     int *dsts=(int*)malloc(outdegree*sizeof(int));     MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,                              outdegree, dsts, MPI_UNWEIGHTED);     int k;~~

~~    /* assume sendbuf and recvbuf are of type (char*) */     for(k=0; k<outdegree; ++k)       MPI_Isend(sendbuf+k*sendcount*extent(sendtype), sendcount, sendtype,                 dsts[k],...); ~~

~~    for(k=0; k<indegree; ++k)       MPI_Irecv(recvbuf+k*recvcount*extent(recvtype), recvcount, recvtype,                 srcs[k],...);~~

~~    MPI_Waitall(...);~~

~~The type signature associated with `sendcount`, `sendtype`, at a process must be equal to the type signature associated with `recvcount`, `recvtype` at any other process. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed.~~

==The [[versions/v41/API/MPI_NEIGHBOR_ALLTOALL|MPI_NEIGHBOR_ALLTOALL]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:==

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
  MPI_Isend(sendbuf+k*sendcount*extent(sendtype), sendcount, sendtype,
            dsts[k],...); 

for(k=0; k<indegree; ++k)
  MPI_Irecv(recvbuf+k*recvcount*extent(recvtype), recvcount, recvtype,
            srcs[k],...);

MPI_Waitall(...);
```

==The type signature associated with `sendcount`, `sendtype` at an MPI process must be equal to the type signature associated with `recvcount`, `recvtype` at any other MPI process. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating MPI processes. Distinct type maps between sender and receiver are still allowed.==

All arguments are significant on all ==MPI== processes and the argument `comm` must have identical values on all ==MPI== processes.

~~For a halo communication on~~ ==Buffer usage of [[versions/v41/API/MPI_NEIGHBOR_ALLTOALL|MPI_NEIGHBOR_ALLTOALL]] in the case of== a Cartesian ~~grid, the buffer usage in a given direction `d` with `dims[d]==3` and `1`, respectively during creation of the communicator is described in Figure [[versions/v41/sections/topol#Neighbor Alltoall|Neighbor Alltoall]] .~~ ==virtual topology.==

~~The figure may apply to any (or multiple) directions~~ ==For a halo communication on a Cartesian grid, the buffer usage== in ~~the Cartesian topology. The grey buffers are required in all cases but are only accessed if~~ ==a given direction `d` with `dims[d]=3` and `1`, respectively== during creation of the ~~communicator, `periods[d]` was defined as non-zero (in C) or `.TRUE.` (in Fortran).~~ ==communicator is described in Figure [[versions/v41/sections/topol#Neighborhood Alltoall|Neighborhood Alltoall]] .==

~~If each array element of `sendbuf` and `recvbuf`~~ ==The figure may apply to any (or multiple) directions in the Cartesian topology. The grey buffers== are ~~described by `sendcount`,`sendtype` and `recvbuf`,`recvtype`, then after [[versions/v41/API/MPI_NEIGHBOR_ALLTOALL|MPI_NEIGHBOR_ALLTOALL]] on a Cartesian communicator returned, the content~~ ==required in all cases but are only accessed if during creation== of the ~~`recvbuf` is~~ ==communicator, `periods[d]` was defined== as ~~if the following code is executed:~~ ==nonzero (in C) or `.TRUE.` (in Fortran).==

~~\~~ ==If `sendbuf` and `recvbuf` are declared as `(`char \*) and contain a sequence of buffers each described by `sendcount`,`sendtype` and `recvbuf`,`recvtype`, then after [[versions/v41/API/MPI_NEIGHBOR_ALLTOALL|MPI_NEIGHBOR_ALLTOALL]] on a Cartesian communicator returned, the content of the `recvbuf` is as if the following code is executed:==

~~`~~ ==[language={[MPI]C},basicstyle=,escapeinside=`']== MPI_Cartdim_get(comm, ~~&ndims);`\ `for(~~ ==&ndims); MPI_Type_get_extent(sendtype, &send_lb, &send_extent); MPI_Type_get_extent(recvtype, &recv_lb, &recv_extent); for(== /*direction*/ d=0; d < ndims; d++) ~~{`\ `MPI_Cart_shift(comm,~~ =={ MPI_Cart_shift(comm,== /*direction*/ d, /*disp*/ 1, &rank_source, ~~&rank_dest);`\ `MPI_Sendrecv(sendbuf[d*2`<u>`+0`</u>`],sendcount,sendtype,`<u>`rank_source`</u>`,/*sendtag*/d*2, recvbuf[d*2`<u>`+1`</u>`],recvcount,recvtype,`<u>`rank_dest`</u>`,~~ ==&rank_dest); MPI_Sendrecv(sendbuf+(d*2`\underline{+0}')*sendcount*send_extent, sendcount,sendtype,`\underline{rank_source}',/*sendtag*/d*2, recvbuf+(d*2`\underline{+1}')*recvcount*recv_extent, recvcount,recvtype,`\underline{rank_dest}',== /*recvtag*/ d*2, comm,&status);/*communication in direction of displacment ~~-1*/`\ `MPI_Sendrecv(sendbuf[d*2`<u>`+1`</u>`],sendcount,sendtype,`<u>`rank_dest`</u>`,~~ ==-1*/ MPI_Sendrecv(sendbuf+(d*2`\underline{+1}')*sendcount*send_extent, sendcount,sendtype,`\underline{rank_dest}',== /*sendtag*/ d*2+1, ~~recvbuf[d*2`<u>`+0`</u>`],recvcount,recvtype,`<u>`rank_source`</u>`,/*recvtag*/d*2+1,~~ ==recvbuf+(d*2`\underline{+0}')*recvcount*recv_extent, recvcount,recvtype,`\underline{rank_source}',/*recvtag*/d*2+1,== comm,&status);/*communication in direction of displacment ~~+1*/`\ `} `~~ ==+1*/ }==

The first call to `MPI_Sendrecv` implements the solid arrows’ communication pattern in each diagram of Figure ~~[[versions/v41/sections/topol#Neighbor Alltoall|Neighbor~~ ==[[topol#Neighborhood Alltoall|Neighborhood== Alltoall]] , whereas the second call is for the dashed arrows’ pattern.

*Figure: Cartesian neighborhood alltoall example for 3 and 1 ==MPI== processes in a dimension*

> For a Cartesian topology, if the ~~virtual~~ grid in a direction `d` is periodic and `dims[d]` is equal to 1 or 2, then `rank_source` and `rank_dest` are identical, but still all `ndims` send and `ndims` receive operations use different buffers. If in this case, the two send and receive operations per direction or of all directions are internally parallelized, then the several send and receive operations for the same sender-receiver ==MPI== process pair shall be initiated in the same sequence on sender and receiver side or they shall be distinguished by different tags. The code above shows a valid sequence of operations and tags.

~~This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:~~

~~    MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);     int *srcs=(int*)malloc(indegree*sizeof(int));     int *dsts=(int*)malloc(outdegree*sizeof(int));     MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,                              outdegree, dsts, MPI_UNWEIGHTED);     int k;~~

~~    /* assume sendbuf and recvbuf are of type (char*) */     for(k=0; k<outdegree; ++k)        MPI_Isend(sendbuf+sdispls[k]*extent(sendtype), sendcounts[k], sendtype,                 dsts[k],...); ~~

~~    for(k=0; k<indegree; ++k)       MPI_Irecv(recvbuf+rdispls[k]*extent(recvtype), recvcounts[k], recvtype,                 srcs[k],...);~~

~~    MPI_Waitall(...);~~

~~The type signature associated with `sendcounts``[k]`, `sendtype` with `dsts[k]==`$`j`$ at process $`i`$ must be equal to the type signature associated with `recvcounts``[l]`, `recvtype` with `srcs[l]==`$`i`$ at process $`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed. The data in the `sendbuf` beginning at offset `sdispls``[k]` elements (in terms of the `sendtype`) is sent to the `k`-th outgoing neighbor. The data received from the `l`-th incoming neighbor is placed into `recvbuf` beginning at offset `rdispls``[l]` elements (in terms of the `recvtype`).~~

==The [[versions/v41/API/MPI_NEIGHBOR_ALLTOALLV|MPI_NEIGHBOR_ALLTOALLV]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:==

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
  MPI_Isend(sendbuf+sdispls[k]*extent(sendtype), sendcounts[k],
            sendtype, dsts[k],...);

for(k=0; k<indegree; ++k)
  MPI_Irecv(recvbuf+rdispls[k]*extent(recvtype), recvcounts[k],
            recvtype, srcs[k],...);

MPI_Waitall(...);
```

==The type signature associated with `sendcounts``[k]`, `sendtype` with `dsts[k]=`$`j`$ at MPI process $`i`$ must be equal to the type signature associated with `recvcounts``[l]`, `recvtype` with `srcs[l]=`$`i`$ at MPI process $`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating MPI processes. Distinct type maps between sender and receiver are still allowed. The data in the `sendbuf` beginning at offset `sdispls``[k]` elements (in terms of the `sendtype`) is sent to the `k`-th outgoing neighbor. The data received from the `l`-th incoming neighbor is placed into `recvbuf` beginning at offset `rdispls``[l]` elements (in terms of the `recvtype`).==

All arguments are significant on all ==MPI== processes and the argument `comm` must have identical values on all ==MPI== processes.

~~This function supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:~~

~~    MPI_Dist_graph_neighbors_count(comm, &indegree, &outdegree, &weighted);     int *srcs=(int*)malloc(indegree*sizeof(int));     int *dsts=(int*)malloc(outdegree*sizeof(int));     MPI_Dist_graph_neighbors(comm, indegree, srcs, MPI_UNWEIGHTED,                              outdegree, dsts, MPI_UNWEIGHTED);     int k;~~

~~    /* assume sendbuf and recvbuf are of type (char*) */     for(k=0; k<outdegree; ++k)        MPI_Isend(sendbuf+sdispls[k], sendcounts[k], sendtypes[k], dsts[k],...);~~

~~    for(k=0; k<indegree; ++k)       MPI_Irecv(recvbuf+rdispls[k], recvcounts[k], recvtypes[k], srcs[k],...);~~

~~    MPI_Waitall(...);~~

~~The type signature associated with `sendcounts``[k]`, `sendtypes``[k]` with `dsts[k]==`$`j`$ at process $`i`$ must be equal to the type signature associated with `recvcounts``[l]`, `recvtypes``[l]` with `srcs[l]==`$`i`$ at process $`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating processes. Distinct type maps between sender and receiver are still allowed.~~

==The [[versions/v41/API/MPI_NEIGHBOR_ALLTOALLW|MPI_NEIGHBOR_ALLTOALLW]] procedure supports Cartesian communicators, graph communicators, and distributed graph communicators as described in [[versions/v41/sections/topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] . If `comm` is a distributed graph communicator, the outcome is as if each MPI process executed sends to each of its outgoing neighbors and receives from each of its incoming neighbors:==

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
  MPI_Isend(sendbuf+sdispls[k], sendcounts[k], sendtypes[k],
            dsts[k],...);

for(k=0; k<indegree; ++k)
  MPI_Irecv(recvbuf+rdispls[k], recvcounts[k], recvtypes[k],
            srcs[k],...);

MPI_Waitall(...);
```

==The type signature associated with `sendcounts``[k]`, `sendtypes``[k]` with `dsts[k]=`$`j`$ at MPI process $`i`$ must be equal to the type signature associated with `recvcounts``[l]`, `recvtypes``[l]` with `srcs[l]=`$`i`$ at MPI process $`j`$. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of communicating MPI processes. Distinct type maps between sender and receiver are still allowed.==

All arguments are significant on all ==MPI== processes and the argument `comm` must have identical values on all ==MPI== processes.

## Text by release

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Neighborhood Alltoall]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Neighborhood Alltoall]]

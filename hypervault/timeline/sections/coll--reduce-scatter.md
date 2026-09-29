---
title: "Reduce-Scatter"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Reduce-Scatter

Chapter **coll** · in [[versions/v13/sections/coll#Reduce-Scatter|MPI-1.3]], [[versions/v21/sections/coll#Reduce-Scatter|MPI-2.1]], [[versions/v22/sections/coll#Reduce-Scatter|MPI-2.2]], [[versions/v30/sections/coll#Reduce-Scatter|MPI-3.0]], [[versions/v31/sections/coll#Reduce-Scatter|MPI-3.1]], [[versions/v40/sections/coll#Reduce-Scatter|MPI-4.0]], [[versions/v41/sections/coll#Reduce-Scatter|MPI-4.1]], [[versions/v50/sections/coll#Reduce-Scatter|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~MPI includes variants of each of the reduce operations where the result is scattered to all processes in the group on return.~~

==MPI includes==

==a variant==

==of the reduce operations where the result is scattered to all processes in==

==a==

==group on return.==

~~`MPI_REDUCE_SCATTER` first does an element-wise reduction on vector of $`count =  \sum_{i} recvcounts[i]`$ elements in the send buffer defined by `sendbuf, count` and `datatype`. Next, the resulting vector of results is split into `n` disjoint segments, where `n` is the number of members in the group. Segment `i` contains `recvcounts[i]` elements. The `i`th segment is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.~~

==If `comm` is an intracommunicator,==

==`MPI_REDUCE_SCATTER` first does an element-wise reduction on vector of==

==$`count = \sum_{i} recvcounts[i]`$==

==elements in the send buffer defined by `sendbuf, count` and `datatype`. Next, the resulting vector of results is split into `n` disjoint segments, where `n` is the number of members in the group. Segment `i` contains `recvcounts[i]` elements. The==

==`i`-th==

==segment is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.==

~~> The [[versions/v21/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] routine is functionally equivalent to: A `MPI_REDUCE` operation function with `count` equal to the sum of `recvcounts[i]` followed by `MPI_SCATTERV` with `sendcounts` equal to `recvcounts`. However, a direct implementation may run faster.~~

==> The [[versions/v21/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] routine is functionally equivalent to: > > an > > `MPI_REDUCE` > > collective > > operation > > with `count` equal to the sum of `recvcounts[i]` followed by `MPI_SCATTERV` with `sendcounts` equal to `recvcounts`. However, a direct implementation may run faster.==

==The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the top of the receive==

==buffer.==

==If `comm` is an intercommunicator, then the result of the reduction of the data provided by processes in group A is scattered among processes in group B, and vice versa. Within each group, all processes provide the same `recvcounts` argument, and the sum of the `recvcounts` entries should be the same for the two groups.==

==> [!tip] Rationale==

==> The last restriction is needed so that the length of the send buffer can be determined by the sum of the local `recvcounts` entries. Otherwise, a communication is needed to figure out how many elements are reduced.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~MPI includes~~

~~a variant~~

~~of the reduce operations where the result is scattered to all processes in~~

~~a~~

~~group on return.~~

~~![[versions/v22/API/MPI_REDUCE_SCATTER]]~~

~~If `comm` is an intracommunicator,~~

~~`MPI_REDUCE_SCATTER` first does an element-wise reduction on vector of~~

~~$`count = \sum_{i} recvcounts[i]`$~~

~~elements in the send buffer defined by `sendbuf, count` and `datatype`. Next, the resulting vector of results is split into `n` disjoint segments, where `n` is the number of members in the group. Segment `i` contains `recvcounts[i]` elements. The~~

~~`i`-th~~

~~segment is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.~~

~~> [!warning] Advice to implementors~~

~~> The [[versions/v22/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] routine is functionally equivalent to: > > an > > `MPI_REDUCE` > > collective > > operation > > with `count` equal to the sum of `recvcounts[i]` followed by `MPI_SCATTERV` with `sendcounts` equal to `recvcounts`. However, a direct implementation may run faster.~~

~~The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the top of the receive~~

~~buffer.~~

~~If `comm` is an intercommunicator, then the result of the reduction of the data provided by processes in group A is scattered among processes in group B, and vice versa. Within each group, all processes provide the same `recvcounts` argument, and the sum of the `recvcounts` entries should be the same for the two groups.~~

~~> [!tip] Rationale~~

~~> The last restriction is needed so that the length of the send buffer can be determined by the sum of the local `recvcounts` entries. Otherwise, a communication is needed to figure out how many elements are reduced.~~

==MPI includes variants of the reduce operations where the result is scattered to all processes in a group on return. One variant scatters equal-sized blocks to all processes, while another variant scatters blocks that may vary in size for each process.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

MPI includes variants of the reduce operations where the result is scattered to all ==MPI== processes in a group on return. One variant scatters equal-sized blocks to all ==MPI== processes, while another variant scatters blocks that may vary in size for each ==MPI== process.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Reduce-Scatter]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Reduce-Scatter]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Reduce-Scatter]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Reduce-Scatter]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Reduce-Scatter]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Reduce-Scatter]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Reduce-Scatter]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Reduce-Scatter]]

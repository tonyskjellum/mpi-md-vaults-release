---
title: "MPI_REDUCE_SCATTER"
chapter: coll
present_in: ["MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# MPI_REDUCE_SCATTER

Chapter **coll** · in [[versions/v22/sections/coll#MPI_REDUCE_SCATTER|MPI-2.2]], [[versions/v30/sections/coll#MPI_REDUCE_SCATTER|MPI-3.0]], [[versions/v31/sections/coll#MPI_REDUCE_SCATTER|MPI-3.1]], [[versions/v40/sections/coll#MPI_REDUCE_SCATTER|MPI-4.0]], [[versions/v41/sections/coll#MPI_REDUCE_SCATTER|MPI-4.1]], [[versions/v50/sections/coll#MPI_REDUCE_SCATTER|MPI-5.0]]

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

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

~~MPI includes~~

~~a variant~~

~~of the reduce operations where the result is scattered to all processes in~~

~~a~~

~~group on return.~~

==[[versions/v22/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] extends the functionality of [[versions/v22/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] such that the scattered blocks can vary in size. Block sizes are determined by the `recvcounts` array, such that the `i`-th block contains `recvcounts[i]` elements.==

~~`MPI_REDUCE_SCATTER` first does an element-wise reduction on vector of~~

~~$`count = \sum_{i} recvcounts[i]`$~~

~~elements in the send buffer defined by `sendbuf, count` and `datatype`. Next, the resulting vector of results is split into `n` disjoint segments, where `n` is the number of members in the group. Segment `i` contains `recvcounts[i]` elements. The~~

~~`i`-th~~

~~segment is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.~~

==`MPI_REDUCE_SCATTER` first==

==performs a global, element-wise reduction on vectors of $`count = \sum_{i=0}^{n-1} recvcounts[i]`$ elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcounts`, `datatype`, `op` and `comm`. The resulting vector is treated as n consecutive blocks where the number of elements of the `i`-th block is `recvcounts[i]`. The blocks are scattered to the processes of the group. The `i`-th block==

==is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.==

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the ~~top of the~~ receive

buffer. ==It is not required to specify the “in place” option on all processes, since the processes for which `recvcounts[i]`<span class="sans-serif">==0</span> may not have allocated a receive buffer.==

If `comm` is an intercommunicator, then the result of the reduction of the data provided by processes in ==one== group ~~A~~ ==(group A)== is scattered among processes in ==the other== group ~~B,~~ ==(group B),== and vice versa. Within each group, all processes provide the same `recvcounts` argument, and ==provide input vectors of $`count = \sum_{i=0}^{n-1} recvcounts[i]`$ elements stored in== the ~~sum~~ ==send buffers, where `n` is the size== of the ~~`recvcounts` entries should~~ ==group. The resulting vector from the other group is scattered in blocks of `recvcounts[i]` elements among the processes in the group. The number of elements <span class="sans-serif">count</span> must== be the same for the two groups.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~If `comm` is an intracommunicator,~~

~~`MPI_REDUCE_SCATTER` first~~

~~performs a global, element-wise reduction on vectors of $`count = \sum_{i=0}^{n-1} recvcounts[i]`$ elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcounts`, `datatype`, `op` and `comm`. The resulting vector is treated as n consecutive blocks where the number of elements of the `i`-th block is `recvcounts[i]`. The blocks are scattered to the processes of the group. The `i`-th block~~

~~is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.~~

==If `comm` is an intracommunicator, `MPI_REDUCE_SCATTER` first performs a global, element-wise reduction on vectors of $`count = \sum_{i=0}^{n-1} recvcounts[i]`$ elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcounts`, `datatype`, `op` and `comm`. The resulting vector is treated as n consecutive blocks where the number of elements of the `i`-th block is `recvcounts[i]`. The blocks are scattered to the processes of the group. The `i`-th block is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.==

~~> The [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] routine is functionally equivalent to: > > an > > `MPI_REDUCE` > > collective > > operation > > with `count` equal to the sum of `recvcounts[i]` followed by `MPI_SCATTERV` with `sendcounts` equal to `recvcounts`. However, a direct implementation may run faster.~~

~~The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive~~

~~buffer. It is not required to specify the “in place” option on all processes, since the processes for which `recvcounts[i]`<span class="sans-serif">==0</span> may not have allocated a receive buffer.~~

==> The [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] routine is functionally equivalent to: > > an `MPI_REDUCE` collective operation > > with `count` equal to the sum of `recvcounts[i]` followed by `MPI_SCATTERV` with `sendcounts` equal to `recvcounts`. However, a direct implementation may run faster.==

==The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer. It is not required to specify the “in place” option on all processes, since the processes for which `recvcounts[i]`<span class="sans-serif">==0</span> may not have allocated a receive buffer.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

If `comm` is an intracommunicator, ~~`MPI_REDUCE_SCATTER`~~ ==[[versions/v31/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]]== first performs a global, element-wise reduction on vectors of ~~$`count~~ ==$`\texttt{count}== = \sum_{i=0}^{n-1} ~~recvcounts[i]`$~~ ==\texttt{recvcounts[i]}`$== elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcounts`, `datatype`, `op` and `comm`. The resulting vector is treated as n consecutive blocks where the number of elements of the `i`-th block is `recvcounts[i]`. The blocks are scattered to the processes of the group. The `i`-th block is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.

> The [[versions/v31/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] routine is functionally equivalent to: ~~> >~~ an ~~`MPI_REDUCE`~~ ==[[versions/v31/API/MPI_REDUCE|MPI_REDUCE]]== collective operation ~~> >~~ with `count` equal to the sum of `recvcounts[i]` followed by ~~`MPI_SCATTERV`~~ ==[[versions/v31/API/MPI_SCATTERV|MPI_SCATTERV]]== with `sendcounts` equal to `recvcounts`. However, a direct implementation may run faster.

The “in place” option for intracommunicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer. It is not required to specify the “in place” option on all processes, since the processes for which ~~`recvcounts[i]`<span class="sans-serif">==0</span>~~ ==`recvcounts[i]``==0`== may not have allocated a receive buffer.

If `comm` is an intercommunicator, then the result of the reduction of the data provided by processes in one group (group A) is scattered among processes in the other group (group B), and vice versa. Within each group, all processes provide the same `recvcounts` argument, and provide input vectors of ~~$`count~~ ==$`\texttt{count}== = \sum_{i=0}^{n-1} ~~recvcounts[i]`$~~ ==\texttt{recvcounts[i]}`$== elements stored in the send buffers, where `n` is the size of the group. The resulting vector from the other group is scattered in blocks of `recvcounts[i]` elements among the processes in the group. The number of elements ~~<span class="sans-serif">count</span>~~ ==`count`== must be the same for the two groups.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

If `comm` is an ~~intracommunicator,~~ ==intra-communicator,== [[versions/v40/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] first performs a global, element-wise reduction on vectors of $`\texttt{count} = \sum_{i=0}^{n-1} \texttt{recvcounts[i]}`$ elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcounts`, `datatype`, `op` and `comm`. The resulting vector is treated as n consecutive blocks where the number of elements of the `i`-th block is `recvcounts[i]`. The blocks are scattered to the processes of the group. The `i`-th block is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.

The “in place” option for ~~intracommunicators~~ ==intra-communicators== is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer. It is not required to specify the “in place” option on all processes, since the processes for which `recvcounts[i]``==0` may not have allocated a receive buffer.

If `comm` is an ~~intercommunicator,~~ ==inter-communicator,== then the result of the reduction of the data provided by processes in one group (group A) is scattered among processes in the other group (group B), and vice versa. Within each group, all processes provide the same `recvcounts` argument, and provide input vectors of $`\texttt{count} = \sum_{i=0}^{n-1} \texttt{recvcounts[i]}`$ elements stored in the send buffers, where `n` is the size of the group. The resulting vector from the other group is scattered in blocks of `recvcounts[i]` elements among the processes in the group. The number of elements `count` must be the same for the two groups.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

If `comm` is an intra-communicator, [[versions/v41/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] first performs a global, element-wise reduction on vectors of $`\texttt{count} = \sum_{i=0}^{n-1} \texttt{recvcounts[i]}`$ elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of ==MPI== processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcounts`, `datatype`, `op` and `comm`. The resulting vector is treated as ~~n~~ ==`n`== consecutive blocks where the number of elements of the `i`-th block is `recvcounts[i]`. The blocks are scattered to the ==MPI== processes of the group. The `i`-th block is sent to ==MPI== process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.

> The [[versions/v41/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] routine is functionally equivalent ~~to:~~ ==to== an [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] collective operation with `count` equal to the sum of `recvcounts[i]` followed by [[versions/v41/API/MPI_SCATTERV|MPI_SCATTERV]] with `sendcounts` equal to `recvcounts`. However, a direct implementation may run faster.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer. It is not required to specify the “in place” option on all ==MPI== processes, since the ==MPI== processes for which ~~`recvcounts[i]``==0`~~ ==`recvcounts[i]``=0`== may not have allocated a receive buffer.

If `comm` is an inter-communicator, then the result of the reduction of the data provided by ==MPI== processes in one group (group A) is scattered among ==MPI== processes in the other group (group B), and vice versa. Within each group, all ==MPI== processes provide the same `recvcounts` argument, and provide input vectors of $`\texttt{count} = \sum_{i=0}^{n-1} \texttt{recvcounts[i]}`$ elements stored in the send buffers, where `n` is the size of the group. The resulting vector from the other group is scattered in blocks of `recvcounts[i]` elements among the ==MPI== processes in the group. The number of elements `count` must be the same for the two groups.

> The last restriction is needed so that the length of the send buffer can be determined by the sum of the local `recvcounts` entries. Otherwise, ~~a~~ communication is needed to figure out how many elements are reduced.

## Text by release

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#MPI_REDUCE_SCATTER]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#MPI_REDUCE_SCATTER]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#MPI_REDUCE_SCATTER]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#MPI_REDUCE_SCATTER]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#MPI_REDUCE_SCATTER]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#MPI_REDUCE_SCATTER]]

---
title: "Applying Collective Operations to Intercommunicators"
chapter: coll
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/coll]
---

# Applying Collective Operations to Intercommunicators

Chapter **coll** · in [[versions/v21/sections/coll#Applying Collective Operations to Intercommunicators|MPI-2.1]], [[versions/v22/sections/coll#Applying Collective Operations to Intercommunicators|MPI-2.2]], [[versions/v30/sections/coll#Applying Collective Operations to Intercommunicators|MPI-3.0]], [[versions/v31/sections/coll#Applying Collective Operations to Intercommunicators|MPI-3.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

==- [[versions/v22/API/MPI_BARRIER|MPI_BARRIER]]==

~~- [[versions/v22/API/MPI_BARRIER|MPI_BARRIER]]~~

~~The [[versions/v22/API/MPI_BARRIER|MPI_BARRIER]] operation does not fit into this classification since no data is being moved (other than the implicit fact that a barrier has been called). The data movement patterns of [[versions/v22/API/MPI_SCAN|MPI_SCAN]]~~

==The data movement patterns of [[versions/v22/API/MPI_SCAN|MPI_SCAN]]==

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~- [[versions/v30/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v30/API/MPI_ALLGATHERV|MPI_ALLGATHERV]]~~

~~- [[versions/v30/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v30/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] ,~~

~~  [[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]]~~

~~- [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]]~~

~~- [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]]~~

==- [[versions/v30/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v30/API/MPI_IALLGATHER|MPI_IALLGATHER]] , [[versions/v30/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] , [[versions/v30/API/MPI_IALLGATHERV|MPI_IALLGATHERV]]==

==- [[versions/v30/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v30/API/MPI_IALLTOALL|MPI_IALLTOALL]] , [[versions/v30/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , [[versions/v30/API/MPI_IALLTOALLV|MPI_IALLTOALLV]] , [[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] , [[versions/v30/API/MPI_IALLTOALLW|MPI_IALLTOALLW]]==

==- [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v30/API/MPI_IALLREDUCE|MPI_IALLREDUCE]] , [[versions/v30/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v30/API/MPI_IREDUCE_SCATTER_BLOCK|MPI_IREDUCE_SCATTER_BLOCK]] , [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v30/API/MPI_IREDUCE_SCATTER|MPI_IREDUCE_SCATTER]]==

==- [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] , [[versions/v30/API/MPI_IBARRIER|MPI_IBARRIER]]==

- [[versions/v30/API/MPI_GATHER|MPI_GATHER]] , ==[[versions/v30/API/MPI_IGATHER|MPI_IGATHER]] ,== [[versions/v30/API/MPI_GATHERV|MPI_GATHERV]] ==, [[versions/v30/API/MPI_IGATHERV|MPI_IGATHERV]]==

- [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] ==, [[versions/v30/API/MPI_IREDUCE|MPI_IREDUCE]]==

- [[versions/v30/API/MPI_BCAST|MPI_BCAST]] ==, [[versions/v30/API/MPI_IBCAST|MPI_IBCAST]]==

- [[versions/v30/API/MPI_SCATTER|MPI_SCATTER]] , ==[[versions/v30/API/MPI_ISCATTER|MPI_ISCATTER]] ,== [[versions/v30/API/MPI_SCATTERV|MPI_SCATTERV]] ==, [[versions/v30/API/MPI_ISCATTERV|MPI_ISCATTERV]]==

~~- [[versions/v30/API/MPI_SCAN|MPI_SCAN]] , [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]]~~

~~The data movement patterns of [[versions/v30/API/MPI_SCAN|MPI_SCAN]]~~

~~and [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]]~~

~~do not fit this taxonomy.~~

==- [[versions/v30/API/MPI_SCAN|MPI_SCAN]] , [[versions/v30/API/MPI_ISCAN|MPI_ISCAN]] , [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]] , [[versions/v30/API/MPI_IEXSCAN|MPI_IEXSCAN]]==

==The data movement patterns of [[versions/v30/API/MPI_SCAN|MPI_SCAN]] , [[versions/v30/API/MPI_ISCAN|MPI_ISCAN]] , [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]] , and [[versions/v30/API/MPI_IEXSCAN|MPI_IEXSCAN]] do not fit this taxonomy.==

~~- [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] ,~~

~~- [[versions/v30/API/MPI_BCAST|MPI_BCAST]] ,~~

~~- [[versions/v30/API/MPI_GATHER|MPI_GATHER]] , [[versions/v30/API/MPI_GATHERV|MPI_GATHERV]] ,~~

~~- [[versions/v30/API/MPI_SCATTER|MPI_SCATTER]] , [[versions/v30/API/MPI_SCATTERV|MPI_SCATTERV]] ,~~

~~- [[versions/v30/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v30/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] ,~~

~~- [[versions/v30/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v30/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , [[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] ,~~

~~- [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] ,~~

~~- [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] .~~

~~In C++, the bindings for these functions are in the `MPI::Comm` class.~~

~~However,~~

~~since the collective operations do not make sense on a C++ `MPI::Comm`~~

~~(as~~

~~it is neither an intercommunicator nor an intracommunicator), the functions are all pure virtual.~~

==- [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] , [[versions/v30/API/MPI_IBARRIER|MPI_IBARRIER]]==

==- [[versions/v30/API/MPI_BCAST|MPI_BCAST]] , [[versions/v30/API/MPI_IBCAST|MPI_IBCAST]]==

==- [[versions/v30/API/MPI_GATHER|MPI_GATHER]] , [[versions/v30/API/MPI_IGATHER|MPI_IGATHER]] , [[versions/v30/API/MPI_GATHERV|MPI_GATHERV]] , [[versions/v30/API/MPI_IGATHERV|MPI_IGATHERV]] ,==

==- [[versions/v30/API/MPI_SCATTER|MPI_SCATTER]] , [[versions/v30/API/MPI_ISCATTER|MPI_ISCATTER]] , [[versions/v30/API/MPI_SCATTERV|MPI_SCATTERV]] , [[versions/v30/API/MPI_ISCATTERV|MPI_ISCATTERV]] ,==

==- [[versions/v30/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v30/API/MPI_IALLGATHER|MPI_IALLGATHER]] , [[versions/v30/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] , [[versions/v30/API/MPI_IALLGATHERV|MPI_IALLGATHERV]] ,==

==- [[versions/v30/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v30/API/MPI_IALLTOALL|MPI_IALLTOALL]] , [[versions/v30/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , [[versions/v30/API/MPI_IALLTOALLV|MPI_IALLTOALLV]] , [[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] , [[versions/v30/API/MPI_IALLTOALLW|MPI_IALLTOALLW]] ,==

==- [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v30/API/MPI_IALLREDUCE|MPI_IALLREDUCE]] , [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v30/API/MPI_IREDUCE|MPI_IREDUCE]] ,==

==- [[versions/v30/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v30/API/MPI_IREDUCE_SCATTER_BLOCK|MPI_IREDUCE_SCATTER_BLOCK]] , [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v30/API/MPI_IREDUCE_SCATTER|MPI_IREDUCE_SCATTER]] .==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~To understand how collective operations apply to intercommunicators, we can view most MPI intracommunicator~~

~~collective operations as fitting one of the following categories (see, for instance, ):~~

==To understand how collective operations apply to intercommunicators, we can view most MPI intracommunicator collective operations as fitting one of the following categories (see, for instance, ):==

~~The application of collective communication to intercommunicators is best described in terms of two groups.~~

~~For example, an all-to-all [[versions/v31/API/MPI_ALLGATHER|MPI_ALLGATHER]] operation can be described as collecting data from all members of one group with the result appearing in all members of the other group (see Figure [[versions/v31/sections/coll#Applying Collective Operations to Intercommunicators|Applying Collective Operations to Intercommunicators]] ). As another example, a one-to-all [[versions/v31/API/MPI_BCAST|MPI_BCAST]] operation sends data from one member of one group to all members of the other group. Collective computation operations such as [[versions/v31/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] have a similar interpretation (see Figure [[versions/v31/sections/coll#Applying Collective Operations to Intercommunicators|Applying Collective Operations to Intercommunicators]] ).~~

~~For intracommunicators, these two groups are the same. For intercommunicators, these two groups are distinct. For the all-to-all operations, each such operation is described in two phases, so that it has a symmetric, full-duplex behavior.~~

==The application of collective communication to intercommunicators is best described in terms of two groups. For example, an all-to-all [[versions/v31/API/MPI_ALLGATHER|MPI_ALLGATHER]] operation can be described as collecting data from all members of one group with the result appearing in all members of the other group (see Figure [[versions/v31/sections/coll#Applying Collective Operations to Intercommunicators|Applying Collective Operations to Intercommunicators]] ). As another example, a one-to-all [[versions/v31/API/MPI_BCAST|MPI_BCAST]] operation sends data from one member of one group to all members of the other group. Collective computation operations such as [[versions/v31/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] have a similar interpretation (see Figure [[versions/v31/sections/coll#Applying Collective Operations to Intercommunicators|Applying Collective Operations to Intercommunicators]] ). For intracommunicators, these two groups are the same. For intercommunicators, these two groups are distinct. For the all-to-all operations, each such operation is described in two phases, so that it has a symmetric, full-duplex behavior.==

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

To understand how collective operations apply to ~~intercommunicators,~~ ==inter-communicators,== we can view most MPI ~~intracommunicator~~ ==intra-communicator== collective operations as fitting one of the following categories (see, for instance, ):

- [[versions/v40/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v40/API/MPI_IALLGATHER|MPI_IALLGATHER]] , ==[[versions/v40/API/MPI_ALLGATHER_INIT|MPI_ALLGATHER_INIT]] ,== [[versions/v40/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] , [[versions/v40/API/MPI_IALLGATHERV|MPI_IALLGATHERV]] ==, [[versions/v40/API/MPI_ALLGATHERV_INIT|MPI_ALLGATHERV_INIT]]==

- [[versions/v40/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v40/API/MPI_IALLTOALL|MPI_IALLTOALL]] , ==[[versions/v40/API/MPI_ALLTOALL_INIT|MPI_ALLTOALL_INIT]] ,== [[versions/v40/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , [[versions/v40/API/MPI_IALLTOALLV|MPI_IALLTOALLV]] , ==[[versions/v40/API/MPI_ALLTOALLV_INIT|MPI_ALLTOALLV_INIT]] ,== [[versions/v40/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] , [[versions/v40/API/MPI_IALLTOALLW|MPI_IALLTOALLW]] ==, [[versions/v40/API/MPI_ALLTOALLW_INIT|MPI_ALLTOALLW_INIT]]==

- [[versions/v40/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v40/API/MPI_IALLREDUCE|MPI_IALLREDUCE]] , ==[[versions/v40/API/MPI_ALLREDUCE_INIT|MPI_ALLREDUCE_INIT]] ,== [[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v40/API/MPI_IREDUCE_SCATTER_BLOCK|MPI_IREDUCE_SCATTER_BLOCK]] , ==[[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK_INIT|MPI_REDUCE_SCATTER_BLOCK_INIT]] ,== [[versions/v40/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v40/API/MPI_IREDUCE_SCATTER|MPI_IREDUCE_SCATTER]] ==, [[versions/v40/API/MPI_REDUCE_SCATTER_INIT|MPI_REDUCE_SCATTER_INIT]]==

- [[versions/v40/API/MPI_BARRIER|MPI_BARRIER]] , [[versions/v40/API/MPI_IBARRIER|MPI_IBARRIER]] ==, [[versions/v40/API/MPI_BARRIER_INIT|MPI_BARRIER_INIT]]==

- [[versions/v40/API/MPI_GATHER|MPI_GATHER]] , [[versions/v40/API/MPI_IGATHER|MPI_IGATHER]] , ==[[versions/v40/API/MPI_GATHER_INIT|MPI_GATHER_INIT]] ,== [[versions/v40/API/MPI_GATHERV|MPI_GATHERV]] , [[versions/v40/API/MPI_IGATHERV|MPI_IGATHERV]] ==, [[versions/v40/API/MPI_GATHERV_INIT|MPI_GATHERV_INIT]]==

- [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v40/API/MPI_IREDUCE|MPI_IREDUCE]] ==, [[versions/v40/API/MPI_REDUCE_INIT|MPI_REDUCE_INIT]] ,==

- [[versions/v40/API/MPI_BCAST|MPI_BCAST]] , [[versions/v40/API/MPI_IBCAST|MPI_IBCAST]] ==, [[versions/v40/API/MPI_BCAST_INIT|MPI_BCAST_INIT]]==

- [[versions/v40/API/MPI_SCATTER|MPI_SCATTER]] , [[versions/v40/API/MPI_ISCATTER|MPI_ISCATTER]] , ==[[versions/v40/API/MPI_SCATTER_INIT|MPI_SCATTER_INIT]] ,== [[versions/v40/API/MPI_SCATTERV|MPI_SCATTERV]] , [[versions/v40/API/MPI_ISCATTERV|MPI_ISCATTERV]] ==, [[versions/v40/API/MPI_SCATTERV_INIT|MPI_SCATTERV_INIT]]==

- [[versions/v40/API/MPI_SCAN|MPI_SCAN]] , [[versions/v40/API/MPI_ISCAN|MPI_ISCAN]] , ==[[versions/v40/API/MPI_SCAN_INIT|MPI_SCAN_INIT]]== [[versions/v40/API/MPI_EXSCAN|MPI_EXSCAN]] , [[versions/v40/API/MPI_IEXSCAN|MPI_IEXSCAN]] ==, [[versions/v40/API/MPI_EXSCAN_INIT|MPI_EXSCAN_INIT]]==

The application of collective communication to ~~intercommunicators~~ ==inter-communicators== is best described in terms of two groups. For example, an all-to-all [[versions/v40/API/MPI_ALLGATHER|MPI_ALLGATHER]] operation can be described as collecting data from all members of one group with the result appearing in all members of the other group (see Figure [[versions/v40/sections/coll#Applying Collective Operations to ~~Intercommunicators|Applying~~ ==Inter-Communicators|Applying== Collective Operations to ~~Intercommunicators]]~~ ==Inter-Communicators]]== ). As another example, a one-to-all [[versions/v40/API/MPI_BCAST|MPI_BCAST]] operation sends data from one member of one group to all members of the other group. Collective computation operations such as [[versions/v40/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] have a similar interpretation (see Figure [[versions/v40/sections/coll#Applying Collective Operations to ~~Intercommunicators|Applying~~ ==Inter-Communicators|Applying== Collective Operations to ~~Intercommunicators]]~~ ==Inter-Communicators]]== ). For ~~intracommunicators,~~ ==intra-communicators,== these two groups are the same. For ~~intercommunicators,~~ ==inter-communicators,== these two groups are distinct. For the all-to-all operations, each such operation is described in two phases, so that it has a symmetric, full-duplex behavior.

The following collective operations also apply to ~~intercommunicators:~~ ==inter-communicators:==

- [[versions/v40/API/MPI_BARRIER|MPI_BARRIER]] , [[versions/v40/API/MPI_IBARRIER|MPI_IBARRIER]] ==, [[versions/v40/API/MPI_BARRIER_INIT|MPI_BARRIER_INIT]] ,==

- [[versions/v40/API/MPI_BCAST|MPI_BCAST]] , [[versions/v40/API/MPI_IBCAST|MPI_IBCAST]] ==, [[versions/v40/API/MPI_BCAST_INIT|MPI_BCAST_INIT]] ,==

- [[versions/v40/API/MPI_GATHER|MPI_GATHER]] , [[versions/v40/API/MPI_IGATHER|MPI_IGATHER]] , ==[[versions/v40/API/MPI_GATHER_INIT|MPI_GATHER_INIT]] ,== [[versions/v40/API/MPI_GATHERV|MPI_GATHERV]] , [[versions/v40/API/MPI_IGATHERV|MPI_IGATHERV]] , ==[[versions/v40/API/MPI_GATHERV_INIT|MPI_GATHERV_INIT]] ,==

- [[versions/v40/API/MPI_SCATTER|MPI_SCATTER]] , [[versions/v40/API/MPI_ISCATTER|MPI_ISCATTER]] , ==[[versions/v40/API/MPI_SCATTER_INIT|MPI_SCATTER_INIT]] ,== [[versions/v40/API/MPI_SCATTERV|MPI_SCATTERV]] , [[versions/v40/API/MPI_ISCATTERV|MPI_ISCATTERV]] , ==[[versions/v40/API/MPI_SCATTERV_INIT|MPI_SCATTERV_INIT]] ,==

- [[versions/v40/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v40/API/MPI_IALLGATHER|MPI_IALLGATHER]] , ==[[versions/v40/API/MPI_ALLGATHER_INIT|MPI_ALLGATHER_INIT]] ,== [[versions/v40/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] , [[versions/v40/API/MPI_IALLGATHERV|MPI_IALLGATHERV]] , ==[[versions/v40/API/MPI_ALLGATHERV_INIT|MPI_ALLGATHERV_INIT]] ,==

- [[versions/v40/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v40/API/MPI_IALLTOALL|MPI_IALLTOALL]] , ==[[versions/v40/API/MPI_ALLTOALL_INIT|MPI_ALLTOALL_INIT]] ,== [[versions/v40/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , [[versions/v40/API/MPI_IALLTOALLV|MPI_IALLTOALLV]] ==, [[versions/v40/API/MPI_ALLTOALLV_INIT|MPI_ALLTOALLV_INIT]]== , [[versions/v40/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] , [[versions/v40/API/MPI_IALLTOALLW|MPI_IALLTOALLW]] , ==[[versions/v40/API/MPI_ALLTOALLW_INIT|MPI_ALLTOALLW_INIT]] ,==

- [[versions/v40/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v40/API/MPI_IALLREDUCE|MPI_IALLREDUCE]] , ==[[versions/v40/API/MPI_ALLREDUCE_INIT|MPI_ALLREDUCE_INIT]] ,== [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v40/API/MPI_IREDUCE|MPI_IREDUCE]] , ==MPI_REDUCE_INIT,==

- [[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v40/API/MPI_IREDUCE_SCATTER_BLOCK|MPI_IREDUCE_SCATTER_BLOCK]] , ==[[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK_INIT|MPI_REDUCE_SCATTER_BLOCK_INIT]] ,== [[versions/v40/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v40/API/MPI_IREDUCE_SCATTER|MPI_IREDUCE_SCATTER]] ==, [[versions/v40/API/MPI_REDUCE_SCATTER_INIT|MPI_REDUCE_SCATTER_INIT]]== .

*Figure: ~~Intercommunicator~~ ==Inter-communicator== allgather. The focus of data to one process is represented, not mandated by the semantics. The two phases do allgathers in both directions.*

*Figure: ~~Intercommunicator~~ ==Inter-communicator== reduce-scatter. The focus of data to one process is represented, not mandated by the semantics. The two phases do reduce-scatters in both directions.*

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

All-To-All All ==MPI== processes contribute to the result. All ==MPI== processes receive the result.

All-To-One All ==MPI== processes contribute to the result. One ==MPI== process receives the result.

One-To-All One ==MPI== process contributes to the result. All ==MPI== processes receive the result.

~~Other~~ ==Other:== Collective operations that do not fit into one of the above categories.

The data movement patterns of [[versions/v41/API/MPI_SCAN|MPI_SCAN]] , [[versions/v41/API/MPI_ISCAN|MPI_ISCAN]] , ==[[versions/v41/API/MPI_SCAN_INIT|MPI_SCAN_INIT]] ,== [[versions/v41/API/MPI_EXSCAN|MPI_EXSCAN]] , ==[[versions/v41/API/MPI_IEXSCAN|MPI_IEXSCAN]]== and ~~[[versions/v41/API/MPI_IEXSCAN|MPI_IEXSCAN]]~~ ==[[versions/v41/API/MPI_EXSCAN_INIT|MPI_EXSCAN_INIT]]== do not fit this taxonomy.

- [[versions/v41/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v41/API/MPI_IALLREDUCE|MPI_IALLREDUCE]] , [[versions/v41/API/MPI_ALLREDUCE_INIT|MPI_ALLREDUCE_INIT]] , [[versions/v41/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v41/API/MPI_IREDUCE|MPI_IREDUCE]] , ~~MPI_REDUCE_INIT,~~ ==[[versions/v41/API/MPI_REDUCE_INIT|MPI_REDUCE_INIT]] ,==

*Figure: Inter-communicator allgather. The focus of data to one ==MPI== process is represented, not mandated by the semantics. The two phases do allgathers in both directions.*

*Figure: Inter-communicator reduce-scatter. The focus of data to one ==MPI== process is represented, not mandated by the semantics. The two phases do reduce-scatters in both directions.*

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~The data movement patterns of [[versions/v50/API/MPI_SCAN|MPI_SCAN]] , [[versions/v50/API/MPI_ISCAN|MPI_ISCAN]] , [[versions/v50/API/MPI_SCAN_INIT|MPI_SCAN_INIT]] , [[versions/v50/API/MPI_EXSCAN|MPI_EXSCAN]] , [[versions/v50/API/MPI_IEXSCAN|MPI_IEXSCAN]] and [[versions/v50/API/MPI_EXSCAN_INIT|MPI_EXSCAN_INIT]] do not fit this taxonomy.~~

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Applying Collective Operations to Intercommunicators]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Applying Collective Operations to Intercommunicators]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Applying Collective Operations to Intercommunicators]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Applying Collective Operations to Intercommunicators]]

---
title: "Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/io]
---

# Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$

Chapter **io** · in [[versions/v20/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$|MPI-2.0]], [[versions/v21/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$|MPI-2.1]], [[versions/v22/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$|MPI-2.2]], [[versions/v30/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$|MPI-3.0]], [[versions/v31/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$|MPI-3.1]], [[versions/v40/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$|MPI-4.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~Sequential consistency is guaranteed among accesses to a single file if for any write sequence $`SEQ_1`$ to the file, there is no sequence $`SEQ_2`$ to the file which~~

~~is *concurrent* with~~

~~$`SEQ_1`$.~~

~~To guarantee sequential consistency when there are write sequences, `MPI_FILE_SYNC` must be used together with a mechanism that guarantees nonconcurrency of the sequences.~~

==Sequential consistency is guaranteed among accesses to a single file if for any write sequence $`SEQ_1`$ to the file, there is no sequence $`SEQ_2`$ to the file which is *concurrent* with==

==$`SEQ_1`$. To guarantee sequential consistency when there are write sequences, `MPI_FILE_SYNC` must be used together with a mechanism that guarantees nonconcurrency of the sequences.==

~~Changing the consistency semantics for an open file only affects new data accesses. All completed data accesses are guaranteed to abide by the consistency semantics in effect during their execution. Nonblocking data accesses~~

~~and split collective operations~~

==Changing the consistency semantics for an open file only affects new data accesses. All completed data accesses are guaranteed to abide by the consistency semantics in effect during their execution. Nonblocking data accesses and split collective operations==

~~Calling `MPI_FILE_SYNC` with `fh` causes all previous writes to `fh` by the calling process~~

~~to be transferred to the storage device.~~

~~If other processes have made updates to the storage device, then all such updates become visible to subsequent reads of `fh` by the calling process.~~

~~`MPI_FILE_SYNC`~~

==Calling `MPI_FILE_SYNC` with `fh` causes all previous writes to `fh` by the calling process to be transferred to the storage device.==

==If other processes have made updates to the storage device, then all such updates become visible to subsequent reads of `fh` by the calling process. `MPI_FILE_SYNC`==

The user is responsible for ensuring that all nonblocking requests and split collective operations on `fh` have been completed before calling ~~`MPI_FILE_SYNC`—otherwise,~~ ==`MPI_FILE_SYNC` — otherwise,== the call to `MPI_FILE_SYNC` is erroneous.

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~Consider access to a single file using file handles from distinct collective opens.~~

~~In order to guarantee sequential consistency, `MPI_FILE_SYNC` must be used (both opening and closing a file implicitly perform an `MPI_FILE_SYNC`).~~

~~Sequential consistency is guaranteed among accesses to a single file if for any write sequence $`SEQ_1`$ to the file, there is no sequence $`SEQ_2`$ to the file which is *concurrent* with~~

~~$`SEQ_1`$. To guarantee sequential consistency when there are write sequences, `MPI_FILE_SYNC` must be used together with a mechanism that guarantees nonconcurrency of the sequences.~~

~~See the examples in Section [[versions/v31/sections/io#Examples|Examples]] , page [[versions/v31/sections/io#Examples|Examples]] , for further clarification of some of these consistency semantics.~~

==Consider access to a single file using file handles from distinct collective opens. In order to guarantee sequential consistency, [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] must be used (both opening and closing a file implicitly perform an [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] ).==

==Sequential consistency is guaranteed among accesses to a single file if for any write sequence $`SEQ_1`$ to the file, there is no sequence $`SEQ_2`$ to the file which is *concurrent* with $`SEQ_1`$. To guarantee sequential consistency when there are write sequences, [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] must be used together with a mechanism that guarantees nonconcurrency of the sequences.==

==See the examples in [[versions/v31/sections/io#Examples|Examples]] for further clarification of some of these consistency semantics.==

~~Let $`FH`$ be the set of file handles created by one collective open. The consistency semantics for data access operations using $`FH`$ is set by collectively calling `MPI_FILE_SET_ATOMICITY` on $`FH`$. `MPI_FILE_SET_ATOMICITY` is collective; all processes in the group must pass identical values for `fh` and `flag`. If `flag` is `true`, atomic mode is set; if `flag` is `false`, nonatomic mode is set.~~

~~Changing the consistency semantics for an open file only affects new data accesses. All completed data accesses are guaranteed to abide by the consistency semantics in effect during their execution. Nonblocking data accesses and split collective operations~~

~~that~~

~~have not completed (e.g., via `MPI_WAIT`) are only guaranteed to abide by nonatomic mode consistency semantics.~~

==Let $`FH`$ be the set of file handles created by one collective open. The consistency semantics for data access operations using $`FH`$ is set by collectively calling [[versions/v31/API/MPI_FILE_SET_ATOMICITY|MPI_FILE_SET_ATOMICITY]] on $`FH`$. [[versions/v31/API/MPI_FILE_SET_ATOMICITY|MPI_FILE_SET_ATOMICITY]] is collective; all processes in the group must pass identical values for `fh` and `flag`. If `flag` is `true`, atomic mode is set; if `flag` is `false`, nonatomic mode is set.==

==Changing the consistency semantics for an open file only affects new data accesses. All completed data accesses are guaranteed to abide by the consistency semantics in effect during their execution. Nonblocking data accesses and split collective operations that have not completed (e.g., via [[versions/v31/API/MPI_WAIT|MPI_WAIT]] ) are only guaranteed to abide by nonatomic mode consistency semantics.==

~~`MPI_FILE_GET_ATOMICITY`~~ ==[[versions/v31/API/MPI_FILE_GET_ATOMICITY|MPI_FILE_GET_ATOMICITY]]== returns the current consistency semantics for data access operations on the set of file handles created by one collective open. If `flag` is `true`, atomic mode is enabled; if `flag` is `false`, nonatomic mode is enabled.

~~Calling `MPI_FILE_SYNC` with `fh` causes all previous writes to `fh` by the calling process to be transferred to the storage device.~~

~~If other processes have made updates to the storage device, then all such updates become visible to subsequent reads of `fh` by the calling process. `MPI_FILE_SYNC`~~

~~may be necessary to ensure sequential consistency in certain cases (see above).~~

~~`MPI_FILE_SYNC` is a collective operation.~~

~~The user is responsible for ensuring that all nonblocking requests and split collective operations on `fh` have been completed before calling `MPI_FILE_SYNC` — otherwise, the call to `MPI_FILE_SYNC` is erroneous.~~

==Calling [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] with `fh` causes all previous writes to `fh` by the calling process to be transferred to the storage device. If other processes have made updates to the storage device, then all such updates become visible to subsequent reads of `fh` by the calling process. [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] may be necessary to ensure sequential consistency in certain cases (see above).==

==[[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] is a collective operation.==

==The user is responsible for ensuring that all nonblocking requests and split collective operations on `fh` have been completed before calling [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] — otherwise, the call to [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] is erroneous.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The user is responsible for ensuring that all nonblocking requests and split collective operations on `fh` have been completed before calling [[versions/v40/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] ~~— otherwise,~~ ==—otherwise,== the call to [[versions/v40/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] is erroneous.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$]]

---
title: "Communication Calls"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Communication Calls

Chapter **one-side** · in [[versions/v20/sections/one-side#Communication Calls|MPI-2.0]], [[versions/v21/sections/one-side#Communication Calls|MPI-2.1]], [[versions/v22/sections/one-side#Communication Calls|MPI-2.2]], [[versions/v30/sections/one-side#Communication Calls|MPI-3.0]], [[versions/v31/sections/one-side#Communication Calls|MPI-3.1]], [[versions/v40/sections/one-side#Communication Calls|MPI-4.0]], [[versions/v41/sections/one-side#Communication Calls|MPI-4.1]], [[versions/v50/sections/one-side#Communication Calls|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

> The rule above is more lenient than for ~~message passing,~~ ==message-passing,== where we do not allow two concurrent sends, with overlapping send buffers. Here, we allow two concurrent puts with overlapping send buffers. The reasons for this relaxation are > > 1. Users do not like that restriction, which is not very natural (it prohibits concurrent reads). > > 2. Weakening the rule does not prevent efficient implementation, as far as we know. > > 3. Weakening the rule is important for performance of RMA: we want to associate one synchronization call with as many RMA operations is possible. If puts from overlapping buffers cannot be concurrent, then we need to needlessly add synchronization points in the code.

~~> The choice of supporting “self-communication” is the same as for message passing. It simplifies some coding, and is very useful with accumulate operations, to allow atomic updates of local variables.~~

==> The choice of supporting “self-communication” is the same as for message-passing. It simplifies some coding, and is very useful with accumulate operations, to allow atomic updates of local variables.==

==MPI_PROC_NULL is a valid target rank in the MPI RMA calls [[versions/v21/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v21/API/MPI_GET|MPI_GET]] , and [[versions/v21/API/MPI_PUT|MPI_PUT]] . The effect is the same as for MPI_PROC_NULL in MPI point-to-point communication.==

==After any RMA operation with rank MPI_PROC_NULL, it is still necessary to finish the RMA epoch with the synchronization method that started the epoch.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

~~> [!tip] Rationale~~

~~> The rule above is more lenient than for message-passing, where we do not allow two concurrent sends, with overlapping send buffers. Here, we allow two concurrent puts with overlapping send buffers. The reasons for this relaxation are > > 1.  Users do not like that restriction, which is not very natural (it prohibits concurrent reads). > > 2.  Weakening the rule does not prevent efficient implementation, as far as we know. > > 3.  Weakening the rule is important for performance of RMA: we want to associate one synchronization call with as many RMA operations is possible. If puts from overlapping buffers cannot be concurrent, then we need to needlessly add synchronization points in the code.~~

~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== is a valid target rank in the MPI RMA calls [[versions/v22/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v22/API/MPI_GET|MPI_GET]] , and [[versions/v22/API/MPI_PUT|MPI_PUT]] . The effect is the same as for ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== in MPI point-to-point communication.

After any RMA operation with rank ~~MPI_PROC_NULL,~~ ==`MPI_PROC_NULL`,== it is still necessary to finish the RMA epoch with the synchronization method that started the epoch.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~MPI supports three RMA communication calls: [[versions/v30/API/MPI_PUT|MPI_PUT]] transfers data from the caller memory (origin) to the target memory; [[versions/v30/API/MPI_GET|MPI_GET]] transfers data from the target memory to the caller memory; and [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] updates locations in the target memory, e.g. by adding to these locations values sent from the caller memory. These operations are *nonblocking*: the call initiates the transfer, but the transfer may continue after the call returns. The transfer is completed, both at the origin and at the target, when a subsequent *synchronization* call is issued by the caller on the involved window object. These synchronization calls are described in Section [[versions/v30/sections/one-side#Synchronization Calls|Synchronization Calls]] , page [[versions/v30/sections/one-side#Synchronization Calls|Synchronization Calls]] .~~

~~The local communication buffer of an RMA call should not be updated, and the local communication buffer of a get call should not be accessed after the RMA call, until the subsequent synchronization call completes.~~

~~It is erroneous to have concurrent conflicting accesses to the same memory location in a window; if a location is updated by a put or accumulate operation, then this location cannot be accessed by a load or another RMA operation until the updating operation has completed at the target. There is one exception to this rule; namely, the same location can be updated by several concurrent accumulate calls, the outcome being as if these updates occurred in some order. In addition, a window cannot concurrently be updated by a put or accumulate operation and by a local store operation. This, even if these two updates access different locations in the window. The last restriction enables more efficient implementations of RMA operations on many systems. These restrictions are described in more detail in Section [[versions/v30/sections/one-side#Semantics and Correctness|Semantics and Correctness]] , page [[versions/v30/sections/one-side#Semantics and Correctness|Semantics and Correctness]] .~~

==MPI supports the following RMA communication calls: [[versions/v30/API/MPI_PUT|MPI_PUT]] and [[versions/v30/API/MPI_RPUT|MPI_RPUT]] transfer data from the caller memory (origin) to the target memory; [[versions/v30/API/MPI_GET|MPI_GET]] and [[versions/v30/API/MPI_RGET|MPI_RGET]] transfer data from the target memory to the caller memory; [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] and [[versions/v30/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] update locations in the target memory, e.g., by adding to these locations values sent from the caller memory; [[versions/v30/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] , [[versions/v30/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] , and [[versions/v30/API/MPI_FETCH_AND_OP|MPI_FETCH_AND_OP]] perform atomic read-modify-write and return the data before the accumulate operation; and [[versions/v30/API/MPI_COMPARE_AND_SWAP|MPI_COMPARE_AND_SWAP]] performs a remote atomic compare and swap operation. These operations are *nonblocking*: the call initiates the transfer, but the transfer may continue after the call returns. The transfer is completed, at the origin or both the origin and the target, when a subsequent *synchronization* call is issued by the caller on the involved window object. These synchronization calls are described in Section [[versions/v30/sections/one-side#Synchronization Calls|Synchronization Calls]] , page [[versions/v30/sections/one-side#Synchronization Calls|Synchronization Calls]] . Transfers can also be completed with calls to flush routines; see Section [[versions/v30/sections/one-side#Flush and Sync|Flush and Sync]] , page [[versions/v30/sections/one-side#Flush and Sync|Flush and Sync]] for details. For the [[versions/v30/API/MPI_RPUT|MPI_RPUT]] , [[versions/v30/API/MPI_RGET|MPI_RGET]] , [[versions/v30/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] , and [[versions/v30/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] calls, the transfer can be locally completed by using the MPI test or wait operations described in Section [[versions/v30/sections/pt2pt#Communication Completion|Communication Completion]] , page [[versions/v30/sections/pt2pt#Communication Completion|Communication Completion]] .==

==The local communication buffer of an RMA call should not be updated, and the local communication buffer of a get call should not be accessed after the RMA call until the operation completes at the origin.==

==The outcome of concurrent conflicting accesses to the same memory locations is undefined; if a location is updated by a put or accumulate operation, then the outcome of loads or other RMA operations is undefined until the updating operation has completed at the target. There is one exception to this rule; namely, the same location can be updated by several concurrent accumulate calls, the outcome being as if these updates occurred in some order. In addition, the outcome of concurrent load/store and RMA updates to the same memory location is undefined. These==

==restrictions==

==are described in more detail in Section [[versions/v30/sections/one-side#Semantics and Correctness|Semantics and Correctness]] , page [[versions/v30/sections/one-side#Semantics and Correctness|Semantics and Correctness]] .==

For all ~~three~~ ==RMA== calls, the target process may be identical with the origin process; i.e., a process may use an RMA operation to move data in its memory.

~~`MPI_PROC_NULL` is a valid target rank in the MPI RMA calls [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v30/API/MPI_GET|MPI_GET]] , and [[versions/v30/API/MPI_PUT|MPI_PUT]] . The effect is the same as for `MPI_PROC_NULL` in MPI point-to-point communication.~~

~~After any RMA operation with rank `MPI_PROC_NULL`, it is still necessary to finish the RMA epoch with the synchronization method that started the epoch.~~

==`MPI_PROC_NULL` is a valid target rank in all MPI RMA communication calls. The effect is the same as for `MPI_PROC_NULL` in MPI point-to-point communication. After any RMA operation with rank `MPI_PROC_NULL`, it is still necessary to finish the RMA epoch with the synchronization method that started the epoch.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

MPI supports the following RMA communication calls: [[versions/v31/API/MPI_PUT|MPI_PUT]] and [[versions/v31/API/MPI_RPUT|MPI_RPUT]] transfer data from the caller memory (origin) to the target memory; [[versions/v31/API/MPI_GET|MPI_GET]] and [[versions/v31/API/MPI_RGET|MPI_RGET]] transfer data from the target memory to the caller memory; [[versions/v31/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] and [[versions/v31/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] update locations in the target memory, e.g., by adding to these locations values sent from the caller memory; [[versions/v31/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] , [[versions/v31/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] , and [[versions/v31/API/MPI_FETCH_AND_OP|MPI_FETCH_AND_OP]] perform atomic read-modify-write and return the data before the accumulate operation; and [[versions/v31/API/MPI_COMPARE_AND_SWAP|MPI_COMPARE_AND_SWAP]] performs a remote atomic compare and swap operation. These operations are *nonblocking*: the call initiates the transfer, but the transfer may continue after the call returns. The transfer is completed, at the origin or both the origin and the target, when a subsequent *synchronization* call is issued by the caller on the involved window object. These synchronization calls are described in ~~Section [[versions/v31/sections/one-side#Synchronization Calls|Synchronization Calls]] , page~~ [[versions/v31/sections/one-side#Synchronization Calls|Synchronization Calls]] . Transfers can also be completed with calls to flush routines; see ~~Section [[versions/v31/sections/one-side#Flush and Sync|Flush and Sync]] , page~~ [[versions/v31/sections/one-side#Flush and Sync|Flush and Sync]] for details. For the [[versions/v31/API/MPI_RPUT|MPI_RPUT]] , [[versions/v31/API/MPI_RGET|MPI_RGET]] , [[versions/v31/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] , and [[versions/v31/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] calls, the transfer can be locally completed by using the MPI test or wait operations described in ~~Section [[versions/v31/sections/pt2pt#Communication Completion|Communication Completion]] , page~~ [[versions/v31/sections/pt2pt#Communication Completion|Communication Completion]] .

~~The outcome of concurrent conflicting accesses to the same memory locations is undefined; if a location is updated by a put or accumulate operation, then the outcome of loads or other RMA operations is undefined until the updating operation has completed at the target. There is one exception to this rule; namely, the same location can be updated by several concurrent accumulate calls, the outcome being as if these updates occurred in some order. In addition, the outcome of concurrent load/store and RMA updates to the same memory location is undefined. These~~

~~restrictions~~

~~are described in more detail in Section [[versions/v31/sections/one-side#Semantics and Correctness|Semantics and Correctness]] , page [[versions/v31/sections/one-side#Semantics and Correctness|Semantics and Correctness]] .~~

==The resulting data values, or outcome, of concurrent conflicting accesses to the same memory locations is undefined; if a location is updated by a put or accumulate operation, then the outcome of loads or other RMA operations is undefined until the updating operation has completed at the target. There is one exception to this rule; namely, the same location can be updated by several concurrent accumulate calls, the outcome being as if these updates occurred in some order. In addition, the outcome of concurrent load/store and RMA updates to the same memory location is undefined. These restrictions are described in more detail in [[versions/v31/sections/one-side#Semantics and Correctness|Semantics and Correctness]] .==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

MPI supports the following RMA communication calls: [[versions/v41/API/MPI_PUT|MPI_PUT]] and [[versions/v41/API/MPI_RPUT|MPI_RPUT]] transfer data from the caller memory (origin) to the target memory; [[versions/v41/API/MPI_GET|MPI_GET]] and [[versions/v41/API/MPI_RGET|MPI_RGET]] transfer data from the target memory to the caller memory; [[versions/v41/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] and [[versions/v41/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] ~~update~~ ==perform element-wise atomic updates of== locations in the target memory, e.g., by adding to these locations values sent from the caller memory; [[versions/v41/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] , [[versions/v41/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] , and [[versions/v41/API/MPI_FETCH_AND_OP|MPI_FETCH_AND_OP]] perform ==element-wise== atomic read-modify-write ==updates== and return ~~the data~~ ==each value== before the ~~accumulate operation;~~ ==update;== and [[versions/v41/API/MPI_COMPARE_AND_SWAP|MPI_COMPARE_AND_SWAP]] performs a remote atomic compare and swap operation. These ~~operations~~ ==procedures== are ~~*nonblocking*: the call initiates the transfer, but the transfer may continue after the call returns.~~ ==*nonblocking*.== The ~~transfer~~ ==operation== is completed, at the origin or both the origin and the target, when a subsequent *synchronization* ~~call~~ ==procedure== is ~~issued~~ ==called== by the ~~caller~~ ==origin== on the involved window object. These synchronization ~~calls~~ ==procedures== are described in [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] . ~~Transfers~~ ==RMA communication operations== can also be completed with calls to flush ~~routines;~~ ==procedures;== see [[versions/v41/sections/one-side#Flush and Sync|Flush and Sync]] for details. ~~For the~~ ==Request-based operations== [[versions/v41/API/MPI_RPUT|MPI_RPUT]] , [[versions/v41/API/MPI_RGET|MPI_RGET]] , [[versions/v41/API/MPI_RACCUMULATE|MPI_RACCUMULATE]] , and [[versions/v41/API/MPI_RGET_ACCUMULATE|MPI_RGET_ACCUMULATE]] ~~calls, the transfer~~ can be ~~locally~~ completed ==at the origin== by using the MPI test or wait ~~operations~~ ==procedures== described in [[versions/v41/sections/pt2pt#Communication Completion|Communication Completion]] .

The local communication buffer of an RMA ~~call~~ ==operation== should not be ~~updated, and the local communication buffer of a get call should not be accessed~~ ==updated== after the ~~RMA call~~ ==operation started and== until the operation completes at the origin. ==The local communication buffer of a get operation should not be accessed after the operation started and until the operation completes at the origin.==

==Two concurrent accesses are called conflicting if one of the two is a put operation, exactly one of them is an accumulate operation, or one of them is a get operation and the other is a local store access.== The ~~resulting data values, or outcome,~~ ==outcome== of ~~concurrent~~ conflicting accesses to the same memory ~~locations~~ ==location== is undefined; if a location is updated by a put or accumulate operation, then the outcome of loads or other RMA operations is undefined until the updating operation has completed at the target. There is one exception to this rule; namely, the same location can be updated by several concurrent accumulate ~~calls,~~ ==operations,== the outcome being as if these updates occurred in some order. In addition, the outcome of concurrent load/store ==accesses== and RMA updates to the same memory location is undefined. These restrictions are described in more detail in [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] .

For all RMA ~~calls,~~ ==communication operations,== the target process may be identical with the origin process; i.e., ~~a~~ ==an MPI== process may use an RMA operation to move data in its memory.

`MPI_PROC_NULL` is a valid target rank in all MPI RMA communication calls. The effect is the same as for `MPI_PROC_NULL` in MPI point-to-point communication. After any RMA operation with rank `MPI_PROC_NULL`, it is still necessary to ~~finish~~ ==close== the RMA epoch with the synchronization method that ~~started~~ ==opened== the epoch.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Communication Calls]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Communication Calls]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Communication Calls]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Communication Calls]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Communication Calls]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Communication Calls]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Communication Calls]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Communication Calls]]

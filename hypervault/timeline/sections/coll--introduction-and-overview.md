---
title: "Introduction and Overview"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Introduction and Overview

Chapter **coll** · in [[versions/v13/sections/coll#Introduction and Overview|MPI-1.3]], [[versions/v21/sections/coll#Introduction and Overview|MPI-2.1]], [[versions/v22/sections/coll#Introduction and Overview|MPI-2.2]], [[versions/v30/sections/coll#Introduction and Overview|MPI-3.0]], [[versions/v31/sections/coll#Introduction and Overview|MPI-3.1]], [[versions/v40/sections/coll#Introduction and Overview|MPI-4.0]], [[versions/v41/sections/coll#Introduction and Overview|MPI-4.1]], [[versions/v50/sections/coll#Introduction and Overview|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (5 changed paragraphs)

~~Collective communication is defined as communication that involves a group of processes. The functions of this type provided by MPI are the following:~~

~~- Barrier synchronization across all group members (Sec. [[versions/v21/sections/coll#Barrier synchronization|Barrier synchronization]] ).~~

~~- Broadcast from one member to all members of a group (Sec. [[versions/v21/sections/coll#Broadcast|Broadcast]] ). This is shown in figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- Gather data from all group members to one member (Sec. [[versions/v21/sections/coll#Gather|Gather]] ). This is shown in figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- Scatter data from one member to all members of a group (Sec. [[versions/v21/sections/coll#Scatter|Scatter]] ). This is shown in figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- A variation on Gather where all members of the group receive the result (Sec. [[versions/v21/sections/coll#Gather-to-all|Gather-to-all]] ). This is shown as “allgather” in figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- Scatter/Gather data from all members to all members of a group (also called complete exchange or all-to-all) (Sec. [[versions/v21/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] ). This is shown as “alltoall” in figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- Global reduction operations such as sum, max, min, or user-defined functions, where the result is returned to all group members and a variation where the result is returned to only one member (Sec. [[global-reduce]] ).~~

~~- A combined reduction and scatter operation (Sec. [[versions/v21/sections/coll#Reduce-Scatter|Reduce-Scatter]] ).~~

~~- Scan across all members of a group (also called prefix) (Sec. [[versions/v21/sections/coll#Scan|Scan]] ).~~

==Collective communication is defined as communication that involves a group==

==or groups==

==of processes. The functions of this type provided by MPI are the following:==

==- [[versions/v21/API/MPI_BARRIER|MPI_BARRIER]] :==

==  Barrier synchronization across==

==  all members of a group==

==  (Section [[versions/v21/sections/coll#Barrier Synchronization|Barrier Synchronization]] ).==

==- [[versions/v21/API/MPI_BCAST|MPI_BCAST]] :==

==  Broadcast from one member to all members of a group (Section [[versions/v21/sections/coll#Broadcast|Broadcast]] ). This is shown==

==  as “broadcast”==

==  in Figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v21/API/MPI_GATHER|MPI_GATHER]] , [[versions/v21/API/MPI_GATHERV|MPI_GATHERV]] :==

==  Gather data from==

==  all members of a group==

==  to one member (Section [[versions/v21/sections/coll#Gather|Gather]] ). This is shown==

==  as “gather”==

==  in Figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v21/API/MPI_SCATTER|MPI_SCATTER]] , [[versions/v21/API/MPI_SCATTERV|MPI_SCATTERV]] :==

==  Scatter data from one member to all members of a group (Section [[versions/v21/sections/coll#Scatter|Scatter]] ). This is shown==

==  as “scatter”==

==  in Figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v21/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v21/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] :==

==  A variation on Gather where all members of==

==  a==

==  group receive the result (Section [[versions/v21/sections/coll#Gather-to-all|Gather-to-all]] ). This is shown as “allgather” in Figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v21/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v21/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , [[versions/v21/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] :==

==  Scatter/Gather data from all members to all members of a group (also called complete exchange or all-to-all) (Section [[versions/v21/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] ). This is shown as “alltoall” in Figure [[versions/v21/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v21/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v21/API/MPI_REDUCE|MPI_REDUCE]] :==

==  Global reduction operations such as sum, max, min, or user-defined functions, where the result is returned to==

==  all members of a group==

==  and a variation where the result is returned to only one member (Section [[global-reduce]] ).==

==- [[versions/v21/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] :==

==  A combined reduction and scatter operation (Section [[versions/v21/sections/coll#Reduce-Scatter|Reduce-Scatter]] ).==

==- [[versions/v21/API/MPI_SCAN|MPI_SCAN]] , [[versions/v21/API/MPI_EXSCAN|MPI_EXSCAN]] :==

==  Scan across all members of a group (also called prefix) (Section [[versions/v21/sections/coll#Scan|Scan]] ).==

~~A collective operation is executed by having all processes in the group call the communication routine, with matching arguments. The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving processes as specified in Chapter [[versions/v21/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] . One of the key arguments is a communicator that defines the group of participating processes and provides a context for the operation. Several collective routines such as broadcast and gather have a single originating or receiving process. Such processes are called the *root*. Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root. The reader is referred to Chapter [[versions/v21/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[versions/v21/sections/context#Groups, Contexts, and Communicators|Groups, Contexts, and Communicators]] for information on how to define groups and create communicators.~~

~~The type-matching conditions for the collective operations are more strict than the corresponding conditions between sender and receiver in point-to-point. Namely, for collective operations, the amount of data sent must exactly match the amount of data specified by the receiver. Distinct type maps (the layout in memory, see Sec. [[versions/v21/sections/pt2pt#Derived datatypes|Derived datatypes]] ) between sender and receiver are still allowed.~~

~~Collective routine calls can (but are not required to) return as soon as their participation in the collective communication is complete. The completion of a call indicates that the caller is now free to access locations in the communication buffer. It does not indicate that other processes in the group have completed or even started the operation (unless otherwise indicated in the description of the operation). Thus, a collective communication call may, or may not, have the effect of synchronizing all calling processes. This statement excludes, of course, the barrier function.~~

~~Collective communication calls may use the same communicators as point-to-point communication; MPI guarantees that messages generated on behalf of collective communication calls will not be confused with messages generated by point-to-point communication. A more detailed discussion of correct use of collective routines is found in Sec. [[coll-correct]] .~~

==One of the key arguments==

==in a call to a collective routine==

==is a communicator that defines the group==

==or groups==

==of participating processes and provides a context for the operation.==

==This is discussed further in Section [[versions/v21/sections/coll#Communicator Argument|Communicator Argument]] .==

==The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving processes as specified in==

==Chapter [[versions/v21/sections/datatypes#Datatypes|Datatypes]] .==

==Several collective routines such as broadcast and gather have a single originating or receiving process.==

==Such a process is==

==called the *root*. Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root. The reader is referred to Chapter [[versions/v21/sections/datatypes#Datatypes|Datatypes]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[versions/v21/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] for information on how to define groups and create communicators.==

==The type-matching conditions for the collective operations are more strict than the corresponding conditions between sender and receiver in point-to-point. Namely, for collective operations, the amount of data sent must exactly match the amount of data specified by the receiver.==

==Different==

==type maps (the layout in memory, see Section [[versions/v21/sections/datatypes#Derived Datatypes|Derived Datatypes]] ) between sender and receiver are still allowed.==

==Collective routine calls can (but are not required to) return as soon as their participation in the collective communication is complete. The completion of a call indicates that the caller is now free to access locations in the communication buffer. It does not indicate that other processes in the group have completed or even started the operation (unless otherwise==

==implied by==

==in the description of the operation). Thus, a collective communication call may, or may not, have the effect of synchronizing all calling processes. This statement excludes, of course, the barrier function.==

==Collective communication calls may use the same communicators as point-to-point communication; MPI guarantees that messages generated on behalf of collective communication calls will not be confused with messages generated by point-to-point communication. A more detailed discussion of correct use of collective routines is found in Section [[coll-correct]] .==

> The equal-data restriction (on type matching) was made so as to avoid the complexity of providing a facility analogous to the status argument of `MPI_RECV` for discovering the amount of data sent. Some of the collective routines would require an array of status values. > > The statements about synchronization are made so as to allow a variety of implementations of the collective functions. > > The collective operations do not accept a message tag argument. If future revisions of MPI define non-blocking collective functions, then tags (or a similar mechanism) ~~will~~ ==> > might > >== need to be added so as to allow the dis-ambiguation of multiple, pending, collective operations.

> It is dangerous to rely on synchronization side-effects of the collective operations for program correctness. For example, even though a particular implementation may provide a broadcast routine with a side-effect of synchronization, the standard does not require this, and a program that relies on this will not be portable. > > On the other hand, a correct, portable program must allow for the fact that a collective call *may* be synchronizing. Though one cannot rely on any synchronization side-effect, one must program so as to allow it. These issues are discussed further in ~~Sec.~~ ==Section== [[coll-correct]] .

~~> While vendors may write optimized collective routines matched to their architectures, a complete library of the collective communication routines can be written entirely using the MPI point-to-point communication functions and a few auxiliary functions. If implementing on top of point-to-point, a hidden, special communicator must be created for the collective operation so as to avoid interference with any on-going point-to-point communication at the time of the collective call. This is discussed further in Sec. [[coll-correct]] .~~

==> While vendors may write optimized collective routines matched to their architectures, a complete library of the collective communication routines can be written entirely using the MPI point-to-point communication functions and a few auxiliary functions. If implementing on top of point-to-point, a hidden, special communicator > > might > > be created for the collective operation so as to avoid interference with any on-going point-to-point communication at the time of the collective call. This is discussed further in Section [[coll-correct]] .==

==Many of the descriptions of the collective routines provide illustrations in terms of blocking MPI point-to-point routines. These are intended solely to indicate what data is sent or received by what process. Many of these examples are *not* correct MPI programs; for purposes of simplicity, they often assume infinite buffering.==

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

Scatter/Gather data from all members to all members of a group (also called complete ~~exchange or all-to-all)~~ ==exchange)== (Section [[versions/v22/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] ). This is shown as ~~“alltoall”~~ ==“complete exchange”== in Figure [[versions/v22/sections/coll#Introduction and Overview|Introduction and Overview]] .

Collective routine calls can (but are not required to) return as soon as their participation in the collective communication is complete. The completion of a call indicates that the caller is now free to ~~access~~ ==modify== locations in the communication buffer. It does not indicate that other processes in the group have completed or even started the operation (unless otherwise

~~in~~ the description of the operation). Thus, a collective communication call may, or may not, have the effect of synchronizing all calling processes. This statement excludes, of course, the barrier function.

> The equal-data restriction (on type matching) was made so as to avoid the complexity of providing a facility analogous to the status argument of `MPI_RECV` for discovering the amount of data sent. Some of the collective routines would require an array of status values. > > The statements about synchronization are made so as to allow a variety of implementations of the collective functions. > > The collective operations do not accept a message tag argument. If future revisions of MPI define ~~non-blocking~~ ==nonblocking== collective functions, then tags (or a similar mechanism) > > might > > need to be added so as to allow the dis-ambiguation of multiple, pending, collective operations.

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~Collective communication is defined as communication that involves a group~~

~~or groups~~

~~of processes. The functions of this type provided by MPI are the following:~~

~~- [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] :~~

~~  Barrier synchronization across~~

~~  all members of a group~~

~~  (Section [[versions/v30/sections/coll#Barrier Synchronization|Barrier Synchronization]] ).~~

~~- [[versions/v30/API/MPI_BCAST|MPI_BCAST]] :~~

~~  Broadcast from one member to all members of a group (Section [[versions/v30/sections/coll#Broadcast|Broadcast]] ). This is shown~~

~~  as “broadcast”~~

~~  in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- [[versions/v30/API/MPI_GATHER|MPI_GATHER]] , [[versions/v30/API/MPI_GATHERV|MPI_GATHERV]] :~~

~~  Gather data from~~

~~  all members of a group~~

~~  to one member (Section [[versions/v30/sections/coll#Gather|Gather]] ). This is shown~~

~~  as “gather”~~

~~  in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- [[versions/v30/API/MPI_SCATTER|MPI_SCATTER]] , [[versions/v30/API/MPI_SCATTERV|MPI_SCATTERV]] :~~

~~  Scatter data from one member to all members of a group (Section [[versions/v30/sections/coll#Scatter|Scatter]] ). This is shown~~

~~  as “scatter”~~

~~  in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- [[versions/v30/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v30/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] :~~

~~  A variation on Gather where all members of~~

~~  a~~

~~  group receive the result (Section [[versions/v30/sections/coll#Gather-to-all|Gather-to-all]] ). This is shown as “allgather” in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- [[versions/v30/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v30/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , [[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] :~~

~~  Scatter/Gather data from all members to all members of a group (also called complete exchange) (Section [[versions/v30/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] ). This is shown as “complete exchange” in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~- [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] :~~

~~  Global reduction operations such as sum, max, min, or user-defined functions, where the result is returned to~~

~~  all members of a group~~

~~  and a variation where the result is returned to only one member (Section [[global-reduce]] ).~~

~~- [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] :~~

~~  A combined reduction and scatter operation (Section [[versions/v30/sections/coll#Reduce-Scatter|Reduce-Scatter]] ).~~

~~- [[versions/v30/API/MPI_SCAN|MPI_SCAN]] , [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]] :~~

~~  Scan across all members of a group (also called prefix) (Section [[versions/v30/sections/coll#Scan|Scan]] ).~~

==Collective communication is defined as communication that involves a group or groups of processes. The functions of this type provided by MPI are the following:==

==- [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] , [[versions/v30/API/MPI_IBARRIER|MPI_IBARRIER]] : Barrier synchronization across==

==  all members of a group (Section [[versions/v30/sections/coll#Barrier Synchronization|Barrier Synchronization]] and Section [[versions/v30/sections/coll#Nonblocking Barrier Synchronization|Nonblocking Barrier Synchronization]] ).==

==- [[versions/v30/API/MPI_BCAST|MPI_BCAST]] , [[versions/v30/API/MPI_IBCAST|MPI_IBCAST]] : Broadcast from one member to all members of a group (Section [[versions/v30/sections/coll#Broadcast|Broadcast]] and Section [[versions/v30/sections/coll#Nonblocking Broadcast|Nonblocking Broadcast]] ). This is shown as “broadcast” in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v30/API/MPI_GATHER|MPI_GATHER]] , [[versions/v30/API/MPI_IGATHER|MPI_IGATHER]] , [[versions/v30/API/MPI_GATHERV|MPI_GATHERV]] , [[versions/v30/API/MPI_IGATHERV|MPI_IGATHERV]] : Gather data from==

==  all members of a group to one member (Section [[versions/v30/sections/coll#Gather|Gather]] and Section [[versions/v30/sections/coll#Nonblocking Gather|Nonblocking Gather]] ). This is shown as “gather” in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v30/API/MPI_SCATTER|MPI_SCATTER]] , [[versions/v30/API/MPI_ISCATTER|MPI_ISCATTER]] , [[versions/v30/API/MPI_SCATTERV|MPI_SCATTERV]] , [[versions/v30/API/MPI_ISCATTERV|MPI_ISCATTERV]] : Scatter data from one member to all members of a group (Section [[versions/v30/sections/coll#Scatter|Scatter]] and Section [[versions/v30/sections/coll#Nonblocking Scatter|Nonblocking Scatter]] ). This is shown as “scatter” in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v30/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v30/API/MPI_IALLGATHER|MPI_IALLGATHER]] , [[versions/v30/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] , [[versions/v30/API/MPI_IALLGATHERV|MPI_IALLGATHERV]] : A variation on Gather where all members of==

==  a group receive the result (Section [[versions/v30/sections/coll#Gather-to-all|Gather-to-all]] and Section [[versions/v30/sections/coll#Nonblocking Gather-to-all|Nonblocking Gather-to-all]] ). This is shown as “allgather” in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v30/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v30/API/MPI_IALLTOALL|MPI_IALLTOALL]] , [[versions/v30/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , [[versions/v30/API/MPI_IALLTOALLV|MPI_IALLTOALLV]] , [[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] , [[versions/v30/API/MPI_IALLTOALLW|MPI_IALLTOALLW]] : Scatter/Gather data from all members to all members of a group (also called complete exchange) (Section [[versions/v30/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] and Section [[versions/v30/sections/coll#Nonblocking All-to-All Scatter/Gather|Nonblocking All-to-All Scatter/Gather]] ). This is shown as “complete exchange” in Figure [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==- [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v30/API/MPI_IALLREDUCE|MPI_IALLREDUCE]] , [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v30/API/MPI_IREDUCE|MPI_IREDUCE]] : Global reduction operations such as sum, max, min, or user-defined functions, where the result is returned to==

==  all members of a group (Section [[versions/v30/sections/coll#All-Reduce|All-Reduce]] and Section [[versions/v30/sections/coll#Nonblocking All-Reduce|Nonblocking All-Reduce]] ) and a variation where the result is returned to only one member (Section [[global-reduce]] and Section [[versions/v30/sections/coll#Nonblocking Reduce|Nonblocking Reduce]] ).==

==- [[versions/v30/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v30/API/MPI_IREDUCE_SCATTER_BLOCK|MPI_IREDUCE_SCATTER_BLOCK]] , [[versions/v30/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v30/API/MPI_IREDUCE_SCATTER|MPI_IREDUCE_SCATTER]] : A combined reduction and scatter operation (Section [[versions/v30/sections/coll#Reduce-Scatter|Reduce-Scatter]] , Section [[versions/v30/sections/coll#Nonblocking Reduce-Scatter with Equal Blocks|Nonblocking Reduce-Scatter with Equal Blocks]] , and Section [[versions/v30/sections/coll#Nonblocking Reduce-Scatter|Nonblocking Reduce-Scatter]] ).==

==- [[versions/v30/API/MPI_SCAN|MPI_SCAN]] , [[versions/v30/API/MPI_ISCAN|MPI_ISCAN]] , [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]] , [[versions/v30/API/MPI_IEXSCAN|MPI_IEXSCAN]] : Scan across all members of a group (also called prefix) (Section [[versions/v30/sections/coll#Scan|Scan]] , Section [[versions/v30/sections/coll#Exclusive Scan|Exclusive Scan]] , Section [[versions/v30/sections/coll#Nonblocking Inclusive Scan|Nonblocking Inclusive Scan]] , and Section [[versions/v30/sections/coll#Nonblocking Exclusive Scan|Nonblocking Exclusive Scan]] ).==

~~One of the key arguments~~

~~in a call to a collective routine~~

~~is a communicator that defines the group~~

~~or groups~~

~~of participating processes and provides a context for the operation.~~

~~This is discussed further in Section [[versions/v30/sections/coll#Communicator Argument|Communicator Argument]] .~~

~~The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving processes as specified in~~

~~Chapter [[versions/v30/sections/datatypes#Datatypes|Datatypes]] .~~

~~Several collective routines such as broadcast and gather have a single originating or receiving process.~~

~~Such a process is~~

~~called the *root*. Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root. The reader is referred to Chapter [[versions/v30/sections/datatypes#Datatypes|Datatypes]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[versions/v30/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] for information on how to define groups and create communicators.~~

==One of the key arguments in a call to a collective routine is a communicator that defines the group or groups of participating processes and provides a context for the operation. This is discussed further in Section [[versions/v30/sections/coll#Communicator Argument|Communicator Argument]] . The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving processes as specified in==

==Chapter [[versions/v30/sections/datatypes#Datatypes|Datatypes]] . Several collective routines such as broadcast and gather have a single originating or receiving process.==

==Such a process is called the *root*. Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root. The reader is referred to Chapter [[versions/v30/sections/datatypes#Datatypes|Datatypes]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[versions/v30/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] for information on how to define groups and create communicators.==

~~Different~~

~~type maps (the layout in memory, see Section [[versions/v30/sections/datatypes#Derived Datatypes|Derived Datatypes]] ) between sender and receiver are still allowed.~~

~~Collective routine calls can (but are not required to) return as soon as their participation in the collective communication is complete. The completion of a call indicates that the caller is now free to modify locations in the communication buffer. It does not indicate that other processes in the group have completed or even started the operation (unless otherwise~~

==Different type maps (the layout in memory, see Section [[versions/v30/sections/datatypes#Derived Datatypes|Derived Datatypes]] ) between sender and receiver are still allowed.==

==Collective operations can (but are not required to) complete as soon as the caller’s participation in the collective communication is finished. A blocking operation is complete as soon as the call returns. A nonblocking (immediate) call requires a separate completion call (cf. Section [[versions/v30/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] ). The completion of a collective operation indicates that the caller is free to modify locations in the communication buffer. It does not indicate that other processes in the group have completed or even started the operation (unless otherwise==

~~the description of the operation). Thus, a collective communication call may, or may not, have the effect of synchronizing all calling processes. This statement excludes, of course, the barrier function.~~

~~Collective communication calls may use the same communicators as point-to-point communication; MPI guarantees that messages generated on behalf of collective communication calls will not be confused with messages generated by point-to-point communication. A more detailed discussion of correct use of collective routines is found in Section [[coll-correct]] .~~

==the description of the operation).==

==Thus, a collective communication operation may, or may not, have the effect of synchronizing all calling processes. This statement excludes, of course, the barrier operation.==

==Collective communication calls may use the same communicators as point-to-point communication; MPI guarantees that messages generated on behalf of collective communication calls will not be confused with messages generated by point-to-point communication. The collective operations do not have a message tag argument. A more detailed discussion of correct use of collective routines is found in Section [[coll-correct]] .==

> The equal-data restriction (on type matching) was made so as to avoid the complexity of providing a facility analogous to the status argument of `MPI_RECV` for discovering the amount of data sent. Some of the collective routines would require an array of status values. > > The statements about synchronization are made so as to allow a variety of implementations of the collective functions. ~~> > The collective operations do not accept a message tag argument. If future revisions of MPI define nonblocking collective functions, then tags (or a similar mechanism) > > might > > need to be added so as to allow the dis-ambiguation of multiple, pending, collective operations.~~

> While vendors may write optimized collective routines matched to their architectures, a complete library of the collective communication routines can be written entirely using the MPI point-to-point communication functions and a few auxiliary functions. If implementing on top of point-to-point, a hidden, special communicator > > might ~~> >~~ be created for the collective operation so as to avoid interference with any on-going point-to-point communication at the time of the collective call. This is discussed further in Section [[coll-correct]] .

### MPI-3.0 → MPI-3.1  (7 changed paragraphs)

~~- [[versions/v31/API/MPI_BARRIER|MPI_BARRIER]] , [[versions/v31/API/MPI_IBARRIER|MPI_IBARRIER]] : Barrier synchronization across~~

~~  all members of a group (Section [[versions/v31/sections/coll#Barrier Synchronization|Barrier Synchronization]] and Section [[versions/v31/sections/coll#Nonblocking Barrier Synchronization|Nonblocking Barrier Synchronization]] ).~~

==- [[versions/v31/API/MPI_BARRIER|MPI_BARRIER]] , [[versions/v31/API/MPI_IBARRIER|MPI_IBARRIER]] : Barrier synchronization across all members of a group (Section [[versions/v31/sections/coll#Barrier Synchronization|Barrier Synchronization]] and Section [[versions/v31/sections/coll#Nonblocking Barrier Synchronization|Nonblocking Barrier Synchronization]] ).==

~~- [[versions/v31/API/MPI_GATHER|MPI_GATHER]] , [[versions/v31/API/MPI_IGATHER|MPI_IGATHER]] , [[versions/v31/API/MPI_GATHERV|MPI_GATHERV]] , [[versions/v31/API/MPI_IGATHERV|MPI_IGATHERV]] : Gather data from~~

~~  all members of a group to one member (Section [[versions/v31/sections/coll#Gather|Gather]] and Section [[versions/v31/sections/coll#Nonblocking Gather|Nonblocking Gather]] ). This is shown as “gather” in Figure [[versions/v31/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

==- [[versions/v31/API/MPI_GATHER|MPI_GATHER]] , [[versions/v31/API/MPI_IGATHER|MPI_IGATHER]] , [[versions/v31/API/MPI_GATHERV|MPI_GATHERV]] , [[versions/v31/API/MPI_IGATHERV|MPI_IGATHERV]] : Gather data from all members of a group to one member (Section [[versions/v31/sections/coll#Gather|Gather]] and Section [[versions/v31/sections/coll#Nonblocking Gather|Nonblocking Gather]] ). This is shown as “gather” in Figure [[versions/v31/sections/coll#Introduction and Overview|Introduction and Overview]] .==

~~- [[versions/v31/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v31/API/MPI_IALLGATHER|MPI_IALLGATHER]] , [[versions/v31/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] , [[versions/v31/API/MPI_IALLGATHERV|MPI_IALLGATHERV]] : A variation on Gather where all members of~~

~~  a group receive the result (Section [[versions/v31/sections/coll#Gather-to-all|Gather-to-all]] and Section [[versions/v31/sections/coll#Nonblocking Gather-to-all|Nonblocking Gather-to-all]] ). This is shown as “allgather” in Figure [[versions/v31/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

==- [[versions/v31/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v31/API/MPI_IALLGATHER|MPI_IALLGATHER]] , [[versions/v31/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] , [[versions/v31/API/MPI_IALLGATHERV|MPI_IALLGATHERV]] : A variation on Gather where all members of a group receive the result (Section [[versions/v31/sections/coll#Gather-to-all|Gather-to-all]] and Section [[versions/v31/sections/coll#Nonblocking Gather-to-all|Nonblocking Gather-to-all]] ). This is shown as “allgather” in Figure [[versions/v31/sections/coll#Introduction and Overview|Introduction and Overview]] .==

~~- [[versions/v31/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v31/API/MPI_IALLREDUCE|MPI_IALLREDUCE]] , [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v31/API/MPI_IREDUCE|MPI_IREDUCE]] : Global reduction operations such as sum, max, min, or user-defined functions, where the result is returned to~~

~~  all members of a group (Section [[versions/v31/sections/coll#All-Reduce|All-Reduce]] and Section [[versions/v31/sections/coll#Nonblocking All-Reduce|Nonblocking All-Reduce]] ) and a variation where the result is returned to only one member (Section [[global-reduce]] and Section [[versions/v31/sections/coll#Nonblocking Reduce|Nonblocking Reduce]] ).~~

==- [[versions/v31/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v31/API/MPI_IALLREDUCE|MPI_IALLREDUCE]] , [[versions/v31/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v31/API/MPI_IREDUCE|MPI_IREDUCE]] : Global reduction operations such as sum, max, min, or user-defined functions, where the result is returned to all members of a group (Section [[versions/v31/sections/coll#All-Reduce|All-Reduce]] and Section [[versions/v31/sections/coll#Nonblocking All-Reduce|Nonblocking All-Reduce]] ) and a variation where the result is returned to only one member (Section [[global-reduce]] and Section [[versions/v31/sections/coll#Nonblocking Reduce|Nonblocking Reduce]] ).==

~~One of the key arguments in a call to a collective routine is a communicator that defines the group or groups of participating processes and provides a context for the operation. This is discussed further in Section [[versions/v31/sections/coll#Communicator Argument|Communicator Argument]] . The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving processes as specified in~~

~~Chapter [[versions/v31/sections/datatypes#Datatypes|Datatypes]] . Several collective routines such as broadcast and gather have a single originating or receiving process.~~

~~Such a process is called the *root*. Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root. The reader is referred to Chapter [[versions/v31/sections/datatypes#Datatypes|Datatypes]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[versions/v31/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] for information on how to define groups and create communicators.~~

~~The type-matching conditions for the collective operations are more strict than the corresponding conditions between sender and receiver in point-to-point. Namely, for collective operations, the amount of data sent must exactly match the amount of data specified by the receiver.~~

~~Different type maps (the layout in memory, see Section [[versions/v31/sections/datatypes#Derived Datatypes|Derived Datatypes]] ) between sender and receiver are still allowed.~~

~~Collective operations can (but are not required to) complete as soon as the caller’s participation in the collective communication is finished. A blocking operation is complete as soon as the call returns. A nonblocking (immediate) call requires a separate completion call (cf. Section [[versions/v31/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] ). The completion of a collective operation indicates that the caller is free to modify locations in the communication buffer. It does not indicate that other processes in the group have completed or even started the operation (unless otherwise~~

~~implied by~~

~~the description of the operation).~~

~~Thus, a collective communication operation may, or may not, have the effect of synchronizing all calling processes. This statement excludes, of course, the barrier operation.~~

==One of the key arguments in a call to a collective routine is a communicator that defines the group or groups of participating processes and provides a context for the operation. This is discussed further in Section [[versions/v31/sections/coll#Communicator Argument|Communicator Argument]] . The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving processes as specified in Chapter [[versions/v31/sections/datatypes#Datatypes|Datatypes]] . Several collective routines such as broadcast and gather have a single originating or receiving process. Such a process is called the *root*. Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root. The reader is referred to Chapter [[versions/v31/sections/datatypes#Datatypes|Datatypes]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[versions/v31/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] for information on how to define groups and create communicators.==

==The type-matching conditions for the collective operations are more strict than the corresponding conditions between sender and receiver in point-to-point. Namely, for collective operations, the amount of data sent must exactly match the amount of data specified by the receiver. Different type maps (the layout in memory, see Section [[versions/v31/sections/datatypes#Derived Datatypes|Derived Datatypes]] ) between sender and receiver are still allowed.==

==Collective operations can (but are not required to) complete as soon as the caller’s participation in the collective communication is finished. A blocking operation is complete as soon as the call returns. A nonblocking (immediate) call requires a separate completion call (cf. Section [[versions/v31/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] ). The completion of a collective operation indicates that the caller is free to modify locations in the communication buffer. It does not indicate that other processes in the group have completed or even started the operation (unless otherwise implied by the description of the operation). Thus, a collective communication operation may, or may not, have the effect of synchronizing all calling processes. This statement excludes, of course, the barrier operation.==

> The equal-data restriction (on type matching) was made so as to avoid the complexity of providing a facility analogous to the status argument of ~~`MPI_RECV`~~ ==[[versions/v31/API/MPI_RECV|MPI_RECV]]== for discovering the amount of data sent. Some of the collective routines would require an array of status values. > > The statements about synchronization are made so as to allow a variety of implementations of the collective functions.

> While vendors may write optimized collective routines matched to their architectures, a complete library of the collective communication routines can be written entirely using the MPI point-to-point communication functions and a few auxiliary functions. If implementing on top of point-to-point, a hidden, special communicator ~~> >~~ might be created for the collective operation so as to avoid interference with any on-going point-to-point communication at the time of the collective call. This is discussed further in Section [[coll-correct]] .

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

- [[versions/v40/API/MPI_BARRIER|MPI_BARRIER]] , [[versions/v40/API/MPI_IBARRIER|MPI_IBARRIER]] ==, [[versions/v40/API/MPI_BARRIER_INIT|MPI_BARRIER_INIT]]== : Barrier synchronization across all members of a group (Section [[versions/v40/sections/coll#Barrier Synchronization|Barrier Synchronization]] ~~and~~ ==,== Section [[versions/v40/sections/coll#Nonblocking Barrier Synchronization|Nonblocking Barrier Synchronization]] ==, and Section [[versions/v40/sections/coll#Persistent Barrier Synchronization|Persistent Barrier Synchronization]]== ).

- [[versions/v40/API/MPI_BCAST|MPI_BCAST]] , [[versions/v40/API/MPI_IBCAST|MPI_IBCAST]] ==, [[versions/v40/API/MPI_BCAST_INIT|MPI_BCAST_INIT]]== : Broadcast from one member to all members of a group (Section [[versions/v40/sections/coll#Broadcast|Broadcast]] ~~and~~ ==,== Section [[versions/v40/sections/coll#Nonblocking Broadcast|Nonblocking ==Broadcast]] , and Section [[versions/v40/sections/coll#Persistent Broadcast|Persistent== Broadcast]] ). This is shown as “broadcast” in Figure [[versions/v40/sections/coll#Introduction and Overview|Introduction and Overview]] .

- [[versions/v40/API/MPI_GATHER|MPI_GATHER]] , [[versions/v40/API/MPI_IGATHER|MPI_IGATHER]] , ==[[versions/v40/API/MPI_GATHER_INIT|MPI_GATHER_INIT]] ,== [[versions/v40/API/MPI_GATHERV|MPI_GATHERV]] , [[versions/v40/API/MPI_IGATHERV|MPI_IGATHERV]] ==, [[versions/v40/API/MPI_GATHERV_INIT|MPI_GATHERV_INIT]] ,== : Gather data from all members of a group to one member (Section [[versions/v40/sections/coll#Gather|Gather]] ~~and~~ ==,== Section [[versions/v40/sections/coll#Nonblocking Gather|Nonblocking ==Gather]] , and Section [[versions/v40/sections/coll#Persistent Gather|Persistent== Gather]] ). This is shown as “gather” in Figure [[versions/v40/sections/coll#Introduction and Overview|Introduction and Overview]] .

- [[versions/v40/API/MPI_SCATTER|MPI_SCATTER]] , [[versions/v40/API/MPI_ISCATTER|MPI_ISCATTER]] , ==[[versions/v40/API/MPI_SCATTER_INIT|MPI_SCATTER_INIT]] ,== [[versions/v40/API/MPI_SCATTERV|MPI_SCATTERV]] , [[versions/v40/API/MPI_ISCATTERV|MPI_ISCATTERV]] ==, [[versions/v40/API/MPI_SCATTERV_INIT|MPI_SCATTERV_INIT]]== : Scatter data from one member to all members of a group (Section [[versions/v40/sections/coll#Scatter|Scatter]] ~~and~~ ==,== Section [[versions/v40/sections/coll#Nonblocking Scatter|Nonblocking ==Scatter]] , and Section [[versions/v40/sections/coll#Persistent Scatter|Persistent== Scatter]] ). This is shown as “scatter” in Figure [[versions/v40/sections/coll#Introduction and Overview|Introduction and Overview]] .

- [[versions/v40/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v40/API/MPI_IALLGATHER|MPI_IALLGATHER]] , ==[[versions/v40/API/MPI_ALLGATHER_INIT|MPI_ALLGATHER_INIT]] ,== [[versions/v40/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] , [[versions/v40/API/MPI_IALLGATHERV|MPI_IALLGATHERV]] ==, [[versions/v40/API/MPI_ALLGATHERV_INIT|MPI_ALLGATHERV_INIT]]== : A variation on Gather where all members of a group receive the result (Section [[versions/v40/sections/coll#Gather-to-all|Gather-to-all]] ~~and~~ ==,== Section [[versions/v40/sections/coll#Nonblocking Gather-to-all|Nonblocking ==Gather-to-all]] , and Section [[versions/v40/sections/coll#Persistent Gather-to-all|Persistent== Gather-to-all]] ). This is shown as “allgather” in Figure [[versions/v40/sections/coll#Introduction and Overview|Introduction and Overview]] .

- [[versions/v40/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v40/API/MPI_IALLTOALL|MPI_IALLTOALL]] , ==[[versions/v40/API/MPI_ALLTOALL_INIT|MPI_ALLTOALL_INIT]] ,== [[versions/v40/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , [[versions/v40/API/MPI_IALLTOALLV|MPI_IALLTOALLV]] , ==[[versions/v40/API/MPI_ALLTOALLV_INIT|MPI_ALLTOALLV_INIT]] ,== [[versions/v40/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] , [[versions/v40/API/MPI_IALLTOALLW|MPI_IALLTOALLW]] ==, [[versions/v40/API/MPI_ALLTOALLW_INIT|MPI_ALLTOALLW_INIT]]== : Scatter/Gather data from all members to all members of a group (also called complete exchange) (Section [[versions/v40/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] ~~and~~ ==,== Section [[versions/v40/sections/coll#Nonblocking All-to-All Scatter/Gather|Nonblocking ==All-to-All Scatter/Gather]] , and Section [[versions/v40/sections/coll#Persistent All-to-All Scatter/Gather|Persistent== All-to-All Scatter/Gather]] ). This is shown as “complete exchange” in Figure [[versions/v40/sections/coll#Introduction and Overview|Introduction and Overview]] .

- [[versions/v40/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , [[versions/v40/API/MPI_IALLREDUCE|MPI_IALLREDUCE]] , ==[[versions/v40/API/MPI_ALLREDUCE_INIT|MPI_ALLREDUCE_INIT]] ,== [[versions/v40/API/MPI_REDUCE|MPI_REDUCE]] , [[versions/v40/API/MPI_IREDUCE|MPI_IREDUCE]] ==, [[versions/v40/API/MPI_REDUCE_INIT|MPI_REDUCE_INIT]]== : Global reduction operations such as sum, max, min, or user-defined functions, where the result is returned to all members of a group (Section [[versions/v40/sections/coll#All-Reduce|All-Reduce]] ~~and~~ ==,== Section [[versions/v40/sections/coll#Nonblocking All-Reduce|Nonblocking ==All-Reduce]] , and Section [[versions/v40/sections/coll#Persistent All-Reduce|Persistent== All-Reduce]] ) and a variation where the result is returned to only one member (Section [[global-reduce]] ~~and~~ ==,== Section [[versions/v40/sections/coll#Nonblocking Reduce|Nonblocking Reduce]] ==, and Section [[versions/v40/sections/coll#Persistent Reduce|Persistent Reduce]]== ).

- [[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] , [[versions/v40/API/MPI_IREDUCE_SCATTER_BLOCK|MPI_IREDUCE_SCATTER_BLOCK]] , ==[[versions/v40/API/MPI_REDUCE_SCATTER_BLOCK_INIT|MPI_REDUCE_SCATTER_BLOCK_INIT]] ,== [[versions/v40/API/MPI_REDUCE_SCATTER|MPI_REDUCE_SCATTER]] , [[versions/v40/API/MPI_IREDUCE_SCATTER|MPI_IREDUCE_SCATTER]] ==, [[versions/v40/API/MPI_REDUCE_SCATTER_INIT|MPI_REDUCE_SCATTER_INIT]]== : A combined reduction and scatter operation (Section [[versions/v40/sections/coll#Reduce-Scatter|Reduce-Scatter]] , Section [[versions/v40/sections/coll#Nonblocking Reduce-Scatter with Equal Blocks|Nonblocking Reduce-Scatter with Equal Blocks]] , ~~and~~ Section [[versions/v40/sections/coll#Nonblocking Reduce-Scatter|Nonblocking Reduce-Scatter]] ==, Section [[versions/v40/sections/coll#Persistent Reduce-Scatter with Equal Blocks|Persistent Reduce-Scatter with Equal Blocks]] , and Section [[versions/v40/sections/coll#Persistent Reduce-Scatter|Persistent Reduce-Scatter]]== ).

- [[versions/v40/API/MPI_SCAN|MPI_SCAN]] , [[versions/v40/API/MPI_ISCAN|MPI_ISCAN]] , ==[[versions/v40/API/MPI_SCAN_INIT|MPI_SCAN_INIT]] ,== [[versions/v40/API/MPI_EXSCAN|MPI_EXSCAN]] , [[versions/v40/API/MPI_IEXSCAN|MPI_IEXSCAN]] ==, [[versions/v40/API/MPI_EXSCAN_INIT|MPI_EXSCAN_INIT]]== : Scan across all members of a group (also called prefix) (Section [[versions/v40/sections/coll#Scan|Scan]] , Section [[versions/v40/sections/coll#Exclusive Scan|Exclusive Scan]] , Section [[versions/v40/sections/coll#Nonblocking Inclusive Scan|Nonblocking Inclusive Scan]] , ~~and~~ Section [[versions/v40/sections/coll#Nonblocking Exclusive Scan|Nonblocking Exclusive Scan]] ==, Section [[versions/v40/sections/coll#Persistent Inclusive Scan|Persistent Inclusive Scan]] , and Section [[versions/v40/sections/coll#Persistent Exclusive Scan|Persistent Exclusive Scan]]== ).

Collective operations can (but are not required to) complete as soon as the caller’s participation in the collective communication is finished. A blocking operation is complete as soon as the call returns. A nonblocking (immediate) call requires a separate completion call (cf. Section [[versions/v40/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] ). The completion of a collective operation indicates that the caller is free to modify locations in the communication buffer. It does not indicate that other processes in the group have completed or even started the operation (unless otherwise implied by the description of the operation). Thus, a collective communication operation may, or may not, have the effect of synchronizing all ~~calling~~ ==participating MPI== processes. ~~This statement excludes, of course, the barrier operation.~~

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

Collective communication is defined as communication that involves a group or groups of ==MPI== processes. The functions of this type provided by MPI are the following:

*Figure: Collective move functions illustrated for a group of six ==MPI== processes. In each case, each row of boxes represents data locations in one ==MPI== process. Thus, in the broadcast, initially just the first ==MPI== process contains the data $`A_0`$, but after the broadcast all ==MPI== processes contain it.*

One of the key arguments in a call to a collective routine is a communicator that defines the group or groups of participating ==MPI== processes and provides a context for the operation. This is discussed further in Section [[versions/v41/sections/coll#Communicator Argument|Communicator Argument]] . The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving ==MPI== processes as specified in Chapter [[versions/v41/sections/datatypes#Datatypes|Datatypes]] . Several collective routines such as broadcast and gather have a single originating or receiving ==MPI== process. Such ~~a~~ ==an MPI== process is called the ~~*root*.~~ ==**root**.== Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root. The reader is referred to Chapter [[versions/v41/sections/datatypes#Datatypes|Datatypes]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[versions/v41/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] for information on how to define groups and create communicators.

Collective operations can (but are not required to) complete as soon as the caller’s participation in the collective communication is finished. A blocking operation is complete as soon as the call returns. A nonblocking (immediate) call requires a separate completion call (cf. Section [[versions/v41/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] ). The completion of a collective operation indicates that the caller is free to modify locations in the communication buffer. It does not indicate that other ==MPI== processes in the group have completed or even started the operation (unless otherwise implied by the description of the operation). Thus, a collective communication operation may, or may not, have the effect of synchronizing all participating MPI processes.

Many of the descriptions of the collective routines provide illustrations in terms of blocking MPI point-to-point routines. These are intended solely to indicate what data is sent or received by ~~what~~ ==which MPI== process. Many of these examples are *not* correct MPI programs; for purposes of simplicity, they often assume infinite buffering.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

- [[versions/v50/API/MPI_ALLGATHER|MPI_ALLGATHER]] , [[versions/v50/API/MPI_IALLGATHER|MPI_IALLGATHER]] , [[versions/v50/API/MPI_ALLGATHER_INIT|MPI_ALLGATHER_INIT]] , [[versions/v50/API/MPI_ALLGATHERV|MPI_ALLGATHERV]] , [[versions/v50/API/MPI_IALLGATHERV|MPI_IALLGATHERV]] , [[versions/v50/API/MPI_ALLGATHERV_INIT|MPI_ALLGATHERV_INIT]] : A variation on Gather where all members of a group receive the result (Section ~~[[versions/v50/sections/coll#Gather-to-all|Gather-to-all]]~~ ==[[versions/v50/sections/coll#All-Gather|All-Gather]]== , Section [[versions/v50/sections/coll#Nonblocking ~~Gather-to-all|Nonblocking Gather-to-all]]~~ ==All-Gather|Nonblocking All-Gather]]== , and Section [[versions/v50/sections/coll#Persistent ~~Gather-to-all|Persistent Gather-to-all]]~~ ==All-Gather|Persistent All-Gather]]== ). This is shown as “allgather” in Figure [[versions/v50/sections/coll#Introduction and Overview|Introduction and Overview]] .

~~One of the key arguments in a call to a collective routine is a communicator that defines the group or groups of participating MPI processes and provides a context for the operation. This is discussed further in Section [[versions/v50/sections/coll#Communicator Argument|Communicator Argument]] . The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving MPI processes as specified in Chapter [[versions/v50/sections/datatypes#Datatypes|Datatypes]] . Several collective routines such as broadcast and gather have a single originating or receiving MPI process. Such an MPI process is called the **root**. Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root. The reader is referred to Chapter [[versions/v50/sections/datatypes#Datatypes|Datatypes]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[versions/v50/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] for information on how to define groups and create communicators.~~

==One of the key arguments in a call to a collective routine is a communicator that defines the group or groups of participating MPI processes and provides a context for the operation. This is discussed further in Section [[versions/v50/sections/coll#Communicator Argument|Communicator Argument]] . The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving MPI processes as specified in Chapter [[versions/v50/sections/datatypes#Datatypes|Datatypes]] . Several collective routines such as broadcast and gather have a single originating or receiving MPI process. Such an MPI process is called the **root**. Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root.==

==> [!note] Advice to users==

==> Note that the programmer is still responsible for avoiding undefined behavior in the host language by not passing uninitialized values to MPI procedure calls.==

==The reader is referred to Chapter [[versions/v50/sections/datatypes#Datatypes|Datatypes]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[versions/v50/sections/context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] for information on how to define groups and create communicators.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Introduction and Overview]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Introduction and Overview]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Introduction and Overview]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Introduction and Overview]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Introduction and Overview]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Introduction and Overview]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Introduction and Overview]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Introduction and Overview]]

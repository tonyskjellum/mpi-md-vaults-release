# Collective Communication



## Introduction and Overview



Collective communication is defined as communication that involves a group or groups of processes. The functions of this type provided by MPI are the following:

- [[MPI_BARRIER]] , [[MPI_IBARRIER]] , [[MPI_BARRIER_INIT]] : Barrier synchronization across all members of a group (Section [[coll#Barrier Synchronization|Barrier Synchronization]] , Section [[coll#Nonblocking Barrier Synchronization|Nonblocking Barrier Synchronization]] , and Section [[coll#Persistent Barrier Synchronization|Persistent Barrier Synchronization]] ).

- [[MPI_BCAST]] , [[MPI_IBCAST]] , [[MPI_BCAST_INIT]] : Broadcast from one member to all members of a group (Section [[coll#Broadcast|Broadcast]] , Section [[coll#Nonblocking Broadcast|Nonblocking Broadcast]] , and Section [[coll#Persistent Broadcast|Persistent Broadcast]] ). This is shown as “broadcast” in Figure [[coll#Introduction and Overview|Introduction and Overview]] .

- [[MPI_GATHER]] , [[MPI_IGATHER]] , [[MPI_GATHER_INIT]] , [[MPI_GATHERV]] , [[MPI_IGATHERV]] , [[MPI_GATHERV_INIT]] , : Gather data from all members of a group to one member (Section [[coll#Gather|Gather]] , Section [[coll#Nonblocking Gather|Nonblocking Gather]] , and Section [[coll#Persistent Gather|Persistent Gather]] ). This is shown as “gather” in Figure [[coll#Introduction and Overview|Introduction and Overview]] .

- [[MPI_SCATTER]] , [[MPI_ISCATTER]] , [[MPI_SCATTER_INIT]] , [[MPI_SCATTERV]] , [[MPI_ISCATTERV]] , [[MPI_SCATTERV_INIT]] : Scatter data from one member to all members of a group (Section [[coll#Scatter|Scatter]] , Section [[coll#Nonblocking Scatter|Nonblocking Scatter]] , and Section [[coll#Persistent Scatter|Persistent Scatter]] ). This is shown as “scatter” in Figure [[coll#Introduction and Overview|Introduction and Overview]] .

- [[MPI_ALLGATHER]] , [[MPI_IALLGATHER]] , [[MPI_ALLGATHER_INIT]] , [[MPI_ALLGATHERV]] , [[MPI_IALLGATHERV]] , [[MPI_ALLGATHERV_INIT]] : A variation on Gather where all members of a group receive the result (Section [[coll#Gather-to-all|Gather-to-all]] , Section [[coll#Nonblocking Gather-to-all|Nonblocking Gather-to-all]] , and Section [[coll#Persistent Gather-to-all|Persistent Gather-to-all]] ). This is shown as “allgather” in Figure [[coll#Introduction and Overview|Introduction and Overview]] .

- [[MPI_ALLTOALL]] , [[MPI_IALLTOALL]] , [[MPI_ALLTOALL_INIT]] , [[MPI_ALLTOALLV]] , [[MPI_IALLTOALLV]] , [[MPI_ALLTOALLV_INIT]] , [[MPI_ALLTOALLW]] , [[MPI_IALLTOALLW]] , [[MPI_ALLTOALLW_INIT]] : Scatter/Gather data from all members to all members of a group (also called complete exchange) (Section [[coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] , Section [[coll#Nonblocking All-to-All Scatter/Gather|Nonblocking All-to-All Scatter/Gather]] , and Section [[coll#Persistent All-to-All Scatter/Gather|Persistent All-to-All Scatter/Gather]] ). This is shown as “complete exchange” in Figure [[coll#Introduction and Overview|Introduction and Overview]] .

- [[MPI_ALLREDUCE]] , [[MPI_IALLREDUCE]] , [[MPI_ALLREDUCE_INIT]] , [[MPI_REDUCE]] , [[MPI_IREDUCE]] , [[MPI_REDUCE_INIT]] : Global reduction operations such as sum, max, min, or user-defined functions, where the result is returned to all members of a group (Section [[coll#All-Reduce|All-Reduce]] , Section [[coll#Nonblocking All-Reduce|Nonblocking All-Reduce]] , and Section [[coll#Persistent All-Reduce|Persistent All-Reduce]] ) and a variation where the result is returned to only one member (Section [[global-reduce]] , Section [[coll#Nonblocking Reduce|Nonblocking Reduce]] , and Section [[coll#Persistent Reduce|Persistent Reduce]] ).

- [[MPI_REDUCE_SCATTER_BLOCK]] , [[MPI_IREDUCE_SCATTER_BLOCK]] , [[MPI_REDUCE_SCATTER_BLOCK_INIT]] , [[MPI_REDUCE_SCATTER]] , [[MPI_IREDUCE_SCATTER]] , [[MPI_REDUCE_SCATTER_INIT]] : A combined reduction and scatter operation (Section [[coll#Reduce-Scatter|Reduce-Scatter]] , Section [[coll#Nonblocking Reduce-Scatter with Equal Blocks|Nonblocking Reduce-Scatter with Equal Blocks]] , Section [[coll#Nonblocking Reduce-Scatter|Nonblocking Reduce-Scatter]] , Section [[coll#Persistent Reduce-Scatter with Equal Blocks|Persistent Reduce-Scatter with Equal Blocks]] , and Section [[coll#Persistent Reduce-Scatter|Persistent Reduce-Scatter]] ).

- [[MPI_SCAN]] , [[MPI_ISCAN]] , [[MPI_SCAN_INIT]] , [[MPI_EXSCAN]] , [[MPI_IEXSCAN]] , [[MPI_EXSCAN_INIT]] : Scan across all members of a group (also called prefix) (Section [[coll#Scan|Scan]] , Section [[coll#Exclusive Scan|Exclusive Scan]] , Section [[coll#Nonblocking Inclusive Scan|Nonblocking Inclusive Scan]] , Section [[coll#Nonblocking Exclusive Scan|Nonblocking Exclusive Scan]] , Section [[coll#Persistent Inclusive Scan|Persistent Inclusive Scan]] , and Section [[coll#Persistent Exclusive Scan|Persistent Exclusive Scan]] ).

*Figure: Collective move functions illustrated for a group of six processes. In each case, each row of boxes represents data locations in one process. Thus, in the broadcast, initially just the first process contains the data $`A_0`$, but after the broadcast all processes contain it.*

One of the key arguments in a call to a collective routine is a communicator that defines the group or groups of participating processes and provides a context for the operation. This is discussed further in Section [[coll#Communicator Argument|Communicator Argument]] . The syntax and semantics of the collective operations are defined to be consistent with the syntax and semantics of the point-to-point operations. Thus, general datatypes are allowed and must match between sending and receiving processes as specified in Chapter [[datatypes#Datatypes|Datatypes]] . Several collective routines such as broadcast and gather have a single originating or receiving process. Such a process is called the *root*. Some arguments in the collective functions are specified as “significant only at root,” and are ignored for all participants except the root. The reader is referred to Chapter [[datatypes#Datatypes|Datatypes]] for information concerning communication buffers, general datatypes and type matching rules, and to Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] for information on how to define groups and create communicators.

The type-matching conditions for the collective operations are more strict than the corresponding conditions between sender and receiver in point-to-point. Namely, for collective operations, the amount of data sent must exactly match the amount of data specified by the receiver. Different type maps (the layout in memory, see Section [[datatypes#Derived Datatypes|Derived Datatypes]] ) between sender and receiver are still allowed.

Collective operations can (but are not required to) complete as soon as the caller’s participation in the collective communication is finished. A blocking operation is complete as soon as the call returns. A nonblocking (immediate) call requires a separate completion call (cf. Section [[pt2pt#Nonblocking Communication|Nonblocking Communication]] ). The completion of a collective operation indicates that the caller is free to modify locations in the communication buffer. It does not indicate that other processes in the group have completed or even started the operation (unless otherwise implied by the description of the operation). Thus, a collective communication operation may, or may not, have the effect of synchronizing all participating MPI processes.

Collective communication calls may use the same communicators as point-to-point communication; MPI guarantees that messages generated on behalf of collective communication calls will not be confused with messages generated by point-to-point communication. The collective operations do not have a message tag argument. A more detailed discussion of correct use of collective routines is found in Section [[coll-correct]] .

> [!tip] Rationale

> The equal-data restriction (on type matching) was made so as to avoid the complexity of providing a facility analogous to the status argument of [[MPI_RECV]] for discovering the amount of data sent. Some of the collective routines would require an array of status values.
>
> The statements about synchronization are made so as to allow a variety of implementations of the collective functions.

> [!note] Advice to users

> It is dangerous to rely on synchronization side-effects of the collective operations for program correctness. For example, even though a particular implementation may provide a broadcast routine with a side-effect of synchronization, the standard does not require this, and a program that relies on this will not be portable.
>
> On the other hand, a correct, portable program must allow for the fact that a collective call *may* be synchronizing. Though one cannot rely on any synchronization side-effect, one must program so as to allow it. These issues are discussed further in Section [[coll-correct]] .

> [!warning] Advice to implementors

> While vendors may write optimized collective routines matched to their architectures, a complete library of the collective communication routines can be written entirely using the MPI point-to-point communication functions and a few auxiliary functions. If implementing on top of point-to-point, a hidden, special communicator might be created for the collective operation so as to avoid interference with any on-going point-to-point communication at the time of the collective call. This is discussed further in Section [[coll-correct]] .

Many of the descriptions of the collective routines provide illustrations in terms of blocking MPI point-to-point routines. These are intended solely to indicate what data is sent or received by what process. Many of these examples are *not* correct MPI programs; for purposes of simplicity, they often assume infinite buffering.

## Communicator Argument



The key concept of the collective functions is to have a group or groups of participating processes. The routines do not have group identifiers as explicit arguments. Instead, there is a communicator argument. Groups and communicators are discussed in full detail in Chapter [[context#Groups, Contexts, Communicators, and Caching|Groups, Contexts, Communicators, and Caching]] . For the purposes of this chapter, it is sufficient to know that there are two types of communicators: *intra-communicators* and *inter-communicators*. An intra-communicator can be thought of as an identifier for a single group of processes linked with a context. An inter-communicator identifies two distinct groups of processes linked with a context.

### Specifics for Intra-Communicator Collective Operations

All processes in the group identified by the intra-communicator must call the collective routine.

In many cases, collective communication can occur “in place” for intra-communicators, with the output buffer being identical to the input buffer. This is specified by providing a special argument value, `MPI_IN_PLACE`, instead of the send buffer or the receive buffer argument, depending on the operation performed.

> [!tip] Rationale

> The “in place” operations are provided to reduce unnecessary memory motion by both the MPI implementation and by the user. Note that while the simple check of testing whether the send and receive buffers have the same address will work for some cases (e.g., [[MPI_ALLREDUCE]] ), they are inadequate in others (e.g., [[MPI_GATHER]] , with root not equal to zero). Further, Fortran explicitly prohibits aliasing of arguments; the approach of using a special value to denote “in place” operation eliminates that difficulty.

> [!note] Advice to users

> By allowing the “in place” option, the receive buffer in many of the collective calls becomes a send-and-receive buffer. For this reason, a Fortran binding that includes `INTENT` must mark these as `INOUT`, not `OUT`.
>
> Note that `MPI_IN_PLACE` is a special kind of value; it has the same restrictions on its use that `MPI_BOTTOM` has (not usable in Fortran for initialization or assignment). See Section [[terms#Named Constants|Named Constants]] .

### Applying Collective Operations to Inter-Communicators



To understand how collective operations apply to inter-communicators, we can view most MPI intra-communicator collective operations as fitting one of the following categories (see, for instance, ):

All-To-All  
All processes contribute to the result. All processes receive the result.

- [[MPI_ALLGATHER]] , [[MPI_IALLGATHER]] , [[MPI_ALLGATHER_INIT]] , [[MPI_ALLGATHERV]] , [[MPI_IALLGATHERV]] , [[MPI_ALLGATHERV_INIT]]

- [[MPI_ALLTOALL]] , [[MPI_IALLTOALL]] , [[MPI_ALLTOALL_INIT]] , [[MPI_ALLTOALLV]] , [[MPI_IALLTOALLV]] , [[MPI_ALLTOALLV_INIT]] , [[MPI_ALLTOALLW]] , [[MPI_IALLTOALLW]] , [[MPI_ALLTOALLW_INIT]]

- [[MPI_ALLREDUCE]] , [[MPI_IALLREDUCE]] , [[MPI_ALLREDUCE_INIT]] , [[MPI_REDUCE_SCATTER_BLOCK]] , [[MPI_IREDUCE_SCATTER_BLOCK]] , [[MPI_REDUCE_SCATTER_BLOCK_INIT]] , [[MPI_REDUCE_SCATTER]] , [[MPI_IREDUCE_SCATTER]] , [[MPI_REDUCE_SCATTER_INIT]]

- [[MPI_BARRIER]] , [[MPI_IBARRIER]] , [[MPI_BARRIER_INIT]]

All-To-One  
All processes contribute to the result. One process receives the result.

- [[MPI_GATHER]] , [[MPI_IGATHER]] , [[MPI_GATHER_INIT]] , [[MPI_GATHERV]] , [[MPI_IGATHERV]] , [[MPI_GATHERV_INIT]]

- [[MPI_REDUCE]] , [[MPI_IREDUCE]] , [[MPI_REDUCE_INIT]] ,

One-To-All  
One process contributes to the result. All processes receive the result.

- [[MPI_BCAST]] , [[MPI_IBCAST]] , [[MPI_BCAST_INIT]]

- [[MPI_SCATTER]] , [[MPI_ISCATTER]] , [[MPI_SCATTER_INIT]] , [[MPI_SCATTERV]] , [[MPI_ISCATTERV]] , [[MPI_SCATTERV_INIT]]

Other  
Collective operations that do not fit into one of the above categories.

- [[MPI_SCAN]] , [[MPI_ISCAN]] , [[MPI_SCAN_INIT]] [[MPI_EXSCAN]] , [[MPI_IEXSCAN]] , [[MPI_EXSCAN_INIT]]

The data movement patterns of [[MPI_SCAN]] , [[MPI_ISCAN]] , [[MPI_EXSCAN]] , and [[MPI_IEXSCAN]] do not fit this taxonomy.

The application of collective communication to inter-communicators is best described in terms of two groups. For example, an all-to-all [[MPI_ALLGATHER]] operation can be described as collecting data from all members of one group with the result appearing in all members of the other group (see Figure [[coll#Applying Collective Operations to Inter-Communicators|Applying Collective Operations to Inter-Communicators]] ). As another example, a one-to-all [[MPI_BCAST]] operation sends data from one member of one group to all members of the other group. Collective computation operations such as [[MPI_REDUCE_SCATTER]] have a similar interpretation (see Figure [[coll#Applying Collective Operations to Inter-Communicators|Applying Collective Operations to Inter-Communicators]] ). For intra-communicators, these two groups are the same. For inter-communicators, these two groups are distinct. For the all-to-all operations, each such operation is described in two phases, so that it has a symmetric, full-duplex behavior.

The following collective operations also apply to inter-communicators:

- [[MPI_BARRIER]] , [[MPI_IBARRIER]] , [[MPI_BARRIER_INIT]] ,

- [[MPI_BCAST]] , [[MPI_IBCAST]] , [[MPI_BCAST_INIT]] ,

- [[MPI_GATHER]] , [[MPI_IGATHER]] , [[MPI_GATHER_INIT]] , [[MPI_GATHERV]] , [[MPI_IGATHERV]] , [[MPI_GATHERV_INIT]] ,

- [[MPI_SCATTER]] , [[MPI_ISCATTER]] , [[MPI_SCATTER_INIT]] , [[MPI_SCATTERV]] , [[MPI_ISCATTERV]] , [[MPI_SCATTERV_INIT]] ,

- [[MPI_ALLGATHER]] , [[MPI_IALLGATHER]] , [[MPI_ALLGATHER_INIT]] , [[MPI_ALLGATHERV]] , [[MPI_IALLGATHERV]] , [[MPI_ALLGATHERV_INIT]] ,

- [[MPI_ALLTOALL]] , [[MPI_IALLTOALL]] , [[MPI_ALLTOALL_INIT]] , [[MPI_ALLTOALLV]] , [[MPI_IALLTOALLV]] , [[MPI_ALLTOALLV_INIT]] , [[MPI_ALLTOALLW]] , [[MPI_IALLTOALLW]] , [[MPI_ALLTOALLW_INIT]] ,

- [[MPI_ALLREDUCE]] , [[MPI_IALLREDUCE]] , [[MPI_ALLREDUCE_INIT]] , [[MPI_REDUCE]] , [[MPI_IREDUCE]] , MPI_REDUCE_INIT,

- [[MPI_REDUCE_SCATTER_BLOCK]] , [[MPI_IREDUCE_SCATTER_BLOCK]] , [[MPI_REDUCE_SCATTER_BLOCK_INIT]] , [[MPI_REDUCE_SCATTER]] , [[MPI_IREDUCE_SCATTER]] , [[MPI_REDUCE_SCATTER_INIT]] .

*Figure: Inter-communicator allgather. The focus of data to one process is represented, not mandated by the semantics. The two phases do allgathers in both directions.*

*Figure: Inter-communicator reduce-scatter. The focus of data to one process is represented, not mandated by the semantics. The two phases do reduce-scatters in both directions.*

### Specifics for Inter-Communicator Collective Operations

All processes in both groups identified by the inter-communicator must call the collective routine.

Note that the “in place” option for intra-communicators does not apply to inter-communicators since in the inter-communicator case there is no communication from a process to itself.

For inter-communicator collective communication, if the operation is in the All-To-One or One-To-All categories, then the transfer is unidirectional. The direction of the transfer is indicated by a special value of the root argument. In this case, for the group containing the root process, all processes in the group must call the routine using a special argument for the root. For this, the root process uses the special root value `MPI_ROOT`; all other processes in the same group as the root use `MPI_PROC_NULL`. All processes in the other group (the group that is the remote group relative to the root process) must call the collective routine and provide the rank of the root. If the operation is in the All-To-All category, then the transfer is bidirectional.

> [!tip] Rationale

> Operations in the All-To-One and One-To-All categories are unidirectional by nature, and there is a clear way of specifying direction. Operations in the All-To-All category will often occur as part of an exchange, where it makes sense to communicate in both directions at once.

## Barrier Synchronization



![[API/MPI_BARRIER]]

If `comm` is an intra-communicator, [[MPI_BARRIER]] blocks the caller until all group members have called it. The call returns at any process only after all group members have entered the call.

If `comm` is an inter-communicator, [[MPI_BARRIER]] involves two groups. The call returns at processes in one group (group A) of the inter-communicator only after all members of the other group (group B) have entered the call (and vice versa). A process may return from the call before all processes in its own group have entered the call.

## Broadcast



![[API/MPI_BCAST]]

If `comm` is an intra-communicator, [[MPI_BCAST]] broadcasts a message from the process with rank `root` to all processes of the group, itself included. It is called by all members of the group using the same arguments for `comm` and `root`. On return, the content of `root`’s buffer is copied to all other processes.

General, derived datatypes are allowed for `datatype`. The type signature of `count`, `datatype` on any process must be equal to the type signature of `count`, `datatype` at the root. This implies that the amount of data sent must be equal to the amount received, pairwise between each process and the root. [[MPI_BCAST]] and all other data-movement collective routines make this restriction. Distinct type maps between sender and receiver are still allowed.

The “in place” option is not meaningful here.

If `comm` is an inter-communicator, then the call involves all processes in the inter-communicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is broadcast from the root to all processes in group B. The buffer arguments of the processes in group B must be consistent with the buffer argument of the root.

### Example using [[MPI_BCAST]]

The examples in this section use intra-communicators.

Z

Broadcast 100 `int`s from process `0` to every process in the group.

        MPI_Comm comm;
        int array[100];
        int root=0;
        ...
        MPI_Bcast(array, 100, MPI_INT, root, comm);

As in many of our example code fragments, we assume that some of the variables (such as `comm` in the above) have been assigned appropriate values.

## Gather



![[API/MPI_GATHER]]

If `comm` is an intra-communicator, each process (root process included) sends the contents of its send buffer to the root process. The root process receives the messages and stores them in rank order. The outcome is *as if* each of the `n` processes in the group (including the root process) had executed a call to

MPI_Send(sendbuf, sendcount, sendtype, root , ...),

and the root had executed `n` calls to

MPI_Recv(recvbuf+i$`\cdot`$ recvcount$`\cdot`$ extent(recvtype), recvcount, recvtype, i,...),

where `extent(recvtype)` is the type extent obtained from a call to `MPI_Type_get_extent`.

An alternative description is that the `n` messages sent by the processes in the group are concatenated in rank order, and the resulting message is received by the root as if by a call to [[MPI_RECV]] .

The receive buffer is ignored for all non-root processes.

General, derived datatypes are allowed for both `sendtype` and `recvtype`. The type signature of `sendcount`, `sendtype` on each process must be equal to the type signature of `recvcount`, `recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.

All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf`, `sendcount`, `sendtype`, `root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.

The specification of counts and types should not cause any location on the root to be written more than once. Such a call is erroneous.

Note that the `recvcount` argument at the root indicates the number of items it receives from *each* process, not the total number of items it receives.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer.

If `comm` is an inter-communicator, then the call involves all processes in the inter-communicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.

![[API/MPI_GATHERV]]

[[MPI_GATHERV]] extends the functionality of [[MPI_GATHER]] by allowing a varying count of data from each process, since `recvcounts` is now an array. It also allows more flexibility as to where the data is placed on the root, by providing the new argument, `displs`.

If `comm` is an intra-communicator, the outcome is *as if* each process, including the root process, sends a message to the root,

MPI_Send(sendbuf, sendcount, sendtype, root, ...),

and the root executes `n` receives,

MPI_Recv(recvbuf+displs\[j\]$`\cdot`$ extent(recvtype), recvcounts\[j\], recvtype, i, ...).

The data received from process `j` is placed into `recvbuf` of the `root` process beginning at offset `displs[j]` elements (in terms of the `recvtype`).

The receive buffer is ignored for all non-root processes.

The type signature implied by `sendcount`, `sendtype` on process `i` must be equal to the type signature implied by `recvcounts[i]`, `recvtype` at the root. This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed, as illustrated in Example [[coll-exD]] .

All arguments to the function are significant on process `root`, while on other processes, only arguments `sendbuf`, `sendcount`, `sendtype`, `root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.

The specification of counts, types, and displacements should not cause any location on the root to be written more than once. Such a call is erroneous.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` as the value of `sendbuf` at the root. In such a case, `sendcount` and `sendtype` are ignored, and the contribution of the root to the gathered vector is assumed to be already in the correct place in the receive buffer.

If `comm` is an inter-communicator, then the call involves all processes in the inter-communicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is gathered from all processes in group B to the root. The send buffer arguments of the processes in group B must be consistent with the receive buffer argument of the root.

### Examples using [[MPI_GATHER]] , [[MPI_GATHERV]]

The examples in this section use intra-communicators.



Gather 100 `int`s from every process in group to root. See Figure [[coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .

        MPI_Comm comm;
        int gsize,sendarray[100];
        int root, *rbuf;
        ...
        MPI_Comm_size(comm, &gsize);
        rbuf = (int *)malloc(gsize*100*sizeof(int));
        MPI_Gather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);



Previous example modified—only the root allocates memory for the receive buffer.

        MPI_Comm comm;
        int gsize,sendarray[100];
        int root, myrank, *rbuf;
        ...
        MPI_Comm_rank(comm, &myrank);
        if (myrank == root) {
           MPI_Comm_size(comm, &gsize);
           rbuf = (int *)malloc(gsize*100*sizeof(int));
        }
        MPI_Gather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);

*Figure: The root process gathers 100 `int`s from each process in the group.*



Do the same as the previous example, but use a derived datatype. Note that the type cannot be the entire set of `gsize*100 int`s since type matching is defined pairwise between the root and each process in the gather.

        MPI_Comm comm;
        int gsize,sendarray[100];
        int root, *rbuf;
        MPI_Datatype rtype;
        ...
        MPI_Comm_size(comm, &gsize);
        MPI_Type_contiguous(100, MPI_INT, &rtype);
        MPI_Type_commit(&rtype);
        rbuf = (int *)malloc(gsize*100*sizeof(int));
        MPI_Gather(sendarray, 100, MPI_INT, rbuf, 1, rtype, root, comm);



Now have each process send 100 `int`s to root, but place each set (of 100) `stride int`s apart at receiving end. Use [[MPI_GATHERV]] and the `displs` argument to achieve this effect. Assume $`stride \geq 100`$. See Figure [[coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .

        MPI_Comm comm;
        int gsize,sendarray[100];
        int root, *rbuf, stride;
        int *displs,i,*rcounts;

        ...

        MPI_Comm_size(comm, &gsize);
        rbuf = (int *)malloc(gsize*stride*sizeof(int));
        displs = (int *)malloc(gsize*sizeof(int));
        rcounts = (int *)malloc(gsize*sizeof(int));
        for (i=0; i<gsize; ++i) {
            displs[i] = i*stride;
            rcounts[i] = 100;
        }
        MPI_Gatherv(sendarray, 100, MPI_INT, rbuf, rcounts, displs, MPI_INT,
                    root, comm);

Note that the program is erroneous if $`stride < 100`$.

*Figure: The root process gathers 100 `int`s from each process in the group, each set is placed `stride int`s apart.*



Same as Example [[coll-exC]] on the receiving side, but send the 100 `int`s from the 0th column of a 100$`\times`$<!-- -->150 `int` array, in C. See Figure [[coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .

        MPI_Comm comm;
        int gsize,sendarray[100][150];
        int root, *rbuf, stride;
        MPI_Datatype stype;
        int *displs,i,*rcounts;

        ...

        MPI_Comm_size(comm, &gsize);
        rbuf = (int *)malloc(gsize*stride*sizeof(int));
        displs = (int *)malloc(gsize*sizeof(int));
        rcounts = (int *)malloc(gsize*sizeof(int));
        for (i=0; i<gsize; ++i) {
            displs[i] = i*stride;
            rcounts[i] = 100;
        }
        /* Create datatype for 1 column of array
         */
        MPI_Type_vector(100, 1, 150, MPI_INT, &stype);
        MPI_Type_commit(&stype);
        MPI_Gatherv(sendarray, 1, stype, rbuf, rcounts, displs, MPI_INT,
                    root, comm);

*Figure: The root process gathers column `0` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s apart.*



Process `i` sends `(100-i) int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. It is received into a buffer with stride, as in the previous two examples. See Figure [[coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .

        MPI_Comm comm;
        int gsize,sendarray[100][150],*sptr;
        int root, *rbuf, stride, myrank;
        MPI_Datatype stype;
        int *displs,i,*rcounts;

        ...

        MPI_Comm_size(comm, &gsize);
        MPI_Comm_rank(comm, &myrank);
        rbuf = (int *)malloc(gsize*stride*sizeof(int));
        displs = (int *)malloc(gsize*sizeof(int));
        rcounts = (int *)malloc(gsize*sizeof(int));
        for (i=0; i<gsize; ++i) {
            displs[i] = i*stride;
            rcounts[i] = 100-i;     /* note change from previous example */
        }
        /* Create datatype for the column we are sending
         */
        MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &stype);
        MPI_Type_commit(&stype);
        /* sptr is the address of start of "myrank" column
         */
        sptr = &sendarray[0][myrank];
        MPI_Gatherv(sptr, 1, stype, rbuf, rcounts, displs, MPI_INT,
                    root, comm);

Note that a different amount of data is received from each process.

*Figure: The root process gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s apart.*



Same as Example [[coll-exE]] , but done in a different way at the sending end. We create a datatype that causes the correct striding at the sending end so that we read a column of a C array. A similar thing was done in Example [[pt2pt-exFF]] , Section [[datatypes#Examples|Examples]] .

        MPI_Comm comm;
        int gsize, sendarray[100][150], *sptr;
        int root, *rbuf, stride, myrank;
        MPI_Datatype stype;
        int *displs, i, *rcounts;

        ...

        MPI_Comm_size(comm, &gsize);
        MPI_Comm_rank(comm, &myrank);
        rbuf = (int *)malloc(gsize*stride*sizeof(int));
        displs = (int *)malloc(gsize*sizeof(int));
        rcounts = (int *)malloc(gsize*sizeof(int));
        for (i=0; i<gsize; ++i) {
            displs[i] = i*stride;
            rcounts[i] = 100-i;
        }
        /* Create datatype for one int, with extent of entire row
         */
        MPI_Type_create_resized(MPI_INT, 0, 150*sizeof(int), &stype);
        MPI_Type_commit(&stype);
        sptr = &sendarray[0][myrank];
        MPI_Gatherv(sptr, 100-myrank, stype, rbuf, rcounts, displs, MPI_INT,
                    root, comm);



Same as Example [[coll-exE]] at sending side, but at receiving side we make the stride between received blocks vary from block to block. See Figure [[coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .

        MPI_Comm comm;
        int gsize,sendarray[100][150],*sptr;
        int root, *rbuf, *stride, myrank, bufsize;
        MPI_Datatype stype;
        int *displs,i,*rcounts,offset;

        ...

        MPI_Comm_size(comm, &gsize);
        MPI_Comm_rank(comm, &myrank);

        stride = (int *)malloc(gsize*sizeof(int));
        ...
        /* stride[i] for i = 0 to gsize-1 is set somehow
         */

        /* set up displs and rcounts vectors first
         */
        displs = (int *)malloc(gsize*sizeof(int));
        rcounts = (int *)malloc(gsize*sizeof(int));
        offset = 0;
        for (i=0; i<gsize; ++i) {
            displs[i] = offset;
            offset += stride[i];
            rcounts[i] = 100-i;
        }
        /* the required buffer size for rbuf is now easily obtained
         */
        bufsize = displs[gsize-1]+rcounts[gsize-1];
        rbuf = (int *)malloc(bufsize*sizeof(int));
        /* Create datatype for the column we are sending
         */
        MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &stype);
        MPI_Type_commit(&stype);
        sptr = &sendarray[0][myrank];
        MPI_Gatherv(sptr, 1, stype, rbuf, rcounts, displs, MPI_INT,
                    root, comm);

*Figure: The root process gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride[i] int`s apart (a varying stride).*



Process `i` sends `num int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. The complicating factor is that the various values of `num` are not known to `root`, so a separate gather must first be run to find these out. The data is placed contiguously at the receiving end.

        MPI_Comm comm;
        int gsize,sendarray[100][150],*sptr;
        int root, *rbuf, myrank;
        MPI_Datatype stype;
        int *displs,i,*rcounts,num;

        ...

        MPI_Comm_size(comm, &gsize);
        MPI_Comm_rank(comm, &myrank);

        /* First, gather nums to root
         */
        rcounts = (int *)malloc(gsize*sizeof(int));
        MPI_Gather(&num, 1, MPI_INT, rcounts, 1, MPI_INT, root, comm);
        /* root now has correct rcounts, using these we set displs[] so
         * that data is placed contiguously (or concatenated) at receive end
         */
        displs = (int *)malloc(gsize*sizeof(int));
        displs[0] = 0;
        for (i=1; i<gsize; ++i) {
            displs[i] = displs[i-1]+rcounts[i-1];
        }
        /* And, create receive buffer
         */
        rbuf = (int *)malloc(gsize*(displs[gsize-1]+rcounts[gsize-1])
                                                                 *sizeof(int));
        /* Create datatype for one int, with extent of entire row
         */
        MPI_Type_create_resized(MPI_INT, 0, 150*sizeof(int), &stype);
        MPI_Type_commit(&stype);
        sptr = &sendarray[0][myrank];
        MPI_Gatherv(sptr, num, stype, rbuf, rcounts, displs, MPI_INT,
                    root, comm);

## Scatter



![[API/MPI_SCATTER]]

[[MPI_SCATTER]] is the inverse operation to [[MPI_GATHER]] .

If `comm` is an intra-communicator, the outcome is *as if* the root executed `n` send operations,

MPI_Send(sendbuf+i$`\cdot`$ sendcount$`\cdot`$ extent(sendtype), sendcount, sendtype, i,...),

and each process executed a receive,

MPI_Recv(recvbuf, recvcount, recvtype, i,...).

An alternative description is that the root sends a message with `MPI_Send(sendbuf, sendcount`$`\cdot`$`n, sendtype, `$`...`$`)`. This message is split into `n` equal segments, the $`i`$-th segment is sent to the $`i`$-th process in the group, and each process receives this message as above.

The send buffer is ignored for all non-root processes.

The type signature associated with `sendcount`, `sendtype` at the root must be equal to the type signature associated with `recvcount`, `recvtype` at all processes (however, the type maps may be different). This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.

All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf`, `recvcount`, `recvtype`, `root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.

The specification of counts and types should not cause any location on the root to be read more than once.

> [!tip] Rationale

> Though not needed, the last restriction is imposed so as to achieve symmetry with [[MPI_GATHER]] , where the corresponding restriction (a multiple-write restriction) is necessary.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such a case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.

If `comm` is an inter-communicator, then the call involves all processes in the inter-communicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.

![[API/MPI_SCATTERV]]

[[MPI_SCATTERV]] is the inverse operation to [[MPI_GATHERV]] .

[[MPI_SCATTERV]] extends the functionality of [[MPI_SCATTER]] by allowing a varying count of data to be sent to each process, since `sendcounts` is now an array. It also allows more flexibility as to where the data is taken from on the root, by providing an additional argument, `displs`.

If `comm` is an intra-communicator, the outcome is as if the root executed `n` send operations,

MPI_Send(sendbuf+displs\[i\]$`\cdot`$ extent(sendtype), sendcounts\[i\], sendtype, i,...),

and each process executed a receive,

MPI_Recv(recvbuf, recvcount, recvtype, i,...).

The send buffer is ignored for all non-root processes.

The type signature implied by `sendcount``[i]`, `sendtype` at the root must be equal to the type signature implied by `recvcount`, `recvtype` at process `i` (however, the type maps may be different). This implies that the amount of data sent must be equal to the amount of data received, pairwise between each process and the root. Distinct type maps between sender and receiver are still allowed.

All arguments to the function are significant on process `root`, while on other processes, only arguments `recvbuf`, `recvcount`, `recvtype`, `root`, and `comm` are significant. The arguments `root` and `comm` must have identical values on all processes.

The specification of counts, types, and displacements should not cause any location on the root to be read more than once.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` as the value of `recvbuf` at the root. In such a case, `recvcount` and `recvtype` are ignored, and root “sends” no data to itself. The scattered vector is still assumed to contain $`n`$ segments, where $`n`$ is the group size; the *root*-th segment, which root should “send to itself,” is not moved.

If `comm` is an inter-communicator, then the call involves all processes in the inter-communicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Data is scattered from the root to all processes in group B. The receive buffer arguments of the processes in group B must be consistent with the send buffer argument of the root.

### Examples using [[MPI_SCATTER]] , [[MPI_SCATTERV]]

The examples in this section use intra-communicators.



The reverse of Example [[coll-exA]] . Scatter sets of 100 `int`s from the root to each process in the group. See Figure [[coll#Examples using MPISCATTER , MPISCATTERV|Examples using MPISCATTER , MPISCATTERV]] .

        MPI_Comm comm;
        int gsize,*sendbuf;
        int root, rbuf[100];
        ...
        MPI_Comm_size(comm, &gsize);
        sendbuf = (int *)malloc(gsize*100*sizeof(int));
        ...
        MPI_Scatter(sendbuf, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);

*Figure: The root process scatters sets of 100 `int`s to each process in the group.*



The reverse of Example [[coll-exC]] . The root process scatters sets of 100 `int`s to the other processes, but the sets of 100 are *stride int*s apart in the sending buffer. Requires use of [[MPI_SCATTERV]] . Assume $`stride \geq 100`$. See Figure [[coll#Examples using MPISCATTER , MPISCATTERV|Examples using MPISCATTER , MPISCATTERV]] .

        MPI_Comm comm;
        int gsize,*sendbuf;
        int root, rbuf[100], i, *displs, *scounts;

        ...

        MPI_Comm_size(comm, &gsize);
        sendbuf = (int *)malloc(gsize*stride*sizeof(int));
        ...
        displs = (int *)malloc(gsize*sizeof(int));
        scounts = (int *)malloc(gsize*sizeof(int));
        for (i=0; i<gsize; ++i) {
            displs[i] = i*stride;
            scounts[i] = 100;
        }
        MPI_Scatterv(sendbuf, scounts, displs, MPI_INT, rbuf, 100, MPI_INT,
                     root, comm);

*Figure: The root process scatters sets of 100 `int`s, moving by `stride int`s from send to send in the scatter.*



The reverse of Example [[coll-exG]] . We have a varying stride between blocks at sending (root) side, at the receiving side we receive into the `i`-th column of a 100$`\times`$<!-- -->150 C array. See Figure [[coll#Examples using MPISCATTER , MPISCATTERV|Examples using MPISCATTER , MPISCATTERV]] .

        MPI_Comm comm;
        int gsize,recvarray[100][150],*rptr;
        int root, *sendbuf, myrank, *stride;
        MPI_Datatype rtype;
        int i, *displs, *scounts, offset;
        ...
        MPI_Comm_size(comm, &gsize);
        MPI_Comm_rank(comm, &myrank);

        stride = (int *)malloc(gsize*sizeof(int));
        ...
        /* stride[i] for i = 0 to gsize-1 is set somehow
         * sendbuf comes from elsewhere
         */
        ...
        displs = (int *)malloc(gsize*sizeof(int));
        scounts = (int *)malloc(gsize*sizeof(int));
        offset = 0;
        for (i=0; i<gsize; ++i) {
            displs[i] = offset;
            offset += stride[i];
            scounts[i] = 100 - i;
        }
        /* Create datatype for the column we are receiving
         */
        MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &rtype);
        MPI_Type_commit(&rtype);
        rptr = &recvarray[0][myrank];
        MPI_Scatterv(sendbuf, scounts, displs, MPI_INT, rptr, 1, rtype,
                     root, comm);

*Figure: The root scatters blocks of `100-i int`s into column `i` of a 100$`\times`$<!-- -->150 C array. At the sending side, the blocks are `stride[i] int`s apart.*

## Gather-to-all



![[API/MPI_ALLGATHER]]

[[MPI_ALLGATHER]] can be thought of as [[MPI_GATHER]] , but where all processes receive the result, instead of just the root. The block of data sent from the `j`-th process is received by every process and placed in the `j`-th block of the buffer `recvbuf`.

The type signature associated with `sendcount, sendtype`, at a process must be equal to the type signature associated with `recvcount, recvtype` at any other process.

If `comm` is an intra-communicator, the outcome of a call to [[MPI_ALLGATHER]] is as if all processes executed `n` calls to

       MPI_Gather(sendbuf,sendcount,sendtype,recvbuf,recvcount,
                                                     recvtype,root,comm)

for `root = 0, ..., n-1`. The rules for correct usage of [[MPI_ALLGATHER]] are easily found from the corresponding rules for [[MPI_GATHER]] .

The “in place” option for intra-communicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. `sendcount` and `sendtype` are ignored. Then the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive buffer.

If `comm` is an inter-communicator, then each process of one group (group A) contributes `sendcount` data items; these data are concatenated and the result is stored at each process in the other group (group B). Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

> [!note] Advice to users

> The communication pattern of [[MPI_ALLGATHER]] executed on an intercommunication domain need not be symmetric. The number of items sent by processes in group A (as specified by the arguments `sendcount, sendtype` in group A and the arguments `recvcount, recvtype` in group B), need not equal the number of items sent by processes in group B (as specified by the arguments `sendcount, sendtype` in group B and the arguments `recvcount, recvtype` in group A). In particular, one can move data in only one direction by specifying `sendcount``= 0` for the communication in the reverse direction.

![[API/MPI_ALLGATHERV]]

[[MPI_ALLGATHERV]] can be thought of as [[MPI_GATHERV]] , but where all processes receive the result, instead of just the root. The block of data sent from the `j`-th process is received by every process and placed in the `j`-th block of the buffer `recvbuf`. These blocks need not all be the same size.

The type signature associated with `sendcount, sendtype`, at process `j` must be equal to the type signature associated with `recvcounts[j], recvtype` at any other process.

If `comm` is an intra-communicator, the outcome is as if all processes executed calls to

        MPI_Gatherv(sendbuf,sendcount,sendtype,recvbuf,recvcounts,displs,
                                                       recvtype,root,comm),

for `root = 0, ..., n-1`. The rules for correct usage of [[MPI_ALLGATHERV]] are easily found from the corresponding rules for [[MPI_GATHERV]] .

The “in place” option for intra-communicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. In such a case, `sendcount` and `sendtype` are ignored, and the input data of each process is assumed to be in the area where that process would receive its own contribution to the receive buffer.

If `comm` is an inter-communicator, then each process of one group (group A) contributes `sendcount` data items; these data are concatenated and the result is stored at each process in the other group (group B). Conversely the concatenation of the contributions of the processes in group B is stored at each process in group A. The send buffer arguments in group A must be consistent with the receive buffer arguments in group B, and vice versa.

### Example using [[MPI_ALLGATHER]]



The example in this section uses intra-communicators.



The all-gather version of Example [[coll-exA]] . Using [[MPI_ALLGATHER]] , we will gather 100 `int`s from every process in the group to every process.

        MPI_Comm comm;
        int gsize,sendarray[100];
        int *rbuf;
        ...
        MPI_Comm_size(comm, &gsize);
        rbuf = (int *)malloc(gsize*100*sizeof(int));
        MPI_Allgather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, comm);

After the call, every process has the group-wide concatenation of the sets of data.

## All-to-All Scatter/Gather



![[API/MPI_ALLTOALL]]

[[MPI_ALLTOALL]] is an extension of [[MPI_ALLGATHER]] to the case where each process sends distinct data to each of the receivers. The `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`.

The type signature associated with `sendcount, sendtype`, at a process must be equal to the type signature associated with `recvcount, recvtype` at any other process. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of processes. As usual, however, the type maps may be different.

If `comm` is an intra-communicator, the outcome is as if each process executed a send to each process (itself included) with a call to,

MPI_Send(sendbuf+i$`\cdot`$ sendcount$`\cdot`$ extent(sendtype),sendcount,sendtype,i, ...),

and a receive from every other process with a call to,

MPI_Recv(recvbuf+i$`\cdot`$ recvcount$`\cdot`$ extent(recvtype),recvcount,recvtype,i,...).

All arguments on all processes are significant. The argument `comm` must have identical values on all processes.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* processes. In such a case, `sendcount` and `sendtype` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by `recvcount` and `recvtype`.

> [!tip] Rationale

> For large [[MPI_ALLTOALL]] instances, allocating both send and receive buffers may consume too much memory. The “in place” option effectively halves the application memory consumption and is useful in situations where the data to be sent will not be used by the sending process after the [[MPI_ALLTOALL]] exchange (e.g., in parallel Fast Fourier Transforms).

> [!warning] Advice to implementors

> Users may opt to use the “in place” option in order to conserve memory. Quality MPI implementations should thus strive to minimize system buffering.

If `comm` is an inter-communicator, then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The `j`-th send buffer of process `i` in group A should be consistent with the `i`-th receive buffer of process `j` in group B, and vice versa.

> [!note] Advice to users

> When a complete exchange is executed on an intercommunication domain, then the number of data items sent from processes in group A to processes in group B need not equal the number of items sent in the reverse direction. In particular, one can have unidirectional communication by specifying `sendcount``= 0` in the reverse direction.

![[API/MPI_ALLTOALLV]]

[[MPI_ALLTOALLV]] adds flexibility to [[MPI_ALLTOALL]] in that the location of data for the send is specified by `sdispls` and the location of the placement of the data on the receive side is specified by `rdispls`.

If `comm` is an intra-communicator, then the `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.

The type signature associated with `sendcounts[j], sendtype` at process `i` must be equal to the type signature associated with `recvcounts[i], recvtype` at process `j`. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of processes. Distinct type maps between sender and receiver are still allowed.

The outcome is as if each process sent a message to every other process with,

MPI_Send(sendbuf+sdispls\[i\]$`\cdot`$ extent(sendtype),sendcounts\[i\],sendtype,i,...),

and received a message from every other process with a call to

MPI_Recv(recvbuf+rdispls\[i\]$`\cdot`$ extent(recvtype),recvcounts\[i\],recvtype,i,...).

All arguments on all processes are significant. The argument `comm` must have identical values on all processes.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* processes. In such a case, `sendcounts`, `sdispls` and `sendtype` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by the `recvcounts` array and the `recvtype`, and is taken from the locations of the receive buffer specified by `rdispls`.

> [!note] Advice to users

> Specifying the “in place” option (which must be given on all processes) implies that the same amount and type of data is sent and received between any two processes in the group of the communicator. Different pairs of processes can exchange different amounts of data. Users must ensure that `recvcounts[j]` and `recvtype` on process `i` match `recvcounts[i]` and `recvtype` on process `j`. This symmetric exchange can be useful in applications where the data to be sent will not be used by the sending process after the [[MPI_ALLTOALLV]] exchange.

If `comm` is an inter-communicator, then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The `j`-th send buffer of process `i` in group A should be consistent with the `i`-th receive buffer of process `j` in group B, and vice versa.

> [!tip] Rationale

> The definitions of [[MPI_ALLTOALL]] and [[MPI_ALLTOALLV]] give as much flexibility as one would achieve by specifying `n` independent, point-to-point communications, with two exceptions: all messages use the same datatype, and messages are scattered from (or gathered to) sequential storage.

> [!warning] Advice to implementors

> Although the discussion of collective communication in terms of point-to-point operation implies that each message is transferred directly from sender to receiver, implementations may use a tree communication pattern. Messages can be forwarded by intermediate nodes where they are split (for scatter) or concatenated (for gather), if this is more efficient.



![[API/MPI_ALLTOALLW]]

[[MPI_ALLTOALLW]] is the most general form of complete exchange. Like [[MPI_TYPE_CREATE_STRUCT]] , the most general type constructor, [[MPI_ALLTOALLW]] allows separate specification of count, displacement and datatype. In addition, to allow maximum flexibility, the displacement of blocks within the send and receive buffers is specified in bytes.

If `comm` is an intra-communicator, then the `j`-th block sent from process `i` is received by process `j` and is placed in the `i`-th block of `recvbuf`. These blocks need not all have the same size.

The type signature associated with `sendcounts[j], sendtypes[j]` at process `i` must be equal to the type signature associated with `recvcounts[i], recvtypes[i]` at process `j`. This implies that the amount of data sent must be equal to the amount of data received, pairwise between every pair of processes. Distinct type maps between sender and receiver are still allowed.

The outcome is as if each process sent a message to every other process with

MPI_Send(sendbuf+sdispls\[i\],sendcounts\[i\],sendtypes\[i\] ,i,...),

and received a message from every other process with a call to

MPI_Recv(recvbuf+rdispls\[i\],recvcounts\[i\],recvtypes\[i\] ,i,...).

All arguments on all processes are significant. The argument `comm` must describe the same communicator on all processes.

Like for [[MPI_ALLTOALLV]] , the “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` to the argument `sendbuf` at *all* processes. In such a case, `sendcounts`, `sdispls` and `sendtypes` are ignored. The data to be sent is taken from the `recvbuf` and replaced by the received data. Data sent and received must have the same type map as specified by the `recvcounts` and `recvtypes` arrays, and is taken from the locations of the receive buffer specified by `rdispls`.

If `comm` is an inter-communicator, then the outcome is as if each process in group A sends a message to each process in group B, and vice versa. The `j`-th send buffer of process `i` in group A should be consistent with the `i`-th receive buffer of process `j` in group B, and vice versa.

> [!tip] Rationale

> The [[MPI_ALLTOALLW]] function generalizes several MPI functions by carefully selecting the input arguments. For example, by making all but one process have `sendcounts[i] = 0`, this achieves an `MPI_SCATTERW` function.

## Global Reduction Operations



The functions in this section perform a global reduce operation (for example sum, maximum, and logical and) across all members of a group. The reduction operation can be either one of a predefined list of operations, or a user-defined operation. The global reduction functions come in several flavors: a reduce that returns the result of the reduction to one member of a group, an all-reduce that returns this result to all members of a group, and two scan (parallel prefix) operations. In addition, a reduce-scatter operation combines the functionality of a reduce and of a scatter operation.

### Reduce



![[API/MPI_REDUCE]]

If `comm` is an intra-communicator, [[MPI_REDUCE]] combines the elements provided in the input buffer of each process in the group, using the operation `op`, and returns the combined value in the output buffer of the process with rank `root`. The input buffer is defined by the arguments `sendbuf`, `count` and `datatype`; the output buffer is defined by the arguments `recvbuf`, `count` and `datatype`; both have the same number of elements, with the same type. The routine is called by all group members using the same arguments for `count, datatype, op, root` and `comm`. Thus, all processes provide input buffers of the same length, with elements of the same type as the output buffer at the root. Each process can provide one element, or a sequence of elements, in which case the combine operation is executed element-wise on each entry of the sequence. For example, if the operation is `MPI_MAX` and the send buffer contains two elements that are floating point numbers (`count` = 2 and `datatype` = `MPI_FLOAT`), then $`\texttt{recvbuf(1)} =
global \max (\texttt{sendbuf(1)})`$ and $`\texttt{recvbuf(2)} = global \max ( \texttt{sendbuf(2)})`$.

Section [[coll-predefined-op]] , lists the set of predefined operations provided by MPI. That section also enumerates the datatypes to which each operation can be applied.

In addition, users may define their own operations that can be overloaded to operate on several datatypes, either basic or derived. This is further explained in Section [[coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] .

The operation `op` is always assumed to be associative. All predefined operations are also assumed to be commutative. Users may define operations that are assumed to be associative, but not commutative. The “canonical” evaluation order of a reduction is determined by the ranks of the processes in the group. However, the implementation can take advantage of associativity, or associativity and commutativity in order to change the order of evaluation. This may change the result of the reduction for operations that are not strictly associative and commutative, such as floating point addition.

> [!warning] Advice to implementors

> It is strongly recommended that [[MPI_REDUCE]] be implemented so that the same result be obtained whenever the function is applied on the same arguments, appearing in the same order. Note that this may prevent optimizations that take advantage of the physical location of ranks.

> [!note] Advice to users

> Some applications may not be able to ignore the non-associative nature of floating-point operations or may use user-defined operations (see Section [[coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] ) that require a special reduction order and cannot be treated as associative. Such applications should enforce the order of evaluation explicitly. For example, in the case of operations that require a strict left-to-right (or right-to-left) evaluation order, this could be done by gathering all operands at a single process (e.g., with [[MPI_GATHER]] ), applying the reduction operation in the desired order (e.g., with [[MPI_REDUCE_LOCAL]] ), and if needed, broadcast or scatter the result to the other processes (e.g., with [[MPI_BCAST]] ).

The `datatype` argument of [[MPI_REDUCE]] must be compatible with `op`. Predefined operators work only with the MPI types listed in Section [[coll-predefined-op]] and Section [[coll-minloc-maxloc]] . Furthermore, the `datatype` and `op` given for predefined operators must be the same on all processes.

Note that it is possible for users to supply different user-defined operations to [[MPI_REDUCE]] in each process. MPI does not define which operations are used on which operands in this case. User-defined operators may operate on general, derived datatypes. In this case, each argument that the reduce operation is applied to is one element described by such a datatype, which may contain several basic values. This is further explained in Section [[coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] .

> [!note] Advice to users

> Users should make no assumptions about how [[MPI_REDUCE]] is implemented. It is safest to ensure that the same function is passed to [[MPI_REDUCE]] by each process.

Overlapping datatypes are permitted in “send” buffers. Overlapping datatypes in “receive” buffers are erroneous and may give unpredictable results.

The “in place” option for intra-communicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at the root. In such a case, the input data is taken at the root from the receive buffer, where it will be replaced by the output data.

If `comm` is an inter-communicator, then the call involves all processes in the inter-communicator, but with one group (group A) defining the root process. All processes in the other group (group B) pass the same value in argument `root`, which is the rank of the root in group A. The root passes the value `MPI_ROOT` in `root`. All other processes in group A pass the value `MPI_PROC_NULL` in `root`. Only send buffer arguments are significant in group B and only receive buffer arguments are significant at the root.

### Predefined Reduction Operations



The following predefined operations are supplied for [[MPI_REDUCE]] and related functions [[MPI_ALLREDUCE]] , [[MPI_REDUCE_SCATTER_BLOCK]] , [[MPI_REDUCE_SCATTER]] , [[MPI_SCAN]] , [[MPI_EXSCAN]] , all nonblocking variants of those (see Section [[coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[MPI_REDUCE_LOCAL]] . These operations are invoked by placing the following in `op`.

Meaning

maximum

minimum

sum

product

logical and

bit-wise and

logical or

bit-wise or

logical exclusive or (xor)

bit-wise exclusive or (xor)

max value and location

min value and location

The two operations `MPI_MINLOC` and `MPI_MAXLOC` are discussed separately in Section [[coll-minloc-maxloc]] . For the other predefined operations, we enumerate below the allowed combinations of `op` and `datatype` arguments. First, define groups of MPI basic datatypes in the following way.

`MPI_INT`, `MPI_LONG`, `MPI_SHORT`,

`MPI_UNSIGNED_SHORT`, `MPI_UNSIGNED`,

`MPI_UNSIGNED_LONG`,

`MPI_LONG_LONG_INT`,

`MPI_LONG_LONG` (as synonym),

`MPI_UNSIGNED_LONG_LONG`,

`MPI_SIGNED_CHAR`,

`MPI_UNSIGNED_CHAR`,

`MPI_INT8_T`, `MPI_INT16_T`,

`MPI_INT32_T`, `MPI_INT64_T`,

`MPI_UINT8_T`, `MPI_UINT16_T`,

`MPI_UINT32_T`, and `MPI_UINT64_T`

`MPI_INTEGER`

and handles returned from

[[MPI_TYPE_CREATE_F90_INTEGER]]

and, if available, `MPI_INTEGER1`,

`MPI_INTEGER2`, `MPI_INTEGER4`,

`MPI_INTEGER8`, and `MPI_INTEGER16`

`MPI_FLOAT`, `MPI_DOUBLE`, `MPI_REAL`,

`MPI_DOUBLE_PRECISION`,

`MPI_LONG_DOUBLE`,

and handles returned from

[[MPI_TYPE_CREATE_F90_REAL]]

and, if available, `MPI_REAL2`,

`MPI_REAL4`, `MPI_REAL8`, and `MPI_REAL16`

`MPI_LOGICAL`, `MPI_C_BOOL`,

and `MPI_CXX_BOOL`

`MPI_COMPLEX`, `MPI_C_COMPLEX`,

`MPI_C_FLOAT_COMPLEX` (as synonym),

`MPI_C_DOUBLE_COMPLEX`,

`MPI_C_LONG_DOUBLE_COMPLEX`,

`MPI_CXX_FLOAT_COMPLEX`,

`MPI_CXX_DOUBLE_COMPLEX`,

`MPI_CXX_LONG_DOUBLE_COMPLEX`,

and handles returned from

[[MPI_TYPE_CREATE_F90_COMPLEX]]

and, if available, `MPI_DOUBLE_COMPLEX`,

`MPI_COMPLEX4`, `MPI_COMPLEX8`,

`MPI_COMPLEX16`, and `MPI_COMPLEX32`

`MPI_BYTE`

`MPI_AINT`, `MPI_OFFSET`, and `MPI_COUNT`

Now, the valid datatypes for each operation are specified below.

Allowed Types

MPI_MIN`C integer, Fortran integer, Floating point,`

Multi-language types

MPI_PROD`C integer, Fortran integer, Floating point, Complex,`

Multi-language types

MPI_LORMPI_LXOR`C integer, Logical`

MPI_BORMPI_BXOR`C integer, Fortran integer, Byte, Multi-language types`

These operations together with all listed datatypes are valid in all supported programming languages, see also Reduce Operations on page [[binding#MPI Opaque Objects|MPI Opaque Objects]] in Section [[binding#MPI Opaque Objects|MPI Opaque Objects]] .

The following examples use intra-communicators.



A routine that computes the dot product of two vectors that are distributed across a group of processes and returns the answer at node zero.

    SUBROUTINE PAR_BLAS1(m, a, b, c, comm)
    REAL a(m), b(m)       ! local slice of array
    REAL c                ! result (at node zero)
    REAL sum
    INTEGER m, comm, i, ierr

    ! local sum
    sum = 0.0
    DO i = 1, m
       sum = sum + a(i)*b(i)
    END DO

    ! global sum
    CALL MPI_REDUCE(sum, c, 1, MPI_REAL, MPI_SUM, 0, comm, ierr)
    RETURN
    END



A routine that computes the product of a vector and an array that are distributed across a group of processes and returns the answer at node zero.

    SUBROUTINE PAR_BLAS2(m, n, a, b, c, comm)
    REAL a(m), b(m,n)    ! local slice of array
    REAL c(n)            ! result
    REAL sum(n)
    INTEGER m, n, comm, i, j, ierr

    ! local sum
    DO j=1,n
       sum(j) = 0.0
       DO i=1,m
          sum(j) = sum(j) + a(i)*b(i,j)
       END DO
    END DO

    ! global sum
    CALL MPI_REDUCE(sum, c, n, MPI_REAL, MPI_SUM, 0, comm, ierr)

    ! return result at node zero (and garbage at the other nodes)
    RETURN
    END

### Signed Characters and Reductions

The types `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` can be used in reduction operations. `MPI_CHAR`, `MPI_WCHAR`, and `MPI_CHARACTER` (which represent printable characters) cannot be used in reduction operations. In a heterogeneous environment, `MPI_CHAR`, `MPI_WCHAR`, and `MPI_CHARACTER` will be translated so as to preserve the printable character, whereas `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` will be translated so as to preserve the integer value.

> [!note] Advice to users

> The types `MPI_CHAR`, `MPI_WCHAR`, and `MPI_CHARACTER` are intended for characters, and so will be translated to preserve the printable representation, rather than the integer value, if sent between machines with different character codes. The types `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` should be used in C if the integer value should be preserved.

### MINLOC and MAXLOC



The operator `MPI_MINLOC` is used to compute a global minimum and also an index attached to the minimum value. `MPI_MAXLOC` similarly computes a global maximum and index. One application of these is to compute a global minimum (maximum) and the rank of the process containing this value.

The operation that defines `MPI_MAXLOC` is:

``` math
\left( \begin{array}{c} u \ i \end{array} \right)
\circ
\left( \begin{array}{c} v \ j \end{array} \right)
=
\left( \begin{array}{c} w \ k \end{array} \right)
```
where
``` math
w = \max (u,v)
```
and
``` math
k = \left\{ \begin{array}{ll}
    i & if $u > v$ \\
    \min(i,j) & if $u=v$ \\
    j & if $u < v$
\end{array}
\right.
```

`MPI_MINLOC` is defined similarly:

``` math
\left( \begin{array}{c} u \ i \end{array} \right)
\circ
\left( \begin{array}{c} v \ j \end{array} \right)
=
\left( \begin{array}{c} w \ k \end{array} \right)
```
where
``` math
w = \min (u,v)
```
and
``` math
k = \left\{ \begin{array}{ll}
    i & if $u < v$ \\
    \min(i,j) & if $u=v$ \\
    j & if $u > v$
\end{array}
\right.
```

Both operations are associative and commutative. Note that if `MPI_MAXLOC` is applied to reduce a sequence of pairs $`(u_0, 0), (u_1, 1) , ..., (u_{n-1} , n-1)`$, then the value returned is $`(u , r)`$, where $`u = \max_i u_i`$ and $`r`$ is the index of the first global maximum in the sequence. Thus, if each process supplies a value and its rank within the group, then a reduce operation with `op` = `MPI_MAXLOC` will return the maximum value and the rank of the first process with that value. Similarly, `MPI_MINLOC` can be used to return a minimum and its index. More generally, `MPI_MINLOC` computes a *lexicographic minimum*, where elements are ordered according to the first component of each pair, and ties are resolved according to the second component.

The reduce operation is defined to operate on arguments that consist of a pair: value and index. For both Fortran and C, types are provided to describe the pair. The potentially mixed-type nature of such arguments is a problem in Fortran. The problem is circumvented, for Fortran, by having the MPI-provided type consist of a pair of the same type as value, and coercing the index to this type also. In C, the MPI-provided pair type has distinct types and the index is an `int`.

In order to use `MPI_MINLOC` and `MPI_MAXLOC` in a reduce operation, one must provide a `datatype` argument that represents a pair (value and index). MPI provides nine such predefined datatypes. The operations `MPI_MAXLOC` and `MPI_MINLOC` can be used with each of the following datatypes.

Description

pair of `REAL`s

pair of `DOUBLE PRECISION` variables

pair of `INTEGER`s

Description

`float` and `int`

`double` and `int`

`long` and `int`

pair of `int`

`short` and `int`

`long double` and `int`

The datatype `MPI_2REAL` is *as if* defined by the following (see Section [[datatypes#Derived Datatypes|Derived Datatypes]] ).

    MPI_Type_contiguous(2, MPI_REAL, MPI_2REAL);

Similar statements apply for `MPI_2INTEGER`, `MPI_2DOUBLE_PRECISION`, and `MPI_2INT`.

The datatype `MPI_SHORT_INT` is *as if* defined by the following sequence of instructions.

    struct mystruct {
        short val;
        int rank;
    };
    type[0] = MPI_SHORT;
    type[1] = MPI_INT;
    disp[0] = 0;
    disp[1] = offsetof(struct mystruct, rank);
    block[0] = 1;
    block[1] = 1;
    MPI_Type_create_struct(2, block, disp, type, MPI_SHORT_INT);

Similar statements apply for `MPI_FLOAT_INT`, `MPI_LONG_INT` and `MPI_DOUBLE_INT`.

The following examples use intra-communicators.



Each process has an array of 30 `double`s, in C. For each of the 30 locations, compute the value and rank of the process containing the largest value.

        ...
        /* each process has an array of 30 double: ain[30]
         */
        double ain[30], aout[30];
        int  ind[30];
        struct {
            double val;
            int   rank;
        } in[30], out[30];
        int i, myrank, root;

        MPI_Comm_rank(comm, &myrank);
        for (i=0; i<30; ++i) {
            in[i].val = ain[i];
            in[i].rank = myrank;
        }
        MPI_Reduce(in, out, 30, MPI_DOUBLE_INT, MPI_MAXLOC, root, comm);
        /* At this point, the answer resides on process root
         */
        if (myrank == root) {
            /* read ranks out
             */
            for (i=0; i<30; ++i) {
                aout[i] = out[i].val;
                ind[i] = out[i].rank;
            }
        }



Same example, in Fortran.

    ...
    ! each process has an array of 30 double: ain(30)

    DOUBLE PRECISION ain(30), aout(30)
    INTEGER ind(30)
    DOUBLE PRECISION in(2,30), out(2,30)
    INTEGER i, myrank, root, ierr

    CALL MPI_COMM_RANK(comm, myrank, ierr)
    DO i=1,30
       in(1,i) = ain(i)
       in(2,i) = myrank    ! myrank is coerced to a double
    END DO

    CALL MPI_REDUCE(in, out, 30, MPI_2DOUBLE_PRECISION, MPI_MAXLOC, root,&
                    comm, ierr)
    ! At this point, the answer resides on process root

    IF (myrank .EQ. root) THEN
       ! read ranks out
       DO i=1,30
          aout(i) = out(1,i)
          ind(i) = out(2,i)  ! rank is coerced back to an integer
       END DO
    END IF



Each process has a non-empty array of values. Find the minimum global value, the rank of the process that holds it and its index on this process.

    #define  LEN   1000

    float val[LEN];        /* local array of values */
    int count;             /* local number of values */
    int myrank, minrank, minindex;
    float minval;

    struct {
        float value;
        int   index;
    } in, out;

        /* local minloc */
    in.value = val[0];
    in.index = 0;
    for (i=1; i < count; i++)
        if (in.value > val[i]) {
            in.value = val[i];
            in.index = i;
        }

        /* global minloc */
    MPI_Comm_rank(comm, &myrank);
    in.index = myrank*LEN + in.index;
    MPI_Reduce(&in, &out, 1, MPI_FLOAT_INT, MPI_MINLOC, root, comm);
        /* At this point, the answer resides on process root
         */
    if (myrank == root) {
        /* read answer out
         */
        minval = out.value;
        minrank = out.index / LEN;
        minindex = out.index % LEN;
    }

> [!tip] Rationale

> The definition of `MPI_MINLOC` and `MPI_MAXLOC` given here has the advantage that it does not require any special-case handling of these two operations: they are handled like any other reduce operation. By assigning a value other than `myrank` to the `in.index` field, a programmer can provide a different definition of `MPI_MAXLOC` and `MPI_MINLOC`, if so desired. The disadvantage is that values and indices have to be first interleaved, and that indices and values have to be coerced to the same type, in Fortran.

### User-Defined Reduction Operations



![[API/MPI_OP_CREATE]]

[[MPI_OP_CREATE]] binds a user-defined reduction operation to an `op` handle that can subsequently be used in [[MPI_REDUCE]] , [[MPI_ALLREDUCE]] , [[MPI_REDUCE_SCATTER_BLOCK]] , [[MPI_REDUCE_SCATTER]] , [[MPI_SCAN]] , [[MPI_EXSCAN]] , all nonblocking variants of those (see Section [[coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] ), and [[MPI_REDUCE_LOCAL]] . The user-defined operation is assumed to be associative. If `commute` $`=`$ `true`, then the operation should be both commutative and associative. If `commute` $`=`$ `false`, then the order of operands is fixed and is defined to be in ascending, process rank order, beginning with process zero. The order of evaluation can be changed, talking advantage of the associativity of the operation. If `commute` $`=`$ `true` then the order of evaluation can be changed, taking advantage of commutativity and associativity.

In Fortran when using `USE mpi_f08`, the large count variant shall be called explicitly as [[MPI_Op_create_c]] (i.e., with suffix “`_c`”) because interface polymorphism cannot be used to differentiate between the two different user callback prototypes despite their different type signatures.

The argument `user_fn` is the user-defined function, which must have the following four arguments: `invec`, `inoutvec`, `len`, and `datatype`.

`MPI_USER_FUNCTION` also supports large count types in separate additional MPI callback function prototype declarations in C (suffixed with the “`_c`”) and in Fortran when using `USE mpi_f08`.

The ISO C prototypes for the functions are the following.

The Fortran declarations of the user-defined function `user_fn` appear below.

The `datatype` argument is a handle to the datatype that was passed into the call to [[MPI_REDUCE]] . The user reduce function should be written such that the following holds: Let `u[0], `$`...`$`, u[len-1]` be the `len` elements in the communication buffer described by the arguments `invec, len` and `datatype` when the function is invoked; let `v[0], `$`...`$` , v[len-1]` be `len` elements in the communication buffer described by the arguments `inoutvec, len` and `datatype` when the function is invoked; let `w[0], `$`...`$` , w[len-1]` be `len` elements in the communication buffer described by the arguments `inoutvec, len` and `datatype` when the function returns; then `w[i] = u[i]`$`\circ`$`v[i]`, for `i=0 , `$`...`$` , len-1`, where $`\circ`$ is the reduce operation that the function computes.

Informally, we can think of `invec` and `inoutvec` as arrays of `len` elements that `user_fn` is combining. The result of the reduction over-writes values in `inoutvec`, hence the name. Each invocation of the function results in the pointwise evaluation of the reduce operator on `len` elements: i.e., the function returns in `inoutvec[i]` the value $`\texttt{invec[i]} \circ \texttt{inoutvec[i]}`$, for $`\texttt{i=0, ... , count-1}`$, where $`\circ`$ is the combining operation computed by the function.

> [!tip] Rationale

> The `len` argument allows [[MPI_REDUCE]] to avoid calling the function for each element in the input buffer. Rather, the system can choose to apply the function to chunks of input. In C, it is passed in as a reference for reasons of compatibility with Fortran.
>
> By internally comparing the value of the `datatype` argument to known, global handles, it is possible to overload the use of a single user-defined function for several, different datatypes.

When calling any reduction or prefix scan MPI procedure with a user-defined MPI operator, the type of the `count` parameter in the call to the reduction or prefix scan MPI procedure does not need to be identical to the type of the `len` parameter in the user function associated with the user-defined MPI operator. If the `count` parameter has a type of `int` in C or `INTEGER` in Fortran and the `len` parameter has a type of `MPI_COUNT`, then MPI will perform the appropriate widening type conversion of the `len` parameter. If the `count` parameter has a type of `MPI_COUNT` and the `len` parameter has a type of `int` in C or `INTEGER` in Fortran, then MPI will perform the appropriate narrowing type conversion of the `len` parameter. If this narrowing conversion would result in truncation of the `len` value, then MPI will call the user function multiple times with a sequence of values for `len` that sum to the value of `count`.

> [!warning] Advice to implementors

> If the number of data items cannot be represented in `len`, the implementation may need to invoke `user_fn` multiple times.

General datatypes may be passed to the user function. However, use of datatypes that are not contiguous is likely to lead to inefficiencies.

No MPI communication function may be called inside the user function. [[MPI_ABORT]] may be called inside the function in case of an error.

> [!note] Advice to users

> Suppose one defines a library of user-defined reduce functions that are overloaded: the `datatype` argument is used to select the right execution path at each invocation, according to the types of the operands. The user-defined reduce function cannot “decode” the `datatype` argument that it is passed, and cannot identify, by itself, the correspondence between the datatype handles and the datatype they represent. This correspondence was established when the datatypes were created. Before the library is used, a library initialization preamble must be executed. This preamble code will define the datatypes that are used by the library, and store handles to these datatypes in global, static variables that are shared by the user code and the library code.
>
> The Fortran version of [[MPI_REDUCE]] will invoke a user-defined reduce function using the Fortran calling conventions and will pass a Fortran-type datatype argument; the C version will use C calling convention and the C representation of a datatype handle. Users who plan to mix languages should define their reduction functions accordingly.

> [!warning] Advice to implementors

> We outline below a naive and inefficient implementation of [[MPI_REDUCE]] not supporting the “in place” option and only valid for intra-communicators.
>
>           MPI_Comm_size(comm, &groupsize);
>           MPI_Comm_rank(comm, &rank);
>           if (rank > 0) {
>               MPI_Recv(tempbuf, count, datatype, rank-1,...);
>               User_reduce(tempbuf, sendbuf, count, datatype);
>           }
>           if (rank < groupsize-1) {
>               MPI_Send(sendbuf, count, datatype, rank+1, ...);
>           }
>           /* answer now resides in process groupsize-1 ... now send to root
>            */
>           if (rank == root) {
>               MPI_Irecv(recvbuf, count, datatype, groupsize-1,..., &req);
>           }
>           if (rank == groupsize-1) {
>               MPI_Send(sendbuf, count, datatype, root, ...);
>           }
>           if (rank == root) {
>               MPI_Wait(&req, &status);
>           }
>
> The reduction computation proceeds, sequentially, from process `0` to process `groupsize-1`. This order is chosen so as to respect the order of a possibly noncommutative operator defined by the function `User_reduce()`. A more efficient implementation is achieved by taking advantage of associativity and using a logarithmic tree reduction. Commutativity can be used to advantage, for those cases in which the `commute` argument to [[MPI_OP_CREATE]] is true. Also, the amount of temporary buffer required can be reduced, and communication can be pipelined with computation, by transferring and reducing the elements in chunks of size `len` $`<`$`count`.
>
> The predefined reduce operations can be implemented as a library of user-defined operations. However, better performance might be achieved if [[MPI_REDUCE]] handles these functions as a special case.

![[API/MPI_OP_FREE]]

Marks a user-defined reduction operation for deallocation and sets `op` to `MPI_OP_NULL`.

#### Example of User-Defined Reduce



It is time for an example of user-defined reduction. The example in this section uses an intra-communicator.



Compute the product of an array of complex numbers, in C.

    typedef struct {
        double real,imag;
    } Complex;

    /* the user-defined function
     */
    void myProd(void *inP, void *inoutP, int *len, MPI_Datatype *dptr)
    {
        int i;
        Complex c;
        Complex *in = (Complex *)inP, *inout = (Complex *)inoutP;

        for (i=0; i< *len; ++i) {
            c.real = inout->real*in->real -
                       inout->imag*in->imag;
            c.imag = inout->real*in->imag +
                       inout->imag*in->real;
            *inout = c;
            in++; inout++;
        }
    }

    /* and, to call it...
     */
    ...

        /* each process has an array of 100 Complexes
         */
        Complex a[100], answer[100];
        MPI_Op myOp;
        MPI_Datatype ctype;

        /* explain to MPI how type Complex is defined
         */
        MPI_Type_contiguous(2, MPI_DOUBLE, &ctype);
        MPI_Type_commit(&ctype);
        /* create the complex-product user-op
         */
        MPI_Op_create(myProd, 1, &myOp);

        MPI_Reduce(a, answer, 100, ctype, myOp, root, comm);

        /* At this point, the answer, which consists of 100 Complexes,
         * resides on process root
         */



How to use the `mpi_f08` interface of the Fortran `MPI_User_function`.

    subroutine my_user_function(invec, inoutvec, len, type)   bind(c)
       use, intrinsic :: iso_c_binding, only : c_ptr, c_f_pointer
       use mpi_f08
       type(c_ptr), value :: invec, inoutvec
       integer :: len
       type(MPI_Datatype) :: type
       real, pointer :: invec_r(:), inoutvec_r(:)
       if (type%MPI_VAL == MPI_REAL%MPI_VAL) then
          call c_f_pointer(invec, invec_r, (/ len /))
          call c_f_pointer(inoutvec, inoutvec_r, (/ len /))
          inoutvec_r = invec_r + inoutvec_r
       end if
    end subroutine

### All-Reduce



MPI includes a variant of the reduce operations where the result is returned to all processes in a group. MPI requires that all processes from the same group participating in these operations receive identical results.

![[API/MPI_ALLREDUCE]]

If `comm` is an intra-communicator, [[MPI_ALLREDUCE]] behaves the same as [[MPI_REDUCE]] except that the result appears in the receive buffer of all the group members.

> [!warning] Advice to implementors

> The all-reduce operations can be implemented as a reduce, followed by a broadcast. However, a direct implementation can lead to better performance.

The “in place” option for intra-communicators is specified by passing the value `MPI_IN_PLACE` to the argument `sendbuf` at all processes. In this case, the input data is taken at each process from the receive buffer, where it will be replaced by the output data.

If `comm` is an inter-communicator, then the result of the reduction of the data provided by processes in group A is stored at each process in group B, and vice versa. Both groups should provide `count` and `datatype` arguments that specify the same type signature.

The following example uses an intra-communicator.



A routine that computes the product of a vector and an array that are distributed across a group of processes and returns the answer at all nodes (see also Example [[coll-exblas2]] ).

    SUBROUTINE PAR_BLAS2(m, n, a, b, c, comm)
    REAL a(m), b(m,n)    ! local slice of array
    REAL c(n)            ! result
    REAL sum(n)
    INTEGER n, comm, i, j, ierr

    ! local sum
    DO j=1,n
       sum(j) = 0.0
       DO i=1,m
          sum(j) = sum(j) + a(i)*b(i,j)
       END DO
    END DO

    ! global sum
    CALL MPI_ALLREDUCE(sum, c, n, MPI_REAL, MPI_SUM, comm, ierr)

    ! return result at all nodes
    RETURN
    END

### Process-Local Reduction



The functions in this section are of importance to library implementors who may want to implement special reduction patterns that are otherwise not easily covered by the standard MPI operations.

The following function applies a reduction operator to local arguments.

![[API/MPI_REDUCE_LOCAL]]

The function applies the operation given by `op` element-wise to the elements of `inbuf` and `inoutbuf` with the result stored element-wise in `inoutbuf`, as explained for user-defined operations in Section [[coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] . Both `inbuf` and `inoutbuf` (input as well as result) have the same number of elements given by `count` and the same datatype given by `datatype`. The `MPI_IN_PLACE` option is not allowed.

Reduction operations can be queried for their commutativity.

![[API/MPI_OP_COMMUTATIVE]]

## Reduce-Scatter



MPI includes variants of the reduce operations where the result is scattered to all processes in a group on return. One variant scatters equal-sized blocks to all processes, while another variant scatters blocks that may vary in size for each process.

### [[MPI_REDUCE_SCATTER_BLOCK]]



![[API/MPI_REDUCE_SCATTER_BLOCK]]

If `comm` is an intra-communicator, [[MPI_REDUCE_SCATTER_BLOCK]] first performs a global, element-wise reduction on vectors of `count``= n*``recvcount` elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcount`, `datatype`, `op` and `comm`. The resulting vector is treated as `n` consecutive blocks of `recvcount` elements that are scattered to the processes of the group. The `i`-th block is sent to process `i` and stored in the receive buffer defined by `recvbuf`, `recvcount`, and `datatype`.

> [!warning] Advice to implementors

> The [[MPI_REDUCE_SCATTER_BLOCK]] routine is functionally equivalent to: an [[MPI_REDUCE]] collective operation with `count` equal to `recvcount*``n`, followed by an [[MPI_SCATTER]] with `sendcount` equal to `recvcount`. However, a direct implementation may run faster.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument on *all* processes. In this case, the input data is taken from the receive buffer.

If `comm` is an inter-communicator, then the result of the reduction of the data provided by processes in one group (group A) is scattered among processes in the other group (group B) and vice versa. Within each group, all processes provide the same value for the `recvcount` argument, and provide input vectors of `count``= n*``recvcount` elements stored in the send buffers, where `n` is the size of the group. The number of elements `count` must be the same for the two groups. The resulting vector from the other group is scattered in blocks of `recvcount` elements among the processes in the group.

> [!tip] Rationale

> The last restriction is needed so that the length of the send buffer of one group can be determined by the local `recvcount` argument of the other group. Otherwise, a communication is needed to figure out how many elements are reduced.

### [[MPI_REDUCE_SCATTER]]



[[MPI_REDUCE_SCATTER]] extends the functionality of [[MPI_REDUCE_SCATTER_BLOCK]] such that the scattered blocks can vary in size. Block sizes are determined by the `recvcounts` array, such that the `i`-th block contains `recvcounts[i]` elements.

![[API/MPI_REDUCE_SCATTER]]

If `comm` is an intra-communicator, [[MPI_REDUCE_SCATTER]] first performs a global, element-wise reduction on vectors of $`\texttt{count} = \sum_{i=0}^{n-1} \texttt{recvcounts[i]}`$ elements in the send buffers defined by `sendbuf`, `count` and `datatype`, using the operation `op`, where `n` is the number of processes in the group of `comm`. The routine is called by all group members using the same arguments for `recvcounts`, `datatype`, `op` and `comm`. The resulting vector is treated as n consecutive blocks where the number of elements of the `i`-th block is `recvcounts[i]`. The blocks are scattered to the processes of the group. The `i`-th block is sent to process `i` and stored in the receive buffer defined by `recvbuf, recvcounts[i]` and `datatype`.

> [!warning] Advice to implementors

> The [[MPI_REDUCE_SCATTER]] routine is functionally equivalent to: an [[MPI_REDUCE]] collective operation with `count` equal to the sum of `recvcounts[i]` followed by [[MPI_SCATTERV]] with `sendcounts` equal to `recvcounts`. However, a direct implementation may run faster.

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer. It is not required to specify the “in place” option on all processes, since the processes for which `recvcounts[i]``==0` may not have allocated a receive buffer.

If `comm` is an inter-communicator, then the result of the reduction of the data provided by processes in one group (group A) is scattered among processes in the other group (group B), and vice versa. Within each group, all processes provide the same `recvcounts` argument, and provide input vectors of $`\texttt{count} = \sum_{i=0}^{n-1} \texttt{recvcounts[i]}`$ elements stored in the send buffers, where `n` is the size of the group. The resulting vector from the other group is scattered in blocks of `recvcounts[i]` elements among the processes in the group. The number of elements `count` must be the same for the two groups.

> [!tip] Rationale

> The last restriction is needed so that the length of the send buffer can be determined by the sum of the local `recvcounts` entries. Otherwise, a communication is needed to figure out how many elements are reduced.

## Scan



### Inclusive Scan

![[API/MPI_SCAN]]

If `comm` is an intra-communicator, [[MPI_SCAN]] is used to perform a prefix reduction on data distributed across the group. The operation returns, in the receive buffer of the process with rank `i`, the reduction of the values in the send buffers of processes with ranks `0,`$`...`$`,i` (inclusive). The routine is called by all group members using the same arguments for count, datatype, op and comm, except that for user-defined operations, the same rules apply as for [[MPI_REDUCE]] . The type of operations supported, their semantics, and the constraints on send and receive buffers are as for [[MPI_REDUCE]] .

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer, and replaced by the output data.

This operation is invalid for inter-communicators.

### Exclusive Scan



![[API/MPI_EXSCAN]]

If `comm` is an intra-communicator, [[MPI_EXSCAN]] is used to perform a prefix reduction on data distributed across the group. The value in `recvbuf` on the process with rank 0 is undefined, and `recvbuf` is not signficant on process 0. The value in `recvbuf` on the process with rank 1 is defined as the value in `sendbuf` on the process with rank 0. For processes with rank $`i > 1`$, the operation returns, in the receive buffer of the process with rank $`i`$, the reduction of the values in the send buffers of processes with ranks $`0,...,i-1`$ (inclusive). The routine is called by all group members using the same arguments for count, datatype, op and comm, except that for user-defined operations, the same rules apply as for [[MPI_REDUCE]] . The type of operations supported, their semantics, and the constraints on send and receive buffers, are as for [[MPI_REDUCE]] .

The “in place” option for intra-communicators is specified by passing `MPI_IN_PLACE` in the `sendbuf` argument. In this case, the input data is taken from the receive buffer, and replaced by the output data. The receive buffer on rank 0 is not changed by this operation.

This operation is invalid for inter-communicators.

> [!tip] Rationale

> The exclusive scan is more general than the inclusive scan. Any inclusive scan operation can be achieved by using the exclusive scan and then locally combining the local contribution. Note that for non-invertable operations such as `MPI_MAX`, the exclusive scan cannot be computed with the inclusive scan.

### Example using [[MPI_SCAN]]



The example in this section uses an intra-communicator.

## Nonblocking Collective Operations

 As described in Section [[pt2pt#Nonblocking Communication|Nonblocking Communication]] , performance of many applications can be improved by overlapping communication and computation, and many systems enable this. Nonblocking collective operations combine the potential benefits of nonblocking point-to-point operations, to exploit overlap and to avoid synchronization, with the optimized implementation and message scheduling provided by collective operations . One way of doing this would be to perform a blocking collective operation in a separate thread. An alternative mechanism that often leads to better performance (e.g., avoids context switching, scheduler overheads, and thread management) is to use nonblocking collective communication .

The nonblocking collective communication model is similar to the model used for nonblocking point-to-point communication. A nonblocking call initiates a collective operation, which must be completed in a separate completion call. Once initiated, the operation may progress independently of any computation or other communication at participating processes. In this manner, nonblocking collective operations can mitigate possible synchronizing effects of collective operations by running them in the “background.” In addition to enabling communication-computation overlap, nonblocking collective operations can perform collective operations on overlapping communicators, which would lead to deadlocks with blocking operations. Their semantic advantages can also be useful in combination with point-to-point communication.

As in the nonblocking point-to-point case, all calls are local and return immediately, irrespective of the status of other processes. The call initiates the operation, which indicates that the system may start to copy data out of the send buffer and into the receive buffer. Once initiated, all associated send buffers and buffers associated with input arguments (such as arrays of counts, displacements, or datatypes in the vector versions of the collectives) should not be modified, and all associated receive buffers should not be accessed, until the collective operation completes. The call returns a request handle, which must be passed to a completion call.

All completion calls (e.g., [[MPI_WAIT]] ) described in Section [[pt2pt#Communication Completion|Communication Completion]] are supported for nonblocking collective operations. Similarly to the blocking case, nonblocking collective operations are considered to be complete when the local part of the operation is finished, i.e., for the caller, the semantics of the operation are guaranteed and all buffers can be safely accessed and modified. Completion does not indicate that other processes have completed or even started the operation (unless otherwise implied by the description of the operation). Completion of a particular nonblocking collective operation also does not indicate completion of any other posted nonblocking collective (or send-receive) operations, whether they are posted before or after the completed operation.

> [!note] Advice to users

> Users should be aware that implementations are allowed, but not required (with exception of [[MPI_IBARRIER]] ), to synchronize processes during the completion of a nonblocking collective operation.

Upon returning from a completion call in which a nonblocking collective operation completes, the values of the `MPI_SOURCE` and `MPI_TAG` fields in the associated status object, if any, are undefined. The value of `MPI_ERROR` may be defined, if appropriate, according to the specification in Section [[pt2pt#Return Status|Return Status]] . It is valid to mix different request types (i.e., any combination of collective requests, I/O requests, generalized requests, or point-to-point requests) in functions that enable multiple completions (e.g., [[MPI_WAITALL]] ).

It is erroneous to call [[MPI_REQUEST_FREE]] or [[MPI_CANCEL]] for a request associated with a nonblocking collective operation .

Nonblocking collective requests created using the APIs described in this section are not persistent. However, persistent collective requests can be created using persistent collective operations described in Sections [[coll#Persistent Collective Operations|Persistent Collective Operations]] and [[topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] .

> [!tip] Rationale

> Freeing an active nonblocking collective request could cause similar problems as discussed for point-to-point requests (see Section [[pt2pt#Communication Completion|Communication Completion]] ). Cancelling a request is not supported because the semantics of this operation are not well-defined.

Multiple nonblocking collective operations can be outstanding on a single communicator. If the nonblocking call causes some system resource to be exhausted, then it will fail and raise an error. Quality implementations of MPI should ensure that this happens only in pathological cases. That is, an MPI implementation should be able to support a large number of pending nonblocking operations.

Unlike point-to-point operations, nonblocking collective operations do not match with blocking collective operations, and collective operations do not have a tag argument. All processes must call collective operations (blocking and nonblocking) in the same order per communicator. In particular, once a process calls a collective operation, all other processes in the communicator must eventually call the same collective operation, and no other collective operation with the same communicator in between. This is consistent with the ordering rules for blocking collective operations in threaded environments.

> [!tip] Rationale

> Matching blocking and nonblocking collective operations is not allowed because the implementation might use different communication algorithms for the two cases. Blocking collective operations may be optimized for minimal time to completion, while nonblocking collective operations may balance time to completion with CPU overhead and asynchronous progression.
>
> The use of tags for collective operations can prevent certain hardware optimizations.

> [!note] Advice to users

> If program semantics require matching blocking and nonblocking collective operations, then a nonblocking collective operation can be initiated and immediately completed with a blocking wait to emulate blocking behavior.

In terms of data movement, each nonblocking collective operation has the same effect as its blocking counterpart for intra-communicators and inter-communicators after completion. Likewise, upon completion, nonblocking collective reduction operations have the same effect as their blocking counterparts, and the same restrictions and recommendations on reduction orders apply.

The use of the “in place” option is allowed exactly as described for the corresponding blocking collective operations. When using the “in place” option, message buffers function as both send and receive buffers. Such buffers should not be modified or accessed until the operation completes.

*Progression* rules for nonblocking collective operations are similar to progression of nonblocking point-to-point operations, refer to Section [[pt2pt#Semantics of Nonblocking Communications|Semantics of Nonblocking Communications]] .

> [!warning] Advice to implementors

> Nonblocking collective operations can be implemented with local execution schedules using nonblocking point-to-point communication and a reserved tag-space.

### Nonblocking Barrier Synchronization



![[API/MPI_IBARRIER]]

[[MPI_IBARRIER]] is a nonblocking version of [[MPI_BARRIER]] . By calling [[MPI_IBARRIER]] , a process notifies that it has reached the barrier. The call returns immediately, independent of whether other processes have called [[MPI_IBARRIER]] . The usual barrier semantics are enforced at the corresponding completion operation (test or wait), which in the intra-communicator case will complete only after all other processes in the communicator have called [[MPI_IBARRIER]] . In the inter-communicator case, it will complete when all processes in the remote group have called [[MPI_IBARRIER]] .

> [!note] Advice to users

> A nonblocking barrier can be used to hide latency. Moving independent computations between the [[MPI_IBARRIER]] and the subsequent completion call can overlap the barrier latency and therefore shorten possible waiting times. The semantic properties are also useful when mixing collective operations and point-to-point messages.

### Nonblocking Broadcast



![[API/MPI_IBCAST]]

This call starts a nonblocking variant of [[MPI_BCAST]] (see Section [[coll#Broadcast|Broadcast]] ).

#### Example using [[MPI_IBCAST]]

The example in this section uses an intra-communicator.

Z

Start a broadcast of 100 `int`s from process `0` to every process in the group, perform some computation on independent data, and then complete the outstanding broadcast operation.

        MPI_Comm comm;
        int array1[100], array2[100];
        int root=0;
        MPI_Request req;
        ...
        MPI_Ibcast(array1, 100, MPI_INT, root, comm, &req);
        compute(array2, 100);
        MPI_Wait(&req, MPI_STATUS_IGNORE);

### Nonblocking Gather



![[API/MPI_IGATHER]]

This call starts a nonblocking variant of [[MPI_GATHER]] (see Section [[coll#Gather|Gather]] ).

![[API/MPI_IGATHERV]]

This call starts a nonblocking variant of [[MPI_GATHERV]] (see Section [[coll#Gather|Gather]] ).

### Nonblocking Scatter



![[API/MPI_ISCATTER]]

This call starts a nonblocking variant of [[MPI_SCATTER]] (see Section [[coll#Scatter|Scatter]] ).

![[API/MPI_ISCATTERV]]

This call starts a nonblocking variant of [[MPI_SCATTERV]] (see Section [[coll#Scatter|Scatter]] ).

### Nonblocking Gather-to-all



![[API/MPI_IALLGATHER]]

This call starts a nonblocking variant of [[MPI_ALLGATHER]] (see Section [[coll#Gather-to-all|Gather-to-all]] ).

![[API/MPI_IALLGATHERV]]

This call starts a nonblocking variant of [[MPI_ALLGATHERV]] (see Section [[coll#Gather-to-all|Gather-to-all]] ).

### Nonblocking All-to-All Scatter/Gather



![[API/MPI_IALLTOALL]]

This call starts a nonblocking variant of [[MPI_ALLTOALL]] (see Section [[coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] ).

![[API/MPI_IALLTOALLV]]

This call starts a nonblocking variant of [[MPI_ALLTOALLV]] (see Section [[coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] ).

![[API/MPI_IALLTOALLW]]

This call starts a nonblocking variant of [[MPI_ALLTOALLW]] (see Section [[coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] ).

### Nonblocking Reduce



![[API/MPI_IREDUCE]]

This call starts a nonblocking variant of [[MPI_REDUCE]] (see Section [[coll#Reduce|Reduce]] ).

> [!warning] Advice to implementors

> The implementation is explicitly allowed to use different algorithms for blocking and nonblocking reduction operations that might change the order of evaluation of the operations. However, as for [[MPI_REDUCE]] , it is strongly recommended that [[MPI_IREDUCE]] be implemented so that the same result be obtained whenever the function is applied on the same arguments, appearing in the same order. Note that this may prevent optimizations that take advantage of the physical location of processes.

> [!note] Advice to users

> For operations which are not truly associative, the result delivered upon completion of the nonblocking reduction may not exactly equal the result delivered by the blocking reduction, even when specifying the same arguments in the same order.

### Nonblocking All-Reduce



![[API/MPI_IALLREDUCE]]

This call starts a nonblocking variant of [[MPI_ALLREDUCE]] (see Section [[coll#All-Reduce|All-Reduce]] ).

### Nonblocking Reduce-Scatter with Equal Blocks



![[API/MPI_IREDUCE_SCATTER_BLOCK]]

This call starts a nonblocking variant of [[MPI_REDUCE_SCATTER_BLOCK]] (see Section [[coll#MPIREDUCESCATTERBLOCK|MPIREDUCESCATTERBLOCK]] ).

### Nonblocking Reduce-Scatter



![[API/MPI_IREDUCE_SCATTER]]

This call starts a nonblocking variant of [[MPI_REDUCE_SCATTER]] (see Section [[coll#MPIREDUCESCATTER|MPIREDUCESCATTER]] ).

### Nonblocking Inclusive Scan



![[API/MPI_ISCAN]]

This call starts a nonblocking variant of [[MPI_SCAN]] (see Section [[coll#Scan|Scan]] ).

### Nonblocking Exclusive Scan



![[API/MPI_IEXSCAN]]

This call starts a nonblocking variant of [[MPI_EXSCAN]] (see Section [[coll#Exclusive Scan|Exclusive Scan]] ).

## Persistent Collective Operations



Many parallel computation algorithms involve repetitively executing a collective communication operation with the same arguments each time. As with persistent point-to-point operations (see [[pt2pt#Persistent Communication Requests|Persistent Communication Requests]] ), persistent collective operations allow the MPI programmer to specify operations that will be reused frequently (with fixed arguments). MPI can be designed to select a more efficient way to perform the collective operation based on the parameters specified when the operation is initialized. This “planned-transfer” approach can offer significant performance benefits for programs with repetitive communication patterns.

In terms of data movement, each persistent collective operation has the same effect as its blocking and nonblocking counterparts for intra-communicators and inter-communicators after completion.

Likewise, upon completion, persistent collective reduction operations perform the same operation as their blocking and nonblocking counterparts, and the same restrictions and recommendations on reduction orders apply (see also Section [[coll#Reduce|Reduce]] ).

Initialization calls for MPI persistent collective operations are non-local and follow all the existing rules for

collective operations, in particular ordering; programs that do not conform to these restrictions are erroneous.

After initialization, all

arrays associated with input arguments (such as arrays of counts, displacements, and datatypes in the vector versions of the collectives) must not be modified

until the corresponding persistent request is freed with [[MPI_REQUEST_FREE]] .

According to the definitions in Section [[terms#MPI Procedures|MPI Procedures]] , the persistent collective initialization procedures are incomplete. They are also non-local procedures because they may or may not return before they are called in all MPI processes of the process group associated with the specified communicator.

> [!note] Advice to users

> This is one of the exceptions in which incomplete procedures are non-local and therefore blocking.

The `request` argument is an output argument

that can be used zero or more times with [[MPI_START]] or [[MPI_STARTALL]] in order to start the collective operation. The `request` is initially inactive after the initialization call.

Once initialized, persistent collective operations can be started in any order and the order can differ among processes in the communicator.

> [!tip] Rationale

> All ordering requirements that an implementation may need to match up collective operations across the communicator are achieved through the ordering requirements of the initialization functions. This enables out-of-order starts for the persistent operations, and particularly supports their use in [[MPI_STARTALL]] .

> [!warning] Advice to implementors

> An MPI implementation should do no worse than duplicating the communicator during the initialization function, caching the input arguments, and calling the appropriate nonblocking collective function, using the cached arguments, during [[MPI_START]] . High-quality implementations should be able to amortize setup costs and further optimize by taking advantage of early-binding, such as efficient and effective pre-allocation of certain resources and algorithm selection.

A request must be inactive when it is started.

Starting the operation makes the request active.

Once any process starts a persistent collective operation, it must complete that operation and all other processes in the communicator must eventually start (and complete) the same persistent collective operation.

Persistent collective

operations cannot be matched with blocking or nonblocking collective

operations.

Completion of a persistent collective operation makes the corresponding request inactive.

After starting a persistent collective operation, all associated send buffers must not be modified and all associated receive buffers must not be accessed until the corresponding persistent request is completed.

Completing a persistent collective request, for example using [[MPI_TEST]] or [[MPI_WAIT]] , makes it inactive, but does not free the request. This is the same behavior as for persistent point-to-point requests.

Inactive persistent collective requests can be freed using [[MPI_REQUEST_FREE]] . It is erroneous to free an active persistent collective request.

Persistent collective operations cannot be canceled; it is erroneous to use [[MPI_CANCEL]] on a persistent collective request.

For every nonblocking collective communication operation in MPI, there is a corresponding persistent collective operation with the analogous API signature.

The collective persistent API signatures include an info object in order to support optimization hints and other information that may be nonstandard. Persistent collective operations may be optimized during communicator creation or by the initialization operation of an individual persistent collective.

Note that communicator-scoped hints should be provided using [[MPI_COMM_SET_INFO]] while, for operation-scoped hints, they are supplied to the persistent collective communication initialization functions using the `info` argument.

### Persistent Barrier Synchronization



![[API/MPI_BARRIER_INIT]]

Creates a persistent collective communication request for the barrier operation.

### Persistent Broadcast



![[API/MPI_BCAST_INIT]]

Creates a persistent collective communication request for the broadcast operation.

### Persistent Gather



![[API/MPI_GATHER_INIT]]

Creates a persistent collective communication request for the gather operation.

![[API/MPI_GATHERV_INIT]]

Creates a persistent collective communication request for the gatherv operation.

### Persistent Scatter



![[API/MPI_SCATTER_INIT]]

Creates a persistent collective communication request for the scatter operation.

![[API/MPI_SCATTERV_INIT]]

Creates a persistent collective communication request for the scatterv operation.

### Persistent Gather-to-all



![[API/MPI_ALLGATHER_INIT]]

Creates a persistent collective communication request for the allgather operation.

![[API/MPI_ALLGATHERV_INIT]]

Creates a persistent collective communication request for the allgatherv operation.

### Persistent All-to-All Scatter/Gather



![[API/MPI_ALLTOALL_INIT]]

Creates a persistent collective communication request for the alltoall operation.

![[API/MPI_ALLTOALLV_INIT]]

Creates a persistent collective communication request for the alltoallv operation.

![[API/MPI_ALLTOALLW_INIT]]

Creates a persistent collective communication request for the alltoallw operation.

### Persistent Reduce



![[API/MPI_REDUCE_INIT]]

Creates a persistent collective communication request for the reduce operation.

### Persistent All-Reduce



![[API/MPI_ALLREDUCE_INIT]]

Creates a persistent collective communication request for the allreduce operation.

### Persistent Reduce-Scatter with Equal Blocks



![[API/MPI_REDUCE_SCATTER_BLOCK_INIT]]

Creates a persistent collective communication request for the reduce-scatter with equal blocks operation.

### Persistent Reduce-Scatter



![[API/MPI_REDUCE_SCATTER_INIT]]

Creates a persistent collective communication request for the reduce-scatter operation.

### Persistent Inclusive Scan



![[API/MPI_SCAN_INIT]]

Creates a persistent collective communication request for the inclusive scan operation.

### Persistent Exclusive Scan



![[API/MPI_EXSCAN_INIT]]

Creates a persistent collective communication request for the exclusive scan operation.

## Correctness



A correct, portable program must invoke collective communications so that deadlock will not occur, whether collective communications are synchronizing or not. The following examples illustrate dangerous use of collective routines on intra-communicators.



The following is erroneous.

    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */
    switch(rank) {
        case 0:
            MPI_Bcast(buf1, count, type, 0, comm);
            MPI_Bcast(buf2, count, type, 1, comm);
            break;
        case 1:
            MPI_Bcast(buf2, count, type, 1, comm);
            MPI_Bcast(buf1, count, type, 0, comm);
            break;
    }

We assume that the group of `comm` is {0,1}. Two processes execute two broadcast operations in reverse order. If the operation is synchronizing then a deadlock will occur.

Collective operations must be executed in the same order at all members of the communication group.



The following is erroneous.

    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */
    switch(rank) {
        case 0:
            MPI_Bcast(buf1, count, type, 0, comm0);
            MPI_Bcast(buf2, count, type, 2, comm2);
            break;
        case 1:
            MPI_Bcast(buf1, count, type, 1, comm1);
            MPI_Bcast(buf2, count, type, 0, comm0);
            break;
        case 2:
            MPI_Bcast(buf1, count, type, 2, comm2);
            MPI_Bcast(buf2, count, type, 1, comm1);
            break;
    }

Assume that the group of `comm0` is {0,1}, of `comm1` is {1, 2} and of `comm2` is {2,0}. If the broadcast is a synchronizing operation, then there is a cyclic dependency: the broadcast in `comm2` completes only after the broadcast in `comm0`; the broadcast in `comm0` completes only after the broadcast in `comm1`; and the broadcast in `comm1` completes only after the broadcast in `comm2`. Thus, the code will deadlock.

Collective operations must be executed in an order so that no cyclic dependencies occur. Nonblocking collective operations can alleviate this issue.



The following is erroneous.

    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */
    switch(rank) {
        case 0:
            MPI_Bcast(buf1, count, type, 0, comm);
            MPI_Send(buf2, count, type, 1, tag, comm);
            break;
        case 1:
            MPI_Recv(buf2, count, type, 0, tag, comm, status);
            MPI_Bcast(buf1, count, type, 0, comm);
            break;
    }

Process zero executes a broadcast, followed by a blocking send operation. Process one first executes a blocking receive that matches the send, followed by broadcast call that matches the broadcast of process zero. This program may deadlock. The broadcast call on process zero *may* block until process one executes the matching broadcast call, so that the send is not executed. Process one will definitely block on the receive and so, in this case, never executes the broadcast.

The relative order of execution of collective operations and point-to-point operations should be such, so that even if the collective operations and the point-to-point operations are synchronizing, no deadlock will occur.



An unsafe, nondeterministic program.

    switch(rank) {
        case 0:
            MPI_Bcast(buf1, count, type, 0, comm);
            MPI_Send(buf2, count, type, 1, tag, comm);
            break;
        case 1:
            MPI_Recv(buf2, count, type, MPI_ANY_SOURCE, tag, comm, status);
            MPI_Bcast(buf1, count, type, 0, comm);
            MPI_Recv(buf2, count, type, MPI_ANY_SOURCE, tag, comm, status);
            break;
        case 2:
            MPI_Send(buf2, count, type, 1, tag, comm);
            MPI_Bcast(buf1, count, type, 0, comm);
            break;
    }

All three processes participate in a broadcast. Process 0 sends a message to process 1 after the broadcast, and process 2 sends a message to process 1 before the broadcast. Process 1 receives before and after the broadcast, with a wildcard source argument.

Two possible executions of this program, with different matchings of sends and receives, are illustrated in Figure [[coll#Correctness|Correctness]] . Note that the second execution has the peculiar effect that a send executed after the broadcast is received at another node before the broadcast. This example illustrates the fact that one should not rely on collective communication functions to have particular synchronization effects. A program that works correctly only when the first execution occurs (only when broadcast is synchronizing) is erroneous.

*Figure: A race condition causes nondeterministic matching of sends and receives. One cannot rely on synchronization from a broadcast to make the program deterministic.*

Finally, in multithreaded implementations, one can have more than one, concurrently executing, collective communication initialization call at an MPI process. In these situations, it is the user’s responsibility to ensure that the same communicator is not used concurrently by two different collective communication initialization calls at the same MPI process. Collective communication initialization calls include all calls for blocking collective operations, all initiation calls for nonblocking collective operations, and all initialization calls for persistent collective operations.

> [!warning] Advice to implementors

> Assume that broadcast is implemented using point-to-point MPI communication. Suppose the following two rules are followed.
>
> 1.  All receives specify their source explicitly (no wildcards).
>
> 2.  Each process sends all messages that pertain to one collective call before sending any message that pertain to a subsequent collective call.
>
> Then, messages belonging to successive broadcasts cannot be confused, as the order of point-to-point messages is preserved.
>
> It is the implementor’s responsibility to ensure that point-to-point messages are not confused with collective messages. One way to accomplish this is, whenever a communicator is created, to also create a “hidden communicator” for collective communication. One could achieve a similar effect more cheaply, for example, by using a hidden tag or context bit to indicate whether the communicator is used for point-to-point or collective communication.



Blocking and nonblocking collective operations can be interleaved, i.e., a blocking collective operation can be posted even if there is a nonblocking collective operation outstanding.

    MPI_Request req;

    MPI_Ibarrier(comm, &req);
    MPI_Bcast(buf1, count, type, 0, comm);
    MPI_Wait(&req, MPI_STATUS_IGNORE);

Each process starts a nonblocking barrier operation, participates in a blocking broadcast and then waits until every other process started the barrier operation. This effectively turns the broadcast into a synchronizing broadcast with possible communication/communication overlap (`MPI_Bcast` is allowed, but not required to synchronize).



The starting order of collective operations on a particular communicator defines their matching. The following example shows an erroneous matching of different collective operations on the same communicator.

    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */
    MPI_Request req;
    switch(rank) {
        case 0:
            /* erroneous matching */
            MPI_Ibarrier(comm, &req);
            MPI_Bcast(buf1, count, type, 0, comm);
            MPI_Wait(&req, MPI_STATUS_IGNORE);
            break;
        case 1:
            /* erroneous matching */
            MPI_Bcast(buf1, count, type, 0, comm);
            MPI_Ibarrier(comm, &req);
            MPI_Wait(&req, MPI_STATUS_IGNORE);
            break;
    }

This ordering would match `MPI_Ibarrier` on rank 0 with `MPI_Bcast` on rank 1 which is erroneous and the program behavior is undefined. However, if such an order is required, the user must create different duplicate communicators and perform the operations on them. If started with two processes, the following program would be correct:

    MPI_Request req;
    MPI_Comm dupcomm;
    MPI_Comm_dup(comm, &dupcomm);
    switch(rank) {
        case 0:
            MPI_Ibarrier(comm, &req);
            MPI_Bcast(buf1, count, type, 0, dupcomm);
            MPI_Wait(&req, MPI_STATUS_IGNORE);
            break;
        case 1:
            MPI_Bcast(buf1, count, type, 0, dupcomm);
            MPI_Ibarrier(comm, &req);
            MPI_Wait(&req, MPI_STATUS_IGNORE);
            break;
    }

> [!note] Advice to users

> The use of different communicators offers some flexibility regarding the matching of nonblocking collective operations. In this sense, communicators could be used as an equivalent to tags. However, communicator construction might induce overheads so that this should be used carefully.



Nonblocking collective operations can rely on the same progression rules as nonblocking point-to-point messages. Thus, if started with two processes, the following program is a valid MPI program and is guaranteed to terminate:

    MPI_Request req;

    switch(rank) {
        case 0:
          MPI_Ibarrier(comm, &req);
          MPI_Wait(&req, MPI_STATUS_IGNORE);
          MPI_Send(buf, count, dtype, 1, tag, comm);
          break;
        case 1:
          MPI_Ibarrier(comm, &req);
          MPI_Recv(buf, count, dtype, 0, tag, comm, MPI_STATUS_IGNORE);
          MPI_Wait(&req, MPI_STATUS_IGNORE);
          break;
    }

The MPI library must *progress* the barrier in the `MPI_Recv` call. Thus, the `MPI_Wait` call in rank 0 will eventually complete, which enables the matching `MPI_Send` so all calls eventually return.



Blocking and nonblocking collective operations do not match. The following example is erroneous.

    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */
    MPI_Request req;

    switch(rank) {
        case 0:
          /* erroneous false matching of Alltoall and Ialltoall */
          MPI_Ialltoall(sbuf, scnt, stype, rbuf, rcnt, rtype, comm, &req);
          MPI_Wait(&req, MPI_STATUS_IGNORE);
          break;
        case 1:
          /* erroneous false matching of Alltoall and Ialltoall */
          MPI_Alltoall(sbuf, scnt, stype, rbuf, rcnt, rtype, comm);
          break;
    }



Collective and point-to-point requests can be mixed in functions that enable multiple completions. If started with two processes, the following program is valid.

    MPI_Request reqs[2];

    switch(rank) {
        case 0:
          MPI_Ibarrier(comm, &reqs[0]);
          MPI_Send(buf, count, dtype, 1, tag, comm);
          MPI_Wait(&reqs[0], MPI_STATUS_IGNORE);
          break;
        case 1:
          MPI_Irecv(buf, count, dtype, 0, tag, comm, &reqs[0]);
          MPI_Ibarrier(comm, &reqs[1]);
          MPI_Waitall(2, reqs, MPI_STATUSES_IGNORE);
          break;
    }

The `MPI_Waitall` call returns only after the barrier and the receive completed.



Multiple nonblocking collective operations can be outstanding on a single communicator and match in order.

    MPI_Request reqs[3];

    compute(buf1);
    MPI_Ibcast(buf1, count, type, 0, comm, &reqs[0]);
    compute(buf2);
    MPI_Ibcast(buf2, count, type, 0, comm, &reqs[1]);
    compute(buf3);
    MPI_Ibcast(buf3, count, type, 0, comm, &reqs[2]);
    MPI_Waitall(3, reqs, MPI_STATUSES_IGNORE);

> [!note] Advice to users

> Pipelining and double-buffering techniques can efficiently be used to overlap computation and communication. However, having too many outstanding requests might have a negative impact on performance.

> [!warning] Advice to implementors

> The use of pipelining may generate many outstanding requests. A high-quality hardware-supported implementation with limited resources should be able to fall back to a software implementation if its resources are exhausted. In this way, the implementation could limit the number of outstanding requests only by the available memory.



Nonblocking collective operations can also be used to enable simultaneous collective operations on multiple overlapping communicators (see Figure [[overlap_comms]] ). The following example is started with three processes and three communicators. The first communicator `comm1` includes ranks 0 and 1, `comm2` includes ranks 1 and 2, and `comm3` spans ranks 0 and 2. It is not possible to perform a blocking collective operation on all communicators because there exists no deadlock-free order to invoke them. However, nonblocking collective operations can easily be used to achieve this task.

    MPI_Request reqs[2];

    switch(rank) {
        case 0:
          MPI_Iallreduce(sbuf1, rbuf1, count, dtype, MPI_SUM, comm1, &reqs[0]);
          MPI_Iallreduce(sbuf3, rbuf3, count, dtype, MPI_SUM, comm3, &reqs[1]);
          break;
        case 1:
          MPI_Iallreduce(sbuf1, rbuf1, count, dtype, MPI_SUM, comm1, &reqs[0]);
          MPI_Iallreduce(sbuf2, rbuf2, count, dtype, MPI_SUM, comm2, &reqs[1]);
          break;
        case 2:
          MPI_Iallreduce(sbuf2, rbuf2, count, dtype, MPI_SUM, comm2, &reqs[0]);
          MPI_Iallreduce(sbuf3, rbuf3, count, dtype, MPI_SUM, comm3, &reqs[1]);
          break;
    }
    MPI_Waitall(2, reqs, MPI_STATUSES_IGNORE);

> [!note] Advice to users

> This method can be useful if overlapping neighboring regions (halo or ghost zones) are used in collective operations. The sequence of the two calls in each process is irrelevant because the two nonblocking operations are performed on different communicators.

*Figure: Example with overlapping communicators.*



The *progress* of multiple outstanding nonblocking collective operations is completely independent.

    MPI_Request reqs[2];

    compute(buf1);
    MPI_Ibcast(buf1, count, type, 0, comm, &reqs[0]);
    compute(buf2);
    MPI_Ibcast(buf2, count, type, 0, comm, &reqs[1]);
    MPI_Wait(&reqs[1], MPI_STATUS_IGNORE);
    /* nothing is known about the status of the first bcast here */
    MPI_Wait(&reqs[0], MPI_STATUS_IGNORE);

Finishing the second [[MPI_IBCAST]] is completely independent of the first one. This means that it is not guaranteed that the first broadcast operation is finished or even started after the second one is completed via `reqs[1]`.


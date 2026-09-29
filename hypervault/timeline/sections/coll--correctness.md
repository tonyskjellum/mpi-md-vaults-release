---
title: "Correctness"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Correctness

Chapter **coll** · in [[versions/v13/sections/coll#Correctness|MPI-1.3]], [[versions/v21/sections/coll#Correctness|MPI-2.1]], [[versions/v22/sections/coll#Correctness|MPI-2.2]], [[versions/v30/sections/coll#Correctness|MPI-3.0]], [[versions/v31/sections/coll#Correctness|MPI-3.1]], [[versions/v40/sections/coll#Correctness|MPI-4.0]], [[versions/v41/sections/coll#Correctness|MPI-4.1]], [[versions/v50/sections/coll#Correctness|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~A correct, portable program must invoke collective communications so that deadlock will not occur, whether collective communications are synchronizing or not. The following examples illustrate dangerous use of collective routines.~~

==A correct, portable program must invoke collective communications so that deadlock will not occur, whether collective communications are synchronizing or not. The following examples illustrate dangerous use of collective routines==

==on intracommunicators.==

~~A correct, but~~ ==An unsafe,== non-deterministic program.

Two possible executions of this program, with different matchings of sends and receives, are illustrated in ~~figure~~ ==Figure== [[versions/v21/sections/coll#Correctness|Correctness]] . Note that the second execution has the peculiar effect that a send executed after the broadcast is received at another node before the broadcast. This example illustrates the fact that one should not rely on collective communication functions to have particular synchronization effects. A program that works correctly only when the first execution occurs (only when broadcast is synchronizing) is erroneous.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~A correct, portable program must invoke collective communications so that deadlock will not occur, whether collective communications are synchronizing or not. The following examples illustrate dangerous use of collective routines~~

~~on intracommunicators.~~

==A correct, portable program must invoke collective communications so that deadlock will not occur, whether collective communications are synchronizing or not. The following examples illustrate dangerous use of collective routines on intracommunicators.==

Collective operations must be executed in an order so that no cyclic ~~dependences~~ ==dependencies== occur. ==Nonblocking collective operations can alleviate this issue.==

== Blocking and nonblocking collective operations can be interleaved, i.e., a blocking collective operation can be posted even if there is a nonblocking collective operation outstanding.==

==    MPI_Request req;==

==    MPI_Ibarrier(comm, &req);     MPI_Bcast(buf1, count, type, 0, comm);     MPI_Wait(&req, MPI_STATUS_IGNORE);==

==Each process starts a nonblocking barrier operation, participates in a blocking broadcast and then waits until every other process started the barrier operation. This effectively turns the broadcast into a synchronizing broadcast with possible communication/communication overlap (`MPI_Bcast` is allowed, but not required to synchronize).==

== The starting order of collective operations on a particular communicator defines their matching. The following example shows an erroneous matching of different collective operations on the same communicator.==

==    MPI_Request req;     switch(rank) {         case 0:             /* erroneous matching */             MPI_Ibarrier(comm, &req);             MPI_Bcast(buf1, count, type, 0, comm);             MPI_Wait(&req, MPI_STATUS_IGNORE);             break;         case 1:             /* erroneous matching */             MPI_Bcast(buf1, count, type, 0, comm);             MPI_Ibarrier(comm, &req);             MPI_Wait(&req, MPI_STATUS_IGNORE);             break;     }==

==This ordering would match `MPI_Ibarrier` on rank 0 with `MPI_Bcast` on rank 1 which is erroneous and the program behavior is undefined. However, if such an order is required, the user must create different duplicate communicators and perform the operations on them. If started with two processes, the following program would be correct:==

==    MPI_Request req;     MPI_Comm dupcomm;     MPI_Comm_dup(comm, &dupcomm);     switch(rank) {         case 0:             MPI_Ibarrier(comm, &req);             MPI_Bcast(buf1, count, type, 0, dupcomm);             MPI_Wait(&req, MPI_STATUS_IGNORE);             break;         case 1:             MPI_Bcast(buf1, count, type, 0, dupcomm);             MPI_Ibarrier(comm, &req);             MPI_Wait(&req, MPI_STATUS_IGNORE);             break;     }==

==> [!note] Advice to users==

==> The use of different communicators offers some flexibility regarding the matching of nonblocking collective operations. In this sense, communicators could be used as an equivalent to tags. However, communicator construction might induce overheads so that this should be used carefully.==

== Nonblocking collective operations can rely on the same progression rules as nonblocking point-to-point messages. Thus, if started with two processes, the following program is a valid MPI program and is guaranteed to terminate:==

==    MPI_Request req;==

==    switch(rank) {         case 0:           MPI_Ibarrier(comm, &req);           MPI_Wait(&req, MPI_STATUS_IGNORE);           MPI_Send(buf, count, dtype, 1, tag, comm);           break;         case 1:           MPI_Ibarrier(comm, &req);           MPI_Recv(buf, count, dtype, 0, tag, comm, MPI_STATUS_IGNORE);           MPI_Wait(&req, MPI_STATUS_IGNORE);           break;     }==

==The MPI library must progress the barrier in the `MPI_Recv` call. Thus, the `MPI_Wait` call in rank 0 will eventually complete, which enables the matching `MPI_Send` so all calls eventually return.==

== Blocking and nonblocking collective operations do not match. The following example is erroneous.==

==    MPI_Request req;==

==    switch(rank) {         case 0:           /* erroneous false matching of Alltoall and Ialltoall */           MPI_Ialltoall(sbuf, scnt, stype, rbuf, rcnt, rtype, comm, &req);           MPI_Wait(&req, MPI_STATUS_IGNORE);           break;         case 1:           /* erroneous false matching of Alltoall and Ialltoall */           MPI_Alltoall(sbuf, scnt, stype, rbuf, rcnt, rtype, comm);           break;     }==

== Collective and point-to-point requests can be mixed in functions that enable multiple completions. If started with two processes, the following program is valid.==

==    MPI_Request reqs[2];==

==    switch(rank) {         case 0:           MPI_Ibarrier(comm, &reqs[0]);           MPI_Send(buf, count, dtype, 1, tag, comm);           MPI_Wait(&reqs[0], MPI_STATUS_IGNORE);           break;         case 1:           MPI_Irecv(buf, count, dtype, 0, tag, comm, &reqs[0]);           MPI_Ibarrier(comm, &reqs[1]);           MPI_Waitall(2, reqs, MPI_STATUSES_IGNORE);           break;     }==

==The `MPI_Waitall` call returns only after the barrier and the receive completed.==

== Multiple nonblocking collective operations can be outstanding on a single communicator and match in order.==

==    MPI_Request reqs[3];==

==    compute(buf1);     MPI_Ibcast(buf1, count, type, 0, comm, &reqs[0]);     compute(buf2);     MPI_Ibcast(buf2, count, type, 0, comm, &reqs[1]);     compute(buf3);     MPI_Ibcast(buf3, count, type, 0, comm, &reqs[2]);     MPI_Waitall(3, reqs, MPI_STATUSES_IGNORE);==

==> [!note] Advice to users==

==> Pipelining and double-buffering techniques can efficiently be used to overlap computation and communication. However, having too many outstanding requests might have a negative impact on performance.==

==> [!warning] Advice to implementors==

==> The use of pipelining may generate many outstanding requests. A high-quality hardware-supported implementation with limited resources should be able to fall back to a software implementation if its resources are exhausted. In this way, the implementation could limit the number of outstanding requests only by the available memory.==

== The progress of multiple outstanding nonblocking collective operations is completely independent.==

==    MPI_Request reqs[2];==

==    compute(buf1);     MPI_Ibcast(buf1, count, type, 0, comm, &reqs[0]);     compute(buf2);     MPI_Ibcast(buf2, count, type, 0, comm, &reqs[1]);     MPI_Wait(&reqs[1], MPI_STATUS_IGNORE);     /* nothing is known about the status of the first bcast here */     MPI_Wait(&reqs[0], MPI_STATUS_IGNORE);==

==Finishing the second [[versions/v30/API/MPI_IBCAST|MPI_IBCAST]] is completely independent of the first one. This means that it is not guaranteed that the first broadcast operation is finished or even started after the second one is completed via `reqs[1]`.==

### MPI-3.0 → MPI-3.1  (13 changed paragraphs)

The following is erroneous.

We assume that the group of ~~<span class="sans-serif">comm</span>~~ ==`comm`== is {0,1}. Two processes execute two broadcast operations in reverse order. If the operation is synchronizing then a deadlock will occur.

The following is erroneous.

Assume that the group of ~~<span class="sans-serif">comm0</span>~~ ==`comm0`== is {0,1}, of ~~<span class="sans-serif">comm1</span>~~ ==`comm1`== is {1, 2} and of ~~<span class="sans-serif">comm2</span>~~ ==`comm2`== is {2,0}. If the broadcast is a synchronizing operation, then there is a cyclic dependency: the broadcast in ~~<span class="sans-serif">comm2</span>~~ ==`comm2`== completes only after the broadcast in ~~<span class="sans-serif">comm0</span>;~~ ==`comm0`;== the broadcast in ~~<span class="sans-serif">comm0</span>~~ ==`comm0`== completes only after the broadcast in ~~<span class="sans-serif">comm1</span>;~~ ==`comm1`;== and the broadcast in ~~<span class="sans-serif">comm1</span>~~ ==`comm1`== completes only after the broadcast in ~~<span class="sans-serif">comm2</span>.~~ ==`comm2`.== Thus, the code will deadlock.

The following is erroneous.

An unsafe, non-deterministic program.

Blocking and nonblocking collective operations can be interleaved, i.e., a blocking collective operation can be posted even if there is a nonblocking collective operation outstanding.

The starting order of collective operations on a particular communicator defines their matching. The following example shows an erroneous matching of different collective operations on the same communicator.

Nonblocking collective operations can rely on the same progression rules as nonblocking point-to-point messages. Thus, if started with two processes, the following program is a valid MPI program and is guaranteed to terminate:

Blocking and nonblocking collective operations do not match. The following example is erroneous.

Collective and point-to-point requests can be mixed in functions that enable multiple completions. If started with two processes, the following program is valid.

Multiple nonblocking collective operations can be outstanding on a single communicator and match in order.

~~ The progress of multiple outstanding nonblocking collective operations is completely independent.~~

==Nonblocking collective operations can also be used to enable simultaneous collective operations on multiple overlapping communicators (see Figure [[overlap_comms]] ). The following example is started with three processes and three communicators. The first communicator `comm1` includes ranks 0 and 1, `comm2` includes ranks 1 and 2, and `comm3` spans ranks 0 and 2. It is not possible to perform a blocking collective operation on all communicators because there exists no deadlock-free order to invoke them. However, nonblocking collective operations can easily be used to achieve this task.==

==    MPI_Request reqs[2];==

==    switch(rank) {         case 0:           MPI_Iallreduce(sbuf1, rbuf1, count, dtype, MPI_SUM, comm1, &reqs[0]);           MPI_Iallreduce(sbuf3, rbuf3, count, dtype, MPI_SUM, comm3, &reqs[1]);           break;         case 1:           MPI_Iallreduce(sbuf1, rbuf1, count, dtype, MPI_SUM, comm1, &reqs[0]);           MPI_Iallreduce(sbuf2, rbuf2, count, dtype, MPI_SUM, comm2, &reqs[1]);           break;         case 2:           MPI_Iallreduce(sbuf2, rbuf2, count, dtype, MPI_SUM, comm2, &reqs[0]);           MPI_Iallreduce(sbuf3, rbuf3, count, dtype, MPI_SUM, comm3, &reqs[1]);           break;     }     MPI_Waitall(2, reqs, MPI_STATUSES_IGNORE);==

==> [!note] Advice to users==

==> This method can be useful if overlapping neighboring regions (halo or ghost zones) are used in collective operations. The sequence of the two calls in each process is irrelevant because the two nonblocking operations are performed on different communicators.==

==*Figure: Example with overlapping communicators.*==

==The progress of multiple outstanding nonblocking collective operations is completely independent.==

### MPI-3.1 → MPI-4.0  (10 changed paragraphs)

A correct, portable program must invoke collective communications so that deadlock will not occur, whether collective communications are synchronizing or not. The following examples illustrate dangerous use of collective routines on ~~intracommunicators.~~ ==intra-communicators.==

==/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */== switch(rank) { case 0: MPI_Bcast(buf1, count, type, 0, comm); MPI_Bcast(buf2, count, type, 1, comm); break; case 1: MPI_Bcast(buf2, count, type, 1, comm); MPI_Bcast(buf1, count, type, 0, comm); break; }

==/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */== switch(rank) { case 0: MPI_Bcast(buf1, count, type, 0, comm0); MPI_Bcast(buf2, count, type, 2, comm2); break; case 1: MPI_Bcast(buf1, count, type, 1, comm1); MPI_Bcast(buf2, count, type, 0, comm0); break; case 2: MPI_Bcast(buf1, count, type, 2, comm2); MPI_Bcast(buf2, count, type, 1, comm1); break; }

==/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */== switch(rank) { case 0: MPI_Bcast(buf1, count, type, 0, comm); MPI_Send(buf2, count, type, 1, tag, comm); break; case 1: MPI_Recv(buf2, count, type, 0, tag, comm, status); MPI_Bcast(buf1, count, type, 0, comm); break; }

An unsafe, ~~non-deterministic~~ ==nondeterministic== program.

*Figure: A race condition causes ~~non-deterministic~~ ==nondeterministic== matching of sends and receives. One cannot rely on synchronization from a broadcast to make the program deterministic.*

Finally, in multithreaded implementations, one can have more than one, concurrently executing, collective communication ==initialization== call at ~~a~~ ==an MPI== process. In these situations, it is the user’s responsibility to ensure that the same communicator is not used concurrently by two different collective communication ==initialization== calls at the same ==MPI== process. ==Collective communication initialization calls include all calls for blocking collective operations, all initiation calls for nonblocking collective operations, and all initialization calls for persistent collective operations.==

==/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */== MPI_Request req; switch(rank) { case 0: /* erroneous matching */ MPI_Ibarrier(comm, &req); MPI_Bcast(buf1, count, type, 0, comm); MPI_Wait(&req, MPI_STATUS_IGNORE); break; case 1: /* erroneous matching */ MPI_Bcast(buf1, count, type, 0, comm); MPI_Ibarrier(comm, &req); MPI_Wait(&req, MPI_STATUS_IGNORE); break; }

The MPI library must ~~progress~~ ==*progress*== the barrier in the `MPI_Recv` call. Thus, the `MPI_Wait` call in rank 0 will eventually complete, which enables the matching `MPI_Send` so all calls eventually return.

==/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */== MPI_Request req;

The ~~progress~~ ==*progress*== of multiple outstanding nonblocking collective operations is completely independent.

### MPI-4.0 → MPI-4.1  (13 changed paragraphs)

~~    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */     switch(rank) {         case 0:             MPI_Bcast(buf1, count, type, 0, comm);             MPI_Bcast(buf2, count, type, 1, comm);             break;         case 1:             MPI_Bcast(buf2, count, type, 1, comm);             MPI_Bcast(buf1, count, type, 0, comm);             break;     }~~

~~We assume that the group of `comm` is {0,1}. Two processes execute two broadcast operations in reverse order. If the operation is synchronizing then a deadlock will occur.~~

==(code block added)==
``` [MPI]C
/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */
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
```

==We assume that the group of `comm` is {0,1}. Two MPI processes execute two broadcast operations in reverse order. If the operation is synchronizing then a deadlock will occur.==

~~    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */     switch(rank) {         case 0:             MPI_Bcast(buf1, count, type, 0, comm0);             MPI_Bcast(buf2, count, type, 2, comm2);             break;         case 1:             MPI_Bcast(buf1, count, type, 1, comm1);             MPI_Bcast(buf2, count, type, 0, comm0);             break;         case 2:             MPI_Bcast(buf1, count, type, 2, comm2);             MPI_Bcast(buf2, count, type, 1, comm1);             break;     }~~

==(code block added)==
``` [MPI]C
/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */
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
```

~~    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */     switch(rank) {         case 0:             MPI_Bcast(buf1, count, type, 0, comm);             MPI_Send(buf2, count, type, 1, tag, comm);             break;         case 1:             MPI_Recv(buf2, count, type, 0, tag, comm, status);             MPI_Bcast(buf1, count, type, 0, comm);             break;     }~~

~~Process zero executes a broadcast, followed by a blocking send operation. Process one first executes a blocking receive that matches the send, followed by broadcast call that matches the broadcast of process zero. This program may deadlock. The broadcast call on process zero *may* block until process one executes the matching broadcast call, so that the send is not executed. Process one will definitely block on the receive and so, in this case, never executes the broadcast.~~

==(code block added)==
``` [MPI]C
/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */
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
```

==MPI process with rank `0` executes a broadcast, followed by a blocking send operation. MPI process with rank `1` first executes a blocking receive that matches the send, followed by a broadcast call that matches the broadcast of MPI process with rank `0`. This program may deadlock. The broadcast call on MPI process with rank `0` *may* block until MPI process with rank `1` executes the matching broadcast call, so that the send is not executed. MPI process with rank `1` will definitely block on the receive and so, in this case, never executes the broadcast.==

~~    switch(rank) {         case 0:             MPI_Bcast(buf1, count, type, 0, comm);             MPI_Send(buf2, count, type, 1, tag, comm);             break;         case 1:             MPI_Recv(buf2, count, type, MPI_ANY_SOURCE, tag, comm, status);             MPI_Bcast(buf1, count, type, 0, comm);             MPI_Recv(buf2, count, type, MPI_ANY_SOURCE, tag, comm, status);             break;         case 2:             MPI_Send(buf2, count, type, 1, tag, comm);             MPI_Bcast(buf1, count, type, 0, comm);             break;     }~~

~~All three processes participate in a broadcast. Process 0 sends a message to process 1 after the broadcast, and process 2 sends a message to process 1 before the broadcast. Process 1 receives before and after the broadcast, with a wildcard source argument.~~

==(code block added)==
``` [MPI]C
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
```

==All three MPI processes participate in a broadcast. MPI process with rank `0` sends a message to MPI process with rank `1` after the broadcast, and MPI process with rank `2` sends a message to MPI process with rank `1` before the broadcast. MPI process with rank `1` receives before and after the broadcast, with a wildcard source argument.==

> Assume that broadcast is implemented using point-to-point MPI communication. Suppose the following two rules are followed. > > 1. All receives specify their source explicitly (no wildcards). > > 2. Each ==MPI== process sends all messages that pertain to one collective call before sending any message that pertain to a subsequent collective call. > > Then, messages belonging to successive broadcasts cannot be confused, as the order of point-to-point messages is preserved. > > It is the implementor’s responsibility to ensure that point-to-point messages are not confused with collective messages. One way to accomplish this is, whenever a communicator is created, to also create a “hidden communicator” for collective communication. One could achieve a similar effect more cheaply, for example, by using a hidden tag or context bit to indicate whether the communicator is used for point-to-point or collective communication.

~~    MPI_Request req;~~

~~    MPI_Ibarrier(comm, &req);     MPI_Bcast(buf1, count, type, 0, comm);     MPI_Wait(&req, MPI_STATUS_IGNORE);~~

~~Each process starts a nonblocking barrier operation, participates in a blocking broadcast and then waits until every other process started the barrier operation. This effectively turns the broadcast into a synchronizing broadcast with possible communication/communication overlap (`MPI_Bcast` is allowed, but not required to synchronize).~~

==(code block added)==
``` [MPI]C
MPI_Request req;

MPI_Ibarrier(comm, &req);
MPI_Bcast(buf1, count, type, 0, comm);
MPI_Wait(&req, MPI_STATUS_IGNORE);
```

==Each MPI process starts a nonblocking barrier operation, participates in a blocking broadcast and then waits until every other MPI process started the barrier operation. This effectively turns the broadcast into a synchronizing broadcast with possible communication/communication overlap (`MPI_Bcast` is allowed, but not required to synchronize).==

~~    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */     MPI_Request req;     switch(rank) {         case 0:             /* erroneous matching */             MPI_Ibarrier(comm, &req);             MPI_Bcast(buf1, count, type, 0, comm);             MPI_Wait(&req, MPI_STATUS_IGNORE);             break;         case 1:             /* erroneous matching */             MPI_Bcast(buf1, count, type, 0, comm);             MPI_Ibarrier(comm, &req);             MPI_Wait(&req, MPI_STATUS_IGNORE);             break;     }~~

~~This ordering would match `MPI_Ibarrier` on rank 0 with `MPI_Bcast` on rank 1 which is erroneous and the program behavior is undefined. However, if such an order is required, the user must create different duplicate communicators and perform the operations on them. If started with two processes, the following program would be correct:~~

~~    MPI_Request req;     MPI_Comm dupcomm;     MPI_Comm_dup(comm, &dupcomm);     switch(rank) {         case 0:             MPI_Ibarrier(comm, &req);             MPI_Bcast(buf1, count, type, 0, dupcomm);             MPI_Wait(&req, MPI_STATUS_IGNORE);             break;         case 1:             MPI_Bcast(buf1, count, type, 0, dupcomm);             MPI_Ibarrier(comm, &req);             MPI_Wait(&req, MPI_STATUS_IGNORE);             break;     }~~

==(code block added)==
``` [MPI]C
/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */
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
```

==This ordering would match `MPI_Ibarrier` on rank 0 with `MPI_Bcast` on rank 1, which is erroneous and the program behavior is undefined. However, if such an order is required, the user must create different duplicate communicators and perform the operations on them. If started with two MPI processes, the following program would be correct:==

==(code block added)==
``` [MPI]C
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
```

~~Nonblocking collective operations can rely on the same progression rules as nonblocking point-to-point messages. Thus, if started with two processes, the following program is a valid MPI program and is guaranteed to terminate:~~

~~    MPI_Request req;~~

~~    switch(rank) {         case 0:           MPI_Ibarrier(comm, &req);           MPI_Wait(&req, MPI_STATUS_IGNORE);           MPI_Send(buf, count, dtype, 1, tag, comm);           break;         case 1:           MPI_Ibarrier(comm, &req);           MPI_Recv(buf, count, dtype, 0, tag, comm, MPI_STATUS_IGNORE);           MPI_Wait(&req, MPI_STATUS_IGNORE);           break;     }~~

==Nonblocking collective operations can rely on the similar progress rules as nonblocking point-to-point operations. Thus, if started with two MPI processes, the following program is a valid MPI program and is guaranteed to terminate:==

==(code block added)==
``` [MPI]C
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
```

~~    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */     MPI_Request req;~~

~~    switch(rank) {         case 0:           /* erroneous false matching of Alltoall and Ialltoall */           MPI_Ialltoall(sbuf, scnt, stype, rbuf, rcnt, rtype, comm, &req);           MPI_Wait(&req, MPI_STATUS_IGNORE);           break;         case 1:           /* erroneous false matching of Alltoall and Ialltoall */           MPI_Alltoall(sbuf, scnt, stype, rbuf, rcnt, rtype, comm);           break;     }~~

~~Collective and point-to-point requests can be mixed in functions that enable multiple completions. If started with two processes, the following program is valid.~~

~~    MPI_Request reqs[2];~~

~~    switch(rank) {         case 0:           MPI_Ibarrier(comm, &reqs[0]);           MPI_Send(buf, count, dtype, 1, tag, comm);           MPI_Wait(&reqs[0], MPI_STATUS_IGNORE);           break;         case 1:           MPI_Irecv(buf, count, dtype, 0, tag, comm, &reqs[0]);           MPI_Ibarrier(comm, &reqs[1]);           MPI_Waitall(2, reqs, MPI_STATUSES_IGNORE);           break;     }~~

==(code block added)==
``` [MPI]C
/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */
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
```

==Collective and point-to-point requests can be mixed in functions that enable multiple completions. If started with two MPI processes, the following program is valid.==

==(code block added)==
``` [MPI]C
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
```

~~    MPI_Request reqs[3];~~

~~    compute(buf1);     MPI_Ibcast(buf1, count, type, 0, comm, &reqs[0]);     compute(buf2);     MPI_Ibcast(buf2, count, type, 0, comm, &reqs[1]);     compute(buf3);     MPI_Ibcast(buf3, count, type, 0, comm, &reqs[2]);     MPI_Waitall(3, reqs, MPI_STATUSES_IGNORE);~~

==(code block added)==
``` [MPI]C
MPI_Request reqs[3];

compute(buf1);
MPI_Ibcast(buf1, count, type, 0, comm, &reqs[0]);
compute(buf2);
MPI_Ibcast(buf2, count, type, 0, comm, &reqs[1]);
compute(buf3);
MPI_Ibcast(buf3, count, type, 0, comm, &reqs[2]);
MPI_Waitall(3, reqs, MPI_STATUSES_IGNORE);
```

Nonblocking collective operations can also be used to enable simultaneous collective operations on multiple overlapping communicators (see Figure [[overlap_comms]] ). The following example is started with three ==MPI== processes and three communicators. The first communicator `comm1` includes ranks 0 and 1, `comm2` includes ranks 1 and 2, and `comm3` spans ranks 0 and 2. It is not possible to perform a blocking collective operation on all communicators because there exists no deadlock-free order to invoke them. However, nonblocking collective operations can easily be used to achieve this task.

==[language={[MPI]C},basicstyle=]== MPI_Request reqs[2];

> This method can be useful if overlapping neighboring regions (halo or ghost zones) are used in collective operations. The sequence of the two calls in each ==MPI== process is irrelevant because the two nonblocking operations are performed on different communicators.

~~    MPI_Request reqs[2];~~

~~    compute(buf1);     MPI_Ibcast(buf1, count, type, 0, comm, &reqs[0]);     compute(buf2);     MPI_Ibcast(buf2, count, type, 0, comm, &reqs[1]);     MPI_Wait(&reqs[1], MPI_STATUS_IGNORE);     /* nothing is known about the status of the first bcast here */     MPI_Wait(&reqs[0], MPI_STATUS_IGNORE);~~

==(code block added)==
``` [MPI]C
MPI_Request reqs[2];

compute(buf1);
MPI_Ibcast(buf1, count, type, 0, comm, &reqs[0]);
compute(buf2);
MPI_Ibcast(buf2, count, type, 0, comm, &reqs[1]);
MPI_Wait(&reqs[1], MPI_STATUS_IGNORE);
/* nothing is known about the status of the first bcast here */
MPI_Wait(&reqs[0], MPI_STATUS_IGNORE);
```

### MPI-4.1 → MPI-5.0  (4 changed paragraphs)

Assume that the group of `comm0` is {0,1}, of `comm1` is ~~{1, 2}~~ =={1,2}== and of `comm2` is {2,0}. If the broadcast is a synchronizing operation, then there is a cyclic dependency: the broadcast in `comm2` completes only after the broadcast in `comm0`; the broadcast in `comm0` completes only after the broadcast in `comm1`; and the broadcast in `comm1` completes only after the broadcast in `comm2`. Thus, the code will deadlock.

The relative order of execution of collective operations and point-to-point operations ~~should~~ ==must== be such, so that even if the collective operations and the point-to-point operations are synchronizing, no deadlock will occur.

==*Figure: Example with overlapping communicators*==

~~*Figure: Example with overlapping communicators.*~~

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Correctness]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Correctness]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Correctness]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Correctness]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Correctness]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Correctness]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Correctness]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Correctness]]

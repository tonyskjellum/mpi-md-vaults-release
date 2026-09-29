# One-Sided Communications



## Introduction

Remote Memory Access (RMA) extends the communication mechanisms of MPI by allowing one process to specify all communication parameters, both for the sending side and for the receiving side. This mode of communication facilitates the coding of some applications with dynamically changing data access patterns where the data distribution is fixed or slowly changing.

In such a case, each process can compute what data it needs to access or update at other processes. However, processes may not know which data in their own memory need to be accessed or updated by remote processes, and may not even know the identity of these processes. Thus, the transfer parameters are all available only on one side. Regular send/receive communication requires matching operations by sender and receiver.

In order to issue the matching operations, an application needs to distribute the transfer parameters. This may require all processes to participate in a time consuming global computation, or to periodically poll for potential communication requests to receive and act upon. The use of RMA communication mechanisms avoids the need for global computations or explicit polling. A generic example of this nature is the execution of an assignment of the form `A = B(map)`, where `map` is a permutation vector, and `A, B` and `map` are distributed in the same manner.

Message-passing communication achieves two effects: *communication* of data from sender to receiver; and *synchronization* of sender with receiver. The RMA design separates these two functions. Three communication calls are provided: [[MPI_PUT]] (remote write), [[MPI_GET]] (remote read) and [[MPI_ACCUMULATE]] (remote update). A larger number of synchronization calls are provided that support different synchronization styles. The design is similar to that of weakly coherent memory systems: correct ordering of memory accesses has to be imposed by the user, using synchronization calls; the implementation can delay communication operations until the synchronization calls occur, for efficiency.

The design of the RMA functions allows implementors to take advantage, in many cases, of fast communication mechanisms provided by various platforms, such as coherent or noncoherent shared memory, DMA engines, hardware-supported put/get operations, communication coprocessors, etc. The most frequently used RMA communication mechanisms can be layered on top of message-passing. However, support for asynchronous communication agents (handlers, threads, etc.) is needed, for certain RMA functions, in a distributed memory environment.

We shall denote by **origin** the process that performs the call, and by **target** the process in which the memory is accessed. Thus, in a put operation, source=origin and destination=target; in a get operation, source=target and destination=origin.

## Initialization

### Window Creation

The initialization operation allows each process in an intracommunicator

group to specify, in a collective operation, a “window” in its memory that is made accessible to accesses by remote processes. The call returns an opaque object that represents the group of processes that own and access the set of windows, and the attributes of each window, as specified by the initialization call.

![[API/MPI_WIN_CREATE]]

This is a collective call executed by all processes in the group of `comm`. It returns a window object that can be used by these processes to perform RMA operations. Each process specifies a window of existing memory that it exposes to RMA accesses by the processes in the group of `comm`. The window consists of `size` bytes, starting at address `base`. A process may elect to expose no memory by specifying `size = 0`.

The displacement unit argument is provided to facilitate address arithmetic in RMA operations: the target displacement argument of an RMA operation is scaled by the factor `disp_unit` specified by the target process, at window creation.

> [!tip] Rationale

> The window size is specified using an address sized integer, so as to allow windows that span more than 4 GB of address space. (Even if the physical memory size is less than 4 GB, the address range may be larger than 4 GB, if addresses are not contiguous.)

> [!note] Advice to users

> Common choices for `disp_unit` are 1 (no scaling), and (in C syntax) `sizeof(type)`, for a window that consists of an array of elements of type `type`. The later choice will allow one to use array indices in RMA calls, and have those scaled correctly to byte displacements, even in a heterogeneous environment.

The `info` argument provides optimization hints to the runtime about the expected usage pattern of the window. The following info key is predefined:

`no_locks` — if set to `true`, then the implementation may assume that the local window is never locked (by a call to [[MPI_WIN_LOCK]] ). This implies that this window is not used for 3-party communication, and RMA can be implemented with no (less) asynchronous agent activity at this process.

The various processes in the group of `comm` may specify completely different target windows, in location, size, displacement units and info arguments. As long as all the get, put and accumulate accesses to a particular process fit their specific target window this should pose no problem. The same area in memory may appear in multiple windows, each associated with a different window object. However, concurrent communications to distinct, overlapping windows may lead to erroneous results.

> [!note] Advice to users

> A window can be created in any part of the process memory. However, on some systems, the performance of windows in memory allocated by [[MPI_ALLOC_MEM]] (Section [[inquiry#Memory Allocation|Memory Allocation]] , page [[inquiry#Memory Allocation|Memory Allocation]] ) will be better. Also, on some systems, performance is improved when window boundaries are aligned at “natural” boundaries (word, double-word, cache line, page frame, etc.).

> [!warning] Advice to implementors

> In cases where RMA operations use different mechanisms in different memory areas (e.g., load/store in a shared memory segment, and an asynchronous handler in private memory), the [[MPI_WIN_CREATE]] call needs to figure out which type of memory is used for the window. To do so, MPI maintains, internally, the list of memory segments allocated by [[MPI_ALLOC_MEM]] , or by other, implementation specific, mechanisms, together with information on the type of memory segment allocated. When a call to [[MPI_WIN_CREATE]] occurs, then MPI checks which segment contains each window, and decides, accordingly, which mechanism to use for RMA operations.
>
> Vendors may provide additional, implementation-specific mechanisms to allow “good” memory to be used for static variables.
>
> Implementors should document any performance impact of window alignment.

![[API/MPI_WIN_FREE]]

Frees the window object `win` and returns a null handle (equal to MPI_WIN_NULL). This is a collective call executed by all processes in the group associated with `win`. [[MPI_WIN_FREE]] can be invoked by a process only after it has completed its involvement in RMA communications on window `win`: i.e., the process has called [[MPI_WIN_FENCE]] , or called [[MPI_WIN_WAIT]] to match a previous call to [[MPI_WIN_POST]] or called [[MPI_WIN_COMPLETE]] to match a previous call to `MPI_WIN_START` or called `MPI_WIN_UNLOCK` to match a previous call to `MPI_WIN_LOCK`. When the call returns, the window memory can be freed.

> [!warning] Advice to implementors

> [[MPI_WIN_FREE]] requires a barrier synchronization: no process can return from free until all processes in the group of `win` called free. This, to ensure that no process will attempt to access a remote window (e.g., with lock/unlock) after it was freed.

### Window Attributes

The following three attributes are cached with a window, when the window is created.

window base address.

window size, in bytes.

displacement unit associated with the window.

In C, calls to `MPI_Win_get_attr(win, MPI_WIN_BASE, &base, &flag)`,

`MPI_Win_get_attr(win, MPI_WIN_SIZE, &size, &flag)` and

`MPI_Win_get_attr(win, MPI_WIN_DISP_UNIT, &disp_unit, &flag)` will return in `base` a pointer to the start of the window `win`, and will return in `size` and `disp_unit` pointers to the size and displacement unit of the window, respectively. And similarly, in C++.

In Fortran, calls to [[MPI_WIN_GET_ATTR]] ,

[[MPI_WIN_GET_ATTR]] and

[[MPI_WIN_GET_ATTR]] will return in `base, size` and `disp_unit` the (integer representation of) the base address, the size and the displacement unit of the window `win`, respectively. (The window attribute access functions are defined in

Section [[context#Windows|Windows]] , page [[context#Windows|Windows]] .)

The other “window attribute,” namely the group of processes attached to the window, can be retrieved using the call below.

![[API/MPI_WIN_GET_GROUP]]

`MPI_WIN_GET_GROUP` returns a duplicate of the group of the communicator used to create the window. associated with `win`. The group is returned in `group`.

## Communication Calls



MPI supports three RMA communication calls: [[MPI_PUT]] transfers data from the caller memory (origin) to the target memory; [[MPI_GET]] transfers data from the target memory to the caller memory; and [[MPI_ACCUMULATE]] updates locations in the target memory, e.g. by adding to these locations values sent from the caller memory. These operations are *nonblocking*: the call initiates the transfer, but the transfer may continue after the call returns. The transfer is completed, both at the origin and at the target, when a subsequent *synchronization* call is issued by the caller on the involved window object. These synchronization calls are described in Section [[one-side#Synchronization Calls|Synchronization Calls]] , page [[one-side#Synchronization Calls|Synchronization Calls]] .

The local communication buffer of an RMA call should not be updated, and the local communication buffer of a get call should not be accessed after the RMA call, until the subsequent synchronization call completes.

> [!tip] Rationale

> The rule above is more lenient than for message-passing, where we do not allow two concurrent sends, with overlapping send buffers. Here, we allow two concurrent puts with overlapping send buffers. The reasons for this relaxation are
>
> 1.  Users do not like that restriction, which is not very natural (it prohibits concurrent reads).
>
> 2.  Weakening the rule does not prevent efficient implementation, as far as we know.
>
> 3.  Weakening the rule is important for performance of RMA: we want to associate one synchronization call with as many RMA operations is possible. If puts from overlapping buffers cannot be concurrent, then we need to needlessly add synchronization points in the code.

It is erroneous to have concurrent conflicting accesses to the same memory location in a window; if a location is updated by a put or accumulate operation, then this location cannot be accessed by a load or another RMA operation until the updating operation has completed at the target. There is one exception to this rule; namely, the same location can be updated by several concurrent accumulate calls, the outcome being as if these updates occurred in some order. In addition, a window cannot concurrently be updated by a put or accumulate operation and by a local store operation. This, even if these two updates access different locations in the window. The last restriction enables more efficient implementations of RMA operations on many systems. These restrictions are described in more detail in Section [[one-side#Semantics and Correctness|Semantics and Correctness]] , page [[one-side#Semantics and Correctness|Semantics and Correctness]] .

The calls use general datatype arguments to specify communication buffers at the origin and at the target. Thus, a transfer operation may also gather data at the source and scatter it at the destination. However, all arguments specifying both communication buffers are provided by the caller.

For all three calls, the target process may be identical with the origin process; i.e., a process may use an RMA operation to move data in its memory.

> [!tip] Rationale

> The choice of supporting “self-communication” is the same as for message-passing. It simplifies some coding, and is very useful with accumulate operations, to allow atomic updates of local variables.

MPI_PROC_NULL is a valid target rank in the MPI RMA calls [[MPI_ACCUMULATE]] , [[MPI_GET]] , and [[MPI_PUT]] . The effect is the same as for MPI_PROC_NULL in MPI point-to-point communication.

After any RMA operation with rank MPI_PROC_NULL, it is still necessary to finish the RMA epoch with the synchronization method that started the epoch.

### Put

The execution of a put operation is similar to the execution of a send by the origin process and a matching receive by the target process. The obvious difference is that all arguments are provided by one call — the call executed by the origin process.

![[API/MPI_PUT]]

Transfers `origin_count` successive entries of the type specified by the `origin_datatype`, starting at address `origin_addr` on the origin node to the target node specified by the `win`, `target_rank` pair. The data are written in the target buffer at address `target_addr = window_base + target_disp`$`\times`$`disp_unit`, where `window_base` and `disp_unit` are the base address and window displacement unit specified at window initialization, by the target process.

The target buffer is specified by the arguments `target_count` and `target_datatype`.

The data transfer is the same as that which would occur if the origin process executed a send operation with arguments `origin_addr, origin_count, origin_datatype, target_rank, tag, comm`, and the target process executed a receive operation with arguments `target_addr, target_count, target_datatype, source, tag, comm`, where `target_addr` is the target buffer address computed as explained above, and `comm` is a communicator for the group of `win`.

The communication must satisfy the same constraints as for a similar message-passing communication. The `target_datatype` may not specify overlapping entries in the target buffer. The message sent must fit, without truncation, in the target buffer. Furthermore, the target buffer must fit in the target window.

The `target_datatype` argument is a handle to a datatype object defined at the origin process. However, this object is interpreted at the target process: the outcome is as if the target datatype object was defined at the target process, by the same sequence of calls used to define it at the origin process.

The target datatype must contain only relative displacements, not absolute addresses. The same holds for get and accumulate.

> [!note] Advice to users

> The `target_datatype` argument is a handle to a datatype object that is defined at the origin process, even though it defines a data layout in the target process memory. This causes no problems in a homogeneous environment, or in a heterogeneous environment, if only portable datatypes are used (portable datatypes are defined in Section [[terms-semantic]] , page [[terms-semantic]] ).
>
> The performance of a put transfer can be significantly affected, on some systems, from the choice of window location and the shape and location of the origin and target buffer: transfers to a target window in memory allocated by [[MPI_ALLOC_MEM]] may be much faster on shared memory systems; transfers from contiguous buffers will be faster on most, if not all, systems; the alignment of the communication buffers may also impact performance.

> [!warning] Advice to implementors

> A high-quality
>
> implementation will attempt to prevent remote accesses to memory outside the window that was exposed by the process. This, both for debugging purposes, and for protection with client-server codes that use RMA. I.e., a high-quality implementation will check, if possible, window bounds on each RMA call, and raise an MPI exception at the origin call if an out-of-bound situation occurred. Note that the condition can be checked at the origin. Of course, the added safety achieved by such checks has to be weighed against the added cost of such checks.

### Get

![[API/MPI_GET]]

Similar to [[MPI_PUT]] , except that the direction of data transfer is reversed. Data are copied from the target memory to the origin. The `origin_datatype` may not specify overlapping entries in the origin buffer. The target buffer must be contained within the target window, and the copied data must fit, without truncation, in the origin buffer.

### Examples



 We show how to implement the generic indirect assignment `A = B(map)`, where `A, B` and `map` have the same distribution, and `map` is a permutation. To simplify, we assume a block distribution with equal size blocks.

    SUBROUTINE MAPVALS(A, B, map, m, comm, p)
    USE MPI
    INTEGER m, map(m), comm, p
    REAL A(m), B(m)

    INTEGER otype(p), oindex(m),   & ! used to construct origin datatypes 
         ttype(p), tindex(m),      & ! used to construct target datatypes
         count(p), total(p),       &
         win, ierr
    INTEGER (KIND=MPI_ADDRESS_KIND) lowerbound, sizeofreal

    ! This part does the work that depends on the locations of B.
    ! Can be reused while this does not change

    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound, sizeofreal, ierr)
    CALL MPI_WIN_CREATE(B, m*sizeofreal, sizeofreal, MPI_INFO_NULL,   &
                         comm, win, ierr)

    ! This part does the work that depends on the value of map and
    ! the locations of the arrays.
    ! Can be reused while these do not change

    ! Compute number of entries to be received from each process

    DO i=1,p
      count(i) = 0
    END DO
    DO i=1,m
      j = map(i)/m+1
      count(j) = count(j)+1
    END DO

    total(1) = 0
    DO i=2,p
      total(i) = total(i-1) + count(i-1)
    END DO

    DO i=1,p
      count(i) = 0
    END DO

    ! compute origin and target indices of entries.
    ! entry i at current process is received from location
    ! k at process (j-1), where map(i) = (j-1)*m + (k-1),
    ! j = 1..p and k = 1..m

    DO i=1,m
      j = map(i)/m+1
      k = MOD(map(i),m)+1
      count(j) = count(j)+1
      oindex(total(j) + count(j)) = i
      tindex(total(j) + count(j)) = k
    END DO

    ! create origin and target datatypes for each get operation
    DO i=1,p
      CALL MPI_TYPE_CREATE_INDEXED_BLOCK(count(i), 1, oindex(total(i)+1),   &
                                         MPI_REAL, otype(i), ierr)
      CALL MPI_TYPE_COMMIT(otype(i), ierr)
      CALL MPI_TYPE_CREATE_INDEXED_BLOCK(count(i), 1, tindex(total(i)+1),   &
                                         MPI_REAL, ttype(i), ierr)
      CALL MPI_TYPE_COMMIT(ttype(i), ierr)
    END DO

    ! this part does the assignment itself
    CALL MPI_WIN_FENCE(0, win, ierr)
    DO i=1,p
      CALL MPI_GET(A, 1, otype(i), i-1, 0, 1, ttype(i), win, ierr)
    END DO
    CALL MPI_WIN_FENCE(0, win, ierr)

    CALL MPI_WIN_FREE(win, ierr)
    DO i=1,p
      CALL MPI_TYPE_FREE(otype(i), ierr)
      CALL MPI_TYPE_FREE(ttype(i), ierr)
    END DO
    RETURN
    END

 A simpler version can be written that does not require that a datatype be built for the target buffer. But, one then needs a separate get call for each entry, as illustrated below. This code is much simpler, but usually much less efficient, for large arrays.

    SUBROUTINE MAPVALS(A, B, map, m, comm, p)
    USE MPI
    INTEGER m, map(m), comm, p
    REAL A(m), B(m)
    INTEGER win, ierr
    INTEGER (KIND=MPI_ADDRESS_KIND) lowerbound, sizeofreal

    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound, sizeofreal, ierr)
    CALL MPI_WIN_CREATE(B, m*sizeofreal, sizeofreal, MPI_INFO_NULL,  &
                        comm, win, ierr)

    CALL MPI_WIN_FENCE(0, win, ierr)
    DO i=1,m
      j = map(i)/p
      k = MOD(map(i),p)
      CALL MPI_GET(A(i), 1, MPI_REAL, j, k, 1, MPI_REAL, win, ierr)
    END DO
    CALL MPI_WIN_FENCE(0, win, ierr)
    CALL MPI_WIN_FREE(win, ierr)
    RETURN
    END

### Accumulate Functions



It is often useful in a put operation to combine the data moved to the target process with the data that resides at that process, rather then replacing the data there. This will allow, for example, the accumulation of a sum by having all involved processes add their contribution to the sum variable in the memory of one process.

![[API/MPI_ACCUMULATE]]

Accumulate the contents of the origin buffer (as defined by `origin_addr`, `origin_count` and `origin_datatype`) to the buffer specified by arguments `target_count` and `target_datatype`, at offset `target_disp`, in the target window specified by `target_rank` and `win`, using the operation `op`. This is like [[MPI_PUT]] except that data is combined into the target area instead of overwriting it.

Any of the predefined operations for [[MPI_REDUCE]] can be used. User-defined functions cannot be used. For example, if `op` is `MPI_SUM`, each element of the origin buffer is added to the corresponding element in the target, replacing the former value in the target.

Each datatype argument must be a predefined datatype or a derived datatype, where all basic components are of the same predefined datatype. Both datatype arguments must be constructed from the same predefined datatype. The operation `op` applies to elements of that predefined type. `target_datatype` must not specify overlapping entries, and the target buffer must fit in the target window.

A new predefined operation, MPI_REPLACE, is defined. It corresponds to the associative function $`f(a,b) = b`$; i.e., the current value in the target memory is replaced by the value supplied by the origin.

MPI_REPLACE, like the other predefined operations, is defined only for the predefined MPI datatypes.

> [!tip] Rationale

> The rationale for this is that, for consistency, MPI_REPLACE should have the same limitations as the other operations. Extending it to all datatypes doesn’t provide any real benefit.

> [!note] Advice to users

> [[MPI_PUT]] is a special case of [[MPI_ACCUMULATE]] , with the operation MPI_REPLACE. Note, however, that [[MPI_PUT]] and `MPI_ACCUMULATE` have different constraints on concurrent updates.

 We want to compute $`B(j) = \sum_{map(i) = j} A(i)`$. The arrays `A, B` and `map` are distributed in the same manner. We write the simple version.

    SUBROUTINE SUM(A, B, map, m, comm, p)
    USE MPI
    INTEGER m, map(m), comm, p, win, ierr
    REAL A(m), B(m)
    INTEGER (KIND=MPI_ADDRESS_KIND) lowerbound, sizeofreal

    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound, sizeofreal, ierr)
    CALL MPI_WIN_CREATE(B, m*sizeofreal, sizeofreal, MPI_INFO_NULL,  &
                        comm, win, ierr)

    CALL MPI_WIN_FENCE(0, win, ierr)
    DO i=1,m
      j = map(i)/p
      k = MOD(map(i),p)
      CALL MPI_ACCUMULATE(A(i), 1, MPI_REAL, j, k, 1, MPI_REAL,   &
                          MPI_SUM, win, ierr)
    END DO
    CALL MPI_WIN_FENCE(0, win, ierr)

    CALL MPI_WIN_FREE(win, ierr)
    RETURN
    END

This code is identical to the code in Example [[one-side#Examples|Examples]] , page [[one-side#Examples|Examples]] , except that a call to get has been replaced by a call to accumulate. (Note that, if `map` is one-to-one, then the code computes $`B = A(map^{-1})`$, which is the reverse assignment to the one computed in that previous example.) In a similar manner, we can replace in Example [[one-side#Examples|Examples]] , page [[one-side#Examples|Examples]] , the call to get by a call to accumulate, thus performing the computation with only one communication between any two processes.

## Synchronization Calls



RMA communications fall in two categories:

- **active target** communication, where data is moved from the memory of one process to the memory of another, and both are explicitly involved in the communication. This communication pattern is similar to message passing, except that all the data transfer arguments are provided by one process, and the second process only participates in the synchronization.

- **passive target** communication, where data is moved from the memory of one process to the memory of another, and only the origin process is explicitly involved in the transfer. Thus, two origin processes may communicate by accessing the same location in a target window. The process that owns the target window may be distinct from the two communicating processes, in which case it does not participate explicitly in the communication. This communication paradigm is closest to a shared memory model, where shared data can be accessed by all processes, irrespective of location.

RMA communication calls with argument `win` must occur at a process only within an **access epoch** for `win`. Such an epoch starts with an RMA synchronization call on `win`; it proceeds with zero or more RMA communication calls ( [[MPI_PUT]] , [[MPI_GET]] or [[MPI_ACCUMULATE]] ) on `win`; it completes with another synchronization call on `win`. This allows users to amortize one synchronization with multiple data transfers and provide implementors more flexibility in the implementation of RMA operations.

Distinct access epochs for `win` at the same process must be disjoint. On the other hand, epochs pertaining to different `win` arguments may overlap. Local operations or other MPI calls may also occur during an epoch.

In active target communication, a target window can be accessed by RMA operations only within an **exposure epoch**. Such an epoch is started and completed by RMA synchronization calls executed by the target process. Distinct exposure epochs at a process on the same window must be disjoint, but such an exposure epoch may overlap with exposure epochs on other windows or with access epochs for the same or other `win` arguments.

There is a one-to-one matching between access epochs at origin processes and exposure epochs on target processes: RMA operations issued by an origin process for a target window will access that target window during the same exposure epoch if and only if they were issued during the same access epoch.

In passive target communication the target process does not execute RMA synchronization calls, and there is no concept of an exposure epoch.

MPI provides three synchronization mechanisms:

1.  The [[MPI_WIN_FENCE]] collective synchronization call supports a simple synchronization pattern that is often used in parallel computations: namely a loosely-synchronous model, where global computation phases alternate with global communication phases. This mechanism is most useful for loosely synchronous algorithms where the graph of communicating processes changes very frequently, or where each process communicates with many others.

    This call is used for active target communication. An access epoch at an origin process or an exposure epoch at a target process are started and completed by calls to `MPI_WIN_FENCE`. A process can access windows at all processes in the group of `win` during such an access epoch, and the local window can be accessed by all processes in the group of `win` during such an exposure epoch.

2.  The four functions [[MPI_WIN_START]] , [[MPI_WIN_COMPLETE]] , [[MPI_WIN_POST]] and [[MPI_WIN_WAIT]] can be used to restrict synchronization to the minimum: only pairs of communicating processes synchronize, and they do so only when a synchronization is needed to order correctly RMA accesses to a window with respect to local accesses to that same window. This mechanism may be more efficient when each process communicates with few (logical) neighbors, and the communication graph is fixed or changes infrequently.

    These calls are used for active target communication. An access epoch is started at the origin process by a call to [[MPI_WIN_START]] and is terminated by a call to [[MPI_WIN_COMPLETE]] . The start call has a group argument that specifies the group of target processes for that epoch. An exposure epoch is started at the target process by a call to [[MPI_WIN_POST]] and is completed by a call to [[MPI_WIN_WAIT]] . The post call has a group argument that specifies the set of origin processes for that epoch.

3.  Finally, shared and exclusive locks are provided by the two functions [[MPI_WIN_LOCK]] and [[MPI_WIN_UNLOCK]] . Lock synchronization is useful for MPI applications that emulate a shared memory model via MPI calls; e.g., in a “billboard” model, where processes can, at random times, access or update different parts of the billboard.

    These two calls provide passive target communication. An access epoch is started by a call to [[MPI_WIN_LOCK]] and terminated by a call to [[MPI_WIN_UNLOCK]] . Only one target window can be accessed during that epoch with `win`.

Figure [[one-side#Synchronization Calls|Synchronization Calls]] illustrates the general synchronization pattern for active target communication.

*Figure: Active target communication. Dashed arrows represent synchronizations (ordering of events).*

The synchronization between `post` and `start` ensures that the put call of the origin process does not start until the target process exposes the window (with the `post` call); the target process will expose the window only after preceding local accesses to the window have completed. The synchronization between `complete` and `wait` ensures that the put call of the origin process completes before the window is unexposed (with the `wait` call). The target process will execute following local accesses to the target window only after the `wait` returned.

Figure [[one-side#Synchronization Calls|Synchronization Calls]] shows operations occurring in the natural temporal order implied by the synchronizations: the `post` occurs before the matching `start`, and `complete` occurs before the matching `wait`. However, such **strong** synchronization is more than needed for correct ordering of window accesses. The semantics of MPI calls allow **weak** synchronization, as illustrated in Figure [[one-side#Synchronization Calls|Synchronization Calls]] .

*Figure: Active target communication, with weak synchronization. Dashed arrows represent synchronizations (ordering of events)*

The access to the target window is delayed until the window is exposed, after the `post`. However the `start` may complete earlier; the `put` and `complete` may also terminate earlier, if put data is buffered by the implementation. The synchronization calls order correctly window accesses, but do not necessarily synchronize other operations. This weaker synchronization semantic allows for more efficient implementations.

Figure [[one-side#Synchronization Calls|Synchronization Calls]] illustrates the general synchronization pattern for passive target communication. The first origin process communicates data to the second origin process, through the memory of the target process; the target process is not explicitly involved in the communication.

*Figure: Passive target communication. Dashed arrows represent synchronizations (ordering of events).*

The `lock` and `unlock` calls ensure that the two RMA accesses do not occur concurrently. However, they do *not* ensure that the `put` by origin 1 will precede the `get` by origin 2.

### Fence

![[API/MPI_WIN_FENCE]]

The MPI call [[MPI_WIN_FENCE]] synchronizes RMA calls on `win`. The call is collective on the group of `win`. All RMA operations on `win` originating at a given process and started before the fence call will complete at that process before the fence call returns. They will be completed at their target before the fence call returns at the target. RMA operations on `win` started by a process after the fence call returns will access their target window only after `MPI_WIN_FENCE` has been called by the target process.

The call completes an RMA access epoch if it was preceded by another fence call and the local process issued RMA communication calls on `win` between these two calls. The call completes an RMA exposure epoch if it was preceded by another fence call and the local window was the target of RMA accesses between these two calls. The call starts an RMA access epoch if it is followed by another fence call and by RMA communication calls issued between these two fence calls. The call starts an exposure epoch if it is followed by another fence call and the local window is the target of RMA accesses between these two fence calls. Thus, the fence call is equivalent to calls to a subset of `post, start, complete, wait`.

A fence call usually entails a barrier synchronization: a process completes a call to [[MPI_WIN_FENCE]] only after all other processes in the group entered their matching call. However, a call to [[MPI_WIN_FENCE]] that is known not to end any epoch (in particular, a call with `assert = MPI_MODE_NOPRECEDE`) does not necessarily act as a barrier.

The `assert` argument is used to provide assertions on the context of the call that may be used for various optimizations. This is described in Section [[one-side#Assertions|Assertions]] . A value of `assert = 0` is always valid.

> [!note] Advice to users

> Calls to [[MPI_WIN_FENCE]] should both precede and follow calls to put, get or accumulate that are synchronized with fence calls.

### General Active Target Synchronization

![[API/MPI_WIN_START]]

Starts an RMA access epoch for `win`. RMA calls issued on `win` during this epoch must access only windows at processes in `group`. Each process in `group` must issue a matching call to `MPI_WIN_POST`. RMA accesses to each target window will be delayed, if necessary, until the target process executed the matching call to [[MPI_WIN_POST]] .

[[MPI_WIN_START]] is allowed to block until the corresponding `MPI_WIN_POST` calls are executed, but is not required to.

The `assert` argument is used to provide assertions on the context of the call that may be used for various optimizations. This is described in Section [[one-side#Assertions|Assertions]] . A value of `assert = 0` is always valid.

![[API/MPI_WIN_COMPLETE]]

Completes an RMA access epoch on `win` started by a call to [[MPI_WIN_START]] . All RMA communication calls issued on `win` during this epoch will have completed at the origin when the call returns.

[[MPI_WIN_COMPLETE]] enforces completion of preceding RMA calls at the origin, but not at the target. A put or accumulate call may not have completed at the target when it has completed at the origin.

Consider the sequence of calls in the example below.



 

    MPI_Win_start(group, flag, win);
    MPI_Put(...,win);
    MPI_Win_complete(win);

The call to [[MPI_WIN_COMPLETE]] does not return until the put call has completed at the origin; and the target window will be accessed by the put operation only after the call to [[MPI_WIN_START]] has matched a call to [[MPI_WIN_POST]] by the target process. This still leaves much choice to implementors. The call to [[MPI_WIN_START]] can block until the matching call to [[MPI_WIN_POST]] occurs at all target processes. One can also have implementations where the call to [[MPI_WIN_START]] is nonblocking, but the call to [[MPI_PUT]] blocks until the matching call to [[MPI_WIN_POST]] occurred; or implementations where the first two calls are nonblocking, but the call to [[MPI_WIN_COMPLETE]] blocks until the call to [[MPI_WIN_POST]] occurred; or even implementations where all three calls can complete before any target process called [[MPI_WIN_POST]] — the data put must be buffered, in this last case, so as to allow the put to complete at the origin ahead of its completion at the target. However, once the call to [[MPI_WIN_POST]] is issued, the sequence above must complete, without further dependencies.

![[API/MPI_WIN_POST]]

Starts an RMA exposure epoch for the local window associated with `win`. Only processes in `group` should access the window with RMA calls on `win` during this epoch. Each process in `group` must issue a matching call to [[MPI_WIN_START]] .

[[MPI_WIN_POST]] does not block.

![[API/MPI_WIN_WAIT]]

Completes an RMA exposure epoch started by a call to [[MPI_WIN_POST]] on `win`. This call matches calls to [[MPI_WIN_COMPLETE]] issued by each of the origin processes that were granted access to the window during this epoch. The call to [[MPI_WIN_WAIT]] will block until all matching calls to [[MPI_WIN_COMPLETE]] have occurred. This guarantees that all these origin processes have completed their RMA accesses to the local window. When the call returns, all these RMA accesses will have completed at the target window.

Figure [[one-side#General Active Target Synchronization|General Active Target Synchronization]] illustrates the use of these four functions.

*Figure: Active target communication. Dashed arrows represent synchronizations and solid arrows represent data transfer.*

Process 0 puts data in the windows of processes 1 and 2 and process 3 puts data in the window of process 2. Each start call lists the ranks of the processes whose windows will be accessed; each post call lists the ranks of the processes that access the local window. The figure illustrates a possible timing for the events, assuming strong synchronization; in a weak synchronization, the start, put or complete calls may occur ahead of the matching post calls.

![[API/MPI_WIN_TEST]]

This is the nonblocking version of [[MPI_WIN_WAIT]] . It returns `flag = true` if [[MPI_WIN_WAIT]] would return, `flag = false`, otherwise. The effect of return of [[MPI_WIN_TEST]] with `flag = true` is the same as the effect of a return of [[MPI_WIN_WAIT]] . If `flag = false` is returned, then the call has no visible effect.

[[MPI_WIN_TEST]] should be invoked only where [[MPI_WIN_WAIT]] can be invoked. Once the call has returned `flag = true`, it must not be invoked anew, until the window is posted anew.

Assume that window `win` is associated with a “hidden” communicator `wincomm`, used for communication by the processes of `win`. The rules for matching of post and start calls and for matching complete and wait call can be derived from the rules for matching sends and receives, by considering the following (partial) model implementation.

 [[MPI_WIN_POST]]  
initiate a nonblocking send with tag `tag0` to each process in `group`, using `wincomm`. No need to wait for the completion of these sends.

 [[MPI_WIN_START]]  
initiate a nonblocking receive with tag `tag0` from each process in `group`, using `wincomm`. An RMA access to a window in target process `i` is delayed until the receive from `i` is completed.

 [[MPI_WIN_COMPLETE]]  
initiate a nonblocking send with tag `tag1` to each process in the group of the preceding start call. No need to wait for the completion of these sends.

 [[MPI_WIN_WAIT]]  
initiate a nonblocking receive with tag `tag1` from each process in the group of the preceding post call. Wait for the completion of all receives.

No races can occur in a correct program: each of the sends matches a unique receive, and vice-versa.

> [!tip] Rationale

> The design for general active target synchronization requires the user to provide complete information on the communication pattern, at each end of a communication link: each origin specifies a list of targets, and each target specifies a list of origins. This provides maximum flexibility (hence, efficiency) for the implementor: each synchronization can be initiated by either side, since each “knows” the identity of the other. This also provides maximum protection from possible races. On the other hand, the design requires more information than RMA needs, in general: in general, it is sufficient for the origin to know the rank of the target, but not vice versa. Users that want more “anonymous” communication will be required to use the fence or lock mechanisms.

> [!note] Advice to users

> Assume a communication pattern that is represented by a directed graph $`G =\; <V, E>`$, where $`V = \{0, ..., n-1\}`$ and $`ij \in E`$ if origin process $`i`$ accesses the window at target process $`j`$. Then each process $`i`$ issues a call to [[MPI_WIN_POST]] , followed by a call to [[MPI_WIN_START]] , where $`outgroup_i = \{ j  :  ij \in E\}`$ and $`ingroup_i = \{ j  :  ji \in E
> \}`$. A call is a noop, and can be skipped, if the group argument is empty. After the communications calls, each process that issued a start will issue a complete. Finally, each process that issued a post will issue a wait.
>
> Note that each process may call with a group argument that has different members.

### Lock



![[API/MPI_WIN_LOCK]]

Starts an RMA access epoch. Only the window at the process with rank `rank` can be accessed by RMA operations on `win` during that epoch.

![[API/MPI_WIN_UNLOCK]]

Completes an RMA access epoch started by a call to [[MPI_WIN_LOCK]] . RMA operations issued during this period will have completed both at the origin and at the target when the call returns.

Locks are used to protect accesses to the locked target window effected by RMA calls issued between the lock and unlock call, and to protect local load/store accesses to a locked local window executed between the lock and unlock call. Accesses that are protected by an exclusive lock will not be concurrent at the window site with other accesses to the same window that are lock protected. Accesses that are protected by a shared lock will not be concurrent at the window site with accesses protected by an exclusive lock to the same window.

It is erroneous to have a window locked and exposed (in an exposure epoch) concurrently. I.e., a process may not call [[MPI_WIN_LOCK]] to lock a target window if the target process has called [[MPI_WIN_POST]] and has not yet called [[MPI_WIN_WAIT]] ; it is erroneous to call [[MPI_WIN_POST]] while the local window is locked.

> [!tip] Rationale

> An alternative is to require MPI to enforce mutual exclusion between exposure epochs and locking periods. But this would entail additional overheads when locks or active target synchronization do not interact in support of those rare interactions between the two mechanisms. The programming style that we encourage here is that a set of windows is used with only one synchronization mechanism at a time, with shifts from one mechanism to another being rare and involving global synchronization.

> [!note] Advice to users

> Users need to use explicit synchronization code in order to enforce mutual exclusion between locking periods and exposure epochs on a window.

Implementors may restrict the use of RMA communication that is synchronized by lock calls to windows in memory allocated by [[MPI_ALLOC_MEM]] (Section [[inquiry#Memory Allocation|Memory Allocation]] , page [[inquiry#Memory Allocation|Memory Allocation]] ). Locks can be used portably only in such memory.

> [!tip] Rationale

> The implementation of passive target communication when memory is not shared requires an asynchronous agent. Such an agent can be implemented more easily, and can achieve better performance, if restricted to specially allocated memory. It can be avoided altogether if shared memory is used. It seems natural to impose restrictions that allows one to use shared memory for 3-rd party communication in shared memory machines.
>
> The downside of this decision is that passive target communication cannot be used without taking advantage of nonstandard Fortran features: namely, the availability of C-like pointers; these are not supported by some Fortran compilers (g77 and Windows/NT compilers, at the time of writing). Also, passive target communication cannot be portably targeted to `COMMON` blocks, or other statically declared Fortran arrays.

Consider the sequence of calls in the example below.

 

    MPI_Win_lock(MPI_LOCK_EXCLUSIVE, rank, assert, win)
    MPI_Put(..., rank, ..., win)
    MPI_Win_unlock(rank, win)



The call to [[MPI_WIN_UNLOCK]] will not return until the put transfer has completed at the origin and at the target. This still leaves much freedom to implementors. The call to [[MPI_WIN_LOCK]] may block until an exclusive lock on the window is acquired; or, the call [[MPI_WIN_LOCK]] may not block, while the call to [[MPI_PUT]] blocks until a lock is acquired; or, the first two calls may not block, while [[MPI_WIN_UNLOCK]] blocks until a lock is acquired — the update of the target window is then postponed until the call to [[MPI_WIN_UNLOCK]] occurs.

However, if the call to [[MPI_WIN_LOCK]] is used to lock a local window, then the call must block until the lock is acquired, since the lock may protect local load/store accesses to the window issued after the lock call returns.

### Assertions



The `assert` argument in the calls [[MPI_WIN_POST]] , [[MPI_WIN_START]] , [[MPI_WIN_FENCE]] and [[MPI_WIN_LOCK]] is used to provide assertions on the context of the call that may be used to optimize performance. The `assert` argument does not change program semantics if it provides correct information on the program — it is erroneous to provides incorrect information. Users may always provide `assert = 0` to indicate a general case, where no guarantees are made.

> [!note] Advice to users

> Many implementations may not take advantage of the information in `assert`; some of the information is relevant only for noncoherent, shared memory machines. Users should consult their implementation manual to find which information is useful on each system. On the other hand, applications that provide correct assertions whenever applicable are portable and will take advantage of assertion specific optimizations, whenever available.

> [!warning] Advice to implementors

> Implementations can always ignore the `assert` argument. Implementors should document which `assert` values are significant on their implementation.

`assert` is the bit-vector OR of zero or more of the following integer constants: MPI_MODE_NOCHECK, MPI_MODE_NOSTORE, MPI_MODE_NOPUT, MPI_MODE_NOPRECEDE and MPI_MODE_NOSUCCEED. The significant options are listed below, for each call.

> [!note] Advice to users

> C/C++ users can use bit vector or ($`\mid`$) to combine these constants; Fortran 90 users can use the bit-vector `IOR` intrinsic. Fortran 77 users can use (nonportably) bit vector `IOR` on systems that support it. Alternatively, Fortran users can portably use integer addition to OR the constants (each constant should appear at most once in the addition!).

  
**MPI_WIN_START:**

  
**MPI_WIN_POST:**

  
**MPI_WIN_FENCE:**

  
**MPI_WIN_LOCK:**

> [!note] Advice to users

> Note that the nostore and noprecede flags provide information on what happened *before* the call; the noput and nosucceed flags provide information on what will happen *after* the call.

### Miscellaneous Clarifications

Once an RMA routine completes, it is safe to free any opaque objects passed as argument to that routine. For example, the `datatype` argument of a [[MPI_PUT]] call can be freed as soon as the call returns, even though the communication may not be complete.

As in message-passing, datatypes must be committed before they can be used in RMA communication.

## Examples



The following example shows a generic loosely synchronous, iterative code, using fence synchronization. The window at each process consists of array `A`, which contains the origin and target buffers of the put calls.

    ...
    while(!converged(A)){
      update(A);
      MPI_Win_fence(MPI_MODE_NOPRECEDE, win);
      for(i=0; i < toneighbors; i++)
        MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i],
                             todisp[i], 1, totype[i], win);
      MPI_Win_fence((MPI_MODE_NOSTORE | MPI_MODE_NOSUCCEED), win);
      }

The same code could be written with get, rather than put. Note that, during the communication phase, each window is concurrently read (as origin buffer of puts) and written (as target buffer of puts). This is OK, provided that there is no overlap between the target buffer of a put and another communication buffer.



Same generic example, with more computation/communication overlap. We assume that the update phase is broken in two subphases: the first, where the “boundary,” which is involved in communication, is updated, and the second, where the “core,” which neither use nor provide communicated data, is updated.

    ...
    while(!converged(A)){
      update_boundary(A);
      MPI_Win_fence((MPI_MODE_NOPUT | MPI_MODE_NOPRECEDE), win);
      for(i=0; i < fromneighbors; i++)
        MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i],
                        fromdisp[i], 1, fromtype[i], win);
      update_core(A);
      MPI_Win_fence(MPI_MODE_NOSUCCEED, win);
      }

The get communication can be concurrent with the core update, since they do not access the same locations, and the local update of the origin buffer by the get call can be concurrent with the local update of the core by the `update_core` call. In order to get similar overlap with put communication we would need to use separate windows for the core and for the boundary.

This is required because we do not allow local stores to be concurrent with puts on the same, or on overlapping, windows.

Same code as in Example [[one-side#Examples|Examples]] , rewritten using post-start-complete-wait.

    ...
    while(!converged(A)){
      update(A);
      MPI_Win_post(fromgroup, 0, win);
      MPI_Win_start(togroup, 0, win);
      for(i=0; i < toneighbors; i++)
        MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i],
                             todisp[i], 1, totype[i], win);
      MPI_Win_complete(win);
      MPI_Win_wait(win);
      }

Same example, with split phases, as in Example [[one-side#Examples|Examples]] .

    ...
    while(!converged(A)){
      update_boundary(A);
      MPI_Win_post(togroup, MPI_MODE_NOPUT, win);
      MPI_Win_start(fromgroup, 0, win);
      for(i=0; i < fromneighbors; i++)
        MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i],
                       fromdisp[i], 1, fromtype[i], win);
      update_core(A);
      MPI_Win_complete(win);
      MPI_Win_wait(win);
      }

A checkerboard, or double buffer communication pattern, that allows more computation/communication overlap. Array `A0` is updated using values of array `A1`, and vice versa. We assume that communication is symmetric: if process A gets data from process B, then process B gets data from process A. Window `wini` consists of array `Ai`.

    ...
    if (!converged(A0,A1))
      MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0);
    MPI_Barrier(comm0);
    /* the barrier is needed because the start call inside the
    loop uses the nocheck option */
    while(!converged(A0, A1)){
      /* communication on A0 and computation on A1 */
      update2(A1, A0); /* local update of A1 that depends on A0 (and A1) */
      MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win0);
      for(i=0; i < neighbors; i++)
        MPI_Get(&tobuf0[i], 1, totype0[i], neighbor[i],
                   fromdisp0[i], 1, fromtype0[i], win0);
      update1(A1); /* local update of A1 that is
                      concurrent with communication that updates A0 */ 
      MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win1);
      MPI_Win_complete(win0);
      MPI_Win_wait(win0);

      /* communication on A1 and computation on A0 */
      update2(A0, A1); /* local update of A0 that depends on A1 (and A0)*/
      MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win1);
      for(i=0; i < neighbors; i++)
        MPI_Get(&tobuf1[i], 1, totype1[i], neighbor[i],
                    fromdisp1[i], 1, fromtype1[i], win1);
      update1(A0); /* local update of A0 that depends on A0 only,
                     concurrent with communication that updates A1 */
      if (!converged(A0,A1))
        MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0);
      MPI_Win_complete(win1);
      MPI_Win_wait(win1);
      }

A process posts the local window associated with `win0` before it completes RMA accesses to the remote windows associated with `win1`. When the `wait(win1`) call returns, then all neighbors of the calling process have posted the windows associated with `win0`. Conversely, when the `wait(win0)` call returns, then all neighbors of the calling process have posted the windows associated with `win1`. Therefore, the nocheck option can be used with the calls to [[MPI_WIN_START]] .

Put calls can be used, instead of get calls, if the area of array `A0` (resp. `A1`) used by the `update(A1, A0)` (resp. `update(A0, A1)`) call is disjoint from the area modified by the RMA communication. On some systems, a put call may be more efficient than a get call, as it requires information exchange only in one direction.

## Error Handling



### Error Handlers

Errors occurring during calls to [[MPI_WIN_CREATE]] cause the error handler currently associated with `comm` to be invoked. All other RMA calls have an input `win` argument. When an error occurs during such a call, the error handler currently associated with `win` is invoked.

The default error handler associated with `win` is MPI_ERRORS_ARE_FATAL. Users may change this default by explicitly associating a new error handler with `win` (see Section [[inquiry#Error Handling|Error Handling]] , page [[inquiry#Error Handling|Error Handling]] ).

### Error Classes

The following error classes for one-sided communication are defined

l l `MPI_ERR_WIN` & invalid `win` argument\
`MPI_ERR_BASE` & invalid `base` argument\
`MPI_ERR_SIZE` & invalid `size` argument\
`MPI_ERR_DISP` & invalid `disp` argument\
`MPI_ERR_LOCKTYPE` & invalid `locktype` argument\
`MPI_ERR_ASSERT` & invalid `assert` argument  `MPI_ERR_RMA_CONFLICT` & conflicting accesses to window\
`MPI_ERR_RMA_SYNC` & wrong synchronization of RMA calls



## Semantics and Correctness



The semantics of RMA operations is best understood by assuming that the system maintains a separate *public* copy of each window, in addition to the original location in process memory (the *private* window copy). There is only one instance of each variable in process memory, but a distinct *public* copy of the variable for each window that contains it. A load accesses the instance in process memory (this includes MPI sends). A store accesses and updates the instance in process memory (this includes MPI receives), but the update may affect other public copies of the same locations. A get on a window accesses the public copy of that window. A put or accumulate on a window accesses and updates the public copy of that window, but the update may affect the private copy of the same locations in process memory, and public copies of other overlapping windows. This is illustrated in Figure [[one-side#Semantics and Correctness|Semantics and Correctness]] .

*Figure: Schematic description of window*

The following rules specify the latest time at which an operation must complete at the origin or the target. The update performed by a get call in the origin process memory is visible when the get operation is complete at the origin (or earlier); the update performed by a put or accumulate call in the public copy of the target window is visible when the put or accumulate has completed at the target (or earlier). The rules

also specify

the latest time at which an update of one window copy becomes visible in another overlapping copy.

1.  An RMA operation is completed at the origin by the ensuing call to [[MPI_WIN_COMPLETE]] , [[MPI_WIN_FENCE]] or [[MPI_WIN_UNLOCK]] that synchronizes this access at the origin.

2.  If an RMA operation is completed at the origin by a call to [[MPI_WIN_FENCE]] then the operation is completed at the target by the matching call to [[MPI_WIN_FENCE]] by the target process.

3.  If an RMA operation is completed at the origin by a call to [[MPI_WIN_COMPLETE]] then the operation is completed at the target by the matching call to [[MPI_WIN_WAIT]] by the target process.

4.  If an RMA operation is completed at the origin by a call to [[MPI_WIN_UNLOCK]] then the operation is completed at the target by that same call to [[MPI_WIN_UNLOCK]] .

5.  An update of a location in a private window copy in process memory becomes visible in the public window copy at latest when an ensuing call to [[MPI_WIN_POST, MPI_WIN_FENCE]] , or [[MPI_WIN_UNLOCK]] is executed on that window by the window owner.

6.  An update by a put or accumulate call to a public window copy becomes visible in the private copy in process memory at latest when an ensuing call to [[MPI_WIN_WAIT]] , [[MPI_WIN_FENCE]] , or [[MPI_WIN_LOCK]] is executed on that window by the window owner.

The [[MPI_WIN_FENCE]] or [[MPI_WIN_WAIT]] call that completes the transfer from public copy to private copy (6) is the same call that completes the put or accumulate operation in the window copy (2, 3). If a put or accumulate access was synchronized with a lock, then the update of the public window copy is complete as soon as the updating process executed [[MPI_WIN_UNLOCK]] . On the other hand, the update of private copy in the process memory may be delayed until the target process executes a synchronization call on that window (6). Thus, updates to process memory can always be delayed until the process executes a suitable synchronization call. Updates to a public window copy can also be delayed until the window owner executes a synchronization call, if fences or post-start-complete-wait synchronization is used. Only when lock synchronization is used does it becomes necessary to update the public window copy, even if the window owner does not execute any related synchronization call.

The rules above also define, by implication, when an update to a public window copy becomes visible in another overlapping public window copy.

Consider, for example, two overlapping windows, `win1` and `win2`. A call to [[MPI_WIN_FENCE]] by the window owner makes visible in the process memory previous updates to window `win1` by remote processes. A subsequent call to [[MPI_WIN_FENCE]] makes these updates visible in the public copy of `win2`.

A correct program must obey the following rules.

1.  A location in a window must not be accessed locally once an update to that location has started, until the update becomes visible in the private window copy in process memory.

2.  A location in a window must not be accessed as a target of an RMA operation once an update to that location has started, until the update becomes visible in the public window copy. There is one exception to this rule, in the case where the same variable is updated by two concurrent accumulates that use the same operation, with the same predefined datatype, on the same window.

3.  A put or accumulate must not access a target window once a local update or a put or accumulate update to another (overlapping) target window have started on a location in the target window, until the update becomes visible in the public copy of the window. Conversely, a local update in process memory to a location in a window must not start once a put or accumulate update to that target window has started, until the put or accumulate update becomes visible in process memory. In both cases, the restriction applies to operations even if they access disjoint locations in the window.

A program is erroneous if it violates these rules.

> [!tip] Rationale

> The last constraint on correct RMA accesses may seem unduly restrictive, as it forbids concurrent accesses to nonoverlapping locations in a window. The reason for this constraint is that, on some architectures, explicit coherence restoring operations may be needed at synchronization points. A different operation may be needed for locations that were locally updated by stores and for locations that were remotely updated by put or accumulate operations. Without this constraint, the MPI library will have to track precisely which locations in a window were updated by a put or accumulate call. The additional overhead of maintaining such information is considered prohibitive.

> [!note] Advice to users

> A user can write correct programs by following the following rules:
>
> fence:  
> During each period between fence calls, each window is either updated by put or accumulate calls, or updated by local stores, but not both. Locations updated by put or accumulate calls should not be accessed during the same period (with the exception of concurrent updates to the same location by accumulate calls). Locations accessed by get calls should not be updated during the same period.
>
> post-start-complete-wait:  
> A window should not be updated locally while being posted, if it is being updated by put or accumulate calls. Locations updated by put or accumulate calls should not be accessed while the window is posted (with the exception of concurrent updates to the same location by accumulate calls). Locations accessed by get calls should not be updated while the window is posted.
>
> With the post-start synchronization, the target process can tell the origin process that its window is now ready for RMA access; with the complete-wait synchronization, the origin process can tell the target process that it has finished its RMA accesses to the window.
>
> lock:  
> Updates to the window are protected by exclusive locks if they may conflict. Nonconflicting accesses (such as read-only accesses or accumulate accesses) are protected by shared locks, both for local accesses and for RMA accesses.
>
> changing window or synchronization mode:  
> One can change synchronization mode, or change the window used to access a location that belongs to two overlapping windows, when the process memory and the window copy are guaranteed to have the same values. This is true after a local call to [[MPI_WIN_FENCE]] , if RMA accesses to the window are synchronized with fences; after a local call to [[MPI_WIN_WAIT]] , if the accesses are synchronized with post-start-complete-wait; after the call at the origin (local or remote) to [[MPI_WIN_UNLOCK]] if the accesses are synchronized with locks.
>
> In addition, a process should not access the local buffer of a get operation until the operation is complete, and should not update the local buffer of a put or accumulate operation until that operation is complete.

### Atomicity

The outcome of concurrent accumulates to the same location, with the same operation and predefined datatype, is as if the accumulates where done at that location in some serial order. On the other hand, if two locations are both updated by two accumulate calls, then the updates may occur in reverse order at the two locations. Thus, there is no guarantee that the entire call to [[MPI_ACCUMULATE]] is executed atomically. The effect of this lack of atomicity is limited: The previous correctness conditions imply that a location updated by a call to [[MPI_ACCUMULATE]] , cannot be accessed by load or an RMA call other than accumulate, until the [[MPI_ACCUMULATE]] call has completed (at the target). Different interleavings can lead to different results only to the extent that computer arithmetics are not truly associative or commutative.

### Progress

One-sided communication has the same progress requirements as point-to-point communication: once a communication is enabled, then it is guaranteed to complete. RMA calls must have local semantics, except when required for synchronization with other RMA calls.

There is some fuzziness in the definition of the time when a RMA communication becomes enabled. This fuzziness provides to the implementor more flexibility than with point-to-point communication. Access to a target window becomes enabled once the corresponding synchronization (such as [[MPI_WIN_FENCE]] or [[MPI_WIN_POST]] ) has executed. On the origin process, an RMA communication may become enabled as soon as the corresponding put, get or accumulate call has executed, or as late as when the ensuing synchronization call is issued. Once the communication is enabled both at the origin and at the target, the communication must complete.

Consider the code fragment in Example [[one-side#General Active Target Synchronization|General Active Target Synchronization]] , on page [[one-side#General Active Target Synchronization|General Active Target Synchronization]] . Some of the calls may block if the target window is not posted. However, if the target window is posted, then the code fragment must complete. The data transfer may start as soon as the put call occur, but may be delayed until the ensuing complete call occurs.

Consider the code fragment in Example [[one-side#Lock|Lock]] , on page [[one-side#Lock|Lock]] . Some of the calls may block if another process holds a conflicting lock. However, if no conflicting lock is held, then the code fragment must complete.

Consider the code illustrated in Figure [[one-side#Progress|Progress]] .

*Figure: Symmetric communication*

Each process updates the window of the other process using a put operation, then accesses its own window. The post calls are nonblocking, and should complete. Once the post calls occur, RMA access to the windows is enabled, so that each process should complete the sequence of calls start-put-complete. Once these are done, the wait calls should complete at both processes. Thus, this communication should not deadlock, irrespective of the amount of data transferred.

Assume, in the last example, that the order of the post and start calls is reversed, at each process. Then, the code may deadlock, as each process may block on the start call, waiting for the matching post to occur. Similarly, the program will deadlock, if the order of the complete and wait calls is reversed, at each process.

The following two examples illustrate the fact that the synchronization between complete and wait is not symmetric: the wait call blocks until the complete executes, but not vice-versa. Consider the code illustrated in Figure [[one-side#Progress|Progress]] .

*Figure: Deadlock situation*

This code will deadlock: the wait of process 1 blocks until process 0 calls complete, and the receive of process 0 blocks until process 1 calls send. Consider, on the other hand, the code illustrated in Figure [[one-side#Progress|Progress]] .

*Figure: No deadlock*

This code will not deadlock. Once process 1 calls post, then the sequence start, put, complete on process 0 can proceed to completion. Process 0 will reach the send call, allowing the receive call of process 1 to complete.

> [!tip] Rationale

> MPI implementations must guarantee that a process makes progress on all enabled communications it participates in, while blocked on an MPI call. This is true for send-receive communication and applies to RMA communication as well. Thus, in the example in Figure [[one-side#Progress|Progress]] , the put and complete calls of process 0 should complete while process 1 is blocked on the receive call. This may require the involvement of process 1, e.g., to transfer the data put, while it is blocked on the receive call.
>
> A similar issue is whether such progress must occur while a process is busy computing, or blocked in a non-MPI call. Suppose that in the last example the send-receive pair is replaced by a write-to-socket/read-from-socket pair. Then MPI does not specify whether deadlock is avoided. Suppose that the blocking receive of process 1 is replaced by a very long compute loop. Then, according to one interpretation of the MPI standard, process 0 must return from the complete call after a bounded delay, even if process 1 does not reach any MPI call in this period of time. According to another interpretation, the complete call may block until process 1 reaches the wait call, or reaches another MPI call. The qualitative behavior is the same, under both interpretations, unless a process is caught in an infinite compute loop, in which case the difference may not matter. However, the quantitative expectations are different. Different MPI implementations reflect these different interpretations. While this ambiguity is unfortunate, it does not seem to affect many real codes. The MPI forum decided not to decide which interpretation of the standard is the correct one, since the issue is very contentious, and a decision would have much impact on implementors but less impact on users.

### Registers and Compiler Optimizations

> [!note] Advice to users

> All the material in this section is an advice to users.

A coherence problem exists between variables kept in registers and the memory value of these variables. An RMA call may access a variable in memory (or cache), while the up-to-date value of this variable is in register. A get will not return the latest variable value, and a put may be overwritten when the register is stored back in memory.

The problem is illustrated by the following code:

Source of Process 1 Source of Process 2 Executed in Process 2\
bbbb = 777 buff = 999 reg_A:=999\
call MPI_WIN_FENCE call MPI_WIN_FENCE\
call MPI_PUT(bbbb stop appl. thread\
into buff of process 2) buff:=777 in PUT handler\
continue appl. thread\
call MPI_WIN_FENCEcall MPI_WIN_FENCE\
ccc = buff ccc:=reg_A

In this example, variable `buff` is allocated in the register `reg_A` and therefore `ccc` will have the old value of `buff` and not the new value `777`.

This problem, which also afflicts in some cases send/receive communication, is discussed more at length in Section [[binding#A Problem with Register Optimization|A Problem with Register Optimization]] .

MPI implementations will avoid this problem for standard conforming C programs. Many Fortran compilers will avoid this problem, without disabling compiler optimizations. However, in order to avoid register coherence problems in a completely portable manner, users should restrict their use of RMA windows to variables stored in `COMMON` blocks, or to variables that were declared `VOLATILE` (while `VOLATILE` is not a standard Fortran declaration, it is supported by many Fortran compilers). Details and an additional solution are discussed in Section [[binding#A Problem with Register Optimization|A Problem with Register Optimization]] , “A Problem with Register Optimization,” on page [[binding#A Problem with Register Optimization|A Problem with Register Optimization]] . See also, “Problems Due to Data Copying and Sequence Association,” on page [[binding#Problems Due to Data Copying and Sequence Association|Problems Due to Data Copying and Sequence Association]] , for additional Fortran problems.

---
title: "Semantics and Correctness"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Semantics and Correctness

Chapter **one-side** · in [[versions/v20/sections/one-side#Semantics and Correctness|MPI-2.0]], [[versions/v21/sections/one-side#Semantics and Correctness|MPI-2.1]], [[versions/v22/sections/one-side#Semantics and Correctness|MPI-2.2]], [[versions/v30/sections/one-side#Semantics and Correctness|MPI-3.0]], [[versions/v31/sections/one-side#Semantics and Correctness|MPI-3.1]], [[versions/v40/sections/one-side#Semantics and Correctness|MPI-4.0]], [[versions/v41/sections/one-side#Semantics and Correctness|MPI-4.1]], [[versions/v50/sections/one-side#Semantics and Correctness|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

~~The following rules specify the latest time at which an operation must complete at the origin or the target. The update performed by a get call in the origin process memory is visible when the get operation is complete at the origin (or earlier); the update performed by a put or accumulate call in the public copy of the target window is visible when the put or accumulate has completed at the target (or earlier). The rules also specifies the latest time at which an update of one window copy becomes visible in another overlapping copy.~~

~~1.  An RMA operation is completed at the origin by the ensuing call to [[MPI_WIN_COMPLETE, MPI_WIN_FENCE]] or [[versions/v21/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] that synchronizes this access at the origin.~~

==The following rules specify the latest time at which an operation must complete at the origin or the target. The update performed by a get call in the origin process memory is visible when the get operation is complete at the origin (or earlier); the update performed by a put or accumulate call in the public copy of the target window is visible when the put or accumulate has completed at the target (or earlier). The rules==

==also specify==

==the latest time at which an update of one window copy becomes visible in another overlapping copy.==

==1.  An RMA operation is completed at the origin by the ensuing call to [[versions/v21/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] , [[versions/v21/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] or [[versions/v21/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] that synchronizes this access at the origin.==

6. An update by a put or accumulate call to a public window copy becomes visible in the private copy in process memory at latest when an ensuing call to ~~[[MPI_WIN_WAIT, MPI_WIN_FENCE]]~~ ==[[versions/v21/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] , [[versions/v21/API/MPI_WIN_FENCE|MPI_WIN_FENCE]]== , or [[versions/v21/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] is executed on that window by the window owner.

~~The rules above also define, by implication, when an update to a public window copy becomes visible in another overlapping public window copy. Consider, for example, two overlapping windows, win1 and win2. A call to [[versions/v21/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] by the window owner makes visible in the process memory previous updates to window win1 by remote processes. A subsequent call to [[versions/v21/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] makes these updates visible in the public copy of win2.~~

==The rules above also define, by implication, when an update to a public window copy becomes visible in another overlapping public window copy.==

==Consider, for example, two overlapping windows, `win1` and `win2`. A call to [[versions/v21/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] by the window owner makes visible in the process memory previous updates to window `win1` by remote processes. A subsequent call to [[versions/v21/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] makes these updates visible in the public copy of `win2`.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

5. An update of a location in a private window copy in process memory becomes visible in the public window copy at latest when an ensuing call to ~~[[MPI_WIN_POST, MPI_WIN_FENCE]]~~ ==[[versions/v22/API/MPI_WIN_POST|MPI_WIN_POST]] , [[versions/v22/API/MPI_WIN_FENCE|MPI_WIN_FENCE]]== , or [[versions/v22/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] is executed on that window by the window owner.

~~> A user can write correct programs by following the following rules: > > fence:   > During each period between fence calls, each window is either updated by put or accumulate calls, or updated by local stores, but not both. Locations updated by put or accumulate calls should not be accessed during the same period (with the exception of concurrent updates to the same location by accumulate calls). Locations accessed by get calls should not be updated during the same period. > > post-start-complete-wait:   > A window should not be updated locally while being posted, if it is being updated by put or accumulate calls. Locations updated by put or accumulate calls should not be accessed while the window is posted (with the exception of concurrent updates to the same location by accumulate calls). Locations accessed by get calls should not be updated while the window is posted. > > With the post-start synchronization, the target process can tell the origin process that its window is now ready for RMA access; with the complete-wait synchronization, the origin process can tell the target process that it has finished its RMA accesses to the window. > > lock:   > Updates to the window are protected by exclusive locks if they may conflict. Nonconflicting accesses (such as read-only accesses or accumulate accesses) are protected by shared locks, both for local accesses and for RMA accesses. > > changing window or synchronization mode:   > One can change synchronization mode, or change the window used to access a location that belongs to two overlapping windows, when the process memory and the window copy are guaranteed to have the same values. This is true after a local call to [[versions/v22/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , if RMA accesses to the window are synchronized with fences; after a local call to [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] , if the accesses are synchronized with post-start-complete-wait; after the call at the origin (local or remote) to [[versions/v22/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] if the accesses are synchronized with locks. > > In addition, a process should not access the local buffer of a get operation until the operation is complete, and should not update the local buffer of a put or accumulate operation until that operation is complete.~~

==> A user can write correct programs by following the following rules: > > fence:   > During each period between fence calls, each window is either updated by put or accumulate calls, or updated by local stores, but not both. Locations updated by put or accumulate calls should not be accessed during the same period (with the exception of concurrent updates to the same location by accumulate calls). Locations accessed by get calls should not be updated during the same period. > > post-start-complete-wait:   > A window should not be updated locally while being posted, if it is being updated by put or accumulate calls. Locations updated by put or accumulate calls should not be accessed while the window is posted (with the exception of concurrent updates to the same location by accumulate calls). Locations accessed by get calls should not be updated while the window is posted. > > With the post-start synchronization, the target process can tell the origin process that its window is now ready for RMA access; with the complete-wait synchronization, the origin process can tell the target process that it has finished its RMA accesses to the window. > > lock:   > Updates to the window are protected by exclusive locks if they may conflict. Nonconflicting accesses (such as read-only accesses or accumulate accesses) are protected by shared locks, both for local accesses and for RMA accesses. > > changing window or synchronization mode:   > One can change synchronization mode, or change the window used to access a location that belongs to two overlapping windows, when the process memory and the window copy are guaranteed to have the same values. This is true after a local call to [[versions/v22/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , if RMA accesses to the window are synchronized with fences; after a local call to [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] , if the accesses are synchronized with post-start-complete-wait; after the call at the origin (local or remote) to [[versions/v22/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] if the accesses are synchronized with locks. > > In addition, a process should not access the local buffer of a get operation until the operation is complete, and should not update the local buffer of a put or accumulate operation until that operation is complete. > > The RMA synchronization operations define when updates are guaranteed to become visible in public and private windows. Updates may become visible earlier, but such behavior is implementation dependent.==

==The semantics are illustrated by the following examples:==

==Rule 5:==

==    Process A:                 Process B:                                window location X==

==                               MPI_Win_lock(EXCLUSIVE,B)                                store X /* local update to private copy of B */                                MPI_Win_unlock(B)                                 /* now visible in public window copy */==

==    MPI_Barrier                MPI_Barrier==

==    MPI_Win_lock(EXCLUSIVE,B)     MPI_Get(X) /* ok, read from public window */     MPI_Win_unlock(B)==

==Rule 6:==

==    Process A:                 Process B:                                window location X==

==    MPI_Win_lock(EXCLUSIVE,B)     MPI_Put(X) /* update to public window */     MPI_Win_unlock(B)==

==    MPI_Barrier                MPI_Barrier==

==                               MPI_Win_lock(EXCLUSIVE,B)                                 /* now visible in private copy of B */                                load X                                MPI_Win_unlock(B)==

==Note that the private copy of X has not necessarily been updated after the barrier, so omitting the lock-unlock at process B may lead to the load returning an obsolete value.==

==The rules do *not* guarantee that process A in the following sequence will see the value of X as updated by the local store by B before the lock.==

==    Process A:                 Process B:                                window location X==

==                               store X /* update to private copy of B */                                MPI_Win_lock(SHARED,B)     MPI_Barrier                MPI_Barrier==

==    MPI_Win_lock(SHARED,B)     MPI_Get(X) /* X may not be in public window copy */     MPI_Win_unlock(B)                                MPI_Win_unlock(B)                                 /* update on X now visible in public window */==

==In the following sequence==

==    Process A:                 Process B:     window location X     window location Y==

==    store Y     MPI_Win_post(A,B) /* Y visible in public window */     MPI_Win_start(A)           MPI_Win_start(A)==

==    store X /* update to private window */==

==    MPI_Win_complete           MPI_Win_complete     MPI_Win_wait     /* update on X may not yet visible in public window */==

==    MPI_Barrier                MPI_Barrier==

==                               MPI_Win_lock(EXCLUSIVE,A)                                MPI_Get(X) /* may return an obsolete value */                                 MPI_Get(Y)                                MPI_Win_unlock(A)==

==it is *not* guaranteed that process B reads the value of X as per the local update by process A, because neither [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] nor [[versions/v22/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] calls by process A ensure visibility in the public window copy. To allow B to read the value of X stored by A the local store must be replaced by a local [[versions/v22/API/MPI_PUT|MPI_PUT]] that updates the public window copy. Note that by this replacement X may become visible in the private copy in process memory of A only after the [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] call in process A. The update on Y made before the [[versions/v22/API/MPI_WIN_POST|MPI_WIN_POST]] call is visible in the public window after the [[versions/v22/API/MPI_WIN_POST|MPI_WIN_POST]] call and therefore correctly gotten by process B. The [[versions/v22/API/MPI_GET|MPI_GET]] call could be moved to the epoch started by the [[versions/v22/API/MPI_WIN_START|MPI_WIN_START]] operation, and process B would still get the value stored by A.==

==Finally, in the following sequence==

==    Process A:                 Process B:                                window location X==

==    MPI_Win_lock(EXCLUSIVE,B)     MPI_Put(X) /* update to public window */     MPI_Win_unlock(B)==

==    MPI_Barrier                MPI_Barrier==

==                               MPI_Win_post(B)                                MPI_Win_start(B)==

==                               load X /* access to private window */                                       /* may return an obsolete value */==

==                               MPI_Win_complete                                MPI_Win_wait==

==rules (5,6) do *not* guarantee that the private copy of X at B has been updated before the load takes place. To ensure that the value put by process A is read, the local load must be replaced with a local [[versions/v22/API/MPI_GET|MPI_GET]] operation, or must be placed after the call to [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] .==

### MPI-2.2 → MPI-3.0  (10 changed paragraphs)

~~The semantics of RMA operations is best understood by assuming that the system maintains a separate *public* copy of each window, in addition to the original location in process memory (the *private* window copy). There is only one instance of each variable in process memory, but a distinct *public* copy of the variable for each window that contains it. A load accesses the instance in process memory (this includes MPI sends). A store accesses and updates the instance in process memory (this includes MPI receives), but the update may affect other public copies of the same locations. A get on a window accesses the public copy of that window. A put or accumulate on a window accesses and updates the public copy of that window, but the update may affect the private copy of the same locations in process memory, and public copies of other overlapping windows. This is illustrated in Figure [[versions/v30/sections/one-side#Semantics and Correctness|Semantics and Correctness]] .~~

~~*Figure: Schematic description of window*~~

~~The following rules specify the latest time at which an operation must complete at the origin or the target. The update performed by a get call in the origin process memory is visible when the get operation is complete at the origin (or earlier); the update performed by a put or accumulate call in the public copy of the target window is visible when the put or accumulate has completed at the target (or earlier). The rules~~

~~also specify~~

~~the latest time at which an update of one window copy becomes visible in another overlapping copy.~~

~~1.  An RMA operation is completed at the origin by the ensuing call to [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] , [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] or [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] that synchronizes this access at the origin.~~

==The following rules specify the latest time at which an operation must complete at the origin or the target. The update performed by a get call in the origin process memory is visible when the get operation is complete at the origin (or earlier); the update performed by a put or accumulate call in the public copy of the target window is visible when the put or accumulate has completed at the target (or earlier). The rules also specify the latest time at which an update of one window copy becomes visible in another overlapping copy.==

==1.  An RMA operation is completed at the origin by the ensuing call to [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] , [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , [[versions/v30/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] , [[versions/v30/API/MPI_WIN_FLUSH_ALL|MPI_WIN_FLUSH_ALL]] , [[versions/v30/API/MPI_WIN_FLUSH_LOCAL|MPI_WIN_FLUSH_LOCAL]] , [[versions/v30/API/MPI_WIN_FLUSH_LOCAL_ALL|MPI_WIN_FLUSH_LOCAL_ALL]] , [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] , or [[versions/v30/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] that synchronizes this access at the origin.==

~~4.  If an RMA operation is completed at the origin by a call to [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] then the operation is completed at the target by that same call to [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] .~~

~~5.  An update of a location in a private window copy in process memory becomes visible in the public window copy at latest when an ensuing call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] , [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , or [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] is executed on that window by the window owner.~~

~~6.  An update by a put or accumulate call to a public window copy becomes visible in the private copy in process memory at latest when an ensuing call to [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] , [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , or [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] is executed on that window by the window owner.~~

~~The [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] or [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] call that completes the transfer from public copy to private copy (6) is the same call that completes the put or accumulate operation in the window copy (2, 3). If a put or accumulate access was synchronized with a lock, then the update of the public window copy is complete as soon as the updating process executed [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] . On the other hand, the update of private copy in the process memory may be delayed until the target process executes a synchronization call on that window (6). Thus, updates to process memory can always be delayed until the process executes a suitable synchronization call. Updates to a public window copy can also be delayed until the window owner executes a synchronization call, if fences or post-start-complete-wait synchronization is used. Only when lock synchronization is used does it becomes necessary to update the public window copy, even if the window owner does not execute any related synchronization call.~~

~~The rules above also define, by implication, when an update to a public window copy becomes visible in another overlapping public window copy.~~

~~Consider, for example, two overlapping windows, `win1` and `win2`. A call to [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] by the window owner makes visible in the process memory previous updates to window `win1` by remote processes. A subsequent call to [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] makes these updates visible in the public copy of `win2`.~~

~~A correct program must obey the following rules.~~

~~1.  A location in a window must not be accessed locally once an update to that location has started, until the update becomes visible in the private window copy in process memory.~~

~~2.  A location in a window must not be accessed as a target of an RMA operation once an update to that location has started, until the update becomes visible in the public window copy. There is one exception to this rule, in the case where the same variable is updated by two concurrent accumulates that use the same operation, with the same predefined datatype, on the same window.~~

~~3.  A put or accumulate must not access a target window once a local update or a put or accumulate update to another (overlapping) target window have started on a location in the target window, until the update becomes visible in the public copy of the window. Conversely, a local update in process memory to a location in a window must not start once a put or accumulate update to that target window has started, until the put or accumulate update becomes visible in process memory. In both cases, the restriction applies to operations even if they access disjoint locations in the window.~~

~~A program is erroneous if it violates these rules.~~

==4.  If an RMA operation is completed at the origin by a call to [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] , [[versions/v30/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] , [[versions/v30/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] , or [[versions/v30/API/MPI_WIN_FLUSH_ALL|MPI_WIN_FLUSH_ALL]] , then the operation is completed at the target by that same call.==

==5.  An update of a location in a private window copy in process memory becomes visible in the public window copy at latest when an ensuing call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] , [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] , [[versions/v30/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] , or [[versions/v30/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] is executed on that window by the window owner. In the RMA unified memory model, an update of a location in a private window in process memory becomes visible without additional RMA calls.==

==6.  An update by a put or accumulate call to a public window copy becomes visible in the private copy in process memory at latest when an ensuing call to [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] , [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] , or [[versions/v30/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] is executed on that window by the window owner. In the RMA unified memory model, an update by a put or accumulate call to a public window copy eventually becomes visible in the private copy in process memory without additional RMA calls.==

==The [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] or [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] call that completes the transfer from public copy to private copy ( [[rma-rule-updatetoprivate]] ) is the same call that completes the put or accumulate operation in the window copy ( [[rma-rule-fenceattarget]] , [[rma-rule-completewait]] ). If a put or accumulate access was synchronized with a lock, then the update of the public window copy is complete as soon as the updating process executed [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] or [[versions/v30/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] . In the RMA separate memory model, the update of a private copy in the process memory may be delayed until the target process executes a synchronization call on that window ( [[rma-rule-updatetoprivate]] ). Thus, updates to process memory can always be delayed in the RMA separate memory model until the process executes a suitable synchronization call, while they must complete in the RMA unified model without additional synchronization calls.==

==If fence or post-start-complete-wait synchronization is used, updates to a public window copy can be delayed in both memory models until the window owner executes a synchronization call.==

==When passive target synchronization (lock/unlock or even flush) is used, it is necessary to update the public window copy in the RMA separate model, or the private window copy in the RMA unified model, even if the window owner does not execute any related synchronization call.==

==The rules above also define, by implication, when an update to a public window copy becomes visible in another overlapping public window copy. Consider, for example, two overlapping windows, `win1` and `win2`. A call to [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] by the window owner makes visible in the process memory previous updates to window `win1` by remote processes. A subsequent call to [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] makes these updates visible in the public copy of `win2`.==

==The behavior of some MPI RMA operations may be *undefined* in certain situations. For example, the result of several origin processes performing concurrent [[versions/v30/API/MPI_PUT|MPI_PUT]] operations to the same target location is undefined. In addition, the result of a single origin process performing multiple [[versions/v30/API/MPI_PUT|MPI_PUT]] operations to the same target location within the same access epoch is also undefined. The result at the target may have all of the data from one of the [[versions/v30/API/MPI_PUT|MPI_PUT]] operations (the “last” one, in some sense), bytes from some of each of the operations, or something else. In MPI-2, such operations were *erroneous*. That meant that an MPI implementation was permitted to signal an MPI exception. Thus, user programs or tools that used MPI RMA could not portably permit such operations, even if the application code could function correctly with such an undefined result. In MPI-3, these operations are not erroneous, but do not have a defined behavior.==

~~> The last constraint on correct RMA accesses may seem unduly restrictive, as it forbids concurrent accesses to nonoverlapping locations in a window. The reason for this constraint is that, on some architectures, explicit coherence restoring operations may be needed at synchronization points. A different operation may be needed for locations that were locally updated by stores and for locations that were remotely updated by put or accumulate operations. Without this constraint, the MPI library will have to track precisely which locations in a window were updated by a put or accumulate call. The additional overhead of maintaining such information is considered prohibitive.~~

==> As discussed in , requiring operations such as overlapping puts to be erroneous makes it difficult to use MPI RMA to implement programming models—such as Unified Parallel C (UPC) or SHMEM—that permit these operations. Further, while MPI-2 defined these operations as erroneous, the MPI Forum is unaware of any implementation that enforces this rule, as it would require significant overhead. Thus, relaxing this condition does not impact existing implementations or applications.==

==> [!warning] Advice to implementors==

==> Overlapping accesses are undefined. However, to assist users in debugging code, implementations may wish to provide a mode in which such operations are detected and reported to the user. Note, however, that in MPI-3, such operations must not generate an MPI exception.==

==A program with a well-defined outcome in the `MPI_WIN_SEPARATE` memory model must obey the following rules.==

==1.  A location in a window must not be accessed with load/store operations once an update to that location has started, until the update becomes visible in the private window copy in process memory.==

==2.  A location in a window must not be accessed as a target of an RMA operation once an update to that location has started, until the update becomes visible in the public window copy. There is one exception to this rule, in the case where the same variable is updated by two concurrent accumulates with the same predefined datatype, on the same window. Additional restrictions on the operation apply, see the info key `accumulate_ops` in Section [[versions/v30/sections/one-side#Window Creation|Window Creation]] .==

==3.  A put or accumulate must not access a target window once a load/store update or a put or accumulate update to another (overlapping) target window has started on a location in the target window, until the update becomes visible in the public copy of the window. Conversely, a store to process memory to a location in a window must not start once a put or accumulate update to that target window has started, until the put or accumulate update becomes visible in process memory. In both cases, the restriction applies to operations even if they access disjoint locations in the window.==

==> [!tip] Rationale==

==> The last constraint on correct RMA accesses may seem unduly restrictive, as it forbids concurrent accesses to nonoverlapping locations in a window. The reason for this constraint is that, on some architectures, explicit coherence restoring operations may be needed at synchronization points. A different operation may be needed for locations that were updated by stores and for locations that were remotely updated by put or accumulate operations. Without this constraint, the MPI library would have to track precisely which locations in a window were updated by a put or accumulate call. The additional overhead of maintaining such information is considered prohibitive.==

==Note that [[versions/v30/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] may be used within a passive target epoch to synchronize the private and public window copies (that is, updates to one are made visible to the other).==

==In the `MPI_WIN_UNIFIED` memory model, the rules are much simpler because the public and private windows are the same. However, there are restrictions to avoid concurrent access to the same memory locations by different processes. The rules that a program with a well-defined outcome must obey in this case are:==

==1.  A location in a window must not be accessed with load/store operations once an update to that location has started, until the update is complete, subject to the following special case.==

==2.  Accessing a location in the window that is also the target of a remote update is valid (not erroneous) but the precise result will depend on the behavior of the implementation. Updates from a remote process will appear in the memory of the target, but there are no atomicity or ordering guarantees if more than one byte is updated. Updates are stable in the sense that once data appears in memory of the target, the data remains until replaced by another update. This permits polling on a location for a change from zero to non-zero or for a particular value, but not polling and comparing the relative magnitude of values. Users are cautioned that polling on one memory location and then accessing a different memory location has defined behavior only if the other rules given here and in this chapter are followed.==

==    > [!note] Advice to users==

==    > Some compiler optimizations can result in code that maintains the sequential semantics of the program, but violates this rule by introducing temporary values into locations in memory. Most compilers only apply such transformations under very high levels of optimization and users should be aware that such aggressive optimization may produce unexpected results.==

==3.  Updating a location in the window with a store operation that is also the target of a remote read (but not update) is valid (not erroneous) but the precise result will depend on the behavior of the implementation. Store updates will appear in memory, but there are no atomicity or ordering guarantees if more than one byte is updated. Updates are stable in the sense that once data appears in memory, the data remains until replaced by another update. This permits updates to memory with store operations without requiring an RMA epoch. Users are cautioned that remote accesses to a window that is updated by the local process has defined behavior only if the other rules given here and elsewhere in this chapter are followed.==

==4.  A location in a window must not be accessed as a target of an RMA operation once an update to that location has started and until the update completes at the target. There is one exception to this rule: in the case where the same location is updated by two concurrent accumulates with the same predefined datatype on the same window. Additional restrictions on the operation apply; see the info key `accumulate_ops` in Section [[versions/v30/sections/one-side#Window Creation|Window Creation]] .==

==5.  A put or accumulate must not access a target window once a store, put, or accumulate update to another (overlapping) target window has started on the same location in the target window and until the update completes at the target window. Conversely, a store operation to a location in a window must not start once a put or accumulate update to the same location in that target window has started and until the put or accumulate update completes at the target.==

==Note that [[versions/v30/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] and [[versions/v30/API/MPI_WIN_FLUSH_ALL|MPI_WIN_FLUSH_ALL]] may be used within a passive target epoch to complete RMA operations at the target process.==

==A program that violates these rules has undefined behavior.==

> A user can write correct programs by following the following rules: > > fence: > During each period between fence calls, each window is either updated by put or accumulate calls, or updated by ~~local~~ stores, but not both. Locations updated by put or accumulate calls should not be accessed during the same period (with the exception of concurrent updates to the same location by accumulate calls). Locations accessed by get calls should not be updated during the same period. > > post-start-complete-wait: > A window should not be updated ~~locally~~ ==with store operations== while ~~being posted,~~ ==posted== if it is being updated by put or accumulate calls. Locations updated by put or accumulate calls should not be accessed while the window is posted (with the exception of concurrent updates to the same location by accumulate calls). Locations accessed by get calls should not be updated while the window is posted. > > With the post-start synchronization, the target process can tell the origin process that its window is now ready for RMA access; with the complete-wait synchronization, the origin process can tell the target process that it has finished its RMA accesses to the window. > > lock: > Updates to the window are protected by exclusive locks if they may conflict. Nonconflicting accesses (such as read-only accesses or accumulate accesses) are protected by shared locks, both for ~~local~~ ==load/store== accesses and for RMA accesses. > > changing window or synchronization mode: > One can change synchronization mode, or change the window used to access a location that belongs to two overlapping windows, when the process memory and the window copy are guaranteed to have the same values. This is true after a local call to [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , if RMA accesses to the window are synchronized with fences; after a local call to [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] , if the accesses are synchronized with post-start-complete-wait; after the call at the origin (local or remote) to [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] ==or [[versions/v30/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]]== if the accesses are synchronized with locks. > > In addition, a process should not access the local buffer of a get operation until the operation is complete, and should not update the local buffer of a put or accumulate operation until that operation is complete. > > The RMA synchronization operations define when updates are guaranteed to become visible in public and private windows. Updates may become visible earlier, but such behavior is implementation dependent.

==The following example demonstrates updating a memory location inside a window for the separate memory model, according to== Rule ~~5:~~ ==[[rma-rule-unlockprivate]] . The [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] calls around the store to `X` in process B are necessary to ensure consistency between the public and private copies of the window.==

~~Rule 6:~~

==In the RMA unified model, although the public and private copies of the windows are synchronized, caution must be used when combining load/stores and multi-process synchronization. Although the following example appears correct, the compiler or hardware may delay the store to `X` after the barrier, possibly resulting in the [[versions/v30/API/MPI_GET|MPI_GET]] returning an incorrect value of `X`.==

==    Process A:                 Process B:                                window location X==

==                               store X /* update to private&public copy of B */     MPI_Barrier                MPI_Barrier     MPI_Win_lock_all     MPI_Get(X) /* ok, read from window */     MPI_Win_flush_local(B)     /* read value in X */     MPI_Win_unlock_all==

==[[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] provides process synchronization, but not memory synchronization. The example could potentially be made safe through the use of compiler- and hardware-specific notations to ensure the store to `X` occurs before process B enters the [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] . The use of one-sided synchronization calls, as shown in Example [[versions/v30/sections/one-side#Semantics and Correctness|Semantics and Correctness]] , also ensures the correct result.==

==The following example demonstrates the reading of a memory location updated by a remote process (Rule [[rma-rule-updatetoprivate]] ) in the RMA separate memory model. Although the [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] on process A and the [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] ensure that the public copy on process B reflects the updated value of X, the call to [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] by process B is necessary to synchronize the private copy with the public copy.==

~~Note that the private copy of X has not necessarily been updated after the barrier, so omitting the lock-unlock at process B may lead to the load returning an obsolete value.~~

~~The rules do *not* guarantee that process A in the following sequence will see the value of X as updated by the local store by B before the lock.~~

==Note that in this example, the barrier is not critical to the semantic correctness. The use of exclusive locks guarantees a remote process will not modify the public copy after [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] synchronizes the private and public copies. A polling implementation looking for changes in X on process B would be semantically correct. The barrier is required to ensure that process A performs the put operation before process B performs the load of X.==

==Similar to Example [[versions/v30/sections/one-side#Semantics and Correctness|Semantics and Correctness]] , the following example is unsafe even in the unified model, because the load of X can not be guaranteed to occur after the [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] . While Process B does not need to explicitly synchronize the public and private copies through [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] as the [[versions/v30/API/MPI_PUT|MPI_PUT]] will update both the public and private copies of the window, the scheduling of the load could result in old values of X being returned. Compiler and hardware specific notations could ensure the load occurs after the data is updated, or explicit one-sided synchronization calls can be used to ensure the proper result.==

==    Process A:                 Process B:                                window location X     MPI_Win_lock_all     MPI_Put(X) /* update to window */     MPI_Win_flush(B)==

==    MPI_Barrier                MPI_Barrier                                load X     MPI_Win_unlock_all==

==The following example further clarifies Rule [[rma-rule-unlockprivate]] . [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] do *not* update the public copy of a window with changes to the private copy. Therefore, there is no guarantee that process A in the following sequence will see the value of `X` as updated by the local store by process B before the lock.==

~~    MPI_Win_lock(SHARED,B)     MPI_Get(X) /* X may not be in public window copy */     MPI_Win_unlock(B)                                MPI_Win_unlock(B)                                 /* update on X now visible in public window */~~

~~In the following sequence~~

==    MPI_Win_lock(SHARED,B)     MPI_Get(X) /* X may be the X before the store */     MPI_Win_unlock(B)                                MPI_Win_unlock(B)                                 /* update on X now visible in public window */==

==The addition of an [[versions/v30/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] before the call to [[versions/v30/API/MPI_BARRIER|MPI_BARRIER]] by process B would guarantee process A would see the updated value of `X`, as the public copy of the window would be explicitly synchronized with the private copy.==

==Similar to the previous example, Rule [[rma-rule-unlockprivate]] can have unexpected implications for general active target synchronization with the RMA separate memory model. It is *not* guaranteed that process B reads the value of X as per the local update by process A, because neither [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] nor [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] calls by process A ensure visibility in the public window copy.==

~~it is *not* guaranteed that process B reads the value of X as per the local update by process A, because neither [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] nor [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] calls by process A ensure visibility in the public window copy.~~ To allow ==process== B to read the value of X stored by A the local store must be replaced by a local [[versions/v30/API/MPI_PUT|MPI_PUT]] that updates the public window copy. Note that by this replacement X may become visible in the private copy ~~in~~ ==of== process ~~memory of~~ A only after the [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] call in process A. The update ~~on~~ ==to== Y made before the [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] call is visible in the public window after the [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] call and therefore ~~correctly gotten by~~ process ~~B.~~ ==B will read the proper value of Y.== The [[versions/v30/API/MPI_GET|MPI_GET]] call could be moved to the epoch started by the [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] operation, and process B would still get the value stored by ==process== A.

~~Finally, in~~ ==The following example demonstrates== the ~~following sequence~~ ==interaction of general active target synchronization with local read operations with the RMA separate memory model. Rules [[rma-rule-unlockprivate]] and [[rma-rule-updatetoprivate]] do *not* guarantee that the private copy of X at process B has been updated before the load takes place.==

~~rules (5,6) do *not* guarantee that the private copy of X at B has been updated before the load takes place.~~ To ensure that the value put by process A is read, the local load must be replaced with a local [[versions/v30/API/MPI_GET|MPI_GET]] operation, or must be placed after the call to [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] .

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~If fence or post-start-complete-wait synchronization is used, updates to a public window copy can be delayed in both memory models until the window owner executes a synchronization call.~~

~~When passive target synchronization (lock/unlock or even flush) is used, it is necessary to update the public window copy in the RMA separate model, or the private window copy in the RMA unified model, even if the window owner does not execute any related synchronization call.~~

==If fence or post-start-complete-wait synchronization is used, updates to a public window copy can be delayed in both memory models until the window owner executes a synchronization call. When passive target synchronization==

==is used, it is necessary to update the public window copy==

==even if the window owner does not execute any related synchronization call.==

~~3.  A put or accumulate must not access a target window once a load/store update or a put or accumulate update to another (overlapping) target window has started on a location in the target window, until the update becomes visible in the public copy of the window. Conversely, a store to process memory to a location in a window must not start once a put or accumulate update to that target window has started, until the put or accumulate update becomes visible in process memory. In both cases, the restriction applies to operations even if they access disjoint locations in the window.~~

==3.  A put or accumulate must not access a target window once a==

==    store or a put or accumulate update to another (overlapping) target window has started on a location in the target window, until the update becomes visible in the public copy of the window. Conversely, a store to process memory to a location in a window must not start once a put or accumulate update to that target window has started, until the put or accumulate update becomes visible in process memory. In both cases, the restriction applies to operations even if they access disjoint locations in the window.==

~~In the `MPI_WIN_UNIFIED` memory model, the rules are much simpler because the public and private windows are the same. However, there are restrictions to avoid concurrent access to the same memory locations by different processes. The rules that a program with a well-defined outcome must obey in this case are:~~

==In the `MPI_WIN_UNIFIED` memory model, the rules are==

==simpler because the public and private windows are the same. However, there are restrictions to avoid concurrent access to the same memory locations by different processes. The rules that a program with a well-defined outcome must obey in this case are:==

~~Note that [[versions/v31/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] and [[versions/v31/API/MPI_WIN_FLUSH_ALL|MPI_WIN_FLUSH_ALL]] may be used within a passive target epoch to complete RMA operations at the target process.~~

==> [!note] Advice to users==

==> In the unified memory model, in the case where the window is in shared memory, [[versions/v31/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] can be used to order store operations and make store updates to the window visible to other processes and threads. Use of this routine is necessary to ensure portable behavior when point-to-point, collective, or shared memory synchronization is used in place of an RMA synchronization routine. [[versions/v31/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] should be called by the writer before the non-RMA synchronization operation and by the reader after the non-RMA synchronization, as shown in Example [[versions/v31/sections/one-side#Examples|Examples]] .==

Process A: Process B: window location X

store X /* update to ~~private&public~~ ==private & public== copy of B */ MPI_Barrier MPI_Barrier MPI_Win_lock_all MPI_Get(X) /* ok, read from window */ MPI_Win_flush_local(B) /* read value in X */ MPI_Win_unlock_all

### MPI-3.1 → MPI-4.0  (13 changed paragraphs)

The behavior of some MPI RMA operations may be *undefined* in certain situations. For example, the result of several origin processes performing concurrent [[versions/v40/API/MPI_PUT|MPI_PUT]] operations to the same target location is undefined. In addition, the result of a single origin process performing multiple [[versions/v40/API/MPI_PUT|MPI_PUT]] operations to the same target location within the same access epoch is also undefined. The result at the target may have all of the data from one of the [[versions/v40/API/MPI_PUT|MPI_PUT]] operations (the “last” one, in some sense), bytes from some of each of the operations, or something else. In MPI-2, such operations were *erroneous*. That meant that an MPI implementation was permitted to ~~signal~~ ==raise== an ~~MPI exception.~~ ==error.== Thus, user programs or tools that used MPI RMA could not portably permit such operations, even if the application code could function correctly with such an undefined result. ~~In~~ ==Starting with== MPI-3, these operations are not erroneous, but do not have a defined behavior.

> Overlapping accesses are undefined. However, to assist users in debugging code, implementations may wish to provide a mode in which such operations are detected and reported to the user. Note, however, that ~~in~~ ==starting with== MPI-3, such operations must not ~~generate~~ ==raise== an ~~MPI exception.~~ ==error.==

~~MPI_Win_lock(EXCLUSIVE,B)~~ ==MPI_Win_lock(EXCLUSIVE, B)== store X /* local update to private copy of B */ MPI_Win_unlock(B) /* now visible in public window copy */

~~MPI_Win_lock(EXCLUSIVE,B)~~ ==MPI_Win_lock(EXCLUSIVE, B)== MPI_Get(X) /* ok, read from public window */ MPI_Win_unlock(B)

The following example demonstrates the reading of a memory location updated by a remote process (Rule [[rma-rule-updatetoprivate]] ) in the RMA separate memory model. Although the [[versions/v40/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] on process A and the [[versions/v40/API/MPI_BARRIER|MPI_BARRIER]] ensure that the public copy on process B reflects the updated value of ~~X,~~ ==`X`,== the call to [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] by process B is necessary to synchronize the private copy with the public copy.

~~MPI_Win_lock(EXCLUSIVE,B)~~ ==MPI_Win_lock(EXCLUSIVE, B)== MPI_Put(X) /* update to public window */ MPI_Win_unlock(B)

~~MPI_Win_lock(EXCLUSIVE,B)~~ ==MPI_Win_lock(EXCLUSIVE, B)== /* now visible in private copy of B */ load X MPI_Win_unlock(B)

Note that in this example, the barrier is not critical to the semantic correctness. The use of exclusive locks guarantees a remote process will not modify the public copy after [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] synchronizes the private and public copies. A polling implementation looking for changes in ~~X~~ ==`X`== on process B would be semantically correct. The barrier is required to ensure that process A performs the put operation before process B performs the load of ~~X.~~ ==`X`.==

Similar to Example [[versions/v40/sections/one-side#Semantics and Correctness|Semantics and Correctness]] , the following example is unsafe even in the unified model, because the load of ~~X~~ ==`X`== can not be guaranteed to occur after the [[versions/v40/API/MPI_BARRIER|MPI_BARRIER]] . While Process B does not need to explicitly synchronize the public and private copies through [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] as the [[versions/v40/API/MPI_PUT|MPI_PUT]] will update both the public and private copies of the window, the scheduling of the load could result in old values of ~~X~~ ==`X`== being returned. Compiler and hardware specific notations could ensure the load occurs after the data is updated, or explicit one-sided synchronization calls can be used to ensure the proper result.

MPI_Barrier MPI_Barrier load X ==/* may return an obsolete value */== MPI_Win_unlock_all

store X /* update to private copy of B */ ~~MPI_Win_lock(SHARED,B)~~ ==MPI_Win_lock(SHARED, B)== MPI_Barrier MPI_Barrier

~~MPI_Win_lock(SHARED,B)~~ ==MPI_Win_lock(SHARED, B)== MPI_Get(X) /* X may be the X before the store */ MPI_Win_unlock(B) MPI_Win_unlock(B) /* update on X now visible in public window */

Similar to the previous example, Rule [[rma-rule-unlockprivate]] can have unexpected implications for general active target synchronization with the RMA separate memory model. It is *not* guaranteed that process B reads the value of ~~X~~ ==`X`== as per the local update by process A, because neither [[versions/v40/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] nor [[versions/v40/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] calls by process A ensure visibility in the public window copy.

store Y ~~MPI_Win_post(A,B)~~ ==MPI_Win_post(A, B)== /* Y visible in public window */ MPI_Win_start(A) MPI_Win_start(A)

~~MPI_Win_lock(EXCLUSIVE,A)~~ ==MPI_Win_lock(EXCLUSIVE, A)== MPI_Get(X) /* may return an obsolete value */ MPI_Get(Y) MPI_Win_unlock(A)

To allow process B to read the value of ~~X~~ ==`X`== stored by A the local store must be replaced by a local [[versions/v40/API/MPI_PUT|MPI_PUT]] that updates the public window copy. Note that by this replacement ~~X~~ ==`X`== may become visible in the private copy of process A only after the [[versions/v40/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] call in process A. The update to ~~Y~~ ==`Y`== made before the [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] call is visible in the public window after the [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] call and therefore process B will read the proper value of ~~Y.~~ ==`Y`.== The [[versions/v40/API/MPI_GET|MPI_GET]] call could be moved to the epoch started by the [[versions/v40/API/MPI_WIN_START|MPI_WIN_START]] operation, and process B would still get the value stored by process A.

The following example demonstrates the interaction of general active target synchronization with local read operations with the RMA separate memory model. Rules [[rma-rule-unlockprivate]] and [[rma-rule-updatetoprivate]] do *not* guarantee that the private copy of ~~X~~ ==`X`== at process B has been updated before the load takes place.

~~MPI_Win_lock(EXCLUSIVE,B)~~ ==MPI_Win_lock(EXCLUSIVE, B)== MPI_Put(X) /* update to public window */ MPI_Win_unlock(B)

### MPI-4.0 → MPI-4.1  (20 changed paragraphs)

The following rules specify the latest ~~time at which~~ ==point in the execution of the application== an operation must complete at the origin or the target. The update ~~performed~~ ==initiated== by a ~~get~~ call ==to [[versions/v41/API/MPI_GET|MPI_GET]]== in the origin process memory is visible when the get operation is complete at the origin (or earlier); the update ~~performed~~ ==initiated== by a ~~put~~ ==call to [[versions/v41/API/MPI_PUT|MPI_PUT]]== or ==an== accumulate ~~call~~ ==procedure== in the public copy of the target window is visible when the put or accumulate ==operation== has completed at the target (or earlier). The rules also specify the latest ~~time~~ ==point== at which an update of one window copy becomes visible in another overlapping copy.

4. If an RMA operation is completed at the origin by a call to [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] ~~,~~ ==or [[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] (with `rank``=target`),== [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] ~~, [[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]]~~ , or [[versions/v41/API/MPI_WIN_FLUSH_ALL|MPI_WIN_FLUSH_ALL]] , then the operation is completed at the target by that same call.

5. An update of a location in a private window copy in ==MPI== process memory becomes visible in the public window copy at ==the== latest when an ensuing call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] , [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] , [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] , or [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] is executed on that window by the window owner. In the RMA unified memory model, an update of a location in a private window in ==MPI== process memory becomes visible without additional RMA calls.

6. An update by a put or accumulate ~~call~~ ==operation== to a public window copy becomes visible in the private copy in ==MPI== process memory at ==the== latest when an ensuing call to [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] , [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] , or [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] is executed on that window by the window owner. In the RMA unified memory model, an update by a put or accumulate ~~call~~ ==operation== to a public window copy eventually becomes visible in the private copy in ==MPI== process memory without additional RMA calls.

The [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] or [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] call that completes the transfer from public copy to private copy ~~(~~ ==(Rule== [[rma-rule-updatetoprivate]] ) is the same call that completes the put or accumulate operation in the window copy ~~(~~ ==(Rule== [[rma-rule-fenceattarget]] , ==Rule== [[rma-rule-completewait]] ). If a put or accumulate access was synchronized with a lock, then the update of the public window copy is complete as soon as the updating ==origin== process executed [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] or [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] . In the RMA separate memory model, the update of a private copy in the ==target== process memory may be delayed until the target process executes a synchronization call on that window ~~(~~ ==(Rule== [[rma-rule-updatetoprivate]] ). Thus, updates to ==target== process memory can always be delayed in the RMA separate memory model until the ==target== process executes a suitable synchronization call, while they must complete in the RMA unified model without additional synchronization calls.

The rules above also define, by implication, when an update to a public window copy becomes visible in another overlapping public window copy. Consider, for example, two overlapping windows, `win1` and `win2`. A call to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] ==on `win1`== by the window owner makes visible in the ==target== process memory previous updates to window `win1` by ~~remote~~ ==origin== processes. A subsequent call to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] ==on `win2`== makes these updates visible in the public copy of `win2`.

The behavior of some MPI RMA operations may be *undefined* in certain situations. For example, the result of several origin processes performing concurrent ~~[[versions/v41/API/MPI_PUT|MPI_PUT]]~~ ==put== operations to the same target location is undefined. In addition, the result of a single origin process performing multiple ~~[[versions/v41/API/MPI_PUT|MPI_PUT]]~~ ==put== operations to the same target location within the same access epoch is also undefined. The result at the target may have all of the data from one of the ~~[[versions/v41/API/MPI_PUT|MPI_PUT]]~~ ==put== operations (the “last” one, in some sense), ==some== bytes from ~~some of~~ each of the operations, or something else. In MPI-2, such operations were *erroneous*. That meant that an MPI implementation was permitted to raise an error. Thus, user programs or tools that used MPI RMA could not portably permit such operations, even if the application code could function correctly with such an undefined result. Starting with MPI-3, these operations are not erroneous, but do not have a defined behavior.

1. A location in a window must not be accessed with load/store ~~operations~~ ==accesses== once an update to that location has started, until the update becomes visible in the private window copy in ==target== process memory.

store or a put or accumulate update to another (overlapping) ~~target~~ window has started on a location in the target window, until the update becomes visible in the public copy of the window. Conversely, a store to ==MPI== process memory to a location in a window must not start once a put or accumulate update to that target window has started, until the put or accumulate update becomes visible in ==target== process memory. In both cases, the restriction applies to operations even if they access disjoint locations in the window.

> The last constraint on correct RMA accesses may seem unduly restrictive, as it forbids concurrent accesses to nonoverlapping locations in a window. The reason for this constraint is that, on some architectures, explicit coherence restoring operations may be needed at synchronization points. A different operation may be needed for locations that were updated by stores and for locations that were remotely updated by put or accumulate operations. Without this constraint, the MPI library would have to track precisely which locations in a window were updated by a put or accumulate ~~call.~~ ==operation.== The additional overhead of maintaining such information is considered prohibitive.

simpler because the public and private windows are the same. However, there are restrictions to avoid concurrent access to the same memory locations by different ==MPI== processes. The rules that a program with a well-defined outcome must obey in this case are:

1. A location in a window must not be accessed with load/store ~~operations~~ ==accesses== once an update to that location has started, until the update is complete, subject to the ~~following~~ special ~~case.~~ ==case laid out in Rule [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] .==

2. Accessing a location in the window that is also the target of a remote update is valid (not erroneous) but the precise result will depend on the behavior of the implementation. Updates from ~~a remote~~ ==an origin== process will appear in the memory of the target, but there are no atomicity or ordering guarantees if more than one byte is updated. Updates are stable in the sense that once data appears in ==the== memory of the target, the data remains until replaced by another update. This permits polling on a location for a change from zero to ~~non-zero~~ ==nonzero== or for a particular value, but not polling and comparing the relative magnitude of values. Users are cautioned that polling on one memory location and then accessing a different memory location has defined behavior only if the other rules given here and in this chapter are followed.

3. Updating a location in the window with a store ~~operation~~ ==access== that is also the target of a remote read (but not update) is valid (not erroneous) but the precise result will depend on the behavior of the implementation. Store updates will appear in memory, but there are no atomicity or ordering guarantees if more than one byte is updated. Updates are stable in the sense that once data appears in memory, the data remains until replaced by another update. This permits updates to memory with store ~~operations~~ ==accesses== without requiring an RMA epoch. Users are cautioned that remote accesses to a window that is updated by the local ==MPI== process has defined behavior only if the other rules given here and elsewhere in this chapter are followed.

5. A put or accumulate must not access a target window once a store, put, or accumulate update to another (overlapping) target window has started on the same location in the target window and until the update completes at the target window. Conversely, a store ~~operation~~ ==access== to a location in a window must not ~~start~~ ==be executed== once a put or accumulate update to the same location in that target window has started and until the put or accumulate update completes at the target.

> In the unified memory model, in the case where the window is in ~~shared memory,~~ ==*shared memory*,== [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] can be used to order store ~~operations~~ ==accesses== and make store updates to the window visible to other ==MPI== processes and threads. Use of this routine is necessary to ensure portable behavior when point-to-point, collective, or ~~shared memory~~ ==*shared memory*== synchronization is used in place of an RMA synchronization routine. [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] should be called by ==both the reader and== the writer ~~before the~~ ==of a shared memory variable between any== non-RMA synchronization ~~operation~~ and ~~by the reader after the non-RMA synchronization,~~ ==access to that variable,== as shown in Example [[versions/v41/sections/one-side#Examples|Examples]] . ==The calls to [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] can be replaced by language level memory synchronization operations, if available.==

> A user can write correct programs by following the following rules: > > fence: > During each period between fence calls, each window is either updated by put or accumulate ~~calls,~~ ==operation,== or updated by stores, but not both. Locations updated by put or accumulate ~~calls~~ ==operations== should not be accessed during the same period (with the exception of concurrent updates to the same location by accumulate ~~calls).~~ ==operations).== Locations accessed by get ~~calls~~ ==operations== should not be updated during the same period. > > post-start-complete-wait: > A window should not be updated with store ~~operations~~ ==accesses== while posted if it is being updated by put or accumulate ~~calls.~~ ==operations.== Locations updated by put or accumulate ~~calls~~ ==operations== should not be accessed while the window is posted (with the exception of concurrent updates to the same location by accumulate ~~calls).~~ ==operations).== Locations accessed by get ~~calls~~ ==operations== should not be updated while the window is posted. > > With the post-start synchronization, the target process can tell the origin process that its window is now ready for RMA access; with the complete-wait synchronization, the origin process can tell the target process that it has finished its RMA accesses to the window. > > lock: > Updates to the window are protected by ~~exclusive locks~~ ==*exclusive locks*== if they may conflict. Nonconflicting accesses (such as read-only accesses or accumulate accesses) are protected by ~~shared locks,~~ ==*shared locks*,== both for load/store accesses and for RMA accesses. > > changing window or synchronization mode: > One can change synchronization mode, or change the window used to access a location that belongs to two overlapping windows, when the ==MPI== process memory and the window copy are guaranteed to have the same values. This is true ==for an MPI process== after ~~a local call to~~ ==it has returned from== [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , if RMA accesses to the window are synchronized with fences; after ~~a local call to~~ ==it has returned from== [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] , if the accesses are synchronized with post-start-complete-wait; ~~after the call~~ ==it is true== at the origin ~~(local or remote)~~ ==and target after the origin returned from a call== to [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] or [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] if the accesses are synchronized with locks. > > In addition, ~~a~~ ==an origin== process should not access the local buffer of a get operation until the operation is complete, and should not update the local buffer of a put or accumulate operation until that operation is complete. > > The RMA synchronization operations define when updates are guaranteed to become visible in public and private windows. Updates may become visible earlier, but such behavior is implementation dependent.

The ~~semantics are illustrated by the~~ following ~~examples:~~ ==examples illustrate these semantics.==

~~Process A: Process B:~~ ==\textbf{Process A} \textbf{Process B}== window location X

MPI_Win_lock(EXCLUSIVE, B) store X /* local update to private copy of B */ MPI_Win_unlock(B) /* now visible in public window copy */

MPI_Barrier MPI_Barrier

In the RMA unified model, although the public and private copies of the windows are synchronized, caution must be used when combining ~~load/stores and~~ ==load/store accesses with== multi-process synchronization. Although the following example appears correct, the compiler or hardware may delay the store to `X` after the barrier, possibly resulting in the [[versions/v41/API/MPI_GET|MPI_GET]] returning an incorrect value of `X`.

~~Process A: Process B:~~ ==\textbf{Process A} \textbf{Process B}== window location X

The following example demonstrates the reading of a memory location updated by ~~a remote~~ ==an origin== process (Rule [[rma-rule-updatetoprivate]] ) in the RMA separate memory model. Although the ==call to== [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] on process A and the [[versions/v41/API/MPI_BARRIER|MPI_BARRIER]] ensure that the public copy on process B reflects the updated value of `X`, the call to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] by process B is necessary to synchronize the private copy with the public copy.

~~Process A: Process B:~~ ==\textbf{Process A} \textbf{Process B}== window location X

MPI_Win_lock(EXCLUSIVE, B) /* now visible in private copy of B */ load X MPI_Win_unlock(B)

Note that in this example, the barrier is not critical to the semantic correctness. The use of ~~exclusive locks~~ ==*exclusive locks*== guarantees ~~a remote~~ ==no other MPI== process will ~~not~~ modify the public copy after [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] synchronizes the private and public copies. A polling implementation looking for changes in `X` on process B would be semantically correct. The barrier is required to ensure that process A ~~performs~~ ==completes== the put operation ==at the target== before process B ~~performs~~ ==executes== the load of `X`.

Similar to Example [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] , the following example is unsafe even in the unified model, because the load of `X` ~~can not~~ ==cannot== be guaranteed to occur after the [[versions/v41/API/MPI_BARRIER|MPI_BARRIER]] . While Process B does not need to explicitly synchronize the public and private copies through [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] as the [[versions/v41/API/MPI_PUT|MPI_PUT]] will update both the public and private copies of the window, the scheduling of the load could result in old values of `X` being returned. Compiler and hardware specific notations could ensure the load occurs after the data is updated, or explicit one-sided synchronization calls can be used to ensure the proper result.

~~Process A: Process B:~~ ==\textbf{Process A} \textbf{Process B}== window location X MPI_Win_lock_all MPI_Put(X) /* update to window */ MPI_Win_flush(B)

The following example further clarifies Rule [[rma-rule-unlockprivate]] . [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] do *not* update the public copy of a window with changes to the private copy. Therefore, there is no guarantee that process A in the following sequence will see the value of `X` as updated by the ~~local~~ store by process B before the lock.

~~Process A: Process B:~~ ==\textbf{Process A} \textbf{Process B}== window location X

MPI_Win_lock(SHARED, B) MPI_Get(X) /* X may be the X before the store */ MPI_Win_unlock(B) MPI_Win_unlock(B) /* update on X now visible in public window */

The addition of ~~an~~ ==a call to== [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] before the call to [[versions/v41/API/MPI_BARRIER|MPI_BARRIER]] by process B would guarantee process A would see the updated value of `X`, as the public copy of the window would be explicitly synchronized with the private copy.

Similar to the previous example, Rule [[rma-rule-unlockprivate]] can have unexpected implications for general active target synchronization with the RMA separate memory model. It is *not* guaranteed that process B reads the value of `X` as per the local update by process A, because neither ==the call to== [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] nor ==the call to== [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] ~~calls~~ by process A ensure visibility in the public window copy.

~~Process A: Process B:~~ ==\textbf{Process A} \textbf{Process B}== window location X window location Y

MPI_Win_complete MPI_Win_complete MPI_Win_wait /* update on X may not yet ==be== visible in ==the== public window ==copy== */

To allow process B to read the value of `X` stored by ~~A~~ ==A,== the local store must be replaced by a local ~~[[versions/v41/API/MPI_PUT|MPI_PUT]]~~ ==put operation== that updates the public window copy. Note that by this replacement `X` may become visible in the private copy of process A only after the [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] call in process A. The update to `Y` made before the [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] call is visible in the public window after the [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] call and therefore process B will read the proper value of `Y`. The ~~[[versions/v41/API/MPI_GET|MPI_GET]] call~~ ==get of `Y`== could be moved to the epoch ~~started~~ ==opened== by ~~the~~ [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] ~~operation,~~ ==,== and process B would still get the value stored by process A.

The following example demonstrates the interaction of general active target synchronization with ~~local read operations with~~ ==load accesses in== the RMA separate memory model. Rules [[rma-rule-unlockprivate]] and [[rma-rule-updatetoprivate]] do *not* guarantee that the private copy of `X` at process B has been updated before the load ~~takes place.~~ ==access is executed.==

~~Process A: Process B:~~ ==\textbf{Process A} \textbf{Process B}== window location X

To ensure that the value put by process A is read, the ~~local~~ load ==access== must be replaced with a ~~local [[versions/v41/API/MPI_GET|MPI_GET]]~~ ==get== operation, or must be placed after the call to [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] .

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Semantics and Correctness]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Semantics and Correctness]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Semantics and Correctness]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Semantics and Correctness]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Semantics and Correctness]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Semantics and Correctness]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Semantics and Correctness]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Semantics and Correctness]]

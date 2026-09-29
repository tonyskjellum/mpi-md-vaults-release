---
title: "Progress"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Progress

Chapter **one-side** · in [[versions/v20/sections/one-side#Progress|MPI-2.0]], [[versions/v21/sections/one-side#Progress|MPI-2.1]], [[versions/v22/sections/one-side#Progress|MPI-2.2]], [[versions/v30/sections/one-side#Progress|MPI-3.0]], [[versions/v31/sections/one-side#Progress|MPI-3.1]], [[versions/v40/sections/one-side#Progress|MPI-4.0]], [[versions/v41/sections/one-side#Progress|MPI-4.1]], [[versions/v50/sections/one-side#Progress|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

One-sided communication has the same progress requirements as point-to-point communication: once a communication is ~~enabled, then~~ ==enabled== it is guaranteed to complete. RMA calls must have local semantics, except when required for synchronization with other RMA calls.

Consider the code fragment in Example [[versions/v30/sections/one-side#General Active Target Synchronization|General Active Target Synchronization]] , on page [[versions/v30/sections/one-side#General Active Target Synchronization|General Active Target Synchronization]] . Some of the calls may block if the target window is not posted. However, if the target window is posted, then the code fragment must complete. The data transfer may start as soon as the put call ~~occur,~~ ==occurs,== but may be delayed until the ensuing complete call occurs.

Assume, in the last example, that the order of the post and start calls is ~~reversed,~~ ==reversed== at each process. Then, the code may deadlock, as each process may block on the start call, waiting for the matching post to occur. Similarly, the program will ~~deadlock,~~ ==deadlock== if the order of the complete and wait calls is ~~reversed,~~ ==reversed== at each process.

The following two examples illustrate the fact that the synchronization between complete and wait is not symmetric: the wait call blocks until the complete executes, but not ~~vice-versa.~~ ==vice versa.== Consider the code illustrated in Figure [[versions/v30/sections/one-side#Progress|Progress]] .

> MPI implementations must guarantee that a process makes progress on all enabled communications it participates in, while blocked on an MPI call. This is true for send-receive communication and applies to RMA communication as well. Thus, in the example in Figure [[versions/v30/sections/one-side#Progress|Progress]] , the put and complete calls of process 0 should complete while process 1 is blocked on the receive call. This may require the involvement of process 1, e.g., to transfer the data put, while it is blocked on the receive call. > > A similar issue is whether such progress must occur while a process is busy computing, or blocked in a non-MPI call. Suppose that in the last example the send-receive pair is replaced by a write-to-socket/read-from-socket pair. Then MPI does not specify whether deadlock is avoided. Suppose that the blocking receive of process 1 is replaced by a very long compute loop. Then, according to one interpretation of the MPI standard, process 0 must return from the complete call after a bounded delay, even if process 1 does not reach any MPI call in this period of time. According to another interpretation, the complete call may block until process 1 reaches the wait call, or reaches another MPI call. The qualitative behavior is the same, under both interpretations, unless a process is caught in an infinite compute loop, in which case the difference may not matter. However, the quantitative expectations are different. Different MPI implementations reflect these different interpretations. While this ambiguity is unfortunate, it does not seem to affect many real codes. The MPI ~~forum~~ ==Forum== decided not to decide which interpretation of the standard is the correct one, since the issue is very contentious, and a decision would have much impact on implementors but less impact on users.

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

Consider the code fragment in ~~Example [[versions/v31/sections/one-side#General Active Target Synchronization|General Active Target Synchronization]] , on page [[versions/v31/sections/one-side#General Active Target Synchronization|General Active Target Synchronization]] .~~ ==[[Example]] ex:1sided-start-complete.== Some of the calls may block if the target window is not posted. However, if the target window is posted, then the code fragment must complete. The data transfer may start as soon as the put call occurs, but may be delayed until the ensuing complete call occurs.

Consider the code fragment in ~~Example [[versions/v31/sections/one-side#Lock|Lock]] , on page [[versions/v31/sections/one-side#Lock|Lock]] .~~ ==[[Example]] ex:1sided-lock-unlock.== Some of the calls may block if another process holds a conflicting lock. However, if no conflicting lock is held, then the code fragment must complete.

> MPI implementations must guarantee that a process makes progress on all enabled communications it participates in, while blocked on an MPI call. This is true for send-receive communication and applies to RMA communication as well. Thus, in the example in Figure [[versions/v31/sections/one-side#Progress|Progress]] , the put and complete calls of process 0 should complete while process 1 is blocked on the receive call. This may require the involvement of process 1, e.g., to transfer the data put, while it is blocked on the receive call. > > A similar issue is whether such progress must occur while a process is busy computing, or blocked in a non-MPI call. Suppose that in the last example the send-receive pair is replaced by a write-to-socket/read-from-socket pair. Then MPI does not specify whether deadlock is avoided. Suppose that the blocking receive of process 1 is replaced by a very long compute loop. Then, according to one interpretation of the MPI standard, process 0 must return from the complete call after a bounded delay, even if process 1 does not reach any MPI call in this period of time. According to another interpretation, the complete call may block until process 1 reaches the wait call, or reaches another MPI call. The qualitative behavior is the same, under both interpretations, unless a process is caught in an infinite compute loop, in which case the difference may not matter. However, the quantitative expectations are different. Different MPI implementations reflect these different interpretations. While this ambiguity is unfortunate, ~~it does not seem to affect many real codes. The~~ ==the== MPI Forum decided not to ~~decide~~ ==define== which interpretation of the standard is the correct one, since the issue is ~~very contentious, and a decision would have much impact on implementors but less impact on users.~~ ==contentious.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> MPI implementations must guarantee that a process makes ~~progress~~ ==*progress*== on all enabled communications it participates in, while blocked on an MPI call. This is true for send-receive communication and applies to RMA communication as well. Thus, in the example in Figure [[versions/v40/sections/one-side#Progress|Progress]] , the put and complete calls of process 0 should complete while process 1 is blocked on the receive call. This may require the involvement of process 1, e.g., to transfer the data put, while it is blocked on the receive call. > > A similar issue is whether such progress must occur while a process is busy computing, or blocked in a non-MPI call. Suppose that in the last example the send-receive pair is replaced by a write-to-socket/read-from-socket pair. Then MPI does not specify whether deadlock is avoided. Suppose that the blocking receive of process 1 is replaced by a very long compute loop. Then, according to one interpretation of the MPI standard, process 0 must return from the complete call after a bounded delay, even if process 1 does not reach any MPI call in this period of time. According to another interpretation, the complete call may block until process 1 reaches the wait call, or reaches another MPI call. The qualitative behavior is the same, under both interpretations, unless a process is caught in an infinite compute loop, in which case the difference may not matter. However, the quantitative expectations are different. Different MPI implementations reflect these different interpretations. While this ambiguity is unfortunate, the MPI Forum decided not to define which interpretation of the standard is the correct one, since the issue is contentious.

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

There is some fuzziness in the definition of the time when ~~a~~ ==an== RMA communication becomes enabled. This fuzziness provides to the implementor more flexibility than with point-to-point communication. Access to a target window becomes enabled once the corresponding synchronization (such as [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] or [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] ) has executed. On the origin process, an RMA communication ==operation== may become enabled as soon as the corresponding put, get or accumulate call has ~~executed,~~ ==occurred,== or as late as when the ensuing synchronization call is issued. Once the ~~communication~~ ==operation== is enabled both at the origin and at the target, the ~~communication~~ ==operation== must complete.

Consider the code fragment in [[Example]] ex:1sided-start-complete. Some of the calls may ~~block if~~ ==have to delay their return until== the target window ~~is not~~ ==has been== posted. However, if the target window is posted, then the code fragment must complete. The data transfer may start as soon as the put call occurs, but may be delayed until the ensuing complete call occurs.

Consider the code fragment in [[Example]] ex:1sided-lock-unlock. Some of the calls may ~~block~~ ==delay their return until the lock is acquired== if another ==MPI== process holds a conflicting lock. However, if no conflicting lock is held, then the code fragment must complete.

Each ==MPI== process updates the window of the other ==MPI== process using a put operation, then accesses its own window. The post calls are ~~nonblocking, and should complete.~~ ==local.== Once the post calls occur, RMA access to the windows is enabled, so that each ==MPI== process should complete the sequence of ~~calls~~ start-put-complete. Once these are done, the wait calls should complete at both ==MPI== processes. Thus, this communication should not deadlock, irrespective of the amount of data transferred.

Assume, in the last example, that the order of the post and start calls is reversed at each ==MPI== process. Then, the code may deadlock, as each ==MPI== process may ~~block on~~ ==not return from== the start call, waiting for the matching post to occur. Similarly, the program will deadlock if the order of the complete and wait calls is reversed at each ==MPI== process.

The following two examples illustrate the fact that the synchronization between complete and wait is not symmetric: the wait call ~~blocks until~~ ==returns only once== the complete ~~executes,~~ ==occurs,== but not vice versa. Consider the code illustrated in Figure [[versions/v41/sections/one-side#Progress|Progress]] .

This code will deadlock: the wait of process 1 ~~blocks until~~ ==completes only once== process 0 calls complete, and the receive of process 0 ~~blocks until~~ ==completes once== process 1 calls send. Consider, on the other hand, the code illustrated in Figure [[versions/v41/sections/one-side#Progress|Progress]] .

This code will not deadlock. Once process 1 calls post, then the sequence ~~start, put, complete~~ ==start-put-complete== on process 0 can ~~proceed to completion.~~ ==proceed.== Process 0 will reach the send call, allowing the receive call of process 1 to ~~complete.~~ ==return.==

~~> MPI implementations must guarantee that a process makes *progress* on all enabled communications it participates in, while blocked on an MPI call. This is true for send-receive communication and applies to RMA communication as well. Thus, in the example in Figure [[versions/v41/sections/one-side#Progress|Progress]] , the put and complete calls of process 0 should complete while process 1 is blocked on the receive call. This may require the involvement of process 1, e.g., to transfer the data put, while it is blocked on the receive call. > > A similar issue is whether such progress must occur while a process is busy computing, or blocked in a non-MPI call. Suppose that in the last example the send-receive pair is replaced by a write-to-socket/read-from-socket pair. Then MPI does not specify whether deadlock is avoided. Suppose that the blocking receive of process 1 is replaced by a very long compute loop. Then, according to one interpretation of the MPI standard, process 0 must return from the complete call after a bounded delay, even if process 1 does not reach any MPI call in this period of time. According to another interpretation, the complete call may block until process 1 reaches the wait call, or reaches another MPI call. The qualitative behavior is the same, under both interpretations, unless a process is caught in an infinite compute loop, in which case the difference may not matter. However, the quantitative expectations are different. Different MPI implementations reflect these different interpretations. While this ambiguity is unfortunate, the MPI Forum decided not to define which interpretation of the standard is the correct one, since the issue is contentious.~~

==> MPI implementations must guarantee that an MPI process makes *progress* on all enabled communications it participates in, while blocked on an MPI call. This is true for send-receive communication and applies to RMA communication as well. Thus, in the example in Figure [[versions/v41/sections/one-side#Progress|Progress]] , the put and complete calls of process 0 should complete while process 1 is waiting for the receive operation to complete. This may require the involvement of process 1, e.g., to transfer the data. > > A similar issue is whether such progress must occur while an MPI process is busy computing, or blocked in a non-MPI call. Suppose that in the last example the send-receive pair is replaced by a write-to-socket/read-from-socket pair. Then MPI does not specify whether deadlock is avoided. Suppose that the blocking receive of process 1 is replaced by a very long compute loop. Then, according to one interpretation of the MPI standard, process 0 must return from the complete call after a bounded delay, even if process 1 does not reach any MPI call in this period of time. According to another interpretation, the complete call may block until process 1 reaches the wait call, or reaches another MPI call. The qualitative behavior is the same, under both interpretations, unless an MPI process is caught in an infinite compute loop, in which case the difference may not matter. However, the quantitative expectations are different. Different MPI implementations reflect these different interpretations. While this ambiguity is unfortunate, the MPI Forum decided not to define which interpretation of the standard is the correct one, since the issue is contentious. See also [[versions/v41/sections/terms#Progress|Progress]] on *progress*.==

==The use of shared memory loads and/or stores for synchronizing purposes between MPI processes does not guarantee progress, and therefore a *deadlock* may occur if an MPI implementation does not provide *strong progress*, as shown in [[Example]] exa:sync-shared:deadlock.==

== Possible *deadlock* due to the use of a shared memory variable for synchronization.==

==`comm_sm` shall be a shared memory communicator (e.g., returned from a call to [[versions/v41/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] with `split_type``=``MPI_COMM_TYPE_SHARED`) with at least two MPI processes. `win_sm` is a shared memory window with the `AckInRank0` as window portion in MPI process with rank `0`. The ranks in `comm_sm` and `win_sm` should be the same. According to [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] rules U [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] and U [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] , a volatile store to `AckInRank0` will be visible in the other MPI process without further RMA calls.==

==(code block added)==
```
int volatile_load(int *addr) {return *(volatile int *)addr;}
void volatile_store(int *addr, int val) {*((volatile int *)addr) = val;}

\textbf[Process with rank 0]                    \textbf[Process with rank 1]
MPI_Win_shared_query(win,              MPI_Win_shared_query(win,
   /*rank=*/ 0, ..., AckInRank0);         /*rank=*/ 0, ..., AckInRank0);
                                        
volatile_store(AckInRank0, 0);
MPI_Win_fence(win_sm)                  MPI_Win_fence(win_sm)
MPI_Buffer_attach(myHugeBuffer,...);
MPI_Bsend(myHugeMessage, ...,
          /*rank=*/ 1,..., comm_sm);   sleep(5); // to ensure
sleep(10); // to guarantee that          // that the MPI_Bsend
           // the while-loop starts      // in rank 0 returned
           // after rank 1 is
           // blocked in MPI_Recv      MPI_Recv(&myHugeMessage, ...                   
                                         /*rank=*/ 0, ..., comm_sm, ...);
                                       volatile_store(AckInRank0,222);
while(volatile_load(AckInRank0)!=222) 
          /*empty polling loop*/;
MPI_Buffer_detach(&pTemp, &size);
// deadlock                            // deadlock
```

==While the call to [[versions/v41/API/MPI_RECV|MPI_Recv]] in the MPI process with rank `1` delays its return (until an unspecific MPI procedure call in the MPI process with rank `0` happens to send the buffered data), the subsequent statement cannot change the value of the shared window buffer `AckInRank0`. As long as this value is not changed, the while loop in the MPI process with rank `0` will continue and therefore the next MPI procedure call ( [[versions/v41/API/MPI_BUFFER_DETACH|MPI_Buffer_detach]] ) cannot happen, which is then a *deadlock*.==

==Note that both communication patterns (A) BSEND-RECV-DETACH and (B) the shared memory store/load for synchronization purpose, can be in different software layers and each layer would work properly, but the combination of (A) and (B) can cause the *deadlock*.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

Note that both communication patterns (A) ~~BSEND-RECV-DETACH~~ ==[[BSEND-RECV-DETACH]]== and (B) the shared memory store/load for synchronization purpose, can be in different software layers and each layer would work properly, but the combination of (A) and (B) can cause the *deadlock*.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Progress]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Progress]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Progress]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Progress]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Progress]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Progress]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Progress]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Progress]]

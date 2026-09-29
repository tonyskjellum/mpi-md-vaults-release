---
title: "General Active Target Synchronization"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# General Active Target Synchronization

Chapter **one-side** · in [[versions/v20/sections/one-side#General Active Target Synchronization|MPI-2.0]], [[versions/v21/sections/one-side#General Active Target Synchronization|MPI-2.1]], [[versions/v22/sections/one-side#General Active Target Synchronization|MPI-2.2]], [[versions/v30/sections/one-side#General Active Target Synchronization|MPI-3.0]], [[versions/v31/sections/one-side#General Active Target Synchronization|MPI-3.1]], [[versions/v40/sections/one-side#General Active Target Synchronization|MPI-4.0]], [[versions/v41/sections/one-side#General Active Target Synchronization|MPI-4.1]], [[versions/v50/sections/one-side#General Active Target Synchronization|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

*Figure: ~~active~~ ==Active== target communication. Dashed arrows represent synchronizations and solid arrows represent data transfer.*

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~This is the nonblocking version of [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . It returns `flag = true` if [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] would return, `flag = false`, otherwise. The effect of return of [[versions/v22/API/MPI_WIN_TEST|MPI_WIN_TEST]] with `flag = true` is the same as the effect of a return of [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . If `flag = false` is returned, then the call has no visible effect.~~

==This is the nonblocking version of [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] .==

==It returns `flag = true` if all accesses to the local window by the group to which it was exposed by the corresponding [[versions/v22/API/MPI_WIN_POST|MPI_WIN_POST]] call have been completed as signalled by matching [[versions/v22/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] calls, and `flag = false` otherwise. In the former case [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] would have returned immediately.==

==The effect of return of [[versions/v22/API/MPI_WIN_TEST|MPI_WIN_TEST]] with `flag = true` is the same as the effect of a return of [[versions/v22/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . If `flag = false` is returned, then the call has no visible effect.==

### MPI-2.2 → MPI-3.0  (8 changed paragraphs)

~~Starts an RMA access epoch for `win`. RMA calls issued on `win` during this epoch must access only windows at processes in `group`. Each process in `group` must issue a matching call to `MPI_WIN_POST`. RMA accesses to each target window will be delayed, if necessary, until the target process executed the matching call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] .~~

~~[[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] is allowed to block until the corresponding `MPI_WIN_POST` calls are executed, but is not required to.~~

==Starts an RMA access epoch for `win`. RMA calls issued on `win` during this epoch must access only windows at processes in `group`. Each process in `group` must issue a matching call to `MPI_WIN_POST`. RMA accesses to each target window will be delayed, if necessary, until the target process executed the matching call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] . [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] is allowed to block until the corresponding `MPI_WIN_POST` calls are executed, but is not required to.==

MPI_Win_start(group, flag, win); ~~MPI_Put(...,win);~~ ==MPI_Put(..., win);== MPI_Win_complete(win);

The call to [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] does not return until the put call has completed at the origin; and the target window will be accessed by the put operation only after the call to [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] has matched a call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] by the target process. This still leaves much choice to implementors. The call to [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] can block until the matching call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] occurs at all target processes. One can also have implementations where the call to [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] is nonblocking, but the call to [[versions/v30/API/MPI_PUT|MPI_PUT]] blocks until the matching call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] ~~occurred;~~ ==occurs;== or implementations where the first two calls are nonblocking, but the call to [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] blocks until the call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] occurred; or even implementations where all three calls can complete before any target process ==has== called [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] — the data put must be buffered, in this last case, so as to allow the put to complete at the origin ahead of its completion at the target. However, once the call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] is issued, the sequence above must complete, without further dependencies.

~~Starts an RMA exposure epoch for the local window associated with `win`. Only processes in `group` should access the window with RMA calls on `win` during this epoch. Each process in `group` must issue a matching call to [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] .~~

~~[[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] does not block.~~

==Starts an RMA exposure epoch for the local window associated with `win`. Only processes in `group` should access the window with RMA calls on `win` during this epoch. Each process in `group` must issue a matching call to [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] . [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] does not block.==

~~This is the nonblocking version of [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] .~~

~~It returns `flag = true` if all accesses to the local window by the group to which it was exposed by the corresponding [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] call have been completed as signalled by matching [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] calls, and `flag = false` otherwise. In the former case [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] would have returned immediately.~~

~~The effect of return of [[versions/v30/API/MPI_WIN_TEST|MPI_WIN_TEST]] with `flag = true` is the same as the effect of a return of [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . If `flag = false` is returned, then the call has no visible effect.~~

==This is the nonblocking version of [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . It returns `flag = true` if all accesses to the local window by the group to which it was exposed by the corresponding [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] call have been completed as signalled by matching [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] calls, and `flag = false` otherwise. In the former case [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] would have returned immediately. The effect of return of [[versions/v30/API/MPI_WIN_TEST|MPI_WIN_TEST]] with `flag = true` is the same as the effect of a return of [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . If `flag = false` is returned, then the call has no visible effect.==

Assume that window `win` is associated with a “hidden” communicator `wincomm`, used for communication by the processes of `win`. The rules for matching of post and start calls and for matching complete and wait ~~call~~ ==calls== can be derived from the rules for matching sends and receives, by considering the following (partial) model implementation.

[[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] initiate a nonblocking send with tag `tag0` to each process in `group`, using `wincomm`. ~~No~~ ==There is no== need to wait for the completion of these sends.

[[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] ~~initiate~~ ==initiates== a nonblocking receive with tag `tag0` from each process in `group`, using `wincomm`. An RMA access to a window in target process `i` is delayed until the receive from `i` is completed.

No races can occur in a correct program: each of the sends matches a unique receive, and ~~vice-versa.~~ ==vice versa.==

> The design for general active target synchronization requires the user to provide complete information on the communication pattern, at each end of a communication link: each origin specifies a list of targets, and each target specifies a list of origins. This provides maximum flexibility (hence, efficiency) for the implementor: each synchronization can be initiated by either side, since each “knows” the identity of the other. This also provides maximum protection from possible races. On the other hand, the design requires more information than RMA ~~needs, in general:~~ ==needs:== in general, it is sufficient for the origin to know the rank of the target, but not vice versa. Users that want more “anonymous” communication will be required to use the fence or lock mechanisms.

> Assume a communication pattern that is represented by a directed graph $`G ~~=\; <V, E>`$,~~ === \langle V, E\rangle`$,== where $`V = \{0, ..., n-1\}`$ and $`ij \in E`$ if origin process $`i`$ accesses the window at target process $`j`$. Then each process $`i`$ issues a call to [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] , followed by a call to [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] , where $`outgroup_i = \{ j : ij \in E\}`$ and $`ingroup_i = \{ j : ji \in E > \}`$. A call is a noop, and can be skipped, if the ~~group~~ ==`group`== argument is empty. After the communications calls, each process that issued a start will issue a complete. Finally, each process that issued a post will issue a wait. > > Note that each process may call with a ~~group~~ ==`group`== argument that has different members.

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

[[versions/v31/API/MPI_WIN_POST|MPI_WIN_POST]] ~~initiate~~ ==initiates== a nonblocking send with tag `tag0` to each process in `group`, using `wincomm`. There is no need to wait for the completion of these sends.

[[versions/v31/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] ~~initiate~~ ==initiates== a nonblocking send with tag `tag1` to each process in the group of the preceding start call. No need to wait for the completion of these sends.

[[versions/v31/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] ~~initiate~~ ==initiates== a nonblocking receive with tag `tag1` from each process in the group of the preceding post call. Wait for the completion of all receives.

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

Starts an RMA access epoch for `win`. RMA calls issued on `win` during this epoch must access only windows at processes in `group`. Each process in `group` must issue a matching call to ~~`MPI_WIN_POST`.~~ ==[[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] .== RMA accesses to each target window will be delayed, if necessary, until the target process executed the matching call to [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] . [[versions/v40/API/MPI_WIN_START|MPI_WIN_START]] is allowed to block until the corresponding ~~`MPI_WIN_POST`~~ ==[[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]]== calls are executed, but is not required to.

The `assert` argument is used to provide assertions on the context of the call that may be used for various optimizations. This is described in Section [[versions/v40/sections/one-side#Assertions|Assertions]] . A value of ~~`assert =~~ ==`assert``=== 0` is always valid.

==Use of [[versions/v40/API/MPI_WIN_START|MPI_WIN_START]] and [[versions/v40/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] .==

The call to [[versions/v40/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] does not return until the put call has completed at the origin; and the target window will be accessed by the put operation only after the call to [[versions/v40/API/MPI_WIN_START|MPI_WIN_START]] has matched a call to [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] by the target process. This still leaves much choice to implementors. The call to [[versions/v40/API/MPI_WIN_START|MPI_WIN_START]] can block until the matching call to [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] occurs at all target processes. One can also have implementations where the call to [[versions/v40/API/MPI_WIN_START|MPI_WIN_START]] is nonblocking, but the call to [[versions/v40/API/MPI_PUT|MPI_PUT]] blocks until the matching call to [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] occurs; or implementations where the first two calls are nonblocking, but the call to [[versions/v40/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] blocks until the call to [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] occurred; or even implementations where all three calls can complete before any target process has called [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] ~~— the~~ ==—the== data put must be buffered, in this last case, so as to allow the put to complete at the origin ahead of its completion at the target. However, once the call to [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] is issued, the sequence above must complete, without further dependencies.

This is the nonblocking version of [[versions/v40/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . It returns ~~`flag =~~ ==`flag``=== true` if all accesses to the local window by the group to which it was exposed by the corresponding [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] call have been completed as signalled by matching [[versions/v40/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] calls, and ~~`flag =~~ ==`flag``=== false` otherwise. In the former case [[versions/v40/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] would have returned immediately. The effect of return of [[versions/v40/API/MPI_WIN_TEST|MPI_WIN_TEST]] with ~~`flag =~~ ==`flag``=== true` is the same as the effect of a return of [[versions/v40/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . If ~~`flag =~~ ==`flag``=== false` is returned, then the call has no visible effect.

[[versions/v40/API/MPI_WIN_TEST|MPI_WIN_TEST]] should be invoked only where [[versions/v40/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] can be invoked. Once the call has returned ~~`flag =~~ ==`flag``=== true`, it must not be invoked anew, until the window is posted anew.

### MPI-4.0 → MPI-4.1  (8 changed paragraphs)

~~Starts~~ ==Opens== an RMA access epoch for `win`. RMA calls issued on `win` during this epoch must access only windows at ==MPI== processes in `group`. Each ==MPI== process in `group` must issue a matching call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] . RMA accesses to each target window will be delayed, if necessary, until the target process executed the matching call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] . [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] is allowed to ~~block~~ ==delay its return== until the corresponding ==calls to== [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] ~~calls are executed,~~ ==have occurred,== but is not required to.

~~Completes~~ ==Closes== an RMA access epoch on `win` ~~started~~ ==opened== by a call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] . All RMA communication ~~calls issued~~ ==operations initiated== on `win` during this epoch will have completed at the origin when the call returns. ==All updates to shared memory in `win` through load/store accesses executed during this epoch will be visible at the target when the call returns.==

[[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] enforces completion of preceding RMA ~~calls~~ ==operations and visibility of load/store accesses== at the origin, but not at the target. A put or accumulate ~~call~~ ==operation== may not have completed at the target when it has completed at the origin.

~~    MPI_Win_start(group, flag, win);     MPI_Put(..., win);     MPI_Win_complete(win);~~

~~The call to [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] does not return until the put call has completed at the origin; and the target window will be accessed by the put operation only after the call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] has matched a call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] by the target process. This still leaves much choice to implementors. The call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] can block until the matching call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] occurs at all target processes. One can also have implementations where the call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] is nonblocking, but the call to [[versions/v41/API/MPI_PUT|MPI_PUT]] blocks until the matching call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] occurs; or implementations where the first two calls are nonblocking, but the call to [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] blocks until the call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] occurred; or even implementations where all three calls can complete before any target process has called [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] —the data put must be buffered, in this last case, so as to allow the put to complete at the origin ahead of its completion at the target. However, once the call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] is issued, the sequence above must complete, without further dependencies.~~

==(code block added)==
``` [MPI]C
MPI_Win_start(group, flag, win);
MPI_Put(..., win);
MPI_Win_complete(win);
```

==The call to [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] does not return until the put operation has completed at the origin; and the target window will be accessed by the put operation only after the call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] has matched a call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] by the target process.==

==> [!warning] Advice to implementors==

==> The semantics described above still leave much choice to implementors. The return from the call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] can block until the matching call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] occurs at all target processes. One can also have implementations where the call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] returns immediately, but the call to [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] delays its return until the call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] occurred; or implementations where all three calls can complete before any target process has called [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] —the data put must be buffered, in this last case, so as to allow the put to complete at the origin ahead of its completion at the target. However, once the call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] is issued, the sequence above must complete, without further dependencies.==

==> [!note] Advice to users==

==> In order to ensure a portable deadlock free program, users must assume that [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] may delay its return until the corresponding call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] has occurred.==

~~Starts~~ ==Opens== an RMA exposure epoch for the local window associated with `win`. Only ==MPI== processes in `group` ~~should~~ ==may== access the window with RMA calls on `win` during this epoch. Each ==MPI== process in `group` must issue a matching call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] . [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] ~~does not block.~~ ==is a *local* procedure.==

~~Completes~~ ==Closes== an RMA exposure epoch ~~started~~ ==opened== by a call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] on `win`. This call matches calls to [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] ==on `win`== issued by each of the origin processes that were granted access to the window during this epoch. The call to [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] will ~~block until~~ ==return only after== all matching calls to [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] have occurred. This guarantees that all these origin processes have completed their RMA ==operations and shared-memory load/store== accesses ~~to~~ ==have become visible on== the local window. When the call returns, all these RMA accesses will have completed at the target window.

Process 0 puts data in the windows of processes 1 and 2 and process 3 puts data in the window of process 2. Each start call lists the ranks of the ==MPI== processes whose windows will be accessed; each post call lists the ranks of the ==MPI== processes that access the local window. The figure illustrates a possible timing for the events, assuming strong synchronization; in a weak synchronization, the start, put or complete calls may occur ahead of the matching post calls.

~~This~~ ==[[versions/v41/API/MPI_WIN_TEST|MPI_WIN_TEST]]== is ==a local procedure. Repeated calls to [[versions/v41/API/MPI_WIN_TEST|MPI_WIN_TEST]] with== the ~~nonblocking version of [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . It returns~~ ==same `win` argument will eventually return== `flag``= true` ~~if~~ ==once== all accesses to the local window by the group to which it was exposed by the corresponding ==call to== [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] ~~call~~ have been completed as ~~signalled~~ ==indicated== by matching [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] calls, and `flag``= false` otherwise. In the former case [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] would have returned immediately. The effect of return of [[versions/v41/API/MPI_WIN_TEST|MPI_WIN_TEST]] with `flag``= true` is the same as the effect of a return of [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . If `flag``= false` is returned, then the call has no visible effect.

[[versions/v41/API/MPI_WIN_TEST|MPI_WIN_TEST]] should be ~~invoked~~ ==called== only where [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] can be ~~invoked.~~ ==called.== Once the call has returned `flag``= true`, it must not be ~~invoked anew,~~ ==called again,== until the window is posted ~~anew.~~ ==again.==

Assume that window `win` is associated with a “hidden” communicator `wincomm`, used for communication by the ==MPI== processes ==in the group== of `win`. The rules for matching of post and start calls and for matching complete and wait calls can be derived from the rules for matching sends and receives, by considering the following (partial) model implementation.

~~[[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]]~~ ==`MPI_WIN_POST(group,0,win)`== initiates a nonblocking send with tag `tag0` to each ==MPI== process in `group`, using `wincomm`. ~~There is no need to wait for the completion of these sends.~~

~~[[versions/v41/API/MPI_WIN_START|MPI_WIN_START]]~~ ==`MPI_WIN_START(group,0,win)`== initiates a nonblocking receive with tag `tag0` from each process in `group`, using `wincomm`. An RMA access to a ~~window in~~ target process ~~`i`~~ is delayed until the receive from ~~`i`~~ ==that MPI process== is completed.

~~[[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]]~~ ==`MPI_WIN_COMPLETE(win)`== initiates a nonblocking send with tag `tag1` to each ==MPI== process in the group of the preceding start call. ~~No need to wait for the completion of these sends.~~

~~[[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]]~~ ==`MPI_WIN_WAIT(win)`== initiates a nonblocking receive with tag `tag1` from each ==MPI== process in the group of the preceding post call. Wait for the completion of all receives.

> Assume a communication pattern that is represented by a directed graph $`G = \langle V, E\rangle`$, where $`V = \{0, ..., n-1\}`$ and $`ij \in E`$ if origin process $`i`$ accesses the window at target process $`j`$. Then each ==MPI== process $`i`$ issues a call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] , followed by a call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] , where $`outgroup_i = \{ j : ij \in E\}`$ and $`ingroup_i = \{ j : ji \in E > \}`$. A call is a noop, and can be skipped, if the `group` argument is empty. After the communications calls, each ==MPI== process that issued a start will issue a complete. Finally, each ==MPI== process that issued a post will issue a wait. > > Note that each ==MPI== process may call with a `group` argument that has different members.

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

*Figure: Active target ~~communication.~~ ==communication, with strong synchronization.== Dashed arrows represent synchronizations and solid arrows represent data transfer.*

~~`MPI_WIN_POST(group,0,win)`~~ ==[[versions/v50/API/MPI_WIN_POST|MPI_WIN_POST]] `(group,0,win)`== initiates a nonblocking send with tag `tag0` to each MPI process in `group`, using `wincomm`.

~~`MPI_WIN_START(group,0,win)`~~ ==[[versions/v50/API/MPI_WIN_START|MPI_WIN_START]] `(group,0,win)`== initiates a nonblocking receive with tag `tag0` from each ==MPI== process in `group`, using `wincomm`. An RMA access to a target process is delayed until the receive from that MPI process is completed.

~~`MPI_WIN_COMPLETE(win)`~~ ==[[versions/v50/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] `(win)`== initiates a nonblocking send with tag `tag1` to each MPI process in the group of the preceding start call.

~~`MPI_WIN_WAIT(win)`~~ ==[[versions/v50/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] `(win)`== initiates a nonblocking receive with tag `tag1` from each MPI process in the group of the preceding post call. Wait for the completion of all receives.

> Assume a communication pattern that is represented by a directed graph $`G = \langle V, E\rangle`$, where $`V = \{0, ..., n-1\}`$ and $`ij \in E`$ if origin process $`i`$ accesses the window at target process $`j`$. Then each MPI process $`i`$ issues a call to [[versions/v50/API/MPI_WIN_POST|MPI_WIN_POST]] ~~,~~ ==`(`$`ingroup_i`$`, ...)`,== followed by a call to [[versions/v50/API/MPI_WIN_START|MPI_WIN_START]] ~~,~~ ==`(`$`outgroup_i`$`,...)`,== where $`outgroup_i = \{ j : ij \in E\}`$ and $`ingroup_i = \{ j : ji \in E > \}`$. A call is a ~~noop,~~ ==no-op,== and can be skipped, if the `group` argument is empty. After the communications calls, each MPI process that issued a start will issue a complete. Finally, each MPI process that issued a post will issue a wait. > > Note that each MPI process may call with a `group` argument that has different members.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#General Active Target Synchronization]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#General Active Target Synchronization]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#General Active Target Synchronization]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#General Active Target Synchronization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#General Active Target Synchronization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#General Active Target Synchronization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#General Active Target Synchronization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#General Active Target Synchronization]]

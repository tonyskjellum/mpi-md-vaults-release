---
title: "Synchronization Calls"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Synchronization Calls

Chapter **one-side** · in [[versions/v20/sections/one-side#Synchronization Calls|MPI-2.0]], [[versions/v21/sections/one-side#Synchronization Calls|MPI-2.1]], [[versions/v22/sections/one-side#Synchronization Calls|MPI-2.2]], [[versions/v30/sections/one-side#Synchronization Calls|MPI-3.0]], [[versions/v31/sections/one-side#Synchronization Calls|MPI-3.1]], [[versions/v40/sections/one-side#Synchronization Calls|MPI-4.0]], [[versions/v41/sections/one-side#Synchronization Calls|MPI-4.1]], [[versions/v50/sections/one-side#Synchronization Calls|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (5 changed paragraphs)

RMA communication calls with argument `win` must occur at a process only within an **access epoch** for `win`. Such an epoch starts with an RMA synchronization call on `win`; it proceeds with zero or more RMA communication calls ( ~~[[MPI_PUT, MPI_GET]]~~ ==[[versions/v21/API/MPI_PUT|MPI_PUT]] , [[versions/v21/API/MPI_GET|MPI_GET]]== or [[versions/v21/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] ) on `win`; it completes with another synchronization call on `win`. This allows users to amortize one synchronization with multiple data transfers and provide implementors more flexibility in the implementation of RMA operations.

2. The four functions ~~[[MPI_WIN_START, MPI_WIN_COMPLETE, MPI_WIN_POST]]~~ ==[[versions/v21/API/MPI_WIN_START|MPI_WIN_START]] , [[versions/v21/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] , [[versions/v21/API/MPI_WIN_POST|MPI_WIN_POST]]== and [[versions/v21/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] can be used to restrict synchronization to the minimum: only pairs of communicating processes synchronize, and they do so only when a synchronization is needed to order correctly RMA accesses to a window with respect to local accesses to that same window. This mechanism may be more efficient when each process communicates with few (logical) neighbors, and the communication graph is fixed or changes infrequently.

*Figure: ~~active~~ ==Active== target communication. Dashed arrows represent synchronizations (ordering of events).*

*Figure: ~~active~~ ==Active== target communication, with weak synchronization. Dashed arrows represent synchronizations (ordering of events)*

*Figure: ~~passive~~ ==Passive== target communication. Dashed arrows represent synchronizations (ordering of events).*

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

RMA communication calls with argument `win` must occur at a process only within an **access epoch** for `win`. Such an epoch starts with an RMA synchronization call on `win`; it proceeds with zero or more RMA communication calls ~~(~~ ==(e.g.,== [[versions/v30/API/MPI_PUT|MPI_PUT]] , [[versions/v30/API/MPI_GET|MPI_GET]] or [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] ) on `win`; it completes with another synchronization call on `win`. This allows users to amortize one synchronization with multiple data transfers and provide implementors more flexibility in the implementation of RMA operations.

~~In active target communication, a target window can be accessed by RMA operations only within an **exposure epoch**. Such an epoch is started and completed by RMA synchronization calls executed by the target process. Distinct exposure epochs at a process on the same window must be disjoint, but such an exposure epoch may overlap with exposure epochs on other windows or with access epochs for the same or other `win` arguments.~~

~~There is a one-to-one matching between access epochs at origin processes and exposure epochs on target processes: RMA operations issued by an origin process for a target window will access that target window during the same exposure epoch if and only if they were issued during the same access epoch.~~

==In active target communication, a target window can be accessed by RMA operations only within an **exposure epoch**. Such an epoch is started and completed by RMA synchronization calls executed by the target process. Distinct exposure epochs at a process on the same window must be disjoint, but such an exposure epoch may overlap with exposure epochs on other windows or with access epochs for the same or other `win` arguments. There is a one-to-one matching between access epochs at origin processes and exposure epochs on target processes: RMA operations issued by an origin process for a target window will access that target window during the same exposure epoch if and only if they were issued during the same access epoch.==

2. The four functions [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] , [[versions/v30/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] , [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] ==,== and [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] can be used to restrict synchronization to the minimum: only pairs of communicating processes synchronize, and they do so only when a synchronization is needed to order correctly RMA accesses to a window with respect to local accesses to that same window. This mechanism may be more efficient when each process communicates with few (logical) neighbors, and the communication graph is fixed or changes infrequently.

3. Finally, shared ~~and exclusive locks are~~ ==lock access is== provided by the ~~two~~ functions ==[[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] , [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] , and [[versions/v30/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] .== [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] ~~.~~ ==also provide exclusive lock capability.== Lock synchronization is useful for MPI applications that emulate a shared memory model via MPI calls; e.g., in a “billboard” model, where processes can, at random times, access or update different parts of the billboard.

These ~~two~~ ==four== calls provide passive target communication. An access epoch is started by a call to [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] ==or [[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]]== and terminated by a call to [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] ~~. Only one target window can be accessed during that epoch with `win`.~~ ==or [[versions/v30/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] , respectively.==

==> [!tip] Rationale==

==> RMA does not define fine-grained mutexes in memory (only logical coarse-grained process locks). MPI provides the primitives (compare and swap, accumulate, send/receive, etc.) needed to implement high-level synchronization operations.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

- **active ~~target** communication,~~ ==target communication**,== where data is moved from the memory of one process to the memory of another, and both are explicitly involved in the communication. This communication pattern is similar to message passing, except that all the data transfer arguments are provided by one process, and the second process only participates in the synchronization.

- **passive ~~target** communication,~~ ==target communication**,== where data is moved from the memory of one process to the memory of another, and only the origin process is explicitly involved in the transfer. Thus, two origin processes may communicate by accessing the same location in a target window. The process that owns the target window may be distinct from the two communicating processes, in which case it does not participate explicitly in the communication. This communication paradigm is closest to a shared memory model, where shared data can be accessed by all processes, irrespective of location.

Figure [[versions/v31/sections/one-side#Synchronization Calls|Synchronization Calls]] shows operations occurring in the natural temporal order implied by the synchronizations: the `post` occurs before the matching `start`, and `complete` occurs before the matching `wait`. However, such ~~**strong** synchronization~~ ==**strong synchronization**== is more than needed for correct ordering of window accesses. The semantics of MPI calls allow ~~**weak** synchronization,~~ ==**weak synchronization**,== as illustrated in Figure [[versions/v31/sections/one-side#Synchronization Calls|Synchronization Calls]] .

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

This call is used for active target communication. An access epoch at an origin process or an exposure epoch at a target process are started and completed by calls to ~~`MPI_WIN_FENCE`.~~ ==[[versions/v40/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] .== A process can access windows at all processes in the group of `win` during such an access epoch, and the local window can be accessed by all processes in the group of `win` during such an exposure epoch.

3. Finally, shared lock access is provided by the functions [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v40/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] , [[versions/v40/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] , and [[versions/v40/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] . [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v40/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] also provide exclusive lock capability. Lock synchronization is useful for MPI applications that emulate a shared memory model via MPI calls; e.g., in a ~~“billboard”~~ ==“bulletin board”== model, where processes can, at random times, access or update different parts of the ~~billboard.~~ ==bulletin board.==

*Figure: Active target communication, with weak synchronization. Dashed arrows represent synchronizations (ordering of ~~events)*~~ ==events).*==

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

~~-~~ **active target communication**, where data is moved from the memory of one ==MPI== process to the memory of another, and both are explicitly involved in the communication. This communication pattern is similar to message passing, except that all the data transfer arguments are provided by ~~one~~ ==the origin== process, and the ~~second~~ ==target== process only participates in the synchronization.

~~-~~ **passive target communication**, where data is moved from the memory of one ==MPI== process to the memory of another, and only the origin process is explicitly involved in the transfer. Thus, two origin processes may communicate by accessing the same location in a target window. The ==MPI== process that owns the target window may be distinct from the two communicating ==MPI== processes, in which case it does not participate explicitly in the communication. This communication paradigm is closest to a shared memory model, where shared data can be accessed by all ==MPI== processes, irrespective of location.

RMA communication calls with argument `win` must occur at ~~a~~ ==an origin== process only within an **access epoch** for `win`. Such an epoch ~~starts~~ ==is opened== with an RMA synchronization call on `win`; it proceeds with zero or more RMA communication calls (e.g., [[versions/v41/API/MPI_PUT|MPI_PUT]] , [[versions/v41/API/MPI_GET|MPI_GET]] or [[versions/v41/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] ) on `win`; it ~~completes~~ ==is closed== with another synchronization call on `win`. This allows users to amortize one synchronization with multiple data transfers and provide implementors more flexibility in the implementation of RMA operations.

Distinct access epochs for `win` at the same ==MPI== process must be disjoint. On the other hand, epochs pertaining to different `win` arguments may overlap. ~~Local operations~~ ==Load/store accesses== or other MPI calls may also occur during an epoch.

In active target communication, a target window can be accessed by RMA operations only within an **exposure epoch**. Such an epoch is ~~started~~ ==opened== and ~~completed~~ ==closed== by RMA synchronization calls executed by the target process. Distinct exposure epochs at ~~a~~ ==an MPI== process on the same window must be disjoint, but such an exposure epoch may overlap with exposure epochs on other windows or with access epochs for the same or other ~~`win`~~ ==window== arguments. There is a one-to-one matching between access epochs at origin processes and exposure epochs on target processes: RMA operations issued by an origin process for a target window will access that target window during the same exposure epoch if and only if they were issued during the same access epoch.

~~1.  The [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] collective synchronization call supports a simple synchronization pattern that is often used in parallel computations: namely a loosely-synchronous model, where global computation phases alternate with global communication phases. This mechanism is most useful for loosely synchronous algorithms where the graph of communicating processes changes very frequently, or where each process communicates with many others.~~

~~    This call is used for active target communication. An access epoch at an origin process or an exposure epoch at a target process are started and completed by calls to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] . A process can access windows at all processes in the group of `win` during such an access epoch, and the local window can be accessed by all processes in the group of `win` during such an exposure epoch.~~

~~2.  The four functions [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] , [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] , [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] , and [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] can be used to restrict synchronization to the minimum: only pairs of communicating processes synchronize, and they do so only when a synchronization is needed to order correctly RMA accesses to a window with respect to local accesses to that same window. This mechanism may be more efficient when each process communicates with few (logical) neighbors, and the communication graph is fixed or changes infrequently.~~

~~    These calls are used for active target communication. An access epoch is started at the origin process by a call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] and is terminated by a call to [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] . The start call has a group argument that specifies the group of target processes for that epoch. An exposure epoch is started at the target process by a call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] and is completed by a call to [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . The post call has a group argument that specifies the set of origin processes for that epoch.~~

~~3.  Finally, shared lock access is provided by the functions [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] , [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] , and [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] . [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] also provide exclusive lock capability. Lock synchronization is useful for MPI applications that emulate a shared memory model via MPI calls; e.g., in a “bulletin board” model, where processes can, at random times, access or update different parts of the bulletin board.~~

~~    These four calls provide passive target communication. An access epoch is started by a call to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] or [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] and terminated by a call to [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] or [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] , respectively.~~

~~Figure [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] illustrates the general synchronization pattern for active target communication.~~

==1.  The [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] collective synchronization call supports a simple synchronization pattern that is often used in parallel computations: namely a loosely-synchronous model, where global computation phases alternate with global communication phases. This mechanism is most useful for loosely synchronous algorithms where the graph of communicating MPI processes changes very frequently, or where each MPI process communicates with many others.==

==    This call is used for active target communication. An access epoch at an origin process or an exposure epoch at a target process is opened and closed by calls to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] . An origin process can access windows at all target processes in the group of `win` during such an access epoch, and the local window can be accessed by all MPI processes in the group of `win` during such an exposure epoch.==

==2.  The four functions [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] , [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] , [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] , and [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] can be used to restrict synchronization to the minimum: only pairs of communicating MPI processes synchronize, and they do so only when a synchronization is needed to order RMA accesses to a window correctly with respect to local accesses to that same window. This mechanism may be more efficient when each MPI process communicates with few (logical) neighbors, and the communication graph is fixed or changes infrequently.==

==    These calls are used for active target communication. An access epoch is opened at the origin process with a call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] and is closed by a call to [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] . The start call has a group argument that specifies the group of target processes for that epoch. An exposure epoch is opened at the target process by a call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] and is closed by a call to [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] . The post call has a group argument that specifies the set of origin processes for that epoch.==

==3.  Finally, *shared lock* access is provided by the functions [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] , [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] , [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] , and [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] . [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] also provide *exclusive lock* capability. Lock synchronization is useful for MPI applications that emulate a shared memory model via MPI calls; e.g., in a “bulletin board” model, where MPI processes can, at random times, access or update different parts of the bulletin board.==

==    These four calls provide passive target communication. An access epoch is opened by a call to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] or [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] and closed by a call to [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] or [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] , respectively.==

~~The synchronization between `post` and `start` ensures that the put call of the origin process does not start until the target process exposes the window (with the `post` call); the target process will expose the window only after preceding local accesses to the window have completed. The synchronization between `complete` and `wait` ensures that the put call of the origin process completes before the window is unexposed (with the `wait` call). The target process will execute following local accesses to the target window only after the `wait` returned.~~

~~Figure [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] shows operations occurring in the natural temporal order implied by the synchronizations: the `post` occurs before the matching `start`, and `complete` occurs before the matching `wait`. However, such **strong synchronization** is more than needed for correct ordering of window accesses. The semantics of MPI calls allow **weak synchronization**, as illustrated in Figure [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] .~~

==Figure [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] illustrates the general synchronization pattern for active target communication. The synchronization between `post` and `start` ensures that the put operation of the origin process does not start until the target process exposes the window (with the `post` call); the target process will expose the window only after preceding local accesses to the window have completed. The synchronization between `complete` and `wait` ensures that the put operation of the origin process completes at the origin and the target before the window is unexposed (with the `wait` call). The target process will execute subsequent local accesses to the target window only after the `wait` returned.==

~~The access to the target window is delayed until the window is exposed, after the `post`. However the `start` may complete earlier; the `put` and `complete` may also terminate earlier, if put data is buffered by the implementation. The synchronization calls order correctly window accesses, but do not necessarily synchronize other operations. This weaker synchronization semantic allows for more efficient implementations.~~

~~Figure [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] illustrates the general synchronization pattern for passive target communication. The first origin process communicates data to the second origin process, through the memory of the target process; the target process is not explicitly involved in the communication.~~

==Figure [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] shows operations occurring in the natural temporal order implied by the synchronizations: the `post` occurs before the matching `start`, and `complete` occurs before the matching `wait`. However, such **strong synchronization** is more than needed for correct ordering of window accesses. The semantics of MPI calls allow **weak synchronization**, as illustrated in Figure [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] . The access to the target window is delayed until the window is exposed, after the `post`. However the `start` may return before the exposure epoch opens at the target. Similarly, the `put` and `complete` calls may also return before the exposure epoch opens at the target, if put data is buffered by the implementation. The synchronization calls correctly order window accesses, but do not necessarily synchronize other operations. This weaker synchronization semantic allows for more efficient implementations.==

==Figure [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] illustrates the general synchronization pattern for passive target communication. The first origin process communicates data to the second origin process, through the memory of the target process; the target process is not explicitly involved in the communication.== The `lock` and `unlock` calls ensure that the two RMA accesses do not occur concurrently. However, they do *not* ensure that the `put` by origin 1 will precede the `get` by origin 2.

> RMA does not define fine-grained mutexes in memory (only logical coarse-grained ~~process~~ ==window== locks). MPI provides the primitives (compare and swap, accumulate, send/receive, etc.) needed to implement high-level synchronization operations.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Synchronization Calls]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Synchronization Calls]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Synchronization Calls]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Synchronization Calls]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Synchronization Calls]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Synchronization Calls]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Synchronization Calls]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Synchronization Calls]]

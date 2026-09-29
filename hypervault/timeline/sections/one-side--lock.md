---
title: "Lock"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Lock

Chapter **one-side** · in [[versions/v20/sections/one-side#Lock|MPI-2.0]], [[versions/v21/sections/one-side#Lock|MPI-2.1]], [[versions/v22/sections/one-side#Lock|MPI-2.2]], [[versions/v30/sections/one-side#Lock|MPI-3.0]], [[versions/v31/sections/one-side#Lock|MPI-3.1]], [[versions/v40/sections/one-side#Lock|MPI-4.0]], [[versions/v41/sections/one-side#Lock|MPI-4.1]], [[versions/v50/sections/one-side#Lock|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

Implementors may restrict the use of RMA communication that is synchronized by lock calls to windows in memory allocated by [[versions/v21/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] (Section ~~[[versions/v21/sections/misc#Memory~~ ==[[inquiry#Memory== Allocation|Memory Allocation]] , page ~~[[versions/v21/sections/misc#Memory~~ ==[[inquiry#Memory== Allocation|Memory Allocation]] ). Locks can be used portably only in such memory.

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

==![[versions/v30/API/MPI_WIN_LOCK_ALL]]==

==Starts an RMA access epoch to all processes in `win`, with a lock type of `MPI_LOCK_SHARED`. During the epoch, the calling process can access the window memory on all processes in `win` by using RMA operations. A window locked with [[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] must be unlocked with `MPI_WIN_UNLOCK_ALL`. This routine is not collective — the `ALL` refers to a lock on all members of the group of the window.==

==> [!note] Advice to users==

==> There may be additional overheads associated with using [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] concurrently on the same window. These overheads could be avoided by specifying the assertion `MPI_MODE_NOCHECK` when possible (see Section [[versions/v30/sections/one-side#Assertions|Assertions]] ).==

~~Locks are used to protect accesses to the locked target window effected by RMA calls issued between the lock and unlock call, and to protect local load/store accesses to a locked local window executed between the lock and unlock call. Accesses that are protected by an exclusive lock will not be concurrent at the window site with other accesses to the same window that are lock protected. Accesses that are protected by a shared lock will not be concurrent at the window site with accesses protected by an exclusive lock to the same window.~~

~~It is erroneous to have a window locked and exposed (in an exposure epoch) concurrently. I.e., a process may not call [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] to lock a target window if the target process has called [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] and has not yet called [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] ; it is erroneous to call [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] while the local window is locked.~~

==![[versions/v30/API/MPI_WIN_UNLOCK_ALL]]==

==Completes a shared RMA access epoch started by a call to [[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] . RMA operations issued during this epoch will have completed both at the origin and at the target when the call returns.==

==Locks are used to protect accesses to the locked target window effected by RMA calls issued between the lock and unlock calls, and to protect load/store accesses to a locked local or shared memory window executed between the lock and unlock calls. Accesses that are protected by an exclusive lock will not be concurrent at the window site with other accesses to the same window that are lock protected. Accesses that are protected by a shared lock will not be concurrent at the window site with accesses protected by an exclusive lock to the same window.==

==It is erroneous to have a window locked and exposed (in an exposure epoch) concurrently. For example, a process may not call [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] to lock a target window if the target process has called [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] and has not yet called [[versions/v30/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] ; it is erroneous to call [[versions/v30/API/MPI_WIN_POST|MPI_WIN_POST]] while the local window is locked.==

Implementors may restrict the use of RMA communication that is synchronized by lock calls to windows in memory allocated by [[versions/v30/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] (Section [[versions/v30/sections/inquiry#Memory Allocation|Memory Allocation]] , page [[versions/v30/sections/inquiry#Memory Allocation|Memory Allocation]] ==), [[versions/v30/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] (Section [[versions/v30/sections/one-side#Window That Allocates Memory|Window That Allocates Memory]] , page [[versions/v30/sections/one-side#Window That Allocates Memory|Window That Allocates Memory]] ), or attached with [[versions/v30/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] (Section [[versions/v30/sections/one-side#Window of Dynamically Attached Memory|Window of Dynamically Attached Memory]] , page [[versions/v30/sections/one-side#Window of Dynamically Attached Memory|Window of Dynamically Attached Memory]]== ). Locks can be used portably only in such memory.

> The implementation of passive target communication when memory is not shared ~~requires~~ ==may require== an asynchronous ==software== agent. Such an agent can be implemented more easily, and can achieve better performance, if restricted to specially allocated memory. It can be avoided altogether if shared memory is used. It seems natural to impose restrictions that allows one to use shared memory for ~~3-rd~~ ==third== party communication in shared memory machines. > > The downside of this decision is that passive target communication cannot be used without taking advantage of nonstandard Fortran features: namely, the availability of C-like pointers; these are not supported by some Fortran ~~compilers (g77 and Windows/NT compilers, at the time of writing). Also, passive target communication cannot be portably targeted to `COMMON` blocks, or other statically declared Fortran arrays.~~ ==compilers.==

~~    MPI_Win_lock(MPI_LOCK_EXCLUSIVE, rank, assert, win)     MPI_Put(..., rank, ..., win)     MPI_Win_unlock(rank, win)~~

~~The call to [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] will not return until the put transfer has completed at the origin and at the target. This still leaves much freedom to implementors. The call to [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] may block until an exclusive lock on the window is acquired; or, the call [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] may not block, while the call to [[versions/v30/API/MPI_PUT|MPI_PUT]] blocks until a lock is acquired; or, the first two calls may not block, while [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] blocks until a lock is acquired — the update of the target window is then postponed until the call to [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] occurs.~~

~~However, if the call to [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] is used to lock a local window, then the call must block until the lock is acquired, since the lock may protect local load/store accesses to the window issued after the lock call returns.~~

==    MPI_Win_lock(MPI_LOCK_EXCLUSIVE, rank, assert, win);     MPI_Put(..., rank, ..., win);     MPI_Win_unlock(rank, win);==

==The call to [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] will not return until the put transfer has completed at the origin and at the target. This still leaves much freedom to implementors. The call to [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] may block until an exclusive lock on the window is acquired; or, the first two calls may not block, while [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] blocks until a lock is acquired — the update of the target window is then postponed until the call to [[versions/v30/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] occurs. However, if the call to [[versions/v30/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] is used to lock a local window, then the call must block until the lock is acquired, since the lock may protect local load/store accesses to the window issued after the lock call returns.==

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

Starts an RMA access epoch. ~~Only the~~ ==The== window at the process with rank `rank` can be accessed by RMA operations on `win` during that epoch. ==Multiple RMA access epochs (with calls to [[versions/v31/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] ) can occur simultaneously; however, each access epoch must target a different process.==

Completes an RMA access epoch started by a call to [[versions/v31/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] ~~.~~ ==on window `win`.== RMA operations issued during this period will have completed both at the origin and at the target when the call returns.

Completes a shared RMA access epoch started by a call to [[versions/v31/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] ~~.~~ ==on window `win`.== RMA operations issued during this epoch will have completed both at the origin and at the target when the call returns.

Implementors may restrict the use of RMA communication that is synchronized by lock calls to windows in memory allocated by [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] ~~(Section [[versions/v31/sections/inquiry#Memory Allocation|Memory Allocation]] , page~~ ==(== [[versions/v31/sections/inquiry#Memory Allocation|Memory Allocation]] ), [[versions/v31/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] ~~(Section [[versions/v31/sections/one-side#Window That Allocates Memory|Window That Allocates Memory]] , page~~ ==(== [[versions/v31/sections/one-side#Window That Allocates Memory|Window That Allocates Memory]] ), or attached with [[versions/v31/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] ~~(Section [[versions/v31/sections/one-side#Window of Dynamically Attached Memory|Window of Dynamically Attached Memory]] , page~~ ==(== [[versions/v31/sections/one-side#Window of Dynamically Attached Memory|Window of Dynamically Attached Memory]] ). Locks can be used portably only in such memory.

> The implementation of passive target communication when memory is not shared may require an asynchronous software agent. Such an agent can be implemented more easily, and can achieve better performance, if restricted to specially allocated memory. It can be avoided altogether if shared memory is used. It seems natural to impose restrictions that allows one to use shared memory for third party communication in shared memory machines. ~~> > The downside of this decision is that passive target communication cannot be used without taking advantage of nonstandard Fortran features: namely, the availability of C-like pointers; these are not supported by some Fortran compilers.~~

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

Starts an RMA access epoch to all processes in `win`, with a lock type of `MPI_LOCK_SHARED`. During the epoch, the calling process can access the window memory on all processes in `win` by using RMA operations. A window locked with [[versions/v40/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] must be unlocked with ~~`MPI_WIN_UNLOCK_ALL`.~~ ==[[versions/v40/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] .== This routine is not ~~collective — the~~ ==collective—the== `ALL` refers to a lock on all members of the group of the window.

Implementors may restrict the use of RMA communication that is synchronized by lock calls to windows in memory allocated by [[versions/v40/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] ( [[versions/v40/sections/inquiry#Memory Allocation|Memory Allocation]] ), [[versions/v40/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] ( [[versions/v40/sections/one-side#Window That Allocates Memory|Window That Allocates Memory]] ), ==[[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] ( [[versions/v40/sections/one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] ),== or attached with [[versions/v40/API/MPI_WIN_ATTACH|MPI_WIN_ATTACH]] ( [[versions/v40/sections/one-side#Window of Dynamically Attached Memory|Window of Dynamically Attached Memory]] ). Locks can be used portably only in such memory.

==Use of [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] and [[versions/v40/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] .==

The call to [[versions/v40/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] will not return until the put transfer has completed at the origin and at the target. This still leaves much freedom to implementors. The call to [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] may block until an exclusive lock on the window is acquired; or, the first two calls may not block, while [[versions/v40/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] blocks until a lock is ~~acquired — the~~ ==acquired—the== update of the target window is then postponed until the call to [[versions/v40/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] occurs. However, if the call to [[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] is used to lock a local window, then the call must block until the lock is acquired, since the lock may protect local load/store accesses to the window issued after the lock call returns.

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

==Locks are used to protect accesses to the locked target window effected by RMA calls issued between the lock and unlock calls, and to protect load/store accesses to a locked local or shared memory window executed between the lock and unlock calls. Accesses that are protected by an **exclusive lock** (acquired using `MPI_LOCK_EXCLUSIVE`) will not be concurrent at the window site with other accesses to the same window that are lock protected. Accesses that are protected by a **shared lock** (acquired using `MPI_LOCK_SHARED`) will not be concurrent at the window site with accesses protected by an *exclusive lock* to the same window.==

~~Starts~~ ==Opens== an RMA access epoch. The window at the ==MPI== process with ==a== rank ==of== `rank` ==in the group of `win`== can be accessed by RMA operations on `win` during that epoch. Multiple RMA access epochs (with calls to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] ) can occur simultaneously; however, each access epoch must target a different ==MPI== process.

~~Starts~~ ==Opens== an RMA access epoch to all ==MPI== processes in `win`, with a lock type of `MPI_LOCK_SHARED`. During the epoch, the calling ==MPI== process can access the window memory on all ==MPI== processes in `win` by using RMA operations. A window locked with [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] must be unlocked with [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] . This routine is not collective—the `ALL` refers to a lock on all members of the group of the window.

~~Completes~~ ==Closes== an RMA access epoch ~~started~~ ==opened== by a call to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] on window `win`. RMA operations issued during this period will have completed both at the origin and at the target when the call returns.

~~Completes a shared RMA access epoch started by a call to [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] on window `win`. RMA operations issued during this epoch will have completed both at the origin and at the target when the call returns.~~

~~Locks are used to protect accesses to the locked target window effected by RMA calls issued between the lock and unlock calls, and to protect load/store accesses to a locked local or shared memory window executed between the lock and unlock calls. Accesses that are protected by an exclusive lock will not be concurrent at the window site with other accesses to the same window that are lock protected. Accesses that are protected by a shared lock will not be concurrent at the window site with accesses protected by an exclusive lock to the same window.~~

~~It is erroneous to have a window locked and exposed (in an exposure epoch) concurrently. For example, a process may not call [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] to lock a target window if the target process has called [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] and has not yet called [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] ; it is erroneous to call [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] while the local window is locked.~~

==Closes a shared RMA access epoch opened by a call to [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] on window `win`. RMA operations issued during this epoch will have completed both at the origin and at the target when the call returns.==

==It is erroneous to have a window locked and exposed (in an exposure epoch) concurrently. For example, an MPI process may not call [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] to lock a target window if the target process has called [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] and has not yet called [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] ; it is erroneous to call [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] while the local window is locked.==

> The implementation of passive target communication ~~when~~ ==between processes in different *shared== memory ~~is not shared~~ ==domains*== may require an asynchronous software agent. Such an agent can be implemented more easily, and can achieve better performance, if restricted to specially allocated memory. It can be avoided altogether if ~~shared memory~~ ==*shared memory*== is used. It seems natural to impose restrictions that ~~allows one to~~ ==allow the== use ==of== shared memory for ~~third party~~ ==RMA== communication in shared memory machines.

~~    MPI_Win_lock(MPI_LOCK_EXCLUSIVE, rank, assert, win);     MPI_Put(..., rank, ..., win);     MPI_Win_unlock(rank, win);~~

~~The call to [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] will not return until the put transfer has completed at the origin and at the target. This still leaves much freedom to implementors. The call to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] may block until an exclusive lock on the window is acquired; or, the first two calls may not block, while [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] blocks until a lock is acquired—the update of the target window is then postponed until the call to [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] occurs. However, if the call to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] is used to lock a local window, then the call must block until the lock is acquired, since the lock may protect local load/store accesses to the window issued after the lock call returns.~~

==(code block added)==
``` [MPI]C
MPI_Win_lock(MPI_LOCK_EXCLUSIVE, rank, assert, win);
MPI_Put(..., rank, ..., win);
MPI_Win_unlock(rank, win);
```

==The call to [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] will not return until the put transfer has completed at the origin and at the target.==

==> [!warning] Advice to implementors==

==> The semantics described above still leave much freedom to implementors. Return from the call to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] may be delayed until an exclusive lock on the window is acquired; or, the first two calls may return immediately, while return from [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] is delayed until a lock is acquired—the update of the target window is then postponed until the call to [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] occurs. However, if the call to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] is used to lock a window accessible via load/store accesses (i.e., a local window or a window at an MPI process for which a pointer to shared memory can be obtained via [[versions/v41/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] ), then the call must not return before the lock is acquired, since the lock may protect load/store accesses to the window issued after the lock call returns.==

==> [!note] Advice to users==

==> In order to ensure a portable deadlock free program, a user must assume that [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] may delay its return until the desired lock on the window has been acquired.==

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

Locks are used to protect accesses to the locked target window effected by RMA calls issued between the lock and unlock calls, and to protect load/store accesses to a locked local or shared memory window executed between the lock and unlock calls. Accesses that are protected by an **exclusive lock** (acquired using `MPI_LOCK_EXCLUSIVE`) will not be concurrent at the window site with other accesses to the same window that are lock protected. Accesses that are protected by a **shared lock** (acquired using `MPI_LOCK_SHARED`) will not be concurrent at the window site with accesses protected by an ~~*exclusive lock*~~ ==exclusive lock== to the same window.

> An alternative is to require MPI to enforce mutual exclusion between exposure epochs and locking periods. ~~But~~ ==However,== this would entail additional overheads when locks or active target synchronization do not interact in support of those rare interactions between the two mechanisms. The programming style that we encourage here is that a set of windows is used with only one synchronization mechanism at a time, with shifts from one mechanism to another being rare and involving global synchronization.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Lock]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Lock]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Lock]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Lock]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Lock]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Lock]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Lock]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Lock]]

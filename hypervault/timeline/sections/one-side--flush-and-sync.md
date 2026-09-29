---
title: "Flush and Sync"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Flush and Sync

Chapter **one-side** · in [[versions/v30/sections/one-side#Flush and Sync|MPI-3.0]], [[versions/v31/sections/one-side#Flush and Sync|MPI-3.1]], [[versions/v40/sections/one-side#Flush and Sync|MPI-4.0]], [[versions/v41/sections/one-side#Flush and Sync|MPI-4.1]], [[versions/v50/sections/one-side#Flush and Sync|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

~~[[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] completes all~~ ==All== outstanding RMA operations ==on `win`== initiated by the ==MPI process== calling ~~process~~ ==this procedure== to the target ~~rank on~~ ==with `rank` in the group of== the specified ~~window.~~ ==window will have completed when [[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] returns.== The operations are completed both at the origin and at the target.

All RMA operations ~~issued~~ ==initiated== by the ==MPI process== calling ~~process~~ ==this procedure== to any target on the specified window prior to this call ~~and in the specified window~~ will have completed both at the origin and at the target when ~~this call~~ ==[[versions/v41/API/MPI_WIN_FLUSH_ALL|MPI_WIN_FLUSH_ALL]]== returns.

~~Locally completes at the origin all~~ ==All== outstanding RMA operations initiated ==on `win`== by the ==MPI process== calling ~~process~~ ==this procedure== to the target ~~process specified by rank on~~ ==with `rank` in the group of== the specified ~~window.~~ ==window will have completed at the origin when [[versions/v41/API/MPI_WIN_FLUSH_LOCAL|MPI_WIN_FLUSH_LOCAL]] returns.== For example, after this ~~routine completes,~~ ==procedure returns,== the user may reuse any buffers provided to put, get, or accumulate operations.

All RMA operations ~~issued~~ ==initiated by the MPI process calling this procedure== to any target ==on the specified window== prior to this call ~~in this window~~ will have completed at the origin when [[versions/v41/API/MPI_WIN_FLUSH_LOCAL_ALL|MPI_WIN_FLUSH_LOCAL_ALL]] returns.

~~The call [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] synchronizes the private and public window copies of `win`. For the purposes of synchronizing the private and public window, [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] has the effect of ending and reopening an access and exposure epoch on the window (note that it does not actually end an epoch or complete any pending MPI RMA operations).~~

==For windows in the separate memory model, a call to [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] synchronizes the private and public window copies of `win` at the calling MPI process, as described in Section [[versions/v41/sections/one-side#Semantics and Correctness|Semantics and Correctness]] .==

==In the unified memory model, [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] may be used to order load and store accesses to shared memory and to ensure visibility of store updates in shared memory for other threads and MPI processes.==

==A call to [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] does not open or close an epoch and does not complete any pending RMA operations. A call to [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] does not guarantee *progress* of any pending MPI operation.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Flush and Sync]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Flush and Sync]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Flush and Sync]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Flush and Sync]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Flush and Sync]]

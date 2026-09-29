---
title: "Fence"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Fence

Chapter **one-side** · in [[versions/v20/sections/one-side#Fence|MPI-2.0]], [[versions/v21/sections/one-side#Fence|MPI-2.1]], [[versions/v22/sections/one-side#Fence|MPI-2.2]], [[versions/v30/sections/one-side#Fence|MPI-3.0]], [[versions/v31/sections/one-side#Fence|MPI-3.1]], [[versions/v40/sections/one-side#Fence|MPI-4.0]], [[versions/v41/sections/one-side#Fence|MPI-4.1]], [[versions/v50/sections/one-side#Fence|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

A fence call usually entails a barrier synchronization: a process completes a call to [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] only after all other processes in the group entered their matching call. However, a call to [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] that is known not to end any epoch (in particular, a call with ~~`assert = MPI_MODE_NOPRECEDE`)~~ ==`assert` equal to `MPI_MODE_NOPRECEDE`)== does not necessarily act as a barrier.

> Calls to [[versions/v30/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] should both precede and follow calls to ~~put, get or accumulate~~ ==RMA communication functions== that are synchronized with fence calls.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

The MPI call [[versions/v40/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] synchronizes RMA calls on `win`. The call is collective on the group of `win`. All RMA operations on `win` originating at a given process and started before the fence call will complete at that process before the fence call returns. They will be completed at their target before the fence call returns at the target. RMA operations on `win` started by a process after the fence call returns will access their target window only after ~~`MPI_WIN_FENCE`~~ ==[[versions/v40/API/MPI_WIN_FENCE|MPI_WIN_FENCE]]== has been called by the target process.

The `assert` argument is used to provide assertions on the context of the call that may be used for various optimizations. This is described in Section [[versions/v40/sections/one-side#Assertions|Assertions]] . A value of ~~`assert =~~ ==`assert``=== 0` is always valid.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~The MPI call~~ [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] synchronizes RMA ~~calls~~ ==communication operations== on `win`. The ~~call~~ ==procedure== is collective ~~on~~ ==over== the group of `win`. All RMA operations on `win` originating at a given ==origin== process and started before the fence call will complete at that ==MPI== process before the fence call returns. They will be completed at their target before the fence call returns at the target. ==Store accesses to shared-memory of `win` will become visible before the fence call returns at the target.== RMA operations on `win` started by ~~a~~ ==an origin== process after the fence call returns will access their target window only after [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] has been called by the target process.

The call ~~completes~~ ==closes== an RMA access epoch if it was preceded by another fence call and the local ==MPI== process ~~issued~~ ==initiated any== RMA communication ~~calls~~ ==operations== on `win` between these two calls. The call ~~completes~~ ==closes== an RMA exposure epoch if it was preceded by another fence call and the local window was the target of RMA accesses between these two calls. The call ~~starts~~ ==opens== an RMA access epoch if it is followed by another fence call and by RMA communication calls issued between these two fence calls. The call ~~starts~~ ==opens== an exposure epoch if it is followed by another fence call and the local window is the target of RMA accesses between these two fence calls. Thus, the fence call is equivalent to calls to a subset of ~~`post, start, complete, wait`.~~ ==`post`, `start`, `complete`, `wait`.==

A ~~fence call usually entails a barrier synchronization: a process completes a~~ call to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] ~~only after all other processes in the group entered their matching call.~~ ==is usually synchronizing.== However, a call to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] that is known not to ~~end~~ ==close== any epoch (in particular, a call with ==the `MPI_MODE_NOPRECEDE`== `assert` ~~equal to `MPI_MODE_NOPRECEDE`) does~~ ==set) is== not necessarily ~~act as a barrier.~~ ==synchronizing.==

> Calls to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] should both precede and follow calls to RMA communication ~~functions~~ ==procedures== that are synchronized with fence calls.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Fence]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Fence]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Fence]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Fence]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Fence]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Fence]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Fence]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Fence]]

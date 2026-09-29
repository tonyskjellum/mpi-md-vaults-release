---
title: "Window Destruction"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Window Destruction

Chapter **one-side** · in [[versions/v30/sections/one-side#Window Destruction|MPI-3.0]], [[versions/v31/sections/one-side#Window Destruction|MPI-3.1]], [[versions/v40/sections/one-side#Window Destruction|MPI-4.0]], [[versions/v41/sections/one-side#Window Destruction|MPI-4.1]], [[versions/v50/sections/one-side#Window Destruction|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

Frees the window object `win` and returns a null handle (equal to `MPI_WIN_NULL`). This is a collective call executed by all processes in the group associated with `win`. [[versions/v40/API/MPI_WIN_FREE|MPI_WIN_FREE]] can be invoked by a process only after it has completed its involvement in RMA communications on window `win`: e.g., the process has called [[versions/v40/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , or called [[versions/v40/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] to match a previous call to [[versions/v40/API/MPI_WIN_POST|MPI_WIN_POST]] or called [[versions/v40/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] to match a previous call to ~~`MPI_WIN_START`~~ ==[[versions/v40/API/MPI_WIN_START|MPI_WIN_START]]== or called ~~`MPI_WIN_UNLOCK`~~ ==[[versions/v40/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]]== to match a previous call to ~~`MPI_WIN_LOCK`.~~ ==[[versions/v40/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] .== The memory associated with windows created by a call to [[versions/v40/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] may be freed after the call returns. If the window was created with [[versions/v40/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , [[versions/v40/API/MPI_WIN_FREE|MPI_WIN_FREE]] will free the window memory that was allocated in [[versions/v40/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] . If the window was created with [[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] , [[versions/v40/API/MPI_WIN_FREE|MPI_WIN_FREE]] will free the window memory that was allocated in [[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] .

> [[versions/v40/API/MPI_WIN_FREE|MPI_WIN_FREE]] requires a barrier synchronization: no process can return from free until all processes in the group of `win` call free. This ensures that no process will attempt to access a remote window (e.g., with lock/unlock) after it was freed. The only exception to this rule is when the user sets the `no_locks` info key to ~~true~~ ==`true`== when creating the window. In that case, an MPI implementation may free the local window without barrier synchronization.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

Frees the window object `win` and returns a null handle (equal to `MPI_WIN_NULL`). This ==procedure== is ~~a~~ collective ~~call executed by all processes in~~ ==over== the group associated with `win`. [[versions/v41/API/MPI_WIN_FREE|MPI_WIN_FREE]] can be invoked by ~~a~~ ==an MPI== process only after it has completed its involvement in RMA communications on window `win`: e.g., the ==MPI== process has called [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , or called [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] to match a previous call to [[versions/v41/API/MPI_WIN_POST|MPI_WIN_POST]] ~~or~~ ==,== called [[versions/v41/API/MPI_WIN_COMPLETE|MPI_WIN_COMPLETE]] to match a previous call to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] ==,== or called [[versions/v41/API/MPI_WIN_UNLOCK|MPI_WIN_UNLOCK]] to match a previous call to [[versions/v41/API/MPI_WIN_LOCK|MPI_WIN_LOCK]] . The memory associated with windows created by a call to [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] may be freed after the call returns. If the window was created with [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , [[versions/v41/API/MPI_WIN_FREE|MPI_WIN_FREE]] will free the window memory that was allocated in [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] . If the window was created with [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] , [[versions/v41/API/MPI_WIN_FREE|MPI_WIN_FREE]] will free the window memory that was allocated in [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] .

~~> [!warning] Advice to implementors~~

~~> [[versions/v41/API/MPI_WIN_FREE|MPI_WIN_FREE]] requires a barrier synchronization: no process can return from free until all processes in the group of `win` call free. This ensures that no process will attempt to access a remote window (e.g., with lock/unlock) after it was freed. The only exception to this rule is when the user sets the `no_locks` info key to `true` when creating the window. In that case, an MPI implementation may free the local window without barrier synchronization.~~

==[[versions/v41/API/MPI_WIN_FREE|MPI_WIN_FREE]] is required to delay its return until all accesses to the local window using passive target synchronization have completed. Therefore, it is synchronizing unless the window was created with the `no_locks` info key set to `true`.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Window Destruction]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Window Destruction]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Window Destruction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Window Destruction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Window Destruction]]

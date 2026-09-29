---
title: "Error Classes"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Error Classes

Chapter **one-side** · in [[versions/v20/sections/one-side#Error Classes|MPI-2.0]], [[versions/v21/sections/one-side#Error Classes|MPI-2.1]], [[versions/v22/sections/one-side#Error Classes|MPI-2.2]], [[versions/v30/sections/one-side#Error Classes|MPI-3.0]], [[versions/v31/sections/one-side#Error Classes|MPI-3.1]], [[versions/v40/sections/one-side#Error Classes|MPI-4.0]], [[versions/v41/sections/one-side#Error Classes|MPI-4.1]], [[versions/v50/sections/one-side#Error Classes|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

The following ~~new~~ error classes ==for one-sided communication== are defined

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

The ~~following~~ error classes for one-sided communication are defined ==in Table [[versions/v30/sections/one-side#Error Classes|Error Classes]] . RMA routines may (and almost certainly will) use other MPI error classes, such as `MPI_ERR_OP` or `MPI_ERR_RANK`.==

l ~~l~~ ==p3.5in== `MPI_ERR_WIN` & invalid `win` argument\ `MPI_ERR_BASE` & invalid `base` argument\ `MPI_ERR_SIZE` & invalid `size` argument\ `MPI_ERR_DISP` & invalid `disp` argument\ `MPI_ERR_LOCKTYPE` & invalid `locktype` argument\ `MPI_ERR_ASSERT` & invalid `assert` argument `MPI_ERR_RMA_CONFLICT` & conflicting accesses to window\ `MPI_ERR_RMA_SYNC` & ~~wrong~~ ==invalid== synchronization of RMA ~~calls~~ ==calls\ `MPI_ERR_RMA_RANGE` & target memory is not part of the window (in the case of a window created with [[versions/v30/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , target memory is not attached)\ `MPI_ERR_RMA_ATTACH` & memory cannot be attached (e.g., because of resource exhaustion)\ `MPI_ERR_RMA_SHARED` & memory cannot be shared (e.g., some process in the group of the specified communicator cannot expose shared memory)\ `MPI_ERR_RMA_FLAVOR` & passed window has the wrong flavor for the called function==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~l p3.5in `MPI_ERR_WIN` & invalid `win` argument\ `MPI_ERR_BASE` & invalid `base` argument\ `MPI_ERR_SIZE` & invalid `size` argument\ `MPI_ERR_DISP` & invalid `disp` argument\ `MPI_ERR_LOCKTYPE` & invalid `locktype` argument\ `MPI_ERR_ASSERT` & invalid `assert` argument  `MPI_ERR_RMA_CONFLICT` & conflicting accesses to window\ `MPI_ERR_RMA_SYNC` & invalid synchronization of RMA calls\ `MPI_ERR_RMA_RANGE` & target memory is not part of the window (in the case of a window created with [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , target memory is not attached)\ `MPI_ERR_RMA_ATTACH` & memory cannot be attached (e.g., because of resource exhaustion)\ `MPI_ERR_RMA_SHARED` & memory cannot be shared (e.g., some process in the group of the specified communicator cannot expose shared memory)\ `MPI_ERR_RMA_FLAVOR` & passed window has the wrong flavor for the called function~~

==|  |  | |:---|:---| | `MPI_ERR_WIN` | invalid `win` argument | | `MPI_ERR_BASE` | invalid `base` argument | | `MPI_ERR_SIZE` | invalid `size` argument | | `MPI_ERR_DISP` | invalid `disp` argument | | `MPI_ERR_LOCKTYPE` | invalid `locktype` argument | | `MPI_ERR_ASSERT` | invalid `assert` argument | | `MPI_ERR_RMA_CONFLICT` | conflicting accesses to window | | `MPI_ERR_RMA_SYNC` | invalid synchronization of RMA calls | | `MPI_ERR_RMA_RANGE` | target memory is not part of the window (in the case of a window created with [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , target memory is not attached) | | `MPI_ERR_RMA_ATTACH` | memory cannot be attached (e.g., because of resource exhaustion) | | `MPI_ERR_RMA_SHARED` | memory cannot be shared (e.g., some MPI process in the group of the specified communicator cannot expose *shared memory*) | | `MPI_ERR_RMA_FLAVOR` | passed window has the wrong flavor for the called function |==

==Error classes in one-sided communication routines==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Error Classes]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Error Classes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Error Classes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Error Classes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Error Classes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Error Classes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Error Classes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Error Classes]]

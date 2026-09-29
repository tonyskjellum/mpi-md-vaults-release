---
title: "Initialization"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Initialization

Chapter **one-side** · in [[versions/v20/sections/one-side#Initialization|MPI-2.0]], [[versions/v21/sections/one-side#Initialization|MPI-2.1]], [[versions/v22/sections/one-side#Initialization|MPI-2.2]], [[versions/v30/sections/one-side#Initialization|MPI-3.0]], [[versions/v31/sections/one-side#Initialization|MPI-3.1]], [[versions/v40/sections/one-side#Initialization|MPI-4.0]], [[versions/v41/sections/one-side#Initialization|MPI-4.1]], [[versions/v50/sections/one-side#Initialization|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

==MPI provides the following window initialization functions: [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , [[versions/v30/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , [[versions/v30/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] , and [[versions/v30/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , which are collective on an intracommunicator. [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] allows each process to specify a “window” in its memory that is made accessible to accesses by remote processes. The call returns an opaque object that represents the group of processes that own and access the set of windows, and the attributes of each window, as specified by the initialization call. [[versions/v30/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] differs from [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] in that the user does not pass allocated memory; [[versions/v30/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] returns a pointer to memory allocated by the MPI implementation. [[versions/v30/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] differs from [[versions/v30/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] in that the allocated memory can be accessed from all processes in the window’s group with direct load/store instructions. Some restrictions may apply to the specified communicator. [[versions/v30/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] creates a window that allows the user to dynamically control which memory is exposed by the window.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

MPI provides the following window initialization functions: [[versions/v40/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , [[versions/v40/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , [[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] , and [[versions/v40/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , which are collective on an ~~intracommunicator.~~ ==intra-communicator.== [[versions/v40/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] allows each process to specify a “window” in its memory that is made accessible to accesses by remote processes. The call returns an opaque object that represents the group of processes that own and access the set of windows, and the attributes of each window, as specified by the initialization call. [[versions/v40/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] differs from [[versions/v40/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] in that the user does not pass allocated memory; [[versions/v40/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] returns a pointer to memory allocated by the MPI implementation. [[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] differs from [[versions/v40/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] in that the allocated memory can be accessed from all processes in the window’s group with direct load/store instructions. Some restrictions may apply to the specified communicator. [[versions/v40/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] creates a window that allows the user to dynamically control which memory is exposed by the window.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

MPI provides the following window initialization functions: [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] , and [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , which are collective ~~on~~ ==over the group of== an ~~intra-communicator.~~ ==intra-/communicator.== [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] allows each ==MPI== process to specify a “window” in its memory that is made ~~accessible to~~ ==available for== accesses by ~~remote~~ ==other MPI== processes. The call returns an opaque object that represents the group of ==MPI== processes that own and access the set of windows, and the attributes of each window, as specified by the initialization call. [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] ~~differs~~ ==and [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] differ== from [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] in that the user does not pass allocated memory; ==instead== [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] ~~returns~~ ==and [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] return== a pointer to memory allocated by the MPI implementation. [[versions/v41/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] differs from [[versions/v41/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] in that the allocated memory ~~can~~ ==is guaranteed to== be ~~accessed~~ ==accessible== from all ==MPI== processes in the window’s group with direct load/store ~~instructions.~~ ==accesses.== Some restrictions may apply to the specified communicator. [[versions/v41/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] creates a window that allows the user to dynamically control which memory is exposed by the window.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Initialization]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Initialization]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Initialization]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Initialization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Initialization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Initialization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Initialization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Initialization]]

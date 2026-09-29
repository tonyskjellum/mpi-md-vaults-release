---
title: "File Size"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# File Size

Chapter **io** · in [[versions/v20/sections/io#File Size|MPI-2.0]], [[versions/v21/sections/io#File Size|MPI-2.1]], [[versions/v22/sections/io#File Size|MPI-2.2]], [[versions/v30/sections/io#File Size|MPI-3.0]], [[versions/v31/sections/io#File Size|MPI-3.1]], [[versions/v40/sections/io#File Size|MPI-4.0]], [[versions/v41/sections/io#File Size|MPI-4.1]], [[versions/v50/sections/io#File Size|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

> Consider the following example. Given two operations made by separate processes to a file containing 100 bytes: an `MPI_FILE_READ` of 10 bytes and an `MPI_FILE_SET_SIZE` to 0 bytes. If the user does not enforce sequential consistency between these two operations, the file pointer may be updated by the amount ~~> >~~ requested (10 bytes) even if the amount accessed is zero bytes.

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

The size of a file may be increased by writing to the file after the current end of file. The size may also be changed by calling MPI *size changing* routines, such as ~~`MPI_FILE_SET_SIZE`.~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] .== A call to a size changing routine does not necessarily change the file size. For example, calling ~~`MPI_FILE_PREALLOCATE`~~ ==[[versions/v31/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]]== with a size less than the current size does not change the size.

Consider a set of bytes that has been written to a file since the most recent call to a size changing routine, or since ~~`MPI_FILE_OPEN`~~ ==[[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]]== if no such routine has been called. Let the *high byte* be the byte in that set with the largest displacement. The file size is the larger of

~~- The size immediately after the size changing routine, or `MPI_FILE_OPEN`, returned.~~

~~When applying consistency semantics,~~

~~calls to `MPI_FILE_SET_SIZE` and `MPI_FILE_PREALLOCATE` are considered writes to the file (which conflict with operations that access bytes at displacements between the old and new file sizes), and `MPI_FILE_GET_SIZE` is considered a read of the file (which overlaps with all accesses to the file).~~

==- The size immediately after the size changing routine, or [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , returned.==

==When applying consistency semantics, calls to [[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] and [[versions/v31/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] are considered writes to the file (which conflict with operations that access bytes at displacements between the old and new file sizes), and [[versions/v31/API/MPI_FILE_GET_SIZE|MPI_FILE_GET_SIZE]] is considered a read of the file (which overlaps with all accesses to the file).==

> Any sequence of operations containing the collective routines ~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== and ~~`MPI_FILE_PREALLOCATE`~~ ==[[versions/v31/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]]== is a write sequence. As such, sequential consistency in nonatomic mode is not guaranteed unless the conditions in ~~Section~~ [[versions/v31/sections/io#File Consistency|File Consistency]] ~~, page [[versions/v31/sections/io#File Consistency|File Consistency]] ,~~ are satisfied.

> Consider the following example. Given two operations made by separate processes to a file containing 100 bytes: an ~~`MPI_FILE_READ`~~ ==[[versions/v31/API/MPI_FILE_READ|MPI_FILE_READ]]== of 10 bytes and an ~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== to 0 bytes. If the user does not enforce sequential consistency between these two operations, the file pointer may be updated by the amount requested (10 bytes) even if the amount accessed is zero bytes.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#File Size]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#File Size]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#File Size]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#File Size]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#File Size]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#File Size]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#File Size]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#File Size]]

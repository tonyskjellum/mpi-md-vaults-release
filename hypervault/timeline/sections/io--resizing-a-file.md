---
title: "Resizing a File"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Resizing a File

Chapter **io** · in [[versions/v20/sections/io#Resizing a File|MPI-2.0]], [[versions/v21/sections/io#Resizing a File|MPI-2.1]], [[versions/v22/sections/io#Resizing a File|MPI-2.2]], [[versions/v30/sections/io#Resizing a File|MPI-3.0]], [[versions/v31/sections/io#Resizing a File|MPI-3.1]], [[versions/v40/sections/io#Resizing a File|MPI-4.0]], [[versions/v41/sections/io#Resizing a File|MPI-4.1]], [[versions/v50/sections/io#Resizing a File|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

`MPI_FILE_SET_SIZE` does not affect the individual file pointers or the shared file pointer. If ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== mode was specified when the file was opened, it is erroneous to call this routine.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~`MPI_FILE_SET_SIZE` resizes the file associated with the file handle `fh`.~~

~~`size` is measured in bytes from the beginning of the file.~~

~~`MPI_FILE_SET_SIZE` is collective; all processes in the group must pass identical values for `size`.~~

==`MPI_FILE_SET_SIZE` resizes the file associated with the file handle `fh`. `size` is measured in bytes from the beginning of the file. `MPI_FILE_SET_SIZE` is collective; all processes in the group must pass identical values for `size`.==

~~If `size` is larger than the current file size, the file size becomes `size`. Regions of the file that have been previously written are unaffected.~~

~~The values of data in the new regions in the file (those locations with displacements between old file size and `size`) are undefined.~~

~~It is implementation dependent whether the `MPI_FILE_SET_SIZE` routine allocates file space—use `MPI_FILE_PREALLOCATE` to force file space to be reserved.~~

==If `size` is larger than the current file size, the file size becomes `size`. Regions of the file that have been previously written are unaffected. The values of data in the new regions in the file (those locations with displacements between old file size and `size`) are undefined. It is implementation dependent whether the `MPI_FILE_SET_SIZE` routine allocates file space — use `MPI_FILE_PREALLOCATE` to force file space to be reserved.==

~~> It is possible for the file pointers to point beyond the end of file after a `MPI_FILE_SET_SIZE` operation truncates a file. This is legal, and equivalent to seeking beyond the current end of file.~~

~~All nonblocking requests and split collective operations on `fh` must be completed before calling `MPI_FILE_SET_SIZE`. Otherwise, calling `MPI_FILE_SET_SIZE` is erroneous.~~

~~As far as consistency semantics are concerned, `MPI_FILE_SET_SIZE` is a write operation that conflicts with operations that access bytes at displacements between the old and new file sizes (see Section [[versions/v30/sections/io#File Consistency|File Consistency]] , page [[versions/v30/sections/io#File Consistency|File Consistency]] ).~~

==> It is possible for the file pointers to point beyond the end of file after a `MPI_FILE_SET_SIZE` operation truncates a file. This is valid, and equivalent to seeking beyond the current end of file.==

==All nonblocking requests and split collective operations on `fh` must be completed before calling `MPI_FILE_SET_SIZE`. Otherwise, calling `MPI_FILE_SET_SIZE` is erroneous. As far as consistency semantics are concerned, `MPI_FILE_SET_SIZE` is a write operation that conflicts with operations that access bytes at displacements between the old and new file sizes (see Section [[versions/v30/sections/io#File Consistency|File Consistency]] , page [[versions/v30/sections/io#File Consistency|File Consistency]] ).==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== resizes the file associated with the file handle `fh`. `size` is measured in bytes from the beginning of the file. ~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== is collective; all processes in the group must pass identical values for `size`.

If `size` is larger than the current file size, the file size becomes `size`. Regions of the file that have been previously written are unaffected. The values of data in the new regions in the file (those locations with displacements between old file size and `size`) are undefined. It is implementation dependent whether the ~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== routine allocates file space — use ~~`MPI_FILE_PREALLOCATE`~~ ==[[versions/v31/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]]== to force file space to be reserved.

~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== does not affect the individual file pointers or the shared file pointer. If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, it is erroneous to call this routine.

> It is possible for the file pointers to point beyond the end of file after a ~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== operation truncates a file. This is valid, and equivalent to seeking beyond the current end of file.

All nonblocking requests and split collective operations on `fh` must be completed before calling ~~`MPI_FILE_SET_SIZE`.~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] .== Otherwise, calling ~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== is erroneous. As far as consistency semantics are concerned, ~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== is a write operation that conflicts with operations that access bytes at displacements between the old and new file sizes (see ~~Section [[versions/v31/sections/io#File Consistency|File Consistency]] , page~~ [[versions/v31/sections/io#File Consistency|File Consistency]] ).

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

If `size` is larger than the current file size, the file size becomes `size`. Regions of the file that have been previously written are unaffected. The values of data in the new regions in the file (those locations with displacements between old file size and `size`) are undefined. It is implementation dependent whether the [[versions/v40/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] routine allocates file ~~space — use~~ ==space—use== [[versions/v40/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] to force file space to be reserved.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

[[versions/v50/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] resizes the file associated with the file handle `fh`. `size` is measured in bytes from the beginning of the file. [[versions/v50/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] is ~~collective;~~ ==collective over the group associated with the file;== all processes in the group must pass identical values for `size`.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Resizing a File]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Resizing a File]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Resizing a File]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Resizing a File]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Resizing a File]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Resizing a File]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Resizing a File]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Resizing a File]]

---
title: "Preallocating Space for a File"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Preallocating Space for a File

Chapter **io** · in [[versions/v20/sections/io#Preallocating Space for a File|MPI-2.0]], [[versions/v21/sections/io#Preallocating Space for a File|MPI-2.1]], [[versions/v22/sections/io#Preallocating Space for a File|MPI-2.2]], [[versions/v30/sections/io#Preallocating Space for a File|MPI-3.0]], [[versions/v31/sections/io#Preallocating Space for a File|MPI-3.1]], [[versions/v40/sections/io#Preallocating Space for a File|MPI-4.0]], [[versions/v41/sections/io#Preallocating Space for a File|MPI-4.1]], [[versions/v50/sections/io#Preallocating Space for a File|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The treatment of file pointers, pending nonblocking accesses, and file consistency is the same as with `MPI_FILE_SET_SIZE`. If ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== mode was specified when the file was opened, it is erroneous to call this routine.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~`MPI_FILE_PREALLOCATE` ensures that storage space is allocated for the first `size` bytes of the file associated with `fh`. `MPI_FILE_PREALLOCATE` is collective; all processes in the group must pass identical values for `size`.~~

~~Regions of the file that have previously been written are unaffected. For newly allocated regions of the file, `MPI_FILE_PREALLOCATE` has the same effect as writing undefined data.~~

~~If `size` is larger than the current file size, the file size increases to `size`.~~

~~If `size` is less than or equal to the current file size, the file size is unchanged.~~

==`MPI_FILE_PREALLOCATE` ensures that storage space is allocated for the first `size` bytes of the file associated with `fh`. `MPI_FILE_PREALLOCATE` is collective; all processes in the group must pass identical values for `size`. Regions of the file that have previously been written are unaffected. For newly allocated regions of the file, `MPI_FILE_PREALLOCATE` has the same effect as writing undefined data.==

==If `size` is larger than the current file size, the file size increases to `size`. If `size` is less than or equal to the current file size, the file size is unchanged.==

> In some implementations, ~~> >~~ file preallocation may be expensive.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~`MPI_FILE_PREALLOCATE` ensures that storage space is allocated for the first `size` bytes of the file associated with `fh`. `MPI_FILE_PREALLOCATE` is collective; all processes in the group must pass identical values for `size`. Regions of the file that have previously been written are unaffected. For newly allocated regions of the file, `MPI_FILE_PREALLOCATE` has the same effect as writing undefined data.~~

~~If `size` is larger than the current file size, the file size increases to `size`. If `size` is less than or equal to the current file size, the file size is unchanged.~~

~~The treatment of file pointers, pending nonblocking accesses, and file consistency is the same as with `MPI_FILE_SET_SIZE`. If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, it is erroneous to call this routine.~~

==[[versions/v31/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] ensures that storage space is allocated for the first `size` bytes of the file associated with `fh`. [[versions/v31/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] is collective; all processes in the group must pass identical values for `size`. Regions of the file that have previously been written are unaffected. For newly allocated regions of the file, [[versions/v31/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] has the same effect as writing undefined data. If `size` is larger than the current file size, the file size increases to `size`. If `size` is less than or equal to the current file size, the file size is unchanged.==

==The treatment of file pointers, pending nonblocking accesses, and file consistency is the same as with [[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] . If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, it is erroneous to call this routine.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> In some implementations, file preallocation may be ~~expensive.~~ ==time-consuming.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The treatment of file pointers, ~~pending~~ nonblocking accesses, and file consistency is the same as with [[versions/v41/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] . If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, it is erroneous to call this routine.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

[[versions/v50/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] ensures that storage space is allocated for the first `size` bytes of the file associated with `fh`. [[versions/v50/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] is ~~collective;~~ ==collective over the group associated with the file;== all processes in the group must pass identical values for `size`. Regions of the file that have previously been written are unaffected. For newly allocated regions of the file, [[versions/v50/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] has the same effect as writing undefined data. If `size` is larger than the current file size, the file size increases to `size`. If `size` is less than or equal to the current file size, the file size is unchanged.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Preallocating Space for a File]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Preallocating Space for a File]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Preallocating Space for a File]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Preallocating Space for a File]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Preallocating Space for a File]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Preallocating Space for a File]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Preallocating Space for a File]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Preallocating Space for a File]]

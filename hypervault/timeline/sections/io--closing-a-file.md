---
title: "Closing a File"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Closing a File

Chapter **io** · in [[versions/v20/sections/io#Closing a File|MPI-2.0]], [[versions/v21/sections/io#Closing a File|MPI-2.1]], [[versions/v22/sections/io#Closing a File|MPI-2.2]], [[versions/v30/sections/io#Closing a File|MPI-3.0]], [[versions/v31/sections/io#Closing a File|MPI-3.1]], [[versions/v40/sections/io#Closing a File|MPI-4.0]], [[versions/v41/sections/io#Closing a File|MPI-4.1]], [[versions/v50/sections/io#Closing a File|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

`MPI_FILE_CLOSE` first synchronizes file state (equivalent to performing an `MPI_FILE_SYNC`), then closes the file associated with `fh`. The file is deleted if it was opened with access mode ~~MPI_MODE_DELETE_ON_CLOSE~~ ==`MPI_MODE_DELETE_ON_CLOSE`== (equivalent to performing an `MPI_FILE_DELETE`). `MPI_FILE_CLOSE` is a collective routine.

The `MPI_FILE_CLOSE` routine deallocates the file handle object and sets `fh` to ~~MPI_FILE_NULL.~~ ==`MPI_FILE_NULL`.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The user is responsible for ensuring that all outstanding~~

~~nonblocking requests and split collective operations associated with `fh`~~

==The user is responsible for ensuring that all outstanding nonblocking requests and split collective operations associated with `fh`==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~`MPI_FILE_CLOSE`~~ ==[[versions/v31/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]]== first synchronizes file state (equivalent to performing an ~~`MPI_FILE_SYNC`),~~ ==[[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] ),== then closes the file associated with `fh`. The file is deleted if it was opened with access mode `MPI_MODE_DELETE_ON_CLOSE` (equivalent to performing an ~~`MPI_FILE_DELETE`). `MPI_FILE_CLOSE`~~ ==[[versions/v31/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] ). [[versions/v31/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]]== is a collective routine.

~~The user is responsible for ensuring that all outstanding nonblocking requests and split collective operations associated with `fh`~~

~~made by a process have completed before that process calls `MPI_FILE_CLOSE`.~~

~~The `MPI_FILE_CLOSE` routine deallocates the file handle object and sets `fh` to `MPI_FILE_NULL`.~~

==The user is responsible for ensuring that all outstanding nonblocking requests and split collective operations associated with `fh` made by a process have completed before that process calls [[versions/v31/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] .==

==The [[versions/v31/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] routine deallocates the file handle object and sets `fh` to `MPI_FILE_NULL`.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

[[versions/v50/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] first synchronizes file state (equivalent to performing an [[versions/v50/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] ), then closes the file associated with `fh`. The file is deleted if it was opened with access mode `MPI_MODE_DELETE_ON_CLOSE` (equivalent to performing an [[versions/v50/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] ). [[versions/v50/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] is a collective ~~routine.~~ ==routine over the group associated with the file.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Closing a File]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Closing a File]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Closing a File]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Closing a File]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Closing a File]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Closing a File]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Closing a File]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Closing a File]]

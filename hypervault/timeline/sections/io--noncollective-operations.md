---
title: "Noncollective Operations"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Noncollective Operations

Chapter **io** · in [[versions/v20/sections/io#Noncollective Operations|MPI-2.0]], [[versions/v21/sections/io#Noncollective Operations|MPI-2.1]], [[versions/v22/sections/io#Noncollective Operations|MPI-2.2]], [[versions/v30/sections/io#Noncollective Operations|MPI-3.0]], [[versions/v31/sections/io#Noncollective Operations|MPI-3.1]], [[versions/v40/sections/io#Noncollective Operations|MPI-4.0]], [[versions/v41/sections/io#Noncollective Operations|MPI-4.1]], [[versions/v50/sections/io#Noncollective Operations|MPI-5.0]]

## Changes along the time axis

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~`MPI_FILE_READ_SHARED`~~ ==[[versions/v31/API/MPI_FILE_READ_SHARED|MPI_FILE_READ_SHARED]]== reads a file using the shared file pointer.

~~`MPI_FILE_WRITE_SHARED`~~ ==[[versions/v31/API/MPI_FILE_WRITE_SHARED|MPI_FILE_WRITE_SHARED]]== writes a file using the shared file pointer.

~~`MPI_FILE_IREAD_SHARED`~~ ==[[versions/v31/API/MPI_FILE_IREAD_SHARED|MPI_FILE_IREAD_SHARED]]== is a nonblocking version of the ~~`MPI_FILE_READ_SHARED`~~ ==[[versions/v31/API/MPI_FILE_READ_SHARED|MPI_FILE_READ_SHARED]]== interface.

~~`MPI_FILE_IWRITE_SHARED`~~ ==[[versions/v31/API/MPI_FILE_IWRITE_SHARED|MPI_FILE_IWRITE_SHARED]]== is a nonblocking version of the ~~`MPI_FILE_WRITE_SHARED`~~ ==[[versions/v31/API/MPI_FILE_WRITE_SHARED|MPI_FILE_WRITE_SHARED]]== interface.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

[[versions/v40/API/MPI_FILE_IREAD_SHARED|MPI_FILE_IREAD_SHARED]] is a nonblocking version of ~~the~~ [[versions/v40/API/MPI_FILE_READ_SHARED|MPI_FILE_READ_SHARED]] ~~interface.~~ ==.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Noncollective Operations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Noncollective Operations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Noncollective Operations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Noncollective Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Noncollective Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Noncollective Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Noncollective Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Noncollective Operations]]

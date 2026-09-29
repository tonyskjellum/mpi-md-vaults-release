---
title: "Querying the Size of a File"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Querying the Size of a File

Chapter **io** · in [[versions/v20/sections/io#Querying the Size of a File|MPI-2.0]], [[versions/v21/sections/io#Querying the Size of a File|MPI-2.1]], [[versions/v22/sections/io#Querying the Size of a File|MPI-2.2]], [[versions/v30/sections/io#Querying the Size of a File|MPI-3.0]], [[versions/v31/sections/io#Querying the Size of a File|MPI-3.1]], [[versions/v40/sections/io#Querying the Size of a File|MPI-4.0]], [[versions/v41/sections/io#Querying the Size of a File|MPI-4.1]], [[versions/v50/sections/io#Querying the Size of a File|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~`MPI_FILE_GET_SIZE` returns, in `size`, the current size in bytes of the file associated with the file handle `fh`.~~

~~As far as consistency semantics are concerned, `MPI_FILE_GET_SIZE` is a data access operation (see Section [[versions/v30/sections/io#File Consistency|File Consistency]] , page [[versions/v30/sections/io#File Consistency|File Consistency]] ).~~

==`MPI_FILE_GET_SIZE` returns, in `size`, the current size in bytes of the file associated with the file handle `fh`. As far as consistency semantics are concerned, `MPI_FILE_GET_SIZE` is a data access operation (see Section [[versions/v30/sections/io#File Consistency|File Consistency]] , page [[versions/v30/sections/io#File Consistency|File Consistency]] ).==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~`MPI_FILE_GET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_GET_SIZE|MPI_FILE_GET_SIZE]]== returns, in `size`, the current size in bytes of the file associated with the file handle `fh`. As far as consistency semantics are concerned, ~~`MPI_FILE_GET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_GET_SIZE|MPI_FILE_GET_SIZE]]== is a data access operation (see ~~Section [[versions/v31/sections/io#File Consistency|File Consistency]] , page~~ [[versions/v31/sections/io#File Consistency|File Consistency]] ).

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Querying the Size of a File]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Querying the Size of a File]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Querying the Size of a File]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Querying the Size of a File]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Querying the Size of a File]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Querying the Size of a File]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Querying the Size of a File]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Querying the Size of a File]]

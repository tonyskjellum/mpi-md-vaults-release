---
title: "Data Access with Shared File Pointers"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Data Access with Shared File Pointers

Chapter **io** · in [[versions/v20/sections/io#Data Access with Shared File Pointers|MPI-2.0]], [[versions/v21/sections/io#Data Access with Shared File Pointers|MPI-2.1]], [[versions/v22/sections/io#Data Access with Shared File Pointers|MPI-2.2]], [[versions/v30/sections/io#Data Access with Shared File Pointers|MPI-3.0]], [[versions/v31/sections/io#Data Access with Shared File Pointers|MPI-3.1]], [[versions/v40/sections/io#Data Access with Shared File Pointers|MPI-4.0]], [[versions/v41/sections/io#Data Access with Shared File Pointers|MPI-4.1]], [[versions/v50/sections/io#Data Access with Shared File Pointers|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~MPI maintains exactly one shared file pointer per collective `MPI_FILE_OPEN` (shared among processes in the communicator group).~~

~~The current value of this pointer implicitly specifies the offset in the data access routines described in this section.~~

==MPI maintains exactly one shared file pointer per collective `MPI_FILE_OPEN` (shared among processes in the communicator group). The current value of this pointer implicitly specifies the offset in the data access routines described in this section.==

~~After a shared file pointer operation is initiated, the shared file pointer is updated to point to the next etype after the last one~~

~~that will be accessed.~~

~~The file pointer is updated relative to the current view of the file.~~

==After a shared file pointer operation is initiated, the shared file pointer is updated to point to the next etype after the last one that will be accessed. The file pointer is updated relative to the current view of the file.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~MPI maintains exactly one shared file pointer per collective `MPI_FILE_OPEN` (shared among processes in the communicator group). The current value of this pointer implicitly specifies the offset in the data access routines described in this section.~~

~~These routines only use and update the shared file pointer maintained by MPI. The individual file pointers are not used nor updated.~~

~~The shared file pointer routines have the same semantics as the data access with explicit offset routines described in Section [[versions/v31/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] , page [[versions/v31/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] , with the following modifications:~~

==MPI maintains exactly one shared file pointer per collective [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] (shared among processes in the communicator group). The current value of this pointer implicitly specifies the offset in the data access routines described in this section. These routines only use and update the shared file pointer maintained by MPI. The individual file pointers are not used nor updated.==

==The shared file pointer routines have the same semantics as the data access with explicit offset routines described in [[versions/v31/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] , with the following modifications:==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Data Access with Shared File Pointers]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Data Access with Shared File Pointers]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Data Access with Shared File Pointers]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Data Access with Shared File Pointers]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Data Access with Shared File Pointers]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Data Access with Shared File Pointers]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Data Access with Shared File Pointers]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Data Access with Shared File Pointers]]

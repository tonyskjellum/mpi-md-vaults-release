---
title: "Positioning"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Positioning

Chapter **io** · in [[versions/v20/sections/io#Positioning|MPI-2.0]], [[versions/v21/sections/io#Positioning|MPI-2.1]], [[versions/v22/sections/io#Positioning|MPI-2.2]], [[versions/v30/sections/io#Positioning|MPI-3.0]], [[versions/v31/sections/io#Positioning|MPI-3.1]], [[versions/v40/sections/io#Positioning|MPI-4.0]], [[versions/v41/sections/io#Positioning|MPI-4.1]], [[versions/v50/sections/io#Positioning|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

The data access routines that accept explicit offsets contain <span class="sans-serif">\_AT</span> in their name (e.g., `MPI_FILE_WRITE_AT`). Explicit offset operations perform data access at the file position given directly as an ~~argument—no~~ ==argument — no== file pointer is used nor updated. Note that this is not equivalent to an atomic seek-and-read or seek-and-write operation,

~~The names of the individual file pointer routines contain no~~

~~positional qualifier (e.g., `MPI_FILE_WRITE`).~~

~~Operations with individual file pointers are described in Section [[versions/v30/sections/io#Data Access with Individual File Pointers|Data Access with Individual File Pointers]] , page [[versions/v30/sections/io#Data Access with Individual File Pointers|Data Access with Individual File Pointers]] . The data access routines that use shared file pointers contain <span class="sans-serif">\_SHARED</span>~~

~~or <span class="sans-serif">\_ORDERED</span>~~

~~in their name (e.g., `MPI_FILE_WRITE_SHARED`). Operations with shared file pointers are described in Section [[versions/v30/sections/io#Data Access with Shared File Pointers|Data Access with Shared File Pointers]] , page [[versions/v30/sections/io#Data Access with Shared File Pointers|Data Access with Shared File Pointers]] .~~

==The names of the individual file pointer routines contain no positional qualifier (e.g., `MPI_FILE_WRITE`). Operations with individual file pointers are described in Section [[versions/v30/sections/io#Data Access with Individual File Pointers|Data Access with Individual File Pointers]] , page [[versions/v30/sections/io#Data Access with Individual File Pointers|Data Access with Individual File Pointers]] . The data access routines that use shared file pointers contain <span class="sans-serif">\_SHARED</span> or <span class="sans-serif">\_ORDERED</span> in their name (e.g., `MPI_FILE_WRITE_SHARED`). Operations with shared file pointers are described in Section [[versions/v30/sections/io#Data Access with Shared File Pointers|Data Access with Shared File Pointers]] , page [[versions/v30/sections/io#Data Access with Shared File Pointers|Data Access with Shared File Pointers]] .==

~~where $`count`$ is the number of $`datatype`$ items to be accessed,~~

~~$`elements(X)`$ is the number of predefined datatypes in the typemap of $`X`$, and $`old_file_offset`$ is the value of the implicit offset before the call.~~

~~The file position, $`new_file_offset`$, is in terms of a count of etypes relative to the current view.~~

==where $`count`$ is the number of $`datatype`$ items to be accessed, $`elements(X)`$ is the number of predefined datatypes in the typemap of $`X`$, and $`old_file_offset`$ is the value of the implicit offset before the call. The file position, $`new_file_offset`$, is in terms of a count of etypes relative to the current view.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~MPI provides three types of positioning for data access routines: explicit offsets, individual file pointers, and shared file pointers. The different positioning methods may be mixed within the same program and do not affect each other.~~

~~The data access routines that accept explicit offsets contain <span class="sans-serif">\_AT</span> in their name (e.g., `MPI_FILE_WRITE_AT`). Explicit offset operations perform data access at the file position given directly as an argument — no file pointer is used nor updated. Note that this is not equivalent to an atomic seek-and-read or seek-and-write operation,~~

~~as no “seek” is issued. Operations with explicit offsets are described in Section [[versions/v31/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] , page [[versions/v31/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] .~~

~~The names of the individual file pointer routines contain no positional qualifier (e.g., `MPI_FILE_WRITE`). Operations with individual file pointers are described in Section [[versions/v31/sections/io#Data Access with Individual File Pointers|Data Access with Individual File Pointers]] , page [[versions/v31/sections/io#Data Access with Individual File Pointers|Data Access with Individual File Pointers]] . The data access routines that use shared file pointers contain <span class="sans-serif">\_SHARED</span> or <span class="sans-serif">\_ORDERED</span> in their name (e.g., `MPI_FILE_WRITE_SHARED`). Operations with shared file pointers are described in Section [[versions/v31/sections/io#Data Access with Shared File Pointers|Data Access with Shared File Pointers]] , page [[versions/v31/sections/io#Data Access with Shared File Pointers|Data Access with Shared File Pointers]] .~~

~~The main semantic issues with MPI-maintained file pointers are how and when they are updated by I/O operations. In general, each I/O operation leaves the file pointer pointing to the next data item after the last one that~~

~~is accessed by the operation. In a nonblocking or split collective operation, the pointer is updated by the call that initiates the I/O, possibly before the access completes.~~

~~More formally, ``` math new_file_offset =  old_file_offset +                 \frac{elements(datatype)}{elements(etype)} \times count ```~~

~~where $`count`$ is the number of $`datatype`$ items to be accessed, $`elements(X)`$ is the number of predefined datatypes in the typemap of $`X`$, and $`old_file_offset`$ is the value of the implicit offset before the call. The file position, $`new_file_offset`$, is in terms of a count of etypes relative to the current view.~~

==MPI provides three types of positioning for data access routines: **explicit offsets**, **individual file pointers**, and **shared file pointers**. The different positioning methods may be mixed within the same program and do not affect each other.==

==The data access routines that accept explicit offsets contain `_AT` in their name (e.g., [[versions/v31/API/MPI_FILE_WRITE_AT|MPI_FILE_WRITE_AT]] ). Explicit offset operations perform data access at the file position given directly as an argument — no file pointer is used nor updated. Note that this is not equivalent to an atomic seek-and-read or seek-and-write operation, as no “seek” is issued. Operations with explicit offsets are described in [[versions/v31/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] .==

==The names of the individual file pointer routines contain no positional qualifier (e.g., [[versions/v31/API/MPI_FILE_WRITE|MPI_FILE_WRITE]] ). Operations with individual file pointers are described in [[versions/v31/sections/io#Data Access with Individual File Pointers|Data Access with Individual File Pointers]] . The data access routines that use shared file pointers contain `_SHARED` or `_ORDERED` in their name (e.g., [[versions/v31/API/MPI_FILE_WRITE_SHARED|MPI_FILE_WRITE_SHARED]] ). Operations with shared file pointers are described in [[versions/v31/sections/io#Data Access with Shared File Pointers|Data Access with Shared File Pointers]] .==

==The main semantic issues with MPI-maintained file pointers are how and when they are updated by I/O operations. In general, each I/O operation leaves the file pointer pointing to the next data item after the last one that is accessed by the operation. In a nonblocking or split collective operation, the pointer is updated by the call that initiates the I/O, possibly before the access completes.==

==More formally, ``` math \textit{new_file_offset} = \textit{old_file_offset} +                 \frac{elements(datatype)}{elements(etype)} \times count ```==

==where $`count`$ is the number of $`datatype`$ items to be accessed, $`elements(X)`$ is the number of predefined datatypes in the typemap of $`X`$, and *old_file_offset* is the value of the implicit offset before the call. The file position, *new_file_offset*, is in terms of a count of etypes relative to the current view.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The data access routines that accept explicit offsets contain `_AT` in their name (e.g., [[versions/v40/API/MPI_FILE_WRITE_AT|MPI_FILE_WRITE_AT]] ). Explicit offset operations perform data access at the file position given directly as an ~~argument — no~~ ==argument—no== file pointer is used nor updated. Note that this is not equivalent to an atomic seek-and-read or seek-and-write operation, as no “seek” is issued. Operations with explicit offsets are described in [[versions/v40/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] .

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

More formally, ``` math \textit{new_file_offset} = \textit{old_file_offset} + \frac{elements(datatype)}{elements(etype)} \times count ```

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Positioning]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Positioning]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Positioning]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Positioning]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Positioning]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Positioning]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Positioning]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Positioning]]

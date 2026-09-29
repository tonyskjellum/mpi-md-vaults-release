---
title: "Data Access with Explicit Offsets"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Data Access with Explicit Offsets

Chapter **io** · in [[versions/v20/sections/io#Data Access with Explicit Offsets|MPI-2.0]], [[versions/v21/sections/io#Data Access with Explicit Offsets|MPI-2.1]], [[versions/v22/sections/io#Data Access with Explicit Offsets|MPI-2.2]], [[versions/v30/sections/io#Data Access with Explicit Offsets|MPI-3.0]], [[versions/v31/sections/io#Data Access with Explicit Offsets|MPI-3.1]], [[versions/v40/sections/io#Data Access with Explicit Offsets|MPI-4.0]], [[versions/v41/sections/io#Data Access with Explicit Offsets|MPI-4.1]], [[versions/v50/sections/io#Data Access with Explicit Offsets|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

If ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== mode was specified when the file was opened, it is erroneous to call the routines in this section.

### MPI-3.0 → MPI-3.1  (6 changed paragraphs)

~~`MPI_FILE_READ_AT`~~ ==[[versions/v31/API/MPI_FILE_READ_AT|MPI_FILE_READ_AT]]== reads a file beginning at the position specified by `offset`.

~~`MPI_FILE_READ_AT_ALL`~~ ==[[versions/v31/API/MPI_FILE_READ_AT_ALL|MPI_FILE_READ_AT_ALL]]== is a collective version of the blocking ~~`MPI_FILE_READ_AT`~~ ==[[versions/v31/API/MPI_FILE_READ_AT|MPI_FILE_READ_AT]]== interface.

~~`MPI_FILE_WRITE_AT`~~ ==[[versions/v31/API/MPI_FILE_WRITE_AT|MPI_FILE_WRITE_AT]]== writes a file beginning at the position specified by `offset`.

~~`MPI_FILE_WRITE_AT_ALL`~~ ==[[versions/v31/API/MPI_FILE_WRITE_AT_ALL|MPI_FILE_WRITE_AT_ALL]]== is a collective version of the blocking ~~`MPI_FILE_WRITE_AT`~~ ==[[versions/v31/API/MPI_FILE_WRITE_AT|MPI_FILE_WRITE_AT]]== interface.

~~`MPI_FILE_IREAD_AT` is a nonblocking version of the `MPI_FILE_READ_AT` interface.~~

==[[versions/v31/API/MPI_FILE_IREAD_AT|MPI_FILE_IREAD_AT]] is a nonblocking version of the [[versions/v31/API/MPI_FILE_READ_AT|MPI_FILE_READ_AT]] interface.==

==![[versions/v31/API/MPI_FILE_IREAD_AT_ALL]]==

==[[versions/v31/API/MPI_FILE_IREAD_AT_ALL|MPI_FILE_IREAD_AT_ALL]] is a nonblocking version of [[versions/v31/API/MPI_FILE_READ_AT_ALL|MPI_FILE_READ_AT_ALL]] . See [[versions/v31/sections/io#Nonblocking Collective File Operations|Nonblocking Collective File Operations]] for semantics of nonblocking collective file operations.==

~~`MPI_FILE_IWRITE_AT` is a nonblocking version of the `MPI_FILE_WRITE_AT` interface.~~

==[[versions/v31/API/MPI_FILE_IWRITE_AT|MPI_FILE_IWRITE_AT]] is a nonblocking version of the [[versions/v31/API/MPI_FILE_WRITE_AT|MPI_FILE_WRITE_AT]] interface.==

==![[versions/v31/API/MPI_FILE_IWRITE_AT_ALL]]==

==[[versions/v31/API/MPI_FILE_IWRITE_AT_ALL|MPI_FILE_IWRITE_AT_ALL]] is a nonblocking version of [[versions/v31/API/MPI_FILE_WRITE_AT_ALL|MPI_FILE_WRITE_AT_ALL]] .==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Data Access with Explicit Offsets]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Data Access with Explicit Offsets]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Data Access with Explicit Offsets]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Data Access with Explicit Offsets]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Data Access with Explicit Offsets]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Data Access with Explicit Offsets]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Data Access with Explicit Offsets]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Data Access with Explicit Offsets]]

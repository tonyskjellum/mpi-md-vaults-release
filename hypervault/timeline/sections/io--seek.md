---
title: "Seek"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Seek

Chapter **io** · in [[versions/v20/sections/io#Seek|MPI-2.0]], [[versions/v21/sections/io#Seek|MPI-2.1]], [[versions/v22/sections/io#Seek|MPI-2.2]], [[versions/v30/sections/io#Seek|MPI-3.0]], [[versions/v31/sections/io#Seek|MPI-3.1]], [[versions/v40/sections/io#Seek|MPI-4.0]], [[versions/v41/sections/io#Seek|MPI-4.1]], [[versions/v50/sections/io#Seek|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

If ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== mode was specified when the file was opened,

- ~~MPI_SEEK_SET:~~ ==`MPI_SEEK_SET`:== the pointer is set to `offset`

- ~~MPI_SEEK_CUR:~~ ==`MPI_SEEK_CUR`:== the pointer is set to the current pointer position plus `offset`

- ~~MPI_SEEK_END:~~ ==`MPI_SEEK_END`:== the pointer is set to the end of

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened,~~

~~it is erroneous to call the following two routines (`MPI_FILE_SEEK_SHARED` and `MPI_FILE_GET_POSITION_SHARED`).~~

==If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, it is erroneous to call the following two routines (`MPI_FILE_SEEK_SHARED` and `MPI_FILE_GET_POSITION_SHARED`).==

~~`MPI_FILE_SEEK_SHARED` updates the shared file pointer according to `whence`,~~

~~which has~~

==`MPI_FILE_SEEK_SHARED` updates the shared file pointer according to `whence`, which has==

~~  file~~

~~  plus `offset`~~

~~`MPI_FILE_SEEK_SHARED` is collective; all the processes in the communicator group associated with the file handle `fh` must call `MPI_FILE_SEEK_SHARED` with the same~~

~~values for~~

~~`offset` and `whence`.~~

==  file plus `offset`==

==`MPI_FILE_SEEK_SHARED` is collective; all the processes in the communicator group associated with the file handle `fh` must call `MPI_FILE_SEEK_SHARED` with the same values for `offset` and `whence`.==

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, it is erroneous to call the following two routines ~~(`MPI_FILE_SEEK_SHARED`~~ ==( [[versions/v31/API/MPI_FILE_SEEK_SHARED|MPI_FILE_SEEK_SHARED]]== and ~~`MPI_FILE_GET_POSITION_SHARED`).~~ ==[[versions/v31/API/MPI_FILE_GET_POSITION_SHARED|MPI_FILE_GET_POSITION_SHARED]] ).==

~~`MPI_FILE_SEEK_SHARED` updates the shared file pointer according to `whence`, which has~~

~~the following possible values:~~

==[[versions/v31/API/MPI_FILE_SEEK_SHARED|MPI_FILE_SEEK_SHARED]] updates the shared file pointer according to `whence`, which has the following possible values:==

~~- `MPI_SEEK_END`: the pointer is set to the end of~~

~~  file plus `offset`~~

~~`MPI_FILE_SEEK_SHARED` is collective; all the processes in the communicator group associated with the file handle `fh` must call `MPI_FILE_SEEK_SHARED` with the same values for `offset` and `whence`.~~

==- `MPI_SEEK_END`: the pointer is set to the end of file plus `offset`==

==[[versions/v31/API/MPI_FILE_SEEK_SHARED|MPI_FILE_SEEK_SHARED]] is collective; all the processes in the communicator group associated with the file handle `fh` must call [[versions/v31/API/MPI_FILE_SEEK_SHARED|MPI_FILE_SEEK_SHARED]] with the same values for `offset` and `whence`.==

~~`MPI_FILE_GET_POSITION_SHARED`~~ ==[[versions/v31/API/MPI_FILE_GET_POSITION_SHARED|MPI_FILE_GET_POSITION_SHARED]]== returns, in `offset`, the current position of the shared file pointer in etype units relative to the current view.

> The `offset` can be used in a future call to ~~`MPI_FILE_SEEK_SHARED`~~ ==[[versions/v31/API/MPI_FILE_SEEK_SHARED|MPI_FILE_SEEK_SHARED]]== using `whence = MPI_SEEK_SET` to return to the current position. To set the displacement to the current file pointer position, first convert `offset` into an absolute byte position using ~~`MPI_FILE_GET_BYTE_OFFSET`,~~ ==[[versions/v31/API/MPI_FILE_GET_BYTE_OFFSET|MPI_FILE_GET_BYTE_OFFSET]] ,== then call ~~`MPI_FILE_SET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]]== with the resulting displacement.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~- `MPI_SEEK_SET`:~~ the pointer is set to `offset`

~~- `MPI_SEEK_CUR`:~~ the pointer is set to the current pointer position plus `offset`

~~- `MPI_SEEK_END`:~~ the pointer is set to the end of file plus `offset`

> The `offset` can be used in a future call to [[versions/v41/API/MPI_FILE_SEEK_SHARED|MPI_FILE_SEEK_SHARED]] using `whence ~~= MPI_SEEK_SET`~~ ===``MPI_SEEK_SET`== to return to the current position. To set the displacement to the current file pointer position, first convert `offset` into an absolute byte position using [[versions/v41/API/MPI_FILE_GET_BYTE_OFFSET|MPI_FILE_GET_BYTE_OFFSET]] , then call [[versions/v41/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] with the resulting displacement.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Seek]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Seek]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Seek]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Seek]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Seek]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Seek]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Seek]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Seek]]

---
title: "Miscellaneous Clarifications"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Miscellaneous Clarifications

Chapter **io** · in [[versions/v20/sections/io#Miscellaneous Clarifications|MPI-2.0]], [[versions/v21/sections/io#Miscellaneous Clarifications|MPI-2.1]], [[versions/v22/sections/io#Miscellaneous Clarifications|MPI-2.2]], [[versions/v30/sections/io#Miscellaneous Clarifications|MPI-3.0]], [[versions/v31/sections/io#Miscellaneous Clarifications|MPI-3.1]], [[versions/v40/sections/io#Miscellaneous Clarifications|MPI-4.0]], [[versions/v41/sections/io#Miscellaneous Clarifications|MPI-4.1]], [[versions/v50/sections/io#Miscellaneous Clarifications|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~As in communication, datatypes must be committed before they can be used in file manipulation or data access operations. For example, the `etype` and `filetype` must be committed before calling `MPI_FILE_SET_VIEW`, and the `datatype` must be committed before calling `MPI_FILE_READ` or `MPI_FILE_WRITE`.~~

==As in communication, datatypes must be committed before they can be used in file manipulation or data access operations. For example, the `etype` and==

==`filetype`==

==must be committed before calling `MPI_FILE_SET_VIEW`, and the `datatype` must be committed before calling `MPI_FILE_READ` or `MPI_FILE_WRITE`.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~`filetype`~~

~~must be committed before calling `MPI_FILE_SET_VIEW`, and the `datatype` must be committed before calling `MPI_FILE_READ` or `MPI_FILE_WRITE`.~~

==`filetype` must be committed before calling `MPI_FILE_SET_VIEW`, and the `datatype` must be committed before calling `MPI_FILE_READ` or `MPI_FILE_WRITE`.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Once an I/O routine completes, it is safe to free any opaque objects passed as arguments to that routine. For example, the `comm` and `info` used in an `MPI_FILE_OPEN`, or the `etype` and `filetype` used in an `MPI_FILE_SET_VIEW`, can be freed without affecting access to the file. Note that for nonblocking routines and split collective operations, the operation must be completed before it is safe to reuse data buffers passed as arguments.~~

~~As in communication, datatypes must be committed before they can be used in file manipulation or data access operations. For example, the `etype` and~~

~~`filetype` must be committed before calling `MPI_FILE_SET_VIEW`, and the `datatype` must be committed before calling `MPI_FILE_READ` or `MPI_FILE_WRITE`.~~

==Once an I/O routine completes, it is safe to free any opaque objects passed as arguments to that routine. For example, the `comm` and `info` used in an [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , or the `etype` and `filetype` used in an [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , can be freed without affecting access to the file. Note that for nonblocking routines and split collective operations, the operation must be completed before it is safe to reuse data buffers passed as arguments.==

==As in communication, datatypes must be committed before they can be used in file manipulation or data access operations. For example, the `etype` and `filetype` must be committed before calling [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , and the `datatype` must be committed before calling [[versions/v31/API/MPI_FILE_READ|MPI_FILE_READ]] or [[versions/v31/API/MPI_FILE_WRITE|MPI_FILE_WRITE]] .==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Miscellaneous Clarifications]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Miscellaneous Clarifications]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Miscellaneous Clarifications]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Miscellaneous Clarifications]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Miscellaneous Clarifications]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Miscellaneous Clarifications]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Miscellaneous Clarifications]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Miscellaneous Clarifications]]

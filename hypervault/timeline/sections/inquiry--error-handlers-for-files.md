---
title: "Error Handlers for Files"
chapter: inquiry
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Error Handlers for Files

Chapter **inquiry** · in [[versions/v21/sections/inquiry#Error Handlers for Files|MPI-2.1]], [[versions/v22/sections/inquiry#Error Handlers for Files|MPI-2.2]], [[versions/v30/sections/inquiry#Error Handlers for Files|MPI-3.0]], [[versions/v31/sections/inquiry#Error Handlers for Files|MPI-3.1]], [[versions/v40/sections/inquiry#Error Handlers for Files|MPI-4.0]], [[versions/v41/sections/inquiry#Error Handlers for Files|MPI-4.1]], [[versions/v50/sections/inquiry#Error Handlers for Files|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The user routine should be, in C, a function of type ~~`MPI_File_errhandler_fn`,~~ ==`MPI_File_errhandler_function`,== which is defined as

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~Creates an error handler that can be attached to a file object.~~

~~The user routine should be, in C, a function of type `MPI_File_errhandler_function`, which is defined as~~

==Creates an error handler that can be attached to a file object. The user routine should be, in C, a function of type `MPI_File_errhandler_function`, which is defined as==

~~In Fortran,~~ ==With the Fortran `mpi_f08` module,== the user routine ==`file_errhandler_fn`== should be of the form:

~~In C++,~~ ==With the Fortran `mpi` module and `mpif.h`,== the user routine ==`FILE_ERRHANDLER_FN`== should be of the form:

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The first argument is the file in use, the second is the error code to be returned. ==The remaining arguments are “`varargs`” arguments whose number and meaning is implementation-dependent. An implementation should clearly document these arguments.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

With the Fortran `mpi` module and ~~`mpif.h`,~~ ==(deprecated) `mpif.h` include file,== the user routine `FILE_ERRHANDLER_FN` should be of the form:

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Error Handlers for Files]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Error Handlers for Files]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Error Handlers for Files]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Error Handlers for Files]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Error Handlers for Files]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Error Handlers for Files]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Error Handlers for Files]]

---
title: "Windows"
chapter: context
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Windows

Chapter **context** · in [[versions/v21/sections/context#Windows|MPI-2.1]], [[versions/v22/sections/context#Windows|MPI-2.2]], [[versions/v30/sections/context#Windows|MPI-3.0]], [[versions/v31/sections/context#Windows|MPI-3.1]], [[versions/v40/sections/context#Windows|MPI-4.0]], [[versions/v41/sections/context#Windows|MPI-4.1]], [[versions/v50/sections/context#Windows|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

[[versions/v22/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] from either C, C++, or Fortran. [[versions/v22/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.== [[versions/v22/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.==

[[versions/v22/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_DELETE_FN]] from either C, C++, or Fortran. [[versions/v22/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_DELETE_FN]] is a function that does nothing, other than returning ~~MPI_SUCCESS.~~ ==`MPI_SUCCESS`.==

If an attribute copy function or attribute delete function returns other than ~~MPI_SUCCESS,~~ ==`MPI_SUCCESS`,== then the call that caused it to be invoked (for example, [[versions/v22/API/MPI_WIN_FREE|MPI_WIN_FREE]] ), is erroneous.

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

The ~~new~~ functions for caching on windows are:

[[versions/v30/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] from either ~~C, C++,~~ ==C== or Fortran. [[versions/v30/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_COPY_FN]] is a function that does nothing other than returning `flag = 0` and `MPI_SUCCESS`. [[versions/v30/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] is a simple-minded copy function that sets `flag = 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`.

[[versions/v30/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_DELETE_FN]] from either ~~C, C++,~~ ==C== or Fortran. [[versions/v30/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`.

~~The~~ ==With the `mpi_f08` module, the== Fortran callback functions are:

~~The C++ callbacks~~ ==With the `mpi` module and `mpif.h`, the Fortran callback functions== are:

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

[[versions/v40/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] from either C or Fortran. [[versions/v40/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_COPY_FN]] is a function that does nothing other than returning ~~`flag =~~ ==`flag``=== 0` and `MPI_SUCCESS`. [[versions/v40/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] is a ~~simple-minded~~ ==simple== copy function that sets ~~`flag =~~ ==`flag``=== 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~The argument `win_copy_attr_fn` may be specified as~~

~~[[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_COPY_FN]] or~~

~~[[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] from either C or Fortran. [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_COPY_FN]] is a function that does nothing other than returning `flag``= 0` and `MPI_SUCCESS`. [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] is a simple copy function that sets `flag``= 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`.~~

~~The argument `win_delete_attr_fn` may be specified as~~

~~[[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_DELETE_FN]] from either C or Fortran. [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`.~~

==The argument `win_copy_attr_fn` may be specified as [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_COPY_FN]] or [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] from either C or Fortran. [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_COPY_FN]] is a function that does nothing other than returning `flag``= 0` and `MPI_SUCCESS`. [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_DUP_FN]] is a simple copy function that sets `flag``= 1`, returns the value of `attribute_val_in` in `attribute_val_out`, and returns `MPI_SUCCESS`.==

==The argument `win_delete_attr_fn` may be specified as [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_DELETE_FN]] from either C or Fortran. [[versions/v41/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_NULL_DELETE_FN]] is a function that does nothing, other than returning `MPI_SUCCESS`.==

With the `mpi` module and ~~`mpif.h`,~~ ==(deprecated) `mpif.h` include file,== the Fortran callback functions are:

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Windows]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Windows]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Windows]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Windows]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Windows]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Windows]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Windows]]

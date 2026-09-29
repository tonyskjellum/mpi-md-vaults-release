---
title: "Freeing Errorhandlers and Retrieving Error Strings"
chapter: inquiry
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Freeing Errorhandlers and Retrieving Error Strings

Chapter **inquiry** · in [[versions/v21/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings|MPI-2.1]], [[versions/v22/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings|MPI-2.2]], [[versions/v30/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings|MPI-3.0]], [[versions/v31/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings|MPI-3.1]], [[versions/v40/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings|MPI-4.0]], [[versions/v41/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings|MPI-4.1]], [[versions/v50/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

Marks the error handler associated with `errhandler` for deallocation and sets `errhandler` to ~~MPI_ERRHANDLER_NULL.~~ ==`MPI_ERRHANDLER_NULL`.== The error handler will be deallocated after all

The argument `string` must represent storage that is at least ~~MPI_MAX_ERROR_STRING~~ ==`MPI_MAX_ERROR_STRING`== characters long.

> The form of this function was chosen to make the Fortran and C bindings similar. A version that returns a pointer to a string has two difficulties. First, the return string must be statically allocated and different for each error message (allowing the pointers returned by successive calls to ~~MPI_ERROR_STRING~~ ==`MPI_ERROR_STRING`== to point to the correct message). Second, in Fortran, a function declared as returning ~~CHARACTER\*(\*)~~ ==`CHARACTER*(*)`== can not be referenced in, for example, a ~~PRINT~~ ==`PRINT`== statement.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~the objects~~

~~associated with it~~

~~(communicator, window, or file)~~

~~have been deallocated.~~

==the objects associated with it (communicator, window, or file) have been deallocated.==

~~Returns the error string associated with an error code~~

~~or class.~~

~~The argument `string` must represent storage that is at least `MPI_MAX_ERROR_STRING` characters long.~~

==Returns the error string associated with an error code or class. The argument `string` must represent storage that is at least `MPI_MAX_ERROR_STRING` characters long.==

> The form of this function was chosen to make the Fortran and C bindings similar. A version that returns a pointer to a string has two difficulties. First, the return string must be statically allocated and different for each error message (allowing the pointers returned by successive calls to ~~`MPI_ERROR_STRING`~~ ==[[versions/v30/API/MPI_ERROR_STRING|MPI_ERROR_STRING]]== to point to the correct message). Second, in Fortran, a function declared as returning `CHARACTER*(*)` can not be referenced in, for example, a `PRINT` statement.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Marks the error handler associated with `errhandler` for deallocation and sets `errhandler` to `MPI_ERRHANDLER_NULL`. The error handler will be deallocated after all~~

~~the objects associated with it (communicator, window, or file) have been deallocated.~~

==Marks the error handler associated with `errhandler` for deallocation and sets `errhandler` to `MPI_ERRHANDLER_NULL`. The error handler will be deallocated after all the objects associated with it (communicator, window, or file) have been deallocated.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

==This function must always be thread-safe, as defined in Section [[versions/v40/sections/dynamic#MPI and Threads|MPI and Threads]] . It is one of the few routines that may be called before MPI is initialized or after MPI is finalized.==

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Freeing Errorhandlers and Retrieving Error Strings]]

---
title: "Exceptions"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Exceptions

Chapter **binding** · in [[versions/v20/sections/binding#Exceptions|MPI-2.0]], [[versions/v21/sections/binding#Exceptions|MPI-2.1]], [[versions/v22/sections/binding#Exceptions|MPI-2.2]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

If a non-C++ program causes an error that invokes the `MPI::ERRORS_THROW_EXCEPTIONS` error handler, the exception will pass up the calling stack until C++ code can catch it. If there is no C++ code to catch it, the behavior is undefined. In a multi-threaded environment or if a ~~non-blocking~~ ==nonblocking== MPI call throws an exception while making progress in the background, the behavior is implementation dependent.

> The exception will be thrown within the body of `MPI::ERRORS_THROW_EXCEPTIONS`. It is expected that control will be returned to the user when the exception is thrown. Some MPI functions specify certain return information in their parameters in the case of an error and `MPI_ERRORS_RETURN` is specified. The same type of return information must be provided when exceptions are thrown. > > For example, [[versions/v22/API/MPI_WAITALL|MPI_WAITALL]] puts an error code for each request in the corresponding entry in the status array and returns ~~MPI_ERR_IN_STATUS.~~ ==`MPI_ERR_IN_STATUS`.== When using `MPI::ERRORS_THROW_EXCEPTIONS`, it is expected that the error codes in the status array will be set appropriately before the exception is thrown.

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Exceptions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Exceptions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Exceptions]]

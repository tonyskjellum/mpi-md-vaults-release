---
title: "Calling Error Handlers"
chapter: inquiry
present_in: ["MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Calling Error Handlers

Chapter **inquiry** · in [[versions/v41/sections/inquiry#Calling Error Handlers|MPI-4.1]], [[versions/v50/sections/inquiry#Calling Error Handlers|MPI-5.0]]

## Changes along the time axis

### MPI-4.0 → MPI-4.1

_Section appears in MPI-4.1._

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

> ~~In contrast to communicators, the~~ ==The== error handler `MPI_ERRORS_ARE_FATAL` is ==always== associated with a window when it is created.

==> >== > Users are warned that handlers should not be called recursively with [[versions/v50/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v50/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , [[versions/v50/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] , or [[versions/v50/API/MPI_SESSION_CALL_ERRHANDLER|MPI_SESSION_CALL_ERRHANDLER]] . Doing this can create a situation where an infinite recursion is created. This can occur if [[versions/v50/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v50/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , [[versions/v50/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] , or [[versions/v50/API/MPI_SESSION_CALL_ERRHANDLER|MPI_SESSION_CALL_ERRHANDLER]] is called inside an error handler. ==> >== > > Error codes and classes are associated with a process. As a result, they may be used in any error handler. Error handlers should be prepared to deal with any error code they are given. Furthermore, it is good practice to only call an error handler with the appropriate error codes. For example, file errors would normally be sent to the file error handler.

## Text by release

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Calling Error Handlers]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Calling Error Handlers]]

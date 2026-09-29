---
title: "Error Classes, Error Codes, and Error Handlers"
chapter: inquiry
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Error Classes, Error Codes, and Error Handlers

Chapter **inquiry** · in [[versions/v21/sections/inquiry#Error Classes, Error Codes, and Error Handlers|MPI-2.1]], [[versions/v22/sections/inquiry#Error Classes, Error Codes, and Error Handlers|MPI-2.2]], [[versions/v30/sections/inquiry#Error Classes, Error Codes, and Error Handlers|MPI-3.0]], [[versions/v31/sections/inquiry#Error Classes, Error Codes, and Error Handlers|MPI-3.1]], [[versions/v40/sections/inquiry#Error Classes, Error Codes, and Error Handlers|MPI-4.0]], [[versions/v41/sections/inquiry#Error Classes, Error Codes, and Error Handlers|MPI-4.1]], [[versions/v50/sections/inquiry#Error Classes, Error Codes, and Error Handlers|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (13 changed paragraphs)

error ~~classes:~~ ==classes or codes:== it is not expected that an application will generate them in significant numbers.

The value of ~~MPI_ERR_LASTCODE~~ ==`MPI_ERR_LASTCODE`==

Instead, a predefined attribute key ~~MPI_LASTUSEDCODE~~ ==`MPI_LASTUSEDCODE`== is associated with ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.== The attribute value corresponding to this key

The value returned by this key is always greater than or equal to ~~MPI_ERR_LASTCODE.~~ ==`MPI_ERR_LASTCODE`.==

> The value returned by the key ~~MPI_LASTUSEDCODE~~ ==`MPI_LASTUSEDCODE`== will not change unless the user calls a function to explicitly add an error class/code. In a multi-threaded environment, the user must take extra care in assuming this value has not changed. > > Note that error codes and error classes are not necessarily dense. A user may not assume that each error class below ~~MPI_LASTUSEDCODE~~ ==`MPI_LASTUSEDCODE`== is valid.

Associates an error string with an error code or class. The string must be no more than ~~MPI_MAX_ERROR_STRING~~ ==`MPI_MAX_ERROR_STRING`== characters long. The length of the string is as defined in the calling language.

Calling [[versions/v22/API/MPI_ADD_ERROR_STRING|MPI_ADD_ERROR_STRING]] for an `errorcode` that already has a string will replace the old string with the new string. It is erroneous to call [[versions/v22/API/MPI_ADD_ERROR_STRING|MPI_ADD_ERROR_STRING]] for an error code or class with a value $`\leq ~~MPI_ERR_LASTCODE`$.~~ ==\texttt{MPI_ERR_LASTCODE}`$.==

This function invokes the error handler assigned to the communicator with the error code supplied. This function returns ~~MPI_SUCCESS~~ ==`MPI_SUCCESS`== in C and C++ and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).

> Users should note that the default error handler is ~~MPI_ERRORS_ARE_FATAL.~~ ==`MPI_ERRORS_ARE_FATAL`.== Thus, calling `MPI_COMM_CALL_ERRHANDLER` will abort the `comm` processes if the default error handler has not been changed for this communicator or on the parent before the communicator was created.

This function invokes the error handler assigned to the window with the error code supplied. This function returns ~~MPI_SUCCESS~~ ==`MPI_SUCCESS`== in C and C++ and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).

> As with communicators, the default error handler for windows is ~~MPI_ERRORS_ARE_FATAL.~~ ==`MPI_ERRORS_ARE_FATAL`.==

This function invokes the error handler assigned to the file with the error code supplied. This function returns ~~MPI_SUCCESS~~ ==`MPI_SUCCESS`== in C and C++ and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).

> Unlike errors on communicators and windows, the default behavior for files is to have > > ~~MPI_ERRORS_RETURN.~~ ==`MPI_ERRORS_RETURN`.==

### MPI-2.2 → MPI-3.0  (9 changed paragraphs)

~~MPI, see Chapter [[versions/v30/sections/io#I/O|I/O]] on page [[versions/v30/sections/io#I/O|I/O]] .~~

~~For this purpose, functions are needed to:~~

==MPI, see Chapter [[versions/v30/sections/io#I/O|I/O]] on page [[versions/v30/sections/io#I/O|I/O]] . For this purpose, functions are needed to:==

~~The value of `MPI_ERR_LASTCODE`~~

~~is a constant value and~~

~~is not affected by new user-defined error codes and classes.~~

~~Instead, a predefined attribute key `MPI_LASTUSEDCODE` is associated with `MPI_COMM_WORLD`. The attribute value corresponding to this key~~

~~is the current maximum error class including the user-defined ones.~~

~~This is a local value and may be different on different processes.~~

~~The value returned by this key is always greater than or equal to `MPI_ERR_LASTCODE`.~~

==The value of `MPI_ERR_LASTCODE` is a constant value and is not affected by new user-defined error codes and classes.==

==Instead, a predefined attribute key `MPI_LASTUSEDCODE` is associated with `MPI_COMM_WORLD`. The attribute value corresponding to this key is the current maximum error class including the user-defined ones. This is a local value and may be different on different processes. The value returned by this key is always greater than or equal to `MPI_ERR_LASTCODE`.==

> The value returned by the key `MPI_LASTUSEDCODE` will not change unless the user calls a function to explicitly add an error class/code. In a multi-threaded environment, the user must take extra care in assuming this value has not changed. ~~> >~~ Note that error codes and error classes are not necessarily dense. A user may not assume that each error class below `MPI_LASTUSEDCODE` is valid.

~~Associates an error string with an error code or class. The string must be no more than `MPI_MAX_ERROR_STRING` characters long. The length of the string is as defined in the calling language.~~

~~The length of the string does not include the null terminator in C or C++.~~

~~Trailing blanks will be stripped in Fortran.~~

~~Calling [[versions/v30/API/MPI_ADD_ERROR_STRING|MPI_ADD_ERROR_STRING]] for an `errorcode` that already has a string will replace the old string with the new string. It is erroneous to call [[versions/v30/API/MPI_ADD_ERROR_STRING|MPI_ADD_ERROR_STRING]] for an error code or class with a value $`\leq \texttt{MPI_ERR_LASTCODE}`$.~~

~~If [[versions/v30/API/MPI_ERROR_STRING|MPI_ERROR_STRING]] is called when no string has been set, it will return a empty string (all spaces in Fortran, `""` in C and C++).~~

==Associates an error string with an error code or class. The string must be no more than `MPI_MAX_ERROR_STRING` characters long. The length of the string is as defined in the calling language. The length of the string does not include the null terminator in C. Trailing blanks will be stripped in Fortran. Calling [[versions/v30/API/MPI_ADD_ERROR_STRING|MPI_ADD_ERROR_STRING]] for an `errorcode` that already has a string will replace the old string with the new string. It is erroneous to call [[versions/v30/API/MPI_ADD_ERROR_STRING|MPI_ADD_ERROR_STRING]] for an error code or class with a value $`\leq \texttt{MPI_ERR_LASTCODE}`$.==

==If [[versions/v30/API/MPI_ERROR_STRING|MPI_ERROR_STRING]] is called when no string has been set, it will return a empty string (all spaces in Fortran, `""` in C).==

This function invokes the error handler assigned to the communicator with the error code supplied. This function returns `MPI_SUCCESS` in C ~~and C++~~ and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).

This function invokes the error handler assigned to the window with the error code supplied. This function returns `MPI_SUCCESS` in C ~~and C++~~ and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).

This function invokes the error handler assigned to the file with the error code supplied. This function returns `MPI_SUCCESS` in C ~~and C++~~ and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).

> Unlike errors on communicators and windows, the default behavior for files is to have ~~> >~~ `MPI_ERRORS_RETURN`.

> Users are warned that handlers should not be called recursively with [[versions/v30/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v30/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , or [[versions/v30/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] . Doing this can create a situation where an infinite recursion is created. This can occur if [[versions/v30/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v30/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , or [[versions/v30/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] is called inside an error handler. > > Error codes and classes are associated with a process. As a result, they may be used in any error handler. Error handlers should be prepared to deal with any error code > > they are ~~> >~~ given. Furthermore, it is good practice to only call an error handler with the appropriate error codes. For example, file errors would normally be sent to the file error ~~> >~~ handler.

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~Users may want to write a layered library on top of an existing MPI implementation, and this library may have its own set of error codes and classes. An example of such a library is an I/O library based on~~

~~MPI, see Chapter [[versions/v31/sections/io#I/O|I/O]] on page [[versions/v31/sections/io#I/O|I/O]] . For this purpose, functions are needed to:~~

==Users may want to write a layered library on top of an existing MPI implementation, and this library may have its own set of error codes and classes. An example of such a library is an I/O library based on MPI, see [[Chapter]] chap:io-2. For this purpose, functions are needed to:==

~~Several~~

~~functions are provided to do this. They are all local. No functions are provided to free~~

~~error classes or codes: it is not expected that an application will generate them in significant numbers.~~

==Several functions are provided to do this. They are all local. No functions are provided to free error classes or codes: it is not expected that an application will generate them in significant numbers.==

~~The value of `MPI_ERR_LASTCODE` is a constant value and is not affected by new user-defined error codes and classes.~~

~~Instead, a predefined attribute key `MPI_LASTUSEDCODE` is associated with `MPI_COMM_WORLD`. The attribute value corresponding to this key is the current maximum error class including the user-defined ones. This is a local value and may be different on different processes. The value returned by this key is always greater than or equal to `MPI_ERR_LASTCODE`.~~

==The value of `MPI_ERR_LASTCODE` is a constant value and is not affected by new user-defined error codes and classes. Instead, a predefined attribute key `MPI_LASTUSEDCODE` is associated with `MPI_COMM_WORLD`. The attribute value corresponding to this key is the current maximum error class including the user-defined ones. This is a local value and may be different on different processes. The value returned by this key is always greater than or equal to `MPI_ERR_LASTCODE`.==

~~Section [[versions/v31/sections/inquiry#Error Handling|Error Handling]] on page~~ [[versions/v31/sections/inquiry#Error Handling|Error Handling]] describes the methods for creating and associating error handlers with communicators, files, and windows.

> Users are warned that handlers should not be called recursively with [[versions/v31/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v31/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , or [[versions/v31/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] . Doing this can create a situation where an infinite recursion is created. This can occur if [[versions/v31/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v31/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , or [[versions/v31/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] is called inside an error handler. > > Error codes and classes are associated with a process. As a result, they may be used in any error handler. Error handlers should be prepared to deal with any error code ~~> >~~ they are given. Furthermore, it is good practice to only call an error handler with the appropriate error codes. For example, file errors would normally be sent to the file error handler.

### MPI-3.1 → MPI-4.0  (9 changed paragraphs)

~~> [!warning] Advice to implementors~~

~~> A high-quality implementation will return the value for a new `errorclass` in the same deterministic way on all processes.~~

> Since a call to [[versions/v40/API/MPI_ADD_ERROR_CLASS|MPI_ADD_ERROR_CLASS]] is local, the same `errorclass` may not be returned on all processes that make this call. Thus, it is not safe to assume that registering a new error on a set of processes at the same time will yield the same `errorclass` on all of the processes. ~~However, if an implementation returns the new `errorclass` in a deterministic way, and they are always generated in the same order on the same set of processes (for example, all processes), then the value will be the same. However, even if a deterministic algorithm is used, the value can vary across processes. This can happen, for example, if different but overlapping groups of processes make a series of calls. As a result of these issues, getting~~ ==Getting== the “same” error on multiple processes may not cause the same value of error code to be generated.

> The value returned by the key `MPI_LASTUSEDCODE` will not change unless the user calls a function to explicitly add an error class/code. In a ~~multi-threaded~~ ==multithreaded== environment, the user must take extra care in assuming this value has not changed. Note that error codes and error classes are not necessarily dense. A user may not assume that each error class below `MPI_LASTUSEDCODE` is valid.

~~> [!warning] Advice to implementors~~

~~> A high-quality implementation will return the value for a new `errorcode` in the same deterministic way on all processes.~~

[[versions/v40/sections/inquiry#Error Handling|Error Handling]] describes the methods for creating and associating error handlers with communicators, files, ==windows,== and ~~windows.~~ ==sessions.==

~~> [!note] Advice to users~~

~~> Users should note that the default error handler is `MPI_ERRORS_ARE_FATAL`. Thus, calling `MPI_COMM_CALL_ERRHANDLER` will abort the `comm` processes if the default error handler has not been changed for this communicator or on the parent before the communicator was created.~~

> ~~As with~~ ==In contrast to== communicators, the ~~default~~ error handler ~~for windows~~ ==`MPI_ERRORS_ARE_FATAL`== is ~~`MPI_ERRORS_ARE_FATAL`.~~ ==associated with a window when it is created.==

~~> Unlike errors on communicators and windows, the default behavior for files is to have `MPI_ERRORS_RETURN`.~~

==> The default error handler for files is `MPI_ERRORS_RETURN`.==

==![[versions/v40/API/MPI_SESSION_CALL_ERRHANDLER]]==

==This function invokes the error handler assigned to the session with the error code supplied. This function returns `MPI_SUCCESS` in C and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).==

> Users are warned that handlers should not be called recursively with [[versions/v40/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v40/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , ==[[versions/v40/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] ,== or ~~[[versions/v40/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]]~~ ==[[versions/v40/API/MPI_SESSION_CALL_ERRHANDLER|MPI_SESSION_CALL_ERRHANDLER]]== . Doing this can create a situation where an infinite recursion is created. This can occur if [[versions/v40/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v40/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , ==[[versions/v40/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] ,== or ~~[[versions/v40/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]]~~ ==[[versions/v40/API/MPI_SESSION_CALL_ERRHANDLER|MPI_SESSION_CALL_ERRHANDLER]]== is called inside an error handler. > > Error codes and classes are associated with a process. As a result, they may be used in any error handler. Error handlers should be prepared to deal with any error code they are given. Furthermore, it is good practice to only call an error handler with the appropriate error codes. For example, file errors would normally be sent to the file error handler.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~1.  add a new error class to the ones an MPI implementation already knows.~~

~~2.  associate error codes with this error class, so that [[versions/v41/API/MPI_ERROR_CLASS|MPI_ERROR_CLASS]] works.~~

~~3.  associate strings with these error codes, so that [[versions/v41/API/MPI_ERROR_STRING|MPI_ERROR_STRING]] works.~~

~~4.  invoke the error handler associated with a communicator, window, or object.~~

~~Several functions are provided to do this. They are all local. No functions are provided to free error classes or codes: it is not expected that an application will generate them in significant numbers.~~

~~![[versions/v41/API/MPI_ADD_ERROR_CLASS]]~~

~~Creates a new error class and returns the value for it.~~

~~> [!tip] Rationale~~

~~> To avoid conflicts with existing error codes and classes, the value is set by the implementation and not by the user.~~

~~> [!note] Advice to users~~

~~> Since a call to [[versions/v41/API/MPI_ADD_ERROR_CLASS|MPI_ADD_ERROR_CLASS]] is local, the same `errorclass` may not be returned on all processes that make this call. Thus, it is not safe to assume that registering a new error on a set of processes at the same time will yield the same `errorclass` on all of the processes. Getting the “same” error on multiple processes may not cause the same value of error code to be generated.~~

~~The value of `MPI_ERR_LASTCODE` is a constant value and is not affected by new user-defined error codes and classes. Instead, a predefined attribute key `MPI_LASTUSEDCODE` is associated with `MPI_COMM_WORLD`. The attribute value corresponding to this key is the current maximum error class including the user-defined ones. This is a local value and may be different on different processes. The value returned by this key is always greater than or equal to `MPI_ERR_LASTCODE`.~~

~~> [!note] Advice to users~~

~~> The value returned by the key `MPI_LASTUSEDCODE` will not change unless the user calls a function to explicitly add an error class/code. In a multithreaded environment, the user must take extra care in assuming this value has not changed. Note that error codes and error classes are not necessarily dense. A user may not assume that each error class below `MPI_LASTUSEDCODE` is valid.~~

~~![[versions/v41/API/MPI_ADD_ERROR_CODE]]~~

~~Creates new error code associated with `errorclass` and returns its value in `errorcode`.~~

~~> [!tip] Rationale~~

~~> To avoid conflicts with existing error codes and classes, the value of the new error code is set by the implementation and not by the user.~~

~~![[versions/v41/API/MPI_ADD_ERROR_STRING]]~~

~~Associates an error string with an error code or class. The string must be no more than `MPI_MAX_ERROR_STRING` characters long. The length of the string is as defined in the calling language. The length of the string does not include the null terminator in C. Trailing blanks will be stripped in Fortran. Calling [[versions/v41/API/MPI_ADD_ERROR_STRING|MPI_ADD_ERROR_STRING]] for an `errorcode` that already has a string will replace the old string with the new string. It is erroneous to call [[versions/v41/API/MPI_ADD_ERROR_STRING|MPI_ADD_ERROR_STRING]] for an error code or class with a value $`\leq \texttt{MPI_ERR_LASTCODE}`$.~~

~~If [[versions/v41/API/MPI_ERROR_STRING|MPI_ERROR_STRING]] is called when no string has been set, it will return a empty string (all spaces in Fortran, `""` in C).~~

~~[[versions/v41/sections/inquiry#Error Handling|Error Handling]] describes the methods for creating and associating error handlers with communicators, files, windows, and sessions.~~

~~![[versions/v41/API/MPI_COMM_CALL_ERRHANDLER]]~~

~~This function invokes the error handler assigned to the communicator with the error code supplied. This function returns `MPI_SUCCESS` in C and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).~~

~~![[versions/v41/API/MPI_WIN_CALL_ERRHANDLER]]~~

~~This function invokes the error handler assigned to the window with the error code supplied. This function returns `MPI_SUCCESS` in C and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).~~

~~> [!note] Advice to users~~

~~> In contrast to communicators, the error handler `MPI_ERRORS_ARE_FATAL` is associated with a window when it is created.~~

~~![[versions/v41/API/MPI_FILE_CALL_ERRHANDLER]]~~

~~This function invokes the error handler assigned to the file with the error code supplied. This function returns `MPI_SUCCESS` in C and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).~~

~~> [!note] Advice to users~~

~~> The default error handler for files is `MPI_ERRORS_RETURN`.~~

~~![[versions/v41/API/MPI_SESSION_CALL_ERRHANDLER]]~~

~~This function invokes the error handler assigned to the session with the error code supplied. This function returns `MPI_SUCCESS` in C and the same value in `IERROR` if the error handler was successfully called (assuming the process is not aborted and the error handler returns).~~

~~> [!note] Advice to users~~

~~> Users are warned that handlers should not be called recursively with [[versions/v41/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v41/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , [[versions/v41/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] , or [[versions/v41/API/MPI_SESSION_CALL_ERRHANDLER|MPI_SESSION_CALL_ERRHANDLER]] . Doing this can create a situation where an infinite recursion is created. This can occur if [[versions/v41/API/MPI_COMM_CALL_ERRHANDLER|MPI_COMM_CALL_ERRHANDLER]] , [[versions/v41/API/MPI_FILE_CALL_ERRHANDLER|MPI_FILE_CALL_ERRHANDLER]] , [[versions/v41/API/MPI_WIN_CALL_ERRHANDLER|MPI_WIN_CALL_ERRHANDLER]] , or [[versions/v41/API/MPI_SESSION_CALL_ERRHANDLER|MPI_SESSION_CALL_ERRHANDLER]] is called inside an error handler. > > Error codes and classes are associated with a process. As a result, they may be used in any error handler. Error handlers should be prepared to deal with any error code they are given. Furthermore, it is good practice to only call an error handler with the appropriate error codes. For example, file errors would normally be sent to the file error handler.~~

==1.  add a new error class and remove previously added user-defined error classes;==

==2.  associate error codes with this error class, so that [[versions/v41/API/MPI_ERROR_CLASS|MPI_ERROR_CLASS]] works;==

==3.  associate strings with these error codes, so that [[versions/v41/API/MPI_ERROR_STRING|MPI_ERROR_STRING]] works;==

==4.  remove such associations;==

==5.  invoke the error handler associated with a communicator, window, file, or session object.==

==Several procedures are provided to do this. They are all local.==

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Error Classes, Error Codes, and Error Handlers]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Error Classes, Error Codes, and Error Handlers]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Error Classes, Error Codes, and Error Handlers]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Error Classes, Error Codes, and Error Handlers]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Error Classes, Error Codes, and Error Handlers]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Error Classes, Error Codes, and Error Handlers]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Error Classes, Error Codes, and Error Handlers]]

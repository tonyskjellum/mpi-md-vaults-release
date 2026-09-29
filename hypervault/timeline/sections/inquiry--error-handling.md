---
title: "Error Handling"
chapter: inquiry
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Error Handling

Chapter **inquiry** · in [[versions/v13/sections/inquiry#Error handling|MPI-1.3]], [[versions/v21/sections/inquiry#Error Handling|MPI-2.1]], [[versions/v22/sections/inquiry#Error Handling|MPI-2.2]], [[versions/v30/sections/inquiry#Error Handling|MPI-3.0]], [[versions/v31/sections/inquiry#Error Handling|MPI-3.1]], [[versions/v40/sections/inquiry#Error Handling|MPI-4.0]], [[versions/v41/sections/inquiry#Error Handling|MPI-4.1]], [[versions/v50/sections/inquiry#Error Handling|MPI-5.0]]

Heading by release: MPI-1.3: “Error handling”; MPI-2.1: “Error Handling”; MPI-2.2: “Error Handling”; MPI-3.0: “Error Handling”; MPI-3.1: “Error Handling”; MPI-4.0: “Error Handling”; MPI-4.1: “Error Handling”; MPI-5.0: “Error Handling”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~A user can associate an error handler with a communicator. The specified error handling routine will be used for any MPI exception that occurs during a call to MPI for a communication with this communicator. MPI calls that are not related to any communicator are considered to be attached to the communicator MPI_COMM_WORLD. The attachment of error handlers to communicators is purely local: different processes may attach different error handlers to the same communicator.~~

~~A newly created communicator inherits the error handler that is associated with the “parent” communicator. In particular, the user can specify a “global” error handler for all communicators by associating this handler with the communicator MPI_COMM_WORLD immediately after initialization.~~

==A user can associate error handlers to three types of objects: communicators, windows, and files. The specified error handling routine will be used for any MPI exception that occurs during a call to MPI for the respective object. MPI calls that are not related to any objects are considered to be attached to the communicator MPI_COMM_WORLD. The attachment of error handlers to objects is purely local: different processes may attach different error handlers to corresponding objects.==

~~An MPI error handler is an opaque object, which is accessed by a handle. MPI calls are provided to create new error handlers, to associate error handlers with communicators, and to test which error handler is associated with a communicator.~~

~~![[versions/v21/API/MPI_ERRHANDLER_CREATE]]~~

~~Register the user routine `function` for use as an MPI exception handler. Returns in `errhandler` a handle to the registered exception handler.~~

~~In the C language,~~

~~the user routine should be a C function of type MPI_Handler_function, which is defined as:~~

~~    typedef void (MPI_Handler_function)(MPI_Comm *, int *, ...);~~

~~The first argument is the communicator in use.~~

~~The second is the error code to be returned by the MPI routine that raised the error. If the routine would have returned MPI_ERR_IN_STATUS, it is the error code returned in the status for the request that caused the error handler to be invoked.~~

~~The remaining arguments are “`stdargs`” arguments whose number and meaning is implementation-dependent. An implementation should clearly document these arguments. Addresses are used so that the handler may be written in Fortran.~~

~~In the Fortran language, the user routine should be of the form:~~

~~    SUBROUTINE HANDLER_FUNCTION(COMM, ERROR_CODE, .....)        INTEGER COMM, ERROR_CODE~~

~~> [!note] Advice to users~~

~~> Users are discouraged from using a Fortran [[HANDLER_FUNCTION]] since the routine expects a variable number of arguments. Some Fortran systems may allow this but some may fail to give the correct result or compile/link this code. Thus, it will not, in general, be possible to create portable code with a Fortran [[HANDLER_FUNCTION]] .~~

~~> [!tip] Rationale~~

~~> The variable argument list is provided because it provides an ANSI-standard hook for providing additional information to the error handler; without this hook, ANSI C prohibits additional arguments.~~

~~![[versions/v21/API/MPI_ERRHANDLER_SET]]~~

~~Associates the new error handler `errorhandler` with communicator `comm` at the calling process. Note that an error handler is always associated with the communicator.~~

~~![[versions/v21/API/MPI_ERRHANDLER_GET]]~~

~~Returns in `errhandler` (a handle to) the error handler that is currently associated with communicator `comm`.~~

~~Example: A library function may register at its entry point the current error handler for a communicator, set its own private error handler for this communicator, and restore before exiting the previous error handler.~~

~~![[versions/v21/API/MPI_ERRHANDLER_FREE]]~~

~~Marks the error handler associated with `errhandler` for deallocation and sets `errhandler` to MPI_ERRHANDLER_NULL. The error handler will be deallocated after all communicators associated with it have been deallocated.~~

~~![[versions/v21/API/MPI_ERROR_STRING]]~~

~~Returns the error string associated with an error code~~

~~or class.~~

~~The argument `string` must represent storage that is at least MPI_MAX_ERROR_STRING characters long.~~

~~The number of characters actually written is returned in the output argument, `resultlen`.~~

~~> [!tip] Rationale~~

~~> The form of this function was chosen to make the Fortran and C bindings similar. A version that returns a pointer to a string has two difficulties. First, the return string must be statically allocated and different for each error message (allowing the pointers returned by successive calls to MPI_ERROR_STRING to point to the correct message). Second, in Fortran, a function declared as returning CHARACTER\*(\*) can not be referenced in, for example, a PRINT statement.~~

==An MPI error handler is an opaque object, which is accessed by a handle. MPI calls are provided to create new error handlers, to associate error==

==handlers with objects, and to test which error handler is associated with an object.==

==C and C++ have==

==distinct typedefs for user defined error handling callback functions that==

==accept==

==communicator, file, and window arguments.==

==In Fortran there are three user routines.==

==An error handler object is created by a call to==

==`MPI_XXX_CREATE_ERRHANDLER(function, errhandler)` , where XXX is, respectively, COMM, WIN, or FILE.==

==An error handler is attached to a communicator, window, or file==

==by a call to `MPI_XXX_SET_ERRHANDLER` . The error handler must be either a predefined error handler, or an error handler that was created by a call to `MPI_XXX_CREATE_ERRHANDLER` , with matching XXX.==

==The predefined error handlers MPI_ERRORS_RETURN and MPI_ERRORS_ARE_FATAL can be attached to communicators, windows, and files. In C++, the predefined error handler MPI::ERRORS_THROW_EXCEPTIONS can also be attached to communicators, windows, and files.==

==The error handler currently associated with a communicator, window, or file can be retrieved by a call to `MPI_XXX_GET_ERRHANDLER` .==

==The MPI function [[versions/v21/API/MPI_ERRHANDLER_FREE|MPI_ERRHANDLER_FREE]] can be used to free an error handler that was created by a call to `MPI_XXX_CREATE_ERRHANDLER` .==

==`MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER` behave as if a new error handler object is created. That is, once the error handler is no longer needed, [[versions/v21/API/MPI_ERRHANDLER_FREE|MPI_ERRHANDLER_FREE]] should be called with the error handler returned from [[versions/v21/API/MPI_ERRHANDLER_GET|MPI_ERRHANDLER_GET]] or `MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER` to mark the error handler for deallocation. This provides behavior similar to that of [[versions/v21/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] and [[versions/v21/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] .==

==> [!warning] Advice to implementors==

==> High-quality implementation should raise an error when an error handler that > > was created by a call to `MPI_XXX_CREATE_ERRHANDLER` is attached to an object of the wrong type with a call to `MPI_YYY_SET_ERRHANDLER` . To do so, it is necessary to maintain, with each error handler, information on the typedef of the associated user function.==

==The syntax for these calls is given below.==

### MPI-2.1 → MPI-2.2  (6 changed paragraphs)

A user can associate error handlers to three types of objects: communicators, windows, and files. The specified error handling routine will be used for any MPI exception that occurs during a call to MPI for the respective object. MPI calls that are not related to any objects are considered to be attached to the communicator ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.== The attachment of error handlers to objects is purely local: different processes may attach different error handlers to corresponding objects.

~~MPI_ERRORS_ARE_FATAL~~ ==`MPI_ERRORS_ARE_FATAL`== The handler, when called, causes the program to abort on all executing processes. This has the same effect as if [[versions/v22/API/MPI_ABORT|MPI_ABORT]] was called by the process that invoked the handler.

~~MPI_ERRORS_RETURN~~ ==`MPI_ERRORS_RETURN`== The handler has no effect

The error handler ~~MPI_ERRORS_ARE_FATAL~~ ==`MPI_ERRORS_ARE_FATAL`== is associated by default with ~~MPI_COMM- \_WORLD~~ ==`MPI_COMM-` `_WORLD`== after initialization. Thus, if the user chooses not to control error handling, every error that MPI handles is treated as fatal. Since (almost) all MPI calls return an error code, a user may choose to handle errors in its main code, by testing the return code of MPI calls and executing a suitable recovery code when the call was not successful. In this case, the error handler ~~MPI_ERRORS_RETURN~~ ==`MPI_ERRORS_RETURN`== will be used. Usually it is more convenient and more efficient not to test for errors after each MPI call, and have such error handled by a non trivial MPI error handler.

After an error is detected, the state of MPI is undefined. That is, using a user-defined error handler, or ~~MPI_ERRORS_RETURN,~~ ==`MPI_ERRORS_RETURN`,== does *not* necessarily allow the user to continue to use MPI after an error is detected. The purpose of these error handlers is to allow a user to issue user-defined error messages and to take actions unrelated to MPI (such as flushing I/O buffers) before a program exits. An MPI implementation is free to allow MPI to continue after an error but is not required to do so.

`MPI_XXX_CREATE_ERRHANDLER(function, errhandler)` , where ~~XXX~~ ==`XXX`== is, respectively, ~~COMM, WIN,~~ ==`COMM`, `WIN`,== or ~~FILE.~~ ==`FILE`.==

by a call to `MPI_XXX_SET_ERRHANDLER` . The error handler must be either a predefined error handler, or an error handler that was created by a call to `MPI_XXX_CREATE_ERRHANDLER` , with matching ~~XXX.~~ ==`XXX`.==

The predefined error handlers ~~MPI_ERRORS_RETURN~~ ==`MPI_ERRORS_RETURN`== and ~~MPI_ERRORS_ARE_FATAL~~ ==`MPI_ERRORS_ARE_FATAL`== can be attached to communicators, windows, and files. In C++, the predefined error handler ~~MPI::ERRORS_THROW_EXCEPTIONS~~ ==`MPI::ERRORS_THROW_EXCEPTIONS`== can also be attached to communicators, windows, and files.

~~`MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER`~~ ==`MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER`== behave as if a new error handler object is created. That is, once the error handler is no longer needed, [[versions/v22/API/MPI_ERRHANDLER_FREE|MPI_ERRHANDLER_FREE]] should be called with the error handler returned from [[versions/v22/API/MPI_ERRHANDLER_GET|MPI_ERRHANDLER_GET]] or ~~`MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER`~~ ==`MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER`== to mark the error handler for deallocation. This provides behavior similar to that of [[versions/v22/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] and [[versions/v22/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] .

### MPI-2.2 → MPI-3.0  (8 changed paragraphs)

~~`MPI_ERRORS_RETURN`   The handler has no effect~~

~~other than returning the error code to the user.~~

==`MPI_ERRORS_RETURN`   The handler has no effect other than returning the error code to the user.==

The error handler `MPI_ERRORS_ARE_FATAL` is associated by default with `MPI_COMM-` `_WORLD` after initialization. Thus, if the user chooses not to control error handling, every error that MPI handles is treated as fatal. Since (almost) all MPI calls return an error code, a user may choose to handle errors in its main code, by testing the return code of MPI calls and executing a suitable recovery code when the call was not successful. In this case, the error handler `MPI_ERRORS_RETURN` will be used. Usually it is more convenient and more efficient not to test for errors after each MPI call, and have such error handled by a ~~non trivial~~ ==non-trivial== MPI error handler.

> A ~~good quality~~ ==high-quality== implementation will, to the greatest possible extent, circumscribe the impact of an error, so that normal processing can continue after an error handler was invoked. The implementation documentation will provide information on the possible effect of each class of errors.

~~handlers with objects, and to test which error handler is associated with an object.~~

~~C and C++ have~~

~~distinct typedefs for user defined error handling callback functions that~~

~~accept~~

~~communicator, file, and window arguments.~~

~~In Fortran there are three user routines.~~

==handlers with objects, and to test which error handler is associated with an object. C has distinct typedefs for user defined error handling callback functions that==

==accept communicator, file, and window arguments. In Fortran there are three user routines.==

~~`MPI_XXX_CREATE_ERRHANDLER(function, errhandler)`~~ ==`MPI_XXX_CREATE_ERRHANDLER`== , where `XXX` is, respectively, `COMM`, `WIN`, or `FILE`.

~~by a call to `MPI_XXX_SET_ERRHANDLER` . The error handler must be either a predefined error handler, or an error handler that was created by a call to `MPI_XXX_CREATE_ERRHANDLER` , with matching `XXX`.~~

~~The predefined error handlers `MPI_ERRORS_RETURN` and `MPI_ERRORS_ARE_FATAL` can be attached to communicators, windows, and files. In C++, the predefined error handler `MPI::ERRORS_THROW_EXCEPTIONS` can also be attached to communicators, windows, and files.~~

==by a call to `MPI_XXX_SET_ERRHANDLER` . The error handler must be either a predefined error handler, or an error handler that was created by a call to `MPI_XXX_CREATE_ERRHANDLER` , with matching `XXX`. The predefined error handlers `MPI_ERRORS_RETURN` and `MPI_ERRORS_ARE_FATAL` can be attached to communicators, windows, and files.==

`MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER` behave as if a new error handler object is created. That is, once the error handler is no longer needed, [[versions/v30/API/MPI_ERRHANDLER_FREE|MPI_ERRHANDLER_FREE]] should be called with the error handler returned from ~~[[versions/v22/API/MPI_ERRHANDLER_GET|MPI_ERRHANDLER_GET]] or~~ `MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER` to mark the error handler for deallocation. This provides behavior similar to that of [[versions/v30/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] and [[versions/v30/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] .

> High-quality ~~implementation~~ ==implementations== should raise an error when an error handler that > > was created by a call to `MPI_XXX_CREATE_ERRHANDLER` is attached to an object of the wrong type with a call to `MPI_YYY_SET_ERRHANDLER` . To do so, it is necessary to maintain, with each error handler, information on the typedef of the associated user function.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~An MPI error handler is an opaque object, which is accessed by a handle. MPI calls are provided to create new error handlers, to associate error~~

~~handlers with objects, and to test which error handler is associated with an object. C has distinct typedefs for user defined error handling callback functions that~~

~~accept communicator, file, and window arguments. In Fortran there are three user routines.~~

==An MPI error handler is an opaque object, which is accessed by a handle. MPI calls are provided to create new error handlers, to associate error handlers with objects, and to test which error handler is associated with an object. C has distinct typedefs for user defined error handling callback functions that accept communicator, file, and window arguments. In Fortran there are three user routines.==

### MPI-3.1 → MPI-4.0  (7 changed paragraphs)

An MPI implementation ~~cannot~~ ==may be unable== or ~~may~~ choose not to handle some ~~errors~~ ==failures== that occur during MPI calls. These can include ~~errors~~ ==failures== that generate exceptions or traps, such as floating point errors or access violations. The set of ~~errors~~ ==failures== that are handled by MPI is implementation-dependent. Each such ==failure causes an== error ~~generates an **MPI exception**.~~ ==to be raised.==

The above text takes precedence over any text on error handling within this document. Specifically, text that states that errors *will* be handled should be read as *may* be handled. ==More background information about how MPI treats errors can be found in Section [[versions/v40/sections/terms#Error Handling|Error Handling]] .==

A user can associate error handlers to ~~three~~ ==four== types of objects: communicators, windows, ==files,== and ~~files.~~ ==sessions.== The specified error handling routine will be used for any ~~MPI exception~~ ==error== that occurs during a call to MPI for the respective object. MPI calls that are not related to any ==MPI== objects are considered to be attached to the communicator ~~`MPI_COMM_WORLD`.~~ ==`MPI_COMM_SELF` when using the World Model (see [[versions/v40/sections/dynamic#The World Model|The World Model]] ). When `MPI_COMM_SELF` is not initialized (i.e., before [[versions/v40/API/MPI_INIT|MPI_INIT]] / [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , after [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] , or when using the Sessions Model exclusively) the error raises the initial error handler (set during the launch operation, see [[versions/v40/sections/dynamic#Reserved Keys|Reserved Keys]] ).== The attachment of error handlers to objects is purely local: different processes may attach different error handlers to corresponding objects.

~~`MPI_ERRORS_ARE_FATAL`   The handler, when called, causes the program to abort on all executing processes. This has the same effect as if [[versions/v40/API/MPI_ABORT|MPI_ABORT]] was called by the process that invoked the handler.~~

==`MPI_ERRORS_ARE_FATAL`   The handler, when called, causes the program to abort all connected MPI processes. This is similar to calling [[versions/v40/API/MPI_ABORT|MPI_ABORT]] using a communicator containing all connected processes with an implementation-specific value as the `errorcode` argument.==

==`MPI_ERRORS_ABORT`   The handler, when called, is invoked on a communicator in a manner similar to calling [[versions/v40/API/MPI_ABORT|MPI_ABORT]] on that communicator. If the error handler is invoked on an window or file, it is similar to calling [[versions/v40/API/MPI_ABORT|MPI_ABORT]] using a communicator containing the group of MPI processes associated with the window or file, respectively. If the error handler is invoked on a session, the operation aborts only the local MPI process. In all cases, the value that would be provided as the `errorcode` argument to [[versions/v40/API/MPI_ABORT|MPI_ABORT]] is implementation-specific.==

==> [!warning] Advice to implementors==

==> The implementation-specific error information resulting from `MPI_ERRORS_ARE_FATAL` and `MPI_ERRORS_ABORT` provided to the invoking environment should be meaningful to the end-user, for example a predefined error class.==

~~The error handler `MPI_ERRORS_ARE_FATAL` is associated by default with `MPI_COMM-` `_WORLD` after initialization. Thus, if the user chooses not to control error handling, every error that MPI handles is treated as fatal. Since (almost) all MPI calls return an error code, a user may choose to handle errors in its main code, by testing the return code of MPI calls and executing a suitable recovery code when the call was not successful. In this case, the error handler `MPI_ERRORS_RETURN` will be used. Usually it is more convenient and more efficient not to test for errors after each MPI call, and have such error handled by a non-trivial MPI error handler.~~

~~After an error is detected, the state of MPI is undefined. That is, using a user-defined error handler, or `MPI_ERRORS_RETURN`, does *not* necessarily allow the user to continue to use MPI after an error is detected. The purpose of these error handlers is to allow a user to issue user-defined error messages and to take actions unrelated to MPI (such as flushing I/O buffers) before a program exits. An MPI implementation is free to allow MPI to continue after an error but is not required to do so.~~

==Unless otherwise requested, the error handler `MPI_ERRORS_ARE_FATAL` is set as the default initial error handler and associated with predefined communicators. Thus, if the user chooses not to control error handling, every error that MPI handles is treated as fatal. Since (almost) all MPI calls return an error code, a user may choose to handle errors in its main code, by testing the return code of MPI calls and executing a suitable recovery code when the call was not successful. In this case, the error handler `MPI_ERRORS_RETURN` will be used. Usually it is more convenient and more efficient not to test for errors after each MPI call, and have such error handled by a nontrivial MPI error handler. Note that unlike predefined communicators, windows and files do not inherit from the initial error handler, as defined in Sections [[versions/v40/sections/one-side#Error Handling|Error Handling]] and [[versions/v40/sections/io#I/O Error Handling|I/O Error Handling]] respectively.==

==When an error is raised, MPI will provide the user information about that error using an error code. Some errors might prevent MPI from completing further API calls successfully and those functions will continue to report errors until the cause of the error is corrected or the user terminates the application. The user can make the determination of whether or not to attempt to continue when handling such an error.==

==> [!note] Advice to users==

==> For example, users may be unable to correct errors corresponding to some error classes, such as `MPI_ERR_INTERN`. Such errors may cause subsequent MPI calls to complete in error.==

> A high-quality implementation will, to the greatest possible extent, circumscribe the impact of an error, so that normal processing can continue after an error handler was invoked. The implementation documentation will provide information on the possible effect of each class of ~~errors.~~ ==errors and available recovery actions.==

An MPI error handler is an opaque object, which is accessed by a handle. MPI calls are provided to create new error handlers, to associate error handlers with objects, and to test which error handler is associated with an object. C has distinct typedefs for user defined error handling callback functions that accept communicator, file, ==window,== and ~~window~~ ==session== arguments. In Fortran there are ~~three~~ ==four== user routines.

`MPI_XXX_CREATE_ERRHANDLER` , where `XXX` is, respectively, ~~`COMM`, `WIN`,~~ ==[[COMM]] , [[WIN]] , [[FILE]] ,== or ~~`FILE`.~~ ==[[SESSION]] .==

An error handler is attached to a communicator, window, ==file,== or ~~file~~ ==session==

by a call to `MPI_XXX_SET_ERRHANDLER` . The error handler must be either a predefined error handler, or an error handler that was created by a call to `MPI_XXX_CREATE_ERRHANDLER` , with matching ~~`XXX`.~~ ==`XXX` . An error handler can also be attached to a session using the `errorhandler` argument to [[versions/v40/API/MPI_SESSION_INIT|MPI_SESSION_INIT]] .== The predefined error handlers `MPI_ERRORS_RETURN` and `MPI_ERRORS_ARE_FATAL` can be attached to communicators, windows, ~~and files.~~ ==files, or sessions.==

The error handler currently associated with a communicator, window, ==file,== or ~~file~~ ==session== can be retrieved by a call to `MPI_XXX_GET_ERRHANDLER` .

~~`MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER`~~ ==`MPI_XXX_GET_ERRHANDLER`== behave as if a new error handler object is created. That is, once the error handler is no longer needed, [[versions/v40/API/MPI_ERRHANDLER_FREE|MPI_ERRHANDLER_FREE]] should be called with the error handler returned from ~~`MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER`~~ ==`MPI_XXX_GET_ERRHANDLER`== to mark the error handler for deallocation. This provides behavior similar to that of [[versions/v40/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] and [[versions/v40/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] .

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~A user can associate error handlers to four types of objects: communicators, windows, files, and sessions. The specified error handling routine will be used for any error that occurs during a call to MPI for the respective object. MPI calls that are not related to any MPI objects are considered to be attached to the communicator `MPI_COMM_SELF` when using the World Model (see [[versions/v41/sections/dynamic#The World Model|The World Model]] ). When `MPI_COMM_SELF` is not initialized (i.e., before [[versions/v41/API/MPI_INIT|MPI_INIT]] / [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , after [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , or when using the Sessions Model exclusively) the error raises the initial error handler (set during the launch operation, see [[versions/v41/sections/dynamic#Reserved Keys|Reserved Keys]] ). The attachment of error handlers to objects is purely local: different processes may attach different error handlers to corresponding objects.~~

==*Figure: Diagram for deciding which error handler is invoked.*==

==A user can associate error handlers to four types of objects: communicators, windows, files, and sessions. The specified error handling routine will be used for any error that occurs during an MPI procedure or an operation that refers to the respective object.==

==Figure [[versions/v41/sections/inquiry#Error Handling|Error Handling]] presents a diagram of the error handler that is invoked in different situations. When the MPI procedure or operation refers to a communicator, window, or file, the error handler for that object will be invoked; otherwise, if the procedure or operation refers to a session, the error handler for the session will be invoked.==

==Some MPI procedures have indirect references to these objects. For example, in a procedure that takes a request handle as a parameter, an error during the corresponding operation is raised on the communicator, window, or file on which the request has been initialized. Similarly, a group contains a reference to the session from which it was derived, and procedures on groups invoke the error handler from that session. The referenced object may have been destroyed before an error is raised (e.g., a procedure on a group derived from a session that has been finalized), in this case, the associated error handler for the object cannot be obtained.==

==MPI procedures that do not refer to an MPI object from which the associated error handler can be obtained, directly or indirectly, are considered to be attached to the communicator `MPI_COMM_SELF` when using the World Model (see [[versions/v41/sections/dynamic#The World Model|The World Model]] ). When `MPI_COMM_SELF` is not initialized (i.e., before [[versions/v41/API/MPI_INIT|MPI_INIT]] / [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , after [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , or when using the Sessions Model exclusively) the error raises the initial error handler (set during the launch operation, see [[versions/v41/sections/dynamic#Reserved Keys|Reserved Keys]] ). The attachment of error handlers to objects is purely local: different processes may attach different error handlers to corresponding objects.==

~~`MPI_ERRORS_ARE_FATAL`~~ ==`MPI_ERRORS_ARE_FATAL`:== The handler, when called, causes the program to abort all connected MPI processes. This is similar to calling [[versions/v41/API/MPI_ABORT|MPI_ABORT]] using a communicator containing all connected processes with an implementation-specific value as the `errorcode` argument.

~~`MPI_ERRORS_ABORT`~~ ==`MPI_ERRORS_ABORT`:== The handler, when called, is invoked on a communicator in a manner similar to calling [[versions/v41/API/MPI_ABORT|MPI_ABORT]] on that communicator. If the error handler is invoked on an window or file, it is similar to calling [[versions/v41/API/MPI_ABORT|MPI_ABORT]] using a communicator containing the group of MPI processes associated with the window or file, respectively. If the error handler is invoked on a session, the operation aborts only the local MPI process. In all cases, the value that would be provided as the `errorcode` argument to [[versions/v41/API/MPI_ABORT|MPI_ABORT]] is implementation-specific.

~~`MPI_ERRORS_RETURN`~~ ==`MPI_ERRORS_RETURN`:== The handler has no effect other than returning the error code to the user.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

*Figure: Diagram for deciding which error handler is ~~invoked.*~~ ==invoked depending on the MPI objects associated with the operation and whether the Sessions Model or the World Model is used.*==

MPI procedures that do not refer to an MPI object from which the associated error handler can be obtained, directly or indirectly, are considered to be attached to the communicator `MPI_COMM_SELF` when using the World Model (see [[versions/v50/sections/dynamic#The World Model|The World Model]] ). When `MPI_COMM_SELF` is not initialized (i.e., before [[versions/v50/API/MPI_INIT|MPI_INIT]] / [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , after [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] , or when using the Sessions Model exclusively) ~~the~~ ==raising an== error ~~raises~~ ==invokes== the initial error handler (set during the launch operation, see [[versions/v50/sections/dynamic#Reserved Keys|Reserved Keys]] ). The attachment of error handlers to objects is purely local: different processes may attach different error handlers to corresponding objects.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/inquiry#Error handling]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Error Handling]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Error Handling]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Error Handling]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Error Handling]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Error Handling]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Error Handling]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Error Handling]]

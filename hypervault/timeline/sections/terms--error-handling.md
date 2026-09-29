---
title: "Error Handling"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Error Handling

Chapter **terms** · in [[versions/v13/sections/terms#Error Handling|MPI-1.3]], [[versions/v20/sections/terms#Error Handling|MPI-2.0]], [[versions/v21/sections/terms#Error Handling|MPI-2.1]], [[versions/v22/sections/terms#Error Handling|MPI-2.2]], [[versions/v30/sections/terms#Error Handling|MPI-3.0]], [[versions/v31/sections/terms#Error Handling|MPI-3.1]], [[versions/v40/sections/terms#Error Handling|MPI-4.0]], [[versions/v41/sections/terms#Error Handling|MPI-4.1]], [[versions/v50/sections/terms#Error Handling|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~MPI provides the user with reliable message transmission. A message sent is always received correctly, and the user does not need to check for transmission errors, time-outs, or other error conditions. In other words, MPI does not provide mechanisms for dealing with failures in the communication system. If the MPI implementation is built on an unreliable underlying mechanism, then it is the job of the implementor of the MPI subsystem to insulate the user from this unreliability, or to reflect unrecoverable errors as failures. Whenever possible, such failures will be reflected as errors in the relevant communication call. Similarly, MPI itself provides no mechanisms for handling processor failures. The error handling facilities described in section [[versions/v21/sections/inquiry#Error handling|Error handling]] can be used to restrict the scope of an unrecoverable error, or design error recovery at the application level.~~

~~Of course, MPI programs may still be erroneous. A **program error** can occur when an MPI call is called with an incorrect argument (non-existing destination in a send operation, buffer too small in a receive operation, etc.) This type of error would occur in any implementation. In addition, a **resource error** may occur when a program exceeds the amount of available system resources (number of pending messages, system buffers, etc.). The occurrence of this type of error depends on the amount of available resources in the system and the resource allocation mechanism used; this may differ from system to system. A high-quality implementation will provide generous limits on the important resources so as to alleviate the portability problem this represents.~~

~~Almost all MPI calls return a code that indicates successful completion of the operation. Whenever possible, MPI calls return an error code if an error occurred during the call.~~

~~In certain circumstances, when the MPI function may complete several distinct operations, and therefore may generate several independent errors, the MPI function may return multiple error codes.~~

~~By default, an error detected during the execution of the MPI library causes the parallel computation to abort. However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described in section [[versions/v21/sections/inquiry#Error handling|Error handling]] .~~

==MPI provides the user with reliable message transmission. A message sent is always received correctly, and the user does not need to check for transmission errors, time-outs, or other error conditions. In other words, MPI does not provide mechanisms for dealing with failures in the communication system. If the MPI implementation is built on an unreliable underlying mechanism, then it is the job of the implementor of the MPI subsystem to insulate the user from this unreliability, or to reflect unrecoverable errors as failures. Whenever possible, such failures will be reflected as errors in the relevant communication call. Similarly, MPI itself provides no mechanisms for handling processor failures.==

==Of course, MPI programs may still be erroneous. A **program error** can occur when an MPI call is made with an incorrect argument (non-existing destination in a send operation, buffer too small in a receive operation, etc.). This type of error would occur in any implementation. In addition, a **resource error** may occur when a program exceeds the amount of available system resources (number of pending messages, system buffers, etc.). The occurrence of this type of error depends on the amount of available resources in the system and the resource allocation mechanism used; this may differ from system to system. A high-quality implementation will provide generous limits on the important resources so as to alleviate the portability problem this represents.==

==In C and Fortran, almost all MPI calls return a code that indicates successful completion of the operation. Whenever possible, MPI calls return an error code if an error occurred during the call. By default, an error detected during the execution of the MPI library causes the parallel computation to abort,==

==except for file operations.==

==However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described==

==in Section [[versions/v21/sections/inquiry#Error Handling|Error Handling]] .==

==The return values of C++ functions are not error codes.==

==If the default error handler has been set to MPI::ERRORS_THROW_EXCEPTIONS, the C++ exception mechanism is used to signal an error by throwing an==

==`MPI::Exception`==

==object.==

==See also Section [[versions/v21/sections/binding#Exceptions|Exceptions]] on page [[versions/v21/sections/binding#Exceptions|Exceptions]] .==

~~Another subtle issue arises because of the nature of asynchronous communications: MPI calls may initiate operations that continue asynchronously after the call returned. Thus, the operation may return with a code indicating successful completion, yet later cause an error exception to be raised. If there is a subsequent call that relates to the same operation (e.g., a call that verifies that an asynchronous operation has completed) then the error argument associated with this call will be used to indicate the nature of the error. In a few cases, the error may occur after all calls that relate to the operation have completed, so that no error value can be used to indicate the nature of the error (e.g., an error in a send with the ready mode). Such an error must be treated as fatal, since information cannot be returned for the user to recover from it.~~

~~This document does not specify the state of a computation after an erroneous MPI call has occurred. The desired behavior is that a relevant error code be returned, and the effect of the error be localized to the greatest possible extent. E.g., it is highly desireable that an erroneous receive call will not cause any part of the receiver’s memory to be overwritten, beyond the area specified for receiving the message.~~

~~Implementations may go beyond this document in supporting in a meaningful manner MPI calls that are defined here to be erroneous. For example, MPI specifies strict type matching rules between matching send and receive operations: it is erroneous to send a floating point variable and receive an integer. Implementations may go beyond these type matching rules, and provide automatic type conversion in such situations. It will be helpful to generate warnings for such nonconforming behavior.~~

==Another subtle issue arises because of the nature of asynchronous communications: MPI calls may initiate operations that continue asynchronously after the call returned. Thus, the operation may return with a code indicating successful completion, yet later cause an error exception to be raised. If there is a subsequent call that relates to the same operation (e.g., a call that verifies that an asynchronous operation has completed) then the error argument associated with this call will be used to indicate the nature of the error. In a few cases, the error may occur after all calls that relate to the operation have completed, so that no error value can be used to indicate the nature of the error (e.g., an error on the receiver in a send with the ready mode). Such an error must be treated as fatal, since information cannot be returned for the user to recover from it.==

==This document does not specify the state of a computation after an erroneous MPI call has occurred. The desired behavior is that a relevant error code be returned, and the effect of the error be localized to the greatest possible extent. E.g., it is highly desirable that an erroneous receive call will not cause any part of the receiver’s memory to be overwritten, beyond the area specified for receiving the message.==

==Implementations may go beyond this document in supporting in a meaningful manner MPI calls that are defined here to be erroneous. For example, MPI specifies strict type matching rules between matching send and receive operations: it is erroneous to send a floating point variable and receive an integer. Implementations may go beyond these type matching rules, and provide automatic type conversion in such situations. It will be helpful to generate warnings for such non-conforming behavior.==

==MPI==

==defines a way for users to create new error codes as defined in Section [[versions/v21/sections/inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] .==

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

~~However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described in Chapter 7 of the MPI-1 document~~

~~and in Section [[misc-sec-errhandler]] of this document. The return values of C++ functions are not error codes.~~

==However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described==

==in Section [[versions/v21/sections/inquiry#Error Handling|Error Handling]] .==

==The return values of C++ functions are not error codes.==

==See also Section [[versions/v21/sections/binding#Exceptions|Exceptions]] on page [[versions/v21/sections/binding#Exceptions|Exceptions]] .==

~~MPI-2 defines a way for users to create new error codes as defined in Section [[versions/v21/sections/ei#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] .~~

==MPI==

==defines a way for users to create new error codes as defined in Section [[versions/v21/sections/inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] .==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

If the default error handler has been set to ~~MPI::ERRORS_THROW_EXCEPTIONS,~~ ==`MPI::ERRORS_THROW_EXCEPTIONS`,== the C++ exception mechanism is used to signal an error by throwing an

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~In C and Fortran, almost all MPI calls return a code that indicates successful completion of the operation. Whenever possible, MPI calls return an error code if an error occurred during the call. By default, an error detected during the execution of the MPI library causes the parallel computation to abort,~~

~~except for file operations.~~

~~However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described~~

==In C and Fortran, almost all MPI calls return a code that indicates successful completion of the operation. Whenever possible, MPI calls return an error code if an error occurred during the call. By default, an error detected during the execution of the MPI library causes the parallel computation to abort, except for file operations. However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described==

~~The return values of C++ functions are not error codes.~~

~~If the default error handler has been set to `MPI::ERRORS_THROW_EXCEPTIONS`, the C++ exception mechanism is used to signal an error by throwing an~~

~~`MPI::Exception`~~

~~object.~~

~~See also Section [[versions/v30/sections/binding#Exceptions|Exceptions]] on page [[versions/v30/sections/binding#Exceptions|Exceptions]] .~~

~~MPI~~

~~defines a way for users to create new error codes as defined in Section [[versions/v30/sections/inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] .~~

==MPI defines a way for users to create new error codes as defined in Section [[versions/v30/sections/inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] .==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~In C and Fortran, almost all MPI calls return a code that indicates successful completion of the operation. Whenever possible, MPI calls return an error code if an error occurred during the call. By default, an error detected during the execution of the MPI library causes the parallel computation to abort, except for file operations. However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described~~

~~in Section [[versions/v31/sections/inquiry#Error Handling|Error Handling]] .~~

==In C and Fortran, almost all MPI calls return a code that indicates successful completion of the operation. Whenever possible, MPI calls return an error code if an error occurred during the call. By default, an error detected during the execution of the MPI library causes the parallel computation to abort, except for file operations. However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described in Section [[versions/v31/sections/inquiry#Error Handling|Error Handling]] .==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

~~MPI provides the user with reliable message transmission. A message sent is always received correctly, and the user does not need to check for transmission errors, time-outs, or other error conditions. In other words, MPI does not provide mechanisms for dealing with failures in the communication system. If the MPI implementation is built on an unreliable underlying mechanism, then it is the job of the implementor of the MPI subsystem to insulate the user from this unreliability, or to reflect unrecoverable errors as failures. Whenever possible, such failures will be reflected as errors in the relevant communication call. Similarly, MPI itself provides no mechanisms for handling processor failures.~~

==MPI provides the user with reliable message transmission. A message sent is always received correctly, and the user does not need to check for transmission errors, time-outs, or other error conditions. In other words, MPI does not provide mechanisms for dealing with **transmission failures** in the communication system. If the MPI implementation is built on an unreliable underlying mechanism, then it is the job of the implementor of the MPI subsystem to insulate the user from this unreliability, and to reflect only unrecoverable transmission failures. Whenever possible, such failures will be reflected as errors in the relevant communication call.==

==Similarly, MPI itself provides no mechanisms for handling MPI **process failures**, that is, when an MPI process unexpectedly and permanently stops communicating (e.g., a software or hardware crash results in an MPI process terminating unexpectedly).==

~~In C and Fortran, almost all MPI calls return a code that indicates successful completion of the operation. Whenever possible, MPI calls return an error code if an error occurred during the call. By default, an error detected during the execution of the MPI library causes the parallel computation to abort, except for file operations. However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by himself or herself. Also, the user may provide his or her own error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described in Section [[versions/v40/sections/inquiry#Error Handling|Error Handling]] .~~

~~Several factors limit the ability of MPI calls to return with meaningful error codes when an error occurs. MPI may not be able to detect some errors; other errors may be too expensive to detect in normal execution mode; finally some errors may be “catastrophic” and may prevent MPI from returning control to the caller in a consistent state.~~

~~Another subtle issue arises because of the nature of asynchronous communications: MPI calls may initiate operations that continue asynchronously after the call returned. Thus, the operation may return with a code indicating successful completion, yet later cause an error exception to be raised. If there is a subsequent call that relates to the same operation (e.g., a call that verifies that an asynchronous operation has completed) then the error argument associated with this call will be used to indicate the nature of the error. In a few cases, the error may occur after all calls that relate to the operation have completed, so that no error value can be used to indicate the nature of the error (e.g., an error on the receiver in a send with the ready mode). Such an error must be treated as fatal, since information cannot be returned for the user to recover from it.~~

==In C and Fortran, almost all MPI calls return a code that indicates successful completion of the operation. Whenever possible, MPI calls return an error code if an error occurred during the call. By default, an error detected during the execution of the MPI library causes the parallel computation to abort, except for file operations. However, MPI provides mechanisms for users to change this default and to handle recoverable errors. The user may specify that no error is fatal, and handle error codes returned by MPI calls by themselves. Also, the user may provide user-defined error-handling routines, which will be invoked whenever an MPI call returns abnormally. The MPI error handling facilities are described in Section [[versions/v40/sections/inquiry#Error Handling|Error Handling]] .==

==Several factors limit the ability of MPI calls to return with meaningful error codes when an error occurs. MPI may not be able to detect some errors; other errors may be too expensive to detect in normal execution mode; some faults (e.g., memory faults) may corrupt the state of the MPI library and its outputs; finally some errors may be “catastrophic” and may prevent MPI from returning control to the caller. On the other hand, some errors may be detected after the associated operation has completed; some errors may not have a communicator, window, or file on which an error may be raised. In such cases, these errors will be raised on the communicator `MPI_COMM_SELF` when using the World Model (see [[versions/v40/sections/dynamic#The World Model|The World Model]] ). When `MPI_COMM_SELF` is not initialized (i.e., before [[versions/v40/API/MPI_INIT|MPI_INIT]] / [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , after [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] , or when using the Sessions Model exclusively) the error raises the **initial error handler** (set during the launch operation, see [[versions/v40/sections/dynamic#Reserved Keys|Reserved Keys]] ).==

==The Sessions Model is described in [[versions/v40/sections/dynamic#The Sessions Model|The Sessions Model]] .==

==An example of such a case arises because of the nature of asynchronous communications: MPI calls may initiate operations that continue asynchronously after the call returned. Thus, the operation may return with a code indicating successful completion, yet later cause an error to be raised. If there is a subsequent call that relates to the same operation (e.g., a call that verifies that an asynchronous operation has completed) then the error argument associated with this call will be used to indicate the nature of the error. In a few cases, the error may occur after all calls that relate to the operation have completed, so that no error value can be used to indicate the nature of the error (e.g., an error on the receiver in a send with the ready mode).==

Implementations may go beyond this document in supporting in a meaningful manner MPI calls that are defined here to be erroneous. For example, MPI specifies strict type matching rules between matching send and receive operations: it is erroneous to send a floating point variable and receive an integer. Implementations may go beyond these type matching rules, and provide automatic type conversion in such situations. It will be helpful to generate warnings for such ~~non-conforming~~ ==nonconforming== behavior.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

Of course, MPI programs may still be erroneous. A **program error** can occur when an MPI call is made with an incorrect argument ~~(non-existing~~ ==(nonexisting== destination in a send operation, buffer too small in a receive operation, etc.). This type of error would occur in any implementation. In addition, a **resource error** may occur when a program exceeds the amount of available system resources (number of pending messages, system buffers, etc.). The occurrence of this type of error depends on the amount of available resources in the system and the resource allocation mechanism used; this may differ from system to system. A high-quality implementation will provide generous limits on the important resources so as to alleviate the portability problem this represents.

~~Several factors limit the ability of MPI calls to return with meaningful error codes when an error occurs. MPI may not be able to detect some errors; other errors may be too expensive to detect in normal execution mode; some faults (e.g., memory faults) may corrupt the state of the MPI library and its outputs; finally some errors may be “catastrophic” and may prevent MPI from returning control to the caller. On the other hand, some errors may be detected after the associated operation has completed; some errors may not have a communicator, window, or file on which an error may be raised. In such cases, these errors will be raised on the communicator `MPI_COMM_SELF` when using the World Model (see [[versions/v41/sections/dynamic#The World Model|The World Model]] ). When `MPI_COMM_SELF` is not initialized (i.e., before [[versions/v41/API/MPI_INIT|MPI_INIT]] / [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , after [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , or when using the Sessions Model exclusively) the error raises the **initial error handler** (set during the launch operation, see [[versions/v41/sections/dynamic#Reserved Keys|Reserved Keys]] ).~~

==Several factors limit the ability of MPI calls to return with meaningful error codes when an error occurs. MPI may not be able to detect some errors; other errors may be too expensive to detect in normal execution mode; some faults (e.g., memory faults) may corrupt the state of the MPI library and its outputs; finally some errors may be “catastrophic” and may prevent MPI from returning control to the caller.==

==In addition, some errors may be detected in operations that do not refer to an MPI object from which the associated error handler can be obtained. Error handler associations are further described in [[versions/v41/sections/inquiry#Error Handling|Error Handling]] . In such cases, these errors will be raised on the communicator `MPI_COMM_SELF` when using the World Model (see [[versions/v41/sections/dynamic#The World Model|The World Model]] ). When `MPI_COMM_SELF` is not initialized (i.e., before [[versions/v41/API/MPI_INIT|MPI_INIT]] / [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , after [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , or when using the Sessions Model exclusively) the error raises the **initial error handler** (set during the launch operation, see [[versions/v41/sections/dynamic#Reserved Keys|Reserved Keys]] ).==

==Lastly, some errors may be detected after the associated operation has completed locally.== An example of such a case arises because of the nature of asynchronous communications: MPI calls may initiate operations that continue asynchronously after the call returned. Thus, the operation may return with a code indicating successful completion, yet later cause an error to be raised. If there is a subsequent call that relates to the same operation (e.g., a call that verifies that an asynchronous operation has completed) then the error argument associated with this call will be used to indicate the nature of the error. In a few cases, the error may occur after all calls that relate to the operation have ~~completed,~~ ==returned,== so that no error value can be used to indicate the nature of the error (e.g., an ~~error~~ ==erroneous program== on the receiver in a send with the ready mode).

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~In addition, some errors may be detected in operations that do not refer to an MPI object from which the associated error handler can be obtained. Error handler associations are further described in [[versions/v50/sections/inquiry#Error Handling|Error Handling]] . In such cases, these errors will be raised on the communicator `MPI_COMM_SELF` when using the World Model (see [[versions/v50/sections/dynamic#The World Model|The World Model]] ). When `MPI_COMM_SELF` is not initialized (i.e., before [[versions/v50/API/MPI_INIT|MPI_INIT]] / [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , after [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] , or when using the Sessions Model exclusively) the error raises the **initial error handler** (set during the launch operation, see [[versions/v50/sections/dynamic#Reserved Keys|Reserved Keys]] ).~~

~~The Sessions Model is described in [[versions/v50/sections/dynamic#The Sessions Model|The Sessions Model]] .~~

==In addition, some errors may be detected in operations that do not refer to an MPI object from which the associated error handler can be obtained. Error handler associations are further described in [[versions/v50/sections/inquiry#Error Handling|Error Handling]] . In such cases, these errors will be raised on the communicator `MPI_COMM_SELF` when using the World Model (see [[versions/v50/sections/dynamic#The World Model|The World Model]] ). When `MPI_COMM_SELF` is not initialized (i.e., before [[versions/v50/API/MPI_INIT|MPI_INIT]] / [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , after [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] , or when using the Sessions Model exclusively) the error raises the **initial error handler** (set during the launch operation, see [[versions/v50/sections/dynamic#Reserved Keys|Reserved Keys]] ) . The Sessions Model is described in [[versions/v50/sections/dynamic#The Sessions Model|The Sessions Model]] .==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Error Handling]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Error Handling]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Error Handling]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Error Handling]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Error Handling]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Error Handling]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Error Handling]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Error Handling]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Error Handling]]

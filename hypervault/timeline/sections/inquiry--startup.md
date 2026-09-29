---
title: "Startup"
chapter: inquiry
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/inquiry]
---

# Startup

Chapter **inquiry** · in [[versions/v13/sections/inquiry#Startup|MPI-1.3]], [[versions/v21/sections/inquiry#Startup|MPI-2.1]], [[versions/v22/sections/inquiry#Startup|MPI-2.2]], [[versions/v30/sections/inquiry#Startup|MPI-3.0]], [[versions/v31/sections/inquiry#Startup|MPI-3.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (10 changed paragraphs)

~~All MPI programs must contain a call to [[versions/v21/API/MPI_INIT|MPI_INIT]] ; this routine must be called before any other MPI routine (apart from `MPI_INITIALIZED`) is called. The version for ANSI C accepts the argc and argv that are provided by the arguments to `main`:~~

==All MPI programs must contain a call to [[versions/v21/API/MPI_INIT|MPI_INIT]] ; this routine must be called before any other MPI routine (apart from==

==[[versions/v21/API/MPI_GET_VERSION|MPI_GET_VERSION]] , [[versions/v21/API/MPI_INITIALIZED|MPI_INITIALIZED]] , and [[versions/v21/API/MPI_FINALIZED|MPI_FINALIZED]] )==

==is called. The version for==

==ISO C==

==accepts the argc and argv that are provided by the arguments to `main`:==

~~An MPI implementation is free to require that the arguments in the C binding must be the arguments to `main`.~~

==Conforming implementations of MPI are required to allow applications to pass `NULL` for both the `argc` and==

==`argv` arguments of `main` in C and C++. In C++, there is an alternative==

==binding for `MPI::Init` that does not have these arguments at all.==

> ~~The command line arguements are provided *to* [[versions/v21/API/MPI_INIT|MPI_Init]]~~ ==In some applications, libraries may be making the call== to ~~allow an MPI implementation~~ ==`MPI_Init`, and may not have access== to ~~use them in initializing~~ ==`argc` and `argv` from `main`. It is anticipated that applications requiring special information about > >== the ~~MPI environment. They are passed~~ ==environment or information supplied== by ~~reference to allow an MPI implementation to *provide* them in environments where the command-line arguments are not provided to `main`.~~ ==`mpiexec` can get that information from environment variables.==

This program is correct, and after the ~~[[versions/v21/API/MPI_FINALIZE|MPI_Finalize]] ,~~ ==`MPI_Finalize`,== it is as if the buffer had been detached.

In this example, ~~[[versions/v21/API/MPI_IPROBE|MPI_Iprobe]]~~ ==`MPI_Iprobe()`== must return a `FALSE` flag. ~~[[versions/v21/API/MPI_TEST_CANCELLED|MPI_Test_cancelled]]~~ ==`MPI_Test_cancelled()`== must return a `TRUE` flag, independent of the relative order of execution of ~~[[versions/v21/API/MPI_CANCEL|MPI_Cancel]]~~ ==`MPI_Cancel()`== in process 0 and ~~[[versions/v21/API/MPI_FINALIZE|MPI_Finalize]]~~ ==`MPI_Finalize()`== in process 1. The ~~[[versions/v21/API/MPI_IPROBE|MPI_Iprobe]]~~ ==`MPI_Iprobe()`== call is there to make sure the implementation knows that the “tag1” message exists at the destination, without being able to claim that the user knows about it.

~~Once [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] returns, no MPI routine (not even [[versions/v21/API/MPI_INIT|MPI_INIT]] ) may be called, except for [[versions/v21/API/MPI_GET_VERSION|MPI_GET_VERSION]] , [[versions/v21/API/MPI_INITIALIZED|MPI_INITIALIZED]] , and the MPI-2 function [[versions/v21/API/MPI_FINALIZED|MPI_FINALIZED]] . Each process must complete any pending communication it initiated before it calls [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] . If the call returns, each process may continue local computations, or exit, without participating in further MPI communication with other processes. [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] is collective on [[MPI_COMM_WORLD]] .~~

==Once [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] returns, no MPI routine (not even [[versions/v21/API/MPI_INIT|MPI_INIT]] ) may be called, except for [[versions/v21/API/MPI_GET_VERSION|MPI_GET_VERSION]] , [[versions/v21/API/MPI_INITIALIZED|MPI_INITIALIZED]] ,==

==and [[versions/v21/API/MPI_FINALIZED|MPI_FINALIZED]] .==

==Each process must complete any pending communication it initiated before it calls [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] . If the call returns, each process may continue local computations, or exit, without participating in further MPI communication with other processes.==

==[[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over MPI_COMM_WORLD; otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in Section [[versions/v21/sections/dynamic#Releasing Connections|Releasing Connections]] on page [[versions/v21/sections/dynamic#Releasing Connections|Releasing Connections]] .==

Although it is not required that all processes return from [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] , it is required that at least process 0 in ~~[[MPI_COMM_WORLD]]~~ ==MPI_COMM_WORLD== return, so that users can know that the MPI portion of the computation is over. In addition, in a POSIX environment, they may desire to supply an exit code for each process that returns from [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] .

~~This routine makes a “best attempt” to abort all tasks in the group of `comm`. This function does not require that the invoking environment take any action with the error code. However, a Unix or POSIX environment should handle this as a `return errorcode` from the main program.~~

==This routine makes a “best attempt” to abort all tasks in the group of `comm`. This function does not require that the invoking environment take any action with the error code. However, a Unix or POSIX environment should handle this==

==as a `return errorcode` from the main program.==

> Whether the errorcode is returned from the executable or from the ==> >== MPI process startup mechanism (e.g., ~~mpiexec),~~ ==`mpiexec`),== is an aspect of quality of the MPI library but not mandatory.

> Where possible, a ~~high quality~~ ==high-quality== implementation will try to return the errorcode from the MPI process startup mechanism (e.g. ~~mpiexec~~ ==`mpiexec`== or singleton init).

### MPI-2.1 → MPI-2.2  (7 changed paragraphs)

~~This routine must be called before any other MPI routine. It must be called at most once; subsequent calls are erroneous (see [[versions/v22/API/MPI_INITIALIZED|MPI_INITIALIZED]] ).~~

~~All MPI programs must contain a call to [[versions/v22/API/MPI_INIT|MPI_INIT]] ; this routine must be called before any other MPI routine (apart from~~

~~[[versions/v22/API/MPI_GET_VERSION|MPI_GET_VERSION]] , [[versions/v22/API/MPI_INITIALIZED|MPI_INITIALIZED]] , and [[versions/v22/API/MPI_FINALIZED|MPI_FINALIZED]] )~~

~~is called. The version for~~

~~ISO C~~

~~accepts the argc and argv that are provided by the arguments to `main`:~~

~~    int main(argc, argv)     int argc;     char **argv;     {         MPI_Init(&argc, &argv);~~

==All MPI programs must contain exactly one call to an MPI initialization routine: [[versions/v22/API/MPI_INIT|MPI_INIT]] or [[versions/v22/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . Subsequent calls to any initialization routines are erroneous. The only MPI functions that may be invoked before the MPI initialization routines are called are [[versions/v22/API/MPI_GET_VERSION|MPI_GET_VERSION]] , [[versions/v22/API/MPI_INITIALIZED|MPI_INITIALIZED]] , and [[versions/v22/API/MPI_FINALIZED|MPI_FINALIZED]] . The version for ISO C accepts the `argc` and `argv` that are provided by the arguments to `main` or `NULL`:==

==    int main(int argc, char **argv)     {         MPI_Init(&argc, &argv);==

The Fortran version takes only ~~IERROR.~~ ==`IERROR`.==

Each process must call [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] before it exits. Unless there has been a call to [[versions/v22/API/MPI_ABORT|MPI_ABORT]] , each process must ensure that all pending ~~non-blocking~~ ==nonblocking== communications are (locally) complete before calling [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] . Further, at the instant at which the last process calls [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] , all pending sends must be matched by a receive, and all pending receives must be matched by a send.

[[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over ~~MPI_COMM_WORLD;~~ ==`MPI_COMM_WORLD`;== otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in Section [[versions/v22/sections/dynamic#Releasing Connections|Releasing Connections]] on page [[versions/v22/sections/dynamic#Releasing Connections|Releasing Connections]] .

Although it is not required that all processes return from [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] , it is required that at least process 0 in ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== return, so that users can know that the MPI portion of the computation is over. In addition, in a POSIX environment, they may desire to supply an exit code for each process that returns from [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] .

It may not be possible for an MPI implementation to abort only the processes represented by `comm` if this is a subset of the processes. In this case, the MPI implementation should attempt to abort all the connected processes but should not abort any unconnected processes. If no processes were spawned, accepted or connected then this has the effect of aborting all the processes associated with ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.==

> The communicator argument is provided to allow for future extensions of MPI to environments with, for example, dynamic process management. In particular, it allows but does not require an MPI implementation to abort a subset of ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.==

### MPI-2.2 → MPI-3.0  (11 changed paragraphs)

All MPI programs must contain exactly one call to an MPI initialization routine: [[versions/v30/API/MPI_INIT|MPI_INIT]] or [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . Subsequent calls to any initialization routines are erroneous. The only MPI functions that may be invoked before the MPI initialization routines are called are [[versions/v30/API/MPI_GET_VERSION|MPI_GET_VERSION]] , ==[[versions/v30/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] ,== [[versions/v30/API/MPI_INITIALIZED|MPI_INITIALIZED]] , ==[[versions/v30/API/MPI_FINALIZED|MPI_FINALIZED]] ,== and ~~[[versions/v30/API/MPI_FINALIZED|MPI_FINALIZED]] .~~ ==any function with the prefix `MPI_T_` (within the constraints for functions with this prefix listed in Section [[versions/v30/sections/tools#Initialization and Finalization|Initialization and Finalization]] ).== The version for ISO C accepts the `argc` and `argv` that are provided by the arguments to `main` or `NULL`:

int main(int argc, char ~~**argv)~~ ==*argv[])== { MPI_Init(&argc, &argv);

MPI_Finalize(); /* see below */ ==return 0;== }

~~`argv` arguments of `main` in C and C++. In C++, there is an alternative~~

~~binding for `MPI::Init` that does not have these arguments at all.~~

~~> [!tip] Rationale~~

~~> In some applications, libraries may be making the call to `MPI_Init`, and may not have access to `argc` and `argv` from `main`. It is anticipated that applications requiring special information about > > the environment or information supplied by `mpiexec` can get that information from environment variables.~~

==`argv` arguments of `main` in C.==

==After MPI is initialized, the application can access information about the execution environment by querying the predefined info object `MPI_INFO_ENV`. The following keys are predefined for this object, corresponding to the arguments of `MPI_COMM_SPAWN` or of `mpiexec`:==

==`command`   Name of program executed.==

==`argv`   Space separated arguments to command.==

==`maxprocs`   Maximum number of MPI processes to start.==

==`soft`   Allowed values for number of processors.==

==`host`   Hostname.==

==`arch`   Architecture name.==

==`wdir`   Working directory of the MPI process.==

==`file`   Value is the name of a file in which additional information is specified.==

==`thread_level`   Requested level of thread support, if requested before the program started execution.==

==Note that all values are strings. Thus, the maximum number of processes is represented by a string such as `‘‘1024’’` and the requested level is represented by a string such as `‘‘MPI_THREAD_SINGLE"`.==

==The info object `MPI_INFO_ENV` need not contain a (key,value) pair for each of these predefined keys; the set of (key,value) pairs provided is implementation-dependent. Implementations may provide additional, implementation specific, (key,value) pairs.==

==In case where the MPI processes were started with [[versions/v30/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] or, equivalently, with a startup mechanism that supports multiple process specifications, then the values stored in the info object `MPI_INFO_ENV` at a process are those values that affect the local MPI process.==

==If MPI is started with a call to==

==        mpiexec -n 5 -arch sun ocean : -n 10 -arch rs6000 atmos==

==Then the first 5 processes will have have in their `MPI_INFO_ENV` object the pairs `(command, ocean)`, `(maxprocs, 5)`, and `(arch, sun)`. The next 10 processes will have in `MPI_INFO_ENV` `(command, atmos)`, `(maxprocs, 10)`, and `(arch, rs600)`==

==> [!note] Advice to users==

==> The values passed in `MPI_INFO_ENV` are the values of the arguments passed to the mechanism that started the MPI execution — not the actual value provided. Thus, the value associated with `maxprocs` is the number of MPI processes requested; it can be larger than the actual number of processes obtained, if the `soft` option was used.==

==> [!warning] Advice to implementors==

==> High-quality implementations will provide a (key,value) pair for each parameter that can be passed to the command that starts an MPI program.==

~~Each process must call [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] before it exits. Unless there has been a call to [[versions/v30/API/MPI_ABORT|MPI_ABORT]] , each process must ensure that all pending nonblocking communications are (locally) complete before calling [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] . Further, at the instant at which the last process calls [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] , all pending sends must be matched by a receive, and all pending receives must be matched by a send.~~

~~For example, the following program is correct:~~

==If an MPI program terminates normally (i.e., not due to a call to [[versions/v30/API/MPI_ABORT|MPI_ABORT]] or an unrecoverable error) then each process must call [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] before it exits.==

==Before an MPI process invokes [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] , the process must perform all MPI calls needed to complete its involvement in MPI communications: It must locally complete all MPI operations that it initiated and must execute matching calls needed to complete MPI communications initiated by other processes. For example, if the process executed a nonblocking send, it must eventually call [[versions/v30/API/MPI_WAIT|MPI_WAIT]] , [[versions/v30/API/MPI_TEST|MPI_TEST]] , [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] , or any derived function; if the process is the target of a send, then it must post the matching receive; if it is part of a group executing a collective operation, then it must have completed its participation in the operation.==

==The call to [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] does not free objects created by MPI calls; these objects are freed using==

==[[MPI_xxx_FREE]] calls.==

==[[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over `MPI_COMM_WORLD`; otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in Section [[versions/v30/sections/dynamic#Releasing Connections|Releasing Connections]] on page [[versions/v30/sections/dynamic#Releasing Connections|Releasing Connections]] .==

==The following examples illustrates these rules==

==The following code is correct==

Without ~~the~~ ==a== matching receive, the program is ~~erroneous:~~ ==erroneous==

~~A successful return from a blocking communication operation or from [[versions/v30/API/MPI_WAIT|MPI_WAIT]] or [[versions/v30/API/MPI_TEST|MPI_TEST]] tells the user that the buffer can be reused and means that the communication is completed by the user, but does not guarantee that the local process has no more work to do. A successful return from [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] with a request handle generated by an [[versions/v30/API/MPI_ISEND|MPI_ISEND]] nullifies the handle but provides no assurance of operation completion. The [[versions/v30/API/MPI_ISEND|MPI_ISEND]] is complete only when it is known by some means that a matching receive has completed. [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] guarantees that all local actions required by communications the user has completed will, in fact, occur before it returns.~~

~~[[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] guarantees nothing about pending communications that have not been completed (completion is assured only by [[versions/v30/API/MPI_WAIT|MPI_WAIT]] , [[versions/v30/API/MPI_TEST|MPI_TEST]] , or [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] combined with some other verification of completion).~~

~~This program is correct:~~

~~    rank 0                          rank 1     =====================================================     ...                             ...     MPI_Isend();                    MPI_Recv();     MPI_Request_free();             MPI_Barrier();     MPI_Barrier();                  MPI_Finalize();     MPI_Finalize();                 exit();     exit();~~

~~This program is erroneous and its behavior is undefined:~~

~~    rank 0                          rank 1     =====================================================     ...                             ...     MPI_Isend();                    MPI_Recv();     MPI_Request_free();             MPI_Finalize();     MPI_Finalize();                 exit();     exit();~~

~~If no [[versions/v30/API/MPI_BUFFER_DETACH|MPI_BUFFER_DETACH]] occurs between an [[versions/v30/API/MPI_BSEND|MPI_BSEND]] (or other buffered send) and [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] , the [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] implicitly supplies the [[versions/v30/API/MPI_BUFFER_DETACH|MPI_BUFFER_DETACH]] .~~

~~This program is correct, and after the `MPI_Finalize`, it is as if the buffer had been detached.~~

~~    rank 0                          rank 1     =====================================================     ...                             ...     buffer = malloc(1000000);       MPI_Recv();     MPI_Buffer_attach();            MPI_Finalize();     MPI_Bsend();                    exit();     MPI_Finalize();     free(buffer);     exit();~~

~~In this example, `MPI_Iprobe()` must return a `FALSE` flag. `MPI_Test_cancelled()` must return a `TRUE` flag, independent of the relative order of execution of `MPI_Cancel()` in process 0 and `MPI_Finalize()` in process 1. The `MPI_Iprobe()` call is there to make sure the implementation knows that the “tag1” message exists at the destination, without being able to claim that the user knows about it.~~

~~    rank 0                          rank 1     ========================================================     MPI_Init();                     MPI_Init();     MPI_Isend(tag1);     MPI_Barrier();                  MPI_Barrier();                                     MPI_Iprobe(tag2);     MPI_Barrier();                  MPI_Barrier();                                     MPI_Finalize();                                     exit();     MPI_Cancel();     MPI_Wait();     MPI_Test_cancelled();     MPI_Finalize();     exit();~~

==This program is correct: Process 0 calls `MPI_Finalize` after it has executed the MPI calls that complete the send operation. Likewise, process 1 executes the MPI call that completes the matching receive operation before it calls `MPI_Finalize`.==

==      Process 0                     Proces 1       --------                      --------       MPI_Init();                   MPI_Init();        MPI_Isend(dest=1);            MPI_Recv(src=0);       MPI_Request_free();           MPI_Finalize();       MPI_Finalize();               exit();     exit();==

==This program is correct. The attached buffer is a resource allocated by the user, not by MPI; it is available to the user after MPI is finalized.==

==       Process 0                     Process 1        ---------                     ---------        MPI_Init();                  MPI_Init();        buffer = malloc(1000000);    MPI_Recv(src=0);        MPI_Buffer_attach();         MPI_Finalize();        MPI_Send(dest=1));           exit();        MPI_Finalize();        free(buffer);        exit();==

==This program is correct. The cancel operation must succeed, since the send cannot complete normally. The wait operation, after the call to `MPI_Cancel`, is local — no matching MPI call is required on process 1.==

==       Process 0                    Process 1        ---------                    ---------        MPI_Issend(dest=1);          MPI_Finalize();        MPI_Cancel();        MPI_Wait();        MPI_Finalize();==

~~> An implementation may need to delay the return from [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] until all potential future message cancellations have been processed. One possible solution is to place a barrier inside [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]]~~

~~Once [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] returns, no MPI routine (not even [[versions/v30/API/MPI_INIT|MPI_INIT]] ) may be called, except for [[versions/v30/API/MPI_GET_VERSION|MPI_GET_VERSION]] , [[versions/v30/API/MPI_INITIALIZED|MPI_INITIALIZED]] ,~~

~~and [[versions/v30/API/MPI_FINALIZED|MPI_FINALIZED]] .~~

~~Each process must complete any pending communication it initiated before it calls [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] . If the call returns, each process may continue local computations, or exit, without participating in further MPI communication with other processes.~~

~~[[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over `MPI_COMM_WORLD`; otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in Section [[versions/v30/sections/dynamic#Releasing Connections|Releasing Connections]] on page [[versions/v30/sections/dynamic#Releasing Connections|Releasing Connections]] .~~

~~> [!warning] Advice to implementors~~

~~> Even though a process has completed all the communication it initiated, such communication may not yet be completed from the viewpoint of the underlying MPI system. E.g., a blocking send may have completed, even though the data is still buffered at the sender. The MPI implementation must ensure that a process has completed any involvement in MPI communication before [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] returns. Thus, if a process exits after the call to [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] , this will not cause an ongoing communication to fail.~~

~~Although it is not required that all processes return from [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] , it is required that at least process 0 in `MPI_COMM_WORLD` return, so that users can know that the MPI portion of the computation is over. In addition, in a POSIX environment, they may desire to supply an exit code for each process that returns from [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] .~~

==> Even though a process has executed all MPI calls needed to complete the communications it is involved with, such communication may not yet be completed from the viewpoint of the underlying MPI system. For example, a blocking send may have returned, even though the data is still buffered at the sender in an MPI buffer; an MPI process may receive a cancel request for a message it has completed receiving. The MPI implementation must ensure that a process has completed any involvement in MPI communication before [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] returns. Thus, if a process exits after the call to [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] , this will not cause an ongoing communication to fail. The MPI implementation should also complete freeing all objects marked for deletion by MPI calls that freed them.==

==Once [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] returns, no MPI routine (not even [[versions/v30/API/MPI_INIT|MPI_INIT]] ) may be called, except for [[versions/v30/API/MPI_GET_VERSION|MPI_GET_VERSION]] , [[versions/v30/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] , [[versions/v30/API/MPI_INITIALIZED|MPI_INITIALIZED]] ,==

==[[versions/v30/API/MPI_FINALIZED|MPI_FINALIZED]] , and any function with the prefix `MPI_T_` (within the constraints for functions with this prefix listed in Section [[versions/v30/sections/tools#Initialization and Finalization|Initialization and Finalization]] ).==

==Although it is not required that all processes return from [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] , it is required that at least process 0 in `MPI_COMM_WORLD` return, so that users can know that the MPI portion of the computation is over. In addition, in a POSIX environment, users may desire to supply an exit code for each process that returns from [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] .==

~~This routine may be used to determine whether [[versions/v30/API/MPI_INIT|MPI_INIT]] has been called.~~

~~[[versions/v30/API/MPI_INITIALIZED|MPI_INITIALIZED]] returns `true` if the calling process has called [[versions/v30/API/MPI_INIT|MPI_INIT]] . Whether [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] has been called does not affect the behavior of [[versions/v30/API/MPI_INITIALIZED|MPI_INITIALIZED]] .~~

~~It is one of the few routines that may be called before [[versions/v30/API/MPI_INIT|MPI_INIT]] is called.~~

==This routine may be used to determine whether [[versions/v30/API/MPI_INIT|MPI_INIT]] has been called. [[versions/v30/API/MPI_INITIALIZED|MPI_INITIALIZED]] returns `true` if the calling process has called [[versions/v30/API/MPI_INIT|MPI_INIT]] . Whether [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] has been called does not affect the behavior of [[versions/v30/API/MPI_INITIALIZED|MPI_INITIALIZED]] . It is one of the few routines that may be called before [[versions/v30/API/MPI_INIT|MPI_INIT]] is called.==

~~This routine makes a “best attempt” to abort all tasks in the group of `comm`. This function does not require that the invoking environment take any action with the error code. However, a Unix or POSIX environment should handle this~~

~~as a `return errorcode` from the main program.~~

~~It may not be possible for an MPI implementation to abort only the processes represented by `comm` if this is a subset of the processes. In this case, the MPI implementation should attempt to abort all the connected processes but should not abort any unconnected processes. If no processes were spawned, accepted or connected then this has the effect of aborting all the processes associated with `MPI_COMM_WORLD`.~~

==This routine makes a “best attempt” to abort all tasks in the group of `comm`. This function does not require that the invoking environment take any action with the error code. However, a Unix or POSIX environment should handle this as a `return errorcode` from the main program.==

==It may not be possible for an MPI implementation to abort only the processes represented by `comm` if this is a subset of the processes. In this case, the MPI implementation should attempt to abort all the connected processes but should not abort any unconnected processes. If no processes were spawned, accepted, or connected then this has the effect of aborting all the processes associated with `MPI_COMM_WORLD`.==

> Whether the ~~errorcode~~ ==`errorcode`== is returned from the executable or from the > > MPI process startup mechanism (e.g., `mpiexec`), is an aspect of quality of the MPI library but not mandatory.

> Where possible, a high-quality implementation will try to return the ~~errorcode~~ ==`errorcode`== from the MPI process startup mechanism (e.g. `mpiexec` or singleton init).

### MPI-3.0 → MPI-3.1  (7 changed paragraphs)

~~Conforming implementations of MPI are required to allow applications to pass `NULL` for both the `argc` and~~

~~`argv` arguments of `main` in C.~~

~~After MPI is initialized, the application can access information about the execution environment by querying the predefined info object `MPI_INFO_ENV`. The following keys are predefined for this object, corresponding to the arguments of `MPI_COMM_SPAWN` or of `mpiexec`:~~

==Conforming implementations of MPI are required to allow applications to pass `NULL` for both the `argc` and `argv` arguments of `main` in C.==

==After MPI is initialized, the application can access information about the execution environment by querying the predefined info object `MPI_INFO_ENV`. The following keys are predefined for this object, corresponding to the arguments of [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] or of [[mpiexec]] :==

Note that all values are strings. Thus, the maximum number of processes is represented by a string such as `‘‘1024’’` and the requested level is represented by a string such as ~~`‘‘MPI_THREAD_SINGLE"`.~~ ==`‘‘MPI_THREAD_SINGLE’’`.==

Then the first 5 processes will have have in their `MPI_INFO_ENV` object the pairs `(command, ocean)`, `(maxprocs, 5)`, and `(arch, sun)`. The next 10 processes will have in `MPI_INFO_ENV` `(command, atmos)`, `(maxprocs, 10)`, and `(arch, ~~rs600)`~~ ==rs6000)`==

~~This routine cleans up all MPI state.~~

~~If an MPI program terminates normally (i.e., not due to a call to [[versions/v31/API/MPI_ABORT|MPI_ABORT]] or an unrecoverable error) then each process must call [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] before it exits.~~

==This routine cleans up all MPI state. If an MPI program terminates normally (i.e., not due to a call to [[versions/v31/API/MPI_ABORT|MPI_ABORT]] or an unrecoverable error) then each process must call [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] before it exits.==

~~[[MPI_xxx_FREE]]~~ ==`MPI_XXX_FREE`== calls.

[[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over `MPI_COMM_WORLD`; otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in ~~Section [[versions/v31/sections/dynamic#Releasing Connections|Releasing Connections]] on page~~ [[versions/v31/sections/dynamic#Releasing Connections|Releasing Connections]] .

~~Once [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] returns, no MPI routine (not even [[versions/v31/API/MPI_INIT|MPI_INIT]] ) may be called, except for [[versions/v31/API/MPI_GET_VERSION|MPI_GET_VERSION]] , [[versions/v31/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] , [[versions/v31/API/MPI_INITIALIZED|MPI_INITIALIZED]] ,~~

~~[[versions/v31/API/MPI_FINALIZED|MPI_FINALIZED]] , and any function with the prefix `MPI_T_` (within the constraints for functions with this prefix listed in Section [[versions/v31/sections/tools#Initialization and Finalization|Initialization and Finalization]] ).~~

==Once [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] returns, no MPI routine (not even [[versions/v31/API/MPI_INIT|MPI_INIT]] ) may be called, except for [[versions/v31/API/MPI_GET_VERSION|MPI_GET_VERSION]] , [[versions/v31/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] , [[versions/v31/API/MPI_INITIALIZED|MPI_INITIALIZED]] , [[versions/v31/API/MPI_FINALIZED|MPI_FINALIZED]] , and any function with the prefix `MPI_T_` (within the constraints for functions with this prefix listed in Section [[versions/v31/sections/tools#Initialization and Finalization|Initialization and Finalization]] ).==

This routine may be used to determine whether [[versions/v31/API/MPI_INIT|MPI_INIT]] has been called. [[versions/v31/API/MPI_INITIALIZED|MPI_INITIALIZED]] returns `true` if the calling process has called [[versions/v31/API/MPI_INIT|MPI_INIT]] . Whether [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] has been called does not affect the behavior of [[versions/v31/API/MPI_INITIALIZED|MPI_INITIALIZED]] . It is one of the few routines that may be called before [[versions/v31/API/MPI_INIT|MPI_INIT]] is called. ==This function must always be thread-safe, as defined in Section [[versions/v31/sections/ei#MPI and Threads|MPI and Threads]] .==

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/inquiry#Startup]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Startup]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Startup]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Startup]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Startup]]

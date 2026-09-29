---
title: "Clarifications"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Clarifications

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Clarifications|MPI-4.0]], [[versions/v41/sections/dynamic#Clarifications|MPI-4.1]], [[versions/v50/sections/dynamic#Clarifications|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==**Initialization and Completion.** When using the World Model, the call to [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] should occur on the same thread that initialized MPI. We call this thread the **main thread**. The call should occur only after all process threads have completed their MPI calls, and have no *pending* communication or I/O operations.==

==> [!tip] Rationale==

==> This constraint simplifies implementation.==

==**Threads and the Sessions Model.** The Sessions Model provides a finer-grain approach to controlling the interaction between MPI calls and threads. When using this model, the desired level of thread support is specified at Session initialization time. See Section [[versions/v41/sections/dynamic#The Sessions Model|The Sessions Model]] . Thus it is possible for communicators and other MPI objects derived from one Session to provide a different level of thread support than those created from another Session for which a different level of thread support was requested. Depending on the level of thread support requested at Session initialization time, different threads in a MPI process can make concurrent calls to MPI when using MPI objects derived from different *session handles*. Note that the requested and provided level of thread support when creating a Session may influence the granted level of thread support in a subsequent invocation of [[versions/v41/API/MPI_SESSION_INIT|MPI_SESSION_INIT]] . Likewise, if the application at some point calls [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , the requested and granted level of thread support may influence the granted level of thread support for subsequent calls to [[versions/v41/API/MPI_SESSION_INIT|MPI_SESSION_INIT]] . Similarly, if the application calls [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] after a call to [[versions/v41/API/MPI_SESSION_INIT|MPI_SESSION_INIT]] , the level of thread support returned from [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] may be similarly influenced by the requested level of thread support in the prior call to [[versions/v41/API/MPI_SESSION_INIT|MPI_SESSION_INIT]] .==

==In addition, if an MPI application is only using the Sessions Model, the provided thread support level returned by [[versions/v41/API/MPI_QUERY_THREAD|MPI_QUERY_THREAD]] is the same as that returned prior to invocation of [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] or [[versions/v41/API/MPI_INIT|MPI_INIT]] . If the application also used the World Model in some component of the application, [[versions/v41/API/MPI_QUERY_THREAD|MPI_QUERY_THREAD]] will return the level of thread support returned by the original call to [[versions/v41/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] .==

==**Multiple threads completing the same request.** A program in which two threads block, waiting on the same request, is erroneous. Similarly, the same request cannot appear in the array of requests of two concurrent==

==`MPI\_{WAIT$`|`$TEST}{ANY$`|`$SOME$`|`$ALL}` calls. In MPI, a request can only be completed once. Any combination of wait or test that violates this rule is erroneous.==

==> [!tip] Rationale==

==> This restriction is consistent with the view that a multithreaded execution corresponds to an interleaving of the MPI calls. In a single threaded implementation, once a wait is posted on a request the request handle will be nullified before it is possible to post a second wait on the same handle. > > With threads, an `MPI_WAIT{ANY$`|`$SOME$`|`$ALL}` may be blocked without having nullified its request(s) so it becomes the user’s responsibility to avoid using the same request in an [[versions/v41/API/MPI_WAIT|MPI_WAIT]] on another thread. This constraint also simplifies implementation, as only one thread will be blocked on any communication or I/O event.==

==**Probe.** A receive call that uses source and tag values returned by a preceding call to [[versions/v41/API/MPI_PROBE|MPI_PROBE]] or [[versions/v41/API/MPI_IPROBE|MPI_IPROBE]] will receive the message matched by the probe call only if there was no other matching receive after the probe and before that receive. In a multithreaded environment, it is up to the user to enforce this condition using suitable mutual exclusion logic. This can be enforced by making sure that each communicator is used by only one thread on each process. Alternatively, [[versions/v41/API/MPI_MPROBE|MPI_MPROBE]] or [[versions/v41/API/MPI_IMPROBE|MPI_IMPROBE]] can be used.==

==**Collective calls.** Matching of collective calls on a communicator, window, or file handle is done according to the order in which the calls are issued at each process. If concurrent threads issue such calls on the same communicator, window or file handle, it is up to the user to make sure the calls are correctly ordered, using interthread synchronization.==

==> [!note] Advice to users==

==> With three concurrent threads in each MPI process of a communicator `comm`, it is allowed that thread A in each MPI process calls a collective operation on `comm`, thread B calls a file operation on an existing file handle that was formerly opened on `comm`, and thread C invokes one-sided operations on an existing window handle that was also formerly created on `comm`.==

==> [!tip] Rationale==

==> As specified in [[versions/v41/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] and [[versions/v41/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] , a file handle and a window handle inherit only the group of processes of the underlying communicator, but not the communicator itself. Accesses to communicators, window handles and file handles cannot affect one another.==

==> [!warning] Advice to implementors==

==> If the implementation of file or window operations internally uses MPI communication then a duplicated communicator may be cached on the file or window object.==

==**Error handlers.** An error handler does not necessarily execute in the context of the thread that made the error-raising MPI call; the error handler may be executed by a thread that is distinct from the thread that will return the error code.==

==> [!tip] Rationale==

==> The MPI implementation may be multithreaded, so that part of the communication protocol may execute on a thread that is distinct from the thread that made the MPI call. The design allows the error handler to be executed on the thread where the error is raised.==

==**Interaction with signals and cancellations.** The outcome is undefined if a thread that executes an MPI call is cancelled (by another thread), or if a thread catches a signal while executing an MPI call. However, a thread of an MPI process may terminate, and may catch signals or be cancelled by another thread when not executing MPI calls.==

==> [!tip] Rationale==

==> Few C library functions are signal safe, and many have cancellation points—points at which the thread executing them may be cancelled. The above restriction simplifies implementation (no need for the MPI library to be “async-cancel-safe” or “async-signal-safe”).==

==> [!note] Advice to users==

==> Users can catch signals in separate, non-MPI threads (e.g., by masking signals on MPI calling threads, and unmasking them in one or more non-MPI threads). A good programming practice is to have a distinct thread blocked in a call to `sigwait` for each user expected signal that may occur. Users must not catch signals used by the MPI implementation; as each MPI implementation is required to document the signals used internally, users can avoid these signals.==

==> [!warning] Advice to implementors==

==> The MPI library should not invoke library calls that are not thread safe, if multiple threads execute.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

> This restriction is consistent with the view that a multithreaded execution corresponds to an interleaving of the MPI calls. In a single threaded implementation, once a wait is posted on a request the request handle will be nullified before it is possible to post a second wait on the same handle. > > With threads, an ~~`MPI_WAIT{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI_WAIT{$`|`$ANY$`|`$SOME$`|`$ALL}`== may be blocked without having nullified its request(s) so it becomes the user’s responsibility to avoid using the same request in an [[versions/v50/API/MPI_WAIT|MPI_WAIT]] on another thread. This constraint also simplifies implementation, as only one thread will be blocked on any communication or I/O event.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Clarifications]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Clarifications]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Clarifications]]

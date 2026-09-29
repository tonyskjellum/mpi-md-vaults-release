---
title: "Session Creation and Destruction Methods"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Session Creation and Destruction Methods

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Session Creation and Destruction Methods|MPI-4.0]], [[versions/v41/sections/dynamic#Session Creation and Destruction Methods|MPI-4.1]], [[versions/v50/sections/dynamic#Session Creation and Destruction Methods|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

The `info` argument is used to request MPI functionality requirements and possible MPI implementation specific capabilities. The following info ~~key is~~ ==keys are== predefined:

==`mpi_memory_alloc_kinds`   used to request support for memory allocation kinds to be used by the calling MPI process on MPI objects derived from the Session. See Section [[versions/v41/sections/dynamic#Memory Allocation Info|Memory Allocation Info]] . A value for this info key can also be supplied as an argument to an MPI startup mechanism as described in Section [[versions/v41/sections/dynamic#Portable MPI Process Startup|Portable MPI Process Startup]] .==

~~Before an MPI process invokes [[versions/v41/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] , the process must perform all MPI calls needed to complete its involvement in MPI communications: it must locally complete all MPI operations that it initiated and it must execute matching calls needed to complete MPI communications initiated by other processes.~~

==Before an MPI process invokes [[versions/v41/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] , the process must perform all MPI calls needed to complete its involvement in MPI communications: it must locally complete all MPI operations that it initiated and it must execute matching calls needed to complete MPI communications initiated by other processes. This means that before calling [[versions/v41/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] , all message handles associated with this session must be received (with [[versions/v41/API/MPI_MRECV|MPI_MRECV]] or derived procedures) and all request handles associated with this session must be freed in the case of nonblocking operations, and must be inactive or freed in the case of persistent operations (i.e., by calling one of the procedures==

==`MPI\_{TEST$`|`$WAIT}{$`|`$ANY$`|`$SOME$`|`$ALL}` or [[versions/v41/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] ).==

~~`MPI_XXX_FREE` calls.~~

==`MPI_XXX_FREE` , [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , or [[versions/v41/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] calls.==

==Once [[versions/v41/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] returns, no MPI procedure may be called in the Sessions Model that are related to this session (not even freeing objects that are derived from this session), except for those listed in [[versions/v41/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] .==

==> [!note] Advice to users==

==> Opaque objects and their handles may bind internal resources. Therefore, it is highly recommended to explicitly free the handles associated with this session before finalizing it. Such associated handles can be group, communicator, window, file, message, and request handles, whereas datatype, operation (e.g., for reductions), error handler, and info handles exist independently of the World Model or a session in the Sessions Model. In addition, if attributes are cached on such an opaque object (see [[versions/v41/sections/context#Caching|Caching]] ), then the delete callback functions are only invoked when the object is explicitly freed (or disconnected).==

==Most handles that exist independently from the World Model or a session in the Sessions Model, e.g., datatype handles, can be created only while MPI is initialized. For example, a datatype handle that was created when one particular session existed can be used in any other session (or in the World Model), even if the second session was initialized after the first session had already been finalized and no other session existed in between. See [[versions/v41/sections/dynamic#MPI Functionality that is Always Available|MPI Functionality that is Always Available]] for handle creation procedures that do not require that MPI is initialized.==

> This rule also allows for the completion of communications the MPI process is involved with that may not yet be completed from the viewpoint of the underlying MPI system. See ==[[versions/v41/sections/terms#Progress|Progress]] on *progress* and== the advice to implementors at the end of Section [[versions/v41/sections/dynamic#Finalizing MPI|Finalizing MPI]] .

Three MPI processes are connected with 2 communicators (indicated by the `=` symbols), derived from one session handle in process X but from two separate session handles in both process Y and Z.

Process X has only to finalize its one session handle, whereas the other two MPI processes have to call [[versions/v41/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] twice in the same sequence with respect to the communicators derived from the session handles. Specifically, both process Y and process Z shall call [[versions/v41/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] for the session from which `communicator_1` was derived before calling the [[versions/v41/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] for the session from which `communicator_2` was derived, or vice versa ~~(i.e.~~ ==(i.e.,== both shall finalize the session for `communicator_2` first then finalize the session for `communicator_1`). The call `SF(ses)` in process X may not return until both `SF(ses*A)` and `SF(ses*B)` are called in processes Y and Z.

### MPI-4.1 → MPI-5.0  (4 changed paragraphs)

==[[versions/v50/API/MPI_SESSION_INIT|MPI_SESSION_INIT]] is a local procedure.==

~~`thread_level` used~~ ==`thread_level`: Used== to request the thread support level required for MPI objects derived from the Session. Allowed values are `MPI_THREAD_SINGLE`, `MPI_THREAD_FUNNELED`, `MPI_THREAD_SERIALIZED`, and `MPI_THREAD_MULTIPLE`. Note that the thread support value is specified by a string rather than the integer values supplied to [[versions/v50/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] . The thread support level actually provided by the MPI implementation can be determined via a subsequent call to [[versions/v50/API/MPI_SESSION_GET_INFO|MPI_SESSION_GET_INFO]] to return the info object associated with the Session. The default thread support level is MPI implementation dependent.

~~`mpi_memory_alloc_kinds` used~~ ==`mpi_memory_alloc_kinds`: Used== to request support for memory allocation kinds to be used by the calling MPI process on MPI objects derived from the Session. See Section [[versions/v50/sections/dynamic#Memory Allocation Info|Memory Allocation Info]] . A value for this info key can also be supplied as an argument to an MPI startup mechanism as described in Section [[versions/v50/sections/dynamic#Portable MPI Process Startup|Portable MPI Process Startup]] .

Before an MPI process invokes [[versions/v50/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] , the process must perform all MPI calls needed to complete its involvement in MPI communications: it must locally complete all MPI operations that it initiated and it must execute matching calls needed to complete MPI communications initiated by other processes. This means that before calling [[versions/v50/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] , all message handles associated with this session must be received (with [[versions/v50/API/MPI_MRECV|MPI_MRECV]] or derived procedures) and all request handles associated with this session must be freed in the case of nonblocking operations, and must be inactive or freed in the case of persistent ==or partitioned== operations (i.e., by calling one of the procedures

process-X process-Y process-Z Remarks sesX, sesYA, ~~ses YB,~~ ==sesYB,== sesZA and sesZB are session handles. (sesX)=======(sesYA)=======(sesZA) communicator_1 and (sesX)=======(sesYB)=======(sesZB) communicator_2 are derived from them. SF(sesX) SF(sesYA) SF(sesZA) SF = MPI_SESSION_FINALIZE SF(sesYB) SF(sesZB)

Process X has only to finalize its one session handle, whereas the other two MPI processes have to call [[versions/v50/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] twice in the same sequence with respect to the communicators derived from the session handles. Specifically, both process Y and process Z shall call [[versions/v50/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] for the session from which `communicator_1` was derived before calling the [[versions/v50/API/MPI_SESSION_FINALIZE|MPI_SESSION_FINALIZE]] for the session from which `communicator_2` was derived, or vice versa (i.e., both shall finalize the session for `communicator_2` first then finalize the session for `communicator_1`). The call ~~`SF(ses)`~~ ==`SF(sesX)`== in process X may not return until both `SF(ses*A)` and `SF(ses*B)` are called in processes Y and Z.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Session Creation and Destruction Methods]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Session Creation and Destruction Methods]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Session Creation and Destruction Methods]]

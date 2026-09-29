---
title: "Communicator Info"
chapter: context
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Communicator Info

Chapter **context** · in [[versions/v30/sections/context#Communicator Info|MPI-3.0]], [[versions/v31/sections/context#Communicator Info|MPI-3.1]], [[versions/v40/sections/context#Communicator Info|MPI-4.0]], [[versions/v41/sections/context#Communicator Info|MPI-4.1]], [[versions/v50/sections/context#Communicator Info|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

Hints specified via info (see Chapter [[versions/v40/sections/misc#The Info Object|The Info Object]] ) allow a user to provide information to direct optimization. Providing hints may enable an implementation to deliver increased performance or minimize use of system resources. ~~However, hints do not change the semantics of any MPI interfaces. In other words, an~~ ==An== implementation is free to ignore all ~~hints.~~ ==hints; however, applications must comply with any info hints they provide that are used by the MPI implementation (i.e., are returned by a call to [[versions/v40/API/MPI_COMM_GET_INFO|MPI_COMM_GET_INFO]] ) and that place a restriction on the behavior of the application.== Hints are specified on a per communicator basis, in [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , ==[[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] ,== [[versions/v40/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] , [[versions/v40/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] , ~~[[versions/v40/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]]~~ ==[[versions/v40/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]]== , and ~~[[versions/v40/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]]~~ ==[[versions/v40/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]]== , via the opaque info object. When an info object that specifies a subset of valid hints is passed to [[versions/v40/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] , there will be no effect on previously set or defaulted hints that the info does not specify.

~~Info hints are not propagated by MPI from one communicator to another except when the communicator is duplicated using [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] or [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] . In this case, all hints associated with the original communicator are also applied to the duplicated communicator.~~

==Info hints are not propagated by MPI from one communicator to another. The following info keys are valid for all communicators.==

==`mpi_assert_no_any_tag` (boolean, default: `false`):   If set to `true`, then the implementation may assume that the process will not use the `MPI_ANY_TAG` wildcard on the given communicator.==

==`mpi_assert_no_any_source` (boolean, default: `false`):   If set to `true`, then the implementation may assume that the process will not use the `MPI_ANY_SOURCE` wildcard on the given communicator.==

==`mpi_assert_exact_length` (boolean, default: `false`):   If set to `true`, then the implementation may assume that the lengths of messages received by the process are equal to the lengths of the corresponding receive buffers, for point-to-point communication operations on the given communicator.==

==`mpi_assert_allow_overtaking` (boolean, default: `false`):   If set to `true`, then the implementation may assume that point-to-point communications on the given communicator do not rely on the non-overtaking rule specified in Section [[versions/v40/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] . In other words, the application asserts that send operations are not required to be matched at the receiver in the order in which the send operations were posted by the sender, and receive operations are not required to be matched in the order in which they were posted by the receiver.==

==> [!note] Advice to users==

==> Use of the `mpi_assert_allow_overtaking` info key can result in nondeterminism in the message matching order.==

==> [!note] Advice to users==

==> Some optimizations may only be possible when all processes in the group of the communicator provide a given info key with the same value.==

[[versions/v40/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] ~~sets new values for~~ ==updates== the hints of the communicator associated with ~~`comm`.~~ ==`comm` using the hints provided in `info`. This operation has no effect on previously set or defaulted hints that are not specified by `info`. It also has no effect on previously set or defaulted hints that are specified by `info`, but are ignored by the MPI implementation in this call to [[versions/v40/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] .== [[versions/v40/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] is a collective routine. The info object may be different on each process, but any info entries that an implementation requires to be the same on all processes must appear with the same value in each process’s info object.

~~> Some info items that an implementation can use when it creates a communicator cannot easily be changed once the communicator has been created. Thus, an implementation may ignore hints issued in this call that it would have accepted in a creation call.~~

==> Some info items that an implementation can use when it creates a communicator cannot easily be changed once the communicator has been created. Thus, an implementation may ignore hints issued in this call that it would have accepted in a creation call. An implementation may also be unable to update certain info hints in a call to [[versions/v40/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] . [[versions/v40/API/MPI_COMM_GET_INFO|MPI_COMM_GET_INFO]] can be used to determine whether updates to existing info hints were ignored by the implementation.==

==> [!note] Advice to users==

==> Setting info hints on the predefined communicators `MPI_COMM_WORLD` and `MPI_COMM_SELF` may have unintended effects, as changes to these global objects may affect all components of the application, including libraries and tools. Users must ensure that all components of the application that use a given communicator, including libraries and tools, can comply with any info hints associated with that communicator.==

~~[[versions/v40/API/MPI_COMM_GET_INFO|MPI_COMM_GET_INFO]] returns a new info object containing the hints of the communicator associated with comm. The current setting of all hints actually used by the system related to this communicator is returned in `info_used`. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pair. The user is responsible for freeing `info_used` via [[versions/v40/API/MPI_INFO_FREE|MPI_INFO_FREE]] .~~

~~> [!note] Advice to users~~

~~> The info object returned in `info_used` will contain all hints currently active for this communicator. This set of hints may be greater or smaller than the set of hints specified when the communicator was created, as the system may not recognize some hints set by the user, and may recognize other hints that the user has not set.~~

==[[versions/v40/API/MPI_COMM_GET_INFO|MPI_COMM_GET_INFO]] returns a new info object containing the hints of the communicator associated with `comm`. The current setting of all hints related to this communicator is returned in `info_used`. An MPI implementation is required to return all hints that are supported by the implementation and have default values specified; any user-supplied hints that were not ignored by the implementation; and any additional hints that were set by the implementation. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pair. The user is responsible for freeing `info_used` via [[versions/v40/API/MPI_INFO_FREE|MPI_INFO_FREE]] .==

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

Hints specified via info (see Chapter [[versions/v41/sections/misc#The Info Object|The Info Object]] ) allow a user to provide information to direct optimization. Providing hints may enable an implementation to deliver increased performance or minimize use of system resources. ~~An~~ ==As described in [[versions/v41/sections/misc#The Info Object|The Info Object]] , an== implementation is free to ignore all hints; however, applications must comply with any info hints they provide that are used by the MPI implementation (i.e., are returned by a call to [[versions/v41/API/MPI_COMM_GET_INFO|MPI_COMM_GET_INFO]] ) and that place a restriction on the behavior of the application. Hints are specified on a per communicator basis, in [[versions/v41/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , [[versions/v41/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] , [[versions/v41/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] , [[versions/v41/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] , [[versions/v41/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] , and [[versions/v41/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] , via the opaque info object. When an info object that specifies a subset of valid hints is passed to [[versions/v41/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] , there will be no effect on previously set or defaulted hints that the info does not specify.

==> [!note] Advice to users==

==> Some optimizations may only be possible when all processes in the group of the communicator provide a given info key with the same value.==

~~`mpi_assert_no_any_tag` (boolean, default: `false`):   If set to `true`, then the implementation may assume that the process will not use the `MPI_ANY_TAG` wildcard on the given communicator.~~

~~`mpi_assert_no_any_source` (boolean, default: `false`):   If set to `true`, then the implementation may assume that the process will not use the `MPI_ANY_SOURCE` wildcard on the given communicator.~~

~~`mpi_assert_exact_length` (boolean, default: `false`):   If set to `true`, then the implementation may assume that the lengths of messages received by the process are equal to the lengths of the corresponding receive buffers, for point-to-point communication operations on the given communicator.~~

~~`mpi_assert_allow_overtaking` (boolean, default: `false`):   If set to `true`, then the implementation may assume that point-to-point communications on the given communicator do not rely on the non-overtaking rule specified in Section [[versions/v41/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] . In other words, the application asserts that send operations are not required to be matched at the receiver in the order in which the send operations were posted by the sender, and receive operations are not required to be matched in the order in which they were posted by the receiver.~~

==> [!note] Advice to users==

==> Some optimizations may only be possible when all MPI processes in the group of the communicator provide a given info key with the same value.==

==`mpi_assert_no_any_tag` (boolean, default: `false`):   If set to `true`, then the implementation may assume that the MPI process will not use the `MPI_ANY_TAG` wildcard on the given communicator.==

==`mpi_assert_no_any_source` (boolean, default: `false`):   If set to `true`, then the implementation may assume that the MPI process will not use the `MPI_ANY_SOURCE` wildcard on the given communicator.==

==`mpi_assert_exact_length` (boolean, default: `false`):   If set to `true`, then the implementation may assume that the lengths of messages received by the MPI process are equal to the lengths of the corresponding receive buffers, for point-to-point communication operations on the given communicator.==

==`mpi_assert_allow_overtaking` (boolean, default: `false`):   If set to `true`, then the implementation may assume that point-to-point communications on the given communicator do not rely on the nonovertaking rule specified in Section [[versions/v41/sections/pt2pt#Semantics of Point-to-Point Communication|Semantics of Point-to-Point Communication]] . In other words, the application asserts that send operations are not required to be matched at the receiver in the order in which the send operations were posted by the sender, and receive operations are not required to be matched in the order in which they were posted by the receiver.==

==`mpi_assert_strict_persistent_collective_ordering` (boolean, default: `false`):   If set to `true`, then the implementation may assume that all the persistent collective operations are started in the same order across all MPI processes in the group of the communicator. It is required that if this assertion is made on one member of the communicator’s group, then it must be made on all members of that communicator’s group with the same value.==

~~> Some optimizations may only be possible when all processes in the group of the communicator provide a given info key with the same value.~~

==> Use of the `mpi_assert_strict_persistent_collective_ordering` may be needed because some optimizations may only be possible on certain systems when strict collective ordering is asserted for the underlying communicator of a persistent collective operation.==

==`mpi_assert_memory_alloc_kinds` (string, not set by default):   If set, the implementation may assume that the memory for all communication buffers passed to MPI operations performed by the calling MPI process on the given communicator will use only the memory allocation kinds listed in the value string. See Section [[versions/v41/sections/dynamic#Memory Allocation Info|Memory Allocation Info]] .==

[[versions/v41/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] updates the hints of the communicator associated with `comm` using the hints provided in `info`. This operation has no effect on previously set or defaulted hints that are not specified by `info`. It also has no effect on previously set or defaulted hints that are specified by `info`, but are ignored by the MPI implementation in this call to [[versions/v41/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] . [[versions/v41/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] is a collective routine. The info object may be different on each ==MPI== process, but any info entries that an implementation requires to be the same on all ==MPI== processes must appear with the same value in each ==MPI== process’s info object.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

> Some optimizations may only be possible when all ==MPI== processes in the group of the communicator provide a given info key with the same value.

~~> [!note] Advice to users~~

~~> Some optimizations may only be possible when all MPI processes in the group of the communicator provide a given info key with the same value.~~

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Communicator Info]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Communicator Info]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Communicator Info]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Communicator Info]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Communicator Info]]

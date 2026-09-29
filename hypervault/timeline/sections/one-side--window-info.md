---
title: "Window Info"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Window Info

Chapter **one-side** · in [[versions/v30/sections/one-side#Window Info|MPI-3.0]], [[versions/v31/sections/one-side#Window Info|MPI-3.1]], [[versions/v40/sections/one-side#Window Info|MPI-4.0]], [[versions/v41/sections/one-side#Window Info|MPI-4.1]], [[versions/v50/sections/one-side#Window Info|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

Hints specified via info (see ~~Section [[versions/v31/sections/misc#The Info Object|The Info Object]] , page~~ [[versions/v31/sections/misc#The Info Object|The Info Object]] ) allow a user to provide information to direct optimization. Providing hints may enable an implementation to deliver increased performance or use system resources more efficiently. However, hints do not change the semantics of any MPI interfaces. In other words, an implementation is free to ignore all hints. Hints are specified on a per window basis, in window creation functions and ~~`MPI_WIN_SET_INFO`,~~ ==[[versions/v31/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] ,== via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v31/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] there will be no effect on previously set or default hints that the `info` does not specify.

> It may happen that a program is coded with hints for one system, and later executes on another system that does not support these hints. In general, unsupported hints should simply be ignored. ~~> >~~ Needless to say, no hint can be mandatory. However, for each hint used by a specific implementation, a default value must be provided ~~> >~~ when the user does not specify a value for the hint.

~~`MPI_WIN_SET_INFO`~~ ==[[versions/v31/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]]== sets new values for the hints of the window associated with `win`. The call is collective on the group of `win`. The info object may be different on each process, but any info entries that an implementation requires to be the same on all processes must appear with the same value in each process’s info object.

~~`MPI_WIN_GET_INFO`~~ ==[[versions/v31/API/MPI_WIN_GET_INFO|MPI_WIN_GET_INFO]]== returns a new info object containing the hints of the window associated with `win`. The current setting of all hints actually used by the system related to this window is returned in `info_used`. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pair. The user is responsible for freeing `info_used` via ~~`MPI_INFO_FREE`.~~ ==[[versions/v31/API/MPI_INFO_FREE|MPI_INFO_FREE]] .==

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

Hints specified via info (see [[versions/v40/sections/misc#The Info Object|The Info Object]] ) allow a user to provide information to direct optimization. Providing hints may enable an implementation to deliver increased performance or use system resources more efficiently. ~~However, hints do not change the semantics of any MPI interfaces. In other words, an~~ ==An== implementation is free to ignore all ~~hints.~~ ==hints; however, applications must comply with any info hints they provide that are used by the MPI implementation (i.e., are returned by a call to [[versions/v40/API/MPI_WIN_GET_INFO|MPI_WIN_GET_INFO]] ) and that place a restriction on the behavior of the application.== Hints are specified on a per window basis, in window creation functions and [[versions/v40/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] , via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v40/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] there will be no effect on previously set or default hints that the `info` does not specify.

[[versions/v40/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] ~~sets new values for~~ ==updates== the hints of the window associated with ~~`win`.~~ ==`win` using the hints provided in `info`. This operation has no effect on previously set or defaulted hints that are not specified by `info`. It also has no effect on previously set or defaulted hints that are specified by `info`, but are ignored by the MPI implementation in this call to [[versions/v40/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] .== The call is collective on the group of `win`. The info object may be different on each process, but any info entries that an implementation requires to be the same on all processes must appear with the same value in each process’s info object.

> Some info items that an implementation can use when it creates a window cannot easily be changed once the window has been created. Thus, an implementation may ignore hints issued in this call that it would have accepted in a creation call. ==An implementation may also be unable to update certain info hints in a call to [[versions/v40/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] . [[versions/v40/API/MPI_WIN_GET_INFO|MPI_WIN_GET_INFO]] can be used to determine whether info changes were ignored by the implementation.==

~~[[versions/v40/API/MPI_WIN_GET_INFO|MPI_WIN_GET_INFO]] returns a new info object containing the hints of the window associated with `win`. The current setting of all hints actually used by the system related to this window is returned in `info_used`. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pair. The user is responsible for freeing `info_used` via [[versions/v40/API/MPI_INFO_FREE|MPI_INFO_FREE]] .~~

~~> [!note] Advice to users~~

~~> The info object returned in `info_used` will contain all hints currently active for this window. This set of hints may be greater or smaller than the set of hints specified when the window was created, as the system may not recognize some hints set by the user, and may recognize other hints that the user has not set.~~

==[[versions/v40/API/MPI_WIN_GET_INFO|MPI_WIN_GET_INFO]] returns a new info object containing the hints of the window associated with `win`. The current setting of all hints related to this window is returned in `info_used`. An MPI implementation is required to return all hints that are supported by the implementation and have default values specified; any user-supplied hints that were not ignored by the implementation; and any additional hints that were set by the implementation. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pair. The user is responsible for freeing `info_used` via [[versions/v40/API/MPI_INFO_FREE|MPI_INFO_FREE]] .==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

Hints specified via info (see [[versions/v41/sections/misc#The Info Object|The Info Object]] ) allow a user to provide information to direct optimization. Providing hints may enable an implementation to deliver increased performance or use system resources more efficiently. ~~An~~ ==As described in [[versions/v41/sections/misc#The Info Object|The Info Object]] , an== implementation is free to ignore all hints; however, applications must comply with any info hints they provide that are used by the MPI implementation (i.e., are returned by a call to [[versions/v41/API/MPI_WIN_GET_INFO|MPI_WIN_GET_INFO]] ) and that place a restriction on the behavior of the application. Hints are specified on a per window basis, in window creation functions and [[versions/v41/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] , via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v41/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] there will be no effect on previously set or default hints that the `info` does not specify.

[[versions/v41/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] updates the hints of the window associated with `win` using the hints provided in `info`. This operation has no effect on previously set or defaulted hints that are not specified by `info`. It also has no effect on previously set or defaulted hints that are specified by `info`, but are ignored by the MPI implementation in this call to [[versions/v41/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] . The ~~call~~ ==procedure== is collective ~~on~~ ==over== the group of `win`. The ==entries in the== info object may be different on each ==MPI== process, but any info entries that an implementation requires to be the same on all ==MPI== processes must appear with the same value in each ==MPI== process’s info object.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

Hints specified via info (see ==Chapter== [[versions/v50/sections/misc#The Info Object|The Info Object]] ) allow a user to provide information to direct optimization. Providing hints may enable an implementation to deliver increased performance or use system resources more efficiently. As described in ==Chapter== [[versions/v50/sections/misc#The Info Object|The Info Object]] , an implementation is free to ignore all hints; however, applications must comply with any info hints they provide that are used by the MPI implementation (i.e., are returned by a call to [[versions/v50/API/MPI_WIN_GET_INFO|MPI_WIN_GET_INFO]] ) and that place a restriction on the behavior of the application. Hints are specified on a per window basis, in window creation functions and [[versions/v50/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] , via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v50/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] there will be no effect on previously set or default hints that the `info` does not specify.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Window Info]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Window Info]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Window Info]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Window Info]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Window Info]]

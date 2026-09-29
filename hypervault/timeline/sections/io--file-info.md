---
title: "File Info"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# File Info

Chapter **io** · in [[versions/v20/sections/io#File Info|MPI-2.0]], [[versions/v21/sections/io#File Info|MPI-2.1]], [[versions/v22/sections/io#File Info|MPI-2.2]], [[versions/v30/sections/io#File Info|MPI-3.0]], [[versions/v31/sections/io#File Info|MPI-3.1]], [[versions/v40/sections/io#File Info|MPI-4.0]], [[versions/v41/sections/io#File Info|MPI-4.1]], [[versions/v50/sections/io#File Info|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

==When an info object that specifies a subset of valid hints is passed to [[versions/v21/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v21/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.==

~~The current setting of all hints actually used by the system related to this open file is returned in `info_used`. The user is responsible for freeing `info_used` via `MPI_INFO_FREE`.~~

==The current setting of all hints actually used by the system related to this open file is returned in `info_used`.==

==If no such hints exist, a handle to a newly created info object is returned that contains no key/value pair.==

==The user is responsible for freeing `info_used` via `MPI_INFO_FREE`.==

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~Hints specified via info (see Section [[versions/v30/sections/misc#The Info Object|The Info Object]] , page [[versions/v30/sections/misc#The Info Object|The Info Object]] ) allow a user to provide information~~

~~such as~~

~~file access patterns and file system specifics to direct optimization. Providing hints may enable an implementation to deliver increased I/O performance or minimize the use of system resources. However, hints do not change the semantics of any of the I/O interfaces. In other words, an implementation is free to ignore all hints. Hints are specified on a per file basis, in `MPI_FILE_OPEN`, `MPI_FILE_DELETE`, `MPI_FILE_SET_VIEW`, and `MPI_FILE_SET_INFO`, via the opaque `info` object.~~

~~When an info object that specifies a subset of valid hints is passed to [[versions/v30/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v30/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.~~

==Hints specified via info (see Chapter [[versions/v30/sections/misc#The Info Object|The Info Object]] , page [[versions/v30/sections/misc#The Info Object|The Info Object]] ) allow a user to provide information such as==

==file access patterns and file system specifics to direct optimization. Providing hints may enable an implementation to deliver increased I/O performance or minimize the use of system resources. However, hints do not change the semantics of any of the I/O interfaces. In other words, an implementation is free to ignore all hints. Hints are specified on a per file basis, in `MPI_FILE_OPEN`, `MPI_FILE_DELETE`, `MPI_FILE_SET_VIEW`, and `MPI_FILE_SET_INFO`, via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v30/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v30/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.==

> It may happen that a program is coded with hints for one system, and later executes on another system that does not support these hints. In general, unsupported hints should simply be ignored. > > Needless to say, no hint can be mandatory. ~~> >~~ However, for each hint used by a specific implementation, a default value must be provided > > when the user does not specify a value for this hint.

~~`MPI_FILE_SET_INFO` sets new values for the hints~~

~~of the file associated with `fh`.~~

~~`MPI_FILE_SET_INFO` is a collective routine. The info object~~

~~may be different on each process, but any info entries that an implementation requires to be the same on all processes must appear with the same value in each process’s info object.~~

==`MPI_FILE_SET_INFO` sets new values for the hints of the file associated with `fh`.==

==`MPI_FILE_SET_INFO` is a collective routine. The info object may be different on each process, but any info entries that an implementation requires to be the same on all processes must appear with the same value in each process’s info object.==

> Many info items that an implementation can use when it creates or opens a file cannot easily be changed ~~> >~~ once the file has been created or opened. > > Thus, an implementation may ignore hints issued in this call that it would have accepted in an open call.

~~`MPI_FILE_GET_INFO` returns a new info object containing the hints~~

~~of the file associated with `fh`.~~

~~The current setting of all hints actually used by the system related to this open file is returned in `info_used`.~~

~~If no such hints exist, a handle to a newly created info object is returned that contains no key/value pair.~~

~~The user is responsible for freeing `info_used` via `MPI_INFO_FREE`.~~

==`MPI_FILE_GET_INFO` returns a new info object containing the hints of the file associated with `fh`.==

==The current setting of all hints actually used by the system related to this open file is returned in `info_used`. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pairs. The user is responsible for freeing `info_used` via `MPI_INFO_FREE`.==

> The info object returned in `info_used` will contain all hints currently active for this file. This set of hints may be greater or smaller than the set of hints passed in to `MPI_FILE_OPEN`, `MPI_FILE_SET_VIEW`, ~~and~~ ==or== `MPI_FILE_SET_INFO`, as the system may not recognize some hints set by the user, and may recognize other hints that the user has not set.

### MPI-3.0 → MPI-3.1  (6 changed paragraphs)

~~Hints specified via info (see Chapter [[versions/v31/sections/misc#The Info Object|The Info Object]] , page [[versions/v31/sections/misc#The Info Object|The Info Object]] ) allow a user to provide information such as~~

~~file access patterns and file system specifics to direct optimization. Providing hints may enable an implementation to deliver increased I/O performance or minimize the use of system resources. However, hints do not change the semantics of any of the I/O interfaces. In other words, an implementation is free to ignore all hints. Hints are specified on a per file basis, in `MPI_FILE_OPEN`, `MPI_FILE_DELETE`, `MPI_FILE_SET_VIEW`, and `MPI_FILE_SET_INFO`, via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v31/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.~~

==Hints specified via info (see [[Chapter]] subsec:info) allow a user to provide information such as file access patterns and file system specifics to direct optimization. Providing hints may enable an implementation to deliver increased I/O performance or minimize the use of system resources. However, hints do not change the semantics of any of the I/O interfaces. In other words, an implementation is free to ignore all hints. Hints are specified on a per file basis, in [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , [[versions/v31/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] , [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , and [[versions/v31/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v31/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.==

> It may happen that a program is coded with hints for one system, and later executes on another system that does not support these hints. In general, unsupported hints should simply be ignored. ~~> >~~ Needless to say, no hint can be mandatory. However, for each hint used by a specific implementation, a default value must be provided ~~> >~~ when the user does not specify a value for this hint.

~~`MPI_FILE_SET_INFO` sets new values for the hints of the file associated with `fh`.~~

~~`MPI_FILE_SET_INFO` is a collective routine. The info object may be different on each process, but any info entries that an implementation requires to be the same on all processes must appear with the same value in each process’s info object.~~

==[[versions/v31/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] sets new values for the hints of the file associated with `fh`. [[versions/v31/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] is a collective routine. The info object may be different on each process, but any info entries that an implementation requires to be the same on all processes must appear with the same value in each process’s info object.==

> Many info items that an implementation can use when it creates or opens a file cannot easily be changed once the file has been created or opened. ~~> >~~ Thus, an implementation may ignore hints issued in this call that it would have accepted in an open call.

~~`MPI_FILE_GET_INFO` returns a new info object containing the hints of the file associated with `fh`.~~

~~The current setting of all hints actually used by the system related to this open file is returned in `info_used`. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pairs. The user is responsible for freeing `info_used` via `MPI_INFO_FREE`.~~

==[[versions/v31/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] returns a new info object containing the hints of the file associated with `fh`. The current setting of all hints actually used by the system related to this open file is returned in `info_used`. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pairs. The user is responsible for freeing `info_used` via [[versions/v31/API/MPI_INFO_FREE|MPI_INFO_FREE]] .==

> The info object returned in `info_used` will contain all hints currently active for this file. This set of hints may be greater or smaller than the set of hints passed in to ~~`MPI_FILE_OPEN`, `MPI_FILE_SET_VIEW`,~~ ==[[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] ,== or ~~`MPI_FILE_SET_INFO`,~~ ==[[versions/v31/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] ,== as the system may not recognize some hints set by the user, and may recognize other hints that the user has not set.

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

Hints specified via ~~info~~ ==`info`== (see [[Chapter]] subsec:info) allow a user to provide information such as file access patterns and file system specifics to direct optimization. Providing hints may enable an implementation to deliver increased I/O performance or minimize the use of system resources. ~~However, hints do not change the semantics of any of the I/O interfaces. In other words, an~~ ==An== implementation is free to ignore all ~~hints.~~ ==hints; however, applications must comply with any info hints they provide that are used by the MPI implementation (i.e., are returned by a call to [[versions/v40/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] ) and that place a restriction on the behavior of the application.== Hints are specified on a per file basis, in [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , [[versions/v40/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] , [[versions/v40/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , and [[versions/v40/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v40/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v40/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.

> It may happen that a program is coded with hints for one system, and later executes on another system that does not support these hints. In general, unsupported hints should simply be ignored. ~~Needless to say, no hint can be mandatory.~~ ==> >== However, for each hint used by a specific implementation, a default value must be provided when the user does not specify a value for this hint.

[[versions/v40/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] ~~sets new values for~~ ==updates== the hints of the file associated with ~~`fh`.~~ ==`fh` using the hints provided in `info`. This operation has no effect on previously set or defaulted hints that are not specified by `info`. It also has no effect on previously set or defaulted hints that are specified by `info`, but are ignored by the MPI implementation in this call to [[versions/v40/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] .== [[versions/v40/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] is a collective routine. The info object may be different on each process, but any info entries that an implementation requires to be the same on all processes must appear with the same value in each process’s info object.

> Many info items that an implementation can use when it creates or opens a file cannot easily be changed once the file has been created or opened. Thus, an implementation may ignore hints issued in this call that it would have accepted in an open call. ==An implementation may also be unable to update certain info hints in a call to [[versions/v40/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v40/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] . [[versions/v40/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] can be used to determine whether info changes were ignored by the implementation.==

~~[[versions/v40/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] returns a new info object containing the hints of the file associated with `fh`. The current setting of all hints actually used by the system related to this open file is returned in `info_used`. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pairs. The user is responsible for freeing `info_used` via [[versions/v40/API/MPI_INFO_FREE|MPI_INFO_FREE]] .~~

~~> [!note] Advice to users~~

~~> The info object returned in `info_used` will contain all hints currently active for this file. This set of hints may be greater or smaller than the set of hints passed in to [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , [[versions/v40/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , or [[versions/v40/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , as the system may not recognize some hints set by the user, and may recognize other hints that the user has not set.~~

==[[versions/v40/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] returns a new info object containing the hints of the file associated with `fh`. The current setting of all hints related to this file is returned in `info_used`. An MPI implementation is required to return all hints that are supported by the implementation and have default values specified; any user-supplied hints that were not ignored by the implementation; and any additional hints that were set by the implementation. If no such hints exist, a handle to a newly created info object is returned that contains no (key,value) pairs. The user is responsible for freeing `info_used` via [[versions/v40/API/MPI_INFO_FREE|MPI_INFO_FREE]] .==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Hints specified via `info` (see [[Chapter]] subsec:info) allow a user to provide information such as file access patterns and file system specifics to direct optimization. Providing hints may enable an implementation to deliver increased I/O performance or minimize the use of system resources. ~~An~~ ==As described in [[versions/v41/sections/misc#The Info Object|The Info Object]] , an== implementation is free to ignore all hints; however, applications must comply with any info hints they provide that are used by the MPI implementation (i.e., are returned by a call to [[versions/v41/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] ) and that place a restriction on the behavior of the application. Hints are specified on a per file basis, in [[versions/v41/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , [[versions/v41/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] , [[versions/v41/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , and [[versions/v41/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v41/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v41/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

Hints specified via `info` (see [[Chapter]] subsec:info) allow a user to provide ~~information~~ ==information,== such as file access patterns and file system specifics to direct optimization. Providing hints may enable an implementation to deliver increased I/O performance or minimize the use of system resources. As described in ~~[[versions/v50/sections/misc#The Info Object|The Info Object]] ,~~ ==[[Chapter]] subsec:info,== an implementation is free to ignore all hints; however, applications must comply with any info hints they provide that are used by the MPI implementation (i.e., are returned by a call to [[versions/v50/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] ) and that place a restriction on the behavior of the application. Hints are specified on a per file basis, in [[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , [[versions/v50/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] , [[versions/v50/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , and [[versions/v50/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , via the opaque `info` object. When an info object that specifies a subset of valid hints is passed to [[versions/v50/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v50/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that ~~the~~ `info` does not specify.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#File Info]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#File Info]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#File Info]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#File Info]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#File Info]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#File Info]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#File Info]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#File Info]]

---
title: "Opening a File"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Opening a File

Chapter **io** · in [[versions/v20/sections/io#Opening a File|MPI-2.0]], [[versions/v21/sections/io#Opening a File|MPI-2.1]], [[versions/v22/sections/io#Opening a File|MPI-2.2]], [[versions/v30/sections/io#Opening a File|MPI-3.0]], [[versions/v31/sections/io#Opening a File|MPI-3.1]], [[versions/v40/sections/io#Opening a File|MPI-4.0]], [[versions/v41/sections/io#Opening a File|MPI-4.1]], [[versions/v50/sections/io#Opening a File|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (6 changed paragraphs)

(see Section [[versions/v22/sections/io#I/O Error Handling|I/O Error Handling]] , page [[versions/v22/sections/io#I/O Error Handling|I/O Error Handling]] ). A process can open a file independently of other processes by using the ~~MPI_COMM_SELF~~ ==`MPI_COMM_SELF`== communicator. The file handle returned, `fh`, can be subsequently used to access the file until the file is closed using `MPI_FILE_CLOSE`. Before calling `MPI_FINALIZE`, the user is required to close (via `MPI_FILE_CLOSE`) all files that were opened with `MPI_FILE_OPEN`. Note that the communicator `comm` is unaffected by `MPI_FILE_OPEN` and continues to be usable in all MPI routines (e.g., `MPI_SEND`). Furthermore, the use of `comm` will not interfere with I/O behavior.

- ~~MPI_MODE_RDONLY~~ ==`MPI_MODE_RDONLY`== — read only,

- ~~MPI_MODE_RDWR~~ ==`MPI_MODE_RDWR`== — reading and writing,

- ~~MPI_MODE_WRONLY~~ ==`MPI_MODE_WRONLY`== — write only,

- ~~MPI_MODE_CREATE~~ ==`MPI_MODE_CREATE`== — create the file if it does not exist,

- ~~MPI_MODE_EXCL~~ ==`MPI_MODE_EXCL`== — error if creating file that already exists,

- ~~MPI_MODE_DELETE_ON_CLOSE~~ ==`MPI_MODE_DELETE_ON_CLOSE`== — delete file on close,

- ~~MPI_MODE_UNIQUE_OPEN~~ ==`MPI_MODE_UNIQUE_OPEN`== — file will not be concurrently opened elsewhere,

- ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== — file will only be accessed sequentially,

- ~~MPI_MODE_APPEND~~ ==`MPI_MODE_APPEND`== — set initial position of all file pointers to end of file.

The modes ~~MPI_MODE_RDONLY, MPI_MODE_RDWR, MPI_MODE_WRONLY, MPI_MODE_CREATE,~~ ==`MPI_MODE_RDONLY`, `MPI_MODE_RDWR`, `MPI_MODE_WRONLY`, `MPI_MODE_CREATE`,== and ~~MPI_MODE_EXCL~~ ==`MPI_MODE_EXCL`== have identical semantics to their POSIX counterparts . Exactly one of ~~MPI_MODE_RDONLY, MPI_MODE_RDWR,~~ ==`MPI_MODE_RDONLY`, `MPI_MODE_RDWR`,== or ~~MPI_MODE_WRONLY,~~ ==`MPI_MODE_WRONLY`,== must be specified. It is erroneous to specify ~~MPI_MODE_CREATE~~ ==`MPI_MODE_CREATE`== or ~~MPI_MODE_EXCL~~ ==`MPI_MODE_EXCL`== in conjunction with ~~MPI_MODE_RDONLY;~~ ==`MPI_MODE_RDONLY`;== it is erroneous to specify ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== together with ~~MPI_MODE_RDWR.~~ ==`MPI_MODE_RDWR`.==

The ~~MPI_MODE_DELETE_ON_CLOSE~~ ==`MPI_MODE_DELETE_ON_CLOSE`== mode causes the file to be deleted (equivalent to performing an `MPI_FILE_DELETE`) when the file is closed.

The ~~MPI_MODE_UNIQUE_OPEN~~ ==`MPI_MODE_UNIQUE_OPEN`== mode allows an implementation to optimize access by eliminating the overhead of file locking. It is erroneous to open a file in this mode unless the file will not be concurrently opened elsewhere.

> For ~~MPI_MODE_UNIQUE_OPEN,~~ ==`MPI_MODE_UNIQUE_OPEN`,== *not opened elsewhere* includes both inside and outside the MPI environment. In particular, one needs to be aware of potential external events which may open files (e.g., automated backup facilities). When ~~MPI_MODE_UNIQUE_OPEN~~ ==`MPI_MODE_UNIQUE_OPEN`== is specified, the user is responsible for ensuring that no such external events take place.

The ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== mode allows an implementation to optimize access to some sequential devices (tapes and network streams).

Specifying ~~MPI_MODE_APPEND~~ ==`MPI_MODE_APPEND`== only guarantees that all shared and individual file pointers are positioned at the initial end of file when `MPI_FILE_OPEN` returns. Subsequent positioning of file pointers is application dependent. In particular, the implementation does not ensure that all writes are appended.

The constant ~~MPI_INFO_NULL~~ ==`MPI_INFO_NULL`==

### MPI-2.2 → MPI-3.0  (7 changed paragraphs)

~~(Values for `info` may vary.)~~

~~`comm` must be an intracommunicator; it is erroneous to pass an intercommunicator to `MPI_FILE_OPEN`.~~

~~Errors in `MPI_FILE_OPEN` are raised~~

~~using the default file error handler~~

~~(see Section [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] , page [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] ). A process can open a file independently of other processes by using the `MPI_COMM_SELF` communicator. The file handle returned, `fh`, can be subsequently used to access the file until the file is closed using `MPI_FILE_CLOSE`. Before calling `MPI_FINALIZE`, the user is required to close (via `MPI_FILE_CLOSE`) all files that were opened with `MPI_FILE_OPEN`. Note that the communicator `comm` is unaffected by `MPI_FILE_OPEN` and continues to be usable in all MPI routines (e.g., `MPI_SEND`). Furthermore, the use of `comm` will not interfere with I/O behavior.~~

==(Values for `info` may vary.) `comm` must be an intracommunicator; it is erroneous to pass an intercommunicator to `MPI_FILE_OPEN`. Errors in `MPI_FILE_OPEN` are raised==

==using the default file error handler (see Section [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] , page [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] ). A process can open a file independently of other processes by using the `MPI_COMM_SELF` communicator. The file handle returned, `fh`, can be subsequently used to access the file until the file is closed using `MPI_FILE_CLOSE`. Before calling `MPI_FINALIZE`, the user is required to close (via `MPI_FILE_CLOSE`) all files that were opened with `MPI_FILE_OPEN`. Note that the communicator `comm` is unaffected by `MPI_FILE_OPEN` and continues to be usable in all MPI routines (e.g., `MPI_SEND`). Furthermore, the use of `comm` will not interfere with I/O behavior.==

> An implementation may require that `filename` include a string or strings specifying additional information about the file. > > Examples include the type of filesystem (e.g., a prefix of ~~ufs:),~~ ==`ufs:`),== a remote hostname (e.g., a prefix of ~~machine.univ.edu:),~~ ==`machine.univ.edu:`),== or a file password (e.g., a suffix of ~~/PASSWORD=SECRET).~~ ==`/PASSWORD=SECRET`).==

~~> On some implementations of MPI, the file namespace may not be identical from all processes of all applications. For example, “/tmp/foo” may denote different files on different processes, or a single file may have many names, dependent on process location. The user is responsible for ensuring that a single file is referenced by the `filename` argument, as it may be impossible for an implementation to detect this type of namespace error.~~

~~Initially, all processes view the file as a linear byte stream, and each process views data in its own native representation~~

~~(no data representation conversion is performed).~~

~~(POSIX files are linear byte streams in the native representation.) The file view can be changed via the `MPI_FILE_SET_VIEW` routine.~~

==> On some implementations of MPI, the file namespace may not be identical from all processes of all applications. For example, “`/tmp/foo`” may denote different files on different processes, or a single file may have many names, dependent on process location. The user is responsible for ensuring that a single file is referenced by the `filename` argument, as it may be impossible for an implementation to detect this type of namespace error.==

==Initially, all processes view the file as a linear byte stream, and each process views data in its own native representation (no data representation conversion is performed). (POSIX files are linear byte streams in the native representation.) The file view can be changed via the `MPI_FILE_SET_VIEW` routine.==

> ~~C/C++~~ ==C== users can use bit vector OR ($`\mid`$) to combine these constants; ~~> >~~ Fortran 90 users can use the bit vector `IOR` intrinsic. Fortran 77 users can use (nonportably) bit vector `IOR` ~~> >~~ on systems that support it. Alternatively, Fortran users can portably use integer addition to OR the constants (each constant should appear at most once in the addition.).

~~Errors related to the access mode are raised~~

~~in the class `MPI_ERR_AMODE`.~~

==Errors related to the access mode are raised in the class `MPI_ERR_AMODE`.==

~~(see Section [[versions/v30/sections/io#File Info|File Info]] , page [[versions/v30/sections/io#File Info|File Info]] ).~~

~~The constant `MPI_INFO_NULL`~~

==(see Section [[versions/v30/sections/io#File Info|File Info]] , page [[versions/v30/sections/io#File Info|File Info]] ). The constant `MPI_INFO_NULL`==

~~Files are opened by default using nonatomic mode file consistency semantics (see Section [[versions/v30/sections/io#File Consistency|File Consistency]] , page [[versions/v30/sections/io#File Consistency|File Consistency]] ). The more stringent atomic mode consistency semantics,~~

~~required for atomicity of conflicting accesses,~~

~~can be set using `MPI_FILE_SET_ATOMICITY`.~~

==Files are opened by default using nonatomic mode file consistency semantics (see Section [[versions/v30/sections/io#File Consistency|File Consistency]] , page [[versions/v30/sections/io#File Consistency|File Consistency]] ). The more stringent atomic mode consistency semantics, required for atomicity of conflicting accesses, can be set using `MPI_FILE_SET_ATOMICITY`.==

### MPI-3.0 → MPI-3.1  (7 changed paragraphs)

~~`MPI_FILE_OPEN` opens the file identified by the file name `filename` on all processes in the `comm` communicator group. `MPI_FILE_OPEN` is a collective routine: all processes must provide the same value for `amode`, and all processes must provide `filename`s that reference the same file.~~

~~(Values for `info` may vary.) `comm` must be an intracommunicator; it is erroneous to pass an intercommunicator to `MPI_FILE_OPEN`. Errors in `MPI_FILE_OPEN` are raised~~

~~using the default file error handler (see Section [[versions/v31/sections/io#I/O Error Handling|I/O Error Handling]] , page [[versions/v31/sections/io#I/O Error Handling|I/O Error Handling]] ). A process can open a file independently of other processes by using the `MPI_COMM_SELF` communicator. The file handle returned, `fh`, can be subsequently used to access the file until the file is closed using `MPI_FILE_CLOSE`. Before calling `MPI_FINALIZE`, the user is required to close (via `MPI_FILE_CLOSE`) all files that were opened with `MPI_FILE_OPEN`. Note that the communicator `comm` is unaffected by `MPI_FILE_OPEN` and continues to be usable in all MPI routines (e.g., `MPI_SEND`). Furthermore, the use of `comm` will not interfere with I/O behavior.~~

==[[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] opens the file identified by the file name `filename` on all processes in the `comm` communicator group. [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] is a collective routine: all processes must provide the same value for `amode`, and all processes must provide `filename`s that reference the same file. (Values for `info` may vary.) `comm` must be an intracommunicator; it is erroneous to pass an intercommunicator to [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] . Errors in [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] are raised using the default file error handler (see [[versions/v31/sections/io#I/O Error Handling|I/O Error Handling]] ). A process can open a file independently of other processes by using the `MPI_COMM_SELF` communicator. The file handle returned, `fh`, can be subsequently used to access the file until the file is closed using [[versions/v31/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] . Before calling [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] , the user is required to close (via [[versions/v31/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] ) all files that were opened with [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] . Note that the communicator `comm` is unaffected by [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] and continues to be usable in all MPI routines (e.g., [[versions/v31/API/MPI_SEND|MPI_SEND]] ). Furthermore, the use of `comm` will not interfere with I/O behavior.==

> An implementation may require that `filename` include a string or strings specifying additional information about the file. ~~> >~~ Examples include the type of filesystem (e.g., a prefix of `ufs:`), a remote hostname (e.g., a prefix of `machine.univ.edu:`), or a file password (e.g., a suffix of `/PASSWORD=SECRET`).

Initially, all processes view the file as a linear byte stream, and each process views data in its own native representation (no data representation conversion is performed). (POSIX files are linear byte streams in the native representation.) The file view can be changed via the ~~`MPI_FILE_SET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]]== routine.

The `MPI_MODE_DELETE_ON_CLOSE` mode causes the file to be deleted (equivalent to performing an ~~`MPI_FILE_DELETE`)~~ ==[[versions/v31/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] )== when the file is closed.

~~The `MPI_MODE_SEQUENTIAL` mode allows an implementation to optimize access to some sequential devices (tapes and network streams).~~

~~It is erroneous to attempt nonsequential access to a file that has been opened in this mode.~~

~~Specifying `MPI_MODE_APPEND` only guarantees that all shared and individual file pointers are positioned at the initial end of file when `MPI_FILE_OPEN` returns. Subsequent positioning of file pointers is application dependent. In particular, the implementation does not ensure that all writes are appended.~~

==The `MPI_MODE_SEQUENTIAL` mode allows an implementation to optimize access to some sequential devices (tapes and network streams). It is erroneous to attempt nonsequential access to a file that has been opened in this mode.==

==Specifying `MPI_MODE_APPEND` only guarantees that all shared and individual file pointers are positioned at the initial end of file when [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] returns. Subsequent positioning of file pointers is application dependent. In particular, the implementation does not ensure that all writes are appended.==

~~The `info` argument is used to provide information regarding file access patterns and file system specifics~~

~~(see Section [[versions/v31/sections/io#File Info|File Info]] , page [[versions/v31/sections/io#File Info|File Info]] ). The constant `MPI_INFO_NULL`~~

~~can be used when no info needs to be specified.~~

==The `info` argument is used to provide information regarding file access patterns and file system specifics (see [[versions/v31/sections/io#File Info|File Info]] ). The constant `MPI_INFO_NULL` can be used when no info needs to be specified.==

Files are opened by default using nonatomic mode file consistency semantics (see ~~Section [[versions/v31/sections/io#File Consistency|File Consistency]] , page~~ [[versions/v31/sections/io#File Consistency|File Consistency]] ). The more stringent atomic mode consistency semantics, required for atomicity of conflicting accesses, can be set using ~~`MPI_FILE_SET_ATOMICITY`.~~ ==[[versions/v31/API/MPI_FILE_SET_ATOMICITY|MPI_FILE_SET_ATOMICITY]] .==

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

[[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] opens the file identified by the file name `filename` on all processes in the `comm` communicator group. [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] is a collective routine: all processes must provide the same value for `amode`, and all processes must provide `filename`s that reference the same file. (Values for `info` may vary.) `comm` must be an ~~intracommunicator;~~ ==intra-communicator;== it is erroneous to pass an ~~intercommunicator~~ ==inter-communicator== to [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] . Errors in [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] are raised using the default file error handler (see [[versions/v40/sections/io#I/O Error Handling|I/O Error Handling]] ). ~~A~~ ==When using the World Model (Section [[versions/v40/sections/dynamic#Introduction|Introduction]] ), a== process can open a file independently of other processes by using the `MPI_COMM_SELF` communicator. ==Applications using the Sessions Model (Section [[versions/v40/sections/dynamic#The Sessions Model|The Sessions Model]] ) can achieve the same result using communicators created from the `mpi://SELF` process set.== The file handle returned, `fh`, can be subsequently used to access the file until the file is closed using [[versions/v40/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] . Before calling [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] , the user is required to close (via [[versions/v40/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] ) all files that were opened with [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] . Note that the communicator `comm` is unaffected by [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] and continues to be usable in all MPI routines (e.g., [[versions/v40/API/MPI_SEND|MPI_SEND]] ). Furthermore, the use of `comm` will not interfere with I/O behavior.

The following access modes are supported (specified in `amode`, a bit vector ~~OR~~ ==`OR`== of the following integer constants):

- ~~`MPI_MODE_RDONLY` — read~~ ==`MPI_MODE_RDONLY`—read== only,

- ~~`MPI_MODE_RDWR` — reading~~ ==`MPI_MODE_RDWR`—reading== and writing,

- ~~`MPI_MODE_WRONLY` — write~~ ==`MPI_MODE_WRONLY`—write== only,

- ~~`MPI_MODE_CREATE` — create~~ ==`MPI_MODE_CREATE`—create== the file if it does not exist,

- ~~`MPI_MODE_EXCL` — error~~ ==`MPI_MODE_EXCL`—error== if creating file that already exists,

- ~~`MPI_MODE_DELETE_ON_CLOSE` — delete~~ ==`MPI_MODE_DELETE_ON_CLOSE`—delete== file on close,

- ~~`MPI_MODE_UNIQUE_OPEN` — file~~ ==`MPI_MODE_UNIQUE_OPEN`—file== will not be concurrently opened elsewhere,

- ~~`MPI_MODE_SEQUENTIAL` — file~~ ==`MPI_MODE_SEQUENTIAL`—file== will only be accessed sequentially,

- ~~`MPI_MODE_APPEND` — set~~ ==`MPI_MODE_APPEND`—set== initial position of all file pointers to end of file.

> C users can use bit vector ~~OR~~ ==`OR`== ($`\mid`$) to combine these constants; Fortran 90 users can use the bit vector `IOR` intrinsic. Fortran 77 users can use (nonportably) bit vector `IOR` on systems that support it. Alternatively, Fortran users can portably use integer addition to ~~OR~~ ==`OR`== the constants (each constant should appear at most once in the addition.).

> The values of these constants must be defined such that the bitwise ~~OR~~ ==`OR`== and the sum of any distinct set of these constants is equivalent.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~- `MPI_MODE_RDONLY`—read only,~~ ==read only==

~~- `MPI_MODE_RDWR`—reading~~ ==reading== and ~~writing,~~ ==writing==

~~- `MPI_MODE_WRONLY`—write only,~~ ==write only==

~~- `MPI_MODE_CREATE`—create~~ ==create== the file if it does not ~~exist,~~ ==exist==

~~- `MPI_MODE_EXCL`—error~~ ==error== if creating file that already ~~exists,~~ ==exists==

~~- `MPI_MODE_DELETE_ON_CLOSE`—delete~~ ==delete== file on ~~close,~~ ==close==

~~- `MPI_MODE_UNIQUE_OPEN`—file~~ ==file== will not be concurrently opened ~~elsewhere,~~ ==elsewhere==

~~- `MPI_MODE_SEQUENTIAL`—file~~ ==file== will only be accessed ~~sequentially,~~ ==sequentially==

~~- `MPI_MODE_APPEND`—set~~ ==set== initial position of all file pointers to end of ~~file.~~ ==file==

> For `MPI_MODE_UNIQUE_OPEN`, *not opened elsewhere* includes both inside and outside the MPI environment. In particular, one needs to be aware of potential external events ~~which~~ ==that== may open files (e.g., automated backup facilities). When `MPI_MODE_UNIQUE_OPEN` is specified, the user is responsible for ensuring that no such external events take place.

### MPI-4.1 → MPI-5.0  (4 changed paragraphs)

[[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] opens the file identified by the file name `filename` on all processes in the `comm` communicator group. [[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] is a collective routine: all processes must provide the same value for `amode`, and all processes must provide `filename`s that reference the same file. (Values for `info` may vary.) `comm` must be an intra-communicator; it is erroneous to pass an inter-communicator to [[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] . Errors in [[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] are raised using the default file error handler (see [[versions/v50/sections/io#I/O Error Handling|I/O Error Handling]] ). When using the World Model (Section [[versions/v50/sections/dynamic#Introduction|Introduction]] ), a process can open a file independently of other processes by using the `MPI_COMM_SELF` communicator. Applications using the Sessions Model (Section [[versions/v50/sections/dynamic#The Sessions Model|The Sessions Model]] ) can achieve the same result using communicators created from the `mpi://SELF` process set. The file handle returned, `fh`, can ==subsequently== be ~~subsequently~~ used to access the file until the file is closed using [[versions/v50/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] . Before calling [[versions/v50/API/MPI_FINALIZE|MPI_FINALIZE]] , the user is required to close (via [[versions/v50/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] ) all files that were opened with [[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] . Note that the communicator `comm` is unaffected by ==calls to== [[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] and continues to be usable in all MPI routines (e.g., [[versions/v50/API/MPI_SEND|MPI_SEND]] ). Furthermore, the use of `comm` will not interfere with I/O behavior.

The following access modes are supported (specified in `amode`, a bit vector ==created by== `OR` ==with one or more== of the following integer constants):

file will not be ==opened== concurrently ~~opened~~ elsewhere

The `MPI_MODE_UNIQUE_OPEN` mode allows an implementation to optimize access by eliminating the overhead of file locking. It is erroneous to open a file in this mode unless the file will not be ==opened== concurrently ~~opened~~ elsewhere.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Opening a File]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Opening a File]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Opening a File]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Opening a File]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Opening a File]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Opening a File]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Opening a File]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Opening a File]]

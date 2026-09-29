---
title: "Split Collective Data Access Routines"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Split Collective Data Access Routines

Chapter **io** · in [[versions/v20/sections/io#Split Collective Data Access Routines|MPI-2.0]], [[versions/v21/sections/io#Split Collective Data Access Routines|MPI-2.1]], [[versions/v22/sections/io#Split Collective Data Access Routines|MPI-2.2]], [[versions/v30/sections/io#Split Collective Data Access Routines|MPI-3.0]], [[versions/v31/sections/io#Split Collective Data Access Routines|MPI-3.1]], [[versions/v40/sections/io#Split Collective Data Access Routines|MPI-4.0]], [[versions/v41/sections/io#Split Collective Data Access Routines|MPI-4.1]], [[versions/v50/sections/io#Split Collective Data Access Routines|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~MPI provides a restricted form of “nonblocking collective” I/O operations for all data accesses using split collective data access routines. These routines are referred to as “split” collective routines because a single collective operation is split in two: a begin routine and an end routine. The begin routine begins the operation, much like a nonblocking data access (e.g., `MPI_FILE_IREAD`). The end routine completes the operation, much like the matching test or wait (e.g., `MPI_WAIT`). As with nonblocking data access operations,~~

~~the user must not use the buffer~~

==MPI provides a restricted form of “nonblocking collective” I/O operations for all data accesses using split collective data access routines. These routines are referred to as “split” collective routines because a single collective operation is split in two: a begin routine and an end routine. The begin routine begins the operation, much like a nonblocking data access (e.g., `MPI_FILE_IREAD`). The end routine completes the operation, much like the matching test or wait (e.g., `MPI_WAIT`). As with nonblocking data access operations, the user must not use the buffer==

~~- End calls are collective over the group of processes that participated in the collective open and follow the ordering rules for collective calls.~~

~~  Each end call matches~~

==- End calls are collective over the group of processes that participated in the collective open and follow the ordering rules for collective calls. Each end call matches==

- Split collective operations do not match the corresponding regular collective operation. ==For example, in a single collective read operation, an `MPI_FILE_READ_ALL` on one process does not match an `MPI_FILE_READ_ALL_BEGIN`/`MPI_FILE_READ_ALL_END` pair on another process.==

~~For example,~~ ==- Split collective routines must specify a buffer== in ~~a single collective read operation, an `MPI_FILE_READ_ALL` on one process does not match an `MPI_FILE_READ_ALL_BEGIN`/`MPI_FILE_READ_ALL_END` pair on another process.~~ ==both the begin and end routines. By specifying the buffer that receives data in the end routine, we can avoid the problems described in “A Problem with Code Movements and Register Optimization,”==

~~- Split collective routines must specify a buffer in both the begin~~ ==Section [[versions/v30/sections/binding#Problems with Code Movement== and ~~end routines. By specifying the buffer that receives data in the end routine, we can avoid many (though~~ ==Register Optimization|Problems with Code Movement and Register Optimization]] on page [[versions/v30/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] , but== not ~~all)~~ ==all== of the problems described in ~~“A Problem with Register Optimization,”~~ Section ~~[[versions/v30/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]] ,~~ ==[[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] on== page ~~[[versions/v30/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]]~~ ==[[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]]== .

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~MPI provides a restricted form of “nonblocking collective” I/O operations for all data accesses using split collective data access routines. These routines are referred to as “split” collective routines because a single collective operation is split in two: a begin routine and an end routine. The begin routine begins the operation, much like a nonblocking data access (e.g., `MPI_FILE_IREAD`). The end routine completes the operation, much like the matching test or wait (e.g., `MPI_WAIT`). As with nonblocking data access operations, the user must not use the buffer~~

~~passed to a begin routine while the routine is outstanding; the operation must be completed with an end routine before it is safe to free buffers, etc.~~

==MPI provides a restricted form of “nonblocking collective” I/O operations for all data accesses using split collective data access routines. These routines are referred to as “split” collective routines because a single collective operation is split in two: a begin routine and an end routine. The begin routine begins the operation, much like a nonblocking data access (e.g., [[versions/v31/API/MPI_FILE_IREAD|MPI_FILE_IREAD]] ). The end routine completes the operation, much like the matching test or wait (e.g., [[versions/v31/API/MPI_WAIT|MPI_WAIT]] ). As with nonblocking data access operations, the user must not use the buffer passed to a begin routine while the routine is outstanding; the operation must be completed with an end routine before it is safe to free buffers, etc.==

~~- End calls are collective over the group of processes that participated in the collective open and follow the ordering rules for collective calls. Each end call matches~~

~~  the preceding begin call for the same collective operation. When an “end” call is made, exactly one unmatched “begin” call for the same operation must precede it.~~

==- End calls are collective over the group of processes that participated in the collective open and follow the ordering rules for collective calls. Each end call matches the preceding begin call for the same collective operation. When an “end” call is made, exactly one unmatched “begin” call for the same operation must precede it.==

~~- Split collective operations do not match the corresponding regular collective operation. For example, in a single collective read operation, an `MPI_FILE_READ_ALL` on one process does not match an `MPI_FILE_READ_ALL_BEGIN`/`MPI_FILE_READ_ALL_END` pair on another process.~~

~~- Split collective routines must specify a buffer in both the begin and end routines. By specifying the buffer that receives data in the end routine, we can avoid the problems described in “A Problem with Code Movements and Register Optimization,”~~

~~  Section [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] on page [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] , but not all of the problems described in Section [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] on page [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] .~~

==- Split collective operations do not match the corresponding regular collective operation. For example, in a single collective read operation, an [[versions/v31/API/MPI_FILE_READ_ALL|MPI_FILE_READ_ALL]] on one process does not match an [[versions/v31/API/MPI_FILE_READ_ALL_BEGIN|MPI_FILE_READ_ALL_BEGIN]] / [[versions/v31/API/MPI_FILE_READ_ALL_END|MPI_FILE_READ_ALL_END]] pair on another process.==

==- Split collective routines must specify a buffer in both the begin and end routines. By specifying the buffer that receives data in the end routine, we can avoid the problems described in “A Problem with Code Movements and Register Optimization,” [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] , but not all of the problems, such as those described in [[Sections]] sec:misc-sequence, [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] , and [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] .==

The arguments for these routines have the same meaning as for the equivalent collective versions (e.g., the argument definitions for ~~`MPI_FILE_READ_ALL_BEGIN`~~ ==[[versions/v31/API/MPI_FILE_READ_ALL_BEGIN|MPI_FILE_READ_ALL_BEGIN]]== and ~~`MPI_FILE_READ_ALL_END`~~ ==[[versions/v31/API/MPI_FILE_READ_ALL_END|MPI_FILE_READ_ALL_END]]== are equivalent to the arguments for ~~`MPI_FILE_READ_ALL`).~~ ==[[versions/v31/API/MPI_FILE_READ_ALL|MPI_FILE_READ_ALL]] ).== The begin routine (e.g., ~~`MPI_FILE_READ_ALL_BEGIN`)~~ ==[[versions/v31/API/MPI_FILE_READ_ALL_BEGIN|MPI_FILE_READ_ALL_BEGIN]] )== begins a split collective operation that, when completed with the matching end routine (i.e., ~~`MPI_FILE_READ_ALL_END`)~~ ==[[versions/v31/API/MPI_FILE_READ_ALL_END|MPI_FILE_READ_ALL_END]] )== produces the result as defined for the equivalent collective routine (i.e., ~~`MPI_FILE_READ_ALL`).~~ ==[[versions/v31/API/MPI_FILE_READ_ALL|MPI_FILE_READ_ALL]] ).==

For the purpose of consistency semantics ~~(Section [[versions/v31/sections/io#File Consistency|File Consistency]] , page~~ ==(== [[versions/v31/sections/io#File Consistency|File Consistency]] ), a matched pair of split collective data access operations (e.g., ~~`MPI_FILE_READ_ALL_BEGIN`~~ ==[[versions/v31/API/MPI_FILE_READ_ALL_BEGIN|MPI_FILE_READ_ALL_BEGIN]]== and ~~`MPI_FILE_READ_ALL_END`)~~ ==[[versions/v31/API/MPI_FILE_READ_ALL_END|MPI_FILE_READ_ALL_END]] )== compose a single data access.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

==  According to the definitions in Section [[versions/v40/sections/terms#MPI Procedures|MPI Procedures]] , the begin procedures are incomplete. They are also non-local procedures because they may or may not return before they are called in all MPI processes of the process group.==

==  > [!note] Advice to users==

==  > This is one of the exceptions in which incomplete procedures are non-local and therefore blocking.==

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

MPI provides a restricted form of “nonblocking collective” I/O operations for all data accesses using split collective data access routines. These routines are referred to as “split” collective ~~routines~~ ==routines,== because a single collective operation is split in two: a begin routine and an end routine. The begin routine begins the operation, much like a nonblocking data access (e.g., [[versions/v41/API/MPI_FILE_IREAD|MPI_FILE_IREAD]] ). The end routine completes the operation, much like the matching test or wait (e.g., [[versions/v41/API/MPI_WAIT|MPI_WAIT]] ). As with nonblocking data access operations, the user must not use the buffer passed to a begin routine while the routine is outstanding; the operation must be completed with an end routine before it is safe to free buffers, etc.

According to the definitions in Section [[versions/v41/sections/terms#MPI Procedures|MPI Procedures]] , the begin procedures are incomplete. They are also ~~non-local~~ ==nonlocal== procedures because they may or may not return before they are called in all MPI processes of the process group.

> This is one of the exceptions in which incomplete procedures are ~~non-local~~ ==nonlocal== and therefore blocking.

- Split collective routines must specify a buffer in both the begin and end routines. By specifying the buffer that receives data in the end routine, we can avoid the problems described in ~~“A Problem with Code Movements and Register Optimization,”~~ ==,== [[versions/v41/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] , but not all of the problems, such as those described in [[Sections]] sec:misc-sequence, [[versions/v41/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] , and [[versions/v41/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] .

- No collective I/O operations are permitted on a file handle concurrently with a split collective access on that file handle (i.e., between the begin and end of the access). That ==is, the following example== is ==erroneous.==

~~MPI_File_read_all_begin(fh, ...); ... MPI_File_read_all(fh, ...); ... MPI_File_read_all_end(fh, ...);~~ ==Erroneous example fragment of concurrent split collective access on a file handle:==

~~is erroneous.~~ ==``` [MPI]C MPI_File_read_all_begin(fh, ...); ... MPI_File_read_all(fh, ...); ... MPI_File_read_all_end(fh, ...); ```==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Split Collective Data Access Routines]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Split Collective Data Access Routines]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Split Collective Data Access Routines]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Split Collective Data Access Routines]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Split Collective Data Access Routines]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Split Collective Data Access Routines]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Split Collective Data Access Routines]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Split Collective Data Access Routines]]

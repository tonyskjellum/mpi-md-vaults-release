---
title: "Nonblocking Collective File Operations"
chapter: io
present_in: ["MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Nonblocking Collective File Operations

Chapter **io** · in [[versions/v31/sections/io#Nonblocking Collective File Operations|MPI-3.1]], [[versions/v40/sections/io#Nonblocking Collective File Operations|MPI-4.0]], [[versions/v41/sections/io#Nonblocking Collective File Operations|MPI-4.1]], [[versions/v50/sections/io#Nonblocking Collective File Operations|MPI-5.0]]

## Changes along the time axis

### MPI-3.0 → MPI-3.1

_Section appears in MPI-3.1._

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~Nonblocking collective file operations are defined only for data access routines with explicit offsets and individual file pointers but not with shared file pointers.~~

==Nonblocking collective file operations are defined only for data access==

== routines with explicit offsets and individual file pointers but not with shared file pointers.==

All nonblocking collective I/O calls are local and return immediately, irrespective of the status of other processes. The call initiates the operation which may progress independently of any communication, computation, or I/O. The call returns a request handle, which must be passed to a completion call. Input buffers should not be modified and output buffers should not be accessed before the completion call returns. The same ~~progress~~ ==*progress*== rules described for nonblocking collective operations apply for nonblocking collective I/O operations. For a complete discussion, please refer to the semantics set forth in [[versions/v40/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] .

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Nonblocking collective I/O operations do not match with blocking collective I/O operations. Multiple nonblocking collective I/O operations can be outstanding on a single file handle. High quality MPI implementations should be able to support a large number of ~~pending~~ ==*pending*== nonblocking I/O operations.

All nonblocking collective I/O calls are local and return immediately, irrespective of the status of other processes. The call initiates the operation ~~which~~ ==that== may progress independently of any communication, computation, or I/O. The call returns a request handle, which must be passed to a completion call. Input buffers should not be modified and output buffers should not be accessed before the completion call returns. The same *progress* rules described for nonblocking collective operations apply for nonblocking collective I/O operations. For a complete discussion, please refer to the semantics set forth in [[versions/v41/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] .

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

All nonblocking collective I/O calls are ~~local and return immediately, irrespective of the status of other processes.~~ ==local.== The call initiates the operation that may progress independently of any communication, computation, or I/O. The call returns a request handle, which must be passed to a completion call. Input buffers should not be modified and output buffers should not be accessed before the completion call returns. The same *progress* rules described for nonblocking collective operations apply for nonblocking collective I/O operations. For a complete discussion, please refer to the semantics set forth in [[versions/v50/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] .

## Text by release

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Nonblocking Collective File Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Nonblocking Collective File Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Nonblocking Collective File Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Nonblocking Collective File Operations]]

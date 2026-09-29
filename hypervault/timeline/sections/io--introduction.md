---
title: "Introduction"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Introduction

Chapter **io** · in [[versions/v20/sections/io#Introduction|MPI-2.0]], [[versions/v21/sections/io#Introduction|MPI-2.1]], [[versions/v22/sections/io#Introduction|MPI-2.2]], [[versions/v30/sections/io#Introduction|MPI-3.0]], [[versions/v31/sections/io#Introduction|MPI-3.1]], [[versions/v40/sections/io#Introduction|MPI-4.0]], [[versions/v41/sections/io#Introduction|MPI-4.1]], [[versions/v50/sections/io#Introduction|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~POSIX provides a model of a widely portable file system, but the portability and optimization needed for parallel I/O cannot be achieved with~~

~~the POSIX interface.~~

~~The significant optimizations required for efficiency (e.g., grouping , collective buffering , and disk-directed I/O ) can only be implemented~~

~~if the parallel I/O system provides a high-level interface supporting~~

==POSIX provides a model of a widely portable file system, but the portability and optimization needed for parallel I/O cannot be achieved with the POSIX interface.==

==The significant optimizations required for efficiency (e.g., grouping , collective buffering , and disk-directed I/O ) can only be implemented if the parallel I/O system provides a high-level interface supporting==

~~derived datatypes.~~

~~Compared to a limited set of predefined access patterns, this approach has the advantage of added flexibility and expressiveness.~~

==derived datatypes. Compared to a limited set of predefined access patterns, this approach has the advantage of added flexibility and expressiveness.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The significant optimizations required for efficiency (e.g., grouping , collective buffering , and disk-directed I/O ) can only be implemented if the parallel I/O system provides a high-level interface supporting~~

~~partitioning of file data among processes and a collective interface supporting~~

~~complete transfers of global data structures between process memories and files. In addition, further efficiencies can be gained via support for asynchronous I/O, strided accesses, and control over physical file layout on storage devices (disks). The I/O environment described in this chapter provides these facilities.~~

~~Instead of defining I/O~~

~~access modes to express the common patterns for accessing a shared file (broadcast, reduction, scatter, gather), we chose another approach in which data partitioning is expressed using~~

~~derived datatypes. Compared to a limited set of predefined access patterns, this approach has the advantage of added flexibility and expressiveness.~~

==The significant optimizations required for efficiency (e.g., grouping , collective buffering , and disk-directed I/O ) can only be implemented if the parallel I/O system provides a high-level interface supporting partitioning of file data among processes and a collective interface supporting complete transfers of global data structures between process memories and files. In addition, further efficiencies can be gained via support for asynchronous I/O, strided accesses, and control over physical file layout on storage devices (disks). The I/O environment described in this chapter provides these facilities.==

==Instead of defining I/O access modes to express the common patterns for accessing a shared file (broadcast, reduction, scatter, gather), we chose another approach in which data partitioning is expressed using derived datatypes. Compared to a limited set of predefined access patterns, this approach has the advantage of added flexibility and expressiveness.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Introduction]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Introduction]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Introduction]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Introduction]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Introduction]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Introduction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Introduction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Introduction]]

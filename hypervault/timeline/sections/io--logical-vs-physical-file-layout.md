---
title: "Logical vs. Physical File Layout"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Logical vs. Physical File Layout

Chapter **io** · in [[versions/v20/sections/io#Logical vs. Physical File Layout|MPI-2.0]], [[versions/v21/sections/io#Logical vs. Physical File Layout|MPI-2.1]], [[versions/v22/sections/io#Logical vs. Physical File Layout|MPI-2.2]], [[versions/v30/sections/io#Logical vs. Physical File Layout|MPI-3.0]], [[versions/v31/sections/io#Logical vs. Physical File Layout|MPI-3.1]], [[versions/v40/sections/io#Logical vs. Physical File Layout|MPI-4.0]], [[versions/v41/sections/io#Logical vs. Physical File Layout|MPI-4.1]], [[versions/v50/sections/io#Logical vs. Physical File Layout|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~MPI specifies how the data should be laid out in a virtual file structure (the view), not how that file structure is to be stored on one or more disks. Specification of the physical file structure was avoided because it is expected that the mapping of files to disks will be system specific, and any specific control over file layout would therefore restrict program portability.~~

~~However, there are still cases where some information may be necessary to optimize file layout. This information can be provided as *hints* specified via *info* when a file is created (see Section [[versions/v30/sections/io#File Info|File Info]] , page [[versions/v30/sections/io#File Info|File Info]] ).~~

==MPI specifies how the data should be laid out in a virtual file structure (the view), not how that file structure is to be stored on one or more disks. Specification of the physical file structure was avoided because it is expected that the mapping of files to disks will be system specific, and any specific control over file layout would therefore restrict program portability. However, there are still cases where some information may be necessary to optimize file layout. This information can be provided as *hints* specified via `info` when a file is created (see Section [[versions/v30/sections/io#File Info|File Info]] , page [[versions/v30/sections/io#File Info|File Info]] ).==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

MPI specifies how the data should be laid out in a virtual file structure (the view), not how that file structure is to be stored on one or more disks. Specification of the physical file structure was avoided because it is expected that the mapping of files to disks will be system specific, and any specific control over file layout would therefore restrict program portability. However, there are still cases where some information may be necessary to optimize file layout. This information can be provided as *hints* specified via `info` when a file is created (see ~~Section [[versions/v31/sections/io#File Info|File Info]] , page~~ [[versions/v31/sections/io#File Info|File Info]] ).

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Logical vs. Physical File Layout]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Logical vs. Physical File Layout]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Logical vs. Physical File Layout]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Logical vs. Physical File Layout]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Logical vs. Physical File Layout]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Logical vs. Physical File Layout]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Logical vs. Physical File Layout]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Logical vs. Physical File Layout]]

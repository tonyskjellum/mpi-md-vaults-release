---
title: "Synchronism"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Synchronism

Chapter **io** · in [[versions/v20/sections/io#Synchronism|MPI-2.0]], [[versions/v21/sections/io#Synchronism|MPI-2.1]], [[versions/v22/sections/io#Synchronism|MPI-2.2]], [[versions/v30/sections/io#Synchronism|MPI-3.0]], [[versions/v31/sections/io#Synchronism|MPI-3.1]], [[versions/v40/sections/io#Synchronism|MPI-4.0]], [[versions/v41/sections/io#Synchronism|MPI-4.1]], [[versions/v50/sections/io#Synchronism|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~A *blocking* I/O call will~~

~~not return~~

==A *blocking* I/O call will not return==

~~A *nonblocking* I/O call initiates an I/O operation, but does not wait for it to complete. Given suitable hardware, this allows the transfer of data out/in the user’s buffer to proceed concurrently with computation. A separate *request complete* call (`MPI_WAIT`, `MPI_TEST`, or any of their variants) is needed to complete the I/O request,~~

~~i.e., to confirm that the data has been read or written and that~~

==A *nonblocking* I/O call initiates an I/O operation, but does not wait for it to complete. Given suitable hardware, this allows the transfer of data out of and into the user’s buffer to proceed concurrently with computation. A separate *request complete* call (`MPI_WAIT`, `MPI_TEST`, or any of their variants) is needed to complete the I/O request, i.e., to confirm that the data has been read or written and that==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~A *blocking* I/O call will not return~~

~~until the I/O request is completed.~~

~~A *nonblocking* I/O call initiates an I/O operation, but does not wait for it to complete. Given suitable hardware, this allows the transfer of data out of and into the user’s buffer to proceed concurrently with computation. A separate *request complete* call (`MPI_WAIT`, `MPI_TEST`, or any of their variants) is needed to complete the I/O request, i.e., to confirm that the data has been read or written and that~~

~~it is safe for the user to reuse the buffer. The nonblocking versions of the routines are named <span class="sans-serif">MPI_FILE_IXXX</span>, where the <span class="sans-serif">I</span> stands for immediate.~~

==A *blocking* I/O call will not return until the I/O request is completed.==

==A *nonblocking* I/O call initiates an I/O operation, but does not wait for it to complete. Given suitable hardware, this allows the transfer of data out of and into the user’s buffer to proceed concurrently with computation. A separate *request complete* call ( [[versions/v31/API/MPI_WAIT|MPI_WAIT]] , [[versions/v31/API/MPI_TEST|MPI_TEST]] , or any of their variants) is needed to complete the I/O request, i.e., to confirm that the data has been read or written and that it is safe for the user to reuse the buffer. The nonblocking versions of the routines are named `MPI_FILE_IXXX` , where the `I` stands for immediate.==

The split collective routines support a restricted form of “nonblocking” operations for collective data access (see ~~Section [[versions/v31/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] , page~~ [[versions/v31/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] ).

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

A *nonblocking* I/O call initiates an I/O operation, but does not wait for it to complete. Given suitable hardware, this allows the transfer of data out of and into the user’s buffer to proceed concurrently with computation. A separate *request complete* call ( [[versions/v40/API/MPI_WAIT|MPI_WAIT]] , [[versions/v40/API/MPI_TEST|MPI_TEST]] , or any of their variants) is needed to complete the I/O request, i.e., to confirm that the data has been read or written and that it is safe for the user to reuse the buffer. The nonblocking versions of the routines are named ~~`MPI_FILE_IXXX` ,~~ ==`MPI_FILE_IXXX`,== where the `I` stands for immediate.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Synchronism]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Synchronism]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Synchronism]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Synchronism]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Synchronism]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Synchronism]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Synchronism]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Synchronism]]

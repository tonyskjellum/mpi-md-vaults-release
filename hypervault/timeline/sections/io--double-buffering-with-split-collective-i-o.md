---
title: "Double Buffering with Split Collective I/O"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Double Buffering with Split Collective I/O

Chapter **io** · in [[versions/v20/sections/io#Double Buffering with Split Collective I/O|MPI-2.0]], [[versions/v21/sections/io#Double Buffering with Split Collective I/O|MPI-2.1]], [[versions/v22/sections/io#Double Buffering with Split Collective I/O|MPI-2.2]], [[versions/v30/sections/io#Double Buffering with Split Collective I/O|MPI-3.0]], [[versions/v31/sections/io#Double Buffering with Split Collective I/O|MPI-3.1]], [[versions/v40/sections/io#Double Buffering with Split Collective I/O|MPI-4.0]], [[versions/v41/sections/io#Double Buffering with Split Collective I/O|MPI-4.1]], [[versions/v50/sections/io#Double Buffering with Split Collective I/O|MPI-5.0]]

## Changes along the time axis

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

/* buffer initialization */ buffer1 = (float *) ~~malloc(bufcount*sizeof(float)) ;~~ ==malloc(bufcount*sizeof(float));== buffer2 = (float *) ~~malloc(bufcount*sizeof(float)) ;~~ ==malloc(bufcount*sizeof(float));== compute_buf_ptr = ~~buffer1 ;~~ ==buffer1;== /* initially point to buffer1 */ write_buf_ptr = ~~buffer1 ;~~ ==buffer1;== /* initially point to buffer1 */

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

void ~~double_buffer( MPI_File~~ ==double_buffer(MPI_File== fh, MPI_Datatype buftype, int bufcount) {

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==[language={[MPI]C},basicstyle=]== /*========================================================================= * * Function: double_buffer * * Synopsis: * void double_buffer( * MPI_File fh, ** IN * MPI_Datatype buftype, ** IN * int bufcount ** IN * ) * * Description: * Performs the steps to overlap computation with a collective write * by using a double-buffering technique. * * Parameters: * fh previously opened MPI file handle * buftype MPI datatype for memory layout * (Assumes a compatible view has been set on fh) * bufcount # buftype elements to transfer *------------------------------------------------------------------------*/

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

/* buffer initialization */ buffer1 = (float *) malloc(bufcount*sizeof(float)); buffer2 = (float *) malloc(bufcount*sizeof(float)); compute_buf_ptr = buffer1; /* initially point to buffer1 */ write_buf_ptr = buffer1; /* initially point to buffer1 */

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Double Buffering with Split Collective I/O]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Double Buffering with Split Collective I/O]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Double Buffering with Split Collective I/O]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Double Buffering with Split Collective I/O]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Double Buffering with Split Collective I/O]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Double Buffering with Split Collective I/O]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Double Buffering with Split Collective I/O]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Double Buffering with Split Collective I/O]]

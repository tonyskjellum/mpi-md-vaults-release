---
title: "Profiler Implementation Example"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/tools]
---

# Profiler Implementation Example

Chapter **tools** · in [[versions/v30/sections/tools#Profiler Implementation Example|MPI-3.0]], [[versions/v31/sections/tools#Profiler Implementation Example|MPI-3.1]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

static int ~~totalBytes;~~ ==totalBytes = 0;== static double ~~totalTime;~~ ==totalTime = 0.0;==

int ~~MPI_SEND(void *~~ ==MPI_Send(void*== buffer, ~~const~~ int count, MPI_Datatype datatype, int dest, int tag, ~~MPI_comm~~ ==MPI_Comm== comm) { double tstart = MPI_Wtime(); /* Pass on all the arguments */ int extent; int result = PMPI_Send(buffer,count,datatype,dest,tag,comm);

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~Suppose that the~~ ==A== profiler ~~wishes to~~ ==can== accumulate the total amount of data sent by the ~~MPI_SEND~~ ==[[versions/v30/API/MPI_SEND|MPI_SEND]]== function, along with the total elapsed time spent in the ~~function. This could trivially be achieved thus~~ ==function as the following example shows:==

~~    int MPI_Send(void* buffer, int count, MPI_Datatype datatype,                  int dest, int tag, MPI_Comm comm)     {        double tstart = MPI_Wtime();       /* Pass on all the arguments */        int extent;        int result    = PMPI_Send(buffer,count,datatype,dest,tag,comm);   ~~

==    int MPI_Send(const void* buffer, int count, MPI_Datatype datatype,                  int dest, int tag, MPI_Comm comm)     {        double tstart = MPI_Wtime();       /* Pass on all arguments */        int extent;        int result    = PMPI_Send(buffer,count,datatype,dest,tag,comm);   ==

==       totalTime  += MPI_Wtime() - tstart;         /* and time          */==

~~       totalTime  += MPI_Wtime() - tstart;         /* and time          */~~

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

int MPI_Send(const void* buffer, int count, MPI_Datatype datatype, int dest, int tag, MPI_Comm comm) { double tstart = MPI_Wtime(); /* Pass on all arguments */ int ~~extent;~~ ==size;== int result = PMPI_Send(buffer,count,datatype,dest,tag,comm);

MPI_Type_size(datatype, ~~&extent);~~ ==&size);== /* Compute size */ totalBytes += ~~count*extent;~~ ==count*size;==

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Profiler Implementation Example]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Profiler Implementation Example]]

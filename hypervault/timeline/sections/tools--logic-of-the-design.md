---
title: "Logic of the Design"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Logic of the Design

Chapter **tools** · in [[versions/v13/sections/prof#Logic of the design|MPI-1.3]], [[versions/v21/sections/prof#Logic of the Design|MPI-2.1]], [[versions/v22/sections/prof#Logic of the Design|MPI-2.2]], [[versions/v30/sections/tools#Logic of the Design|MPI-3.0]], [[versions/v31/sections/tools#Logic of the Design|MPI-3.1]], [[versions/v40/sections/tools#Logic of the Design|MPI-4.0]], [[versions/v41/sections/tools#Logic of the Design|MPI-4.1]], [[versions/v50/sections/tools#Logic of the Design|MPI-5.0]]

Heading by release: MPI-1.3: “Logic of the design”; MPI-2.1: “Logic of the Design”; MPI-2.2: “Logic of the Design”; MPI-3.0: “Logic of the Design”; MPI-3.1: “Logic of the Design”; MPI-4.0: “Logic of the Design”; MPI-4.1: “Logic of the Design”; MPI-5.0: “Logic of the Design”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~Provided that an MPI implementation meets the requirements above, it is possible for the implementor of the profiling system to intercept all of the MPI calls which are made by the user program. She can then collect whatever information she requires before calling the underlying MPI implementation (through its name shifted entry points) to achieve the desired effects.~~

==Provided that an MPI implementation meets the requirements above, it is possible for the implementor of the profiling system to intercept all of the MPI calls==

==that==

==are made by the user program. She can then collect whatever information she requires before calling the underlying MPI implementation (through its name shifted entry points) to achieve the desired effects.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~Provided that an MPI implementation meets the requirements above, it is possible for the implementor of the profiling system to intercept all of the MPI calls~~

~~that~~

~~are made by the user program. She can then collect whatever information she requires before calling the underlying MPI implementation (through its name shifted entry points) to achieve the desired effects.~~

==Provided that an MPI implementation meets the requirements above, it is possible for the implementor of the profiling system to intercept the MPI calls that are made by the user program. She can then collect whatever information she requires before calling the underlying MPI implementation (through its name shifted entry points) to achieve the desired effects.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Provided that an MPI implementation meets the requirements above, it is possible for the implementor of the profiling system to intercept the MPI calls that are made by the user program. ~~She~~ ==The profiling system implementor== can then collect ~~whatever~~ ==any required== information ~~she requires~~ before calling the underlying MPI implementation (through its name shifted entry points) to achieve the desired effects.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

==A wrapper to accumulate the total amount of data sent by the [[versions/v50/API/MPI_SEND|MPI_SEND]] function, along with the total elapsed time spent in the function.==

==(code block added)==
``` [MPI]C
static int totalBytes = 0;
static double totalTime = 0.0;

int MPI_Send(const void* buffer, int count, MPI_Datatype datatype,
             int dest, int tag, MPI_Comm comm)
{
    double tstart = MPI_Wtime();       /* Pass on all arguments */
    int size;
    int result    = PMPI_Send(buffer, count, datatype, dest, tag, comm);

    totalTime    += MPI_Wtime() - tstart;  /* Compute time */

    MPI_Type_size(datatype, &size);        /* and size */
    totalBytes += count*size;

    return result;
}
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/prof#Logic of the design]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#Logic of the Design]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#Logic of the Design]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Logic of the Design]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Logic of the Design]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Logic of the Design]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Logic of the Design]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Logic of the Design]]

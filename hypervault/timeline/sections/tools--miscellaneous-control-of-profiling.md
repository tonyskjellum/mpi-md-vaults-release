---
title: "Miscellaneous Control of Profiling"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Miscellaneous Control of Profiling

Chapter **tools** · in [[versions/v13/sections/prof#Miscellaneous control of profiling|MPI-1.3]], [[versions/v21/sections/prof#Miscellaneous Control of Profiling|MPI-2.1]], [[versions/v22/sections/prof#Miscellaneous Control of Profiling|MPI-2.2]], [[versions/v30/sections/tools#Miscellaneous Control of Profiling|MPI-3.0]], [[versions/v31/sections/tools#Miscellaneous Control of Profiling|MPI-3.1]], [[versions/v40/sections/tools#Miscellaneous Control of Profiling|MPI-4.0]], [[versions/v41/sections/tools#Miscellaneous Control of Profiling|MPI-4.1]], [[versions/v50/sections/tools#Miscellaneous Control of Profiling|MPI-5.0]]

Heading by release: MPI-1.3: “Miscellaneous control of profiling”; MPI-2.1: “Miscellaneous Control of Profiling”; MPI-2.2: “Miscellaneous Control of Profiling”; MPI-3.0: “Miscellaneous Control of Profiling”; MPI-3.1: “Miscellaneous Control of Profiling”; MPI-4.0: “Miscellaneous Control of Profiling”; MPI-4.1: “Miscellaneous Control of Profiling”; MPI-5.0: “Miscellaneous Control of Profiling”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~Since MPI has no control of the implementation of the profiling code, we are unable to specify precisely the semantics which will be provided by calls to `MPI_PCONTROL`. This vagueness extends to the number of arguments to the function, and their datatypes.~~

==Since MPI has no control of the implementation of the profiling code, we are unable to specify precisely the semantics==

==that==

==will be provided by calls to `MPI_PCONTROL`. This vagueness extends to the number of arguments to the function, and their datatypes.==

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

There is a clear requirement for the user code to be able to control the profiler dynamically at run time. This ==capability== is normally used for (at least) the purposes of

- Flushing trace buffers at non-critical points in the ~~calculation~~ ==calculation.==

These requirements are met by use of ~~the~~ `MPI_PCONTROL`.

~~Since MPI has no control of the implementation of the profiling code, we are unable to specify precisely the semantics~~

~~that~~

~~will be provided by calls to `MPI_PCONTROL`. This vagueness extends to the number of arguments to the function, and their datatypes.~~

==Since MPI has no control of the implementation of the profiling code, we are unable to specify precisely the semantics that will be provided by calls to `MPI_PCONTROL`. This vagueness extends to the number of arguments to the function, and their datatypes.==

- `level==2` Profile buffers are ~~flushed. (This~~ ==flushed, which== may be a no-op in some ~~profilers).~~ ==profilers.==

We also request that the default state after `MPI_INIT` has been called is for profiling to be enabled at the normal default level. ~~(i.e.~~ ==(i.e.,== as if `MPI_PCONTROL` had just been called with the argument 1). This allows users to link with a profiling library and ==to== obtain profile output without having to modify their source code at all.

The provision of `MPI_PCONTROL` as a no-op in the standard MPI library ~~allows them to modify their source code to obtain~~ ==supports the collection of== more detailed profiling ~~information, but~~ ==information with source code that can== still ~~be able to~~ link ~~exactly the same code~~ against the standard MPI library.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

These requirements are met by use of ~~`MPI_PCONTROL`.~~ ==[[versions/v31/API/MPI_PCONTROL|MPI_PCONTROL]] .==

Since MPI has no control of the implementation of the profiling code, we are unable to specify precisely the semantics that will be provided by calls to ~~`MPI_PCONTROL`.~~ ==[[versions/v31/API/MPI_PCONTROL|MPI_PCONTROL]] .== This vagueness extends to the number of arguments to the function, and their datatypes.

We also request that the default state after ~~`MPI_INIT`~~ ==[[versions/v31/API/MPI_INIT|MPI_INIT]]== has been called is for profiling to be enabled at the normal default level. (i.e., as if ~~`MPI_PCONTROL`~~ ==[[versions/v31/API/MPI_PCONTROL|MPI_PCONTROL]]== had just been called with the argument 1). This allows users to link with a profiling library and to obtain profile output without having to modify their source code at all.

The provision of ~~`MPI_PCONTROL`~~ ==[[versions/v31/API/MPI_PCONTROL|MPI_PCONTROL]]== as a no-op in the standard MPI library supports the collection of more detailed profiling information with source code that can still link against the standard MPI library.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

- Flushing trace buffers at ~~non-critical~~ ==noncritical== points in the calculation.

We also request that the default state after ~~[[versions/v40/API/MPI_INIT|MPI_INIT]]~~ ==MPI== has been ~~called~~ ==initialized== is for profiling to be enabled at the normal default level. (i.e., as if [[versions/v40/API/MPI_PCONTROL|MPI_PCONTROL]] had just been called with the argument 1). This allows users to link with a profiling library and to obtain profile output without having to modify their source code at all.

==A wrapper to accumulate the total amount of data sent by the [[versions/v40/API/MPI_SEND|MPI_SEND]] function, along with the total elapsed time spent in the function.==

==    static int totalBytes = 0;     static double totalTime = 0.0;==

==    int MPI_Send(const void* buffer, int count, MPI_Datatype datatype,                  int dest, int tag, MPI_Comm comm)     {        double tstart = MPI_Wtime();       /* Pass on all arguments */        int size;        int result    = PMPI_Send(buffer,count,datatype,dest,tag,comm);   ==

==       totalTime  += MPI_Wtime() - tstart;         /* and time          */==

==       MPI_Type_size(datatype, &size);  /* Compute size */        totalBytes += count*size;==

==       return result;                            }==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

- ~~`level==0`~~ ==`level=0`== Profiling is disabled.

- ~~`level==1`~~ ==`level=1`== Profiling is enabled at a normal default level of detail.

- ~~`level==2`~~ ==`level=2`== Profile buffers are flushed, which may be a no-op in some profilers.

~~    static int totalBytes = 0;     static double totalTime = 0.0;~~

~~    int MPI_Send(const void* buffer, int count, MPI_Datatype datatype,                  int dest, int tag, MPI_Comm comm)     {        double tstart = MPI_Wtime();       /* Pass on all arguments */        int size;        int result    = PMPI_Send(buffer,count,datatype,dest,tag,comm);   ~~

~~       totalTime  += MPI_Wtime() - tstart;         /* and time          */~~

~~       MPI_Type_size(datatype, &size);  /* Compute size */        totalBytes += count*size;~~

~~       return result;                            }~~

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

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~A wrapper to accumulate the total amount of data sent by the [[versions/v50/API/MPI_SEND|MPI_SEND]] function, along with the total elapsed time spent in the function.~~

~~(code block removed)~~
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
> ![[versions/v13/sections/prof#Miscellaneous control of profiling]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#Miscellaneous Control of Profiling]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#Miscellaneous Control of Profiling]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Miscellaneous Control of Profiling]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Miscellaneous Control of Profiling]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Miscellaneous Control of Profiling]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Miscellaneous Control of Profiling]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Miscellaneous Control of Profiling]]

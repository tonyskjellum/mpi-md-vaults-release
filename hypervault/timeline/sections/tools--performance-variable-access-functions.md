---
title: "Performance Variable Access Functions"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Performance Variable Access Functions

Chapter **tools** · in [[versions/v30/sections/tools#Performance Variable Access Functions|MPI-3.0]], [[versions/v31/sections/tools#Performance Variable Access Functions|MPI-3.1]], [[versions/v40/sections/tools#Performance Variable Access Functions|MPI-4.0]], [[versions/v41/sections/tools#Performance Variable Access Functions|MPI-4.1]], [[versions/v50/sections/tools#Performance Variable Access Functions|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (6 changed paragraphs)

The ~~`MPI_T_PVAR_READ`~~ ==[[versions/v31/API/MPI_T_PVAR_READ|MPI_T_PVAR_READ]]== call queries the value of the performance variable with the handle `handle` in the session identified by the parameter `session` and stores the result in the buffer identified by the parameter `buf`. The user is responsible to ensure that the buffer is of the appropriate size to hold the entire value of the performance variable (based on the datatype and count returned by the corresponding previous calls to [[versions/v31/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] and [[versions/v31/API/MPI_T_PVAR_HANDLE_ALLOC|MPI_T_PVAR_HANDLE_ALLOC]] , respectively).

The constant `MPI_T_PVAR_ALL_HANDLES` cannot be used as an argument for the function ~~`MPI_T_PVAR_READ`.~~ ==[[versions/v31/API/MPI_T_PVAR_READ|MPI_T_PVAR_READ]] .==

The ~~`MPI_T_PVAR_WRITE`~~ ==[[versions/v31/API/MPI_T_PVAR_WRITE|MPI_T_PVAR_WRITE]]== call attempts to write the value of the performance variable with the handle identified by the parameter `handle` in the session identified by the parameter `session`. The value to be written is passed in the buffer identified by the parameter `buf`. The user must ensure that the buffer is of the appropriate size to hold the entire value of the performance variable (based on the datatype and count returned by the corresponding previous calls to [[versions/v31/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] and [[versions/v31/API/MPI_T_PVAR_HANDLE_ALLOC|MPI_T_PVAR_HANDLE_ALLOC]] , respectively).

The constant `MPI_T_PVAR_ALL_HANDLES` cannot be used as an argument for the function ~~`MPI_T_PVAR_WRITE`.~~ ==[[versions/v31/API/MPI_T_PVAR_WRITE|MPI_T_PVAR_WRITE]] .==

The ~~`MPI_T_PVAR_RESET`~~ ==[[versions/v31/API/MPI_T_PVAR_RESET|MPI_T_PVAR_RESET]]== call sets the performance variable with the handle identified by the parameter `handle` to its starting value specified in Section [[versions/v31/sections/tools#Performance Variable Classes|Performance Variable Classes]] . If it is not possible to change the variable, the function returns `MPI_T_ERR_PVAR_NO_WRITE`.

If the constant `MPI_T_PVAR_ALL_HANDLES` is passed in `handle`, the MPI implementation attempts to reset all variables within the session identified by the parameter `session` for which handles have been allocated. In this case, the routine returns `MPI_SUCCESS` if all variables are reset ~~successfully,~~ ==successfully (even if there are no valid handles or all are read-only),== otherwise `MPI_T_ERR_PVAR_NO_WRITE` is returned. Read-only variables are ignored when `MPI_T_PVAR_ALL_HANDLES` is specified.

This call atomically combines the functionality of ~~`MPI_T_PVAR_READ`~~ ==[[versions/v31/API/MPI_T_PVAR_READ|MPI_T_PVAR_READ]]== and ~~`MPI_T_PVAR_RESET`~~ ==[[versions/v31/API/MPI_T_PVAR_RESET|MPI_T_PVAR_RESET]]== with the same semantics as if these two calls were called separately. If atomic operations on this variable are not supported, this routine returns `MPI_T_ERR_PVAR_NO_ATOMIC`.

The constant `MPI_T_PVAR_ALL_HANDLES` cannot be used as an argument for the function ~~`MPI_T_PVAR_READRESET`.~~ ==[[versions/v31/API/MPI_T_PVAR_READRESET|MPI_T_PVAR_READRESET]] .==

> Sampling-based tools rely on the ability to call the MPI tool information interface, in particular routines to start, stop, read, ~~write~~ ==write,== and reset performance variables, from any program context, including asynchronous contexts such as signal handlers. MPI implementations should strive, if possible in their particular environment, to enable these usage scenarios for all or a subset of the routines mentioned above. If implementing only a subset, the read, write, and reset routines are typically the most critical for sampling based tools. An MPI implementation should clearly document any restrictions on the program contexts in which the MPI tool information interface can be used. Restrictions might include guaranteeing usage outside of all signals or outside a specific set of signals. Any restrictions could be documented, for example, through the description returned by [[versions/v31/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] .

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

The [[versions/v40/API/MPI_T_PVAR_READ|MPI_T_PVAR_READ]] call queries the value of the performance variable with the handle `handle` in the ==performance experiment== session identified by the parameter ~~`session`~~ ==`pe_session`== and stores the result in the buffer identified by the parameter `buf`. The user is responsible to ensure that the buffer is of the appropriate size to hold the entire value of the performance variable (based on the datatype and count returned by the corresponding previous calls to [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] and [[versions/v40/API/MPI_T_PVAR_HANDLE_ALLOC|MPI_T_PVAR_HANDLE_ALLOC]] , respectively).

The [[versions/v40/API/MPI_T_PVAR_WRITE|MPI_T_PVAR_WRITE]] call attempts to write the value of the performance variable with the handle identified by the parameter `handle` in the ==performance experiment== session identified by the parameter ~~`session`.~~ ==`pe_session`.== The value to be written is passed in the buffer identified by the parameter `buf`. The user must ensure that the buffer is of the appropriate size to hold the entire value of the performance variable (based on the datatype and count returned by the corresponding previous calls to [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] and [[versions/v40/API/MPI_T_PVAR_HANDLE_ALLOC|MPI_T_PVAR_HANDLE_ALLOC]] , respectively).

If the constant `MPI_T_PVAR_ALL_HANDLES` is passed in `handle`, the MPI implementation attempts to reset all variables within the ==performance experiment== session identified by the parameter ~~`session`~~ ==`pe_session`== for which handles have been allocated. In this case, the routine returns `MPI_SUCCESS` if all variables are reset successfully (even if there are no valid handles or all are read-only), otherwise `MPI_T_ERR_PVAR_NO_WRITE` is returned. Read-only variables are ignored when `MPI_T_PVAR_ALL_HANDLES` is specified.

~~> All routines to read, to write or to reset performance variables require the session argument. This requirement keeps the interface consistent and allows the use of `MPI_T_PVAR_ALL_HANDLES` where appropriate. Further, this opens up additional performance optimizations for the implementation of handles.~~

==> All routines to read, to write or to reset performance variables require the performance experiement session argument. This requirement keeps the interface consistent and allows the use of `MPI_T_PVAR_ALL_HANDLES` where appropriate. Further, this opens up additional performance optimizations for the implementation of handles.==

==Detecting Receives with long unexpected message queues.==

==The following example shows a sample tool to identify receive operations that occur during times with long message queues. This examples assumes that the MPI implementation exports a variable with the name “`MPI_T_UMQ_LENGTH`” to represent the current length of the unexpected message queue. The tool is implemented as a [[PMPI]] tool using the MPI profiling interface.==

==The tool consists of three parts: (1) the initialization (by intercepting the call to [[versions/v40/API/MPI_INIT|MPI_INIT]] ), (2) the test for long unexpected message queues (by intercepting calls to [[versions/v40/API/MPI_RECV|MPI_RECV]] ), and (3) the clean-up phase (by intercepting the call to [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] ). To capture all receives, the example would have to be extended to have similar wrappers for all receive operations.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

This call atomically combines the functionality of [[versions/v41/API/MPI_T_PVAR_READ|MPI_T_PVAR_READ]] and [[versions/v41/API/MPI_T_PVAR_RESET|MPI_T_PVAR_RESET]] with the same semantics as if these two calls were called separately. If ~~atomic operations on this~~ ==the== variable ~~are not supported,~~ ==cannot be read and reset atomically,== this routine returns `MPI_T_ERR_PVAR_NO_ATOMIC`.

==**Part 1—Initialization:** During initialization, the tool searches for the variable and, once the right index is found, allocates a performance experiment session and a handle for the variable with the found index, and starts the performance variable.==

==    [language={[MPI]C},basicstyle=]     #include <stdio.h>     #include <stdlib.h>     #include <string.h>     #include <assert.h>     #include <mpi.h>==

==    /* Global variables for the tool */     static MPI_T_pvar_session pe_session;     static MPI_T_pvar_handle handle;==

==    int MPI_Init(int *argc, char ***argv ) {         int  err, num, i, index, namelen, verbosity;         int  var_class, bind, threadsup;         int  readonly, continuous, atomic, count;         char name[18];==

==        MPI_Comm     comm;         MPI_Datatype datatype;         MPI_T_enum   enumtype;==

==        err=PMPI_Init(argc, argv);         if (err!=MPI_SUCCESS)             return err;==

==        err=PMPI_T_init_thread(MPI_THREAD_SINGLE, &threadsup);         if (err!=MPI_SUCCESS)             return err;==

==        err=PMPI_T_pvar_get_num(&num);         if (err!=MPI_SUCCESS)             return err;==

==        index=-1;         i=0;         while ((i<num) && (index<0) && (err==MPI_SUCCESS)) {             /* Pass a buffer that is at least one character longer than */             /* the name of the variable being searched for to avoid */             /* finding variables that have a name that has a prefix */             /* equal to the name of the variable being searched. */             namelen=18;             err=PMPI_T_pvar_get_info(i, name, &namelen, &verbosity,                                      &var_class, &datatype, &enumtype,                                      NULL, NULL, &bind,&readonly,                                      &continuous, &atomic);             if (strcmp(name,"MPI_T_UMQ_LENGTH")==0) index=i;             i++;         }         if (err!=MPI_SUCCESS)             return err;==

==        /* this could be handled in a more flexible way for a generic tool */         assert(index>=0);         assert(var_class==MPI_T_PVAR_CLASS_LEVEL);         assert(datatype==MPI_INT);         assert(bind==MPI_T_BIND_MPI_COMM);==

==        /* Create a session */         err=PMPI_T_pvar_session_create(&pe_session);         if (err!=MPI_SUCCESS) return err;==

==        /* Get a handle and bind to MPI_COMM_WORLD */         comm=MPI_COMM_WORLD;         err=PMPI_T_pvar_handle_alloc(pe_session, index, &comm, &handle,                                      &count);         if (err!=MPI_SUCCESS) return err;==

==        /* this could be handled in a more flexible way for a generic tool */         assert(count==1);==

==        /* Start variable */         err=PMPI_T_pvar_start(pe_session, handle);         if (err!=MPI_SUCCESS) return err;==

==        return MPI_SUCCESS;     }==

==**Part 2—Testing the Queue Lengths During Receives:** During every receive operation, the tool reads the unexpected queue length through the matching performance variable and compares it against a predefined threshold.==

==    [language={[MPI]C},basicstyle=]     #define THRESHOLD 5==

==    int MPI_Recv(void *buf, int count, MPI_Datatype datatype, int source,                  int tag, MPI_Comm comm, MPI_Status *status)     {             int value, err;==

==            if (comm==MPI_COMM_WORLD) {                     err=PMPI_T_pvar_read(pe_session, handle, &value);                     if ((err==MPI_SUCCESS) && (value>THRESHOLD))                     {                             /* tool identified receive called with long UMQ */                             /* execute tool functionality, */                             /* e.g., gather and print call stack */                     }             }==

==            return PMPI_Recv(buf, count, datatype, source, tag, comm, status);     }==

==**Part 3—Termination:** In the wrapper for [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] , the MPI tool information interface is finalized.==

==(code block added)==
``` [MPI]C
int MPI_Finalize(void)
{
    int err;

    err=PMPI_T_pvar_handle_free(pe_session, &handle);
    err=PMPI_T_pvar_session_free(&pe_session);
    err=PMPI_T_finalize();
    return PMPI_Finalize();
}
```

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

The [[versions/v50/API/MPI_T_PVAR_READ|MPI_T_PVAR_READ]] call queries the value of the performance variable with the handle `handle` in the performance experiment session identified by the parameter `pe_session` and stores the result in the buffer identified by the parameter `buf`. The user ~~is responsible to~~ ==must== ensure that the buffer is of the appropriate size to hold the entire value of the performance variable (based on the datatype and count returned by the corresponding previous calls to [[versions/v50/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] and [[versions/v50/API/MPI_T_PVAR_HANDLE_ALLOC|MPI_T_PVAR_HANDLE_ALLOC]] , respectively).

> Sampling-based tools rely on the ability to call the MPI tool information interface, in particular routines to start, stop, read, write, and reset performance variables, from any program context, including asynchronous contexts such as signal handlers. MPI implementations should strive, if possible in their particular environment, to enable these usage scenarios for all or a subset of the routines mentioned above. If implementing only a subset, the read, write, and reset routines are typically the most critical for ~~sampling based~~ ==sampling-based== tools. An MPI implementation should clearly document any restrictions on the program contexts in which the MPI tool information interface can be used. Restrictions might include guaranteeing usage outside of all signals or outside a specific set of signals. Any restrictions could be documented, for example, through the description returned by [[versions/v50/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] .

> All routines to read, to write or to reset performance variables require the performance ~~experiement~~ ==experiment== session argument. This requirement keeps the interface consistent and allows the use of `MPI_T_PVAR_ALL_HANDLES` where appropriate. Further, this opens up additional performance optimizations for the implementation of handles.

Detecting ~~Receives~~ ==receives== with long unexpected message queues.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Performance Variable Access Functions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Performance Variable Access Functions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Performance Variable Access Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Performance Variable Access Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Performance Variable Access Functions]]

---
title: "Control Variable Access Functions"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Control Variable Access Functions

Chapter **tools** · in [[versions/v30/sections/tools#Control Variable Access Functions|MPI-3.0]], [[versions/v31/sections/tools#Control Variable Access Functions|MPI-3.1]], [[versions/v40/sections/tools#Control Variable Access Functions|MPI-4.0]], [[versions/v41/sections/tools#Control Variable Access Functions|MPI-4.1]], [[versions/v50/sections/tools#Control Variable Access Functions|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

This routine queries the value of ~~the~~ ==a== control variable identified by the argument `handle` and stores the result in the buffer identified by the parameter `buf`. The user must ensure that the buffer is of the appropriate size to hold the entire value of the control variable (based on the returned datatype and count from prior corresponding calls to [[versions/v31/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] and [[versions/v31/API/MPI_T_CVAR_HANDLE_ALLOC|MPI_T_CVAR_HANDLE_ALLOC]] , respectively).

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

In both cases, the user must ensure that the writes in all ==participating MPI== processes are consistent. If the scope is either `MPI_T_SCOPE_ALL_EQ` or `MPI_T_SCOPE_GROUP_EQ` this means that the variable in all ==connected MPI== processes ==or MPI processes of the group, respectively,== must be set to the same value.

==Reading the value of a control variable.==

==    int getValue_int_comm(int index, MPI_Comm comm, int *val) {       int err,count;       MPI_T_cvar_handle handle;==

==      /* This example assumes that the variable index */       /* can be bound to a communicator */==

==      err=MPI_T_cvar_handle_alloc(index, &comm, &handle, &count);       if (err!=MPI_SUCCESS) return err;==

==      /* The following assumes that the variable is */       /* represented by a single integer */==

==      err=MPI_T_cvar_read(handle,val);       if (err!=MPI_SUCCESS) return err;==

==      err=MPI_T_cvar_handle_free(&handle);       return err;     }==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~    int getValue_int_comm(int index, MPI_Comm comm, int *val) {       int err,count;       MPI_T_cvar_handle handle;~~

~~      /* This example assumes that the variable index */       /* can be bound to a communicator */~~

~~      err=MPI_T_cvar_handle_alloc(index, &comm, &handle, &count);       if (err!=MPI_SUCCESS) return err;~~

~~      /* The following assumes that the variable is */       /* represented by a single integer */~~

~~      err=MPI_T_cvar_read(handle,val);       if (err!=MPI_SUCCESS) return err;~~

~~      err=MPI_T_cvar_handle_free(&handle);       return err;     }~~

==(code block added)==
``` [MPI]C
int getValue_int_comm(int index, MPI_Comm comm, int *val) {
    int err,count;
    MPI_T_cvar_handle handle;

    /* This example assumes that the variable index */
    /* can be bound to a communicator */

    err=MPI_T_cvar_handle_alloc(index, &comm, &handle, &count);
    if (err!=MPI_SUCCESS)
        return err;

    /* The following assumes that the variable is */
    /* represented by a single integer */

    err=MPI_T_cvar_read(handle,val);
    if (err!=MPI_SUCCESS)
        return err;

    err=MPI_T_cvar_handle_free(&handle);
    return err;
}
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

If the variable has a global scope (as returned by a prior corresponding [[versions/v50/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] call), any write call to this variable must be issued by the user in all connected (as defined in Section [[versions/v50/sections/dynamic#Releasing Connections|Releasing Connections]] ) MPI processes. If the variable has group scope, any write call to this variable must be issued by the user in all MPI processes in the group, which must be described by the MPI implementation in the description ==returned== by the ==call to== [[versions/v50/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] .

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Control Variable Access Functions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Control Variable Access Functions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Control Variable Access Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Control Variable Access Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Control Variable Access Functions]]

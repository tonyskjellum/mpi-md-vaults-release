---
title: "Handle Allocation and Deallocation"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Handle Allocation and Deallocation

Chapter **tools** · in [[versions/v30/sections/tools#Handle Allocation and Deallocation|MPI-3.0]], [[versions/v31/sections/tools#Handle Allocation and Deallocation|MPI-3.1]], [[versions/v40/sections/tools#Handle Allocation and Deallocation|MPI-4.0]], [[versions/v41/sections/tools#Handle Allocation and Deallocation|MPI-4.1]], [[versions/v50/sections/tools#Handle Allocation and Deallocation|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

The value of index should be in the range $`0`$ to $`\texttt{num_pvar}-1`$, where $`\texttt{num_pvar}`$ is the number of available performance variables as determined from a prior call to ~~`MPI_T_PVAR_GET_NUM`.~~ ==[[versions/v31/API/MPI_T_PVAR_GET_NUM|MPI_T_PVAR_GET_NUM]] .== The type of the MPI object it references must be consistent with the type returned in the `bind` argument in a prior call to ~~`MPI_T_PVAR_GET_INFO`.~~ ==[[versions/v31/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] .==

~~In~~ ==For all routines in== the ~~case~~ ==rest of this section that take both `handle` and `session` as IN or INOUT arguments, if== the ~~`bind`~~ ==`handle`== argument ~~equals `MPI_T_BIND_NO_OBJECT`,~~ ==passed in is not associated with== the ~~argument `obj_handle`~~ ==`session` argument, `MPI_T_ERR_INVALID_HANDLE`== is ~~ignored.~~ ==returned.==

When a handle is no longer needed, a user of the MPI tool information interface should call ~~`MPI_T_PVAR_HANDLE_FREE`~~ ==[[versions/v31/API/MPI_T_PVAR_HANDLE_FREE|MPI_T_PVAR_HANDLE_FREE]]== to free the handle in the session identified by the parameter `session` and the associated resources in the MPI implementation. On a successful return, MPI sets the handle to `MPI_T_PVAR_HANDLE_NULL`.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

This routine binds the performance variable specified by the argument `index` to an MPI object in the ==performance experiment== session identified by the parameter ~~`session`.~~ ==`pe_session`.== The object is passed in the argument `obj_handle` as an address to a local variable that stores the object’s handle. The argument `obj_handle` is ignored if the [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] call for this performance variable returned `MPI_T_BIND_NO_OBJECT` in the argument `bind`. The handle allocated to reference the variable is returned in the argument `handle`. Upon successful return, `count` contains the number of elements (of the datatype returned by a previous [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] call) used to represent this variable.

The value of index should be in the range ==from== $`0`$ to $`\texttt{num_pvar}-1`$, where $`\texttt{num_pvar}`$ is the number of available performance variables as determined from a prior call to [[versions/v40/API/MPI_T_PVAR_GET_NUM|MPI_T_PVAR_GET_NUM]] . The type of the MPI object it references must be consistent with the type returned in the `bind` argument in a prior call to [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] .

For all routines in the rest of this section that take both `handle` and ~~`session`~~ ==`pe_session`== as IN or INOUT arguments, if the `handle` argument passed in is not associated with the ~~`session`~~ ==`pe_session`== argument, `MPI_T_ERR_INVALID_HANDLE` is returned.

When a handle is no longer needed, a user of the MPI tool information interface should call [[versions/v40/API/MPI_T_PVAR_HANDLE_FREE|MPI_T_PVAR_HANDLE_FREE]] to free the handle in the ==performance experiment== session identified by the parameter ~~`session`~~ ==`pe_session`== and the associated resources in the MPI implementation. On a successful return, MPI sets the handle to `MPI_T_PVAR_HANDLE_NULL`.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Handle Allocation and Deallocation]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Handle Allocation and Deallocation]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Handle Allocation and Deallocation]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Handle Allocation and Deallocation]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Handle Allocation and Deallocation]]

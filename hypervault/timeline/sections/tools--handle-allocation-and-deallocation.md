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

~~The value of `cvar_index` should be in the range $`0`$ to $`num_cvar-1`$, where $`num_cvar`$ is the number of available control variables as determined from a prior call to `MPI_T_CVAR_GET_NUM`. The type of the MPI object it references must be consistent with the type returned in the `bind` argument in a prior call to `MPI_T_CVAR_GET_INFO`.~~

~~In the case that the `bind` argument returned by `MPI_T_CVAR_GET_INFO` equals `MPI_T_BIND_NO_OBJECT`, the argument `obj_handle` is ignored.~~

==The value of `cvar_index` should be in the range $`0`$ to $`num_cvar-1`$, where $`num_cvar`$ is the number of available control variables as determined from a prior call to [[versions/v31/API/MPI_T_CVAR_GET_NUM|MPI_T_CVAR_GET_NUM]] . The type of the MPI object it references must be consistent with the type returned in the `bind` argument in a prior call to [[versions/v31/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] .==

When a handle is no longer needed, a user of the MPI tool information interface should call ~~`MPI_T_CVAR_HANDLE_FREE`~~ ==[[versions/v31/API/MPI_T_CVAR_HANDLE_FREE|MPI_T_CVAR_HANDLE_FREE]]== to free the handle and the associated resources in the MPI implementation. On a successful return, MPI sets the handle to `MPI_T_CVAR_HANDLE_NULL`.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

> Handles used in the MPI tool information interface are distinct from handles used in the remaining parts of the MPI standard because they must be usable before ~~[[versions/v40/API/MPI_INIT|MPI_INIT]]~~ ==MPI is initialized== and after ~~[[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] .~~ ==MPI is finalized.== Further, accessing handles, in particular for performance variables, can be time critical and having a separate handle space enables optimizations.

The value of `cvar_index` should be in the range ==from== $`0`$ to ~~$`num_cvar-1`$,~~ ==$`\texttt{num_cvar}-1`$,== where ~~$`num_cvar`$~~ ==$`\texttt{num_cvar}`$== is the number of available control variables as determined from a prior call to [[versions/v40/API/MPI_T_CVAR_GET_NUM|MPI_T_CVAR_GET_NUM]] . The type of the MPI object it references must be consistent with the type returned in the `bind` argument in a prior call to [[versions/v40/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] .

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

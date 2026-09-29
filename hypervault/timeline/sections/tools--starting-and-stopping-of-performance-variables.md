---
title: "Starting and Stopping of Performance Variables"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Starting and Stopping of Performance Variables

Chapter **tools** · in [[versions/v30/sections/tools#Starting and Stopping of Performance Variables|MPI-3.0]], [[versions/v31/sections/tools#Starting and Stopping of Performance Variables|MPI-3.1]], [[versions/v40/sections/tools#Starting and Stopping of Performance Variables|MPI-4.0]], [[versions/v41/sections/tools#Starting and Stopping of Performance Variables|MPI-4.1]], [[versions/v50/sections/tools#Starting and Stopping of Performance Variables|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

If the constant `MPI_T_PVAR_ALL_HANDLES` is passed in `handle`, the MPI implementation attempts to start all variables within the session identified by the parameter `session` for which handles have been allocated. In this case, the routine returns `MPI_SUCCESS` if all variables are started ~~successfully,~~ ==successfully (even if there are no non-continuous variables to be started),== otherwise `MPI_T_ERR_PVAR_NO_STARTSTOP` is returned. Continuous variables and variables that are already started are ignored when `MPI_T_PVAR_ALL_HANDLES` is specified.

If the constant `MPI_T_PVAR_ALL_HANDLES` is passed in `handle`, the MPI implementation attempts to stop all variables within the session identified by the parameter `session` for which handles have been allocated. In this case, the routine returns `MPI_SUCCESS` if all variables are stopped ~~successfully,~~ ==successfully (even if there are no non-continuous variables to be stopped),== otherwise `MPI_T_ERR_PVAR_NO_STARTSTOP` is returned. Continuous variables and variables that are already stopped are ignored when `MPI_T_PVAR_ALL_HANDLES` is specified.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

This functions starts the performance variable with the handle identified by the parameter `handle` in the ==performance experiment== session identified by the parameter ~~`session`.~~ ==`pe_session`.==

If the constant `MPI_T_PVAR_ALL_HANDLES` is passed in `handle`, the MPI implementation attempts to start all variables within the ==performance experiment== session identified by the parameter ~~`session`~~ ==`pe_session`== for which handles have been allocated. In this case, the routine returns `MPI_SUCCESS` if all variables are started successfully (even if there are no ~~non-continuous~~ ==noncontinuous== variables to be started), otherwise `MPI_T_ERR_PVAR_NO_STARTSTOP` is returned. Continuous variables and variables that are already started are ignored when `MPI_T_PVAR_ALL_HANDLES` is specified.

This functions stops the performance variable with the handle identified by the parameter `handle` in the ==performance experiment== session identified by the parameter ~~`session`.~~ ==`pe_session`.==

If the constant `MPI_T_PVAR_ALL_HANDLES` is passed in `handle`, the MPI implementation attempts to stop all variables within the ==performance experiment== session identified by the parameter ~~`session`~~ ==`pe_session`== for which handles have been allocated. In this case, the routine returns `MPI_SUCCESS` if all variables are stopped successfully (even if there are no ~~non-continuous~~ ==noncontinuous== variables to be stopped), otherwise `MPI_T_ERR_PVAR_NO_STARTSTOP` is returned. Continuous variables and variables that are already stopped are ignored when `MPI_T_PVAR_ALL_HANDLES` is specified.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Performance variables that have the continuous flag set during the query ~~operation~~ ==procedure== are continuously ~~operating~~ ==updated== once a handle has been allocated. Such variables may be queried at any time, but they cannot be started or stopped by the user. All other variables are in a stopped state after their handle has been allocated; their values are not updated until they have been started by the user.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Starting and Stopping of Performance Variables]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Starting and Stopping of Performance Variables]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Starting and Stopping of Performance Variables]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Starting and Stopping of Performance Variables]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Starting and Stopping of Performance Variables]]

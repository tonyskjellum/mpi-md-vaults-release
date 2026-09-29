---
title: "Return Codes for the MPI Tool Information Interface"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Return Codes for the MPI Tool Information Interface

Chapter **tools** · in [[versions/v30/sections/tools#Return Codes for the MPI Tool Information Interface|MPI-3.0]], [[versions/v31/sections/tools#Return Codes for the MPI Tool Information Interface|MPI-3.1]], [[versions/v40/sections/tools#Return Codes for the MPI Tool Information Interface|MPI-4.0]], [[versions/v41/sections/tools#Return Codes for the MPI Tool Information Interface|MPI-4.1]], [[versions/v50/sections/tools#Return Codes for the MPI Tool Information Interface|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~All error codes with the prefix `MPI_T_` must be unique values and cannot overlap with any other error codes or error classes returned by the MPI implementation. Further, they shall be treated as MPI error classes as defined in Section [[versions/v31/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] on page [[versions/v31/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] and follow the same rules and restrictions. In particular, they must satisfy:~~

~~(code block removed)~~
``` math
0 = \texttt{MPI_SUCCESS} < \texttt{MPI_T_ERR_...} \leq \texttt{MPI_ERR_LASTCODE}.
```

==All error codes with the prefix `MPI_T_` must be unique values and cannot overlap with any other error codes or error classes returned by the MPI implementation. Further, they shall be treated as MPI error classes as defined in [[versions/v31/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] and follow the same rules and restrictions. In particular, they must satisfy:==

==(code block added)==
``` math
0 = \texttt{MPI_SUCCESS} < \texttt{MPI_T_ERR_XXX} \leq \texttt{MPI_ERR_LASTCODE}.
```

\|l\|l\| Return Code & Description\ \ `MPI_SUCCESS` & Call completed successfully\ ==`MPI_T_ERR_INVALID` & Invalid use of the interface or bad parameter\ & values(s)\== `MPI_T_ERR_MEMORY` & Out of memory\ `MPI_T_ERR_NOT_INITIALIZED` & Interface not initialized\ `MPI_T_ERR_CANNOT_INIT` & Interface not in the state to be initialized \ `MPI_T_ERR_INVALID_INDEX` & The enumeration index is ~~invalid or has\ & been deleted.\~~ ==invalid\== `MPI_T_ERR_INVALID_ITEM` & The item index queried is out of range\ & (for [[versions/v31/API/MPI_T_ENUM_GET_ITEM|MPI_T_ENUM_GET_ITEM]] only)\ \ `MPI_T_ERR_INVALID_INDEX` & The variable or category index is invalid ==`MPI_T_ERR_INVALID_NAME` & The variable or category name is invalid== \ `MPI_T_ERR_INVALID_INDEX` & The variable index is invalid ~~or has been deleted~~ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_OUT_OF_HANDLES` & No more handles available \ `MPI_T_ERR_OUT_OF_SESSIONS` & No more sessions available `MPI_T_ERR_INVALID_SESSION` & Session argument is not a valid session\ \ \ `MPI_T_ERR_CVAR_SET_NOT_NOW` & Variable cannot be set at this moment\ `MPI_T_ERR_CVAR_SET_NEVER` & Variable cannot be set until end of execution\ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid \ \ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_INVALID_SESSION` & Session argument is not a valid session\ `MPI_T_ERR_PVAR_NO_STARTSTOP` & Variable cannot be started or stopped\ & (for [[versions/v31/API/MPI_T_PVAR_START|MPI_T_PVAR_START]] and\ & [[versions/v31/API/MPI_T_PVAR_STOP|MPI_T_PVAR_STOP]] )\ `MPI_T_ERR_PVAR_NO_WRITE` & Variable cannot be written or reset\ & (for [[versions/v31/API/MPI_T_PVAR_WRITE|MPI_T_PVAR_WRITE]] and\ & [[versions/v31/API/MPI_T_PVAR_RESET|MPI_T_PVAR_RESET]] ) `MPI_T_ERR_PVAR_NO_ATOMIC` & Variable cannot be read and written atomically\ & (for [[versions/v31/API/MPI_T_PVAR_READRESET|MPI_T_PVAR_READRESET]] )\ \ `MPI_T_ERR_INVALID_INDEX` & The category index is invalid\

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

All functions defined as part of the MPI tool information interface return an integer error code (see Table [[versions/v40/sections/tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] ) to indicate whether the function was completed successfully or was aborted. In the latter ~~case~~ ==case,== the error code indicates the reason for not completing the routine. Such errors neither impact the execution of the MPI process nor invoke MPI error handlers. The MPI process continues executing regardless of the return code from the call. The MPI implementation is not required to check all user-provided parameters; if a user passes invalid parameter values to any routine the behavior of the implementation is undefined.

~~> [!tip] Rationale~~

~~> All MPI tool information interface functions must return error classes, because applications cannot portably call [[versions/v40/API/MPI_ERROR_CLASS|MPI_ERROR_CLASS]] before [[versions/v40/API/MPI_INIT|MPI_INIT]] or [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] to map an arbitrary error code to an error class.~~

~~\|l\|l\| Return Code & Description\ \ `MPI_SUCCESS` & Call completed successfully\ `MPI_T_ERR_INVALID` & Invalid use of the interface or bad parameter\ & values(s)\ `MPI_T_ERR_MEMORY` & Out of memory\ `MPI_T_ERR_NOT_INITIALIZED` & Interface not initialized\ `MPI_T_ERR_CANNOT_INIT` & Interface not in the state to be initialized \ `MPI_T_ERR_INVALID_INDEX` & The enumeration index is invalid\ `MPI_T_ERR_INVALID_ITEM` & The item index queried is out of range\ & (for [[versions/v40/API/MPI_T_ENUM_GET_ITEM|MPI_T_ENUM_GET_ITEM]] only)\ \ `MPI_T_ERR_INVALID_INDEX` & The variable or category index is invalid `MPI_T_ERR_INVALID_NAME` & The variable or category name is invalid \ `MPI_T_ERR_INVALID_INDEX` & The variable index is invalid  `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_OUT_OF_HANDLES` & No more handles available \ `MPI_T_ERR_OUT_OF_SESSIONS` & No more sessions available `MPI_T_ERR_INVALID_SESSION` & Session argument is not a valid session\ \ \ `MPI_T_ERR_CVAR_SET_NOT_NOW` & Variable cannot be set at this moment\ `MPI_T_ERR_CVAR_SET_NEVER` & Variable cannot be set until end of execution\ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid \ \ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_INVALID_SESSION` & Session argument is not a valid session\ `MPI_T_ERR_PVAR_NO_STARTSTOP` & Variable cannot be started or stopped\ & (for [[versions/v40/API/MPI_T_PVAR_START|MPI_T_PVAR_START]] and\ & [[versions/v40/API/MPI_T_PVAR_STOP|MPI_T_PVAR_STOP]] )\ `MPI_T_ERR_PVAR_NO_WRITE` & Variable cannot be written or reset\ & (for [[versions/v40/API/MPI_T_PVAR_WRITE|MPI_T_PVAR_WRITE]] and\ & [[versions/v40/API/MPI_T_PVAR_RESET|MPI_T_PVAR_RESET]] )  `MPI_T_ERR_PVAR_NO_ATOMIC` & Variable cannot be read and written atomically\ & (for [[versions/v40/API/MPI_T_PVAR_READRESET|MPI_T_PVAR_READRESET]] )\ \ `MPI_T_ERR_INVALID_INDEX` & The category index is invalid\~~

==\|l\|X\| Return Code & Description\ \ `MPI_SUCCESS` & Call completed successfully\ `MPI_T_ERR_INVALID` & Invalid or bad parameter value(s)\ `MPI_T_ERR_MEMORY` & Out of memory\ `MPI_T_ERR_NOT_INITIALIZED` & Interface not initialized\ `MPI_T_ERR_CANNOT_INIT` & Interface not in the state to be initialized `MPI_T_ERR_NOT_ACCESSIBLE` & Requested functionality not accessible\ \ `MPI_T_ERR_INVALID_INDEX` & The enumeration index is invalid\ \ `MPI_T_ERR_INVALID_INDEX` & The variable or category index is invalid `MPI_T_ERR_INVALID_NAME` & The variable or category name is invalid \ `MPI_T_ERR_INVALID_INDEX` & The variable index is invalid  `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_OUT_OF_HANDLES` & No more handles available \ `MPI_T_ERR_OUT_OF_SESSIONS` & No more sessions available `MPI_T_ERR_INVALID_SESSION` & Session argument is not a valid session\ \ `MPI_T_ERR_CVAR_SET_NOT_NOW` & Variable cannot be set at this moment\ `MPI_T_ERR_CVAR_SET_NEVER` & Variable cannot be set until end of execution\ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid \ \ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_INVALID_SESSION` & Performance experiment session argument is not valid\ `MPI_T_ERR_PVAR_NO_STARTSTOP` & Variable cannot be started or stopped (for [[versions/v40/API/MPI_T_PVAR_START|MPI_T_PVAR_START]] and [[versions/v40/API/MPI_T_PVAR_STOP|MPI_T_PVAR_STOP]] )\ `MPI_T_ERR_PVAR_NO_WRITE` & Variable cannot be written or reset (for [[versions/v40/API/MPI_T_PVAR_WRITE|MPI_T_PVAR_WRITE]] and [[versions/v40/API/MPI_T_PVAR_RESET|MPI_T_PVAR_RESET]] )  `MPI_T_ERR_PVAR_NO_ATOMIC` & Variable cannot be read and written atomically (for [[versions/v40/API/MPI_T_PVAR_READRESET|MPI_T_PVAR_READRESET]] )\ \ `MPI_T_ERR_INVALID_INDEX` & The source index is invalid  `MPI_T_ERR_NOT_SUPPORTED` & Requested functionality not supported\ \ `MPI_T_ERR_INVALID_INDEX` & The category index is invalid\==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~All functions defined as part of the MPI tool information interface return an integer error code (see Table [[versions/v41/sections/tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] ) to indicate whether the function was completed successfully or was aborted. In the latter case, the error code indicates the reason for not completing the routine. Such errors neither impact the execution of the MPI process nor invoke MPI error handlers. The MPI process continues executing regardless of the return code from the call. The MPI implementation is not required to check all user-provided parameters; if a user passes invalid parameter values to any routine the behavior of the implementation is undefined.~~

~~All error codes with the prefix `MPI_T_` must be unique values and cannot overlap with any other error codes or error classes returned by the MPI implementation. Further, they shall be treated as MPI error classes as defined in [[versions/v41/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] and follow the same rules and restrictions. In particular, they must satisfy:~~

~~(code block removed)~~
``` math
0 = \texttt{MPI_SUCCESS} < \texttt{MPI_T_ERR_XXX} \leq \texttt{MPI_ERR_LASTCODE}.
```

~~\|l\|X\| Return Code & Description\ \ `MPI_SUCCESS` & Call completed successfully\ `MPI_T_ERR_INVALID` & Invalid or bad parameter value(s)\ `MPI_T_ERR_MEMORY` & Out of memory\ `MPI_T_ERR_NOT_INITIALIZED` & Interface not initialized\ `MPI_T_ERR_CANNOT_INIT` & Interface not in the state to be initialized `MPI_T_ERR_NOT_ACCESSIBLE` & Requested functionality not accessible\ \ `MPI_T_ERR_INVALID_INDEX` & The enumeration index is invalid\ \ `MPI_T_ERR_INVALID_INDEX` & The variable or category index is invalid `MPI_T_ERR_INVALID_NAME` & The variable or category name is invalid \ `MPI_T_ERR_INVALID_INDEX` & The variable index is invalid  `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_OUT_OF_HANDLES` & No more handles available \ `MPI_T_ERR_OUT_OF_SESSIONS` & No more sessions available `MPI_T_ERR_INVALID_SESSION` & Session argument is not a valid session\ \ `MPI_T_ERR_CVAR_SET_NOT_NOW` & Variable cannot be set at this moment\ `MPI_T_ERR_CVAR_SET_NEVER` & Variable cannot be set until end of execution\ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid \ \ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_INVALID_SESSION` & Performance experiment session argument is not valid\ `MPI_T_ERR_PVAR_NO_STARTSTOP` & Variable cannot be started or stopped (for [[versions/v41/API/MPI_T_PVAR_START|MPI_T_PVAR_START]] and [[versions/v41/API/MPI_T_PVAR_STOP|MPI_T_PVAR_STOP]] )\ `MPI_T_ERR_PVAR_NO_WRITE` & Variable cannot be written or reset (for [[versions/v41/API/MPI_T_PVAR_WRITE|MPI_T_PVAR_WRITE]] and [[versions/v41/API/MPI_T_PVAR_RESET|MPI_T_PVAR_RESET]] )  `MPI_T_ERR_PVAR_NO_ATOMIC` & Variable cannot be read and written atomically (for [[versions/v41/API/MPI_T_PVAR_READRESET|MPI_T_PVAR_READRESET]] )\ \ `MPI_T_ERR_INVALID_INDEX` & The source index is invalid  `MPI_T_ERR_NOT_SUPPORTED` & Requested functionality not supported\ \ `MPI_T_ERR_INVALID_INDEX` & The category index is invalid\~~

==All procedures defined as part of the MPI tool information interface return an integer *return code*==

==(see Table [[versions/v41/sections/tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] ) to indicate whether the function was completed successfully or was aborted. For the former case, the value `MPI_SUCCESS` is returned. In the latter case, the return code indicates the reason for not completing the routine. Regardless of whether the return code is `MPI_SUCCESS` or indicates that the procedure abnormally terminated, the MPI process continues normal execution and does not invoke any MPI error handler. The MPI implementation is not required to check all user-provided parameters; if a user passes invalid parameter values to any routine, the behavior of the implementation is undefined.==

==All return codes with the prefix `MPI_T_ERR_` must be unique values and cannot overlap with any error codes or error classes returned by the MPI implementation. They must also satisfy==

==(code block added)==
``` math
0 = \texttt{MPI_SUCCESS} < MPI_T_ERR_XXX \leq \texttt{MPI_ERR_LASTCODE}.
```

==\|l\|X\| **Return Code** & **Description**\ \ `MPI_SUCCESS` & Call completed successfully\ `MPI_T_ERR_INVALID` & Invalid or bad parameter value(s)\ `MPI_T_ERR_MEMORY` & Out of memory\ `MPI_T_ERR_NOT_INITIALIZED` & Interface not initialized\ `MPI_T_ERR_CANNOT_INIT` & Interface not in the state to be initialized `MPI_T_ERR_NOT_ACCESSIBLE` & Requested functionality not accessible\ \ `MPI_T_ERR_INVALID_INDEX` & The enumeration index is invalid\ \ `MPI_T_ERR_INVALID_INDEX` & The variable or category index is invalid `MPI_T_ERR_INVALID_NAME` & The variable or category name is invalid \ `MPI_T_ERR_INVALID_INDEX` & The variable index is invalid  `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_OUT_OF_HANDLES` & No more handles available \ `MPI_T_ERR_OUT_OF_SESSIONS` & No more sessions available `MPI_T_ERR_INVALID_SESSION` & Session argument is not a valid session\ \ `MPI_T_ERR_CVAR_SET_NOT_NOW` & Variable cannot be set at this moment\ `MPI_T_ERR_CVAR_SET_NEVER` & Variable cannot be set until end of execution\ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid \ \ `MPI_T_ERR_INVALID_HANDLE` & The handle is invalid `MPI_T_ERR_INVALID_SESSION` & Performance experiment session argument is invalid\ `MPI_T_ERR_PVAR_NO_STARTSTOP` & Variable cannot be started or stopped (for [[versions/v41/API/MPI_T_PVAR_START|MPI_T_PVAR_START]] and [[versions/v41/API/MPI_T_PVAR_STOP|MPI_T_PVAR_STOP]] )\ `MPI_T_ERR_PVAR_NO_WRITE` & Variable cannot be written or reset (for [[versions/v41/API/MPI_T_PVAR_WRITE|MPI_T_PVAR_WRITE]] and [[versions/v41/API/MPI_T_PVAR_RESET|MPI_T_PVAR_RESET]] )  `MPI_T_ERR_PVAR_NO_ATOMIC` & Variable cannot be read and written atomically (for [[versions/v41/API/MPI_T_PVAR_READRESET|MPI_T_PVAR_READRESET]] )\ \ `MPI_T_ERR_INVALID_INDEX` & The source index is invalid  `MPI_T_ERR_NOT_SUPPORTED` & Requested functionality not supported\ \ `MPI_T_ERR_INVALID_INDEX` & The category index is invalid\==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Return Codes for the MPI Tool Information Interface]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Return Codes for the MPI Tool Information Interface]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Return Codes for the MPI Tool Information Interface]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Return Codes for the MPI Tool Information Interface]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Return Codes for the MPI Tool Information Interface]]

---
title: "Convention for Returning Strings"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Convention for Returning Strings

Chapter **tools** · in [[versions/v30/sections/tools#Convention for Returning Strings|MPI-3.0]], [[versions/v31/sections/tools#Convention for Returning Strings|MPI-3.1]], [[versions/v40/sections/tools#Convention for Returning Strings|MPI-4.0]], [[versions/v41/sections/tools#Convention for Returning Strings|MPI-4.1]], [[versions/v50/sections/tools#Convention for Returning Strings|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

==MPI implementations behave as if they have an internal character array that is copied to the output character array supplied by the user. Such output strings are only defined to be equivalent if their notional source-internal character arrays are identical (up to and including the null terminator), even if the output string is truncated due to a small input length parameter $`n`$.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Several MPI tool information interface functions return one or more strings. These functions have two arguments for each string to be returned: an OUT parameter that identifies a pointer to the buffer in which the string will be returned, and an ~~IN/OUT~~ ==INOUT== parameter to pass the length of the buffer. The user is responsible for the memory allocation of the buffer and must pass the size of the buffer ($`n`$) as the length argument. Let $`n`$ be the length value specified to the function. On return, the function writes at most $`n-1`$ of the string’s characters into the buffer, followed by a null terminator. If the returned string’s length is greater than or equal to $`n`$, the string will be truncated to $`n-1`$ characters. In this case, the length of the string plus one (for the terminating null character) is returned in the length argument. If the user passes the null pointer as the buffer argument or passes 0 as the length argument, the function does not return the string and only returns the length of the string plus one in the length argument. If the user passes the null pointer as the length argument, the buffer argument is ignored and nothing is returned.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Convention for Returning Strings]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Convention for Returning Strings]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Convention for Returning Strings]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Convention for Returning Strings]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Convention for Returning Strings]]

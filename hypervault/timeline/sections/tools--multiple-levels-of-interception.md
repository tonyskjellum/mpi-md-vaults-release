---
title: "Multiple Levels of Interception"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Multiple Levels of Interception

Chapter **tools** · in [[versions/v13/sections/prof#Multiple levels of interception|MPI-1.3]], [[versions/v21/sections/prof#Multiple Levels of Interception|MPI-2.1]], [[versions/v22/sections/prof#Multiple Levels of Interception|MPI-2.2]], [[versions/v30/sections/tools#Multiple Levels of Interception|MPI-3.0]], [[versions/v31/sections/tools#Multiple Levels of Interception|MPI-3.1]], [[versions/v40/sections/tools#Multiple Levels of Interception|MPI-4.0]], [[versions/v41/sections/tools#Multiple Levels of Interception|MPI-4.1]], [[versions/v50/sections/tools#Multiple Levels of Interception|MPI-5.0]]

Heading by release: MPI-1.3: “Multiple levels of interception”; MPI-2.1: “Multiple Levels of Interception”; MPI-2.2: “Multiple Levels of Interception”; MPI-3.0: “Multiple Levels of Interception”; MPI-3.1: “Multiple Levels of Interception”; MPI-4.0: “Multiple Levels of Interception”; MPI-4.1: “Multiple Levels of Interception”; MPI-5.0: “Multiple Levels of Interception”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~The scheme given here does not directly support the nesting of profiling functions, since it provides only a single alternative name for each MPI function. Consideration was given to an implementation which would allow multiple levels of call interception, however we were unable to construct an implementation of this which did not have the following disadvantages~~

==The scheme given here does not directly support the nesting of profiling functions, since it provides only a single alternative name for each MPI function. Consideration was given to an implementation==

==that==

==would allow multiple levels of call interception, however we were unable to construct an implementation of this==

==that==

==did not have the following disadvantages==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~The scheme given here does not directly support the nesting of profiling functions, since it provides only a single alternative name for each MPI function. Consideration was given to an implementation~~

~~that~~

~~would allow multiple levels of call interception, however we were unable to construct an implementation of this~~

~~that~~

~~did not have the following disadvantages~~

~~- assuming a particular implementation language.~~

==The scheme given here does not directly support the nesting of profiling functions, since it provides only a single alternative name for each MPI function. Consideration was given to an implementation that would allow multiple levels of call interception, however we were unable to construct an implementation of this that did not have the following disadvantages==

==- assuming a particular implementation language,==

~~Note, however, that it is possible to use the scheme above to implement a multi-level system, since the function called by the user may call many different profiling functions before calling the underlying MPI function.~~

~~Unfortunately such an implementation may require more cooperation between the different profiling libraries than is required for the single level implementation detailed above.~~

==Note, however, that it is possible to use the scheme above to implement a multi-level system, since the function called by the user may call many different profiling functions before calling the underlying MPI function. This capability has been demonstrated in the P$`^N`$MPI tool infrastructure .==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

- assuming a particular implementation language, ==and==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/prof#Multiple levels of interception]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#Multiple Levels of Interception]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#Multiple Levels of Interception]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Multiple Levels of Interception]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Multiple Levels of Interception]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Multiple Levels of Interception]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Multiple Levels of Interception]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Multiple Levels of Interception]]

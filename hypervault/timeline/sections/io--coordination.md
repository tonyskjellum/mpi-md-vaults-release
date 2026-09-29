---
title: "Coordination"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Coordination

Chapter **io** · in [[versions/v20/sections/io#Coordination|MPI-2.0]], [[versions/v21/sections/io#Coordination|MPI-2.1]], [[versions/v22/sections/io#Coordination|MPI-2.2]], [[versions/v30/sections/io#Coordination|MPI-3.0]], [[versions/v31/sections/io#Coordination|MPI-3.1]], [[versions/v40/sections/io#Coordination|MPI-4.0]], [[versions/v41/sections/io#Coordination|MPI-4.1]], [[versions/v50/sections/io#Coordination|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~has a collective counterpart. For most routines, this counterpart is <span class="sans-serif">MPI_FILE_XXX_ALL</span> or a pair of <span class="sans-serif">MPI_FILE_XXX_BEGIN</span> and <span class="sans-serif">MPI_FILE_XXX_END</span>. The counterparts to the <span class="sans-serif">MPI_FILE_XXX_SHARED</span> routines are <span class="sans-serif">MPI_FILE_XXX_ORDERED</span>.~~

==has a collective counterpart. For most routines, this counterpart is <span class="sans-serif">MPI_FILE_XXX_ALL</span> or a pair of <span class="sans-serif">MPI_FILE_XXX_BEGIN</span> and==

==<span class="sans-serif">MPI_FILE_XXX_END</span>. The counterparts to the <span class="sans-serif">MPI_FILE_XXX_SHARED</span> routines are==

==<span class="sans-serif">MPI_FILE_XXX_ORDERED</span>.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The completion of a noncollective call only depends on the activity of the calling process. However, the completion of a collective call (which must be called by all members of the process group) may depend on the activity of the other processes participating in the collective call.~~

~~See Section [[versions/v30/sections/io#Collective File Operations|Collective File Operations]] , page [[versions/v30/sections/io#Collective File Operations|Collective File Operations]] , for rules on semantics of collective calls.~~

==The completion of a noncollective call only depends on the activity of the calling process. However, the completion of a collective call (which must be called by all members of the process group) may depend on the activity of the other processes participating in the collective call. See Section [[versions/v30/sections/io#Collective File Operations|Collective File Operations]] , page [[versions/v30/sections/io#Collective File Operations|Collective File Operations]] , for rules on semantics of collective calls.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Every noncollective data access routine <span class="sans-serif">MPI_FILE_XXX</span>~~

~~has a collective counterpart. For most routines, this counterpart is <span class="sans-serif">MPI_FILE_XXX_ALL</span> or a pair of <span class="sans-serif">MPI_FILE_XXX_BEGIN</span> and~~

~~<span class="sans-serif">MPI_FILE_XXX_END</span>. The counterparts to the <span class="sans-serif">MPI_FILE_XXX_SHARED</span> routines are~~

~~<span class="sans-serif">MPI_FILE_XXX_ORDERED</span>.~~

~~The completion of a noncollective call only depends on the activity of the calling process. However, the completion of a collective call (which must be called by all members of the process group) may depend on the activity of the other processes participating in the collective call. See Section [[versions/v31/sections/io#Collective File Operations|Collective File Operations]] , page [[versions/v31/sections/io#Collective File Operations|Collective File Operations]] , for rules on semantics of collective calls.~~

==Every noncollective data access routine `MPI_FILE_XXX` has a collective counterpart. For most routines, this counterpart is `MPI_FILE_XXX_ALL` or a pair of `MPI_FILE_XXX_BEGIN` and `MPI_FILE_XXX_END`. The counterparts to the `MPI_FILE_XXX_SHARED` routines are `MPI_FILE_XXX_ORDERED`.==

==The completion of a noncollective call only depends on the activity of the calling process. However, the completion of a collective call (which must be called by all members of the process group) may depend on the activity of the other processes participating in the collective call. See [[versions/v31/sections/io#Collective File Operations|Collective File Operations]] for rules on semantics of collective calls.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Coordination]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Coordination]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Coordination]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Coordination]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Coordination]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Coordination]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Coordination]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Coordination]]

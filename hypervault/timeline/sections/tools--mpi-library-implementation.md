---
title: "MPI Library Implementation"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# MPI Library Implementation

Chapter **tools** · in [[versions/v13/sections/prof#MPI library implementation|MPI-1.3]], [[versions/v21/sections/prof#MPI Library Implementation|MPI-2.1]], [[versions/v22/sections/prof#MPI Library Implementation|MPI-2.2]], [[versions/v40/sections/tools#MPI Library Implementation|MPI-4.0]], [[versions/v41/sections/tools#MPI Library Implementation|MPI-4.1]], [[versions/v50/sections/tools#MPI Library Implementation|MPI-5.0]]

Heading by release: MPI-1.3: “MPI library implementation”; MPI-2.1: “MPI Library Implementation”; MPI-2.2: “MPI Library Implementation”; MPI-4.0: “MPI Library Implementation”; MPI-4.1: “MPI Library Implementation”; MPI-5.0: “MPI Library Implementation”

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~On a Unix system, in which~~ ==If== the MPI library is implemented in ~~C,~~ ==C on a Unix system,== then there are various ~~possible~~ options, ~~of which~~ ==including the== two ~~of~~ ==presented here, for supporting== the ~~most obvious are presented here. Which is better~~ ==name-shift requirement. The choice between these two options== depends ==partly== on whether the linker and compiler support weak symbols.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

==If the compiler and linker support weak external symbols (e.g., Solaris 2.x, other System V.4 machines), then only a single library is required as the following example shows:==

==Library implementation using weak symbols.==

==    #pragma weak MPI_Example = PMPI_Example==

==    int PMPI_Example(/* appropriate args */)     {         /* Useful content */             }==

==The effect of this `#pragma` is to define the external symbol `MPI_Example` as a weak definition. This means that the linker will not complain if there is another definition of the symbol (for instance in the profiling library); however if no other definition exists, then the linker will use the weak definition.==

==In the absence of weak symbols then one possible solution would be to use the C macro preprocessor as the following example shows:==

==Library implementation using C pre-processor macros.==

==    #ifdef PROFILELIB     #    ifdef __STDC__     #        define FUNCTION(name) P##name     #    else     #        define FUNCTION(name) P/**/name     #    endif     #else     #    define FUNCTION(name) name     #endif==

==Each of the user visible functions in the library would then be declared thus==

==    int FUNCTION(MPI_Example)(/* appropriate args */)     {         /* Useful content */             }==

==The same source file can then be compiled to produce both versions of the library, depending on the state of the `PROFILELIB` macro symbol.==

==It is required that the standard MPI library be built in such a way that the inclusion of MPI functions can be achieved one at a time. This is a somewhat unpleasant requirement, since it may mean that each external function has to be compiled from a separate file. However this is necessary so that the author of the profiling library need only define those MPI functions that need to be intercepted, references to any others being fulfilled by the normal MPI library. Therefore the link step can look something like this==

==    % cc ... -lmyprof -lpmpi -lmpi==

==Here `libmyprof.a` contains the profiler functions that intercept some of the MPI functions, `libpmpi.a` contains the “name shifted” MPI functions, and `libmpi.a` contains the normal definitions of the MPI functions.==

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

If the compiler and linker support weak external ~~symbols (e.g., Solaris 2.x, other System V.4 machines),~~ ==symbols,== then only a single library is required as the following example shows:

~~    #pragma weak MPI_Example = PMPI_Example~~

~~    int PMPI_Example(/* appropriate args */)     {         /* Useful content */             }~~

==(code block added)==
``` [MPI]C
#pragma weak MPI_Example = PMPI_Example

int PMPI_Example(/* appropriate args */)
{
    /* Useful content */
}
```

~~    #ifdef PROFILELIB     #    ifdef __STDC__     #        define FUNCTION(name) P##name     #    else     #        define FUNCTION(name) P/**/name     #    endif     #else     #    define FUNCTION(name) name     #endif~~

==(code block added)==
``` objectivec
#ifdef PROFILELIB
#    ifdef __STDC__
#        define FUNCTION(name) P##name
#    else
#        define FUNCTION(name) P/**/name
#    endif
#else
#    define FUNCTION(name) name
#endif
```

~~    int FUNCTION(MPI_Example)(/* appropriate args */)     {         /* Useful content */             }~~

==(code block added)==
``` [MPI]C
int FUNCTION(MPI_Example)(/* appropriate args */)
{
    /* Useful content */
}
```

~~It is required that the standard MPI library be built in such a way that the inclusion of MPI functions can be achieved one at a time. This is a somewhat unpleasant requirement, since it may mean that each external function has to be compiled from a separate file. However this is necessary so that the author of the profiling library need only define those MPI functions that need to be intercepted, references to any others being fulfilled by the normal MPI library. Therefore the link step can look something like this~~

==It is required that the standard MPI library be built in such a way that the inclusion of MPI functions can be achieved one at a time. This may mean that each external function must reside in its own compilation unit. This is necessary so that the author of the profiling library need only define those MPI functions that need to be intercepted, references to any others being fulfilled by the normal MPI library.==

==The following example shows a potential link step when using the profiling interface.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/prof#MPI library implementation]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#MPI Library Implementation]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#MPI Library Implementation]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#MPI Library Implementation]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#MPI Library Implementation]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#MPI Library Implementation]]

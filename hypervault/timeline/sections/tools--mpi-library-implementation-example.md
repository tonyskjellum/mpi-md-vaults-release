---
title: "MPI Library Implementation Example"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/tools]
---

# MPI Library Implementation Example

Chapter **tools** · in [[versions/v30/sections/tools#MPI Library Implementation Example|MPI-3.0]], [[versions/v31/sections/tools#MPI Library Implementation Example|MPI-3.1]]

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

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#MPI Library Implementation Example]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#MPI Library Implementation Example]]

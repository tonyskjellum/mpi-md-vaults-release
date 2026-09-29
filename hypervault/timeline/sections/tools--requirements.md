---
title: "Requirements"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Requirements

Chapter **tools** · in [[versions/v13/sections/prof#Requirements|MPI-1.3]], [[versions/v21/sections/prof#Requirements|MPI-2.1]], [[versions/v22/sections/prof#Requirements|MPI-2.2]], [[versions/v30/sections/tools#Requirements|MPI-3.0]], [[versions/v31/sections/tools#Requirements|MPI-3.1]], [[versions/v40/sections/tools#Requirements|MPI-4.0]], [[versions/v41/sections/tools#Requirements|MPI-4.1]], [[versions/v50/sections/tools#Requirements|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~1.  provide a mechanism through which all of the MPI defined functions may be accessed with a name shift. Thus all of the MPI functions (which normally start with the prefix “`MPI_`”) should also be accessible with the prefix “`PMPI_`”.~~

~~2.  ensure that those MPI functions which are not replaced may still be linked into an executable image without causing name clashes.~~

==1.  provide a mechanism through which all of the MPI defined functions==

==    except==

==    those allowed as macros (See Section [[versions/v21/sections/terms#Functions and Macros|Functions and Macros]] ). This requires, in C and Fortran, an alternate entry point name, with the prefix `PMPI_` for each MPI function. The profiling interface in C++ is described in Section [[versions/v21/sections/binding#Profiling|Profiling]] . For routines implemented as macros, it is still required that the [[PMPI]] version be supplied and work as expected, but it is not possible to replace at link time the `MPI_` version with a user-defined version.==

==2.  ensure that those MPI functions==

==    that==

==    are not replaced may still be linked into an executable image without causing name clashes.==

~~4.  where the implementation of different language bindings is done through a layered approach (e.g. the Fortran binding is a set of “wrapper” functions which call the C implementation), ensure that these wrapper functions are separable from the rest of the library.~~

~~    This is necessary to allow a separate profiling library to be correctly implemented, since (at least with Unix linker semantics) the profiling library must contain these wrapper functions if it is to perform as expected. This requirement allows the person who builds the profiling library to extract these functions from the original MPI library and add them into the profiling library without bringing along any other unnecessary code.~~

==4.  where the implementation of different language bindings is done through a layered approach (e.g. the Fortran binding is a set of “wrapper” functions==

==    that==

==    call the C implementation), ensure that these wrapper functions are separable from the rest of the library.==

==    This==

==    separability==

==    is necessary to allow a separate profiling library to be correctly implemented, since (at least with Unix linker semantics) the profiling library must contain these wrapper functions if it is to perform as expected. This requirement allows the person who builds the profiling library to extract these functions from the original MPI library and add them into the profiling library without bringing along any other unnecessary code.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~To meet the MPI profiling interface, an implementation of the MPI functions *must*~~

~~1.  provide a mechanism through which all of the MPI defined functions~~

~~    except~~

~~    those allowed as macros (See Section [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] ). This requires, in C and Fortran, an alternate entry point name, with the prefix `PMPI_` for each MPI function. The profiling interface in C++ is described in Section [[versions/v30/sections/binding#Profiling|Profiling]] . For routines implemented as macros, it is still required that the [[PMPI]] version be supplied and work as expected, but it is not possible to replace at link time the `MPI_` version with a user-defined version.~~

~~2.  ensure that those MPI functions~~

~~    that~~

~~    are not replaced may still be linked into an executable image without causing name clashes.~~

~~3.  document the implementation of different language bindings of the MPI interface if they are layered on top of each other, so that the profiler developer knows whether she must implement the profile interface for each binding, or can economise by implementing it only for the lowest level routines.~~

~~4.  where the implementation of different language bindings is done through a layered approach (e.g. the Fortran binding is a set of “wrapper” functions~~

~~    that~~

~~    call the C implementation), ensure that these wrapper functions are separable from the rest of the library.~~

~~    This~~

~~    separability~~

~~    is necessary to allow a separate profiling library to be correctly implemented, since (at least with Unix linker semantics) the profiling library must contain these wrapper functions if it is to perform as expected. This requirement allows the person who builds the profiling library to extract these functions from the original MPI library and add them into the profiling library without bringing along any other unnecessary code.~~

==To meet the requirements for the MPI profiling interface, an implementation of the MPI functions *must*==

==1.  provide a mechanism through which all of the MPI defined functions, except those allowed as macros (See Section [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] ), may be accessed with a name shift. This requires, in C and Fortran, an alternate entry point name, with the prefix `PMPI_` for each MPI function in each provided language binding and language support method.==

==    For routines implemented as macros, it is still required that the [[PMPI]] version be supplied and work as expected, but it is not possible to replace at link time the `MPI_` version with a user-defined version.==

==    For Fortran, the different support methods cause several linker names. Therefore, several profiling routines (with these linker names) are needed for each Fortran MPI routine, as described in Section [[versions/v30/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names and the Profiling Interface]] on page [[versions/v30/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names and the Profiling Interface]] .==

==2.  ensure that those MPI functions that are not replaced may still be linked into an executable image without causing name clashes.==

==3.  document the implementation of different language bindings of the MPI interface if they are layered on top of each other, so that the profiler developer knows whether she must implement the profile interface for each binding, or can economize by implementing it only for the lowest level routines.==

==4.  where the implementation of different language bindings is done through a layered approach (e.g., the Fortran binding is a set of “wrapper” functions that call the C implementation), ensure that these wrapper functions are separable from the rest of the library.==

==    This separability is necessary to allow a separate profiling library to be correctly implemented, since (at least with Unix linker semantics) the profiling library must contain these wrapper functions if it is to perform as expected. This requirement allows the person who builds the profiling library to extract these functions from the original MPI library and add them into the profiling library without bringing along any other unnecessary code.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

1. provide a mechanism through which all of the MPI defined functions, except those allowed as macros (See Section [[versions/v31/sections/terms#Functions and Macros|Functions and Macros]] ), may be accessed with a name shift. This requires, in C and Fortran, an alternate entry point name, with the prefix `PMPI_` for each MPI ~~function in each provided language binding and language support method.~~

==function in each provided language binding and language support method.== For routines implemented as macros, it is still required that the [[PMPI]] version be supplied and work as expected, but it is not possible to replace at link time the `MPI_` version with a user-defined version.

For Fortran, the different support methods cause several ~~linker~~ ==specific procedure== names. Therefore, several profiling routines (with these ~~linker~~ ==specific procedure== names) are needed for each Fortran MPI routine, as described in ~~Section~~ [[versions/v31/sections/binding#Interface Specifications, ~~Linker Names~~ ==Procedure Names,== and the Profiling Interface|Interface Specifications, ~~Linker Names and the Profiling Interface]] on page [[versions/v31/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names~~ ==Procedure Names,== and the Profiling Interface]] .

5. provide a no-op routine ~~`MPI_PCONTROL`~~ ==[[versions/v31/API/MPI_PCONTROL|MPI_PCONTROL]]== in the MPI library.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~1.  provide a mechanism through which all of the MPI defined functions, except those allowed as macros (See Section [[versions/v40/sections/terms#Functions and Macros|Functions and Macros]] ), may be accessed with a name shift. This requires, in C and Fortran, an alternate entry point name, with the prefix `PMPI_` for each MPI~~

~~    function in each provided language binding and language support method. For routines implemented as macros, it is still required that the [[PMPI]] version be supplied and work as expected, but it is not possible to replace at link time the `MPI_` version with a user-defined version.~~

==1.  provide a mechanism through which all of the MPI defined functions, except those allowed as macros (See Section [[versions/v40/sections/terms#Functions and Macros|Functions and Macros]] ), may be accessed with a name shift. This requires, in C and Fortran, an alternate entry point name, with the prefix `PMPI_` for each MPI function in each provided language binding and language support method. For routines implemented as macros, it is still required that the [[PMPI]] version be supplied and work as expected, but it is not possible to replace at link time the `MPI_` version with a user-defined version.==

3. document the implementation of different language bindings of the MPI interface if they are layered on top of each other, so that the profiler developer knows whether ~~she must~~ ==to== implement the profile interface for each binding, or ~~can~~ ==to== economize by implementing it only for the lowest level routines.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

1. provide a mechanism through which all of the MPI defined functions, except those allowed as macros (See Section [[versions/v50/sections/terms#Functions and Macros|Functions and Macros]] ), may be accessed with a name shift. This requires, in C and Fortran, an alternate entry point name, with the prefix ~~`PMPI_`~~ ==[[PMPI]]== for each MPI function in each provided language binding and language support method. For routines implemented as macros, it is still required that the [[PMPI]] version be supplied and work as expected, but it is not possible to replace ~~at link time~~ the `MPI_` version with a user-defined ~~version.~~ ==version at link time.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/prof#Requirements]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#Requirements]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#Requirements]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Requirements]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Requirements]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Requirements]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Requirements]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Requirements]]

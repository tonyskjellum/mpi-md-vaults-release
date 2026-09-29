---
title: "The `info` argument"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/dynamic]
---

# The `info` argument

Chapter **dynamic** · in [[versions/v20/sections/dynamic#The `info` argument|MPI-2.0]], [[versions/v21/sections/dynamic#The `info` argument|MPI-2.1]], [[versions/v22/sections/dynamic#The `info` argument|MPI-2.2]], [[versions/v30/sections/dynamic#The `info` argument|MPI-3.0]], [[versions/v31/sections/dynamic#The `info` argument|MPI-3.1]], [[versions/v40/sections/dynamic#The `info` argument|MPI-4.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~The `info` argument to all of the routines in this chapter is an opaque handle of type [[MPI_Info]] in C,~~

==The `info` argument to all of the routines in this==

==chapter is an opaque handle of type `MPI_Info` in C,==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

For the [[SPAWN]] calls, `info` provides additional (and possibly implementation-dependent) instructions to MPI and the runtime system on how to start processes. An application may pass ~~MPI_INFO_NULL~~ ==`MPI_INFO_NULL`== in C or Fortran. Portable programs not requiring detailed control over process locations should use ~~MPI_INFO_NULL.~~ ==`MPI_INFO_NULL`.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~chapter is an opaque handle of type `MPI_Info` in C,~~

~~`MPI::Info` in C++ and~~

~~`INTEGER` in Fortran. It is a container for a number of user-specified (`key`,`value`) pairs. `key` and `value` are strings (null-terminated `char*` in C, `character*(*)` in Fortran). Routines to create and manipulate the `info` argument are described in Section [[versions/v30/sections/misc#The Info Object|The Info Object]] on page [[versions/v30/sections/misc#The Info Object|The Info Object]] .~~

==chapter is an opaque handle of type `MPI_Info` in C and Fortran with the `mpi_f08` module and `INTEGER` in Fortran with the `mpi` module or the include file `mpif.h`. It is a container for a number of user-specified (`key`,`value`) pairs. `key` and `value` are strings (null-terminated `char*` in C, `character*(*)` in Fortran). Routines to create and manipulate the `info` argument are described in Chapter [[versions/v30/sections/misc#The Info Object|The Info Object]] on page [[versions/v30/sections/misc#The Info Object|The Info Object]] .==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

chapter is an opaque handle of type `MPI_Info` in C and Fortran with the `mpi_f08` module and `INTEGER` in Fortran with the `mpi` module or the include file `mpif.h`. It is a container for a number of user-specified (`key`,`value`) pairs. `key` and `value` are strings (null-terminated `char*` in C, `character*(*)` in Fortran). Routines to create and manipulate the `info` argument are described in ~~Chapter [[versions/v31/sections/misc#The Info Object|The Info Object]] on page [[versions/v31/sections/misc#The Info Object|The Info Object]] .~~ ==[[Chapter]] subsec:info.==

MPI does not specify the content of the `info` argument, except to reserve a number of special `key` values (see ~~Section [[versions/v31/sections/dynamic#Reserved Keys|Reserved Keys]] on page~~ [[versions/v31/sections/dynamic#Reserved Keys|Reserved Keys]] ). The `info` argument is quite flexible and could even be used, for example, to specify the executable and its command-line arguments. In this case the `command` argument to [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] could be empty. The ability to do this follows from the fact that MPI does not specify how an executable is found, and the `info` argument can tell the runtime system where to “find” the executable “” (empty string). Of course a program that does this will not be portable across MPI implementations.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

MPI does not specify the content of the `info` argument, except to reserve a number of special `key` values (see [[versions/v40/sections/dynamic#Reserved Keys|Reserved Keys]] ). The `info` argument is quite flexible and could even be used, for example, to specify the executable and its command-line arguments. In this case the `command` argument to [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] could be empty. The ability to do this follows from the fact that MPI does not specify how an executable is found, and the `info` argument can tell the runtime system where to “find” the executable “” (empty string). Of ~~course~~ ==course,== a program that does this will not be portable across MPI implementations.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#The `info` argument]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#The `info` argument]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#The `info` argument]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#The `info` argument]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#The `info` argument]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#The `info` argument]]

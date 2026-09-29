---
title: "C Binding Issues"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# C Binding Issues

Chapter **terms** · in [[versions/v13/sections/terms#C Binding Issues|MPI-1.3]], [[versions/v20/sections/terms#C Binding Issues|MPI-2.0]], [[versions/v21/sections/terms#C Binding Issues|MPI-2.1]], [[versions/v22/sections/terms#C Binding Issues|MPI-2.2]], [[versions/v30/sections/terms#C Binding Issues|MPI-3.0]], [[versions/v31/sections/terms#C Binding Issues|MPI-3.1]], [[versions/v40/sections/terms#C Binding Issues|MPI-4.0]], [[versions/v41/sections/terms#C Binding Issues|MPI-4.1]], [[versions/v50/sections/terms#C Binding Issues|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~We use the ANSI C declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare variables or functions with names beginning with the prefix, `MPI_`. This is mandated to avoid possible name collisions.~~

==We use the==

==ISO C==

==declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare variables or functions with names beginning with the prefix `MPI_`. To support the profiling interface, programs should not declare functions with names beginning with the prefix `PMPI_`.==

Almost all C functions return an error code. The successful return code will be ~~`MPI_SUCCESS`,~~ ==MPI_SUCCESS,== but failure return codes are implementation dependent. ~~A few C functions do not return values, so that they can be implemented as macros.~~

Type declarations are provided for handles to each category of opaque objects. ~~Either a pointer or an integer type is used.~~

~~Choice arguments are pointers of type `void*`.~~

~~Address arguments are of MPI defined type MPI_Aint. This is defined to be an int of the size needed to hold any valid address on the target architecture.~~

~~All named MPI constants can be used in initialization expressions or assignments like C constants.~~

==Choice arguments are pointers of type `void *`.==

==Address arguments are of MPI defined type==

==`MPI_Aint`.==

==File displacements are of type `MPI_Offset`. MPI_Aint is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.==

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

~~We use the ANSI C declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare variables or functions with names beginning with the prefix `MPI_`. To support the profiling interface, programs should not declare functions with names beginning with the prefix `PMPI_`.~~

==We use the==

==ISO C==

==declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare variables or functions with names beginning with the prefix `MPI_`. To support the profiling interface, programs should not declare functions with names beginning with the prefix `PMPI_`.==

~~Address arguments are of MPI defined type `MPI_Aint`. File displacements are of type `MPI_Offset`. MPI_Aint is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.~~

==Address arguments are of MPI defined type==

==`MPI_Aint`.==

==File displacements are of type `MPI_Offset`. MPI_Aint is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

Almost all C functions return an error code. The successful return code will be ~~MPI_SUCCESS,~~ ==`MPI_SUCCESS`,== but failure return codes are implementation dependent.

File displacements are of type `MPI_Offset`. ~~MPI_Aint~~ ==`MPI_Aint`== is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~ISO C~~

~~declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare variables or functions with names beginning with the prefix `MPI_`. To support the profiling interface, programs should not declare functions with names beginning with the prefix `PMPI_`.~~

==ISO C declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare names (identifiers), e.g., for variables, functions, constants, types, or macros, beginning with the prefix `MPI_`. To support the profiling interface, programs must not declare functions with names beginning with the prefix `PMPI_`.==

~~Address arguments are of MPI defined type~~

~~`MPI_Aint`.~~

~~File displacements are of type `MPI_Offset`. `MPI_Aint` is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.~~

==Address arguments are of MPI defined type `MPI_Aint`. File displacements are of type `MPI_Offset`. `MPI_Aint` is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~We use the~~

~~ISO C declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare names (identifiers), e.g., for variables, functions, constants, types, or macros, beginning with the prefix `MPI_`. To support the profiling interface, programs must not declare functions with names beginning with the prefix `PMPI_`.~~

~~The definition of named constants, function prototypes, and type definitions must be supplied in an include file <span class="sans-serif">mpi.h</span>.~~

==We use the ISO C declaration format. All MPI names have an `MPI_` prefix, defined constants are in all capital letters, and defined types and functions have one capital letter after the prefix. Programs must not declare names (identifiers), e.g., for variables, functions, constants, types, or macros, beginning with any prefix of the form `MPI_`, where any of the letters are either upper or lower case. To support the profiling interface, programs must not declare functions with names beginning with any prefix of the form `PMPI_`, where any of the letters are either upper or lower case.==

==The definition of named constants, function prototypes, and type definitions must be supplied in an include file `mpi.h`.==

~~Address arguments are of MPI defined type `MPI_Aint`. File displacements are of type `MPI_Offset`. `MPI_Aint` is defined to be an integer of the size needed to hold any valid address on the target architecture. `MPI_Offset` is defined to be an integer of the size needed to hold any valid file size on the target architecture.~~

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Choice arguments are pointers of type ~~`void *`.~~ ==`void*`.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

Almost all C functions return an error code. The successful return ~~code~~ ==value== will be `MPI_SUCCESS`, but ==error codes raised after a== failure ~~return codes~~ are implementation dependent.

Logical flags are integers with value 0 meaning “false” and a ~~non-zero~~ ==nonzero== value meaning “true.”

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#C Binding Issues]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#C Binding Issues]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#C Binding Issues]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#C Binding Issues]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#C Binding Issues]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#C Binding Issues]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#C Binding Issues]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#C Binding Issues]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#C Binding Issues]]

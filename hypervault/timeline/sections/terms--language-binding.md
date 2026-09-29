---
title: "Language Binding"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Language Binding

Chapter **terms** · in [[versions/v13/sections/terms#Language Binding|MPI-1.3]], [[versions/v20/sections/terms#Language Binding|MPI-2.0]], [[versions/v21/sections/terms#Language Binding|MPI-2.1]], [[versions/v22/sections/terms#Language Binding|MPI-2.2]], [[versions/v30/sections/terms#Language Binding|MPI-3.0]], [[versions/v31/sections/terms#Language Binding|MPI-3.1]], [[versions/v40/sections/terms#Language Binding|MPI-4.0]], [[versions/v41/sections/terms#Language Binding|MPI-4.1]], [[versions/v50/sections/terms#Language Binding|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~This section defines the rules for MPI language binding in general and for Fortran 77 and ANSI C in particular. Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.~~

~~It is expected that any Fortran 90 and C++ implementations use the Fortran 77 and ANSI C bindings, respectively. Although we consider it premature to define other bindings to Fortran 90 and C++, the current bindings are designed to encourage, rather than discourage, experimentation with better bindings that might be adopted later.~~

~~Since the word PARAMETER is a keyword in the Fortran language, we use the word “argument” to denote the arguments to a subroutine. These are normally referred to as parameters in C, however, we expect that C programmers will understand the word “argument” (which has no specific meaning in C), thus allowing us to avoid unnecessary confusion for Fortran programmers.~~

~~There are several important language binding issues not addressed by this standard. This standard does not discuss the interoperability of message passing between languages. It is fully expected that many implementations will have such features, and that such features are a sign of the quality of the implementation.~~

==This section defines the rules for MPI language binding in general and for Fortran,==

==ISO C,==

==and C++, in particular.==

==(Note that ANSI C has been replaced by ISO C.)==

==Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.==

==MPI bindings are for Fortran 90, though they are designed to be usable in Fortran 77 environments.==

==Since the word `PARAMETER` is a keyword in the Fortran language, we use the word “argument” to denote the arguments to a subroutine. These are normally referred to as parameters in C and C++, however, we expect that C and C++ programmers will understand the word “argument” (which has no specific meaning in C/C++), thus allowing us to avoid unnecessary confusion for Fortran programmers.==

==Since Fortran is case insensitive, linkers may use either lower case or upper case when resolving Fortran names. Users of case sensitive languages should avoid the “mpi\_” and “pmpi\_” prefixes.==

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~This section defines the rules for MPI language binding in general and for Fortran, ANSI C, and C++, in particular. (Note that ANSI C has been replaced by ISO C. References in MPI to ANSI C now mean ISO C.) Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.~~

==This section defines the rules for MPI language binding in general and for Fortran,==

==ISO C,==

==and C++, in particular.==

==(Note that ANSI C has been replaced by ISO C.)==

==Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

==The C++ language bindings have been deprecated.== Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~ISO C,~~

~~and C++, in particular.~~

==and ISO C, in particular.==

~~The C++ language bindings have been deprecated. Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.~~

~~MPI bindings are for Fortran 90, though they are designed to be usable in Fortran 77 environments.~~

~~Since the word `PARAMETER` is a keyword in the Fortran language, we use the word “argument” to denote the arguments to a subroutine. These are normally referred to as parameters in C and C++, however, we expect that C and C++ programmers will understand the word “argument” (which has no specific meaning in C/C++), thus allowing us to avoid unnecessary confusion for Fortran programmers.~~

==Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.==

==MPI bindings are for Fortran 90 or later, though they were originally designed to be usable in Fortran 77 environments.==

==With the `mpi_f08` module, two new Fortran features, *assumed type* and *assumed rank*, are also required, see Section [[sub-choice]] on page [[sub-choice]] .==

==Since the word `PARAMETER` is a keyword in the Fortran language, we use the word “argument” to denote the arguments to a subroutine. These are normally referred to as parameters in C, however, we expect that C programmers will understand the word “argument” (which has no specific meaning in C), thus allowing us to avoid unnecessary confusion for Fortran programmers.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~This section defines the rules for MPI language binding in general and for Fortran,~~

~~and ISO C, in particular.~~

~~(Note that ANSI C has been replaced by ISO C.)~~

~~Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.~~

~~MPI bindings are for Fortran 90 or later, though they were originally designed to be usable in Fortran 77 environments.~~

~~With the `mpi_f08` module, two new Fortran features, *assumed type* and *assumed rank*, are also required, see Section [[sub-choice]] on page [[sub-choice]] .~~

==This section defines the rules for MPI language binding in general and for Fortran, and ISO C, in particular. (Note that ANSI C has been replaced by ISO C.) Defined here are various object representations, as well as the naming conventions used for expressing this standard. The actual calling sequences are defined elsewhere.==

==MPI bindings are for Fortran 90 or later, though they were originally designed to be usable in Fortran 77 environments. With the `mpi_f08` module, two new Fortran features, *assumed type* and *assumed rank*, are also required, see [[sub-choice]] .==

Since Fortran is case insensitive, linkers may use either lower case or upper case when resolving Fortran names. Users of case sensitive languages should avoid ==any prefix of== the ~~“mpi\_”~~ ==form “`MPI_`”== and ~~“pmpi\_” prefixes.~~ ==“`PMPI_`”, where any of the letters are either upper or lower case.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

MPI bindings are for Fortran 90 or later, though they were originally designed to be usable in Fortran 77 environments. With the `mpi_f08` module, two new Fortran features, *assumed type* ==(i.e., `TYPE(*)`)== and *assumed ~~rank*,~~ ==rank* (i.e., `DIMENSION(..)`),== are also required, see [[sub-choice]] .

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Language Binding]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Language Binding]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Language Binding]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Language Binding]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Language Binding]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Language Binding]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Language Binding]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Language Binding]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Language Binding]]

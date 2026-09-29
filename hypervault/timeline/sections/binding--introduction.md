---
title: "Introduction"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Introduction

Chapter **binding** · in [[versions/v21/sections/binding#Introduction|MPI-2.1]], [[versions/v22/sections/binding#Introduction|MPI-2.2]], [[versions/v30/sections/binding#Introduction|MPI-3.0]], [[versions/v31/sections/binding#Introduction|MPI-3.1]], [[versions/v40/sections/binding#Introduction|MPI-4.0]], [[versions/v41/sections/binding#Introduction|MPI-4.1]], [[versions/v50/sections/binding#Introduction|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~It is not uncommon for library developers to use one language to develop an applications library that may be called by an application program~~

~~written in a different language. MPI currently supports ISO (previously ANSI) C, C++, and Fortran bindings. It should~~

~~be possible for applications in any of the supported languages to call MPI-related functions in another language.~~

~~Moreover, MPI allows the development of client-server code, with MPI communication used between a parallel client and a parallel server. It should be possible to code the server in one language and the clients in another language.~~

~~To do so, communications should be possible between applications written in different languages.~~

==It is not uncommon for library developers to use one language to develop an application library that may be called by an application program written in a different language. MPI currently supports ISO (previously ANSI) C and Fortran bindings. It should be possible for applications in any of the supported languages to call MPI-related functions in another language.==

==Moreover, MPI allows the development of client-server code, with MPI communication used between a parallel client and a parallel server. It should be possible to code the server in one language and the clients in another language. To do so, communications should be possible between applications written in different languages.==

It is highly desirable that the solution for interlanguage interoperability be ~~extendable~~ ==extensible== to new languages, should MPI bindings be defined for such languages.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~Initialization~~ ==Initialization:== We need to specify how the MPI environment is initialized for all languages.

Interlanguage passing of MPI opaque ~~objects~~ ==objects:== We need to specify how MPI object handles are passed between languages. We also need to specify what happens when an MPI object is accessed in one language, to retrieve information (e.g., attributes) set in another language.

Interlanguage ~~communication~~ ==communication:== We need to specify how messages sent in one language can be received in another language.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Introduction]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Introduction]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Introduction]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Introduction]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Introduction]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Introduction]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Introduction]]

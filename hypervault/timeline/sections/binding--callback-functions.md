---
title: "Callback Functions"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Callback Functions

Chapter **binding** · in [[versions/v21/sections/binding#Callback Functions|MPI-2.1]], [[versions/v22/sections/binding#Callback Functions|MPI-2.2]], [[versions/v30/sections/binding#Callback Functions|MPI-3.0]], [[versions/v31/sections/binding#Callback Functions|MPI-3.1]], [[versions/v40/sections/binding#Callback Functions|MPI-4.0]], [[versions/v41/sections/binding#Callback Functions|MPI-4.1]], [[versions/v50/sections/binding#Callback Functions|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~associated~~

~~with operation objects, etc. In a multilanguage environment, a function passed in an MPI call in one language may be invoked by an MPI call in another language. MPI implementations must make sure that such invocation will use the calling convention of the language the function is bound to.~~

==associated with operation objects, etc. In a multilanguage environment, a function passed in an MPI call in one language may be invoked by an MPI call in another language. MPI implementations must make sure that such invocation will use the calling convention of the language the function is bound to.==

~~> Callback functions need to have a language tag. This tag is set when the callback function is passed in by the library function (which is presumably different for each language), and is used to generate the right calling sequence when the callback function is invoked.~~

==> Callback functions need to have a language tag. This tag is set when the callback function is passed in by the library function (which is presumably different for each language and language support method), and is used to generate the right calling sequence when the callback function is invoked.==

==> [!note] Advice to users==

==> If a subroutine written in one language or Fortran support method wants to pass a callback routine including the predefined Fortran functions (e.g., > > [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ) to another application routine written in another language or Fortran support method, then it must be guaranteed that both routines use the callback interface definition that is defined for the argument when passing the callback to an MPI routine (e.g., [[versions/v30/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] ); see also the advice to users on page [[advice-context-predefined-Fortran-users]] .==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~MPI calls may associate callback functions with MPI objects: error handlers are associated with communicators and files, attribute copy and delete functions are associated with attribute keys, reduce operations are~~

~~associated with operation objects, etc. In a multilanguage environment, a function passed in an MPI call in one language may be invoked by an MPI call in another language. MPI implementations must make sure that such invocation will use the calling convention of the language the function is bound to.~~

==MPI calls may associate callback functions with MPI objects: error handlers are associated with communicators, files, windows, and sessions; attribute copy and delete functions are associated with attribute keys; reduce operations are associated with operation objects, etc. In a multilanguage environment, a function passed in an MPI call in one language may be invoked by an MPI call in another language. MPI implementations must make sure that such invocation will use the calling convention of the language the function is bound to.==

> If a subroutine written in one language or Fortran support method wants to pass a callback routine including the predefined Fortran functions (e.g., ~~> >~~ [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] ) to another application routine written in another language or Fortran support method, then it must be guaranteed that both routines use the callback interface definition that is defined for the argument when passing the callback to an MPI routine (e.g., [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] ); see also the advice to users on page [[advice-context-predefined-Fortran-users]] .

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Callback Functions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Callback Functions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Callback Functions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Callback Functions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Callback Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Callback Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Callback Functions]]

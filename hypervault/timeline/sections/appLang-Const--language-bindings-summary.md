---
title: "Language Bindings Summary"
chapter: appLang-Const
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/appLang-Const]
---

# Language Bindings Summary

Chapter **appLang-Const** · in [[versions/v21/sections/appLang-Const#Language Bindings Summary|MPI-2.1]], [[versions/v22/sections/appLang-Const#Language Bindings Summary|MPI-2.2]], [[versions/v30/sections/appLang-Const#Language Bindings Summary|MPI-3.0]], [[versions/v31/sections/appLang-Const#Language Bindings Summary|MPI-3.1]], [[versions/v40/sections/appLang-Const#Language Bindings Summary|MPI-4.0]], [[versions/v41/sections/appLang-Const#Language Bindings Summary|MPI-4.1]], [[versions/v50/sections/appLang-Const#Language Bindings Summary|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~In this section we summarize the specific bindings for~~

~~C, Fortran, and C++. First we present the constants, type definitions, info values and keys. Then we present the routine prototypes separately for each binding.~~

~~Listings are alphabetical within chapter.~~

==In this section we summarize the specific bindings for C and Fortran. First we present the constants, type definitions, info values and keys. Then we present the routine prototypes separately for each binding. Listings are alphabetical within chapter.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

==All ABI values must be cast to the appropriate type if the type of the constant is not a C `int` or Fortran `INTEGER`. For example, when `MPI_COMM_WORLD` is said to be 257, the implementation will use `((MPI_Comm)257)` in C.==

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/appLang-Const#Language Bindings Summary]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/appLang-Const#Language Bindings Summary]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/appLang-Const#Language Bindings Summary]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/appLang-Const#Language Bindings Summary]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/appLang-Const#Language Bindings Summary]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/appLang-Const#Language Bindings Summary]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/appLang-Const#Language Bindings Summary]]

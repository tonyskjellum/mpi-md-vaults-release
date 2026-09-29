---
title: "C and C++"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# C and C++

Chapter **binding** · in [[versions/v21/sections/binding#C and C++|MPI-2.1]], [[versions/v22/sections/binding#C and C++|MPI-2.2]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

It is important to note that all C++ objects ~~and their~~ ==with== corresponding C handles can be used interchangeably by an application. For example, an application can cache an attribute on `MPI_­COMM_­WORLD` and later retrieve it from `MPI::­COMM_­WORLD`.

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#C and C++]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#C and C++]]

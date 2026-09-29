---
title: "Reduce Operations"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Reduce Operations

Chapter **binding** · in [[versions/v21/sections/binding#Reduce Operations|MPI-2.1]], [[versions/v22/sections/binding#Reduce Operations|MPI-2.2]], [[versions/v30/sections/binding#Reduce Operations|MPI-3.0]], [[versions/v31/sections/binding#Reduce Operations|MPI-3.1]], [[versions/v40/sections/binding#Reduce Operations|MPI-4.0]], [[versions/v41/sections/binding#Reduce Operations|MPI-4.1]], [[versions/v50/sections/binding#Reduce Operations|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

==All predefined named and unnamed datatypes as listed in Section [[coll-predefined-op]] on page [[coll-predefined-op]] can be used in the listed predefined operations independent of the programming language from which the MPI routine is called.==

> Reduce operations receive as one of their arguments the datatype of the operands. ~~> >~~ Thus, one can define “polymorphic” reduce operations that work for ~~C, C++,~~ ==C== and Fortran datatypes.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

All predefined named and unnamed datatypes as listed in ~~Section [[coll-predefined-op]] on page~~ [[coll-predefined-op]] can be used in the listed predefined operations independent of the programming language from which the MPI routine is called.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Reduce Operations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Reduce Operations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Reduce Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Reduce Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Reduce Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Reduce Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Reduce Operations]]

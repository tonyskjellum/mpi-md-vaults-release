---
title: "Addresses"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Addresses

Chapter **binding** · in [[versions/v21/sections/binding#Addresses|MPI-2.1]], [[versions/v22/sections/binding#Addresses|MPI-2.2]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

The constant ~~MPI_ADDRESS_KIND~~ ==`MPI_ADDRESS_KIND`== is defined so that, in Fortran 90,

is an address sized integer type (typically, but not necessarily, the size of an `INTEGER(KIND=MPI_ADDRESS_KIND)` is 4 on 32 bit address machines and 8 on 64 bit address machines). Similarly, the constant ~~MPI_INTEGER_KIND~~ ==`MPI_INTEGER_KIND`== is defined so that

~~MPI_Aint~~ ==`MPI_Aint`==

and ~~MPI::Aint~~ ==`MPI::Aint`==

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Addresses]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Addresses]]

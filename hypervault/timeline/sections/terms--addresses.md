---
title: "Addresses"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0"]
tags: [mpi/section, mpi/terms]
---

# Addresses

Chapter **terms** · in [[versions/v13/sections/terms#Addresses|MPI-1.3]], [[versions/v20/sections/terms#Addresses|MPI-2.0]], [[versions/v21/sections/terms#Addresses|MPI-2.1]], [[versions/v22/sections/terms#Addresses|MPI-2.2]], [[versions/v30/sections/terms#Addresses|MPI-3.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~Some MPI procedures use *address* arguments that represent an absolute address in the calling program. The datatype of such an argument is an integer of the size needed to hold any valid address in the execution environment.~~

==Some MPI procedures use *address* arguments that represent an absolute address in the calling program. The datatype of such an argument==

==is `MPI_Aint` in C, `MPI::Aint` in C++ and `INTEGER (KIND=MPI_ADDRESS_KIND)` in Fortran. There is the MPI constant MPI_BOTTOM to indicate==

==the start of the address range.==

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~Some MPI procedures use *address* arguments that represent an absolute address in the calling program. The datatype of such an argument is `MPI_Aint` in C, `MPI::Aint` in C++ and `INTEGER (KIND=MPI_ADDRESS_KIND)` in Fortran. There is the MPI constant MPI_BOTTOM to indicate~~

==Some MPI procedures use *address* arguments that represent an absolute address in the calling program. The datatype of such an argument==

==is `MPI_Aint` in C, `MPI::Aint` in C++ and `INTEGER (KIND=MPI_ADDRESS_KIND)` in Fortran. There is the MPI constant MPI_BOTTOM to indicate==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

is `MPI_Aint` in C, `MPI::Aint` in C++ and `INTEGER ~~(KIND=MPI_ADDRESS_KIND)`~~ ==(KIND=``MPI_ADDRESS_KIND``)`== in Fortran. ==These types must have the same width and encode address values in the same manner such that address values in one language may be passed directly to another language without conversion.== There is the MPI constant ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== to indicate

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~is `MPI_Aint` in C, `MPI::Aint` in C++ and `INTEGER (KIND=``MPI_ADDRESS_KIND``)` in Fortran. These types must have the same width and encode address values in the same manner such that address values in one language may be passed directly to another language without conversion. There is the MPI constant `MPI_BOTTOM` to indicate~~

~~the start of the address range.~~

==is `MPI_Aint` in C and `INTEGER (KIND=``MPI_ADDRESS_KIND``)` in Fortran. These types must have the same width and encode address values in the same manner such that address values in one language may be passed directly to another language without conversion. There is the MPI constant `MPI_BOTTOM` to indicate the start of the address range.==

### MPI-3.0 → MPI-3.1

_Section absent from MPI-3.1._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Addresses]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Addresses]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Addresses]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Addresses]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Addresses]]

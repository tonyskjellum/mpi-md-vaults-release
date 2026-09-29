---
title: "`MPI_Offset` Type"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# `MPI_Offset` Type

Chapter **io** · in [[versions/v20/sections/io#`MPI_Offset` Type|MPI-2.0]], [[versions/v21/sections/io#`MPI_Offset` Type|MPI-2.1]], [[versions/v22/sections/io#`MPI_Offset` Type|MPI-2.2]], [[versions/v30/sections/io#`MPI_Offset` Type|MPI-3.0]], [[versions/v31/sections/io#`MPI_Offset` Type|MPI-3.1]], [[versions/v40/sections/io#`MPI_Offset` Type|MPI-4.0]], [[versions/v41/sections/io#`MPI_Offset` Type|MPI-4.1]], [[versions/v50/sections/io#`MPI_Offset` Type|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~In Fortran 77 environments that do not support KIND parameters, `MPI_Offset` arguments should be declared as an `INTEGER` of suitable size. The language interoperability implications for `MPI_Offset` are similar to those for addresses (see Section [[versions/v21/sections/misc#Language Interoperability|Language Interoperability]] , page [[versions/v21/sections/misc#Language Interoperability|Language Interoperability]] ).~~

==In Fortran 77 environments that do not support KIND parameters,==

==`MPI_Offset`==

==arguments should be declared as an `INTEGER` of suitable size. The language interoperability implications for `MPI_Offset` are similar to those for addresses (see Section [[versions/v21/sections/binding#Language Interoperability|Language Interoperability]] , page [[versions/v21/sections/binding#Language Interoperability|Language Interoperability]] ).==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

In Fortran, the corresponding integer is an integer of kind ~~MPI_OFFSET_KIND,~~ ==`MPI_OFFSET_KIND`,== defined in mpif.h and the mpi module.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~In Fortran, the corresponding integer is an integer of kind `MPI_OFFSET_KIND`, defined in mpif.h and the mpi module.~~

~~In Fortran 77 environments that do not support KIND parameters,~~

~~`MPI_Offset`~~

~~arguments should be declared as an `INTEGER` of suitable size. The language interoperability implications for `MPI_Offset` are similar to those for addresses (see Section [[versions/v30/sections/binding#Language Interoperability|Language Interoperability]] , page [[versions/v30/sections/binding#Language Interoperability|Language Interoperability]] ).~~

==In Fortran, the corresponding integer is an integer with kind parameter `MPI_OFFSET_KIND`, which is defined in the `mpi_f08` module, the `mpi` module and the `mpif.h` include file.==

==In Fortran 77 environments that do not support `KIND` parameters,==

==`MPI_Offset` arguments should be declared as an `INTEGER` of suitable size. The language interoperability implications for `MPI_Offset` are similar to those for addresses (see Section [[versions/v30/sections/binding#Language Interoperability|Language Interoperability]] , page [[versions/v30/sections/binding#Language Interoperability|Language Interoperability]] ).==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~In Fortran 77 environments that do not support `KIND` parameters,~~

~~`MPI_Offset` arguments should be declared as an `INTEGER` of suitable size. The language interoperability implications for `MPI_Offset` are similar to those for addresses (see Section [[versions/v31/sections/binding#Language Interoperability|Language Interoperability]] , page [[versions/v31/sections/binding#Language Interoperability|Language Interoperability]] ).~~

==In Fortran 77 environments that do not support `KIND` parameters, `MPI_Offset` arguments should be declared as an `INTEGER` of suitable size. The language interoperability implications for `MPI_Offset` are similar to those for addresses (see [[versions/v31/sections/binding#Language Interoperability|Language Interoperability]] ).==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#`MPI_Offset` Type]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#`MPI_Offset` Type]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#`MPI_Offset` Type]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#`MPI_Offset` Type]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#`MPI_Offset` Type]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#`MPI_Offset` Type]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#`MPI_Offset` Type]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#`MPI_Offset` Type]]

---
title: "Type Constructors with Explicit Addresses"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Type Constructors with Explicit Addresses

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Type Constructors with Explicit Addresses|MPI-2.1]], [[versions/v22/sections/datatypes#Type Constructors with Explicit Addresses|MPI-2.2]], [[versions/v30/sections/datatypes#Type Constructors with Explicit Addresses|MPI-3.0]], [[versions/v31/sections/datatypes#Type Constructors with Explicit Addresses|MPI-3.1]], [[versions/v40/sections/datatypes#Type Constructors with Explicit Addresses|MPI-4.0]], [[versions/v41/sections/datatypes#Type Constructors with Explicit Addresses|MPI-4.1]], [[versions/v50/sections/datatypes#Type Constructors with Explicit Addresses|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~MPI_Aint~~ ==`MPI_Aint`== and ~~MPI::Aint~~ ==`MPI::Aint`== are used in C and C++. On Fortran 77 systems that do not support the Fortran 90 `KIND` notation, and where addresses are 64 bits whereas default `INTEGER`s are 32 bits, these arguments will be of type `INTEGER*8`.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

In Fortran, the functions [[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] , [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] ==, [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]]== , [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , and [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] accept arguments of type `INTEGER(KIND=MPI_ADDRESS_KIND)`, wherever arguments of type

`MPI_Aint` ~~and `MPI::Aint`~~ are used in ~~C and C++.~~ ==C.== On Fortran 77 systems that do not support the Fortran 90 `KIND` notation, and where addresses are 64 bits whereas default `INTEGER`s are 32 bits, these arguments will be of type `INTEGER*8`.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~`MPI_Aint` are used in C. On Fortran 77 systems that do not support the Fortran 90 `KIND` notation, and where addresses are 64 bits whereas default `INTEGER`s are 32 bits, these arguments will be of type `INTEGER*8`.~~

==`MPI_Aint` are used in C. For Fortran compilers that do not support the Fortran 90 `KIND` notation, and where addresses are 64 bits whereas default `INTEGER`s are 32 bits, these arguments will be of type `INTEGER*8` (assuming the Fortran compiler accepts the common extension of `INTEGER*8` for eight-byte integers).==

==For the large count versions of three datatype constructors with explicit addresses, [[versions/v40/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v40/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] , and [[versions/v40/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , absolute addresses shall not be used to specify byte displacements since the parameter is of type `MPI_COUNT` instead of type `MPI_AINT`.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

In Fortran, the ~~functions~~ ==procedures== [[versions/v41/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] , [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] , [[versions/v41/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , and [[versions/v41/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] accept arguments of type ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`,~~ ==`ADDRESS`,== wherever arguments of type

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Type Constructors with Explicit Addresses]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Type Constructors with Explicit Addresses]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Type Constructors with Explicit Addresses]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Type Constructors with Explicit Addresses]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Type Constructors with Explicit Addresses]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Type Constructors with Explicit Addresses]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Type Constructors with Explicit Addresses]]

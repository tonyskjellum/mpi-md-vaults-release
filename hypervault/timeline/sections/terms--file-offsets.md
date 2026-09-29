---
title: "File Offsets"
chapter: terms
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# File Offsets

Chapter **terms** · in [[versions/v20/sections/terms#File Offsets|MPI-2.0]], [[versions/v21/sections/terms#File Offsets|MPI-2.1]], [[versions/v22/sections/terms#File Offsets|MPI-2.2]], [[versions/v30/sections/terms#File Offsets|MPI-3.0]], [[versions/v31/sections/terms#File Offsets|MPI-3.1]], [[versions/v40/sections/terms#File Offsets|MPI-4.0]], [[versions/v41/sections/terms#File Offsets|MPI-4.1]], [[versions/v50/sections/terms#File Offsets|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

==These types must have the same width and encode address values in the same manner such that offset values in one language may be passed directly to another language without conversion.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~In C one uses `MPI_Offset` whereas in C++ one uses `MPI::Offset`.~~

~~These types must have the same width and encode address values in the same manner such that offset values in one language may be passed directly to another language without conversion.~~

==In C one uses `MPI_Offset`. These types must have the same width and encode address values in the same manner such that offset values in one language may be passed directly to another language without conversion.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~For I/O there is a need to give the size, displacement, and offset into a file. These quantities can easily be larger than 32 bits which can be the default size of a Fortran integer. To overcome this, these quantities are declared to be `INTEGER (KIND=MPI_OFFSET_KIND)` in Fortran.~~

~~In C one uses `MPI_Offset`. These types must have the same width and encode address values in the same manner such that offset values in one language may be passed directly to another language without conversion.~~

==For I/O there is a need to give the size, displacement, and offset into a file. These quantities can easily be larger than 32 bits which can be the default size of a Fortran integer. To overcome this, these quantities are declared to be `INTEGER(KIND=MPI_OFFSET_KIND)` in Fortran. In C one uses `MPI_Offset`. These types must have the same width and encode address values in the same manner such that offset values in one language may be passed directly to another language without conversion.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

For I/O there is a need to give the size, displacement, and offset into a file. These quantities can easily be larger than 32 ~~bits~~ ==bits,== which can be the default size of a Fortran integer. To overcome this, these quantities are declared to be `INTEGER(KIND=MPI_OFFSET_KIND)` in Fortran. In C one uses `MPI_Offset`. These types must have the same width and encode address values in the same manner such that offset values in one language may be passed directly to another language without conversion.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#File Offsets]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#File Offsets]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#File Offsets]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#File Offsets]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#File Offsets]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#File Offsets]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#File Offsets]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#File Offsets]]

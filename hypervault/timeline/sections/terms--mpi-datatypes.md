---
title: "MPI Datatypes"
chapter: terms
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# MPI Datatypes

Chapter **terms** · in [[versions/v40/sections/terms#MPI Datatypes|MPI-4.0]], [[versions/v41/sections/terms#MPI Datatypes|MPI-4.1]], [[versions/v50/sections/terms#MPI Datatypes|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~**predefined**~~ ==**predefined**:== A predefined datatype is a datatype with a predefined (constant) name (such as `MPI_INT`, `MPI_FLOAT_INT`, or `MPI_PACKED`) or a datatype constructed with [[versions/v41/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] , [[versions/v41/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] , or [[versions/v41/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] . The former are **named** whereas the latter are **unnamed**.

~~**derived**~~ ==**derived**:== A derived datatype is any datatype that is not predefined.

~~**portable**~~ ==**portable**:== A datatype is portable if it is a predefined datatype, or it is derived from a portable datatype using only the type constructors [[versions/v41/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , [[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , [[versions/v41/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] , [[versions/v41/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] , [[versions/v41/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] , [[versions/v41/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] , and [[versions/v41/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] . Such a datatype is portable because all displacements in the datatype are in terms of extents of one predefined datatype. Therefore, if such a datatype fits a data layout in one memory, it will fit the corresponding data layout in another memory, if the same declarations were used, even if the two systems have different architectures. On the other hand, if a datatype was constructed using [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] , [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] , [[versions/v41/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] or [[versions/v41/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , then the datatype contains explicit byte displacements (e.g., providing padding to meet alignment restrictions). These displacements are unlikely to be chosen correctly if they fit data layout on one memory, but are used for data layouts on another process, running on a processor with a different architecture.

~~**equivalent**~~ ==**equivalent**:== Two datatypes are equivalent if they appear to have been created with the same sequence of calls (and arguments) and thus have the same typemap. Two equivalent datatypes do not necessarily have the same cached attributes or the same names.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#MPI Datatypes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#MPI Datatypes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#MPI Datatypes]]

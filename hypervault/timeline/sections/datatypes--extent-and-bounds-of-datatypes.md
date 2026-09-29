---
title: "Extent and Bounds of Datatypes"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Extent and Bounds of Datatypes

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Extent and Bounds of Datatypes|MPI-2.1]], [[versions/v22/sections/datatypes#Extent and Bounds of Datatypes|MPI-2.2]], [[versions/v30/sections/datatypes#Extent and Bounds of Datatypes|MPI-3.0]], [[versions/v31/sections/datatypes#Extent and Bounds of Datatypes|MPI-3.1]], [[versions/v40/sections/datatypes#Extent and Bounds of Datatypes|MPI-4.0]], [[versions/v41/sections/datatypes#Extent and Bounds of Datatypes|MPI-4.1]], [[versions/v50/sections/datatypes#Extent and Bounds of Datatypes|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

The use of ~~[[MPI_TYPE_UB, MPI_TYPE_LB]]~~ ==[[versions/v22/API/MPI_TYPE_UB|MPI_TYPE_UB]] , [[versions/v22/API/MPI_TYPE_LB|MPI_TYPE_LB]]== and [[versions/v22/API/MPI_TYPE_EXTENT|MPI_TYPE_EXTENT]] is deprecated.

MPI allows one to change the extent of a datatype, using lower bound and upper bound markers ~~(MPI_LB~~ ==(`MPI_LB`== and ~~MPI_UB).~~ ==`MPI_UB`).== This is useful, as it allows to control the stride of successive datatypes that are replicated by datatype constructors, or are replicated by the `count` argument in a send or receive call. However, the current mechanism for achieving it is painful; also it is restrictive. ~~MPI_LB~~ ==`MPI_LB`== and ~~MPI_UB~~ ==`MPI_UB`== are “sticky”: once present in a datatype, they cannot be overridden (e.g., the upper bound can be moved up, by adding a new ~~MPI_UB~~ ==`MPI_UB`== marker, but cannot be moved down below an existing `MPI_UB` marker).

The use of ~~MPI_LB~~ ==`MPI_LB`== and ~~MPI_UB~~ ==`MPI_UB`== is deprecated.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~The following function~~

~~replaces~~

~~the three functions [[versions/v22/API/MPI_TYPE_UB|MPI_TYPE_UB]] , [[versions/v22/API/MPI_TYPE_LB|MPI_TYPE_LB]] and [[versions/v22/API/MPI_TYPE_EXTENT|MPI_TYPE_EXTENT]] . It also returns address sized integers, in the Fortran binding.~~

~~The use of [[versions/v22/API/MPI_TYPE_UB|MPI_TYPE_UB]] , [[versions/v22/API/MPI_TYPE_LB|MPI_TYPE_LB]] and [[versions/v22/API/MPI_TYPE_EXTENT|MPI_TYPE_EXTENT]] is deprecated.~~

==![[versions/v30/API/MPI_TYPE_GET_EXTENT_X]]==

~~MPI allows one to change the extent of a datatype, using lower bound and upper bound markers (`MPI_LB` and `MPI_UB`). This is useful, as it allows to control the stride of successive datatypes that are replicated by datatype constructors, or are replicated by the `count` argument in a send or receive call. However, the current mechanism for achieving it is painful; also it is restrictive. `MPI_LB` and `MPI_UB` are “sticky”: once present in a datatype, they cannot be overridden (e.g., the upper bound can be moved up, by adding a new `MPI_UB` marker, but cannot be moved down below an existing `MPI_UB` marker).~~

~~A new type constructor is provided to facilitate these changes.~~

~~The use of `MPI_LB` and `MPI_UB` is deprecated.~~

==For both functions, if either OUT parameter cannot express the value to be returned (e.g., if the parameter is too small to hold the output value), it is set to `MPI_UNDEFINED`.==

==MPI allows one to change the extent of a datatype, using lower bound and upper bound markers. This provides control over the stride of successive datatypes that are replicated by datatype constructors, or are replicated by the `count` argument in a send or receive call.==

~~Returns in `newtype` a handle to a new datatype that is identical to `oldtype`, except that the lower bound of this new datatype is set to be `lb`, and its upper bound is set to be `lb `$`+`$` extent`.~~

~~Any previous **lb** and **ub** markers are erased, and a new pair of lower bound and upper bound markers are put in the positions indicated by the `lb` and `extent` arguments. This affects the behavior of the datatype when used in communication operations, with `count `$`>1`$, and when used in the construction of new derived datatypes.~~

~~> [!note] Advice to users~~

~~> It is strongly recommended that users use these two new functions, rather than the old MPI-1 functions to set and access lower bound, upper bound and extent of datatypes.~~

==Returns in `newtype` a handle to a new datatype that is identical to `oldtype`, except that the lower bound of this new datatype is set to be `lb`, and its upper bound is set to be `lb `$`+`$` extent`. Any previous **lb** and **ub** markers are erased, and a new pair of lower bound and upper bound markers are put in the positions indicated by the `lb` and `extent` arguments. This affects the behavior of the datatype when used in communication operations, with `count `$`>1`$, and when used in the construction of new derived datatypes.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Returns the lower bound and the extent of `datatype`~~

~~(as defined in Section [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] ).~~

==Returns the lower bound and the extent of `datatype` (as defined in [[Equation]] soft-lb-ub-definition).==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Returns in `newtype` a handle to a new datatype that is identical to `oldtype`, except that the lower bound of this new datatype is set to be `lb`, and its upper bound is set to be ~~`lb `$`+`$` extent`.~~ ==`lb``+``extent`.== Any previous **lb** and **ub** markers are erased, and a new pair of lower bound and upper bound markers are put in the positions indicated by the `lb` and `extent` arguments. This affects the behavior of the datatype when used in communication operations, with ~~`count `$`>1`$,~~ ==`count` $`>1`$,== and when used in the construction of new derived datatypes.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~![[versions/v41/API/MPI_TYPE_GET_EXTENT_X]]~~

~~For both functions, if~~ ==If== either OUT parameter cannot express the value to be returned (e.g., if the parameter is too small to hold the output value), it is set to `MPI_UNDEFINED`.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Extent and Bounds of Datatypes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Extent and Bounds of Datatypes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Extent and Bounds of Datatypes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Extent and Bounds of Datatypes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Extent and Bounds of Datatypes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Extent and Bounds of Datatypes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Extent and Bounds of Datatypes]]

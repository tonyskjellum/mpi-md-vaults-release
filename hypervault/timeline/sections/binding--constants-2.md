---
title: "Constants"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Constants

Chapter **binding** · in [[versions/v21/sections/binding#Constants|MPI-2.1]], [[versions/v22/sections/binding#Constants|MPI-2.2]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

This does not apply to constant handles ~~(MPI_INT, MPI_COMM_WORLD, MPI_ERRORS_RETURN, MPI_SUM,~~ ==(`MPI_INT`, `MPI_COMM_WORLD`, `MPI_ERRORS_RETURN`, `MPI_SUM`,== etc.) These handles need to be converted, as explained in Section [[versions/v22/sections/binding#Transfer of Handles|Transfer of Handles]] .

Also constant “addresses,” i.e., special values for reference arguments that are not handles, such as ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== or ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== may have different values in different languages.

> The current MPI standard specifies that `MPI_BOTTOM` can be used in initialization expressions in C, but not in Fortran. Since Fortran does not normally support call by value, then ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== must be in Fortran the name of a predefined > > static variable, e.g., a variable in an MPI declared `COMMON` > > block. On the other hand, in C, it is natural to take > > ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== = 0 (Caveat: Defining ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== = 0 > > implies that `NULL` pointer cannot be distinguished from > > ~~MPI_BOTTOM;~~ ==`MPI_BOTTOM`;== it may be that ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== = 1 is better ...) > > Requiring that the Fortran and C values be the same will complicate the initialization process.

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Constants]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Constants]]

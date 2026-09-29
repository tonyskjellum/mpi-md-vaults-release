---
title: "Problems Due to Data Copying and Sequence Association with Vector Subscripts"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Problems Due to Data Copying and Sequence Association with Vector Subscripts

Chapter **binding** · in [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|MPI-3.0]], [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|MPI-3.1]], [[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|MPI-4.0]], [[versions/v41/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|MPI-4.1]], [[versions/v50/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Arrays~~ ==Fortran arrays== with a vector subscript must not be used as actual choice buffer arguments in any nonblocking or split collective MPI operations. They may, however, be used in blocking MPI operations.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

REAL a(100) CALL ~~MPI_Send( A((/7,9,23,81,82/)),~~ ==MPI_Send(A((/7,9,23,81,82/)),== 5, MPI_REAL, ...)

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~       REAL a(100)        CALL MPI_Send(A((/7,9,23,81,82/)), 5, MPI_REAL, ...)~~

==Fortran irregular subarrays through using vector subscripts.==

==(code block added)==
``` [MPI]Fortran
REAL a(100)
CALL MPI_Send(A((/7,9,23,81,82/)), 5, MPI_REAL, ...)
```

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts]]

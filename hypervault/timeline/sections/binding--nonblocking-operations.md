---
title: "Nonblocking Operations"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Nonblocking Operations

Chapter **binding** · in [[versions/v30/sections/binding#Nonblocking Operations|MPI-3.0]], [[versions/v31/sections/binding#Nonblocking Operations|MPI-3.1]], [[versions/v40/sections/binding#Nonblocking Operations|MPI-4.0]], [[versions/v41/sections/binding#Nonblocking Operations|MPI-4.1]], [[versions/v50/sections/binding#Nonblocking Operations|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

Fortran 90 register ~~optimization — extreme.\~~ ==optimization—extreme.\== Source compiled as or compiled as

This register optimization/code movement problem for nonblocking operations does not occur with MPI parallel file I/O split collective operations, because in the ~~[[..._BEGIN]]~~ ==`MPI_XXX_BEGIN`== and ~~[[..._END]]~~ ==`MPI_XXX_END`== calls, the same buffer has to be provided as an actual argument. The register optimization / code movement problem for `MPI_BOTTOM` and derived MPI datatypes may occur in each blocking and nonblocking communication call, as well as in each parallel file I/O operation.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

If a variable is local to a Fortran subroutine (i.e., not in a module or a `COMMON` block), the compiler will assume that it cannot be modified by a called subroutine unless it is an actual argument of the call. In the most common linkage convention, the subroutine is expected to save and restore certain registers. Thus, the optimizer will assume that a register ~~which~~ ==that== held a valid copy of such a variable before the call will still hold a valid copy on return.

Fortran 90 register ~~optimization—extreme.\ Source compiled as or compiled as~~ ==optimization—extreme.==

==\textbf{Source} \textbf{compiled as} \textbf{or compiled as}== REAL :: buf, b1 REAL :: buf, b1 REAL :: buf, b1 call MPI_IRECV(buf,..req) call MPI_IRECV(buf,..req) call MPI_IRECV(buf,..req) register = buf b1 = buf call MPI_WAIT(req,..) call MPI_WAIT(req,..) call MPI_WAIT(req,..) b1 = buf b1 = register

Similar example with ~~[[versions/v41/API/MPI_ISEND|MPI_ISEND]]\ Source compiled as with a possible MPI-internal\ execution sequence~~ ==[[versions/v41/API/MPI_ISEND|MPI_ISEND]]==

==\textbf{Source} \textbf{compiled as} \textbf{with a possible MPI}-\textbf{internal} \textbf{execution sequence}== REAL :: buf, copy REAL :: buf, copy REAL :: buf, copy buf = val buf = val buf = val call MPI_ISEND(buf,..req) call MPI_ISEND(buf,..req) addr = &buf copy = buf copy= buf copy = buf buf = val_overwrite buf = val_overwrite call MPI_WAIT(req,..) call MPI_WAIT(req,..) call send(*addr) ! within ! MPI_WAIT buf = val_overwrite

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Nonblocking Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Nonblocking Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Nonblocking Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Nonblocking Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Nonblocking Operations]]

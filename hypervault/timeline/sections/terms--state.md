---
title: "State"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# State

Chapter **terms** · in [[versions/v13/sections/terms#State|MPI-1.3]], [[versions/v20/sections/terms#State|MPI-2.0]], [[versions/v21/sections/terms#State|MPI-2.1]], [[versions/v22/sections/terms#State|MPI-2.2]], [[versions/v30/sections/terms#State|MPI-3.0]], [[versions/v31/sections/terms#State|MPI-3.1]], [[versions/v40/sections/terms#State|MPI-4.0]], [[versions/v41/sections/terms#State|MPI-4.1]], [[versions/v50/sections/terms#State|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~MPI procedures use at various places arguments with *state* types. The values of such data type are all identified by names, and no operation is defined on them. For example, the `MPI_ERRHANDLER_SET` routine has a state type argument with values MPI_ERRORS_ARE_FATAL, MPI_ERRORS_RETURN, etc.~~

==MPI procedures use at various places arguments with *state* types. The values of such a data type are all identified by names, and no operation is defined on them.==

==For example, the `MPI_TYPE_CREATE_SUBARRAY` routine has a state argument `order` with values MPI_ORDER_C and MPI_ORDER_FORTRAN.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

For example, the `MPI_TYPE_CREATE_SUBARRAY` routine has a state argument `order` with values ~~MPI_ORDER_C~~ ==`MPI_ORDER_C`== and ~~MPI_ORDER_FORTRAN.~~ ==`MPI_ORDER_FORTRAN`.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~MPI procedures use at various places arguments with *state* types. The values of such a data type are all identified by names, and no operation is defined on them.~~

~~For example, the `MPI_TYPE_CREATE_SUBARRAY` routine has a state argument `order` with values `MPI_ORDER_C` and `MPI_ORDER_FORTRAN`.~~

==MPI procedures use at various places arguments with *state* types. The values of such a data type are all identified by names, and no operation is defined on them. For example, the `MPI_TYPE_CREATE_SUBARRAY` routine has a state argument `order` with values `MPI_ORDER_C` and `MPI_ORDER_FORTRAN`.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

MPI procedures use at various places arguments with *state* types. The values of such a data type are all identified by names, and no operation is defined on them. For example, the ~~`MPI_TYPE_CREATE_SUBARRAY`~~ ==[[versions/v31/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]]== routine has a state argument `order` with values `MPI_ORDER_C` and `MPI_ORDER_FORTRAN`.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

MPI procedures use at various places arguments with *state* types. The values of such a ~~data type~~ ==datatype== are all identified by names, and no operation is defined on them. For example, the [[versions/v40/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]] routine has a state argument `order` with values `MPI_ORDER_C` and `MPI_ORDER_FORTRAN`.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#State]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#State]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#State]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#State]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#State]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#State]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#State]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#State]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#State]]

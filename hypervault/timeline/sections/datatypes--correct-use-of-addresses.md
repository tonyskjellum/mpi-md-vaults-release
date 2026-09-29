---
title: "Correct Use of Addresses"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Correct Use of Addresses

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Correct Use of Addresses|MPI-2.1]], [[versions/v22/sections/datatypes#Correct Use of Addresses|MPI-2.2]], [[versions/v30/sections/datatypes#Correct Use of Addresses|MPI-3.0]], [[versions/v31/sections/datatypes#Correct Use of Addresses|MPI-3.1]], [[versions/v40/sections/datatypes#Correct Use of Addresses|MPI-4.0]], [[versions/v41/sections/datatypes#Correct Use of Addresses|MPI-4.1]], [[versions/v50/sections/datatypes#Correct Use of Addresses|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

Successively declared variables in C or Fortran are not necessarily stored at contiguous locations. Thus, care must be exercised that displacements do not cross from one variable to another. Also, in machines with a segmented address space, addresses are not unique and address arithmetic has some peculiar properties. Thus, the use of **addresses**, that is, displacements relative to the start address ~~MPI_BOTTOM,~~ ==`MPI_BOTTOM`,== has to be restricted.

4. If `v` is a valid address then ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== + ~~v~~ ==`v`== is a valid address.

> There is no need to distinguish (absolute) addresses and (relative) displacements on a machine with contiguous address space: ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== is zero, and both addresses and displacements are integers. On machines where the distinction is required, addresses are recognized as expressions that involve ~~MPI_BOTTOM.~~ ==`MPI_BOTTOM`.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~    [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]]~~

~~    returns a valid address, when passed as argument a variable of the calling program.~~

==    [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] returns a valid address, when passed as argument a variable of the calling program.==

~~4.  If `v` is a valid address then `MPI_BOTTOM` + `v` is a valid address.~~

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~Variables belong to the same **sequential storage** if they belong to the same array, to the same <span class="sans-serif">COMMON</span> block in Fortran, or to the same structure in C. Valid addresses are defined recursively as follows:~~

~~1.  The function~~

~~    [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] returns a valid address, when passed as argument a variable of the calling program.~~

==Variables belong to the same **sequential storage** if they belong to the same array, to the same `COMMON` block in Fortran, or to the same structure in C. Valid addresses are defined recursively as follows:==

==1.  The function [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] returns a valid address, when passed as argument a variable of the calling program.==

A correct program uses only valid addresses to identify the locations of entries in communication buffers. Furthermore, if `u` and `v` are two valid addresses, then the (integer) difference `u - v` can be computed only if both `u` and ~~<span class="sans-serif">v</span>~~ ==`v`== are in the same sequential storage. No other arithmetic operations can be meaningfully executed on addresses.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

A correct program uses only valid addresses to identify the locations of entries in communication buffers. Furthermore, if `u` and `v` are two valid addresses, then the (integer) difference ~~`u - v`~~ ==$`\texttt{u}-\texttt{v}`$== can be computed only if both `u` and `v` are in the same sequential storage. No other arithmetic operations can be meaningfully ~~executed~~ ==Aexecuted== on addresses.

The rules above impose no constraints on the use of derived datatypes, as long as they are used to define a communication buffer that is wholly contained within the same sequential storage. However, the construction of a communication buffer that contains variables that are not within the same sequential storage must obey certain restrictions. Basically, a communication buffer with variables that are not within the same sequential storage can be used only by specifying in the communication call ~~`buf = MPI_BOTTOM`, `count =~~ ==`buf``=` `MPI_BOTTOM`, `count``=== 1`, and using a `datatype` argument where all displacements are valid (absolute) addresses.

> It is not expected that MPI implementations will be able to detect erroneous, “out of bound” ~~displacements — unless~~ ==displacements—unless== those overflow the user address ~~space — since~~ ==space—since== the MPI call may not know the extent of the arrays and records in the host program.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

1. The ~~function~~ ==procedure== [[versions/v41/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] returns a valid address, when passed as argument a variable of the calling program.

2. The `buf` argument of a communication ~~function~~ ==procedure== evaluates to a valid address, when passed as argument a variable of the calling program.

A correct program uses only valid addresses to identify the locations of entries in communication buffers. Furthermore, if `u` and `v` are two valid addresses, then the (integer) difference $`\texttt{u}-\texttt{v}`$ can be computed only if both `u` and `v` are in the same sequential storage. No other arithmetic operations can be meaningfully ~~Aexecuted~~ ==executed== on addresses.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Correct Use of Addresses]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Correct Use of Addresses]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Correct Use of Addresses]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Correct Use of Addresses]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Correct Use of Addresses]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Correct Use of Addresses]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Correct Use of Addresses]]

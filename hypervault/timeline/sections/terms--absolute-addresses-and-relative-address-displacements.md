---
title: "Absolute Addresses and Relative Address Displacements"
chapter: terms
present_in: ["MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Absolute Addresses and Relative Address Displacements

Chapter **terms** · in [[versions/v31/sections/terms#Absolute Addresses and Relative Address Displacements|MPI-3.1]], [[versions/v40/sections/terms#Absolute Addresses and Relative Address Displacements|MPI-4.0]], [[versions/v41/sections/terms#Absolute Addresses and Relative Address Displacements|MPI-4.1]], [[versions/v50/sections/terms#Absolute Addresses and Relative Address Displacements|MPI-5.0]]

## Changes along the time axis

### MPI-3.0 → MPI-3.1

_Section appears in MPI-3.1._

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~Some MPI procedures use *address* arguments that represent an *absolute address* in the calling program, or *relative displacement* arguments that represent differences of two absolute addresses. The datatype of such arguments~~

~~is `MPI_Aint` in C and `INTEGER (KIND=``MPI_ADDRESS_KIND``)` in Fortran. These types must have the same width and encode address values in the same manner such that address values in one language may be passed directly to another language without conversion. There is the MPI constant `MPI_BOTTOM` to indicate the start of the address range. For retrieving absolute addresses or any calculation with absolute addresses, one should use the routines and functions provided in [[versions/v40/sections/datatypes#Address and Size Functions|Address and Size Functions]] . [[versions/v40/sections/datatypes#Correct Use of Addresses|Correct Use of Addresses]] provides additional rules for the correct use of absolute addresses. For expressions with relative displacements or other usage without absolute addresses, intrinsic operators (e.g., `+`, `-`, `*`) can be used.~~

==Some MPI procedures use *address* arguments that represent an *absolute address* in the calling program, or *relative displacement* arguments that represent differences of two absolute addresses. The datatype of such arguments is `MPI_Aint` in C and `INTEGER(KIND=``MPI_ADDRESS_KIND``)` in Fortran. These types must have the same width and encode address values in the same manner such that address values in one language may be passed directly to another language without conversion. There is the MPI constant `MPI_BOTTOM` to indicate the start of the address range. For retrieving absolute addresses or any calculation with absolute addresses, one should use the routines and functions provided in [[versions/v40/sections/datatypes#Address and Size Functions|Address and Size Functions]] . [[versions/v40/sections/datatypes#Correct Use of Addresses|Correct Use of Addresses]] provides additional rules for the correct use of absolute addresses. For expressions with relative displacements or other usage without absolute addresses, intrinsic operators (e.g., `+`, `-`, `*`) can be used.==

==> [!tip] Rationale==

==> Byte displacement values need to be large enough to encode any value used for expressing absolute or relative memory addresses. Prior to MPI-4.0, some MPI routines used `int` in C and `INTEGER` in Fortran as the type for *byte displacement* arguments. To avoid breaking backward compatibility, this version of the standard continues to support `int` in C as well as `INTEGER` in Fortran in such routines. In addition, this version of the standard supports using `MPI_Aint` in C (via separate “`_c`” suffixed procedures) as well as `INTEGER(KIND=MPI_ADDRESS_KIND)` in Fortran (via polymorphic interfaces in newer MPI Fortran bindings (`USE mpi_f08`)) in such routines. See Section [[versions/v40/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|Support for Large Count and Large Byte Displacement in MPI Language Bindings]] for a full explanation.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

Some MPI procedures use *address* arguments that represent an *absolute address* in the calling program, or *relative displacement* arguments that represent differences of two absolute addresses. The datatype of such arguments is `MPI_Aint` in C and ~~`INTEGER(KIND=``MPI_ADDRESS_KIND``)`~~ ==`INTEGER(KIND=MPI_ADDRESS_KIND)`== in Fortran. These types must have the same width and encode address values in the same manner such that address values in one language may be passed directly to another language without conversion. There is the MPI constant `MPI_BOTTOM` to indicate the start of the address range. For retrieving absolute addresses or any calculation with absolute addresses, one should use the routines and functions provided in [[versions/v41/sections/datatypes#Address and Size ~~Functions|Address~~ ==Procedures|Address== and Size ~~Functions]]~~ ==Procedures]]== . [[versions/v41/sections/datatypes#Correct Use of Addresses|Correct Use of Addresses]] provides additional rules for the correct use of absolute addresses. For expressions with relative displacements or other usage without absolute addresses, intrinsic operators (e.g., `+`, `-`, `*`) can be used.

> Byte displacement values need to be large enough to encode any value used for expressing absolute or relative memory addresses. Prior to MPI-4.0, some MPI routines used `int` in C and `INTEGER` in Fortran as the type for *byte displacement* arguments. To avoid breaking backward compatibility, this version of the standard continues to support `int` in C as well as `INTEGER` in Fortran in such routines. In addition, this version of the standard supports using `MPI_Aint` in C (via separate “`_c`” suffixed procedures) as well as ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`~~ ==`ADDRESS`== in Fortran (via polymorphic interfaces in newer MPI Fortran bindings (`USE mpi_f08`)) in such routines. See Section [[versions/v41/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|Support for Large Count and Large Byte Displacement in MPI Language Bindings]] for a full explanation.

## Text by release

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Absolute Addresses and Relative Address Displacements]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Absolute Addresses and Relative Address Displacements]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Absolute Addresses and Relative Address Displacements]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Absolute Addresses and Relative Address Displacements]]

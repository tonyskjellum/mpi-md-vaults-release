---
title: "Support for Large Count and Large Byte Displacement in MPI Language Bindings"
chapter: binding
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Support for Large Count and Large Byte Displacement in MPI Language Bindings

Chapter **binding** · in [[versions/v40/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|MPI-4.0]], [[versions/v41/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|MPI-4.1]], [[versions/v50/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

- The C `MPI_Aint` type and the Fortran ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`~~ ==`ADDRESS`== type were used for some parameters that represent *byte displacement* in files (e.g., in constructors of MPI datatypes that can be used with files).

In Fortran, when using `USE mpi_f08`, for each MPI procedure that had at least one *count* or *byte displacement* parameter that used the `INTEGER` or ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`~~ ==`ADDRESS`== types prior to MPI-4.0, a polymorphic interface containing two specific procedures is provided. One of the specific procedures has the same name and dummy parameter types as in versions prior to MPI-4.0. `INTEGER` and/or ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`~~ ==`ADDRESS`== for *count* and *byte displacement* parameters. The other specific procedure has the same name followed by “`_c`”, and then suffixed by the token specified in Table [[versions/v41/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] for `USE mpi_f08`. It also has ~~`INTEGER(KIND=MPI_COUNT_KIND)`~~ ==`COUNT`== for all *count* parameters, ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`~~ ==`ADDRESS`== for parameters that represent *byte displacement* in memory, ~~`INTEGER(KIND=MPI_OFFSET_KIND)`~~ ==`OFFSET`== for parameters that represent *byte displacement* in files, and ~~`INTEGER(KIND=MPI_COUNT_KIND)`~~ ==`COUNT`== for parameters that may represent *byte displacement* in both memory and files (for more details on specific Fortran procedure names and related calling conventions, refer to [[Table]] tab:specific-fortran-proc-names in Section [[versions/v41/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] ).

There is one exception: if the type signatures of the two specific procedures are identical (e.g., if ~~`INTEGER(KIND=MPI_COUNT_KIND)`~~ ==`COUNT`== is the same type as ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`),~~ ==`ADDRESS`),== then the implementation shall not provide the “`_c`” specific procedure.

It is erroneous to directly invoke the “`_c`” specific procedures in the Fortran `mpi_f08` module with the exception of the following procedures: ~~[[versions/v41/API/MPI_OP_CREATE|MPI_Op_create_c]]~~ ==`MPI_Op_create_c`== and ~~[[versions/v41/API/MPI_REGISTER_DATAREP|MPI_Register_datarep_c]] .~~ ==`MPI_Register_datarep_c`.==

In older Fortran bindings (`mpif.h` ==(deprecated)== and `use mpi`), no new interfaces and no new specific procedures for larger types are provided beyond what existed in MPI-3.1; all MPI procedures have the same types as in the versions prior to MPI-4.0.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The following types, which were used prior to MPI-4.0, have been deemed too small to hold values that ==some== applications wish to use:

~~this version of MPI supports~~ ==MPI-4.0 and later support== larger types via separate additional MPI procedures in C (suffixed with “`_c`”)

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings]]

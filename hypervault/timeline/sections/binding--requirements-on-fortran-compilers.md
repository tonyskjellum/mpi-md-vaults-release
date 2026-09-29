---
title: "Requirements on Fortran Compilers"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Requirements on Fortran Compilers

Chapter **binding** · in [[versions/v30/sections/binding#Requirements on Fortran Compilers|MPI-3.0]], [[versions/v31/sections/binding#Requirements on Fortran Compilers|MPI-3.1]], [[versions/v40/sections/binding#Requirements on Fortran Compilers|MPI-4.0]], [[versions/v41/sections/binding#Requirements on Fortran Compilers|MPI-4.1]], [[versions/v50/sections/binding#Requirements on Fortran Compilers|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

- “Simply contiguous” arrays and scalars must be passed to choice buffer dummy arguments of nonblocking routines with call by reference. This is needed only if one of the support methods does not use the `ASYNCHRONOUS` attribute. See ~~Section [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] on page~~ [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] for more details.

~~- Separately compiled empty Fortran routines with implicit interfaces and separately compiled empty C routines with `BIND(C)` Fortran interfaces (e.g., [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]]~~

~~  on page [[versions/v31/sections/binding#Calling MPIFSYNCREG|Calling MPIFSYNCREG]] and Section [[f90-syncreg]] on page [[f90-syncreg]] , and [[DD]]~~

~~  on page [[versions/v31/sections/binding#A User Defined Routine Instead of MPIFSYNCREG|A User Defined Routine Instead of MPIFSYNCREG]] ) solve the problems described in Section [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] on page [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] .~~

~~- The problems with temporary data movement (described in detail in Section [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] on page [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] ) are solved as long as the application uses different sets of variables for the nonblocking communication (or nonblocking or split collective I/O) and the computation when overlapping communication and computation.~~

~~- Problems caused by automatic and permanent data movement (e.g., within a garbage collection, see Section [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on page [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] ) are resolved **without** any further requirements on the application program, neither on the usage of the buffers, nor on the declaration of application routines that are involved in invoking MPI procedures.~~

~~All of these rules are valid independently of whether the MPI routine interfaces in the `mpi_f08` and `mpi` modules are internally defined with an `INTERFACE` or `CONTAINS` construct, and with or without `BIND(C)`, and also if `mpif.h` uses explicit interfaces.~~

==- Separately compiled empty Fortran routines with implicit interfaces and separately compiled empty C routines with `BIND(C)` Fortran interfaces (e.g., [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] on page [[versions/v31/sections/binding#Calling MPIFSYNCREG|Calling MPIFSYNCREG]] and [[f90-syncreg]] , and [[DD]] on page [[versions/v31/sections/binding#A User Defined Routine Instead of MPIFSYNCREG|A User Defined Routine Instead of MPIFSYNCREG]] ) solve the problems described in [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] .==

==- The problems with temporary data movement (described in detail in [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] ) are solved as long as the application uses different sets of variables for the nonblocking communication (or nonblocking or split collective I/O) and the computation when overlapping communication and computation.==

==- Problems caused by automatic and permanent data movement (e.g., within a garbage collection, see [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] ) are resolved **without** any further requirements on the application program, neither on the usage of the buffers, nor on the declaration of application routines that are involved in invoking MPI procedures.==

==All of these rules are valid for the `mpi_f08` and `mpi` modules and independently of whether `mpif.h` uses explicit interfaces.==

~~> Some of these rules are already part of the Fortran 2003 standard if the MPI interfaces are defined without `BIND(C)`. Additional compiler support may be necessary if `BIND(C)` is used. Some of these additional requirements are defined in the Fortran TS 29113 . Some of these requirements for MPI-3.0 are beyond the scope of TS 29113.~~

~~Further requirements apply if the MPI library internally uses `BIND(C)` routine interfaces (i.e., for a full implementation of `mpi_f08`):~~

~~- Non-buffer arguments are `INTEGER`, `INTEGER(KIND=...)`, `CHARACTER(LEN=*)`, `LOGICAL`,~~

~~  and `BIND(C)` derived types (handles and status in `mpi_f08`),~~

~~  variables and arrays; function results are `DOUBLE PRECISION`. All these types must be valid as dummy arguments in the `BIND(C)` MPI routine interfaces. When compiling an MPI application, the compiler should not issue warnings indicating that these types may not be interoperable with an existing type in C. Some of these types are already valid in `BIND(C)` interfaces since Fortran 2003, some may be valid based on TS 29113 (e.g., `CHARACTER*(*)`).~~

~~- `OPTIONAL` dummy arguments are also valid within `BIND(C)` interfaces. This requirement is fulfilled if TS 29113 is fully supported by the compiler.~~

==> Some of these rules are already part of the Fortran 2003 standard, some of these requirements require the Fortran TS 29113 , and some of these requirements for MPI-3.0 are beyond the scope of TS 29113.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

The following rules are required at least as long as the compiler does not provide the extension of the `ASYNCHRONOUS` attribute as part of TS 29113 and there still exists a Fortran support method with ~~`MPI_ASYNC_PROTECTS_NONBLOCKING`==`.FALSE.`.~~ ==`MPI_ASYNC_PROTECTS_NONBLOCKING` set to `.FALSE.`.== Observation of these rules by the MPI application developer is especially ~~recomended~~ ==recommended== for backward compatibility of existing applications that use the `mpi` module or the `mpif.h` include file. The rules are as follows:

> Some of these rules are already part of the Fortran 2003 standard, some of these requirements require the Fortran TS 29113 , and some of these requirements for ~~MPI-3.0~~ ==MPI== are beyond the scope of TS 29113.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

- `SEQUENCE` and `BIND(C)` derived types are valid as actual arguments passed to choice buffer dummy arguments, and, in the case of ~~`MPI_SUBARRAYS_SUPPORTED`==`.FALSE.`,~~ ==`MPI_SUBARRAYS_SUPPORTED` set to `.FALSE.`,== they are passed with call by reference, and passed by descriptor in the case of `.TRUE.`.

The following rules are required at least as long as the compiler does not provide the extension of the `ASYNCHRONOUS` attribute as part of TS 29113 and there still exists a Fortran support method with `MPI_ASYNC_PROTECTS_NONBLOCKING` set to `.FALSE.`. Observation of these rules by the MPI application developer is especially recommended for backward compatibility of existing applications that use the `mpi` module or the ==(deprecated)== `mpif.h` include file. The rules are as follows:

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Requirements on Fortran Compilers]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Requirements on Fortran Compilers]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Requirements on Fortran Compilers]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Requirements on Fortran Compilers]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Requirements on Fortran Compilers]]

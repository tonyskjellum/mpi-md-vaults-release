---
title: "MPI for Different Fortran Standard Versions"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# MPI for Different Fortran Standard Versions

Chapter **binding** · in [[versions/v30/sections/binding#MPI for Different Fortran Standard Versions|MPI-3.0]], [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI-3.1]], [[versions/v40/sections/binding#MPI for Different Fortran Standard Versions|MPI-4.0]], [[versions/v41/sections/binding#MPI for Different Fortran Standard Versions|MPI-4.1]], [[versions/v50/sections/binding#MPI for Different Fortran Standard Versions|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (13 changed paragraphs)

- ~~<u>For~~ ==*For== Fortran ~~77</u>~~ ==77*== with some extensions:

- ~~<u>For~~ ==*For== Fortran ~~90:</u>\~~ ==90:*\== The major additional features that are needed from Fortran 90 are:

With these features, MPI-1.1 – MPI-2.2 can be implemented without restrictions. MPI-3.0 can be implemented with some restrictions. The Fortran support methods are abbreviated with ~~<span class="sans-serif">S1</span>~~ ==`S1`== = the `mpi_f08` module, ~~<span class="sans-serif">S2</span>~~ ==`S2`== = the `mpi` module, and ~~<span class="sans-serif">S3</span>~~ ==`S3`== = the `mpif.f` include file. If not stated otherwise, restrictions exist for each method which prevent implementing the complete semantics of MPI-3.0.

~~  - <span class="sans-serif">S1</span>, <span class="sans-serif">S2</span>, and <span class="sans-serif">S3</span> can be implemented, but for <span class="sans-serif">S1</span>, only a preliminary implementation is possible.~~

~~  - In this preliminary interface of <span class="sans-serif">S1</span>, the following changes are necessary:~~

~~    - The routines are not `BIND(C)`.~~

==  - `S1`, `S2`, and `S3` can be implemented, but for `S1`, only a preliminary implementation is possible.==

==  - In this preliminary interface of `S1`, the following changes are necessary:==

- The ~~linker~~ ==specific procedure== names are specified in ~~Section~~ [[versions/v31/sections/binding#Interface Specifications, ~~Linker Names~~ ==Procedure Names,== and the Profiling Interface|Interface Specifications, ~~Linker Names and the Profiling Interface]] on page [[versions/v31/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names~~ ==Procedure Names,== and the Profiling Interface]] .

- Due to the rules specified in ~~Section~~ [[versions/v31/sections/binding#Interface Specifications, ~~Linker Names~~ ==Procedure Names,== and the Profiling Interface|Interface Specifications, ~~Linker Names and the Profiling Interface]] on page [[versions/v31/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names~~ ==Procedure Names,== and the Profiling Interface]] , choice buffer declarations should be implemented only with non-standardized extensions like `!$PRAGMA IGNORE_TKR` (as long as F2008+TS 29113 is not available).

In ~~<span class="sans-serif">S2</span>~~ ==`S2`== and ~~<span class="sans-serif">S3</span>:~~ ==`S3`:== Without such extensions, routines with choice buffers should be provided with an implicit interface, instead of overloading with a different MPI function for each possible buffer type (as mentioned in ~~Section [[versions/v31/sections/binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] on page~~ [[versions/v31/sections/binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] ). Such overloading would also imply restrictions for passing Fortran derived types as choice buffer, see also ~~Section [[versions/v31/sections/binding#Fortran Derived Types|Fortran Derived Types]] on page~~ [[versions/v31/sections/binding#Fortran Derived Types|Fortran Derived Types]] .

Only in ~~<span class="sans-serif">S1</span>:~~ ==`S1`:== The implicit interfaces for routines with choice buffer arguments imply that the `ierror` argument cannot be defined as `OPTIONAL`. For this reason, it is recommended not to provide the `mpi_f08` module if such an extension is not available.

- The `ASYNCHRONOUS` attribute can **not** be used in applications to protect buffers in nonblocking MPI calls ~~(<span class="sans-serif">S1</span>-<span class="sans-serif">S3</span>).~~ ==(`S1`–`S3`).==

- In ~~<span class="sans-serif">S1</span>~~ ==`S1`== and ~~<span class="sans-serif">S2</span>,~~ ==`S2`,== the definition of the handle types (e.g., `TYPE(MPI_Comm)` and the status type `TYPE(MPI_Status)` must be modified: The `SEQUENCE` attribute must be used instead of `BIND(C)` (which is not available in Fortran 90/95). This restriction implies that the application must be fully recompiled if one switches to an MPI library for Fortran 2003 and later because the internal memory size of the handles may have changed. For this reason, an implementor may choose not to provide the `mpi_f08` module for Fortran 90 compilers. In this case, the `mpi_f08` handle types and all routines, constants and types ~~ralated~~ ==related== to `TYPE(MPI_Status)` (see ~~Section [[versions/v31/sections/binding#Status|Status]] on page~~ [[versions/v31/sections/binding#Status|Status]] ) are also not available in the `mpi` module and `mpif.h`.

- ~~<u>For~~ ==*For== Fortran ~~95:</u>\~~ ==95:*\== The quality of the MPI interface and the restrictions are the same as with Fortran 90.

- ~~<u>For~~ ==*For== Fortran ~~2003:</u>\~~ ==2003:*\== The major features that are needed from Fortran 2003 are:

~~    - `BIND(C, NAME=’...’)` interfaces.~~

==  - The ability to overload the operators `.EQ.` and `.NE.` to allow the comparison of derived types (used in MPI-3.0 for MPI handles).==

~~  - For <span class="sans-serif">S1</span>, only a preliminary implementation is possible. The following changes are necessary:~~

~~    - The routines are not `BIND(C)`.~~

==  - For `S1`, only a preliminary implementation is possible. The following changes are necessary:==

- The ~~linker~~ ==specific procedure== names are specified in ~~Section~~ [[versions/v31/sections/binding#Interface Specifications, ~~Linker Names~~ ==Procedure Names,== and the Profiling Interface|Interface Specifications, ~~Linker Names and the Profiling Interface]] on page [[versions/v31/sections/binding#Interface Specifications, Linker Names and the Profiling Interface|Interface Specifications, Linker Names~~ ==Procedure Names,== and the Profiling Interface]] .

- With ~~<span class="sans-serif">S1</span>,~~ ==`S1`,== the `ASYNCHRONOUS` is required as specified in the second Fortran interfaces. With ~~<span class="sans-serif">S2</span>~~ ==`S2`== and ~~<span class="sans-serif">S3</span>~~ ==`S3`== the implementation can also add this attribute if explicit interfaces are used.

- ~~<u>For~~ ==*For== Fortran 2008 + TS 29113 and ~~later</u>~~ ==later*== and ~~<u>For~~ ==*For== Fortran 2003 + TS ~~29113:</u>\~~ ==29113:*\== The major feature that are needed from TS 29113 are:

~~  - `OPTIONAL` dummy arguments are allowed in combination with `BIND(C)` interfaces.~~

~~  - `CHARACTER(LEN=*)` dummy arguments are allowed in combination with `BIND(C)` interfaces.~~

- With ~~<span class="sans-serif">S1</span>,~~ ==`S1`,== `MPI_SUBARRAYS_SUPPORTED` equals `.TRUE.`. The `ASYNCHRONOUS` attribute can be used to protect buffers in nonblocking MPI calls. The `TYPE(C_PTR)` binding of the [[versions/v31/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , [[versions/v31/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , [[versions/v31/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] , and [[versions/v31/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] routines can be used for any Fortran type.

- With ~~<span class="sans-serif">S2</span>~~ ==`S2`== and ~~<span class="sans-serif">S3</span>,~~ ==`S3`,== the value of `MPI_SUBARRAYS_SUPPORTED` is implementation dependent. A high quality implementation will also provide `MPI_SUBARRAYS_SUPPORTED`==`.TRUE.` and will use the `ASYNCHRONOUS` attribute in the same way as in ~~<span class="sans-serif">S1</span>.~~ ==`S1`.==

- If non-standardized extensions like `!$PRAGMA IGNORE_TKR` are not available then ~~<span class="sans-serif">S2</span>~~ ==`S2`== must be implemented with `TYPE(*), DIMENSION(..)`.

### MPI-3.1 → MPI-4.0  (11 changed paragraphs)

- The `KIND=` and ~~`SELECTED_..._KIND`~~ ==`SELECTED_XXX_KIND`== concept.

- Cray pointers, which are a ~~non-standard~~ ==nonstandard== compiler extension, are needed for the use of [[versions/v40/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] .

With these features, MPI-1.1 – MPI-2.2 can be implemented without restrictions. MPI-3.0 ==and later== can be implemented with some restrictions. The Fortran support methods are abbreviated with `S1` = the `mpi_f08` module, `S2` = the `mpi` module, and `S3` = the `mpif.f` include file. If not stated otherwise, restrictions exist for each method ~~which~~ ==that== prevent implementing the complete semantics of ~~MPI-3.0.~~ ==MPI.==

- `TYPE(*), DIMENSION(..)` is substituted by ~~non-standardized~~ ==nonstandardized== extensions like `!$PRAGMA IGNORE_TKR`.

- Due to the rules specified in [[versions/v40/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] , choice buffer declarations should be implemented only with ~~non-standardized~~ ==nonstandardized== extensions like `!$PRAGMA IGNORE_TKR` (as long as F2008+TS 29113 is not available).

- The ability to overload the operators `.EQ.` and `.NE.` to allow the comparison of derived types (used in MPI-3.0 ==and later== for MPI handles).

MPI-3.0 ==and later== can be implemented with the following restrictions:

- `TYPE(*), DIMENSION(..)` is substituted by ~~non-standardized~~ ==nonstandardized== extensions like `!$PRAGMA IGNORE_TKR`.

- The same restriction as for Fortran 90 applies if ~~non-standardized~~ ==nonstandardized== extensions like `!$PRAGMA IGNORE_TKR` are not available.

- *For Fortran 2008 + TS 29113 and later* ~~and~~ ==and\== *For Fortran 2003 + TS 29113:*\ The major ~~feature~~ ==features== that are needed from TS 29113 are:

Using these features, MPI-3.0 ==and later== can be implemented without any restrictions.

- With `S2` and `S3`, the value of `MPI_SUBARRAYS_SUPPORTED` is implementation dependent. A high quality implementation will also provide ~~`MPI_SUBARRAYS_SUPPORTED`==`.TRUE.`~~ ==`MPI_SUBARRAYS_SUPPORTED` set to `.TRUE.`== and will use the `ASYNCHRONOUS` attribute in the same way as in `S1`.

- If ~~non-standardized~~ ==nonstandardized== extensions like `!$PRAGMA IGNORE_TKR` are not available then `S2` must be implemented with `TYPE(*), DIMENSION(..)`.

> If `MPI_SUBARRAYS_SUPPORTED`==`.FALSE.`, the choice argument may be implemented with an explicit interface using compiler directives, for example: > > INTERFACE > SUBROUTINE MPI_...(buf, ...) > !DEC$ ATTRIBUTES NO_ARG_CHECK :: buf > !$PRAGMA IGNORE_TKR buf > !DIR$ IGNORE_TKR buf > !IBM* IGNORE_TKR buf > REAL, DIMENSION(*) :: buf > ... ! declarations of the other arguments > END SUBROUTINE > END INTERFACE

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

- Due to the rules specified in [[versions/v41/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] , choice buffer declarations should be implemented only with nonstandardized extensions like `!$PRAGMA IGNORE_TKR` (as long as ~~F2008+TS~~ ==F2008 with TS== 29113 ==or Fortran 2018== is not available).

- The user application can use `TYPE(C_PTR)` together with [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] as long as [[versions/v41/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] is defined with an implicit interface because a `C_PTR` and an ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`~~ ==`ADDRESS`== argument must both map to a `void *` argument.

- *For Fortran 2008 ~~+~~ ==with== TS 29113 and later* and\ *For Fortran 2003 ~~+~~ ==with== TS 29113:*\ The major features that are needed from TS 29113 are:

> If ~~`MPI_SUBARRAYS_SUPPORTED`==`.FALSE.`,~~ ==`MPI_SUBARRAYS_SUPPORTED`=`.FALSE.`,== the choice argument may be implemented with an explicit interface using compiler directives, for example: > ==> ``` [MPI]Fortran== > INTERFACE > SUBROUTINE MPI_...(buf, ...) > !DEC$ ATTRIBUTES NO_ARG_CHECK :: buf > !$PRAGMA IGNORE_TKR buf > !DIR$ IGNORE_TKR buf > !IBM* IGNORE_TKR buf > REAL, DIMENSION(*) :: buf > ... ! declarations of the other arguments > END SUBROUTINE > END INTERFACE ==> ```==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

> If `MPI_SUBARRAYS_SUPPORTED`=`.FALSE.`, the choice argument may be implemented with an explicit interface using compiler ~~directives,~~ ==directives. > > > > Use of typical compiler directives to disable type, kind, and rank checks== for ~~example:~~ ==choice buffer arguments.== > > ``` [MPI]Fortran > INTERFACE > SUBROUTINE MPI_...(buf, ...) > !DEC$ ATTRIBUTES NO_ARG_CHECK :: buf > !$PRAGMA IGNORE_TKR buf > !DIR$ IGNORE_TKR buf > !IBM* IGNORE_TKR buf > REAL, DIMENSION(*) :: buf > ... ! declarations of the other arguments > END SUBROUTINE > END INTERFACE > ``` ==> >==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#MPI for Different Fortran Standard Versions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#MPI for Different Fortran Standard Versions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#MPI for Different Fortran Standard Versions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#MPI for Different Fortran Standard Versions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#MPI for Different Fortran Standard Versions]]

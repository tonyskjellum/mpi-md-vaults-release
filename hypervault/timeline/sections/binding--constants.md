---
title: "Constants"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Constants

Chapter **binding** · in [[versions/v20/sections/binding#Constants|MPI-2.0]], [[versions/v21/sections/binding#Constants|MPI-2.1]], [[versions/v22/sections/binding#Constants|MPI-2.2]], [[versions/v30/sections/binding#Constants|MPI-3.0]], [[versions/v31/sections/binding#Constants|MPI-3.1]], [[versions/v40/sections/binding#Constants|MPI-4.0]], [[versions/v41/sections/binding#Constants|MPI-4.1]], [[versions/v50/sections/binding#Constants|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~Constants are singleton objects and are declared `const`. Note that not all globally defined MPI objects are constant. For example, `MPI::COMM_WORLD` and `MPI::COMM_SELF` are not `const`.~~

==MPI constants have the same value in all languages, unless specified otherwise. This does not apply to constant handles (`MPI_INT`, `MPI_COMM_WORLD`, `MPI_ERRORS_RETURN`, `MPI_SUM`, etc.) These handles need to be converted, as explained in Section [[versions/v30/sections/binding#Transfer of Handles|Transfer of Handles]] . Constants that specify maximum lengths of strings (see Section [[versions/v30/sections/appLang-Const#Defined Constants|Defined Constants]] for a listing) have a value one less in Fortran than C since in C the length includes the null terminating character. Thus, these constants represent the amount of space which must be allocated to hold the largest possible such string, rather than the maximum number of printable characters the string could contain.==

==> [!note] Advice to users==

==> This definition means that it is safe in C to allocate a buffer to receive a string using a declaration like > >             char name [MPI_MAX_OBJECT_NAME];==

==Also constant “addresses,” i.e., special values for reference arguments that are not handles, such as `MPI_BOTTOM` or `MPI_STATUS_IGNORE` may have different values in different languages.==

==> [!tip] Rationale==

==> The current MPI standard specifies that `MPI_BOTTOM` can be used in initialization expressions in C, but not in Fortran. Since Fortran does not normally support call by value, then `MPI_BOTTOM` in Fortran must be the name of a predefined > > static variable, e.g., a variable in an MPI declared `COMMON` > > block. On the other hand, in C, it is natural to take > > `MPI_BOTTOM` = 0 (Caveat: Defining `MPI_BOTTOM` = 0 > > implies that `NULL` pointer cannot be distinguished from > > `MPI_BOTTOM`; it may be that `MPI_BOTTOM` = 1 is better. See the advice to implementors in the *Datatypes* subsection in Section [[versions/v30/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] ) > > Requiring that the Fortran and C values be the same will complicate the initialization process.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> The current MPI standard specifies that `MPI_BOTTOM` can be used in initialization expressions in C, but not in Fortran. Since Fortran does not normally support call by value, then `MPI_BOTTOM` in Fortran must be the name of a predefined ~~> >~~ static variable, e.g., a variable in an MPI declared `COMMON` ~~> >~~ block. On the other hand, in C, it is natural to take ~~> >~~ `MPI_BOTTOM` = 0 (Caveat: Defining `MPI_BOTTOM` = 0 ~~> >~~ implies that `NULL` pointer cannot be distinguished from ~~> >~~ `MPI_BOTTOM`; it may be that `MPI_BOTTOM` = 1 is better. See the advice to implementors in the *Datatypes* subsection in Section [[versions/v40/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] ) ~~> >~~ Requiring that the Fortran and C values be the same will complicate the initialization process.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

MPI constants have the same value in all languages, unless specified otherwise. This does not apply to constant handles (`MPI_INT`, `MPI_COMM_WORLD`, `MPI_ERRORS_RETURN`, `MPI_SUM`, etc.) These handles need to be converted, as explained in Section [[versions/v41/sections/binding#Transfer of Handles|Transfer of Handles]] . Constants that specify maximum lengths of strings (see Section [[versions/v41/sections/appLang-Const#Defined Constants|Defined Constants]] for a listing) have a value one less in Fortran than C since in C the length includes the null terminating character. Thus, these constants represent the amount of space ~~which~~ ==that== must be allocated to hold the largest possible such string, rather than the maximum number of printable characters the string could contain.

> This definition means that it is safe in C to allocate a buffer to receive a string using a declaration like > > ==``` [MPI]C >== char name [MPI_MAX_OBJECT_NAME]; ==> ```==

> The current MPI standard specifies that `MPI_BOTTOM` can be used in initialization expressions in C, but not in Fortran. Since Fortran does not normally support call by value, then `MPI_BOTTOM` in Fortran must be the name of a predefined static variable, e.g., a variable in an MPI declared `COMMON` block. On the other hand, in C, it is natural to take `MPI_BOTTOM` = 0 (Caveat: Defining `MPI_BOTTOM` = 0 implies that `NULL` pointer cannot be distinguished from `MPI_BOTTOM`; it may be that `MPI_BOTTOM` = 1 is better. See the advice to implementors in the ~~*Datatypes*~~ subsection in Section [[versions/v41/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] ) Requiring that the Fortran and C values be the same will complicate the initialization process.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Constants]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Constants]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Constants]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Constants]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Constants]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Constants]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Constants]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Constants]]

---
title: "Problems Due to Strong Typing"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Problems Due to Strong Typing

Chapter **binding** · in [[versions/v20/sections/binding#Problems Due to Strong Typing|MPI-2.0]], [[versions/v21/sections/binding#Problems Due to Strong Typing|MPI-2.1]], [[versions/v22/sections/binding#Problems Due to Strong Typing|MPI-2.2]], [[versions/v30/sections/binding#Problems Due to Strong Typing|MPI-3.0]], [[versions/v31/sections/binding#Problems Due to Strong Typing|MPI-3.1]], [[versions/v40/sections/binding#Problems Due to Strong Typing|MPI-4.0]], [[versions/v41/sections/binding#Problems Due to Strong Typing|MPI-4.1]], [[versions/v50/sections/binding#Problems Due to Strong Typing|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~All MPI functions with choice arguments associate actual arguments of different Fortran datatypes with the same dummy argument. This is not allowed by Fortran 77, and in Fortran 90 is technically only allowed if the function is overloaded with a different function for each type. In C, the use of `void*` formal arguments avoids these problems.~~

~~The following code fragment is technically illegal and may generate a compile-time error.~~

==All MPI functions with choice arguments associate actual arguments of different Fortran datatypes with the same dummy argument. This is not allowed by Fortran 77, and in Fortran 90, it is technically only allowed if the function is overloaded with a different function for each type (see also Section [[versions/v30/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page [[versions/v30/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] ). In C, the use of `void*` formal arguments avoids these problems.==

==Similar to C, with Fortran 2008 + TS 29113 (and later) together with the `mpi_f08` module, the problem is avoided by declaring choice arguments with `TYPE(*), DIMENSION(..)`, i.e., as assumed-type and assumed-rank dummy arguments.==

==Using `INCLUDE ’mpif.h’`, the following code fragment is technically invalid and may generate a compile-time error.==

In practice, it is rare for compilers to do more than issue a ~~warning, though there is concern that Fortran 90 compilers are more likely to return errors.~~ ==warning.==

~~It~~ ==When using either the `mpi_f08` or `mpi` module, the problem== is ~~also technically illegal in Fortran to pass~~ ==usually resolved through the assumed-type and assumed-rank declarations of the dummy arguments, or with== a ~~scalar actual argument to an array dummy argument. Thus the following code fragment may generate an error since the `buf` argument to [[versions/v30/API/MPI_SEND|MPI_SEND]] is declared as an assumed-size array `<type> buf(*)`.~~ ==compiler-dependent mechanism that overrides type checking for choice arguments.==

~~integer~~ ==It is also technically invalid in Fortran to pass== a ~~call mpi_send(a, 1, MPI_INTEGER, ...)~~ ==scalar actual argument to an array dummy argument that is not a choice buffer argument. Thus, when using the `mpi_f08` or `mpi` module, the following code fragment usually generates an error since the `dims` and `periods` arguments to [[versions/v30/API/MPI_CART_CREATE|MPI_CART_CREATE]] are declared as assumed size arrays `INTEGER` :: `DIMS(*)` and `LOGICAL` :: `PERIODS(*)`.==

~~> [!note] Advice to users~~ ==USE mpi_f08 ! or USE mpi INTEGER size CALL MPI_Cart_create( comm_old,1,size,.TRUE.,.TRUE.,comm_cart,ierror )==

~~> In the event that you run into one of the problems related to type checking, you~~ ==Although this is a non-conforming MPI call, compiler warnings are not expected (but== may ~~be able to work around it by~~ ==occur) when== using ~~a compiler flag, by compiling separately, or by using an MPI implementation with Extended~~ ==`INCLUDE` `’mpif.h’` and this include file does not use== Fortran ~~Support as described in Section [[f90-extended]] . An alternative that will usually work with variables local to a routine but not with arguments to a function or subroutine is to use the `EQUIVALENCE` statement to create another variable with a type accepted by the compiler.~~ ==explicit interfaces.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~All MPI functions with choice arguments associate actual arguments of different Fortran datatypes with the same dummy argument. This is not allowed by Fortran 77, and in Fortran 90, it is technically only allowed if the function is overloaded with a different function for each type (see also Section [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] ). In C, the use of `void*` formal arguments avoids these problems.~~

~~Similar to C, with Fortran 2008 + TS 29113 (and later) together with the `mpi_f08` module, the problem is avoided by declaring choice arguments with `TYPE(*), DIMENSION(..)`, i.e., as assumed-type and assumed-rank dummy arguments.~~

==All MPI functions with choice arguments associate actual arguments of different Fortran datatypes with the same dummy argument. This is not allowed by Fortran 77, and in Fortran 90, it is technically only allowed if the function is overloaded with a different function for each type (see also [[versions/v31/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] ). In C, the use of `void*` formal arguments avoids these problems. Similar to C, with Fortran 2008 + TS 29113 (and later) together with the `mpi_f08` module, the problem is avoided by declaring choice arguments with `TYPE(*), DIMENSION(..)`, i.e., as assumed-type and assumed-rank dummy arguments.==

~~In practice, it is rare for compilers to do more than issue a warning.~~

~~When using either the `mpi_f08` or `mpi` module, the problem is usually resolved through the assumed-type and assumed-rank declarations of the dummy arguments, or with a compiler-dependent mechanism that overrides type checking for choice arguments.~~

==In practice, it is rare for compilers to do more than issue a warning. When using either the `mpi_f08` or `mpi` module, the problem is usually resolved through the assumed-type and assumed-rank declarations of the dummy arguments, or with a compiler-dependent mechanism that overrides type checking for choice arguments.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

USE mpi_f08 ! or USE mpi INTEGER size CALL ~~MPI_Cart_create( comm_old,1,size,.TRUE.,.TRUE.,comm_cart,ierror )~~ ==MPI_Cart_create(comm_old, 1, size, .TRUE., .TRUE., comm_cart, ierror)==

Although this is a ~~non-conforming~~ ==nonconforming== MPI call, compiler warnings are not expected (but may occur) when using `INCLUDE` `’mpif.h’` and this include file does not use Fortran explicit interfaces.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~All MPI functions with choice arguments associate actual arguments of different Fortran datatypes with the same dummy argument. This is not allowed by Fortran 77, and in Fortran 90, it is technically only allowed if the function is overloaded with a different function for each type (see also [[versions/v41/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] ). In C, the use of `void*` formal arguments avoids these problems. Similar to C, with Fortran 2008 + TS 29113 (and later) together with the `mpi_f08` module, the problem is avoided by declaring choice arguments with `TYPE(*), DIMENSION(..)`, i.e., as assumed-type and assumed-rank dummy arguments.~~

~~Using `INCLUDE ’mpif.h’`, the following code fragment is technically invalid and may generate a compile-time error.~~

~~      integer i(5)       real    x(5)       ...       call mpi_send(x, 5, MPI_REAL, ...)       call mpi_send(i, 5, MPI_INTEGER, ...)~~

==All MPI functions with choice arguments associate actual arguments of different Fortran datatypes with the same dummy argument. This is not allowed by Fortran 77, and in Fortran 90, it is technically only allowed if the function is overloaded with a different function for each type (see also [[versions/v41/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] ). In C, the use of `void*` formal arguments avoids these problems. Similar to C, with Fortran 2008 with TS 29113 (and later) together with the `mpi_f08` module, the problem is avoided by declaring choice arguments with `TYPE(*), DIMENSION(..)`, i.e., as assumed-type and assumed-rank dummy arguments.==

==Using `INCLUDE ’mpif.h’` (deprecated), the following code fragment is technically invalid and may generate a compile-time error.==

==(code block added)==
``` [MPI]Fortran
integer i(5)
real    x(5)
...
call mpi_send(x, 5, MPI_REAL, ...)
call mpi_send(i, 5, MPI_INTEGER, ...)
```

~~      USE mpi_f08     ! or  USE mpi       INTEGER size       CALL MPI_Cart_create(comm_old, 1, size, .TRUE., .TRUE., comm_cart, ierror)~~

~~Although this is a nonconforming MPI call, compiler warnings are not expected (but may occur) when using `INCLUDE` `’mpif.h’` and this include file does not use Fortran explicit interfaces.~~

==It is erroneous to pass a variable instead of an array with one element.==

==    [language={[MPI08]Fortran},basicstyle=]     ! ----------------  THIS EXAMPLE IS ERRONEOUS ---------------     USE mpi_f08     ! or  USE mpi     INTEGER size     CALL MPI_Cart_create(comm_old, 1, size, .TRUE., .TRUE., comm_cart, ierror)==

==Although this is a nonconforming MPI call, compiler warnings are not expected (but may occur) when using `INCLUDE ’mpif.h’` (deprecated) and this include file does not use Fortran explicit interfaces.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Problems Due to Strong Typing]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Problems Due to Strong Typing]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Problems Due to Strong Typing]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Problems Due to Strong Typing]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Problems Due to Strong Typing]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Problems Due to Strong Typing]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Problems Due to Strong Typing]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Problems Due to Strong Typing]]

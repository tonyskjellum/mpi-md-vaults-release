---
title: "Fortran Support Through the `mpif.h` Include File"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Fortran Support Through the `mpif.h` Include File

Chapter **binding** · in [[versions/v30/sections/binding#Fortran Support Through the `mpif.h` Include File|MPI-3.0]], [[versions/v31/sections/binding#Fortran Support Through the `mpif.h` Include File|MPI-3.1]], [[versions/v40/sections/binding#Fortran Support Through the `mpif.h` Include File|MPI-4.0]], [[versions/v41/sections/binding#Fortran Support Through the `mpif.h` Include File|MPI-4.1]], [[versions/v50/sections/binding#Fortran Support Through the `mpif.h` Include File|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~> [!warning] Advice to implementors~~

~~> To make `mpif.h` compatible with both fixed- and free-source forms, to allow automatic inclusion by preprocessors, and to allow extended fixed-form line length, it is recommended that the requirement of usability in free and fixed source form applications be met by constructing `mpif.h` without any continuation lines. This should be possible because `mpif.h` may contain only declarations, and because common block declarations can be split among several lines. > > The argument names may need to be shortened to keep the `SUBROUTINE` statement within the allowed $`72-6=66`$ characters, e.g., > > INTERFACE\ > SUBROUTINE PMPI_DIST_GRAPH_CREATE_ADJACENT(a,b,c,d,e,f,g,h,i,j,k)\ > ... ! dummy argument declarations > > This line has 65 characters and is the longest in MPI-3.0. > > As long as the MPI standard contains routines with choice buffers and a name length and argument count that implies that a `BIND(C)` implementation would need to shorten their linker names in `mpif.h`, the `mpif.h` cannot set `MPI_SUBARRAYS_SUPPORTED` and `MPI_ASYNC_PROTECTS_NONBLOCKING` equals `.TRUE.`, because such shortening is invalid. > > For example, [[versions/v31/API/MPI_FILE_WRITE_AT_ALL_BEGIN|MPI_FILE_WRITE_AT_ALL_BEGIN]] with 6 arguments, may be defined: > > INTERFACE MPI_FILE_WRITE_AT_ALL_BEGIN\ > SUBROUTINE MPI_X(a,b,c,d,e,f)BIND(C,NAME=’MPI_File_write_at_all_begin_f’)\ > ... ! dummy argument declarations > > This would need a line length of 73 characters, i.e., the C routine name would need to be shortened by 7 characters to stay within the available 66 characters. > > Note that the name `MPI_X` has no meaning for the compilation, and that this problem occurs only with routines with choice buffers implemented with the assumed-type and assumed-rank facility of TS 29113. > > To support Fortran 77 as well as Fortran 90 and later, it may be necessary to eliminate all comments from `mpif.h`.~~

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> ~~With MPI-3.0, the~~ ==The== `mpif.h` include file ~~was~~ ==has== not ==been== deprecated in order to retain strong backward compatibility. Internally, `mpif.h` and the `mpi` module may be implemented so that essentialy the same library implementation of the MPI routines can be used.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

The use of the `mpif.h` include file ~~is strongly discouraged and may be~~ ==has been== deprecated in ~~a future version of MPI.~~ ==MPI-4.1.==

- Set the `LOGICAL` ~~compile-time~~ constants `MPI_SUBARRAYS_SUPPORTED` and `MPI_ASYNC_PROTECTS_NONBLOCKING` according to the same rules as for the `mpi` module. In the case of implicit interfaces for choice buffer or nonblocking routines, the constants must be set to `.FALSE.`.

~~> Instead of using `mpif.h`, the use of the `mpi_f08` or `mpi` module is strongly encouraged for the following reasons: > > - Most `mpif.h` implementations do not include compile-time argument checking. > > - Therefore, many bugs in MPI applications remain undetected at compile-time, such as: > >   - Missing `ierror` as last argument in most Fortran bindings. > >   - Declaration of a `status` as an `INTEGER` variable instead of an `INTEGER` array with size `MPI_STATUS_SIZE`. > >   - Incorrect argument positions; e.g., interchanging the `count` and `datatype` arguments. > >   - Passing incorrect MPI handles; e.g., passing a datatype instead of a communicator. > > - The migration from `mpif.h` to the `mpi` module should be relatively straightforward (i.e., substituting `include ’mpif.h’` after an `implicit` statement by `use mpi` before that `implicit` statement) as long as the application syntax is correct. > > - Migrating portable and correctly written applications to the `mpi` module is not expected to be difficult. No compile or runtime problems should occur because an `mpif.h` include file was always allowed to provide explicit Fortran interfaces.~~

~~> [!tip] Rationale~~

~~> The `mpif.h` include file has not been deprecated in order to retain strong backward compatibility. Internally, `mpif.h` and the `mpi` module may be implemented so that essentialy the same library implementation of the MPI routines can be used.~~

==> Instead of using `mpif.h`, the use of the `mpi_f08` or `mpi` module is strongly encouraged for the following reasons: > > - Most `mpif.h` implementations do not include compile-time argument checking. > > - Therefore, many bugs in MPI applications remain undetected at compile-time, such as: > >   - Missing `ierror` as last argument in most Fortran bindings. > >   - Declaration of a `status` as an `INTEGER` variable instead of an `INTEGER` array with size `MPI_STATUS_SIZE`. > >   - Incorrect argument positions; e.g., interchanging the `count` and `datatype` arguments. > >   - Passing incorrect MPI handles; e.g., passing a datatype instead of a communicator. > > - The migration from `mpif.h` to the `mpi` module should be relatively straightforward (i.e., substituting `INCLUDE ’mpif.h’` after an `implicit` statement by `use mpi` before that `implicit` statement) as long as the application syntax is correct. > > - Migrating portable and correctly written applications to the `mpi` module is not expected to be difficult. No compile or runtime problems should occur because an `mpif.h` include file was always allowed to provide explicit Fortran interfaces.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Fortran Support Through the `mpif.h` Include File]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Fortran Support Through the `mpif.h` Include File]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Fortran Support Through the `mpif.h` Include File]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Fortran Support Through the `mpif.h` Include File]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Fortran Support Through the `mpif.h` Include File]]

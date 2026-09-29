---
title: "Background of MPI-1.1, MPI-1.2, and MPI-2.0"
chapter: intro
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/intro]
---

# Background of MPI-1.1, MPI-1.2, and MPI-2.0

Chapter **intro** · in [[versions/v21/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0|MPI-2.1]], [[versions/v22/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0|MPI-2.2]], [[versions/v30/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0|MPI-3.0]], [[versions/v31/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0|MPI-3.1]], [[versions/v40/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0|MPI-4.0]], [[versions/v41/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0|MPI-4.1]], [[versions/v50/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~Beginning in March 1995, the MPI Forum began meeting to consider corrections and extensions to the original MPI Standard document . The first product of these deliberations was Version 1.1 of the MPI specification, released in June of 1995~~

~~(see\ `http://www.mpi-forum.org` for official MPI document releases).~~

~~At that time, effort focused~~

~~in~~

==Beginning in March 1995, the MPI Forum began meeting to consider corrections and extensions to the original MPI Standard document . The first product of these deliberations was Version 1.1 of the MPI specification, released in June of 1995 (see\ `http://www.mpi-forum.org` for official MPI document releases). At that time, effort focused in==

~~4.  Bindings for Fortran 90 and C++.~~

~~    MPI-2 specifies~~

~~    C++ bindings for both MPI-1 and MPI-2 functions, and extensions to the Fortran 77 binding of MPI-1 and MPI-2 to handle Fortran 90 issues.~~

~~5.  Discussions of areas in which the MPI process and framework seem likely to be useful, but where more discussion and experience are needed before standardization (e.g.~~

~~    zero-copy~~

~~    semantics on shared-memory machines, real-time specifications).~~

==4.  Bindings for Fortran 90 and C++. MPI-2 specifies C++ bindings for both MPI-1 and MPI-2 functions, and extensions to the Fortran 77 binding of MPI-1 and MPI-2 to handle Fortran 90 issues.==

==5.  Discussions of areas in which the MPI process and framework seem likely to be useful, but where more discussion and experience are needed before standardization (e.g.,==

==    zero-copy semantics on shared-memory machines, real-time specifications).==

~~were~~

~~collected in Chapter 3 of the MPI-2 document: “Version 1.2 of MPI.”~~

~~That~~

~~chapter also contains the function for identifying the version number. Additions to MPI-1.1 (items of types 2, 3, and 4 in the above list) are in the~~

~~remaining chapters of the MPI-2 document,~~

~~and constitute the specification for~~

~~MPI-2.~~

==were collected in Chapter 3 of the MPI-2 document: “Version 1.2 of MPI.” That chapter also contains the function for identifying the version number. Additions to MPI-1.1 (items of types 2, 3, and 4 in the above list) are in the==

==remaining chapters of the MPI-2 document, and constitute the specification for MPI-2.==

~~- MPI-1 compliance will mean compliance with~~

~~  MPI-1.3.~~

~~  This is a useful level of compliance. It means that the implementation conforms to the clarifications of MPI-1.1 function behavior given in Chapter 3 of the MPI-2 document. Some implementations may require changes to be MPI-1 compliant.~~

==- MPI-1 compliance will mean compliance with MPI-1.3. This is a useful level of compliance. It means that the implementation conforms to the clarifications of MPI-1.1 function behavior given in Chapter 3 of the MPI-2 document. Some implementations may require changes to be MPI-1 compliant.==

~~It is to be emphasized that forward compatibility is preserved. That is, a valid MPI-1.1 program is both a valid~~

~~MPI-1.3~~

~~program and a valid~~

~~MPI-2.1~~

~~program, and a valid~~

~~MPI-1.3~~

~~program is a valid~~

~~MPI-2.1~~

~~program.~~

==It is to be emphasized that forward compatibility is preserved. That is, a valid MPI-1.1 program is both a valid MPI-1.3 program and a valid MPI-2.1 program, and a valid MPI-1.3 program is a valid MPI-2.1 program.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~Beginning in March 1995, the MPI Forum began meeting to consider corrections and extensions to the original MPI Standard document . The first product of these deliberations was Version 1.1 of the MPI specification, released in June of 1995 (see\ `http://www.mpi-forum.org` for official MPI document releases). At that time, effort focused in~~

~~five areas.~~

==Beginning in March 1995, the MPI Forum began meeting to consider corrections and extensions to the original MPI Standard document . The first product of these deliberations was Version 1.1 of the MPI specification, released in June of 1995 (see\ http://www.mpi-forum.org for official MPI document releases). At that time, effort focused in five areas.==

~~5.  Discussions of areas in which the MPI process and framework seem likely to be useful, but where more discussion and experience are needed before standardization (e.g.,~~

~~    zero-copy semantics on shared-memory machines, real-time specifications).~~

~~Corrections and clarifications (items of type 1 in the above list)~~

~~were collected in Chapter 3 of the MPI-2 document: “Version 1.2 of MPI.” That chapter also contains the function for identifying the version number. Additions to MPI-1.1 (items of types 2, 3, and 4 in the above list) are in the~~

~~remaining chapters of the MPI-2 document, and constitute the specification for MPI-2.~~

~~Items of type 5 in the above list have been moved to a separate document, the “MPI Journal of Development” (JOD), and are not part of the MPI-2 Standard.~~

==5.  Discussions of areas in which the MPI process and framework seem likely to be useful, but where more discussion and experience are needed before standardization (e.g., zero-copy semantics on shared-memory machines, real-time specifications).==

==Corrections and clarifications (items of type 1 in the above list) were collected in Chapter 3 of the MPI-2 document: “Version 1.2 of MPI.” That chapter also contains the function for identifying the version number. Additions to MPI-1.1 (items of types 2, 3, and 4 in the above list) are in the remaining chapters of the MPI-2 document, and constitute the specification for MPI-2. Items of type 5 in the above list have been moved to a separate document, the “MPI Journal of Development” (JOD), and are not part of the MPI-2 Standard.==

~~- MPI-2 compliance will mean compliance with all of~~

~~  MPI-2.1.~~

==- MPI-2 compliance will mean compliance with all of MPI-2.1.==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

Beginning in March 1995, the MPI Forum began meeting to consider corrections and extensions to the original MPI ~~Standard~~ ==standard== document . The first product of these deliberations was Version 1.1 of the MPI specification, released in June of 1995 (see\ http://www.mpi-forum.org for official MPI document releases). At that time, effort focused in five areas.

Corrections and clarifications (items of type 1 in the above list) were collected in Chapter 3 of the MPI-2 document: “Version 1.2 of MPI.” That chapter also contains the function for identifying the version number. Additions to MPI-1.1 (items of types 2, 3, and 4 in the above list) are in the remaining chapters of the MPI-2 document, and constitute the specification for MPI-2. Items of type 5 in the above list have been moved to a separate document, the “MPI Journal of Development” (JOD), and are not part of the MPI-2 ~~Standard.~~ ==standard.==

- The MPI Journal of Development is not part of the MPI ~~Standard.~~ ==standard.==

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/intro#Background of MPI-1.1, MPI-1.2, and MPI-2.0]]

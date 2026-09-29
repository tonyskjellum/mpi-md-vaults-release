---
title: "Choice"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Choice

Chapter **terms** · in [[versions/v13/sections/terms#Choice|MPI-1.3]], [[versions/v20/sections/terms#Choice|MPI-2.0]], [[versions/v21/sections/terms#Choice|MPI-2.1]], [[versions/v22/sections/terms#Choice|MPI-2.2]], [[versions/v30/sections/terms#Choice|MPI-3.0]], [[versions/v31/sections/terms#Choice|MPI-3.1]], [[versions/v40/sections/terms#Choice|MPI-4.0]], [[versions/v41/sections/terms#Choice|MPI-4.1]], [[versions/v50/sections/terms#Choice|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

MPI functions sometimes use arguments with a *choice* (or union) data type. Distinct calls to the same routine may pass by reference actual arguments of different types. The mechanism for providing such arguments will differ from language to language. For Fortran, the document uses <span class="sans-serif">$`<`$type$`>`$</span> to represent a choice ~~variable,~~ ==variable;== for ~~C,~~ ==C and C++,== we use <span ~~class="sans-serif">(void \*)</span>.~~ ==class="sans-serif">void \*</span>.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~MPI functions sometimes use arguments with a *choice* (or union) data type. Distinct calls to the same routine may pass by reference actual arguments of different types. The mechanism for providing such arguments will differ from language to language. For Fortran, the document uses <span class="sans-serif">$`<`$type$`>`$</span> to represent a choice variable; for C and C++, we use <span class="sans-serif">void \*</span>.~~

==MPI functions sometimes use arguments with a *choice* (or union) data type. Distinct calls to the same routine may pass by reference actual arguments of different types. The mechanism for providing such arguments will differ from language to language. For Fortran with the include file `mpif.h` or the `mpi` module, the document uses <span class="sans-serif">$`<`$type$`>`$</span> to represent a choice variable; with the Fortran `mpi_f08` module, such arguments are declared with the Fortran 2008 + TR 29113 syntax <span class="sans-serif">TYPE(\*), DIMENSION(..)</span>; for C, we use <span class="sans-serif">void \*</span>.==

==> [!warning] Advice to implementors==

==> Implementors can freely choose how to implement choice arguments in the `mpi` module, e.g., with a non-standard compiler-dependent method that has the quality of the call mechanism in the implicit Fortran interfaces, or with the method defined for the `mpi_f08` module. See details in Section [[f90-overview]] on page [[f90-overview]] .==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

MPI functions sometimes use arguments with a *choice* (or union) data type. Distinct calls to the same routine may pass by reference actual arguments of different types. The mechanism for providing such arguments will differ from language to language. For Fortran with the include file `mpif.h` or the `mpi` module, the document uses ~~<span class="sans-serif">$`<`$type$`>`$</span>~~ ==$`<`$`type`$`>`$== to represent a choice variable; with the Fortran `mpi_f08` module, such arguments are declared with the Fortran 2008 + TR 29113 syntax ~~<span class="sans-serif">TYPE(\*), DIMENSION(..)</span>;~~ ==`TYPE(*), DIMENSION(..)`;== for C, we use ~~<span class="sans-serif">void \*</span>.~~ ==`void *`.==

> Implementors can freely choose how to implement choice arguments in the `mpi` module, e.g., with a non-standard compiler-dependent method that has the quality of the call mechanism in the implicit Fortran interfaces, or with the method defined for the `mpi_f08` module. See details in ~~Section [[f90-overview]] on page~~ [[f90-overview]] .

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

MPI functions sometimes use arguments with a *choice* (or union) data type. Distinct calls to the same routine may pass by reference actual arguments of different types. The mechanism for providing such arguments will differ from language to language. For Fortran with the include file `mpif.h` or the `mpi` module, the document uses $`<`$`type`$`>`$ to represent a choice variable; with the Fortran `mpi_f08` module, such arguments are declared with the Fortran 2008 + ~~TR~~ ==TS== 29113 syntax `TYPE(*), DIMENSION(..)`; for C, we use ~~`void *`.~~ ==`void*`.==

> Implementors can freely choose how to implement choice arguments in the `mpi` module, e.g., with a ~~non-standard~~ ==nonstandard== compiler-dependent method that has the quality of the call mechanism in the implicit Fortran interfaces, or with the method defined for the `mpi_f08` module. See details in [[f90-overview]] .

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

MPI functions sometimes use arguments with a *choice* (or union) data type. Distinct calls to the same routine may pass by reference actual arguments of different types. The mechanism for providing such arguments will differ from language to language. For Fortran with the ==(deprecated)== include file `mpif.h` or the `mpi` module, the document uses $`<`$`type`$`>`$ to represent a choice variable; with the Fortran `mpi_f08` module, such arguments are declared with the Fortran ~~2008 + TS 29113~~ ==2018== syntax `TYPE(*), DIMENSION(..)`; for C, we use `void*`.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Choice]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Choice]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Choice]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Choice]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Choice]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Choice]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Choice]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Choice]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Choice]]

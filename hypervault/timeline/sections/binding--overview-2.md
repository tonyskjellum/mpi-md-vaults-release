---
title: "Overview"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Overview

Chapter **binding** · in [[versions/v20/sections/binding#Overview|MPI-2.0]], [[versions/v21/sections/binding#Overview|MPI-2.1]], [[versions/v22/sections/binding#Overview|MPI-2.2]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

==The Fortran MPI-2 language bindings have been designed to be compatible with the== Fortran 90 ~~is the current international Fortran standard. MPI-2 Fortran~~ ==standard (and later). These== bindings are ~~Fortran 90 bindings that~~ in most cases ~~are “Fortran 77 friendly.” That is,~~ ==compatible== with ~~few exceptions (e.g., `KIND`-parameterized types, and the `mpi` module, both of which can be avoided)~~ Fortran ~~77 compilers should be able to compile MPI programs.~~ ==77, implicit-style interfaces.==

> Fortran 90 contains numerous features designed to make it a more “modern” language than Fortran 77. It seems natural that MPI should be able to take advantage of these new features with a set of bindings tailored to Fortran 90. MPI does not (yet) ~~> >~~ use many of these features ~~> >~~ because of a number of technical difficulties.

MPI defines two levels of Fortran support, described in Sections [[f90-basic]] and [[f90-extended]] . ~~A third level of Fortran support is envisioned, but is deferred to future standardization efforts.~~ In the rest of this section, “Fortran” ==and “Fortran 90”== shall refer to ~~Fortran 90 (or~~ ==“Fortran 90” and== its ~~successor)~~ ==successors,== unless qualified.

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Overview]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Overview]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Overview]]

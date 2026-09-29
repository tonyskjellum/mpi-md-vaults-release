---
title: "Inter-language Operability"
chapter: appLang-C++
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/appLang-C++]
---

# Inter-language Operability

Chapter **appLang-C++** · in [[versions/v20/sections/appendix-c++#Inter-language Operability|MPI-2.0]], [[versions/v21/sections/appLang-C++#Inter-language Operability|MPI-2.1]], [[versions/v22/sections/appLang-C++#Inter-language Operability|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~Since there are no C++ `MPI::STATUS_IGNORE` and `MPI::STATUSES_IGNORE` objects, the results of promoting the C or Fortran handles ( [[MPI_STATUS_IGNORE]] and [[MPI_STATUSES_IGNORE]] ) to C++ is undefined.~~

==Since there are no C++ `MPI::STATUS_IGNORE` and `MPI::STATUSES_IGNORE` objects, the==

==result==

==of promoting the C or Fortran handles (MPI_STATUS_IGNORE and MPI_STATUSES_IGNORE) to C++ is undefined.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

of promoting the C or Fortran handles ~~(MPI_STATUS_IGNORE~~ ==(`MPI_STATUS_IGNORE`== and ~~MPI_STATUSES_IGNORE)~~ ==`MPI_STATUSES_IGNORE`)== to C++ is undefined.

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/appendix-c++#Inter-language Operability]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/appLang-C++#Inter-language Operability]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/appLang-C++#Inter-language Operability]]

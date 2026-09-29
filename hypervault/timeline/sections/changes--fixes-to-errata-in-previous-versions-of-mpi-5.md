---
title: "Fixes to Errata in Previous Versions of MPI"
chapter: changes
present_in: ["MPI-5.0"]
tags: [mpi/section, mpi/changes]
---

# Fixes to Errata in Previous Versions of MPI

Chapter **changes** · in [[versions/v50/sections/changes#Fixes to Errata in Previous Versions of MPI|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~1.  Sections [[versions/v31/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] and [[versions/v31/sections/terms#C Binding Issues|C Binding Issues]] on pages [[versions/v31/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] and [[versions/v31/sections/terms#C Binding Issues|C Binding Issues]] , and~~

~~    MPI-2.2 Section 2.6.2 on page 17, lines 41-42, Section 2.6.3 on page 18, lines 15-16, and Section 2.6.4 on page 18, lines 40-41.~~

==1.  Sections [[versions/v31/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] and [[versions/v31/sections/terms#C Binding Issues|C Binding Issues]] on pages [[versions/v31/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] and [[versions/v31/sections/terms#C Binding Issues|C Binding Issues]] , and MPI-2.2 Section 2.6.2 on page 17, lines 41-42, Section 2.6.3 on page 18, lines 15-16, and Section 2.6.4 on page 18, lines 40-41.==

~~    and [[versions/v31/sections/appLang-Const#Defined Constants|Defined Constants]] , and~~

~~    MPI-2.2 Sections 3.2.2, 5.9.2, 13.5.2 Table 13.2, 16.1.16 Table 16.1, and Annex A.1.1 on pages 27, 164, 433, 472 and 513~~

==    and [[versions/v31/sections/appLang-Const#Defined Constants|Defined Constants]] , and MPI-2.2 Sections 3.2.2, 5.9.2, 13.5.2 Table 13.2, 16.1.16 Table 16.1, and Annex A.1.1 on pages 27, 164, 433, 472 and 513==

~~4.  Section [[versions/v31/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v31/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] , and~~

~~    MPI-2.2, Section 7.5.5 on page 257, C++ interface on page 264, line 3.~~

==4.  Section [[versions/v31/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v31/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] , and MPI-2.2, Section 7.5.5 on page 257, C++ interface on page 264, line 3.==

~~5.  Section [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , Table [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , and~~

~~    MPI-2.2, Section 13.5.3, Table 13.2 on page 433.~~

==5.  Section [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , Table [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , and MPI-2.2, Section 13.5.3, Table 13.2 on page 433.==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

1. Sections [[versions/v40/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] and [[versions/v40/sections/terms#C Binding Issues|C Binding Issues]] on pages [[versions/v40/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] and [[versions/v40/sections/terms#C Binding Issues|C Binding Issues]] , and MPI-2.2 Section 2.6.2 on page 17, lines ~~41-42,~~ ==41–42,== Section 2.6.3 on page 18, lines ~~15-16,~~ ==15–16,== and Section 2.6.4 on page 18, lines ~~40-41.~~ ==40–41.==

2. Sections [[versions/v40/sections/pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== Table [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== ,

and Annex [[versions/v40/sections/appLang-Const#Defined Constants|Defined Constants]] on pages [[versions/v40/sections/pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== ,

This is an MPI-2.2 erratum: New named predefined datatypes `MPI_CXX_BOOL`, `MPI_CXX_FLOAT_COMPLEX`, `MPI_CXX_DOUBLE_COMPLEX`, and `MPI_CXX_LONG_DOUBLE_COMPLEX` were added in C and Fortran corresponding to the C++ types `bool`, `std::complex<float>`, `std::complex<double>`, and `std::complex<long double>`. These datatypes also correspond to the deprecated C++ predefined datatypes `MPI::BOOL`, `MPI::COMPLEX`, `MPI::DOUBLE_COMPLEX`, and `MPI::LONG_DOUBLE_COMPLEX`, which were removed in MPI-3.0. The ~~non-standard~~ ==nonstandard== C++ types `Complex<...>` were substituted by the standard types `std::complex<...>`.

5. Section [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== , Table [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== on page [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== , and MPI-2.2, Section 13.5.3, Table 13.2 on page 433.

This was an MPI-2.2 erratum: The `MPI_C_BOOL` ~~“external32”~~ ==`external32`== representation is corrected to a 1-byte size.

MPI-2.2, Annex A.1.1, Table on page 517, lines 34, and ~~37-41.~~ ==37–41.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~6.  MPI-2.2 Section 16.1.16 on page 471, line 45.~~

~~    This is an MPI-2.2 erratum: The constant `MPI::_LONG_LONG` should be `MPI::LONG_LONG`.~~

==6.   MPI-2.2 Section 16.1.16 on page 471, line 45. This is an MPI-2.2 erratum: The constant `MPI::_LONG_LONG` should be `MPI::LONG_LONG`.==

## Text by release

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/changes#Fixes to Errata in Previous Versions of MPI]]

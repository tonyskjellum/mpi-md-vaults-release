---
title: "Fixes to Errata in Previous Versions of MPI"
chapter: changes
present_in: ["MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/changes]
---

# Fixes to Errata in Previous Versions of MPI

Chapter **changes** · in [[versions/v41/sections/changes#Fixes to Errata in Previous Versions of MPI|MPI-4.1]], [[versions/v50/sections/changes#Fixes to Errata in Previous Versions of MPI|MPI-5.0]]

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

~~1.  Sections [[versions/v50/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] and [[versions/v50/sections/terms#C Binding Issues|C Binding Issues]] on pages [[versions/v50/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] and [[versions/v50/sections/terms#C Binding Issues|C Binding Issues]] , and MPI-2.2 Section 2.6.2 on page 17, lines 41–42, Section 2.6.3 on page 18, lines 15–16, and Section 2.6.4 on page 18, lines 40–41.~~

~~    This is an MPI-2 erratum: The scope for the reserved prefix `MPI_` and the C++ namespace `MPI` is now any name as originally intended in MPI-1.~~

~~2.  Sections [[versions/v50/sections/pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , [[versions/v50/sections/io#External Data Representation: external32|External Data Representation: external32]] Table [[versions/v50/sections/io#External Data Representation: external32|External Data Representation: external32]] ,~~

~~    and Annex [[versions/v50/sections/appLang-Const#Defined Constants|Defined Constants]] on pages [[versions/v50/sections/pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , [[versions/v50/sections/io#External Data Representation: external32|External Data Representation: external32]] ,~~

~~    and [[versions/v50/sections/appLang-Const#Defined Constants|Defined Constants]] , and MPI-2.2 Sections 3.2.2, 5.9.2, 13.5.2 Table 13.2, 16.1.16 Table 16.1, and Annex A.1.1 on pages 27, 164, 433, 472 and 513~~

~~    This is an MPI-2.2 erratum: New named predefined datatypes `MPI_CXX_BOOL`, `MPI_CXX_FLOAT_COMPLEX`, `MPI_CXX_DOUBLE_COMPLEX`, and `MPI_CXX_LONG_DOUBLE_COMPLEX` were added in C and Fortran corresponding to the C++ types `bool`, `std::complex<float>`, `std::complex<double>`, and `std::complex<long double>`. These datatypes also correspond to the deprecated C++ predefined datatypes `MPI::BOOL`, `MPI::COMPLEX`, `MPI::DOUBLE_COMPLEX`, and `MPI::LONG_DOUBLE_COMPLEX`, which were removed in MPI-3.0. The nonstandard C++ types `Complex<...>` were substituted by the standard types `std::complex<...>`.~~

~~3.  Sections [[coll-predefined-op]] on pages [[coll-predefined-op]] and MPI-2.2 Section 5.9.2, page 165, line 47.~~

~~    This is an MPI-2.2 erratum: `MPI_C_COMPLEX` was added to the “Complex” reduction group.~~

~~4.  Section [[versions/v50/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v50/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] , and MPI-2.2, Section 7.5.5 on page 257, C++ interface on page 264, line 3.~~

~~    This is an MPI-2.2 erratum: The argument `rank` was removed and `in/outdegree` are now defined as `int& indegree` and `int& outdegree` in the C++ interface of [[versions/v50/API/MPI_DIST_GRAPH_NEIGHBORS_COUNT|MPI_DIST_GRAPH_NEIGHBORS_COUNT]] .~~

~~5.  Section [[versions/v50/sections/io#External Data Representation: external32|External Data Representation: external32]] , Table [[versions/v50/sections/io#External Data Representation: external32|External Data Representation: external32]] on page [[versions/v50/sections/io#External Data Representation: external32|External Data Representation: external32]] , and MPI-2.2, Section 13.5.3, Table 13.2 on page 433.~~

~~    This was an MPI-2.2 erratum: The `MPI_C_BOOL` `external32` representation is corrected to a 1-byte size.~~

~~6.  MPI-2.2 Section 16.1.16 on page 471, line 45.~~

~~    This is an MPI-2.2 erratum: The constant `MPI::_LONG_LONG` should be `MPI::LONG_LONG`.~~

~~7.  Annex [[versions/v50/sections/appLang-Const#Defined Constants|Defined Constants]] on page [[versions/v50/sections/appLang-Const#Defined Constants|Defined Constants]] , Table “Optional datatypes (Fortran),” and~~

~~    MPI-2.2, Annex A.1.1, Table on page 517, lines 34, and 37–41.~~

~~    This is an MPI-2.2 erratum: The C++ datatype handles `MPI::INTEGER16`, `MPI::REAL16`, `MPI::F_COMPLEX4`, `MPI::F_COMPLEX8`, `MPI::F_COMPLEX16`, `MPI::F_COMPLEX32` were added to the table.~~

==1.  Chapters [[versions/v50/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] – [[versions/v50/sections/binding#Language Bindings|Language Bindings]] , Annex [[versions/v50/sections/appLang-Fortran2008#Fortran 2008 Bindings with the mpif08 Module|Fortran 2008 Bindings with the mpif08 Module]] on page [[versions/v50/sections/appLang-Fortran2008#Fortran 2008 Bindings with the mpif08 Module|Fortran 2008 Bindings with the mpif08 Module]] , and Example [[coll-exX-fortran]] on page [[coll-exX-fortran]] , and MPI-3.0 Chapters 3–17, Annex A.3 on page 707, and Example 5.21 on page 187.==

==    Within the `mpi_f08` Fortran support method, `BIND(C)` was removed from all `SUBROUTINE`, `FUNCTION`, and `ABSTRACT INTERFACE` definitions.==

==2.  Section [[versions/v50/sections/pt2pt#Return Status|Return Status]] on page [[versions/v50/sections/pt2pt#Return Status|Return Status]] , and MPI-3.0 Section 3.2.5 on page 30.==

==    The three public fields `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR` of the Fortran derived type `TYPE(MPI_Status)` must be of type `INTEGER`.==

==3.  Section [[versions/v50/sections/pt2pt#Matching Probe|Matching Probe]] on page [[versions/v50/sections/pt2pt#Matching Probe|Matching Probe]] , and MPI-3.0 Section 3.8.2 on page 67.==

==    The flag arguments of the Fortran interfaces of [[versions/v50/API/MPI_IMPROBE|MPI_IMPROBE]] were originally incorrectly defined as `INTEGER` (instead as `LOGICAL`).==

==4.  Section [[versions/v50/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v50/sections/context#Communicator Constructors|Communicator Constructors]] , and MPI-3.0 Section 6.4.2 on page 237.==

==    In the `mpi_f08` binding of [[versions/v50/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , the output argument `newcomm` is declared as `ASYNCHRONOUS`.==

==5.  Section [[versions/v50/sections/context#Communicator Info|Communicator Info]] on page [[versions/v50/sections/context#Communicator Info|Communicator Info]] , and MPI-3.0 Section 6.4.4 on page 248.==

==    In the `mpi_f08` binding of [[versions/v50/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] , the `INTENT` of `comm` is `IN`, and the optional output argument `ierror` was missing.==

==6.  Section [[versions/v50/sections/topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] on page [[versions/v50/sections/topol#Neighborhood Collective Communication on Virtual Topologies|Neighborhood Collective Communication on Virtual Topologies]] , and MPI-3.0 Sections 7.6, on pages 314.==

==    In the case of virtual general graph topolgies (created with [[versions/v50/API/MPI_CART_CREATE|MPI_CART_CREATE]] ), the use of neighborhood collective communication is restricted to adjacency matrices with the number of edges between any two processes is defined to be the same for both processes (i.e., with a symmetric adjacency matrix).==

==7.  Section [[versions/v50/sections/inquiry#Version Inquiries|Version Inquiries]] on page [[versions/v50/sections/inquiry#Version Inquiries|Version Inquiries]] , and MPI-3.0 Section 8.1.1 on page 335.==

==    In the `mpi_f08` binding of [[versions/v50/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] , a typo in the `resultlen` argument was corrected.==

==8.   Sections [[versions/v50/sections/inquiry#Memory Allocation|Memory Allocation]] ( [[versions/v50/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] and [[MPI_ALLOC_MEM_CPTR]] ),\     [[versions/v50/sections/one-side#Window That Allocates Memory|Window That Allocates Memory]] ( [[versions/v50/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] and [[MPI_WIN_ALLOCATE_CPTR]] ),\     [[versions/v50/sections/one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] ( [[versions/v50/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] and [[MPI_WIN_ALLOCATE_SHARED_CPTR]] ),\     [[versions/v50/sections/one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] ( [[versions/v50/API/MPI_WIN_SHARED_QUERY|MPI_WIN_SHARED_QUERY]] and [[MPI_WIN_SHARED_QUERY_CPTR]] ),\     [[versions/v50/sections/tools#Requirements|Requirements]] and [[versions/v50/sections/tools#Complications|Complications]] (Profiling interface), and corresponding sections in MPI-3.0. The linker name concept was substituted by defining specific procedure names.==

==9.  Section [[versions/v50/sections/one-side#Window Creation|Window Creation]] on page [[versions/v50/sections/one-side#Window Creation|Window Creation]] , and MPI-3.0 Section 11.2.2 on page 407.==

==    The `same_size` info key can be used with all window flavors, and requires that all processes in the process group of the communicator have provided this info key with the same value.==

==10. Section [[versions/v50/sections/one-side#Accumulate Functions|Accumulate Functions]] on page [[versions/v50/sections/one-side#Accumulate Functions|Accumulate Functions]] , and MPI-3.0 Section 11.3.4 on page 424.==

==    Origin buffer arguments to [[versions/v50/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] are ignored when the `MPI_NO_OP` operation is used.==

==11. Section [[versions/v50/sections/one-side#Accumulate Functions|Accumulate Functions]] on page [[versions/v50/sections/one-side#Accumulate Functions|Accumulate Functions]] , and MPI-3.0 Section 11.3.4 on page 424.==

==    Clarify the roles of origin, result, and target communication parameters in [[versions/v50/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] .==

==12. Section [[versions/v50/sections/tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] on page [[versions/v50/sections/tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] , and MPI-3.0 Section 14.3 on page 561==

==    New paragraph and advice to users clarifying intent of variable names in the tools information interface.==

==13. Section [[versions/v50/sections/tools#Convention for Returning Strings|Convention for Returning Strings]] on page [[versions/v50/sections/tools#Convention for Returning Strings|Convention for Returning Strings]] , and MPI-3.0 Section 14.3.3 on page 563.==

==    New paragraph clarifying variable name equivalence in the tools information interface.==

==14. Sections [[versions/v50/sections/tools#Control Variables|Control Variables]] , [[versions/v50/sections/tools#Performance Variables|Performance Variables]] , and [[versions/v50/sections/tools#Variable Categorization|Variable Categorization]] on pages [[versions/v50/sections/tools#Control Variables|Control Variables]] , [[versions/v50/sections/tools#Performance Variables|Performance Variables]] , and [[versions/v50/sections/tools#Variable Categorization|Variable Categorization]] , and==

==    MPI-3.0 Sections 14.3.6, 14.3.7, and 14.3.8 on pages 567, 573, and 584.==

==    In functions [[versions/v50/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] , [[versions/v50/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] , and [[versions/v50/API/MPI_T_CATEGORY_GET_INFO|MPI_T_CATEGORY_GET_INFO]] , clarification of parameters that must be identical for equivalent control variable / performance variable / category names across connected processes.==

==15. Section [[versions/v50/sections/tools#Performance Variables|Performance Variables]] on page [[versions/v50/sections/tools#Performance Variables|Performance Variables]] , and MPI-3.0 Section 14.3.7 on page 573.==

==    Clarify return code==

==    of `MPI_T_PVAR\_{START,STOP,RESET}` routines.==

==16. Section [[versions/v50/sections/tools#Performance Variables|Performance Variables]] on page [[versions/v50/sections/tools#Performance Variables|Performance Variables]] , and MPI-3.0 Section 14.3.7 on page 579, line 7.==

==    Clarify the return code when bad handle is passed to==

==    an `MPI_T_PVAR\_\*` routine.==

==17. Section [[f90-basic]] on page [[f90-basic]] , and MPI-3.0 Section 17.1.4 on page 603.==

==    The advice to implementors at the end of the section was rewritten and moved into the following section.==

==18. Section [[versions/v50/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] on page [[versions/v50/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] , and MPI-3.0 Section 17.1.5 on page 605.==

==    The section was fully rewritten. The linker name concept was substituted by defining specific procedure names.==

==19. Section [[versions/v50/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page [[versions/v50/sections/binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] , and MPI-3.0 Section 17.1.6 on page 611.==

==    The requirements on `BIND(C)` procedure interfaces were removed.==

==20. Annexes [[versions/v50/sections/appLang-C#C Bindings|C Bindings]] , [[versions/v50/sections/appLang-Fortran2008#Fortran 2008 Bindings with the mpif08 Module|Fortran 2008 Bindings with the mpif08 Module]] , and [[versions/v50/sections/appLang-Fortran#Fortran Bindings with mpif.h or the mpi Module|Fortran Bindings with mpif.h or the mpi Module]] on pages [[versions/v50/sections/appLang-C#C Bindings|C Bindings]] , [[versions/v50/sections/appLang-Fortran2008#Fortran 2008 Bindings with the mpif08 Module|Fortran 2008 Bindings with the mpif08 Module]] , and [[versions/v50/sections/appLang-Fortran#Fortran Bindings with mpif.h or the mpi Module|Fortran Bindings with mpif.h or the mpi Module]] , and==

==    MPI-3.0 Annexes A.2, A.3, and A.4 on pages 685, 707, and 756.==

==    The predefined callback [[versions/v50/API/MPI_CONVERSION_FN_NULL|MPI_CONVERSION_FN_NULL]] was added to all three annexes.==

==21.  Annex [[versions/v50/sections/appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] on page [[versions/v50/sections/appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] , and MPI-3.0 Annex A.3.4 on page 724. In the `mpi_f08` binding of\     `MPI\_{COMM$`|`$TYPE$`|`$WIN}\_{DUP$`|`$NULL_COPY$`|`$NULL_DELETE}\_FN` , all `INTENT(...)` information was removed.==

## Text by release

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/changes#Fixes to Errata in Previous Versions of MPI]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/changes#Fixes to Errata in Previous Versions of MPI]]

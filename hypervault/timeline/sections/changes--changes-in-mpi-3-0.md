---
title: "Changes in MPI-3.0"
chapter: changes
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/changes]
---

# Changes in MPI-3.0

Chapter **changes** · in [[versions/v30/sections/changes#Changes in MPI-3.0|MPI-3.0]], [[versions/v31/sections/changes#Changes in MPI-3.0|MPI-3.1]], [[versions/v40/sections/changes#Changes in MPI-3.0|MPI-4.0]], [[versions/v41/sections/changes#Changes in MPI-3.0|MPI-4.1]], [[versions/v50/sections/changes#Changes in MPI-3.0|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

In the C language bindings, the array-arguments’ interfaces were modified to consistently use use ~~\[\]~~ ==`[``]`== instead of `*`.

~~    Within the `mpi_08` Fortran module, the status was defined as `TYPE(MPI_Status)`.~~

~~    Additionally, within both the `mpi` and the `mpi_f08` modules, the constants `MPI_STATUS_SIZE`, `MPI_SOURCE`, `MPI_TAG`, `MPI_ERROR`, and `TYPE(MPI_Status)` are defined.~~

~~    New conversion routines were added: [[versions/v31/API/MPI_STATUS_F2F08|MPI_STATUS_F2F08]] , [[versions/v31/API/MPI_STATUS_F082F|MPI_STATUS_F082F]] , `MPI_Status_c2f08`, and `MPI_Status_f082c`,~~

~~    In `mpi.h`, the new type `MPI_F08_status`, and the external variables `MPI_F08_STATUS_IGNORE` and `MPI_F08_STATUSES_IGNORE` were added.~~

==    Within the `mpi_08` Fortran module, the status was defined as `TYPE(MPI_Status)`. Additionally, within both the `mpi` and the `mpi_f08` modules, the constants `MPI_STATUS_SIZE`, `MPI_SOURCE`, `MPI_TAG`, `MPI_ERROR`, and `TYPE(MPI_Status)` are defined. New conversion routines were added: [[versions/v31/API/MPI_STATUS_F2F08|MPI_STATUS_F2F08]] , [[versions/v31/API/MPI_STATUS_F082F|MPI_STATUS_F082F]] , `MPI_Status_c2f08`, and `MPI_Status_f082c`, In `mpi.h`, the new type `MPI_F08_status`, and the external variables `MPI_F08_STATUS_IGNORE` and `MPI_F08_STATUSES_IGNORE` were added.==

~~    [[MPI_ERRHANDLER_CREATE]] .~~

~~    For consistency reasons, `INOUBUF` was changed to `INOUTBUF` in [[versions/v31/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] , and `intracomm` to `newintracomm` in [[versions/v31/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] .~~

==    [[MPI_ERRHANDLER_CREATE]] . For consistency reasons, `INOUBUF` was changed to `INOUTBUF` in [[versions/v31/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] , and `intracomm` to `newintracomm` in [[versions/v31/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] .==

~~Section 6.7.2 on page 226.~~ It was clarified that in Fortran, the flag values returned by a `comm_copy_attr_fn` callback,

In some routines, the Fortran callback prototype names were changed from ~~[[..._FN]]~~ ==`$`...`$\_FN`== to ~~[[..._FUNCTION]]~~ ==`$`...`$\_FUNCTION`== to be consistent with the other language bindings.

### MPI-3.1 → MPI-4.0  (9 changed paragraphs)

1. Section [[versions/v40/sections/terms#Deprecated and Removed ~~Names and Functions|Deprecated~~ ==Interfaces|Deprecated== and Removed ~~Names and Functions]]~~ ==Interfaces]]== on page [[versions/v40/sections/terms#Deprecated and Removed ~~Names and Functions|Deprecated~~ ==Interfaces|Deprecated== and Removed ~~Names and Functions]]~~ ==Interfaces]]== , Section [[sec-rm-cpp]] on page [[sec-rm-cpp]] and all other chapters.

2. Section [[versions/v40/sections/terms#Deprecated and Removed ~~Names and Functions|Deprecated~~ ==Interfaces|Deprecated== and Removed ~~Names and Functions]]~~ ==Interfaces]]== on page [[versions/v40/sections/terms#Deprecated and Removed ~~Names and Functions|Deprecated~~ ==Interfaces|Deprecated== and Removed ~~Names and Functions]]~~ ==Interfaces]]== , Section [[versions/v40/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] on page [[versions/v40/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] and Section [[sec-rm-mpii]] on page [[sec-rm-mpii]] .

New inquiry functions, [[versions/v40/API/MPI_TYPE_SIZE_X|MPI_TYPE_SIZE_X]] , [[versions/v40/API/MPI_TYPE_GET_EXTENT_X|MPI_TYPE_GET_EXTENT_X]] , [[versions/v40/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI_TYPE_GET_TRUE_EXTENT_X]] , and [[versions/v40/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] , return their results as an `MPI_Count` value, which is a new type large enough to represent element counts in memory, file views, etc. A new function, [[versions/v40/API/MPI_STATUS_SET_ELEMENTS_X|MPI_STATUS_SET_ELEMENTS_X]] , modifies the opaque part of an `MPI_Status` object so that a call to [[versions/v40/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] returns the provided `MPI_Count` value (in Fortran, ~~`INTEGER (KIND=MPI_COUNT_KIND)`).~~ ==`INTEGER(KIND=MPI_COUNT_KIND)`).== The corresponding predefined datatype is `MPI_COUNT`.

7. Chapter [[versions/v40/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] on page [[versions/v40/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] ~~until~~ ==through== Chapter [[versions/v40/sections/binding#Language Bindings|Language Bindings]] on page [[versions/v40/sections/binding#Language Bindings|Language Bindings]] .

18. Section ~~[[versions/v40/sections/context#Inter-communicator Operations|Inter-communicator~~ ==[[context#Inter-Communicator Operations|Inter-Communicator== Operations]] on page ~~[[versions/v40/sections/context#Inter-communicator Operations|Inter-communicator~~ ==[[context#Inter-Communicator Operations|Inter-Communicator== Operations]] .

22. Section ~~[[versions/v40/sections/inquiry#Startup|Startup]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== on page ~~[[versions/v40/sections/inquiry#Startup|Startup]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== and Section ~~[[versions/v40/sections/ei#Initialization|Initialization]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== on page ~~[[versions/v40/sections/ei#Initialization|Initialization]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== .

23. Section ~~[[versions/v40/sections/inquiry#Startup|Startup]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== on page ~~[[versions/v40/sections/inquiry#Startup|Startup]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== .

Within the `mpi_08` Fortran module, choice buffers were defined as assumed-type and assumed-rank according to Fortran 2008 TS 29113 , and the compile-time constant `MPI_SUBARRAYS_SUPPORTED` was set to `.TRUE.`. With this, Fortran subscript triplets can be used in nonblocking MPI operations; vector subscripts are not supported in nonblocking operations. If the compiler does not support this Fortran ~~TR~~ ==TS== 29113 feature, the constant is set to `.FALSE.`.

[[versions/v40/API/MPI_TYPE_SET_ATTR|MPI_TYPE_SET_ATTR]] , [[versions/v40/API/MPI_TYPE_GET_ATTR|MPI_TYPE_GET_ATTR]] , [[versions/v40/API/MPI_TYPE_DELETE_ATTR|MPI_TYPE_DELETE_ATTR]] , [[versions/v40/API/MPI_TYPE_SET_NAME|MPI_TYPE_SET_NAME]] , [[versions/v40/API/MPI_TYPE_GET_NAME|MPI_TYPE_GET_NAME]] , [[versions/v40/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] , the callback prototype definition ~~[[versions/v40/API/MPI_TYPE_CREATE_KEYVAL|MPI_Type_delete_attr_function]] ,~~ ==`MPI_Type_delete_attr_function`,== and the predefined callback function

With the `mpi` and `mpi_f08` Fortran modules, [[versions/v40/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] now also supports `TYPE(C_PTR)` C-pointers instead of only returning an address-sized integer that may be usable together with a ~~non-standard~~ ==nonstandard== Cray-pointer.

### MPI-4.0 → MPI-4.1  (13 changed paragraphs)

New inquiry functions, [[versions/v41/API/MPI_TYPE_SIZE_X|MPI_TYPE_SIZE_X]] , [[versions/v41/API/MPI_TYPE_GET_EXTENT_X|MPI_TYPE_GET_EXTENT_X]] , [[versions/v41/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI_TYPE_GET_TRUE_EXTENT_X]] , and [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] , return their results as an `MPI_Count` value, which is a new type large enough to represent element counts in memory, file views, etc. A new function, [[versions/v41/API/MPI_STATUS_SET_ELEMENTS_X|MPI_STATUS_SET_ELEMENTS_X]] , modifies the opaque part of an `MPI_Status` object so that a call to [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] returns the provided `MPI_Count` value (in Fortran, ~~`INTEGER(KIND=MPI_COUNT_KIND)`).~~ ==`COUNT`).== The corresponding predefined datatype is `MPI_COUNT`.

In the C language bindings, the array-arguments’ interfaces were modified to consistently use ~~use~~ `[``]` instead of `*`.

8. Sections [[versions/v41/sections/pt2pt#Return Status|Return Status]] , [[versions/v41/sections/datatypes#Address and Size ~~Functions|Address~~ ==Procedures|Address== and Size ~~Functions]]~~ ==Procedures]]== , [[versions/v41/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[versions/v41/sections/datatypes#Pack and Unpack|Pack and Unpack]] on pages [[versions/v41/sections/pt2pt#Return Status|Return Status]] , [[versions/v41/sections/datatypes#Address and Size ~~Functions|Address~~ ==Procedures|Address== and Size ~~Functions]]~~ ==Procedures]]== , [[versions/v41/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[versions/v41/sections/datatypes#Pack and Unpack|Pack and Unpack]] .

`MPI_STATUS_IGNORE` can ==also== be ~~also~~ used in [[versions/v41/API/MPI_IPROBE|MPI_IPROBE]] , [[versions/v41/API/MPI_PROBE|MPI_PROBE]] , [[versions/v41/API/MPI_IMPROBE|MPI_IMPROBE]] , and [[versions/v41/API/MPI_MPROBE|MPI_MPROBE]] .

10. Section [[versions/v41/sections/pt2pt#Probe and Cancel|Probe and Cancel]] on page [[versions/v41/sections/pt2pt#Probe and Cancel|Probe and Cancel]] and Section [[versions/v41/sections/pt2pt#Null ==MPI== Processes|Null ==MPI== Processes]] on page [[versions/v41/sections/pt2pt#Null ==MPI== Processes|Null ==MPI== Processes]] .

21. Section [[versions/v41/sections/topol#Neighborhood Collective Communication on ~~Process~~ ==Virtual== Topologies|Neighborhood Collective Communication on ~~Process~~ ==Virtual== Topologies]] on page [[versions/v41/sections/topol#Neighborhood Collective Communication on ~~Process~~ ==Virtual== Topologies|Neighborhood Collective Communication on ~~Process~~ ==Virtual== Topologies]] and Section [[versions/v41/sections/topol#Nonblocking Neighborhood Communication on Process Topologies|Nonblocking Neighborhood Communication on Process Topologies]] on page [[versions/v41/sections/topol#Nonblocking Neighborhood Communication on Process Topologies|Nonblocking Neighborhood Communication on Process Topologies]] .

The new ~~`mpi_08`~~ ==`mpi_f08`== Fortran module was introduced.

Handles to opaque objects were defined as named types within the ~~`mpi_08`~~ ==`mpi_f08`== Fortran module. The operators `.EQ.`, `.NE.`, `==`, and `/=` were overloaded to allow the comparison of these handles. The handle types and the overloaded operators are also available through the `mpi` Fortran module.

Within the ~~`mpi_08`~~ ==`mpi_f08`== Fortran module, choice buffers were defined as assumed-type and assumed-rank according to Fortran 2008 ==with== TS 29113 , and the compile-time constant `MPI_SUBARRAYS_SUPPORTED` was set to `.TRUE.`. With this, Fortran subscript triplets can be used in nonblocking MPI operations; vector subscripts are not supported in nonblocking operations. If the compiler does not support this Fortran TS 29113 feature, the constant is set to `.FALSE.`.

The `ierror` dummy arguments are `OPTIONAL` within the ~~`mpi_08`~~ ==`mpi_f08`== Fortran module.

Within the ~~`mpi_08`~~ ==`mpi_f08`== Fortran module, the status was defined as `TYPE(MPI_Status)`. Additionally, within both the `mpi` and the `mpi_f08` modules, the constants `MPI_STATUS_SIZE`, `MPI_SOURCE`, `MPI_TAG`, `MPI_ERROR`, and `TYPE(MPI_Status)` are defined. New conversion routines were added: [[versions/v41/API/MPI_STATUS_F2F08|MPI_STATUS_F2F08]] , [[versions/v41/API/MPI_STATUS_F082F|MPI_STATUS_F082F]] , `MPI_Status_c2f08`, and `MPI_Status_f082c`, In `mpi.h`, the new type `MPI_F08_status`, and the external variables `MPI_F08_STATUS_IGNORE` and `MPI_F08_STATUSES_IGNORE` were added.

33. Sections [[versions/v41/sections/datatypes#Duplicating a Datatype|Duplicating a Datatype]] , [[versions/v41/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] , ~~[[versions/v41/sections/coll#Process-Local Reduction|Process-Local~~ ==[[coll#MPI Process-Local Reduction|MPI Process-Local== Reduction]] , [[versions/v41/sections/context#Datatypes|Datatypes]] , [[versions/v41/sections/context#Naming Objects|Naming Objects]] , [[versions/v41/sections/inquiry#Error Handlers for Communicators|Error Handlers for Communicators]] , [[versions/v41/sections/inquiry#Error Handlers for Windows|Error Handlers for Windows]] , [[versions/v41/sections/inquiry#Error Handlers for Files|Error Handlers for Files]] , [[versions/v41/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] , [[f90-types]] on pages [[versions/v41/sections/datatypes#Duplicating a Datatype|Duplicating a Datatype]] , [[versions/v41/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] , ~~[[versions/v41/sections/coll#Process-Local Reduction|Process-Local~~ ==[[coll#MPI Process-Local Reduction|MPI Process-Local== Reduction]] , [[versions/v41/sections/context#Datatypes|Datatypes]] , [[versions/v41/sections/context#Naming Objects|Naming Objects]] , [[versions/v41/sections/inquiry#Error Handlers for Communicators|Error Handlers for Communicators]] , [[versions/v41/sections/inquiry#Error Handlers for Windows|Error Handlers for Windows]] , [[versions/v41/sections/inquiry#Error Handlers for Files|Error Handlers for Files]] , [[versions/v41/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] , and [[f90-types]] . In some routines, the dummy argument names were changed because they were identical to the Fortran keywords `TYPE` and `FUNCTION`. The new dummy argument names must be used because the `mpi` and ~~`mpi_08`~~ ==`mpi_f08`== modules guarantee keyword-based actual argument lists. The argument name `type` was changed

Within the ~~`mpi_08`~~ ==`mpi_f08`== Fortran module, dummy arguments are now declared with `INTENT=IN`, `OUT`, or `INOUT` as defined in the ~~`mpi_08`~~ ==`mpi_f08`== interfaces.

41. Section [[versions/v41/sections/appLang-Const#Defined Constants|Defined Constants]] , Table ~~“*Predefined functions*”~~ ==**Predefined functions**== on page [[versions/v41/sections/appLang-Const#Defined Constants|Defined Constants]] , Section [[versions/v41/sections/appLang-Const#Prototype Definitions|Prototype Definitions]] on page [[versions/v41/sections/appLang-Const#Prototype Definitions|Prototype Definitions]] , and Section [[versions/v41/sections/appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] on page [[versions/v41/sections/appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] .

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~2.  Section [[versions/v50/sections/terms#Deprecated and Removed Interfaces|Deprecated and Removed Interfaces]] on page [[versions/v50/sections/terms#Deprecated and Removed Interfaces|Deprecated and Removed Interfaces]] , Section [[versions/v50/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] on page [[versions/v50/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] and Section [[sec-rm-mpii]] on page [[sec-rm-mpii]] .~~

~~    The deprecated functions [[MPI_TYPE_HVECTOR]] , [[MPI_TYPE_HINDEXED]] , [[MPI_TYPE_STRUCT]] , [[MPI_ADDRESS]] , [[MPI_TYPE_EXTENT]] , [[MPI_TYPE_LB]] , [[MPI_TYPE_UB]] , [[MPI_ERRHANDLER_CREATE]] (and its callback function prototype `MPI_Handler_function`), [[MPI_ERRHANDLER_SET]] , [[MPI_ERRHANDLER_GET]] , the deprecated special datatype handles `MPI_LB`, `MPI_UB`, and the constants `MPI_COMBINER_HINDEXED_INTEGER`, `MPI_COMBINER_HVECTOR_INTEGER`, `MPI_COMBINER_STRUCT_INTEGER` were removed from the standard. This change may affect backward compatibility.~~

==2.   Section [[versions/v50/sections/terms#Deprecated and Removed Interfaces|Deprecated and Removed Interfaces]] on page [[versions/v50/sections/terms#Deprecated and Removed Interfaces|Deprecated and Removed Interfaces]] , Section [[versions/v50/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] on page [[versions/v50/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] and Section [[sec-rm-mpii]] on page [[sec-rm-mpii]] . The deprecated functions [[MPI_TYPE_HVECTOR]] , [[MPI_TYPE_HINDEXED]] , [[MPI_TYPE_STRUCT]] , [[MPI_ADDRESS]] , [[MPI_TYPE_EXTENT]] , [[MPI_TYPE_LB]] , [[MPI_TYPE_UB]] , [[MPI_ERRHANDLER_CREATE]] (and its callback function prototype `MPI_Handler_function`), [[MPI_ERRHANDLER_SET]] , [[MPI_ERRHANDLER_GET]] , the deprecated special datatype handles `MPI_LB`, `MPI_UB`, and the constants `MPI_COMBINER_HINDEXED_INTEGER`, `MPI_COMBINER_HVECTOR_INTEGER`, `MPI_COMBINER_STRUCT_INTEGER` were removed from the standard. This change may affect backward compatibility.==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/changes#Changes in MPI-3.0]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/changes#Changes in MPI-3.0]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/changes#Changes in MPI-3.0]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/changes#Changes in MPI-3.0]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/changes#Changes in MPI-3.0]]

---
title: "Changes in MPI-4.0"
chapter: changes
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/changes]
---

# Changes in MPI-4.0

Chapter **changes** · in [[versions/v40/sections/changes#Changes in MPI-4.0|MPI-4.0]], [[versions/v41/sections/changes#Changes in MPI-4.0|MPI-4.1]], [[versions/v50/sections/changes#Changes in MPI-4.0|MPI-5.0]]

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

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~1.  Section [[versions/v40/sections/terms#Deprecated and Removed Names and Functions|Deprecated and Removed Names and Functions]] on page [[versions/v40/sections/terms#Deprecated and Removed Names and Functions|Deprecated and Removed Names and Functions]] , Section [[sec-rm-cpp]] on page [[sec-rm-cpp]] and all other chapters.~~

~~    The C++ bindings were removed from the standard. See errata in Section [[versions/v40/sections/changes#Fixes to Errata in Previous Versions of MPI|Fixes to Errata in Previous Versions of MPI]] on page [[versions/v40/sections/changes#Fixes to Errata in Previous Versions of MPI|Fixes to Errata in Previous Versions of MPI]] for the latest changes to the MPI C++ binding defined in MPI-2.2. This change may affect backward compatibility.~~

~~2.  Section [[versions/v40/sections/terms#Deprecated and Removed Names and Functions|Deprecated and Removed Names and Functions]] on page [[versions/v40/sections/terms#Deprecated and Removed Names and Functions|Deprecated and Removed Names and Functions]] , Section [[versions/v40/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] on page [[versions/v40/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] and Section [[sec-rm-mpii]] on page [[sec-rm-mpii]] .~~

~~    The deprecated functions [[MPI_TYPE_HVECTOR]] , [[MPI_TYPE_HINDEXED]] , [[MPI_TYPE_STRUCT]] , [[MPI_ADDRESS]] , [[MPI_TYPE_EXTENT]] , [[MPI_TYPE_LB]] , [[MPI_TYPE_UB]] , [[MPI_ERRHANDLER_CREATE]] (and its callback function prototype `MPI_Handler_function`), [[MPI_ERRHANDLER_SET]] , [[MPI_ERRHANDLER_GET]] , the deprecated special datatype handles `MPI_LB`, `MPI_UB`, and the constants `MPI_COMBINER_HINDEXED_INTEGER`, `MPI_COMBINER_HVECTOR_INTEGER`, `MPI_COMBINER_STRUCT_INTEGER` were removed from the standard. This change may affect backward compatibility.~~

~~3.  Section [[terms-procedure-specification]] on page [[terms-procedure-specification]] .~~

~~    Clarified parameter usage for IN parameters. C bindings are now const-correct where backward compatibility is preserved.~~

~~4.  Section [[versions/v40/sections/terms#Named Constants|Named Constants]] on page [[versions/v40/sections/terms#Named Constants|Named Constants]] and Section [[versions/v40/sections/topol#Distributed Graph Constructor|Distributed Graph Constructor]] on page [[versions/v40/sections/topol#Distributed Graph Constructor|Distributed Graph Constructor]] .~~

~~    The recommended C implementation value for `MPI_UNWEIGHTED` changed from NULL to non-NULL. An additional weight array constant (`MPI_WEIGHTS_EMPTY`) was introduced.~~

~~5.  Section [[versions/v40/sections/terms#Named Constants|Named Constants]] on page [[versions/v40/sections/terms#Named Constants|Named Constants]] and Section [[versions/v40/sections/inquiry#Version Inquiries|Version Inquiries]] on page [[versions/v40/sections/inquiry#Version Inquiries|Version Inquiries]] .~~

~~    Added the new routine [[versions/v40/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] to query library specific versions, and the new constant `MPI_MAX_LIBRARY_VERSION_STRING`.~~

~~6.  Sections [[versions/v40/sections/terms#Counts|Counts]] , [[versions/v40/sections/pt2pt#Message Data|Message Data]] , [[versions/v40/sections/pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , on pages [[versions/v40/sections/terms#Counts|Counts]] , [[versions/v40/sections/pt2pt#Message Data|Message Data]] , [[versions/v40/sections/pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , Sections [[versions/v40/sections/datatypes#Derived Datatypes|Derived Datatypes]] , [[versions/v40/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , [[versions/v40/sections/datatypes#True Extent of Datatypes|True Extent of Datatypes]] , [[versions/v40/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[func-mpi-status-set-elements-x]] on pages [[versions/v40/sections/datatypes#Derived Datatypes|Derived Datatypes]] , [[versions/v40/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , [[versions/v40/sections/datatypes#True Extent of Datatypes|True Extent of Datatypes]] , [[versions/v40/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[func-mpi-status-set-elements-x]] , and Annex [[versions/v40/sections/appLang-Const#Defined Constants|Defined Constants]] on page [[versions/v40/sections/appLang-Const#Defined Constants|Defined Constants]] .~~

~~    New inquiry functions, [[versions/v40/API/MPI_TYPE_SIZE_X|MPI_TYPE_SIZE_X]] , [[versions/v40/API/MPI_TYPE_GET_EXTENT_X|MPI_TYPE_GET_EXTENT_X]] , [[versions/v40/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI_TYPE_GET_TRUE_EXTENT_X]] , and [[versions/v40/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] , return their results as an `MPI_Count` value, which is a new type large enough to represent element counts in memory, file views, etc. A new function, [[versions/v40/API/MPI_STATUS_SET_ELEMENTS_X|MPI_STATUS_SET_ELEMENTS_X]] , modifies the opaque part of an `MPI_Status` object so that a call to [[versions/v40/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] returns the provided `MPI_Count` value (in Fortran, `INTEGER (KIND=MPI_COUNT_KIND)`). The corresponding predefined datatype is `MPI_COUNT`.~~

~~7.  Chapter [[versions/v40/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] on page [[versions/v40/sections/pt2pt#Point-to-Point Communication|Point-to-Point Communication]] until Chapter [[versions/v40/sections/binding#Language Bindings|Language Bindings]] on page [[versions/v40/sections/binding#Language Bindings|Language Bindings]] .~~

~~    In the C language bindings, the array-arguments’ interfaces were modified to consistently use use `[``]` instead of `*`.~~

~~    Exceptions are [[versions/v40/API/MPI_INIT|MPI_INIT]] , which continues to use `char ***argv` (correct because of subtle rules regarding the use of the `&` operator with `char *argv[]`), and [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] , which is changed to be consistent with [[versions/v40/API/MPI_INIT|MPI_INIT]] .~~

~~8.  Sections [[versions/v40/sections/pt2pt#Return Status|Return Status]] , [[versions/v40/sections/datatypes#Address and Size Functions|Address and Size Functions]] , [[versions/v40/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[versions/v40/sections/datatypes#Pack and Unpack|Pack and Unpack]] on pages [[versions/v40/sections/pt2pt#Return Status|Return Status]] , [[versions/v40/sections/datatypes#Address and Size Functions|Address and Size Functions]] , [[versions/v40/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[versions/v40/sections/datatypes#Pack and Unpack|Pack and Unpack]] .~~

~~    The functions [[versions/v40/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v40/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] were defined to set the `count` argument to `MPI_UNDEFINED` when that argument would overflow. The functions [[versions/v40/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] and [[versions/v40/API/MPI_TYPE_SIZE|MPI_TYPE_SIZE]] were defined to set the `size` argument to `MPI_UNDEFINED` when that argument would overflow. In all other MPI-2.2 routines, the type and semantics of the count arguments remain unchanged, i.e., `int` or `INTEGER`.~~

~~9.  Section [[versions/v40/sections/pt2pt#Passing MPISTATUSIGNORE for Status|Passing MPISTATUSIGNORE for Status]] on page [[versions/v40/sections/pt2pt#Passing MPISTATUSIGNORE for Status|Passing MPISTATUSIGNORE for Status]] , and Section [[versions/v40/sections/pt2pt#Probe and Cancel|Probe and Cancel]] on page [[versions/v40/sections/pt2pt#Probe and Cancel|Probe and Cancel]] .~~

~~    `MPI_STATUS_IGNORE` can be also used in [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , [[versions/v40/API/MPI_PROBE|MPI_PROBE]] , [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] , and [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] .~~

~~10. Section [[versions/v40/sections/pt2pt#Probe and Cancel|Probe and Cancel]] on page [[versions/v40/sections/pt2pt#Probe and Cancel|Probe and Cancel]] and Section [[versions/v40/sections/pt2pt#Null Processes|Null Processes]] on page [[versions/v40/sections/pt2pt#Null Processes|Null Processes]] .~~

~~    The use of `MPI_PROC_NULL` in probe operations was clarified. A special predefined message `MPI_MESSAGE_NO_PROC` was defined for the use of matching probe (i.e., the new [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] ) with `MPI_PROC_NULL`.~~

~~11. Sections [[versions/v40/sections/pt2pt#Matching Probe|Matching Probe]] , [[versions/v40/sections/pt2pt#Matched Receives|Matched Receives]] , [[versions/v40/sections/binding#Transfer of Handles|Transfer of Handles]] , [[versions/v40/sections/appLang-Const#Defined Constants|Defined Constants]] on pages [[versions/v40/sections/pt2pt#Matching Probe|Matching Probe]] , [[versions/v40/sections/pt2pt#Matched Receives|Matched Receives]] , [[versions/v40/sections/binding#Transfer of Handles|Transfer of Handles]] , [[versions/v40/sections/appLang-Const#Defined Constants|Defined Constants]] .~~

~~    Like [[versions/v40/API/MPI_PROBE|MPI_PROBE]] and [[versions/v40/API/MPI_IPROBE|MPI_IPROBE]] , the new [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] operations allow incoming messages to be queried without actually receiving them, except that [[versions/v40/API/MPI_MPROBE|MPI_MPROBE]] and [[versions/v40/API/MPI_IMPROBE|MPI_IMPROBE]] provide a mechanism to receive the specific message with the new routines [[versions/v40/API/MPI_MRECV|MPI_MRECV]] and [[versions/v40/API/MPI_IMRECV|MPI_IMRECV]] regardless of other intervening probe or receive operations. The opaque object `MPI_Message`, the null handle `MPI_MESSAGE_NULL`, and the conversion functions `MPI_Message_c2f` and `MPI_Message_f2c` were defined.~~

~~12. Section [[versions/v40/sections/datatypes#Datatype Constructors|Datatype Constructors]] on page [[versions/v40/sections/datatypes#Datatype Constructors|Datatype Constructors]] and Section [[versions/v40/sections/datatypes#Decoding a Datatype|Decoding a Datatype]] on page [[versions/v40/sections/datatypes#Decoding a Datatype|Decoding a Datatype]] .~~

~~    The routine [[versions/v40/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] and constant `MPI_COMBINER_HINDEXED_BLOCK` were added.~~

~~13. Chapter [[versions/v40/sections/coll#Collective Communication|Collective Communication]] on page [[versions/v40/sections/coll#Collective Communication|Collective Communication]] and Section [[versions/v40/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] on page [[versions/v40/sections/coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] .~~

~~    Added nonblocking interfaces to all collective operations.~~

~~14. Sections [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] , [[versions/v40/sections/context#Communicator Info|Communicator Info]] , [[versions/v40/sections/one-side#Window Info|Window Info]] , on pages [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] , [[versions/v40/sections/context#Communicator Info|Communicator Info]] , [[versions/v40/sections/one-side#Window Info|Window Info]] .~~

~~    The new routines [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , [[versions/v40/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] , [[versions/v40/API/MPI_COMM_GET_INFO|MPI_COMM_GET_INFO]] , [[versions/v40/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] , and [[versions/v40/API/MPI_WIN_GET_INFO|MPI_WIN_GET_INFO]] were added. The routine [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] must also duplicate info hints.~~

~~15. Section [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] .~~

~~    Added [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] .~~

~~16. Section [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] .~~

~~    Added the new communicator construction routine [[versions/v40/API/MPI_COMM_CREATE_GROUP|MPI_COMM_CREATE_GROUP]] , which is invoked only by the processes in the group of the new communicator being constructed.~~

~~17. Section [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] .~~

~~    Added the [[versions/v40/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] routine and the communicator split type constant `MPI_COMM_TYPE_SHARED`.~~

~~18. Section [[versions/v40/sections/context#Inter-communicator Operations|Inter-communicator Operations]] on page [[versions/v40/sections/context#Inter-communicator Operations|Inter-communicator Operations]] .~~

~~    In MPI-2.2, communication involved in an [[versions/v40/API/MPI_INTERCOMM_CREATE|MPI_INTERCOMM_CREATE]] operation could interfere with point-to-point communication on the parent communicator with the same tag or `MPI_ANY_TAG`. This interference has been removed in MPI-3.0.~~

~~19. Section [[versions/v40/sections/context#Naming Objects|Naming Objects]] on page [[versions/v40/sections/context#Naming Objects|Naming Objects]] .~~

~~    Section 6.8 on page 238. The constant `MPI_MAX_OBJECT_NAME` also applies for type and window names.~~

~~20. Section [[versions/v40/sections/topol#Low-Level Topology Functions|Low-Level Topology Functions]] on page [[versions/v40/sections/topol#Low-Level Topology Functions|Low-Level Topology Functions]] .~~

~~    [[versions/v40/API/MPI_CART_MAP|MPI_CART_MAP]] can also be used for a zero-dimensional topologies.~~

~~21. Section [[versions/v40/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] on page [[versions/v40/sections/topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] and Section [[versions/v40/sections/topol#Nonblocking Neighborhood Communication on Process Topologies|Nonblocking Neighborhood Communication on Process Topologies]] on page [[versions/v40/sections/topol#Nonblocking Neighborhood Communication on Process Topologies|Nonblocking Neighborhood Communication on Process Topologies]] .~~

~~    The following neighborhood collective communication routines were added to support sparse communication on virtual topology grids: [[versions/v40/API/MPI_NEIGHBOR_ALLGATHER|MPI_NEIGHBOR_ALLGATHER]] , [[versions/v40/API/MPI_NEIGHBOR_ALLGATHERV|MPI_NEIGHBOR_ALLGATHERV]] , [[versions/v40/API/MPI_NEIGHBOR_ALLTOALL|MPI_NEIGHBOR_ALLTOALL]] , [[versions/v40/API/MPI_NEIGHBOR_ALLTOALLV|MPI_NEIGHBOR_ALLTOALLV]] , [[versions/v40/API/MPI_NEIGHBOR_ALLTOALLW|MPI_NEIGHBOR_ALLTOALLW]] and the nonblocking variants [[versions/v40/API/MPI_INEIGHBOR_ALLGATHER|MPI_INEIGHBOR_ALLGATHER]] , [[versions/v40/API/MPI_INEIGHBOR_ALLGATHERV|MPI_INEIGHBOR_ALLGATHERV]] , [[versions/v40/API/MPI_INEIGHBOR_ALLTOALL|MPI_INEIGHBOR_ALLTOALL]] , [[versions/v40/API/MPI_INEIGHBOR_ALLTOALLV|MPI_INEIGHBOR_ALLTOALLV]] , and [[versions/v40/API/MPI_INEIGHBOR_ALLTOALLW|MPI_INEIGHBOR_ALLTOALLW]] . The displacement arguments in [[versions/v40/API/MPI_NEIGHBOR_ALLTOALLW|MPI_NEIGHBOR_ALLTOALLW]] and [[versions/v40/API/MPI_INEIGHBOR_ALLTOALLW|MPI_INEIGHBOR_ALLTOALLW]] were defined as address size integers. In [[versions/v40/API/MPI_DIST_GRAPH_NEIGHBORS|MPI_DIST_GRAPH_NEIGHBORS]] , an ordering rule was added for communicators created with [[versions/v40/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] .~~

~~22. Section [[versions/v40/sections/inquiry#Startup|Startup]] on page [[versions/v40/sections/inquiry#Startup|Startup]] and Section [[versions/v40/sections/ei#Initialization|Initialization]] on page [[versions/v40/sections/ei#Initialization|Initialization]] .~~

~~    The use of [[versions/v40/API/MPI_INIT|MPI_INIT]] , [[versions/v40/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] and [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] was clarified. After MPI is initialized, the application can access information about the execution environment by querying the new predefined info object `MPI_INFO_ENV`.~~

~~23. Section [[versions/v40/sections/inquiry#Startup|Startup]] on page [[versions/v40/sections/inquiry#Startup|Startup]] .~~

~~    Allow calls to [[MPI_T]] routines before [[versions/v40/API/MPI_INIT|MPI_INIT]] and after [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] .~~

~~24. Chapter [[versions/v40/sections/one-side#One-Sided Communications|One-Sided Communications]] on page [[versions/v40/sections/one-side#One-Sided Communications|One-Sided Communications]] .~~

~~    Substantial revision of the entire One-sided chapter, with new routines for window creation, additional synchronization methods in passive target communication, new one-sided communication routines, a new memory model, and other changes.~~

~~25. Section [[versions/v40/sections/tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] on page [[versions/v40/sections/tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] .~~

~~    A new MPI Tool Information Interface was added.~~

~~    The following changes are related to the Fortran language support.~~

~~26. Section [[terms-procedure-specification]] on page [[terms-procedure-specification]] , and Sections [[f90-overview]] , [[f90-mpif08]] , [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on pages [[f90-overview]] , [[f90-mpif08]] , and [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .~~

~~    The new `mpi_08` Fortran module was introduced.~~

~~27. Section [[terms-opaque-objects]] on page [[terms-opaque-objects]] , and Sections [[f90-mpif08]] , [[f90-extended]] , [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on pages [[f90-mpif08]] , [[f90-extended]] , and [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .~~

~~    Handles to opaque objects were defined as named types within the `mpi_08` Fortran module. The operators `.EQ.`, `.NE.`, `==`, and `/=` were overloaded to allow the comparison of these handles. The handle types and the overloaded operators are also available through the `mpi` Fortran module.~~

~~28. Sections [[versions/v40/sections/terms#Named Constants|Named Constants]] , [[sub-choice]] on pages [[versions/v40/sections/terms#Named Constants|Named Constants]] , [[sub-choice]] , Sections [[f90-overview]] , [[versions/v40/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] , [[versions/v40/sections/binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] , [[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] , [[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] on pages [[f90-overview]] , [[versions/v40/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] , [[versions/v40/sections/binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] , [[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] , [[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] , and Sections [[f90-mpif08]] , [[f90-extended]] , [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on pages [[f90-mpif08]] , [[f90-extended]] , [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .~~

~~    Within the `mpi_08` Fortran module, choice buffers were defined as assumed-type and assumed-rank according to Fortran 2008 TS 29113 , and the compile-time constant `MPI_SUBARRAYS_SUPPORTED` was set to `.TRUE.`. With this, Fortran subscript triplets can be used in nonblocking MPI operations; vector subscripts are not supported in nonblocking operations. If the compiler does not support this Fortran TR 29113 feature, the constant is set to `.FALSE.`.~~

~~29. Section [[versions/v40/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] on page [[versions/v40/sections/terms#Fortran Binding Issues|Fortran Binding Issues]] , Section [[f90-mpif08]] on page [[f90-mpif08]] , and Section [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .~~

~~    The `ierror` dummy arguments are `OPTIONAL` within the `mpi_08` Fortran module.~~

~~30. Section [[versions/v40/sections/pt2pt#Return Status|Return Status]] on page [[versions/v40/sections/pt2pt#Return Status|Return Status]] , Sections [[f90-mpif08]] , [[f90-extended]] , [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] , on pages [[f90-mpif08]] , [[f90-extended]] , [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] , and Section [[versions/v40/sections/binding#Status|Status]] on page [[versions/v40/sections/binding#Status|Status]] .~~

~~    Within the `mpi_08` Fortran module, the status was defined as `TYPE(MPI_Status)`. Additionally, within both the `mpi` and the `mpi_f08` modules, the constants `MPI_STATUS_SIZE`, `MPI_SOURCE`, `MPI_TAG`, `MPI_ERROR`, and `TYPE(MPI_Status)` are defined. New conversion routines were added: [[versions/v40/API/MPI_STATUS_F2F08|MPI_STATUS_F2F08]] , [[versions/v40/API/MPI_STATUS_F082F|MPI_STATUS_F082F]] , `MPI_Status_c2f08`, and `MPI_Status_f082c`, In `mpi.h`, the new type `MPI_F08_status`, and the external variables `MPI_F08_STATUS_IGNORE` and `MPI_F08_STATUSES_IGNORE` were added.~~

~~31. Section [[versions/v40/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] on page [[versions/v40/sections/pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] .~~

~~    In Fortran with the `mpi` module or `mpif.h`, the type of the `buffer_addr` argument of [[versions/v40/API/MPI_BUFFER_DETACH|MPI_BUFFER_DETACH]] is incorrectly defined and the argument is therefore unused.~~

~~32. Section [[versions/v40/sections/datatypes#Derived Datatypes|Derived Datatypes]] on page [[versions/v40/sections/datatypes#Derived Datatypes|Derived Datatypes]] , Section [[versions/v40/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v40/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] , and Section [[versions/v40/sections/binding#Fortran Derived Types|Fortran Derived Types]] on page [[versions/v40/sections/binding#Fortran Derived Types|Fortran Derived Types]] .~~

~~    The Fortran alignments of basic datatypes within Fortran derived types are implementation dependent; therefore it is recommended to use the `BIND(C)` attribute for derived types in MPI communication buffers. If an array of structures (in C/C++) or derived types (in Fortran) is to be used in MPI communication buffers, it is recommended that the user creates a portable datatype handle and additionally applies [[versions/v40/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] to this datatype handle.~~

~~33. Sections [[versions/v40/sections/datatypes#Duplicating a Datatype|Duplicating a Datatype]] , [[versions/v40/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] , [[versions/v40/sections/coll#Process-Local Reduction|Process-Local Reduction]] , [[versions/v40/sections/context#Datatypes|Datatypes]] , [[versions/v40/sections/context#Naming Objects|Naming Objects]] , [[versions/v40/sections/inquiry#Error Handlers for Communicators|Error Handlers for Communicators]] , [[versions/v40/sections/inquiry#Error Handlers for Windows|Error Handlers for Windows]] , [[versions/v40/sections/inquiry#Error Handlers for Files|Error Handlers for Files]] , [[versions/v40/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] , [[f90-types]] on pages [[versions/v40/sections/datatypes#Duplicating a Datatype|Duplicating a Datatype]] , [[versions/v40/sections/coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] , [[versions/v40/sections/coll#Process-Local Reduction|Process-Local Reduction]] , [[versions/v40/sections/context#Datatypes|Datatypes]] , [[versions/v40/sections/context#Naming Objects|Naming Objects]] , [[versions/v40/sections/inquiry#Error Handlers for Communicators|Error Handlers for Communicators]] , [[versions/v40/sections/inquiry#Error Handlers for Windows|Error Handlers for Windows]] , [[versions/v40/sections/inquiry#Error Handlers for Files|Error Handlers for Files]] , [[versions/v40/sections/deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] , and [[f90-types]] . In some routines, the dummy argument names were changed because they were identical to the Fortran keywords `TYPE` and `FUNCTION`. The new dummy argument names must be used because the `mpi` and `mpi_08` modules guarantee keyword-based actual argument lists. The argument name `type` was changed~~

~~    in [[versions/v40/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] ,~~

~~    the Fortran `USER_FUNCTION` of [[versions/v40/API/MPI_OP_CREATE|MPI_OP_CREATE]] ,~~

~~    [[versions/v40/API/MPI_TYPE_SET_ATTR|MPI_TYPE_SET_ATTR]] , [[versions/v40/API/MPI_TYPE_GET_ATTR|MPI_TYPE_GET_ATTR]] , [[versions/v40/API/MPI_TYPE_DELETE_ATTR|MPI_TYPE_DELETE_ATTR]] , [[versions/v40/API/MPI_TYPE_SET_NAME|MPI_TYPE_SET_NAME]] , [[versions/v40/API/MPI_TYPE_GET_NAME|MPI_TYPE_GET_NAME]] , [[versions/v40/API/MPI_TYPE_MATCH_SIZE|MPI_TYPE_MATCH_SIZE]] , the callback prototype definition [[versions/v40/API/MPI_TYPE_CREATE_KEYVAL|MPI_Type_delete_attr_function]] , and the predefined callback function~~

~~    [[versions/v40/API/MPI_TYPE_CREATE_KEYVAL|MPI_TYPE_NULL_DELETE_FN]] ; `function` was changed~~

~~    in [[versions/v40/API/MPI_OP_CREATE|MPI_OP_CREATE]] ,~~

~~    [[versions/v40/API/MPI_COMM_CREATE_ERRHANDLER|MPI_COMM_CREATE_ERRHANDLER]] ,~~

~~    [[versions/v40/API/MPI_WIN_CREATE_ERRHANDLER|MPI_WIN_CREATE_ERRHANDLER]] ,~~

~~    [[versions/v40/API/MPI_FILE_CREATE_ERRHANDLER|MPI_FILE_CREATE_ERRHANDLER]] , and~~

~~    [[MPI_ERRHANDLER_CREATE]] . For consistency reasons, `INOUBUF` was changed to `INOUTBUF` in [[versions/v40/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] , and `intracomm` to `newintracomm` in [[versions/v40/API/MPI_INTERCOMM_MERGE|MPI_INTERCOMM_MERGE]] .~~

~~34. Section [[versions/v40/sections/context#Communicators|Communicators]] on page [[versions/v40/sections/context#Communicators|Communicators]] .~~

~~    It was clarified that in Fortran, the flag values returned by a `comm_copy_attr_fn` callback,~~

~~    including [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_NULL_COPY_FN]] and [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_DUP_FN]] , are `.FALSE.` and `.TRUE.`; see [[versions/v40/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]] .~~

~~35. Section [[versions/v40/sections/inquiry#Memory Allocation|Memory Allocation]] on page [[versions/v40/sections/inquiry#Memory Allocation|Memory Allocation]] .~~

~~    With the `mpi` and `mpi_f08` Fortran modules, [[versions/v40/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] now also supports `TYPE(C_PTR)` C-pointers instead of only returning an address-sized integer that may be usable together with a non-standard Cray-pointer.~~

~~36. Section [[versions/v40/sections/binding#Fortran Derived Types|Fortran Derived Types]] on page [[versions/v40/sections/binding#Fortran Derived Types|Fortran Derived Types]] , and Section [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .~~

~~    Fortran `SEQUENCE` and `BIND(C)` derived application types can now be used as buffers in MPI operations.~~

~~37. Section [[versions/v40/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] on page [[versions/v40/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to Section [[versions/v40/sections/binding#Permanent Data Movement|Permanent Data Movement]] on page [[versions/v40/sections/binding#Permanent Data Movement|Permanent Data Movement]] , Section [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] , and Section [[f90-syncreg]] on page [[f90-syncreg]] .~~

~~    The sections about Fortran optimization problems and their solutions were partially rewritten and new methods are added, e.g., the use of the `ASYNCHRONOUS` attribute. The constant `MPI_ASYNC_PROTECTS_NONBLOCKING` tells whether the semantics of the `ASYNCHRONOUS` attribute is extended to protect nonblocking operations. The Fortran routine [[versions/v40/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] is added. MPI-3.0 compliance for an MPI library together with a Fortran compiler is defined in Section [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .~~

~~38. Section [[f90-mpif08]] on page [[f90-mpif08]] .~~

~~    Within the `mpi_08` Fortran module, dummy arguments are now declared with `INTENT=IN`, `OUT`, or `INOUT` as defined in the `mpi_08` interfaces.~~

~~39. Section [[f90-extended]] on page [[f90-extended]] , and Section [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page [[versions/v40/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .~~

~~    The existing `mpi` Fortran module must implement compile-time argument checking.~~

~~40. Section [[f90-basic]] on page [[f90-basic]] .~~

~~    The use of the `mpif.h` Fortran include file is now strongly discouraged.~~

~~41. Section [[versions/v40/sections/appLang-Const#Defined Constants|Defined Constants]] , Table “*Predefined functions*” on page [[versions/v40/sections/appLang-Const#Defined Constants|Defined Constants]] , Section [[versions/v40/sections/appLang-Const#Prototype Definitions|Prototype Definitions]] on page [[versions/v40/sections/appLang-Const#Prototype Definitions|Prototype Definitions]] , and Section [[versions/v40/sections/appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] on page [[versions/v40/sections/appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] .~~

~~    Within the new `mpi_f08` module, all callback prototype definitions are now defined with explicit interfaces `PROCEDURE(MPI_...)` that have the `BIND(C)` attribute; user-written callbacks must be modified if the `mpi_f08` module is used.~~

~~42. Section [[versions/v40/sections/appLang-Const#Prototype Definitions|Prototype Definitions]] on page [[versions/v40/sections/appLang-Const#Prototype Definitions|Prototype Definitions]] .~~

~~    In some routines, the Fortran callback prototype names were changed from `$`...`$\_FN` to `$`...`$\_FUNCTION` to be consistent with the other language bindings.~~

==1.  Sections [[versions/v40/sections/terms#Naming Conventions|Naming Conventions]] , [[sec-incompatible-since40]] , and [[versions/v40/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] on pages [[versions/v40/sections/terms#Naming Conventions|Naming Conventions]] , [[sec-incompatible-since40]] , and [[versions/v40/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] .==

==    The limit for the maximum length of MPI identifiers was removed.==

==2.  Section [[terms-semantic]] , [[versions/v40/sections/pt2pt#Communication Modes|Communication Modes]] , [[versions/v40/sections/pt2pt#Communication Initiation|Communication Initiation]] , [[versions/v40/sections/pt2pt#Communication Completion|Communication Completion]] , [[versions/v40/sections/pt2pt#Probe|Probe]] , [[versions/v40/sections/pt2pt#Matching Probe|Matching Probe]] , [[versions/v40/sections/coll#Persistent Collective Operations|Persistent Collective Operations]] , [[versions/v40/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] , and Annex [[versions/v40/sections/appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] on pages [[terms-semantic]] , [[versions/v40/sections/pt2pt#Communication Modes|Communication Modes]] , [[versions/v40/sections/pt2pt#Communication Initiation|Communication Initiation]] , [[versions/v40/sections/pt2pt#Communication Completion|Communication Completion]] , [[versions/v40/sections/pt2pt#Probe|Probe]] , [[versions/v40/sections/pt2pt#Matching Probe|Matching Probe]] , [[versions/v40/sections/coll#Persistent Collective Operations|Persistent Collective Operations]] , [[versions/v40/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] , and [[versions/v40/sections/appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] .==

==    The semantic terms were updated.==

==3.  Sections [[versions/v40/sections/terms#Counts|Counts]] and [[versions/v40/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|Support for Large Count and Large Byte Displacement in MPI Language Bindings]] on pages [[versions/v40/sections/terms#Counts|Counts]] and [[versions/v40/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|Support for Large Count and Large Byte Displacement in MPI Language Bindings]] , and throughout the entire document.==

==    New large count functions `MPI\_<span class="roman">{</span>...<span class="roman">}</span>\_c`==

==    in C and through function overloading in the Fortran `mpi_f08` module, (with the exception of the explicit Fortran procedures [[versions/v40/API/MPI_OP_CREATE|MPI_Op_create_c]] and [[versions/v40/API/MPI_REGISTER_DATAREP|MPI_Register_datarep_c]] ) and the new large count callbacks `MPI_User_function_c` and `MPI_Datarep_conversion_function_c` together with the predefined function [[versions/v40/API/MPI_CONVERSION_FN_NULL_C|MPI_CONVERSION_FN_NULL_C]] were introduced to accomodate large buffers and/or datatypes.==

==    Clarifications were added to the behavior of INOUT/OUT parameters that cannot represent the value to be returned for the [[versions/v40/API/MPI_BUFFER_DETACH|MPI_BUFFER_DETACH]] and [[versions/v40/API/MPI_FILE_GET_TYPE_EXTENT|MPI_FILE_GET_TYPE_EXTENT]] functions.==

==    A new error class `MPI_ERR_VALUE_TOO_LARGE` was introduced.==

==4.  Sections [[versions/v40/sections/terms#Error Handling|Error Handling]] , [[versions/v40/sections/inquiry#Error Handling|Error Handling]] , [[versions/v40/sections/inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] , and [[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]] on pages [[versions/v40/sections/terms#Error Handling|Error Handling]] , [[versions/v40/sections/inquiry#Error Handling|Error Handling]] , [[versions/v40/sections/inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] , and [[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]] .==

==    MPI calls that are not related to any objects are considered to be attached to the communicator `MPI_COMM_SELF` instead of `MPI_COMM_WORLD`. The definition of `MPI_ERRORS_ARE_FATAL` was clarified to cover all connected processes, and a new error handler, `MPI_ERRORS_ABORT`, was created to limit the scope of aborting.==

==5.  Section [[versions/v40/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] on page [[versions/v40/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] .==

==    The introduction of MPI nonblocking communication was changed to describe correctness and performance reasons for the use of nonblocking communication.==

==6.  Section [[versions/v40/sections/pt2pt#Communication Initiation|Communication Initiation]] on page [[versions/v40/sections/pt2pt#Communication Initiation|Communication Initiation]] .==

==    Addition of [[versions/v40/API/MPI_ISENDRECV|MPI_ISENDRECV]] and [[versions/v40/API/MPI_ISENDRECV_REPLACE|MPI_ISENDRECV_REPLACE]] .==

==7.  Sections [[versions/v40/sections/pt2pt#Communication Completion|Communication Completion]] , [[versions/v40/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] , [[versions/v40/sections/coll#Persistent Collective Operations|Persistent Collective Operations]] , [[versions/v40/sections/topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] , and [[versions/v40/sections/topol#An Application Example|An Application Example]] on pages [[versions/v40/sections/pt2pt#Communication Completion|Communication Completion]] , [[versions/v40/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] , [[versions/v40/sections/coll#Persistent Collective Operations|Persistent Collective Operations]] , [[versions/v40/sections/topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] , and [[versions/v40/sections/topol#An Application Example|An Application Example]] .==

==    Persistent collective communication==

==    `MPI\_<span class="roman">{</span>ALLGATHER$`|`$...<span class="roman">}</span>\_INIT` including persistent collective neighborhood communication==

==    `MPI_NEIGHBOR\_<span class="roman">{</span>ALLGATHER$`|`$...<span class="roman">}</span>\_INIT` was added to the standard.==

==8.  Sections [[versions/v40/sections/pt2pt#Cancel|Cancel]] and [[versions/v40/sections/deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] on pages [[versions/v40/sections/pt2pt#Cancel|Cancel]] and [[versions/v40/sections/deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] .==

==    Cancelling a send request by calling [[versions/v40/API/MPI_CANCEL|MPI_CANCEL]] has been deprecated and may be removed in a future version of the MPI specification.==

==9.  Chapter [[versions/v40/sections/part#Partitioned Point-to-Point Communication|Partitioned Point-to-Point Communication]] on page [[versions/v40/sections/part#Partitioned Point-to-Point Communication|Partitioned Point-to-Point Communication]] .==

==    A new chapter on partitioned communication with the new MPI procedures==

==    `MPI\_<span class="roman">{</span>PARRIVED$`|`$PREADY<span class="roman">{</span>...<span class="roman">}</span><span class="roman">}</span>` and `MPI\_<span class="roman">{</span>PRECV$`|`$PSEND<span class="roman">}</span>\_INIT` was added.==

==10. Section [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] .==

==    `MPI_COMM_TYPE_HW_UNGUIDED` was added as a new possible value for the `split_type` parameter of the [[versions/v40/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] function.==

==11. Section [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] .==

==    `MPI_COMM_TYPE_HW_GUIDED` was added as a new possible value for the `split_type` parameter of the [[versions/v40/API/MPI_COMM_SPLIT_TYPE|MPI_COMM_SPLIT_TYPE]] function, as well as a new info key `mpi_hw_resource_type`. A specific value associated with this new info key is also defined: `mpi_shared_memory`.==

==12. Section [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] .==

==    The functions [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] and [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] were updated to no longer propagate info hints. This change may affect backward compatibility.==

==13. Section [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] .==

==    The [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] function was added.==

==14. Sections [[versions/v40/sections/context#Communicator Info|Communicator Info]] , [[versions/v40/sections/one-side#Window Info|Window Info]] , and [[versions/v40/sections/io#File Info|File Info]] on pages [[versions/v40/sections/context#Communicator Info|Communicator Info]] , [[versions/v40/sections/one-side#Window Info|Window Info]] , and [[versions/v40/sections/io#File Info|File Info]] .==

==    The definition of info hints was updated to allow applications to provide assertions regarding their usage of MPI objects and operations.==

==15. Section [[versions/v40/sections/context#Communicator Info|Communicator Info]] on page [[versions/v40/sections/context#Communicator Info|Communicator Info]] .==

==    The new info hints `mpi_assert_no_any_tag`, `mpi_assert_no_any_source`, `mpi_assert_exact_length`, and `mpi_assert_allow_overtaking` were added for use with communicators.==

==16. Sections [[versions/v40/sections/context#Communicator Info|Communicator Info]] , [[versions/v40/sections/one-side#Window Info|Window Info]] , and [[versions/v40/sections/io#File Info|File Info]] on pages [[versions/v40/sections/context#Communicator Info|Communicator Info]] , [[versions/v40/sections/one-side#Window Info|Window Info]] , and [[versions/v40/sections/io#File Info|File Info]] .==

==    The semantics of the [[versions/v40/API/MPI_COMM_SET_INFO|MPI_COMM_SET_INFO]] , [[versions/v40/API/MPI_COMM_GET_INFO|MPI_COMM_GET_INFO]] , [[versions/v40/API/MPI_WIN_SET_INFO|MPI_WIN_SET_INFO]] , [[versions/v40/API/MPI_WIN_GET_INFO|MPI_WIN_GET_INFO]] , [[versions/v40/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , and [[versions/v40/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] were clarified.==

==17. Section [[versions/v40/sections/topol#Topology Constructors|Topology Constructors]] on page [[versions/v40/sections/topol#Topology Constructors|Topology Constructors]] .==

==    [[versions/v40/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] is now guaranteed to return `MPI_SUCCESS` if the number of dimensions passed to the routine is set to 0 and the number of nodes is set to 1.==

==18. Sections [[versions/v40/sections/inquiry#Memory Allocation|Memory Allocation]] , [[versions/v40/sections/one-side#Window That Allocates Memory|Window That Allocates Memory]] , and [[versions/v40/sections/one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] on pages [[versions/v40/sections/inquiry#Memory Allocation|Memory Allocation]] , [[versions/v40/sections/one-side#Window That Allocates Memory|Window That Allocates Memory]] , and [[versions/v40/sections/one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] .==

==    Introduced alignment requirements for memory allocated through [[versions/v40/API/MPI_ALLOC_MEM|MPI_ALLOC_MEM]] , [[versions/v40/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] , and [[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] and added a new `info` key `mpi_minimum_memory_alignment` to specify a desired alternative minimum alignment.==

==19. Sections [[versions/v40/sections/inquiry#Error Handling|Error Handling]] and [[versions/v40/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] on pages [[versions/v40/sections/inquiry#Error Handling|Error Handling]] and [[versions/v40/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] .==

==    Clarified definition of errors to say that MPI should continue whenever possible and allow the user to recover from errors.==

==20. Section [[versions/v40/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] on page [[versions/v40/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] .==

==    Added text to clarify what is implied about the status of MPI and user visible buffers when MPI functions return `MPI_SUCCESS` or other error codes.==

==21. Section [[versions/v40/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] on page [[versions/v40/sections/inquiry#Error Codes and Classes|Error Codes and Classes]] .==

==    The error class `MPI_ERR_PROC_ABORTED` has been added.==

==22. Section [[versions/v40/sections/misc#The Info Object|The Info Object]] on page [[versions/v40/sections/misc#The Info Object|The Info Object]] .==

==    Added a new function [[versions/v40/API/MPI_INFO_GET_STRING|MPI_INFO_GET_STRING]] that takes a buffer length argument for returning info value strings. This function returns the required buffer length for the requested string and guarantees null termination for C strings where buffer size is greater than 0.==

==23. Section [[versions/v40/sections/misc#The Info Object|The Info Object]] on page [[versions/v40/sections/misc#The Info Object|The Info Object]] and Section [[versions/v40/sections/deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] on page [[versions/v40/sections/deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] .==

==    [[versions/v40/API/MPI_INFO_GET|MPI_INFO_GET]] and [[versions/v40/API/MPI_INFO_GET_VALUELEN|MPI_INFO_GET_VALUELEN]] were deprecated.==

==24. Chapter [[versions/v40/sections/dynamic#Process Initialization, Creation, and Management|Process Initialization, Creation, and Management]] , [[versions/v40/sections/pt2pt#Message Envelope|Message Envelope]] , [[versions/v40/sections/context#Predefined Intra-Communicators|Predefined Intra-Communicators]] , [[versions/v40/sections/context#Group Constructors|Group Constructors]] , [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] , [[versions/v40/sections/context#Inter-Communicator Operations|Inter-Communicator Operations]] , [[versions/v40/sections/inquiry#Version Inquiries|Version Inquiries]] , [[versions/v40/sections/inquiry#Environmental Inquiries|Environmental Inquiries]] , [[versions/v40/sections/inquiry#Error Handling|Error Handling]] , [[versions/v40/sections/inquiry#Error Handlers for Sessions|Error Handlers for Sessions]] , [[versions/v40/sections/inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] , [[versions/v40/sections/dynamic#MPI and Threads|MPI and Threads]] , [[versions/v40/sections/io#Opening a File|Opening a File]] , [[versions/v40/sections/io#Querying File Parameters|Querying File Parameters]] , [[versions/v40/sections/io#I/O Error Handling|I/O Error Handling]] , [[versions/v40/sections/tools#Initialization and Finalization|Initialization and Finalization]] , [[versions/v40/sections/binding#Transfer of Handles|Transfer of Handles]] , [[versions/v40/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] , and Annex [[versions/v40/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] on pages [[versions/v40/sections/dynamic#Process Initialization, Creation, and Management|Process Initialization, Creation, and Management]] , [[versions/v40/sections/pt2pt#Message Envelope|Message Envelope]] , [[versions/v40/sections/context#Predefined Intra-Communicators|Predefined Intra-Communicators]] , [[versions/v40/sections/context#Group Constructors|Group Constructors]] , [[versions/v40/sections/context#Communicator Constructors|Communicator Constructors]] , [[versions/v40/sections/context#Inter-Communicator Operations|Inter-Communicator Operations]] , [[versions/v40/sections/inquiry#Version Inquiries|Version Inquiries]] , [[versions/v40/sections/inquiry#Environmental Inquiries|Environmental Inquiries]] , [[versions/v40/sections/inquiry#Error Handling|Error Handling]] , [[versions/v40/sections/inquiry#Error Handlers for Sessions|Error Handlers for Sessions]] , [[versions/v40/sections/inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] , [[versions/v40/sections/dynamic#MPI and Threads|MPI and Threads]] , [[versions/v40/sections/io#Opening a File|Opening a File]] , [[versions/v40/sections/io#Querying File Parameters|Querying File Parameters]] , [[versions/v40/sections/io#I/O Error Handling|I/O Error Handling]] , [[versions/v40/sections/tools#Initialization and Finalization|Initialization and Finalization]] , [[versions/v40/sections/binding#Transfer of Handles|Transfer of Handles]] , [[versions/v40/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] , and [[versions/v40/sections/appLang-Const#Language Bindings Summary|Language Bindings Summary]] .==

==    The Sessions Model was added to the standard. New MPI procedures are==

==    `MPI_SESSION\_<span class="roman">{</span>INIT$`|`$FINALIZE<span class="roman">}</span>` ,==

==    `MPI_SESSION_GET\_<span class="roman">{</span>...<span class="roman">}</span>` ,==

==    `MPI_SESSION\_<span class="roman">{</span>...<span class="roman">}</span>\_ERRHANDLER` , [[versions/v40/API/MPI_GROUP_FROM_SESSION_PSET|MPI_GROUP_FROM_SESSION_PSET]] , [[versions/v40/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] , [[versions/v40/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] ,==

==    and new conversion functions are `MPI_SESSION\_<span class="roman">{</span>C2F$`|`$F2C<span class="roman">}</span>` . New declarations are `MPI_Session` in C and `TYPE(MPI_Session)` together with the related overloaded operators `.EQ.`, `.NE.`, `==` and `/=` in the Fortran `mpi_f08` and `mpi` modules, and the callback function prototype `MPI_Session_errhandler_function`. New constants are `MPI_SESSION_NULL`, `MPI_ERR_SESSION`, `MPI_MAX_PSET_NAME_LEN`, `MPI_MAX_STRINGTAG_LEN`, `MPI_T_BIND_MPI_SESSION` and the predefined info key `mpi_size`.==

==25. Section [[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]] on page [[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]] .==

==    A new function [[versions/v40/API/MPI_INFO_CREATE_ENV|MPI_INFO_CREATE_ENV]] was added.==

==26. Sections [[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]] and [[versions/v40/sections/dynamic#Releasing Connections|Releasing Connections]] on pages [[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]] and [[versions/v40/sections/dynamic#Releasing Connections|Releasing Connections]] .==

==    Clarified the semantic of failure and error reporting before (and during) [[versions/v40/API/MPI_INIT|MPI_INIT]] and after [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] .==

==27. Section [[versions/v40/sections/dynamic#Reserved Keys|Reserved Keys]] on page [[versions/v40/sections/dynamic#Reserved Keys|Reserved Keys]] .==

==    Added the `mpi_initial_errhandler` reserved info key with the reserved values `mpi_errors_abort`, `mpi_errors_are_fatal`, and `mpi_errors_return` to the launch keys in [[versions/v40/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , [[versions/v40/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , and [[mpiexec]] .==

==28. Section [[versions/v40/sections/one-side#Lock|Lock]] on page [[versions/v40/sections/one-side#Lock|Lock]] .==

==    RMA passive target synchronization using locks can now be used portably in memory allocated via [[versions/v40/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] .==

==29. Section [[versions/v40/sections/ei#Associating Information with Status|Associating Information with Status]] on page [[versions/v40/sections/ei#Associating Information with Status|Associating Information with Status]] .==

==    The `mpi_f08` binding incorrectly had the dummy parameter `flag` in the MPI F08 binding for [[versions/v40/API/MPI_STATUS_SET_CANCELLED|MPI_STATUS_SET_CANCELLED]] marked as `INTENT(OUT)`. It has been fixed to be `INTENT(IN)`.==

==30. Sections [[versions/v40/sections/tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] and [[versions/v40/sections/tools#Events|Events]] on pages [[versions/v40/sections/tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] and [[versions/v40/sections/tools#Events|Events]] .==

==    A callback-driven event interface==

==    with the `MPI_T\_<span class="roman">{</span>SOURCE$`|`$EVENT<span class="roman">}</span>\_<span class="roman">{</span>...<span class="roman">}</span>` and `MPI_T_CATEGORY\_<span class="roman">{</span>GET$`|`$GET_NUM<span class="roman">}</span>\_EVENTS` routines, the declaration types `MPI_T_cb_safety`, `MPI_T_event_`<span class="roman">`{`</span>`instance`$`|`$`registration`<span class="roman">`}`</span>, `MPI_T_source_order`, and the callback function prototypes `MPI_T_event_`<span class="roman">`{`</span>`cb`$`|`$`dropped_cb`$`|`$`free_cb`<span class="roman">`}`</span>`_function`,==

==    was added to the MPI tool information interface.==

==31. Section [[versions/v40/sections/tools#Category Member Query Functions|Category Member Query Functions]] on page [[versions/v40/sections/tools#Category Member Query Functions|Category Member Query Functions]] .==

==    The argument `stamp` (previously described as a virtual time stamp) from [[versions/v40/API/MPI_T_CATEGORY_CHANGED|MPI_T_CATEGORY_CHANGED]] was renamed to `update_number` and its intended implementation and use was clarified.==

==32. Section [[versions/v40/sections/tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] , Table [[versions/v40/sections/tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] , and Section [[versions/v40/sections/deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] on pages [[versions/v40/sections/tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] , [[versions/v40/sections/tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] , and [[versions/v40/sections/deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] .==

==    `MPI_T_ERR_INVALID_ITEM` is deprecated. MPI routines should return==

==    `MPI_T_ERR_INVALID_INDEX` instead of `MPI_T_ERR_INVALID_ITEM`.==

==33. Section [[versions/v40/sections/deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] on page [[versions/v40/sections/deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] .==

==    [[versions/v40/API/MPI_SIZEOF|MPI_SIZEOF]] was deprecated.==

==34. Section [[versions/v40/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] on page [[versions/v40/sections/binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] .==

==    An exception was added for the specific Fortran names in the case of TS 29113 interface specifications in `mpif.h` for [[versions/v40/API/MPI_NEIGHBOR_ALLTOALLW_INIT|MPI_NEIGHBOR_ALLTOALLW_INIT]] , [[versions/v40/API/MPI_NEIGHBOR_ALLTOALLV_INIT|MPI_NEIGHBOR_ALLTOALLV_INIT]] , and [[versions/v40/API/MPI_NEIGHBOR_ALLGATHERV_INIT|MPI_NEIGHBOR_ALLGATHERV_INIT]] .==

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

New large count functions ~~`MPI\_<span class="roman">{</span>...<span class="roman">}</span>\_c`~~ ==`MPI\_{...}\_c`==

in C and through function overloading in the Fortran `mpi_f08` module, (with the exception of the explicit Fortran procedures ~~[[versions/v41/API/MPI_OP_CREATE|MPI_Op_create_c]]~~ ==`MPI_Op_create_c`== and ~~[[versions/v41/API/MPI_REGISTER_DATAREP|MPI_Register_datarep_c]] )~~ ==`MPI_Register_datarep_c`)== and the new large count callbacks `MPI_User_function_c` and `MPI_Datarep_conversion_function_c` together with the predefined function [[versions/v41/API/MPI_CONVERSION_FN_NULL_C|MPI_CONVERSION_FN_NULL_C]] were introduced to accomodate large buffers and/or datatypes.

~~`MPI\_<span class="roman">{</span>ALLGATHER$`|`$...<span class="roman">}</span>\_INIT`~~ ==`MPI\_{ALLGATHER$`|`$...}\_INIT`== including persistent collective neighborhood communication

~~`MPI_NEIGHBOR\_<span class="roman">{</span>ALLGATHER$`|`$...<span class="roman">}</span>\_INIT`~~ ==`MPI_NEIGHBOR\_{ALLGATHER$`|`$...}\_INIT`== was added to the standard.

~~`MPI\_<span class="roman">{</span>PARRIVED$`|`$PREADY<span class="roman">{</span>...<span class="roman">}</span><span class="roman">}</span>`~~ ==`MPI\_{PARRIVED$`|`$PREADY{...}}`== and ~~`MPI\_<span class="roman">{</span>PRECV$`|`$PSEND<span class="roman">}</span>\_INIT`~~ ==`MPI\_{PRECV$`|`$PSEND}\_INIT`== was added.

~~`MPI_SESSION\_<span class="roman">{</span>INIT$`|`$FINALIZE<span class="roman">}</span>`~~ ==`MPI_SESSION\_{INIT$`|`$FINALIZE}`== ,

~~`MPI_SESSION_GET\_<span class="roman">{</span>...<span class="roman">}</span>`~~ ==`MPI_SESSION_GET\_{...}`== ,

~~`MPI_SESSION\_<span class="roman">{</span>...<span class="roman">}</span>\_ERRHANDLER`~~ ==`MPI_SESSION\_{...}\_ERRHANDLER`== , [[versions/v41/API/MPI_GROUP_FROM_SESSION_PSET|MPI_GROUP_FROM_SESSION_PSET]] , [[versions/v41/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] , [[versions/v41/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] ,

and new conversion functions are ~~`MPI_SESSION\_<span class="roman">{</span>C2F$`|`$F2C<span class="roman">}</span>`~~ ==`MPI_SESSION\_{C2F$`|`$F2C}`== . New declarations are `MPI_Session` in C and `TYPE(MPI_Session)` together with the related overloaded operators `.EQ.`, `.NE.`, `==` and `/=` in the Fortran `mpi_f08` and `mpi` modules, and the callback function prototype `MPI_Session_errhandler_function`. New constants are `MPI_SESSION_NULL`, `MPI_ERR_SESSION`, `MPI_MAX_PSET_NAME_LEN`, `MPI_MAX_STRINGTAG_LEN`, `MPI_T_BIND_MPI_SESSION` and the predefined info key `mpi_size`.

with the ~~`MPI_T\_<span class="roman">{</span>SOURCE$`|`$EVENT<span class="roman">}</span>\_<span class="roman">{</span>...<span class="roman">}</span>`~~ ==`MPI_T\_{SOURCE$`|`$EVENT}\_{...}`== and ~~`MPI_T_CATEGORY\_<span class="roman">{</span>GET$`|`$GET_NUM<span class="roman">}</span>\_EVENTS`~~ ==`MPI_T_CATEGORY\_{GET$`|`$GET_NUM}\_EVENTS`== routines, the declaration types `MPI_T_cb_safety`, ~~`MPI_T_event_`<span class="roman">`{`</span>`instance`$`|`$`registration`<span class="roman">`}`</span>,~~ ==`MPI_T_event_{instance`$`|`$`registration}`,== `MPI_T_source_order`, and the callback function prototypes ~~`MPI_T_event_`<span class="roman">`{`</span>`cb`$`|`$`dropped_cb`$`|`$`free_cb`<span class="roman">`}`</span>`_function`,~~ ==`MPI_T_event_{cb`$`|`$`dropped_cb`$`|`$`free_cb}_function`,==

~~was~~ ==were== added to the MPI tool information interface.

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

~~    The Sessions Model was added to the standard. New MPI procedures are~~

~~    `MPI_SESSION\_{INIT$`|`$FINALIZE}` ,~~

~~    `MPI_SESSION_GET\_{...}` ,~~

~~    `MPI_SESSION\_{...}\_ERRHANDLER` , [[versions/v50/API/MPI_GROUP_FROM_SESSION_PSET|MPI_GROUP_FROM_SESSION_PSET]] , [[versions/v50/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] , [[versions/v50/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] ,~~

~~    and new conversion functions are `MPI_SESSION\_{C2F$`|`$F2C}` . New declarations are `MPI_Session` in C and `TYPE(MPI_Session)` together with the related overloaded operators `.EQ.`, `.NE.`, `==` and `/=` in the Fortran `mpi_f08` and `mpi` modules, and the callback function prototype `MPI_Session_errhandler_function`. New constants are `MPI_SESSION_NULL`, `MPI_ERR_SESSION`, `MPI_MAX_PSET_NAME_LEN`, `MPI_MAX_STRINGTAG_LEN`, `MPI_T_BIND_MPI_SESSION` and the predefined info key `mpi_size`.~~

==    The Sessions Model was added to the standard. New MPI procedures are `MPI_SESSION\_{INIT$`|`$FINALIZE}` , `MPI_SESSION_GET\_{...}` , `MPI_SESSION\_{...}\_ERRHANDLER` , [[versions/v50/API/MPI_GROUP_FROM_SESSION_PSET|MPI_GROUP_FROM_SESSION_PSET]] , [[versions/v50/API/MPI_COMM_CREATE_FROM_GROUP|MPI_COMM_CREATE_FROM_GROUP]] , [[versions/v50/API/MPI_INTERCOMM_CREATE_FROM_GROUPS|MPI_INTERCOMM_CREATE_FROM_GROUPS]] , and new conversion functions are `MPI_SESSION\_{C2F$`|`$F2C}` . New declarations are `MPI_Session` in C and `TYPE(MPI_Session)` together with the related overloaded operators `.EQ.`, `.NE.`, `==` and `/=` in the Fortran `mpi_f08` and `mpi` modules, and the callback function prototype `MPI_Session_errhandler_function`. New constants are `MPI_SESSION_NULL`, `MPI_ERR_SESSION`, `MPI_MAX_PSET_NAME_LEN`, `MPI_MAX_STRINGTAG_LEN`, `MPI_T_BIND_MPI_SESSION` and the predefined info key `mpi_size`.==

Added the `mpi_initial_errhandler` reserved info key with the reserved values `mpi_errors_abort`, `mpi_errors_are_fatal`, and `mpi_errors_return` to the launch keys in [[versions/v50/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , [[versions/v50/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] , and ~~[[mpiexec]] .~~ ==`mpiexec`.==

~~    A callback-driven event interface~~

~~    with the `MPI_T\_{SOURCE$`|`$EVENT}\_{...}` and `MPI_T_CATEGORY\_{GET$`|`$GET_NUM}\_EVENTS` routines, the declaration types `MPI_T_cb_safety`, `MPI_T_event_{instance`$`|`$`registration}`, `MPI_T_source_order`, and the callback function prototypes `MPI_T_event_{cb`$`|`$`dropped_cb`$`|`$`free_cb}_function`,~~

~~    were added to the MPI tool information interface.~~

==    A callback-driven event interface with the `MPI_T\_{SOURCE$`|`$EVENT}\_{...}` and `MPI_T_CATEGORY\_{GET$`|`$GET_NUM}\_EVENTS` routines, the declaration types `MPI_T_cb_safety`, `MPI_T_event_{instance`$`|`$`registration}`, `MPI_T_source_order`, and the callback function prototypes `MPI_T_event_{cb`$`|`$`dropped_cb`$`|`$`free_cb}_function`, were added to the MPI tool information interface.==

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/changes#Changes in MPI-4.0]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/changes#Changes in MPI-4.0]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/changes#Changes in MPI-4.0]]

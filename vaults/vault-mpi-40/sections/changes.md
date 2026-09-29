# Change-Log



Annex [[changes#Changes from Version 3.1 to Version 4.0|Changes from Version 3.1 to Version 4.0]] summarizes changes from the previous version of the MPI standard to the version presented by this document. Only significant changes (i.e., clarifications and new features) that might either require implementation effort in the MPI libraries or change the understanding of MPI from a user’s perspective are presented. Editorial modifications, formatting, typo corrections and minor clarifications are not shown. If not otherwise noted, the section and page references refer to the locations of the change or new functionality in this version of the standard. Changes in Annexes [[changes#Changes from Version 3.0 to Version 3.1|Changes from Version 3.0 to Version 3.1]] – [[changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] were already introduced in the corresponding sections in previous versions of this standard.

## Changes from Version 3.1 to Version 4.0





### Fixes to Errata in Previous Versions of MPI



1.  Sections [[topol#Neighborhood Gather|Neighborhood Gather]] , [[topol#Neighbor Alltoall|Neighbor Alltoall]] and [[topol#An Application Example|An Application Example]] on pages [[topol#Neighborhood Gather|Neighborhood Gather]] , [[topol#Neighbor Alltoall|Neighbor Alltoall]] and [[topol#An Application Example|An Application Example]] , and MPI-3.1 Sections 7.6.1, 7.6.2 and 7.8 on pages 315, 318 and 329.

    `MPI_NEIGHBOR_ALLTOALL<span class="roman">{</span>$`|`$V$`|`$W<span class="roman">}</span>` and

    `MPI_NEIGHBOR_ALLGATHER<span class="roman">{</span>$`|`$V<span class="roman">}</span>` for Cartesian virtual grids were clarified. An advice to implementors was added to illustrate a correct implementation for the case of `periods[d]==1` or `.TRUE.` and `dims[d]==1` or `2` in a direction `d`.

2.  Section [[binding#Status|Status]] on page [[binding#Status|Status]] , and MPI-3.1 Section 17.2.5 on page 657 line 11.

    Clarified that the [[MPI_STATUS_F2F08]] and [[MPI_STATUS_F082F]] routines and the declaration for `TYPE(MPI_Status)` are not supposed to appear with `mpif.h`.

3.  Sections [[terms#Named Constants|Named Constants]] , [[binding#Status|Status]] , and [[appLang-Const#Defined Constants|Defined Constants]] on pages [[terms#Named Constants|Named Constants]] , [[binding#Status|Status]] , and [[appLang-Const#Defined Constants|Defined Constants]] , and MPI-3.1 Sections 2.5.4, 17.2.5, and A.1.1 on pages 15, 656, and 669.

    Define the C constants `MPI_F_STATUS_SIZE`, `MPI_F_SOURCE`, `MPI_F_TAG`, and `MPI_F_ERROR`.

4.  Section [[binding#Status|Status]] on page [[binding#Status|Status]] , and MPI-3.1 Section 17.2.5 on page 658.

    Added missing `const` to IN parameters for [[MPI_STATUS_F2F08]] and [[MPI_STATUS_F082F]] .

### Changes in MPI-4.0



1.  Sections [[terms#Naming Conventions|Naming Conventions]] , [[sec-incompatible-since40]] , and [[binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] on pages [[terms#Naming Conventions|Naming Conventions]] , [[sec-incompatible-since40]] , and [[binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] .

    The limit for the maximum length of MPI identifiers was removed.

2.  Section [[terms-semantic]] , [[pt2pt#Communication Modes|Communication Modes]] , [[pt2pt#Communication Initiation|Communication Initiation]] , [[pt2pt#Communication Completion|Communication Completion]] , [[pt2pt#Probe|Probe]] , [[pt2pt#Matching Probe|Matching Probe]] , [[coll#Persistent Collective Operations|Persistent Collective Operations]] , [[io#Split Collective Data Access Routines|Split Collective Data Access Routines]] , and Annex [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] on pages [[terms-semantic]] , [[pt2pt#Communication Modes|Communication Modes]] , [[pt2pt#Communication Initiation|Communication Initiation]] , [[pt2pt#Communication Completion|Communication Completion]] , [[pt2pt#Probe|Probe]] , [[pt2pt#Matching Probe|Matching Probe]] , [[coll#Persistent Collective Operations|Persistent Collective Operations]] , [[io#Split Collective Data Access Routines|Split Collective Data Access Routines]] , and [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] .

    The semantic terms were updated.

3.  Sections [[terms#Counts|Counts]] and [[binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|Support for Large Count and Large Byte Displacement in MPI Language Bindings]] on pages [[terms#Counts|Counts]] and [[binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|Support for Large Count and Large Byte Displacement in MPI Language Bindings]] , and throughout the entire document.

    New large count functions `MPI\_<span class="roman">{</span>...<span class="roman">}</span>\_c`

    in C and through function overloading in the Fortran `mpi_f08` module, (with the exception of the explicit Fortran procedures [[MPI_Op_create_c]] and [[MPI_Register_datarep_c]] ) and the new large count callbacks `MPI_User_function_c` and `MPI_Datarep_conversion_function_c` together with the predefined function [[MPI_CONVERSION_FN_NULL_C]] were introduced to accomodate large buffers and/or datatypes.

    Clarifications were added to the behavior of INOUT/OUT parameters that cannot represent the value to be returned for the [[MPI_BUFFER_DETACH]] and [[MPI_FILE_GET_TYPE_EXTENT]] functions.

    A new error class `MPI_ERR_VALUE_TOO_LARGE` was introduced.

4.  Sections [[terms#Error Handling|Error Handling]] , [[inquiry#Error Handling|Error Handling]] , [[inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] , and [[dynamic#Starting MPI Processes|Starting MPI Processes]] on pages [[terms#Error Handling|Error Handling]] , [[inquiry#Error Handling|Error Handling]] , [[inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] , and [[dynamic#Starting MPI Processes|Starting MPI Processes]] .

    MPI calls that are not related to any objects are considered to be attached to the communicator `MPI_COMM_SELF` instead of `MPI_COMM_WORLD`. The definition of `MPI_ERRORS_ARE_FATAL` was clarified to cover all connected processes, and a new error handler, `MPI_ERRORS_ABORT`, was created to limit the scope of aborting.

5.  Section [[pt2pt#Nonblocking Communication|Nonblocking Communication]] on page [[pt2pt#Nonblocking Communication|Nonblocking Communication]] .

    The introduction of MPI nonblocking communication was changed to describe correctness and performance reasons for the use of nonblocking communication.

6.  Section [[pt2pt#Communication Initiation|Communication Initiation]] on page [[pt2pt#Communication Initiation|Communication Initiation]] .

    Addition of [[MPI_ISENDRECV]] and [[MPI_ISENDRECV_REPLACE]] .

7.  Sections [[pt2pt#Communication Completion|Communication Completion]] , [[pt2pt#Persistent Communication Requests|Persistent Communication Requests]] , [[coll#Persistent Collective Operations|Persistent Collective Operations]] , [[topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] , and [[topol#An Application Example|An Application Example]] on pages [[pt2pt#Communication Completion|Communication Completion]] , [[pt2pt#Persistent Communication Requests|Persistent Communication Requests]] , [[coll#Persistent Collective Operations|Persistent Collective Operations]] , [[topol#Persistent Neighborhood Communication on Process Topologies|Persistent Neighborhood Communication on Process Topologies]] , and [[topol#An Application Example|An Application Example]] .

    Persistent collective communication

    `MPI\_<span class="roman">{</span>ALLGATHER$`|`$...<span class="roman">}</span>\_INIT` including persistent collective neighborhood communication

    `MPI_NEIGHBOR\_<span class="roman">{</span>ALLGATHER$`|`$...<span class="roman">}</span>\_INIT` was added to the standard.

8.  Sections [[pt2pt#Cancel|Cancel]] and [[deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] on pages [[pt2pt#Cancel|Cancel]] and [[deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] .

    Cancelling a send request by calling [[MPI_CANCEL]] has been deprecated and may be removed in a future version of the MPI specification.

9.  Chapter [[part#Partitioned Point-to-Point Communication|Partitioned Point-to-Point Communication]] on page [[part#Partitioned Point-to-Point Communication|Partitioned Point-to-Point Communication]] .

    A new chapter on partitioned communication with the new MPI procedures

    `MPI\_<span class="roman">{</span>PARRIVED$`|`$PREADY<span class="roman">{</span>...<span class="roman">}</span><span class="roman">}</span>` and `MPI\_<span class="roman">{</span>PRECV$`|`$PSEND<span class="roman">}</span>\_INIT` was added.

10. Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] .

    `MPI_COMM_TYPE_HW_UNGUIDED` was added as a new possible value for the `split_type` parameter of the [[MPI_COMM_SPLIT_TYPE]] function.

11. Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] .

    `MPI_COMM_TYPE_HW_GUIDED` was added as a new possible value for the `split_type` parameter of the [[MPI_COMM_SPLIT_TYPE]] function, as well as a new info key `mpi_hw_resource_type`. A specific value associated with this new info key is also defined: `mpi_shared_memory`.

12. Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] .

    The functions [[MPI_COMM_DUP]] and [[MPI_COMM_IDUP]] were updated to no longer propagate info hints. This change may affect backward compatibility.

13. Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] .

    The [[MPI_COMM_IDUP_WITH_INFO]] function was added.

14. Sections [[context#Communicator Info|Communicator Info]] , [[one-side#Window Info|Window Info]] , and [[io#File Info|File Info]] on pages [[context#Communicator Info|Communicator Info]] , [[one-side#Window Info|Window Info]] , and [[io#File Info|File Info]] .

    The definition of info hints was updated to allow applications to provide assertions regarding their usage of MPI objects and operations.

15. Section [[context#Communicator Info|Communicator Info]] on page [[context#Communicator Info|Communicator Info]] .

    The new info hints `mpi_assert_no_any_tag`, `mpi_assert_no_any_source`, `mpi_assert_exact_length`, and `mpi_assert_allow_overtaking` were added for use with communicators.

16. Sections [[context#Communicator Info|Communicator Info]] , [[one-side#Window Info|Window Info]] , and [[io#File Info|File Info]] on pages [[context#Communicator Info|Communicator Info]] , [[one-side#Window Info|Window Info]] , and [[io#File Info|File Info]] .

    The semantics of the [[MPI_COMM_SET_INFO]] , [[MPI_COMM_GET_INFO]] , [[MPI_WIN_SET_INFO]] , [[MPI_WIN_GET_INFO]] , [[MPI_FILE_SET_INFO]] , and [[MPI_FILE_GET_INFO]] were clarified.

17. Section [[topol#Topology Constructors|Topology Constructors]] on page [[topol#Topology Constructors|Topology Constructors]] .

    [[MPI_DIMS_CREATE]] is now guaranteed to return `MPI_SUCCESS` if the number of dimensions passed to the routine is set to 0 and the number of nodes is set to 1.

18. Sections [[inquiry#Memory Allocation|Memory Allocation]] , [[one-side#Window That Allocates Memory|Window That Allocates Memory]] , and [[one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] on pages [[inquiry#Memory Allocation|Memory Allocation]] , [[one-side#Window That Allocates Memory|Window That Allocates Memory]] , and [[one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] .

    Introduced alignment requirements for memory allocated through [[MPI_ALLOC_MEM]] , [[MPI_WIN_ALLOCATE]] , and [[MPI_WIN_ALLOCATE_SHARED]] and added a new `info` key `mpi_minimum_memory_alignment` to specify a desired alternative minimum alignment.

19. Sections [[inquiry#Error Handling|Error Handling]] and [[inquiry#Error Codes and Classes|Error Codes and Classes]] on pages [[inquiry#Error Handling|Error Handling]] and [[inquiry#Error Codes and Classes|Error Codes and Classes]] .

    Clarified definition of errors to say that MPI should continue whenever possible and allow the user to recover from errors.

20. Section [[inquiry#Error Codes and Classes|Error Codes and Classes]] on page [[inquiry#Error Codes and Classes|Error Codes and Classes]] .

    Added text to clarify what is implied about the status of MPI and user visible buffers when MPI functions return `MPI_SUCCESS` or other error codes.

21. Section [[inquiry#Error Codes and Classes|Error Codes and Classes]] on page [[inquiry#Error Codes and Classes|Error Codes and Classes]] .

    The error class `MPI_ERR_PROC_ABORTED` has been added.

22. Section [[misc#The Info Object|The Info Object]] on page [[misc#The Info Object|The Info Object]] .

    Added a new function [[MPI_INFO_GET_STRING]] that takes a buffer length argument for returning info value strings. This function returns the required buffer length for the requested string and guarantees null termination for C strings where buffer size is greater than 0.

23. Section [[misc#The Info Object|The Info Object]] on page [[misc#The Info Object|The Info Object]] and Section [[deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] on page [[deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] .

    [[MPI_INFO_GET]] and [[MPI_INFO_GET_VALUELEN]] were deprecated.

24. Chapter [[dynamic#Process Initialization, Creation, and Management|Process Initialization, Creation, and Management]] , [[pt2pt#Message Envelope|Message Envelope]] , [[context#Predefined Intra-Communicators|Predefined Intra-Communicators]] , [[context#Group Constructors|Group Constructors]] , [[context#Communicator Constructors|Communicator Constructors]] , [[context#Inter-Communicator Operations|Inter-Communicator Operations]] , [[inquiry#Version Inquiries|Version Inquiries]] , [[inquiry#Environmental Inquiries|Environmental Inquiries]] , [[inquiry#Error Handling|Error Handling]] , [[inquiry#Error Handlers for Sessions|Error Handlers for Sessions]] , [[inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] , [[dynamic#MPI and Threads|MPI and Threads]] , [[io#Opening a File|Opening a File]] , [[io#Querying File Parameters|Querying File Parameters]] , [[io#I/O Error Handling|I/O Error Handling]] , [[tools#Initialization and Finalization|Initialization and Finalization]] , [[binding#Transfer of Handles|Transfer of Handles]] , [[binding#MPI Opaque Objects|MPI Opaque Objects]] , and Annex [[appLang-Const#Language Bindings Summary|Language Bindings Summary]] on pages [[dynamic#Process Initialization, Creation, and Management|Process Initialization, Creation, and Management]] , [[pt2pt#Message Envelope|Message Envelope]] , [[context#Predefined Intra-Communicators|Predefined Intra-Communicators]] , [[context#Group Constructors|Group Constructors]] , [[context#Communicator Constructors|Communicator Constructors]] , [[context#Inter-Communicator Operations|Inter-Communicator Operations]] , [[inquiry#Version Inquiries|Version Inquiries]] , [[inquiry#Environmental Inquiries|Environmental Inquiries]] , [[inquiry#Error Handling|Error Handling]] , [[inquiry#Error Handlers for Sessions|Error Handlers for Sessions]] , [[inquiry#Error Classes, Error Codes, and Error Handlers|Error Classes, Error Codes, and Error Handlers]] , [[dynamic#MPI and Threads|MPI and Threads]] , [[io#Opening a File|Opening a File]] , [[io#Querying File Parameters|Querying File Parameters]] , [[io#I/O Error Handling|I/O Error Handling]] , [[tools#Initialization and Finalization|Initialization and Finalization]] , [[binding#Transfer of Handles|Transfer of Handles]] , [[binding#MPI Opaque Objects|MPI Opaque Objects]] , and [[appLang-Const#Language Bindings Summary|Language Bindings Summary]] .

    The Sessions Model was added to the standard. New MPI procedures are

    `MPI_SESSION\_<span class="roman">{</span>INIT$`|`$FINALIZE<span class="roman">}</span>` ,

    `MPI_SESSION_GET\_<span class="roman">{</span>...<span class="roman">}</span>` ,

    `MPI_SESSION\_<span class="roman">{</span>...<span class="roman">}</span>\_ERRHANDLER` , [[MPI_GROUP_FROM_SESSION_PSET]] , [[MPI_COMM_CREATE_FROM_GROUP]] , [[MPI_INTERCOMM_CREATE_FROM_GROUPS]] ,

    and new conversion functions are `MPI_SESSION\_<span class="roman">{</span>C2F$`|`$F2C<span class="roman">}</span>` . New declarations are `MPI_Session` in C and `TYPE(MPI_Session)` together with the related overloaded operators `.EQ.`, `.NE.`, `==` and `/=` in the Fortran `mpi_f08` and `mpi` modules, and the callback function prototype `MPI_Session_errhandler_function`. New constants are `MPI_SESSION_NULL`, `MPI_ERR_SESSION`, `MPI_MAX_PSET_NAME_LEN`, `MPI_MAX_STRINGTAG_LEN`, `MPI_T_BIND_MPI_SESSION` and the predefined info key `mpi_size`.

25. Section [[dynamic#Starting MPI Processes|Starting MPI Processes]] on page [[dynamic#Starting MPI Processes|Starting MPI Processes]] .

    A new function [[MPI_INFO_CREATE_ENV]] was added.

26. Sections [[dynamic#Starting MPI Processes|Starting MPI Processes]] and [[dynamic#Releasing Connections|Releasing Connections]] on pages [[dynamic#Starting MPI Processes|Starting MPI Processes]] and [[dynamic#Releasing Connections|Releasing Connections]] .

    Clarified the semantic of failure and error reporting before (and during) [[MPI_INIT]] and after [[MPI_FINALIZE]] .

27. Section [[dynamic#Reserved Keys|Reserved Keys]] on page [[dynamic#Reserved Keys|Reserved Keys]] .

    Added the `mpi_initial_errhandler` reserved info key with the reserved values `mpi_errors_abort`, `mpi_errors_are_fatal`, and `mpi_errors_return` to the launch keys in [[MPI_COMM_SPAWN]] , [[MPI_COMM_SPAWN_MULTIPLE]] , and [[mpiexec]] .

28. Section [[one-side#Lock|Lock]] on page [[one-side#Lock|Lock]] .

    RMA passive target synchronization using locks can now be used portably in memory allocated via [[MPI_WIN_ALLOCATE_SHARED]] .

29. Section [[ei#Associating Information with Status|Associating Information with Status]] on page [[ei#Associating Information with Status|Associating Information with Status]] .

    The `mpi_f08` binding incorrectly had the dummy parameter `flag` in the MPI F08 binding for [[MPI_STATUS_SET_CANCELLED]] marked as `INTENT(OUT)`. It has been fixed to be `INTENT(IN)`.

30. Sections [[tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] and [[tools#Events|Events]] on pages [[tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] and [[tools#Events|Events]] .

    A callback-driven event interface

    with the `MPI_T\_<span class="roman">{</span>SOURCE$`|`$EVENT<span class="roman">}</span>\_<span class="roman">{</span>...<span class="roman">}</span>` and `MPI_T_CATEGORY\_<span class="roman">{</span>GET$`|`$GET_NUM<span class="roman">}</span>\_EVENTS` routines, the declaration types `MPI_T_cb_safety`, `MPI_T_event_`<span class="roman">`{`</span>`instance`$`|`$`registration`<span class="roman">`}`</span>, `MPI_T_source_order`, and the callback function prototypes `MPI_T_event_`<span class="roman">`{`</span>`cb`$`|`$`dropped_cb`$`|`$`free_cb`<span class="roman">`}`</span>`_function`,

    was added to the MPI tool information interface.

31. Section [[tools#Category Member Query Functions|Category Member Query Functions]] on page [[tools#Category Member Query Functions|Category Member Query Functions]] .

    The argument `stamp` (previously described as a virtual time stamp) from [[MPI_T_CATEGORY_CHANGED]] was renamed to `update_number` and its intended implementation and use was clarified.

32. Section [[tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] , Table [[tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] , and Section [[deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] on pages [[tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] , [[tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] , and [[deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] .

    `MPI_T_ERR_INVALID_ITEM` is deprecated. MPI routines should return

    `MPI_T_ERR_INVALID_INDEX` instead of `MPI_T_ERR_INVALID_ITEM`.

33. Section [[deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] on page [[deprecated#Deprecated since MPI-4.0|Deprecated since MPI-4.0]] .

    [[MPI_SIZEOF]] was deprecated.

34. Section [[binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] on page [[binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] .

    An exception was added for the specific Fortran names in the case of TS 29113 interface specifications in `mpif.h` for [[MPI_NEIGHBOR_ALLTOALLW_INIT]] , [[MPI_NEIGHBOR_ALLTOALLV_INIT]] , and [[MPI_NEIGHBOR_ALLGATHERV_INIT]] .

## Changes from Version 3.0 to Version 3.1





### Fixes to Errata in Previous Versions of MPI



1.  Chapters [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] – [[binding#Language Bindings|Language Bindings]] , Annex [[appLang-Fortran2008#Fortran 2008 Bindings with the mpif08 Module|Fortran 2008 Bindings with the mpif08 Module]] on page [[appLang-Fortran2008#Fortran 2008 Bindings with the mpif08 Module|Fortran 2008 Bindings with the mpif08 Module]] , and Example [[coll-exX-fortran]] on page [[coll-exX-fortran]] , and MPI-3.0 Chapters 3–17, Annex A.3 on page 707, and Example 5.21 on page 187.

    Within the `mpi_f08` Fortran support method, `BIND(C)` was removed from all `SUBROUTINE`, `FUNCTION`, and `ABSTRACT INTERFACE` definitions.

2.  Section [[pt2pt#Return Status|Return Status]] on page [[pt2pt#Return Status|Return Status]] , and MPI-3.0 Section 3.2.5 on page 30.

    The three public fields `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR` of the Fortran derived type `TYPE(MPI_Status)` must be of type `INTEGER`.

3.  Section [[pt2pt#Matching Probe|Matching Probe]] on page [[pt2pt#Matching Probe|Matching Probe]] , and MPI-3.0 Section 3.8.2 on page 67.

    The flag arguments of the Fortran interfaces of [[MPI_IMPROBE]] were originally incorrectly defined as `INTEGER` (instead as `LOGICAL`).

4.  Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] , and MPI-3.0 Section 6.4.2 on page 237.

    In the `mpi_f08` binding of [[MPI_COMM_IDUP]] , the output argument `newcomm` is declared as `ASYNCHRONOUS`.

5.  Section [[context#Communicator Info|Communicator Info]] on page [[context#Communicator Info|Communicator Info]] , and MPI-3.0 Section 6.4.4 on page 248.

    In the `mpi_f08` binding of [[MPI_COMM_SET_INFO]] , the intent of `comm` is `IN`, and the optional output argument `ierror` was missing.

6.  Section [[topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] on page [[topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] , and MPI-3.0 Sections 7.6, on pages 314.

    In the case of virtual general graph topolgies (created with [[MPI_CART_CREATE]] ), the use of neighborhood collective communication is restricted to adjacency matrices with the number of edges between any two processes is defined to be the same for both processes (i.e., with a symmetric adjacency matrix).

7.  Section [[inquiry#Version Inquiries|Version Inquiries]] on page [[inquiry#Version Inquiries|Version Inquiries]] , and MPI-3.0 Section 8.1.1 on page 335.

    In the `mpi_f08` binding of [[MPI_GET_LIBRARY_VERSION]] , a typo in the `resultlen` argument was corrected.

8.  Sections [[inquiry#Memory Allocation|Memory Allocation]] ( [[MPI_ALLOC_MEM]] and [[MPI_ALLOC_MEM_CPTR]] ),\
    [[one-side#Window That Allocates Memory|Window That Allocates Memory]] ( [[MPI_WIN_ALLOCATE]] and [[MPI_WIN_ALLOCATE_CPTR]] ),\
    [[one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] ( [[MPI_WIN_ALLOCATE_SHARED]] and [[MPI_WIN_ALLOCATE_SHARED_CPTR]] ),\
    [[one-side#Window That Allocates Shared Memory|Window That Allocates Shared Memory]] ( [[MPI_WIN_SHARED_QUERY]] and [[MPI_WIN_SHARED_QUERY_CPTR]] ),\
    [[tools#Requirements|Requirements]] and [[tools#Complications|Complications]] (Profiling interface), and corresponding sections in MPI-3.0.

    The linker name concept was substituted by defining specific procedure names.

9.  Section [[one-side#Window Creation|Window Creation]] on page [[one-side#Window Creation|Window Creation]] , and MPI-3.0 Section 11.2.2 on page 407.

    The `same_size` info key can be used with all window flavors, and requires that all processes in the process group of the communicator have provided this info key with the same value.

10. Section [[one-side#Accumulate Functions|Accumulate Functions]] on page [[one-side#Accumulate Functions|Accumulate Functions]] , and MPI-3.0 Section 11.3.4 on page 424.

    Origin buffer arguments to [[MPI_GET_ACCUMULATE]] are ignored when the `MPI_NO_OP` operation is used.

11. Section [[one-side#Accumulate Functions|Accumulate Functions]] on page [[one-side#Accumulate Functions|Accumulate Functions]] , and MPI-3.0 Section 11.3.4 on page 424.

    Clarify the roles of origin, result, and target communication parameters in [[MPI_GET_ACCUMULATE]] .

12. Section [[tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] on page [[tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] , and MPI-3.0 Section 14.3 on page 561

    New paragraph and advice to users clarifying intent of variable names in the tools information interface.

13. Section [[tools#Convention for Returning Strings|Convention for Returning Strings]] on page [[tools#Convention for Returning Strings|Convention for Returning Strings]] , and MPI-3.0 Section 14.3.3 on page 563.

    New paragraph clarifying variable name equivalence in the tools information interface.

14. Sections [[tools#Control Variables|Control Variables]] , [[tools#Performance Variables|Performance Variables]] , and [[tools#Variable Categorization|Variable Categorization]] on pages [[tools#Control Variables|Control Variables]] , [[tools#Performance Variables|Performance Variables]] , and [[tools#Variable Categorization|Variable Categorization]] , and

    MPI-3.0 Sections 14.3.6, 14.3.7, and 14.3.8 on pages 567, 573, and 584.

    In functions [[MPI_T_CVAR_GET_INFO]] , [[MPI_T_PVAR_GET_INFO]] , and [[MPI_T_CATEGORY_GET_INFO]] , clarification of parameters that must be identical for equivalent control variable / performance variable / category names across connected processes.

15. Section [[tools#Performance Variables|Performance Variables]] on page [[tools#Performance Variables|Performance Variables]] , and MPI-3.0 Section 14.3.7 on page 573.

    Clarify return code

    of `MPI_T_PVAR\_<span class="roman">{</span>START,STOP,RESET<span class="roman">}</span>` routines.

16. Section [[tools#Performance Variables|Performance Variables]] on page [[tools#Performance Variables|Performance Variables]] , and MPI-3.0 Section 14.3.7 on page 579, line 7.

    Clarify the return code when bad handle is passed to

    an `MPI_T_PVAR\_\*` routine.

17. Section [[f90-basic]] on page [[f90-basic]] , and MPI-3.0 Section 17.1.4 on page 603.

    The advice to implementors at the end of the section was rewritten and moved into the following section.

18. Section [[binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] on page [[binding#Interface Specifications, Procedure Names, and the Profiling Interface|Interface Specifications, Procedure Names, and the Profiling Interface]] , and MPI-3.0 Section 17.1.5 on page 605.

    The section was fully rewritten. The linker name concept was substituted by defining specific procedure names.

19. Section [[binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] on page [[binding#MPI for Different Fortran Standard Versions|MPI for Different Fortran Standard Versions]] , and MPI-3.0 Section 17.1.6 on page 611.

    The requirements on `BIND(C)` procedure interfaces were removed.

20. Annexes [[appLang-C#C Bindings|C Bindings]] , [[appLang-Fortran2008#Fortran 2008 Bindings with the mpif08 Module|Fortran 2008 Bindings with the mpif08 Module]] , and [[appLang-Fortran#Fortran Bindings with mpif.h or the mpi Module|Fortran Bindings with mpif.h or the mpi Module]] on pages [[appLang-C#C Bindings|C Bindings]] , [[appLang-Fortran2008#Fortran 2008 Bindings with the mpif08 Module|Fortran 2008 Bindings with the mpif08 Module]] , and [[appLang-Fortran#Fortran Bindings with mpif.h or the mpi Module|Fortran Bindings with mpif.h or the mpi Module]] , and

    MPI-3.0 Annexes A.2, A.3, and A.4 on pages 685, 707, and 756.

    The predefined callback [[MPI_CONVERSION_FN_NULL]] was added to all three annexes.

21. Annex [[appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] on page [[appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] , and MPI-3.0 Annex A.3.4 on page 724.

    In the `mpi_f08` binding

    of\
    `MPI\_<span class="roman">{</span>COMM$`|`$TYPE$`|`$WIN<span class="roman">}</span>\_<span class="roman">{</span>DUP$`|`$NULL_COPY$`|`$NULL_DELETE<span class="roman">}</span>\_FN` , all `INTENT(...)` information was removed.

### Changes in MPI-3.1



1.  Sections [[terms#Functions and Macros|Functions and Macros]] and [[datatypes#Address and Size Functions|Address and Size Functions]] on pages [[terms#Functions and Macros|Functions and Macros]] and [[datatypes#Address and Size Functions|Address and Size Functions]] .

    The use of the intrinsic operators “`+`” and “`-`” for absolute addresses is substituted by [[MPI_AINT_ADD]] and [[MPI_AINT_DIFF]] . In C, they can be implemented as macros.

2.  Sections [[inquiry#Version Inquiries|Version Inquiries]] , [[dynamic#Starting MPI Processes|Starting MPI Processes]] , and [[dynamic#MPI and Threads|MPI and Threads]] on pages [[inquiry#Version Inquiries|Version Inquiries]] , [[dynamic#Starting MPI Processes|Starting MPI Processes]] , and [[dynamic#MPI and Threads|MPI and Threads]] .

    The routines [[MPI_INITIALIZED]] , [[MPI_FINALIZED]] , [[MPI_QUERY_THREAD]] , [[MPI_IS_THREAD_MAIN]] , [[MPI_GET_VERSION]] , and [[MPI_GET_LIBRARY_VERSION]] are callable from threads without restriction (in the sense of `MPI_THREAD_MULTIPLE`), irrespective of the actual level of thread support provided, in the case where the implementation supports threads.

3.  Section [[one-side#Window Creation|Window Creation]] on page [[one-side#Window Creation|Window Creation]] .

    The `same_disp_unit` info key was added for use in RMA window creation routines.

4.  Sections [[io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] and [[io#Data Access with Individual File Pointers|Data Access with Individual File Pointers]] on pages [[io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] and [[io#Data Access with Individual File Pointers|Data Access with Individual File Pointers]] .

    Added [[MPI_FILE_IREAD_AT_ALL]] , [[MPI_FILE_IWRITE_AT_ALL]] , [[MPI_FILE_IREAD_ALL]] , and [[MPI_FILE_IWRITE_ALL]]

5.  Sections [[tools#Control Variables|Control Variables]] , [[tools#Performance Variables|Performance Variables]] , and [[tools#Variable Categorization|Variable Categorization]] on pages [[tools#Control Variables|Control Variables]] , [[tools#Performance Variables|Performance Variables]] , and [[tools#Variable Categorization|Variable Categorization]] .

    Clarified that `NULL` parameters can be provided

    in\
    `MPI_T\_<span class="roman">{</span>CVAR$`|`$PVAR$`|`$CATEGORY<span class="roman">}</span>\_GET_INFO` routines.

6.  Sections [[tools#Control Variables|Control Variables]] , [[tools#Performance Variables|Performance Variables]] , [[tools#Variable Categorization|Variable Categorization]] , and [[tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] on pages [[tools#Control Variables|Control Variables]] , [[tools#Performance Variables|Performance Variables]] , [[tools#Variable Categorization|Variable Categorization]] , and [[tools#Return Codes for the MPI Tool Information Interface|Return Codes for the MPI Tool Information Interface]] .

    New routines [[MPI_T_CVAR_GET_INDEX]] , [[MPI_T_PVAR_GET_INDEX]] , [[MPI_T_CATEGORY_GET_INDEX]] , were added to support retrieving indices of variables and categories. The error codes `MPI_T_ERR_INVALID` and `MPI_T_ERR_INVALID_NAME` were added to indicate invalid uses of the interface.

## Changes from Version 2.2 to Version 3.0



### Fixes to Errata in Previous Versions of MPI



1.  Sections [[terms#Fortran Binding Issues|Fortran Binding Issues]] and [[terms#C Binding Issues|C Binding Issues]] on pages [[terms#Fortran Binding Issues|Fortran Binding Issues]] and [[terms#C Binding Issues|C Binding Issues]] , and MPI-2.2 Section 2.6.2 on page 17, lines 41–42, Section 2.6.3 on page 18, lines 15–16, and Section 2.6.4 on page 18, lines 40–41.

    This is an MPI-2 erratum: The scope for the reserved prefix `MPI_` and the C++ namespace `MPI` is now any name as originally intended in MPI-1.

2.  Sections [[pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , [[io#External Data Representation: external32|External Data Representation: external32]] Table [[io#External Data Representation: external32|External Data Representation: external32]] ,

    and Annex [[appLang-Const#Defined Constants|Defined Constants]] on pages [[pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , [[io#External Data Representation: external32|External Data Representation: external32]] ,

    and [[appLang-Const#Defined Constants|Defined Constants]] , and MPI-2.2 Sections 3.2.2, 5.9.2, 13.5.2 Table 13.2, 16.1.16 Table 16.1, and Annex A.1.1 on pages 27, 164, 433, 472 and 513

    This is an MPI-2.2 erratum: New named predefined datatypes `MPI_CXX_BOOL`, `MPI_CXX_FLOAT_COMPLEX`, `MPI_CXX_DOUBLE_COMPLEX`, and `MPI_CXX_LONG_DOUBLE_COMPLEX` were added in C and Fortran corresponding to the C++ types `bool`, `std::complex<float>`, `std::complex<double>`, and `std::complex<long double>`. These datatypes also correspond to the deprecated C++ predefined datatypes `MPI::BOOL`, `MPI::COMPLEX`, `MPI::DOUBLE_COMPLEX`, and `MPI::LONG_DOUBLE_COMPLEX`, which were removed in MPI-3.0. The nonstandard C++ types `Complex<...>` were substituted by the standard types `std::complex<...>`.

3.  Sections [[coll-predefined-op]] on pages [[coll-predefined-op]] and MPI-2.2 Section 5.9.2, page 165, line 47.

    This is an MPI-2.2 erratum: `MPI_C_COMPLEX` was added to the “Complex” reduction group.

4.  Section [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] , and MPI-2.2, Section 7.5.5 on page 257, C++ interface on page 264, line 3.

    This is an MPI-2.2 erratum: The argument `rank` was removed and `in/outdegree` are now defined as `int& indegree` and `int& outdegree` in the C++ interface of [[MPI_DIST_GRAPH_NEIGHBORS_COUNT]] .

5.  Section [[io#External Data Representation: external32|External Data Representation: external32]] , Table [[io#External Data Representation: external32|External Data Representation: external32]] on page [[io#External Data Representation: external32|External Data Representation: external32]] , and MPI-2.2, Section 13.5.3, Table 13.2 on page 433.

    This was an MPI-2.2 erratum: The `MPI_C_BOOL` `external32` representation is corrected to a 1-byte size.

6.  MPI-2.2 Section 16.1.16 on page 471, line 45.

    This is an MPI-2.2 erratum: The constant `MPI::_LONG_LONG` should be `MPI::LONG_LONG`.

7.  Annex [[appLang-Const#Defined Constants|Defined Constants]] on page [[appLang-Const#Defined Constants|Defined Constants]] , Table “Optional datatypes (Fortran),” and

    MPI-2.2, Annex A.1.1, Table on page 517, lines 34, and 37–41.

    This is an MPI-2.2 erratum: The C++ datatype handles `MPI::INTEGER16`, `MPI::REAL16`, `MPI::F_COMPLEX4`, `MPI::F_COMPLEX8`, `MPI::F_COMPLEX16`, `MPI::F_COMPLEX32` were added to the table.

### Changes in MPI-3.0

1.  Section [[terms#Deprecated and Removed Interfaces|Deprecated and Removed Interfaces]] on page [[terms#Deprecated and Removed Interfaces|Deprecated and Removed Interfaces]] , Section [[sec-rm-cpp]] on page [[sec-rm-cpp]] and all other chapters.

    The C++ bindings were removed from the standard. See errata in Section [[changes#Fixes to Errata in Previous Versions of MPI|Fixes to Errata in Previous Versions of MPI]] on page [[changes#Fixes to Errata in Previous Versions of MPI|Fixes to Errata in Previous Versions of MPI]] for the latest changes to the MPI C++ binding defined in MPI-2.2. This change may affect backward compatibility.

2.  Section [[terms#Deprecated and Removed Interfaces|Deprecated and Removed Interfaces]] on page [[terms#Deprecated and Removed Interfaces|Deprecated and Removed Interfaces]] , Section [[deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] on page [[deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] and Section [[sec-rm-mpii]] on page [[sec-rm-mpii]] .

    The deprecated functions [[MPI_TYPE_HVECTOR]] , [[MPI_TYPE_HINDEXED]] , [[MPI_TYPE_STRUCT]] , [[MPI_ADDRESS]] , [[MPI_TYPE_EXTENT]] , [[MPI_TYPE_LB]] , [[MPI_TYPE_UB]] , [[MPI_ERRHANDLER_CREATE]] (and its callback function prototype `MPI_Handler_function`), [[MPI_ERRHANDLER_SET]] , [[MPI_ERRHANDLER_GET]] , the deprecated special datatype handles `MPI_LB`, `MPI_UB`, and the constants `MPI_COMBINER_HINDEXED_INTEGER`, `MPI_COMBINER_HVECTOR_INTEGER`, `MPI_COMBINER_STRUCT_INTEGER` were removed from the standard. This change may affect backward compatibility.

3.  Section [[terms-procedure-specification]] on page [[terms-procedure-specification]] .

    Clarified parameter usage for IN parameters. C bindings are now const-correct where backward compatibility is preserved.

4.  Section [[terms#Named Constants|Named Constants]] on page [[terms#Named Constants|Named Constants]] and Section [[topol#Distributed Graph Constructor|Distributed Graph Constructor]] on page [[topol#Distributed Graph Constructor|Distributed Graph Constructor]] .

    The recommended C implementation value for `MPI_UNWEIGHTED` changed from NULL to non-NULL. An additional weight array constant (`MPI_WEIGHTS_EMPTY`) was introduced.

5.  Section [[terms#Named Constants|Named Constants]] on page [[terms#Named Constants|Named Constants]] and Section [[inquiry#Version Inquiries|Version Inquiries]] on page [[inquiry#Version Inquiries|Version Inquiries]] .

    Added the new routine [[MPI_GET_LIBRARY_VERSION]] to query library specific versions, and the new constant `MPI_MAX_LIBRARY_VERSION_STRING`.

6.  Sections [[terms#Counts|Counts]] , [[pt2pt#Message Data|Message Data]] , [[pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , on pages [[terms#Counts|Counts]] , [[pt2pt#Message Data|Message Data]] , [[pt2pt#Message Data|Message Data]] , [[coll-predefined-op]] , Sections [[datatypes#Derived Datatypes|Derived Datatypes]] , [[datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , [[datatypes#True Extent of Datatypes|True Extent of Datatypes]] , [[datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[func-mpi-status-set-elements-x]] on pages [[datatypes#Derived Datatypes|Derived Datatypes]] , [[datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , [[datatypes#True Extent of Datatypes|True Extent of Datatypes]] , [[datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[func-mpi-status-set-elements-x]] , and Annex [[appLang-Const#Defined Constants|Defined Constants]] on page [[appLang-Const#Defined Constants|Defined Constants]] .

    New inquiry functions, [[MPI_TYPE_SIZE_X]] , [[MPI_TYPE_GET_EXTENT_X]] , [[MPI_TYPE_GET_TRUE_EXTENT_X]] , and [[MPI_GET_ELEMENTS_X]] , return their results as an `MPI_Count` value, which is a new type large enough to represent element counts in memory, file views, etc. A new function, [[MPI_STATUS_SET_ELEMENTS_X]] , modifies the opaque part of an `MPI_Status` object so that a call to [[MPI_GET_ELEMENTS_X]] returns the provided `MPI_Count` value (in Fortran, `INTEGER(KIND=MPI_COUNT_KIND)`). The corresponding predefined datatype is `MPI_COUNT`.

7.  Chapter [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] on page [[pt2pt#Point-to-Point Communication|Point-to-Point Communication]] through Chapter [[binding#Language Bindings|Language Bindings]] on page [[binding#Language Bindings|Language Bindings]] .

    In the C language bindings, the array-arguments’ interfaces were modified to consistently use use `[``]` instead of `*`.

    Exceptions are [[MPI_INIT]] , which continues to use `char ***argv` (correct because of subtle rules regarding the use of the `&` operator with `char *argv[]`), and [[MPI_INIT_THREAD]] , which is changed to be consistent with [[MPI_INIT]] .

8.  Sections [[pt2pt#Return Status|Return Status]] , [[datatypes#Address and Size Functions|Address and Size Functions]] , [[datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[datatypes#Pack and Unpack|Pack and Unpack]] on pages [[pt2pt#Return Status|Return Status]] , [[datatypes#Address and Size Functions|Address and Size Functions]] , [[datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] , [[datatypes#Pack and Unpack|Pack and Unpack]] .

    The functions [[MPI_GET_COUNT]] and [[MPI_GET_ELEMENTS]] were defined to set the `count` argument to `MPI_UNDEFINED` when that argument would overflow. The functions [[MPI_PACK_SIZE]] and [[MPI_TYPE_SIZE]] were defined to set the `size` argument to `MPI_UNDEFINED` when that argument would overflow. In all other MPI-2.2 routines, the type and semantics of the count arguments remain unchanged, i.e., `int` or `INTEGER`.

9.  Section [[pt2pt#Passing MPISTATUSIGNORE for Status|Passing MPISTATUSIGNORE for Status]] on page [[pt2pt#Passing MPISTATUSIGNORE for Status|Passing MPISTATUSIGNORE for Status]] , and Section [[pt2pt#Probe and Cancel|Probe and Cancel]] on page [[pt2pt#Probe and Cancel|Probe and Cancel]] .

    `MPI_STATUS_IGNORE` can be also used in [[MPI_IPROBE]] , [[MPI_PROBE]] , [[MPI_IMPROBE]] , and [[MPI_MPROBE]] .

10. Section [[pt2pt#Probe and Cancel|Probe and Cancel]] on page [[pt2pt#Probe and Cancel|Probe and Cancel]] and Section [[pt2pt#Null Processes|Null Processes]] on page [[pt2pt#Null Processes|Null Processes]] .

    The use of `MPI_PROC_NULL` in probe operations was clarified. A special predefined message `MPI_MESSAGE_NO_PROC` was defined for the use of matching probe (i.e., the new [[MPI_MPROBE]] and [[MPI_IMPROBE]] ) with `MPI_PROC_NULL`.

11. Sections [[pt2pt#Matching Probe|Matching Probe]] , [[pt2pt#Matched Receives|Matched Receives]] , [[binding#Transfer of Handles|Transfer of Handles]] , [[appLang-Const#Defined Constants|Defined Constants]] on pages [[pt2pt#Matching Probe|Matching Probe]] , [[pt2pt#Matched Receives|Matched Receives]] , [[binding#Transfer of Handles|Transfer of Handles]] , [[appLang-Const#Defined Constants|Defined Constants]] .

    Like [[MPI_PROBE]] and [[MPI_IPROBE]] , the new [[MPI_MPROBE]] and [[MPI_IMPROBE]] operations allow incoming messages to be queried without actually receiving them, except that [[MPI_MPROBE]] and [[MPI_IMPROBE]] provide a mechanism to receive the specific message with the new routines [[MPI_MRECV]] and [[MPI_IMRECV]] regardless of other intervening probe or receive operations. The opaque object `MPI_Message`, the null handle `MPI_MESSAGE_NULL`, and the conversion functions `MPI_Message_c2f` and `MPI_Message_f2c` were defined.

12. Section [[datatypes#Datatype Constructors|Datatype Constructors]] on page [[datatypes#Datatype Constructors|Datatype Constructors]] and Section [[datatypes#Decoding a Datatype|Decoding a Datatype]] on page [[datatypes#Decoding a Datatype|Decoding a Datatype]] .

    The routine [[MPI_TYPE_CREATE_HINDEXED_BLOCK]] and constant `MPI_COMBINER_HINDEXED_BLOCK` were added.

13. Chapter [[coll#Collective Communication|Collective Communication]] on page [[coll#Collective Communication|Collective Communication]] and Section [[coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] on page [[coll#Nonblocking Collective Operations|Nonblocking Collective Operations]] .

    Added nonblocking interfaces to all collective operations.

14. Sections [[context#Communicator Constructors|Communicator Constructors]] , [[context#Communicator Info|Communicator Info]] , [[one-side#Window Info|Window Info]] , on pages [[context#Communicator Constructors|Communicator Constructors]] , [[context#Communicator Info|Communicator Info]] , [[one-side#Window Info|Window Info]] .

    The new routines [[MPI_COMM_DUP_WITH_INFO]] , [[MPI_COMM_SET_INFO]] , [[MPI_COMM_GET_INFO]] , [[MPI_WIN_SET_INFO]] , and [[MPI_WIN_GET_INFO]] were added. The routine [[MPI_COMM_DUP]] must also duplicate info hints.

15. Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] .

    Added [[MPI_COMM_IDUP]] .

16. Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] .

    Added the new communicator construction routine [[MPI_COMM_CREATE_GROUP]] , which is invoked only by the processes in the group of the new communicator being constructed.

17. Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] .

    Added the [[MPI_COMM_SPLIT_TYPE]] routine and the communicator split type constant `MPI_COMM_TYPE_SHARED`.

18. Section [[context#Inter-Communicator Operations|Inter-Communicator Operations]] on page [[context#Inter-Communicator Operations|Inter-Communicator Operations]] .

    In MPI-2.2, communication involved in an [[MPI_INTERCOMM_CREATE]] operation could interfere with point-to-point communication on the parent communicator with the same tag or `MPI_ANY_TAG`. This interference has been removed in MPI-3.0.

19. Section [[context#Naming Objects|Naming Objects]] on page [[context#Naming Objects|Naming Objects]] .

    Section 6.8 on page 238. The constant `MPI_MAX_OBJECT_NAME` also applies for type and window names.

20. Section [[topol#Low-Level Topology Functions|Low-Level Topology Functions]] on page [[topol#Low-Level Topology Functions|Low-Level Topology Functions]] .

    [[MPI_CART_MAP]] can also be used for a zero-dimensional topologies.

21. Section [[topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] on page [[topol#Neighborhood Collective Communication on Process Topologies|Neighborhood Collective Communication on Process Topologies]] and Section [[topol#Nonblocking Neighborhood Communication on Process Topologies|Nonblocking Neighborhood Communication on Process Topologies]] on page [[topol#Nonblocking Neighborhood Communication on Process Topologies|Nonblocking Neighborhood Communication on Process Topologies]] .

    The following neighborhood collective communication routines were added to support sparse communication on virtual topology grids: [[MPI_NEIGHBOR_ALLGATHER]] , [[MPI_NEIGHBOR_ALLGATHERV]] , [[MPI_NEIGHBOR_ALLTOALL]] , [[MPI_NEIGHBOR_ALLTOALLV]] , [[MPI_NEIGHBOR_ALLTOALLW]] and the nonblocking variants [[MPI_INEIGHBOR_ALLGATHER]] , [[MPI_INEIGHBOR_ALLGATHERV]] , [[MPI_INEIGHBOR_ALLTOALL]] , [[MPI_INEIGHBOR_ALLTOALLV]] , and [[MPI_INEIGHBOR_ALLTOALLW]] . The displacement arguments in [[MPI_NEIGHBOR_ALLTOALLW]] and [[MPI_INEIGHBOR_ALLTOALLW]] were defined as address size integers. In [[MPI_DIST_GRAPH_NEIGHBORS]] , an ordering rule was added for communicators created with [[MPI_DIST_GRAPH_CREATE_ADJACENT]] .

22. Section [[dynamic#Starting MPI Processes|Starting MPI Processes]] on page [[dynamic#Starting MPI Processes|Starting MPI Processes]] and Section [[dynamic#Starting MPI Processes|Starting MPI Processes]] on page [[dynamic#Starting MPI Processes|Starting MPI Processes]] .

    The use of [[MPI_INIT]] , [[MPI_INIT_THREAD]] and [[MPI_FINALIZE]] was clarified. After MPI is initialized, the application can access information about the execution environment by querying the new predefined info object `MPI_INFO_ENV`.

23. Section [[dynamic#Starting MPI Processes|Starting MPI Processes]] on page [[dynamic#Starting MPI Processes|Starting MPI Processes]] .

    Allow calls to [[MPI_T]] routines before [[MPI_INIT]] and after [[MPI_FINALIZE]] .

24. Chapter [[one-side#One-Sided Communications|One-Sided Communications]] on page [[one-side#One-Sided Communications|One-Sided Communications]] .

    Substantial revision of the entire One-sided chapter, with new routines for window creation, additional synchronization methods in passive target communication, new one-sided communication routines, a new memory model, and other changes.

25. Section [[tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] on page [[tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] .

    A new MPI Tool Information Interface was added.

    The following changes are related to the Fortran language support.

26. Section [[terms-procedure-specification]] on page [[terms-procedure-specification]] , and Sections [[f90-overview]] , [[f90-mpif08]] , [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on pages [[f90-overview]] , [[f90-mpif08]] , and [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

    The new `mpi_08` Fortran module was introduced.

27. Section [[terms-opaque-objects]] on page [[terms-opaque-objects]] , and Sections [[f90-mpif08]] , [[f90-extended]] , [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on pages [[f90-mpif08]] , [[f90-extended]] , and [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

    Handles to opaque objects were defined as named types within the `mpi_08` Fortran module. The operators `.EQ.`, `.NE.`, `==`, and `/=` were overloaded to allow the comparison of these handles. The handle types and the overloaded operators are also available through the `mpi` Fortran module.

28. Sections [[terms#Named Constants|Named Constants]] , [[sub-choice]] on pages [[terms#Named Constants|Named Constants]] , [[sub-choice]] , Sections [[f90-overview]] , [[binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] , [[binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] , [[binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] , [[binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] on pages [[f90-overview]] , [[binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] , [[binding#Problems Due to Strong Typing|Problems Due to Strong Typing]] , [[binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] , [[binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] , and Sections [[f90-mpif08]] , [[f90-extended]] , [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on pages [[f90-mpif08]] , [[f90-extended]] , [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

    Within the `mpi_08` Fortran module, choice buffers were defined as assumed-type and assumed-rank according to Fortran 2008 TS 29113 , and the compile-time constant `MPI_SUBARRAYS_SUPPORTED` was set to `.TRUE.`. With this, Fortran subscript triplets can be used in nonblocking MPI operations; vector subscripts are not supported in nonblocking operations. If the compiler does not support this Fortran TS 29113 feature, the constant is set to `.FALSE.`.

29. Section [[terms#Fortran Binding Issues|Fortran Binding Issues]] on page [[terms#Fortran Binding Issues|Fortran Binding Issues]] , Section [[f90-mpif08]] on page [[f90-mpif08]] , and Section [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

    The `ierror` dummy arguments are `OPTIONAL` within the `mpi_08` Fortran module.

30. Section [[pt2pt#Return Status|Return Status]] on page [[pt2pt#Return Status|Return Status]] , Sections [[f90-mpif08]] , [[f90-extended]] , [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] , on pages [[f90-mpif08]] , [[f90-extended]] , [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] , and Section [[binding#Status|Status]] on page [[binding#Status|Status]] .

    Within the `mpi_08` Fortran module, the status was defined as `TYPE(MPI_Status)`. Additionally, within both the `mpi` and the `mpi_f08` modules, the constants `MPI_STATUS_SIZE`, `MPI_SOURCE`, `MPI_TAG`, `MPI_ERROR`, and `TYPE(MPI_Status)` are defined. New conversion routines were added: [[MPI_STATUS_F2F08]] , [[MPI_STATUS_F082F]] , `MPI_Status_c2f08`, and `MPI_Status_f082c`, In `mpi.h`, the new type `MPI_F08_status`, and the external variables `MPI_F08_STATUS_IGNORE` and `MPI_F08_STATUSES_IGNORE` were added.

31. Section [[pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] on page [[pt2pt#Buffer Allocation and Usage|Buffer Allocation and Usage]] .

    In Fortran with the `mpi` module or `mpif.h`, the type of the `buffer_addr` argument of [[MPI_BUFFER_DETACH]] is incorrectly defined and the argument is therefore unused.

32. Section [[datatypes#Derived Datatypes|Derived Datatypes]] on page [[datatypes#Derived Datatypes|Derived Datatypes]] , Section [[datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] , and Section [[binding#Fortran Derived Types|Fortran Derived Types]] on page [[binding#Fortran Derived Types|Fortran Derived Types]] .

    The Fortran alignments of basic datatypes within Fortran derived types are implementation dependent; therefore it is recommended to use the `BIND(C)` attribute for derived types in MPI communication buffers. If an array of structures (in C/C++) or derived types (in Fortran) is to be used in MPI communication buffers, it is recommended that the user creates a portable datatype handle and additionally applies [[MPI_TYPE_CREATE_RESIZED]] to this datatype handle.

33. Sections [[datatypes#Duplicating a Datatype|Duplicating a Datatype]] , [[coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] , [[coll#Process-Local Reduction|Process-Local Reduction]] , [[context#Datatypes|Datatypes]] , [[context#Naming Objects|Naming Objects]] , [[inquiry#Error Handlers for Communicators|Error Handlers for Communicators]] , [[inquiry#Error Handlers for Windows|Error Handlers for Windows]] , [[inquiry#Error Handlers for Files|Error Handlers for Files]] , [[deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] , [[f90-types]] on pages [[datatypes#Duplicating a Datatype|Duplicating a Datatype]] , [[coll#User-Defined Reduction Operations|User-Defined Reduction Operations]] , [[coll#Process-Local Reduction|Process-Local Reduction]] , [[context#Datatypes|Datatypes]] , [[context#Naming Objects|Naming Objects]] , [[inquiry#Error Handlers for Communicators|Error Handlers for Communicators]] , [[inquiry#Error Handlers for Windows|Error Handlers for Windows]] , [[inquiry#Error Handlers for Files|Error Handlers for Files]] , [[deprecated#Deprecated since MPI-2.0|Deprecated since MPI-2.0]] , and [[f90-types]] . In some routines, the dummy argument names were changed because they were identical to the Fortran keywords `TYPE` and `FUNCTION`. The new dummy argument names must be used because the `mpi` and `mpi_08` modules guarantee keyword-based actual argument lists. The argument name `type` was changed

    in [[MPI_TYPE_DUP]] ,

    the Fortran `USER_FUNCTION` of [[MPI_OP_CREATE]] ,

    [[MPI_TYPE_SET_ATTR]] , [[MPI_TYPE_GET_ATTR]] , [[MPI_TYPE_DELETE_ATTR]] , [[MPI_TYPE_SET_NAME]] , [[MPI_TYPE_GET_NAME]] , [[MPI_TYPE_MATCH_SIZE]] , the callback prototype definition `MPI_Type_delete_attr_function`, and the predefined callback function

    [[MPI_TYPE_NULL_DELETE_FN]] ; `function` was changed

    in [[MPI_OP_CREATE]] ,

    [[MPI_COMM_CREATE_ERRHANDLER]] ,

    [[MPI_WIN_CREATE_ERRHANDLER]] ,

    [[MPI_FILE_CREATE_ERRHANDLER]] , and

    [[MPI_ERRHANDLER_CREATE]] . For consistency reasons, `INOUBUF` was changed to `INOUTBUF` in [[MPI_REDUCE_LOCAL]] , and `intracomm` to `newintracomm` in [[MPI_INTERCOMM_MERGE]] .

34. Section [[context#Communicators|Communicators]] on page [[context#Communicators|Communicators]] .

    It was clarified that in Fortran, the flag values returned by a `comm_copy_attr_fn` callback,

    including [[MPI_COMM_NULL_COPY_FN]] and [[MPI_COMM_DUP_FN]] , are `.FALSE.` and `.TRUE.`; see [[MPI_COMM_CREATE_KEYVAL]] .

35. Section [[inquiry#Memory Allocation|Memory Allocation]] on page [[inquiry#Memory Allocation|Memory Allocation]] .

    With the `mpi` and `mpi_f08` Fortran modules, [[MPI_ALLOC_MEM]] now also supports `TYPE(C_PTR)` C-pointers instead of only returning an address-sized integer that may be usable together with a nonstandard Cray-pointer.

36. Section [[binding#Fortran Derived Types|Fortran Derived Types]] on page [[binding#Fortran Derived Types|Fortran Derived Types]] , and Section [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

    Fortran `SEQUENCE` and `BIND(C)` derived application types can now be used as buffers in MPI operations.

37. Section [[binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] on page [[binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to Section [[binding#Permanent Data Movement|Permanent Data Movement]] on page [[binding#Permanent Data Movement|Permanent Data Movement]] , Section [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] , and Section [[f90-syncreg]] on page [[f90-syncreg]] .

    The sections about Fortran optimization problems and their solutions were partially rewritten and new methods are added, e.g., the use of the `ASYNCHRONOUS` attribute. The constant `MPI_ASYNC_PROTECTS_NONBLOCKING` tells whether the semantics of the `ASYNCHRONOUS` attribute is extended to protect nonblocking operations. The Fortran routine [[MPI_F_SYNC_REG]] is added. MPI-3.0 compliance for an MPI library together with a Fortran compiler is defined in Section [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

38. Section [[f90-mpif08]] on page [[f90-mpif08]] .

    Within the `mpi_08` Fortran module, dummy arguments are now declared with `INTENT=IN`, `OUT`, or `INOUT` as defined in the `mpi_08` interfaces.

39. Section [[f90-extended]] on page [[f90-extended]] , and Section [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page [[binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

    The existing `mpi` Fortran module must implement compile-time argument checking.

40. Section [[f90-basic]] on page [[f90-basic]] .

    The use of the `mpif.h` Fortran include file is now strongly discouraged.

41. Section [[appLang-Const#Defined Constants|Defined Constants]] , Table “*Predefined functions*” on page [[appLang-Const#Defined Constants|Defined Constants]] , Section [[appLang-Const#Prototype Definitions|Prototype Definitions]] on page [[appLang-Const#Prototype Definitions|Prototype Definitions]] , and Section [[appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] on page [[appLang-Fortran2008#Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings|Groups, Contexts, Communicators, and Caching Fortran 2008 Bindings]] .

    Within the new `mpi_f08` module, all callback prototype definitions are now defined with explicit interfaces `PROCEDURE(MPI_...)` that have the `BIND(C)` attribute; user-written callbacks must be modified if the `mpi_f08` module is used.

42. Section [[appLang-Const#Prototype Definitions|Prototype Definitions]] on page [[appLang-Const#Prototype Definitions|Prototype Definitions]] .

    In some routines, the Fortran callback prototype names were changed from `$`...`$\_FN` to `$`...`$\_FUNCTION` to be consistent with the other language bindings.

## Changes from Version 2.1 to Version 2.2

1.  Section [[terms#Named Constants|Named Constants]] on page [[terms#Named Constants|Named Constants]] .

    It is now guaranteed that predefined named constant handles (as other constants) can be used in initialization expressions or assignments, i.e., also before the call to [[MPI_INIT]] .

2.  Section [[terms#Language Binding|Language Binding]] on page [[terms#Language Binding|Language Binding]] ,

    and Section [[sec-rm-cpp]] on page [[sec-rm-cpp]] .

    The C++ language bindings have been deprecated and may be removed in a future version of the MPI specification.

3.  Section [[pt2pt#Message Data|Message Data]] on page [[pt2pt#Message Data|Message Data]] .

    `MPI_CHAR` for printable characters is now defined for C type char (instead of signed char). This change should not have any impact on applications nor on MPI libraries (except some comment lines), because printable characters could and can be stored in any of the C types char, signed char, and unsigned char, and `MPI_CHAR` is not allowed for predefined reduction operations.

4.  Section [[pt2pt#Message Data|Message Data]] on page [[pt2pt#Message Data|Message Data]] .

    `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T`, `MPI_AINT`, `MPI_OFFSET`, `MPI_C_BOOL`, `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` are now valid predefined MPI datatypes.

5.  Section [[pt2pt#Communication Modes|Communication Modes]] on page [[pt2pt#Communication Modes|Communication Modes]] , Section [[pt2pt#Communication Initiation|Communication Initiation]] on page [[pt2pt#Communication Initiation|Communication Initiation]] , Section [[pt2pt#Persistent Communication Requests|Persistent Communication Requests]] on page [[pt2pt#Persistent Communication Requests|Persistent Communication Requests]] , and Section [[coll#Introduction and Overview|Introduction and Overview]] on page [[coll#Introduction and Overview|Introduction and Overview]] .

    The read access restriction on the send buffer for blocking, non blocking and collective API has been lifted. It is permitted to access for read the send buffer while the operation is in progress.

6.  Section [[pt2pt#Nonblocking Communication|Nonblocking Communication]] on page [[pt2pt#Nonblocking Communication|Nonblocking Communication]] .

    The Advice to users for IBSEND and IRSEND was slightly changed.

7.  Section [[pt2pt#Communication Completion|Communication Completion]] on page [[pt2pt#Communication Completion|Communication Completion]] .

    The advice to free an active request was removed in the Advice to users for [[MPI_REQUEST_FREE]] .

8.  Section [[pt2pt#Non-Destructive Test of status|Non-Destructive Test of status]] on page [[pt2pt#Non-Destructive Test of status|Non-Destructive Test of status]] .

    [[MPI_REQUEST_GET_STATUS]] changed to permit inactive or null requests as input.

9.  Section [[coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] on page [[coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] .

    “In place” option is added to [[MPI_ALLTOALL]] , [[MPI_ALLTOALLV]] , and [[MPI_ALLTOALLW]] for intra-communicators.

10. Section [[coll-predefined-op]] on page [[coll-predefined-op]] .

    Predefined parameterized datatypes (e.g., returned by [[MPI_TYPE_CREATE_F90_REAL]] ) and optional named predefined datatypes (e.g. `MPI_REAL8`) have been added to the list of valid datatypes in reduction operations.

11. Section [[coll-predefined-op]] on page [[coll-predefined-op]] .

    `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T` are all considered C integer types for the purposes of the predefined reduction operators. `MPI_AINT` and `MPI_OFFSET` are considered Fortran integer types. `MPI_C_BOOL` is considered a Logical type. `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` are considered Complex types.

12. Section [[coll#Process-Local Reduction|Process-Local Reduction]] on page [[coll#Process-Local Reduction|Process-Local Reduction]] .

    The local routines [[MPI_REDUCE_LOCAL]] and [[MPI_OP_COMMUTATIVE]] have been added.

13. Section [[coll#MPIREDUCESCATTERBLOCK|MPIREDUCESCATTERBLOCK]] on page [[coll#MPIREDUCESCATTERBLOCK|MPIREDUCESCATTERBLOCK]] .

    The collective function [[MPI_REDUCE_SCATTER_BLOCK]] is added to the MPI standard.

14. Section [[coll-exscan]] on page [[coll-exscan]] .

    Added in place argument to [[MPI_EXSCAN]] .

15. Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] , and Section [[context#Inter-Communication|Inter-Communication]] on page [[context#Inter-Communication|Inter-Communication]] .

    Implementations that did not implement [[MPI_COMM_CREATE]] on inter-/communicators will need to add that functionality. As the standard described the behavior of this operation on inter-communicators, it is believed that most implementations already provide this functionality. Note also that the C++ binding for both [[MPI_COMM_CREATE]] and [[MPI_COMM_SPLIT]] explicitly allow Intercomms.

16. Section [[context#Communicator Constructors|Communicator Constructors]] on page [[context#Communicator Constructors|Communicator Constructors]] .

    [[MPI_COMM_CREATE]] is extended to allow several disjoint subgroups as input if comm is an intra-communicator. If comm is an inter-communicator it was clarified that all processes in the same local group of comm must specify the same value for group.

17. Section [[topol#Distributed Graph Constructor|Distributed Graph Constructor]] on page [[topol#Distributed Graph Constructor|Distributed Graph Constructor]] .

    New functions for a scalable distributed graph topology interface has been added. In this section, the functions [[MPI_DIST_GRAPH_CREATE_ADJACENT]] and [[MPI_DIST_GRAPH_CREATE]] , the constants `MPI_UNWEIGHTED`, and the derived C++ class Distgraphcomm were added.

18. Section [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] .

    For the scalable distributed graph topology interface, the functions [[MPI_DIST_GRAPH_NEIGHBORS_COUNT]] and [[MPI_DIST_GRAPH_NEIGHBORS]] and the constant `MPI_DIST_GRAPH` were added.

19. Section [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] .

    Remove ambiguity regarding duplicated neighbors with [[MPI_GRAPH_NEIGHBORS]] and [[MPI_GRAPH_NEIGHBORS_COUNT]] .

20. Section [[inquiry#Version Inquiries|Version Inquiries]] on page [[inquiry#Version Inquiries|Version Inquiries]] .

    The subversion number changed from 1 to 2.

21. Section [[inquiry#Error Handling|Error Handling]] on page [[inquiry#Error Handling|Error Handling]] , Section [[deprecated#Deprecated since MPI-2.2|Deprecated since MPI-2.2]] on page [[deprecated#Deprecated since MPI-2.2|Deprecated since MPI-2.2]] , and Annex [[appLang-Const#Prototype Definitions|Prototype Definitions]] on page [[appLang-Const#Prototype Definitions|Prototype Definitions]] .

    Changed function pointer typedef names `MPI_`<span class="roman">$`\{`$</span>`Comm,File,Win`<span class="roman">$`\}`$</span>`_errhandler_fn` to `MPI_`<span class="roman">$`\{`$</span>`Comm,File,Win`<span class="roman">$`\}`$</span>`_errhandler_function`. Deprecated old “\_fn” names.

22. Section [[dynamic#Allowing User Functions at MPI Finalization|Allowing User Functions at MPI Finalization]] on page [[dynamic#Allowing User Functions at MPI Finalization|Allowing User Functions at MPI Finalization]] .

    Attribute deletion callbacks on `MPI_COMM_SELF` are now called in LIFO order. Implementors must now also register all implementation-internal attribute deletion callbacks on `MPI_COMM_SELF` before returning from [[MPI_INIT]] / [[MPI_INIT_THREAD]] .

23. Section [[one-side#Accumulate Functions|Accumulate Functions]] on page [[one-side#Accumulate Functions|Accumulate Functions]] .

    The restriction added in MPI 2.1 that the operation `MPI_REPLACE` in [[MPI_ACCUMULATE]] can be used only with predefined datatypes has been removed. `MPI_REPLACE` can now be used even with derived datatypes, as it was in MPI 2.0. Also, a clarification has been made that `MPI_REPLACE` can be used only in [[MPI_ACCUMULATE]] , not in collective operations that do reductions, such as [[MPI_REDUCE]] and others.

24. Section [[ei#Generalized Requests|Generalized Requests]] on page [[ei#Generalized Requests|Generalized Requests]] .

    Add “`*`” to the `query_fn`, `free_fn`, and `cancel_fn` arguments to the C++ binding for `MPI::Grequest::Start()` for consistency with the rest of MPI functions that take function pointer arguments.

25. Section [[io#External Data Representation: external32|External Data Representation: external32]] on page [[io#External Data Representation: external32|External Data Representation: external32]] , and Table [[io#External Data Representation: external32|External Data Representation: external32]] on page [[io#External Data Representation: external32|External Data Representation: external32]] .

    `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T`, `MPI_AINT`, `MPI_OFFSET`, `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`,\
    `MPI_C_LONG_DOUBLE_COMPLEX`, and `MPI_C_BOOL` are added as predefined datatypes in the `external32` representation.

26. Section [[binding#Attributes|Attributes]] on page [[binding#Attributes|Attributes]] .

    The description was modified that it only describes how an MPI implementation behaves, but not how MPI stores attributes internally. The erroneous MPI-2.1 Example 16.17 was replaced with three new examples [[binding#Attributes|Attributes]] , [[binding#Attributes|Attributes]] , and [[binding#Attributes|Attributes]] on pages [[binding#Attributes|Attributes]] – [[binding#Attributes|Attributes]] explicitly detailing cross-language attribute behavior. Implementations that matched the behavior of the old example will need to be updated.

27. Annex [[appLang-Const#Defined Constants|Defined Constants]] on page [[appLang-Const#Defined Constants|Defined Constants]] .

    Removed type `MPI::Fint` (compare `MPI_Fint` in Section [[appLang-Const#Types|Types]] on page [[appLang-Const#Types|Types]] ).

28. Annex [[appLang-Const#Defined Constants|Defined Constants]] on page [[appLang-Const#Defined Constants|Defined Constants]] . Table *Named Predefined Datatypes*.

    Added `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T`, `MPI_AINT`, `MPI_OFFSET`, `MPI_C_BOOL`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` are added as predefined datatypes.

## Changes from Version 2.0 to Version 2.1



1.  Section [[pt2pt#Message Data|Message Data]] on page [[pt2pt#Message Data|Message Data]] ,

    and Annex [[appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[appLang-Const#Defined Values and Handles|Defined Values and Handles]] .

    In addition, the `MPI_LONG_LONG` should be added as an optional type; it is a synonym for `MPI_LONG_LONG_INT`.

2.  Section [[pt2pt#Message Data|Message Data]] on page [[pt2pt#Message Data|Message Data]] ,

    and Annex [[appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[appLang-Const#Defined Values and Handles|Defined Values and Handles]] .

    `MPI_LONG_LONG_INT`, `MPI_LONG_LONG` (as synonym),\
    `MPI_UNSIGNED_LONG_LONG`, `MPI_SIGNED_CHAR`, and `MPI_WCHAR` are moved from optional to official and they are therefore defined for all three language bindings.

3.  Section [[pt2pt#Return Status|Return Status]] on page [[pt2pt#Return Status|Return Status]] .

    [[MPI_GET_COUNT]] with zero-length datatypes: The value returned as the `count` argument of [[MPI_GET_COUNT]] for a datatype of length zero where zero bytes have been transferred is zero. If the number of bytes transferred is greater than zero, `MPI_UNDEFINED` is returned.

4.  Section [[datatypes#Derived Datatypes|Derived Datatypes]] on page [[datatypes#Derived Datatypes|Derived Datatypes]] .

    General rule about derived datatypes: Most datatype constructors have replication count or block length arguments. Allowed values are non-negative integers. If the value is zero, no elements are generated in the type map and there is no effect on datatype bounds or extent.

5.  Section [[canonical_pack]] on page [[canonical_pack]] .

    `MPI_BYTE` should be used to send and receive data that is packed using [[MPI_PACK_EXTERNAL]] .

6.  Section [[coll#All-Reduce|All-Reduce]] on page [[coll#All-Reduce|All-Reduce]] .

    If `comm` is an inter-communicator in [[MPI_ALLREDUCE]] , then both groups should provide `count` and `datatype` arguments that specify the same type signature (i.e., it is not necessary that both groups provide the same `count` value).

7.  Section [[context#Group Accessors|Group Accessors]] on page [[context#Group Accessors|Group Accessors]] .

    [[MPI_GROUP_TRANSLATE_RANKS]] and `MPI_PROC_NULL`: `MPI_PROC_NULL` is a valid rank for input to [[MPI_GROUP_TRANSLATE_RANKS]] , which returns `MPI_PROC_NULL` as the translated rank.

8.  Section [[context#Caching|Caching]] on page [[context#Caching|Caching]] .

    About the attribute caching functions:

    > [!warning] Advice to implementors

    > High-quality implementations should raise an error when a keyval
    >
    > that was created by a call to `MPI_XXX_CREATE_KEYVAL` is used with an object of the wrong type with a call to `MPI_YYY_GET_ATTR` , `MPI_YYY_SET_ATTR` , `MPI_YYY_DELETE_ATTR` , or `MPI_YYY_FREE_KEYVAL` . To do so, it is necessary to maintain, with each keyval, information on the type of the associated user function.

9.  Section [[context#Naming Objects|Naming Objects]] on page [[context#Naming Objects|Naming Objects]] .

    In [[MPI_COMM_GET_NAME]] : In C, a null character is additionally stored at `name``[``resultlen``]`. `resultlen` cannot be larger then `MPI_MAX_OBJECT_NAME`-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then `MPI_MAX_OBJECT_NAME`.

10. Section [[topol#Overview of the Functions|Overview of the Functions]] on page [[topol#Overview of the Functions|Overview of the Functions]] .

    About [[MPI_GRAPH_CREATE]] and [[MPI_CART_CREATE]] : All input arguments must have identical values on all processes of the group of `comm_old`.

11. Section [[topol#Cartesian Constructor|Cartesian Constructor]] on page [[topol#Cartesian Constructor|Cartesian Constructor]] .

    In [[MPI_CART_CREATE]] : If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.

12. Section [[topol#Graph Constructor|Graph Constructor]] on page [[topol#Graph Constructor|Graph Constructor]] .

    In [[MPI_GRAPH_CREATE]] : If the graph is empty, i.e., `nnodes``== 0`, then `MPI_COMM_NULL` is returned in all processes.

13. Section [[topol#Graph Constructor|Graph Constructor]] on page [[topol#Graph Constructor|Graph Constructor]] .

    In [[MPI_GRAPH_CREATE]] : A single process is allowed to be defined multiple times in the list of neighbors of a process (i.e., there may be multiple edges between two processes). A process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be nonsymmetric.

    > [!note] Advice to users

    > Performance implications of using multiple edges or a nonsymmetric adjacency matrix are not defined. The definition of a node-neighbor edge does not imply a direction of the communication.

14. Section [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] .

    In [[MPI_CARTDIM_GET]] and [[MPI_CART_GET]] : If `comm` is associated with a zero-dimensional Cartesian topology, [[MPI_CARTDIM_GET]] returns `ndims=0` and [[MPI_CART_GET]] will keep all output arguments unchanged.

15. Section [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] .

    In [[MPI_CART_RANK]] : If `comm` is associated with a zero-dimensional Cartesian topology, `coord` is not significant and 0 is returned in `rank`.

16. Section [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] .

    In [[MPI_CART_COORDS]] : If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.

17. Section [[topol#Cartesian Shift Coordinates|Cartesian Shift Coordinates]] on page [[topol#Cartesian Shift Coordinates|Cartesian Shift Coordinates]] .

    In [[MPI_CART_SHIFT]] : It is erroneous to call [[MPI_CART_SHIFT]] with a direction that is either negative or greater than or equal to the number of dimensions in the Cartesian communicator. This implies that it is erroneous to call [[MPI_CART_SHIFT]] with a `comm` that is associated with a zero-dimensional Cartesian topology.

18. Section [[topol#Partitioning of Cartesian Structures|Partitioning of Cartesian Structures]] on page [[topol#Partitioning of Cartesian Structures|Partitioning of Cartesian Structures]] .

    In [[MPI_CART_SUB]] : If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology.

19. Section [[inquiry#Version Inquiries|Version Inquiries]] on page [[inquiry#Version Inquiries|Version Inquiries]] .

    The subversion number changed from 0 to 1.

20. Section [[inquiry#Environmental Inquiries|Environmental Inquiries]] on page [[inquiry#Environmental Inquiries|Environmental Inquiries]] .

    In [[MPI_GET_PROCESSOR_NAME]] : In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then `MPI_MAX_PROCESSOR_NAME`-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then `MPI_MAX_PROCESSOR_NAME`.

21. Section [[inquiry#Error Handling|Error Handling]] on page [[inquiry#Error Handling|Error Handling]] .

    `MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER` behave as if a new error handler object is created. That is, once the error handler is no longer needed, [[MPI_ERRHANDLER_FREE]] should be called with the error handler returned from [[MPI_ERRHANDLER_GET]] or `MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER` to mark the error handler for deallocation. This provides behavior similar to that of [[MPI_COMM_GROUP]] and [[MPI_GROUP_FREE]] .

22. Section [[dynamic#Starting MPI Processes|Starting MPI Processes]] on page [[dynamic#Starting MPI Processes|Starting MPI Processes]] , see explanations to [[MPI_FINALIZE]] .

    [[MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over `MPI_COMM_WORLD`; otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in Section [[dynamic#Releasing Connections|Releasing Connections]] on page [[dynamic#Releasing Connections|Releasing Connections]] .

23. Section [[dynamic#Starting MPI Processes|Starting MPI Processes]] on page [[dynamic#Starting MPI Processes|Starting MPI Processes]] .

    About [[MPI_ABORT]] :

    > [!note] Advice to users

    > Whether the errorcode is returned from the executable or from the MPI process startup mechanism (e.g., mpiexec), is an aspect of quality of the MPI library but not mandatory.

    > [!warning] Advice to implementors

    > Where possible, a high-quality implementation will try to return the errorcode from the MPI process startup mechanism (e.g. mpiexec or singleton init).

24. Section [[misc#The Info Object|The Info Object]] on page [[misc#The Info Object|The Info Object]] .

    An implementation must support info objects as caches for arbitrary (`key`, `value`) pairs, regardless of whether it recognizes the key. Each function that

    takes hints in the form of an `MPI_Info` must be prepared to ignore any key it does not recognize. This description of info objects does not attempt to define how a particular function should react if it recognizes a key but not the associated value. [[MPI_INFO_GET_NKEYS]] , [[MPI_INFO_GET_NTHKEY]] , [[MPI_INFO_GET_VALUELEN]] , and [[MPI_INFO_GET]] must retain all (`key`,`value`) pairs so that layered functionality can also use the `Info` object.

25. Section [[one-side#Communication Calls|Communication Calls]] on page [[one-side#Communication Calls|Communication Calls]] .

    `MPI_PROC_NULL` is a valid target rank in the MPI RMA calls [[MPI_ACCUMULATE]] , [[MPI_GET]] , and [[MPI_PUT]] . The effect is the same as for `MPI_PROC_NULL` in MPI point-to-point communication. See also item [[changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.

26. Section [[one-side#Communication Calls|Communication Calls]] on page [[one-side#Communication Calls|Communication Calls]] .

    After any RMA operation with rank `MPI_PROC_NULL`, it is still necessary to finish the RMA epoch with the synchronization method that started the epoch. See also item [[changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.

27. Section [[one-side#Accumulate Functions|Accumulate Functions]] on page [[one-side#Accumulate Functions|Accumulate Functions]] .

    `MPI_REPLACE` in [[MPI_ACCUMULATE]] , like the other predefined operations, is defined only for the predefined MPI datatypes.

28. Section [[io#File Info|File Info]] on page [[io#File Info|File Info]] .

    About [[MPI_FILE_SET_VIEW]] and [[MPI_FILE_SET_INFO]] : When an info object that specifies a subset of valid hints is passed to [[MPI_FILE_SET_VIEW]] or [[MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.

29. Section [[io#File Info|File Info]] on page [[io#File Info|File Info]] .

    About [[MPI_FILE_GET_INFO]] : If no hint exists for the file associated with `fh`, a handle to a newly created info object is returned that contains no key/value pair.

30. Section [[io#File Views|File Views]] on page [[io#File Views|File Views]] .

    If a file does not have the mode `MPI_MODE_SEQUENTIAL`, then `MPI_DISPLACEMENT_CURRENT` is invalid as `disp` in [[MPI_FILE_SET_VIEW]] .

31. Section [[io#External Data Representation: external32|External Data Representation: external32]] on page [[io#External Data Representation: external32|External Data Representation: external32]] .

    The bias of 16 byte doubles was defined with 10383. The correct value is 16383.

32. MPI-2.2, Section 16.1.4 (Section was removed in MPI-3.0).

    In the example in this section, the buffer should be declared as `const void* buf`.

33. Section [[f90-types]] on page [[f90-types]] .

    About `MPI_TYPE_CREATE_F90_XXX` :

    > [!warning] Advice to implementors

    > An application may often repeat a call to `MPI_TYPE_CREATE_F90_XXX` with the same combination of (`XXX`,`p`,`r`). The application is not allowed to free the returned predefined, unnamed datatype handles. To prevent the creation of a potentially huge amount of handles, the MPI implementation should return the same datatype handle for the same (`REAL/COMPLEX/INTEGER`,`p`,`r`) combination. Checking for the combination (`p`,`r`) in the preceding call to `MPI_TYPE_CREATE_F90_XXX` and using a hash-table to find formerly generated handles should limit the overhead of finding a previously generated datatype with same combination of (`XXX`,`p`,`r`).

34. Section [[appLang-Const#Defined Constants|Defined Constants]] on page [[appLang-Const#Defined Constants|Defined Constants]] .

    `MPI_BOTTOM` is defined as `void * const MPI::BOTTOM`.

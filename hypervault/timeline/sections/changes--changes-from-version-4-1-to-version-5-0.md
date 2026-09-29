---
title: "Changes from Version 4.1 to Version 5.0"
chapter: changes
present_in: ["MPI-5.0"]
tags: [mpi/section, mpi/changes]
---

# Changes from Version 4.1 to Version 5.0

Chapter **changes** · in [[versions/v50/sections/changes#Changes from Version 4.1 to Version 5.0|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~1.  Section [[versions/v22/sections/pt2pt#Message Data|Message Data]] on page [[versions/v22/sections/pt2pt#Message Data|Message Data]] , Section [[versions/v22/sections/binding#C++ Datatypes|C++ Datatypes]] on page [[versions/v22/sections/binding#C++ Datatypes|C++ Datatypes]] , and Annex [[versions/v22/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[versions/v22/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] .~~

~~    In addition, the `MPI_LONG_LONG` should be added as an optional type; it is a synonym for `MPI_LONG_LONG_INT`.~~

~~2.  Section [[versions/v22/sections/pt2pt#Message Data|Message Data]] on page [[versions/v22/sections/pt2pt#Message Data|Message Data]] , Section [[versions/v22/sections/binding#C++ Datatypes|C++ Datatypes]] on page [[versions/v22/sections/binding#C++ Datatypes|C++ Datatypes]] , and Annex [[versions/v22/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[versions/v22/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] .~~

~~    `MPI_LONG_LONG_INT`, `MPI_LONG_LONG` (as synonym), `MPI_UNSIGNED_LONG_LONG`, `MPI_SIGNED_CHAR`, and `MPI_WCHAR` are moved from optional to official and they are therefore defined for all three language bindings.~~

~~3.  Section [[versions/v22/sections/pt2pt#Return Status|Return Status]] on page [[versions/v22/sections/pt2pt#Return Status|Return Status]] .~~

~~    [[versions/v22/API/MPI_GET_COUNT|MPI_GET_COUNT]] with zero-length datatypes:~~

~~    The value returned as the `count` argument of [[versions/v22/API/MPI_GET_COUNT|MPI_GET_COUNT]] for a datatype of length zero where zero bytes have been transferred is zero. If the number of bytes transferred is greater than zero, MPI_UNDEFINED is returned.~~

~~4.  Section [[versions/v22/sections/datatypes#Derived Datatypes|Derived Datatypes]] on page [[versions/v22/sections/datatypes#Derived Datatypes|Derived Datatypes]] .~~

~~    General rule about derived datatypes:~~

~~    Most datatype constructors have replication count or block length arguments. Allowed values are nonnegative integers. If the value is zero, no elements are generated in the type map and there is no effect on datatype bounds or extent.~~

~~5.  Section [[canonical_pack]] on page [[canonical_pack]] .~~

~~    MPI_BYTE should be used to send and receive data that is packed using [[versions/v22/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] .~~

~~6.  Section [[versions/v22/sections/coll#All-Reduce|All-Reduce]] on page [[versions/v22/sections/coll#All-Reduce|All-Reduce]] .~~

~~    If `comm` is an intercommunicator in [[versions/v22/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , then~~

~~    both groups should provide `count` and `datatype` arguments that specify the same type signature~~

~~    (i.e., it is not necessary that both groups provide the same `count` value).~~

~~7.  Section [[versions/v22/sections/context#Group Accessors|Group Accessors]] on page [[versions/v22/sections/context#Group Accessors|Group Accessors]] .~~

~~    [[versions/v22/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] and MPI_PROC_NULL:~~

~~    MPI_PROC_NULL is a valid rank for input to [[versions/v22/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] , which returns MPI_PROC_NULL as the translated rank.~~

~~8.  Section [[versions/v22/sections/context#Caching|Caching]] on page [[versions/v22/sections/context#Caching|Caching]] .~~

~~    About the attribute caching functions:~~

~~    > [!warning] Advice to implementors~~

~~    > High-quality implementations should raise an error when a keyval     >     > that was created by a call to `MPI_XXX_CREATE_KEYVAL` is used with an object of the wrong type with a call to `MPI_YYY_GET_ATTR` , `MPI_YYY_SET_ATTR` , `MPI_YYY_DELETE_ATTR` , or `MPI_YYY_FREE_KEYVAL` . To do so, it is necessary to maintain, with each keyval, information on the type of the associated user function.~~

~~9.  Section [[versions/v22/sections/context#Naming Objects|Naming Objects]] on page [[versions/v22/sections/context#Naming Objects|Naming Objects]] .~~

~~    In [[versions/v22/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] :~~

~~    In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then MPI_MAX_OBJECT-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then MPI_MAX_OBJECT.~~

~~10. Section [[versions/v22/sections/topol#Overview of the Functions|Overview of the Functions]] on page [[versions/v22/sections/topol#Overview of the Functions|Overview of the Functions]] .~~

~~    About [[versions/v22/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] and [[versions/v22/API/MPI_CART_CREATE|MPI_CART_CREATE]] :~~

~~    All input arguments must have identical values on all processes of the group of `comm_old`.~~

~~11. Section [[versions/v22/sections/topol#Cartesian Constructor|Cartesian Constructor]] on page [[versions/v22/sections/topol#Cartesian Constructor|Cartesian Constructor]] .~~

~~    In [[versions/v22/API/MPI_CART_CREATE|MPI_CART_CREATE]] :~~

~~    If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.~~

~~12. Section [[versions/v22/sections/topol#General (Graph) Constructor|General (Graph) Constructor]] on page [[versions/v22/sections/topol#General (Graph) Constructor|General (Graph) Constructor]] .~~

~~    In [[versions/v22/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] :~~

~~    If the graph is empty, i.e., `nnodes == 0`, then MPI_COMM_NULL is returned in all processes.~~

~~13. Section [[versions/v22/sections/topol#General (Graph) Constructor|General (Graph) Constructor]] on page [[versions/v22/sections/topol#General (Graph) Constructor|General (Graph) Constructor]] .~~

~~    In [[versions/v22/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] :~~

~~    A single process is allowed to be defined multiple times in the list of neighbors of a process (i.e., there may be multiple edges between two processes). A process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be non-symmetric.~~

~~    > [!note] Advice to users~~

~~    > Performance implications of using multiple edges or a non-symmetric adjacency matrix are not defined. The definition of a node-neighbor edge does not imply a direction of the communication.~~

~~14. Section [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] .~~

~~    In [[versions/v22/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] and [[versions/v22/API/MPI_CART_GET|MPI_CART_GET]] :~~

~~    If `comm` is associated with a zero-dimensional Cartesian topology, [[versions/v22/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] returns `ndims=0` and [[versions/v22/API/MPI_CART_GET|MPI_CART_GET]] will keep all output arguments unchanged.~~

~~15. Section [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] .~~

~~    In [[versions/v22/API/MPI_CART_RANK|MPI_CART_RANK]] :~~

~~    If `comm` is associated with a zero-dimensional Cartesian topology, `coord` is not significant and 0 is returned in `rank`.~~

~~16. Section [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] .~~

~~    In [[versions/v22/API/MPI_CART_COORDS|MPI_CART_COORDS]] :~~

~~    If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.~~

~~17. Section [[versions/v22/sections/topol#Cartesian Shift Coordinates|Cartesian Shift Coordinates]] on page [[versions/v22/sections/topol#Cartesian Shift Coordinates|Cartesian Shift Coordinates]] .~~

~~    In [[versions/v22/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] :~~

~~    It is erroneous to call [[versions/v22/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with a direction that is either negative or greater than or equal to the number of dimensions in the Cartesian communicator. This implies that it is erroneous to call [[versions/v22/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with a `comm` that is associated with a zero-dimensional Cartesian topology.~~

~~18. Section [[versions/v22/sections/topol#Partitioning of Cartesian structures|Partitioning of Cartesian structures]] on page [[versions/v22/sections/topol#Partitioning of Cartesian structures|Partitioning of Cartesian structures]] .~~

~~    In [[versions/v22/API/MPI_CART_SUB|MPI_CART_SUB]] :~~

~~    If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology.~~

~~19. Section [[versions/v22/sections/inquiry#Environmental Inquiries|Environmental Inquiries]] on page [[versions/v22/sections/inquiry#Environmental Inquiries|Environmental Inquiries]] .~~

~~    In [[versions/v22/API/MPI_GET_PROCESSOR_NAME|MPI_GET_PROCESSOR_NAME]] :~~

~~    In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then MPI_MAX_PROCESSOR_NAME-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then MPI_MAX_PROCESSOR_NAME.~~

~~20. Section [[versions/v22/sections/inquiry#Error Handling|Error Handling]] on page [[versions/v22/sections/inquiry#Error Handling|Error Handling]] .~~

~~    `MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER` behave as if a new error handler object is created. That is, once the error handler is no longer needed, [[versions/v22/API/MPI_ERRHANDLER_FREE|MPI_ERRHANDLER_FREE]] should be called with the error handler returned from [[versions/v22/API/MPI_ERRHANDLER_GET|MPI_ERRHANDLER_GET]] or `MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER` to mark the error handler for deallocation. This provides behavior similar to that of [[versions/v22/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] and [[versions/v22/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] .~~

~~21. Section [[versions/v22/sections/inquiry#Startup|Startup]] on page [[versions/v22/sections/inquiry#Startup|Startup]] , see explanations to [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] .~~

~~    [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over MPI_COMM_WORLD; otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in Section [[versions/v22/sections/dynamic#Releasing Connections|Releasing Connections]] on page [[versions/v22/sections/dynamic#Releasing Connections|Releasing Connections]] .~~

~~22. Section [[versions/v22/sections/inquiry#Startup|Startup]] on page [[versions/v22/sections/inquiry#Startup|Startup]] .~~

~~    About [[versions/v22/API/MPI_ABORT|MPI_ABORT]] :~~

~~    > [!note] Advice to users~~

~~    > Whether the errorcode is returned from the executable or from the MPI process startup mechanism (e.g., mpiexec), is an aspect of quality of the MPI library but not mandatory.~~

~~    > [!warning] Advice to implementors~~

~~    > Where possible, a high-quality implementation will try to return the errorcode from the MPI process startup mechanism (e.g. mpiexec or singleton init).~~

~~23. Section [[versions/v22/sections/misc#The Info Object|The Info Object]] on page [[versions/v22/sections/misc#The Info Object|The Info Object]] .~~

~~    An implementation must support info objects as caches for arbitrary (`key`, `value`) pairs, regardless of whether it recognizes the key. Each function that~~

~~    takes hints in the form of an `MPI_Info` must be prepared to ignore any key it does not recognize. This description of info objects does not attempt to define how a particular function should react if it recognizes a key but not the associated value. [[versions/v22/API/MPI_INFO_GET_NKEYS|MPI_INFO_GET_NKEYS]] , [[versions/v22/API/MPI_INFO_GET_NTHKEY|MPI_INFO_GET_NTHKEY]] , [[versions/v22/API/MPI_INFO_GET_VALUELEN|MPI_INFO_GET_VALUELEN]] , and [[versions/v22/API/MPI_INFO_GET|MPI_INFO_GET]] must retain all (`key`,`value`) pairs so that layered functionality can also use the `Info` object.~~

~~24. Section [[versions/v22/sections/one-side#Communication Calls|Communication Calls]] on page [[versions/v22/sections/one-side#Communication Calls|Communication Calls]] .~~

~~    MPI_PROC_NULL is a valid target rank in the MPI RMA calls [[versions/v22/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v22/API/MPI_GET|MPI_GET]] , and [[versions/v22/API/MPI_PUT|MPI_PUT]] . The effect is the same as for MPI_PROC_NULL in MPI point-to-point communication.~~

~~    See also item [[versions/v22/sections/changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.~~

~~25. Section [[versions/v22/sections/one-side#Communication Calls|Communication Calls]] on page [[versions/v22/sections/one-side#Communication Calls|Communication Calls]] .~~

~~    After any RMA operation with rank MPI_PROC_NULL, it is still necessary to finish the RMA epoch with the synchronization method that started the epoch.~~

~~    See also item [[versions/v22/sections/changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.~~

~~26. Section [[versions/v22/sections/one-side#Accumulate Functions|Accumulate Functions]] on page [[versions/v22/sections/one-side#Accumulate Functions|Accumulate Functions]] .~~

~~    MPI_REPLACE~~

~~    in [[versions/v22/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] ,~~

~~    like the other predefined operations, is defined only for the predefined MPI datatypes.~~

~~27. Section [[versions/v22/sections/io#File Info|File Info]] on page [[versions/v22/sections/io#File Info|File Info]] .~~

~~    About [[versions/v22/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] and [[versions/v22/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] :~~

~~    When an info object that specifies a subset of valid hints is passed to [[versions/v22/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v22/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.~~

~~28. Section [[versions/v22/sections/io#File Info|File Info]] on page [[versions/v22/sections/io#File Info|File Info]] .~~

~~    About [[versions/v22/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] :~~

~~    If no hint exists~~

~~    for the file associated with `fh`,~~

~~    a handle to a newly created info object is returned that contains no key/value pair.~~

~~29. Section [[versions/v22/sections/io#File Views|File Views]] on page [[versions/v22/sections/io#File Views|File Views]] .~~

~~    If a file does not have the mode MPI_MODE_SEQUENTIAL, then MPI_DISPLACEMENT_CURRENT is invalid as `disp` in [[versions/v22/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] .~~

~~30. Section [[versions/v22/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[versions/v22/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] .~~

~~    The bias of 16 byte doubles was defined with 10383. The correct value is 16383.~~

~~31. Section [[versions/v22/sections/binding#Class Member Functions for MPI|Class Member Functions for MPI]] on page [[versions/v22/sections/binding#Class Member Functions for MPI|Class Member Functions for MPI]] .~~

~~    In the example in this section, the buffer should be declared as `const void* buf`.~~

~~32. Section [[f90-types]] on page [[f90-types]] .~~

~~    About [[MPI_TYPE_CREATE_F90_xxxx]] :~~

~~    > [!warning] Advice to implementors~~

~~    > An application may often repeat a call to [[MPI_TYPE_CREATE_F90_xxxx]] with the same combination of (`xxxx`,`p`,`r`). The application is not allowed to free the returned predefined, unnamed datatype handles. To prevent the creation of a potentially huge amount of handles, the MPI implementation should return the same datatype handle for the same (`REAL/COMPLEX/INTEGER`,`p`,`r`) combination. Checking for the combination (`p`,`r`) in the preceding call to [[MPI_TYPE_CREATE_F90_xxxx]] and using a hash-table to find formerly generated handles should limit the overhead of finding a previously generated datatype with same combination of (`xxxx`,`p`,`r`).~~

~~33. Section [[versions/v22/sections/appLang-Const#Defined Constants|Defined Constants]] on page [[versions/v22/sections/appLang-Const#Defined Constants|Defined Constants]] .~~

~~    MPI_BOTTOM is defined as~~

~~    `void * const MPI::BOTTOM`.~~

==1.  Section [[versions/v22/sections/terms#Named Constants|Named Constants]] on page [[versions/v22/sections/terms#Named Constants|Named Constants]] .==

==    It is now guaranteed that predefined named constant handles (as other constants) can be used in initialization expressions or assignments, i.e., also before the call to [[versions/v22/API/MPI_INIT|MPI_INIT]] .==

==2.  Section [[versions/v22/sections/terms#Language Binding|Language Binding]] on page [[versions/v22/sections/terms#Language Binding|Language Binding]] , Section [[terms-cpp]] on page [[terms-cpp]] , and Section [[versions/v22/sections/binding#C++|C++]] on page [[versions/v22/sections/binding#C++|C++]] .==

==    The C++ language bindings have been deprecated and may be removed in a future version of the MPI specification.==

==3.  Section [[versions/v22/sections/pt2pt#Message Data|Message Data]] on page [[versions/v22/sections/pt2pt#Message Data|Message Data]] .==

==    `MPI_CHAR` for printable characters is now defined for C type char (instead of signed char). This change should not have any impact on applications nor on MPI libraries (except some comment lines), because printable characters could and can be stored in any of the C types char, signed char, and unsigned char, and `MPI_CHAR` is not allowed for predefined reduction operations.==

==4.  Section [[versions/v22/sections/pt2pt#Message Data|Message Data]] on page [[versions/v22/sections/pt2pt#Message Data|Message Data]] .==

==    `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T`, `MPI_AINT`, `MPI_OFFSET`, `MPI_C_BOOL`, `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` are now valid predefined MPI datatypes.==

==5.  Section [[versions/v22/sections/pt2pt#Communication Modes|Communication Modes]] on page [[versions/v22/sections/pt2pt#Communication Modes|Communication Modes]] , Section [[versions/v22/sections/pt2pt#Communication Initiation|Communication Initiation]] on page [[versions/v22/sections/pt2pt#Communication Initiation|Communication Initiation]] , Section [[versions/v22/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] on page [[versions/v22/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] , and Section [[versions/v22/sections/coll#Introduction and Overview|Introduction and Overview]] on page [[versions/v22/sections/coll#Introduction and Overview|Introduction and Overview]] .==

==    The read access restriction on the send buffer for blocking, non blocking and collective API has been lifted. It is permitted to access for read the send buffer while the operation is in progress.==

==6.  Section [[versions/v22/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] on page [[versions/v22/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] .==

==    The Advice to users for IBSEND and IRSEND was slightly changed.==

==7.  Section [[versions/v22/sections/pt2pt#Communication Completion|Communication Completion]] on page [[versions/v22/sections/pt2pt#Communication Completion|Communication Completion]] .==

==    The advice to free an active request was removed in the Advice to users for [[versions/v22/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] .==

==8.  Section [[versions/v22/sections/pt2pt#Non-destructive Test of status|Non-destructive Test of status]] on page [[versions/v22/sections/pt2pt#Non-destructive Test of status|Non-destructive Test of status]] .==

==    [[versions/v22/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] changed to permit inactive or null requests as input.==

==9.  Section [[versions/v22/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] on page [[versions/v22/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] .==

==    “In place” option is added to [[versions/v22/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v22/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , and [[versions/v22/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] for intracommunicators.==

==10. Section [[coll-predefined-op]] on page [[coll-predefined-op]] .==

==    Predefined parameterized datatypes (e.g., returned by [[versions/v22/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] ) and optional named predefined datatypes (e.g. `MPI_REAL8`) have been added to the list of valid datatypes in reduction operations.==

==11. Section [[coll-predefined-op]] on page [[coll-predefined-op]] .==

==    `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T` are all considered C integer types for the purposes of the predefined reduction operators. `MPI_AINT` and `MPI_OFFSET` are considered Fortran integer types. `MPI_C_BOOL` is considered a Logical type. `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` are considered Complex types.==

==12. Section [[versions/v22/sections/coll#Process-local reduction|Process-local reduction]] on page [[versions/v22/sections/coll#Process-local reduction|Process-local reduction]] .==

==    The local routines [[versions/v22/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] and [[versions/v22/API/MPI_OP_COMMUTATIVE|MPI_OP_COMMUTATIVE]] have been added.==

==13. Section [[versions/v22/sections/coll#MPIREDUCESCATTERBLOCK|MPIREDUCESCATTERBLOCK]] on page [[versions/v22/sections/coll#MPIREDUCESCATTERBLOCK|MPIREDUCESCATTERBLOCK]] .==

==    The collective function [[versions/v22/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] is added to the MPI standard.==

==14. Section [[coll-exscan]] on page [[coll-exscan]] .==

==    Added in place argument to [[versions/v22/API/MPI_EXSCAN|MPI_EXSCAN]] .==

==15. Section [[versions/v22/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v22/sections/context#Communicator Constructors|Communicator Constructors]] , and Section [[versions/v22/sections/context#Inter-Communication|Inter-Communication]] on page [[versions/v22/sections/context#Inter-Communication|Inter-Communication]] .==

==    Implementations that did not implement [[versions/v22/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] on intercommunicators will need to add that functionality. As the standard described the behavior of this operation on intercommunicators, it is believed that most implementations already provide this functionality. Note also that the C++ binding for both [[versions/v22/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] and [[versions/v22/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] explicitly allow Intercomms.==

==16. Section [[versions/v22/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v22/sections/context#Communicator Constructors|Communicator Constructors]] .==

==    [[versions/v22/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] is extended to allow several disjoint subgroups as input if comm is an intracommunicator. If comm is an intercommunicator it was clarified that all processes in the same local group of comm must specify the same value for group.==

==17. Section [[versions/v22/sections/topol#Distributed (Graph) Constructor|Distributed (Graph) Constructor]] on page [[versions/v22/sections/topol#Distributed (Graph) Constructor|Distributed (Graph) Constructor]] .==

==    New functions for a scalable distributed graph topology interface has been added. In this section, the functions [[versions/v22/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] and [[versions/v22/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] , the constants `MPI_UNWEIGHTED`, and the derived C++ class Distgraphcomm were added.==

==18. Section [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] .==

==    For the scalable distributed graph topology interface, the functions [[MPI_DIST_NEIGHBORS_COUNT]] and [[MPI_DIST_NEIGHBORS]] and the constant `MPI_DIST_GRAPH` were added.==

==19. Section [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v22/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] .==

==    Remove ambiguity regarding duplicated neighbors with [[versions/v22/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] and [[versions/v22/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] .==

==20. Section [[versions/v22/sections/inquiry#Version Inquiries|Version Inquiries]] on page [[versions/v22/sections/inquiry#Version Inquiries|Version Inquiries]] .==

==    The subversion number changed from 1 to 2.==

==21. Section [[versions/v22/sections/inquiry#Error Handling|Error Handling]] on page [[versions/v22/sections/inquiry#Error Handling|Error Handling]] , Section [[sect-deprecated-mpiiidoti]] on page [[sect-deprecated-mpiiidoti]] , and Annex [[versions/v22/sections/appLang-Const#Prototype definitions|Prototype definitions]] on page [[versions/v22/sections/appLang-Const#Prototype definitions|Prototype definitions]] .==

==    Changed function pointer typedef names `MPI_`<span class="roman">$`\{`$</span>`Comm,File,Win`<span class="roman">$`\}`$</span>`_errhandler_fn` to `MPI_`<span class="roman">$`\{`$</span>`Comm,File,Win`<span class="roman">$`\}`$</span>`_errhandler_function`. Deprecated old “\_fn” names.==

==22. Section [[versions/v22/sections/inquiry#Allowing User Functions at Process Termination|Allowing User Functions at Process Termination]] on page [[versions/v22/sections/inquiry#Allowing User Functions at Process Termination|Allowing User Functions at Process Termination]] .==

==    Attribute deletion callbacks on `MPI_COMM_SELF` are now called in LIFO order. Implementors must now also register all implementation-internal attribute deletion callbacks on `MPI_COMM_SELF` before returning from [[versions/v22/API/MPI_INIT|MPI_INIT]] / [[versions/v22/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] .==

==23. Section [[versions/v22/sections/one-side#Accumulate Functions|Accumulate Functions]] on page [[versions/v22/sections/one-side#Accumulate Functions|Accumulate Functions]] .==

==    The restriction added in MPI 2.1 that the operation `MPI_REPLACE` in [[versions/v22/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] can be used only with predefined datatypes has been removed. `MPI_REPLACE` can now be used even with derived datatypes, as it was in MPI 2.0. Also, a clarification has been made that `MPI_REPLACE` can be used only in [[versions/v22/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , not in collective operations that do reductions, such as [[versions/v22/API/MPI_REDUCE|MPI_REDUCE]] and others.==

==24. Section [[versions/v22/sections/ei#Generalized Requests|Generalized Requests]] on page [[versions/v22/sections/ei#Generalized Requests|Generalized Requests]] .==

==    Add “`*`” to the `query_fn`, `free_fn`, and `cancel_fn` arguments to the C++ binding for `MPI::Grequest::Start()` for consistency with the rest of MPI functions that take function pointer arguments.==

==25. Section [[versions/v22/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[versions/v22/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , and Table [[versions/v22/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[versions/v22/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] .==

==    `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T`, `MPI_AINT`, `MPI_OFFSET`, `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, `MPI_C_LONG_DOUBLE_COMPLEX`, and `MPI_C_BOOL` are added as predefined datatypes in the external32 representation.==

==26. Section [[versions/v22/sections/binding#Attributes|Attributes]] on page [[versions/v22/sections/binding#Attributes|Attributes]] .==

==    The description was modified that it only describes how an MPI implementation behaves, but not how MPI stores attributes internally. The erroneous MPI-2.1 Example 16.17 was replaced with three new examples [[versions/v22/sections/binding#Attributes|Attributes]] , [[versions/v22/sections/binding#Attributes|Attributes]] , and [[versions/v22/sections/binding#Attributes|Attributes]] on pages [[versions/v22/sections/binding#Attributes|Attributes]] - [[versions/v22/sections/binding#Attributes|Attributes]] explicitly detailing cross-language attribute behavior. Implementations that matched the behavior of the old example will need to be updated.==

==27. Annex [[versions/v22/sections/appLang-Const#Defined Constants|Defined Constants]] on page [[versions/v22/sections/appLang-Const#Defined Constants|Defined Constants]] .==

==    Removed type `MPI::Fint` (compare `MPI_Fint` in Section [[versions/v22/sections/appLang-Const#Types|Types]] on page [[versions/v22/sections/appLang-Const#Types|Types]] ).==

==28. Annex [[versions/v22/sections/appLang-Const#Defined Constants|Defined Constants]] on page [[versions/v22/sections/appLang-Const#Defined Constants|Defined Constants]] . Table *Named Predefined Datatypes*.==

==    Added `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T`, `MPI_AINT`, `MPI_OFFSET`, `MPI_C_BOOL`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` are added as predefined datatypes.==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~1.  Section [[versions/v30/sections/terms#Named Constants|Named Constants]] on page [[versions/v30/sections/terms#Named Constants|Named Constants]] .~~

~~    It is now guaranteed that predefined named constant handles (as other constants) can be used in initialization expressions or assignments, i.e., also before the call to [[versions/v30/API/MPI_INIT|MPI_INIT]] .~~

~~2.  Section [[versions/v30/sections/terms#Language Binding|Language Binding]] on page [[versions/v30/sections/terms#Language Binding|Language Binding]] , Section [[terms-cpp]] on page [[terms-cpp]] , and Section [[versions/v30/sections/binding#C++|C++]] on page [[versions/v30/sections/binding#C++|C++]] .~~

~~    The C++ language bindings have been deprecated and may be removed in a future version of the MPI specification.~~

~~3.  Section [[versions/v30/sections/pt2pt#Message Data|Message Data]] on page [[versions/v30/sections/pt2pt#Message Data|Message Data]] .~~

~~    `MPI_CHAR` for printable characters is now defined for C type char (instead of signed char). This change should not have any impact on applications nor on MPI libraries (except some comment lines), because printable characters could and can be stored in any of the C types char, signed char, and unsigned char, and `MPI_CHAR` is not allowed for predefined reduction operations.~~

~~4.  Section [[versions/v30/sections/pt2pt#Message Data|Message Data]] on page [[versions/v30/sections/pt2pt#Message Data|Message Data]] .~~

~~    `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T`, `MPI_AINT`, `MPI_OFFSET`, `MPI_C_BOOL`, `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` are now valid predefined MPI datatypes.~~

~~5.  Section [[versions/v30/sections/pt2pt#Communication Modes|Communication Modes]] on page [[versions/v30/sections/pt2pt#Communication Modes|Communication Modes]] , Section [[versions/v30/sections/pt2pt#Communication Initiation|Communication Initiation]] on page [[versions/v30/sections/pt2pt#Communication Initiation|Communication Initiation]] , Section [[versions/v30/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] on page [[versions/v30/sections/pt2pt#Persistent Communication Requests|Persistent Communication Requests]] , and Section [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] on page [[versions/v30/sections/coll#Introduction and Overview|Introduction and Overview]] .~~

~~    The read access restriction on the send buffer for blocking, non blocking and collective API has been lifted. It is permitted to access for read the send buffer while the operation is in progress.~~

~~6.  Section [[versions/v30/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] on page [[versions/v30/sections/pt2pt#Nonblocking Communication|Nonblocking Communication]] .~~

~~    The Advice to users for IBSEND and IRSEND was slightly changed.~~

~~7.  Section [[versions/v30/sections/pt2pt#Communication Completion|Communication Completion]] on page [[versions/v30/sections/pt2pt#Communication Completion|Communication Completion]] .~~

~~    The advice to free an active request was removed in the Advice to users for [[versions/v30/API/MPI_REQUEST_FREE|MPI_REQUEST_FREE]] .~~

~~8.  Section [[versions/v30/sections/pt2pt#Non-destructive Test of status|Non-destructive Test of status]] on page [[versions/v30/sections/pt2pt#Non-destructive Test of status|Non-destructive Test of status]] .~~

~~    [[versions/v30/API/MPI_REQUEST_GET_STATUS|MPI_REQUEST_GET_STATUS]] changed to permit inactive or null requests as input.~~

~~9.  Section [[versions/v30/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] on page [[versions/v30/sections/coll#All-to-All Scatter/Gather|All-to-All Scatter/Gather]] .~~

~~    “In place” option is added to [[versions/v30/API/MPI_ALLTOALL|MPI_ALLTOALL]] , [[versions/v30/API/MPI_ALLTOALLV|MPI_ALLTOALLV]] , and [[versions/v30/API/MPI_ALLTOALLW|MPI_ALLTOALLW]] for intracommunicators.~~

~~10. Section [[coll-predefined-op]] on page [[coll-predefined-op]] .~~

~~    Predefined parameterized datatypes (e.g., returned by [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] ) and optional named predefined datatypes (e.g. `MPI_REAL8`) have been added to the list of valid datatypes in reduction operations.~~

~~11. Section [[coll-predefined-op]] on page [[coll-predefined-op]] .~~

~~    `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T` are all considered C integer types for the purposes of the predefined reduction operators. `MPI_AINT` and `MPI_OFFSET` are considered Fortran integer types. `MPI_C_BOOL` is considered a Logical type. `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` are considered Complex types.~~

~~12. Section [[versions/v30/sections/coll#Process-local reduction|Process-local reduction]] on page [[versions/v30/sections/coll#Process-local reduction|Process-local reduction]] .~~

~~    The local routines [[versions/v30/API/MPI_REDUCE_LOCAL|MPI_REDUCE_LOCAL]] and [[versions/v30/API/MPI_OP_COMMUTATIVE|MPI_OP_COMMUTATIVE]] have been added.~~

~~13. Section [[versions/v30/sections/coll#MPIREDUCESCATTERBLOCK|MPIREDUCESCATTERBLOCK]] on page [[versions/v30/sections/coll#MPIREDUCESCATTERBLOCK|MPIREDUCESCATTERBLOCK]] .~~

~~    The collective function [[versions/v30/API/MPI_REDUCE_SCATTER_BLOCK|MPI_REDUCE_SCATTER_BLOCK]] is added to the MPI standard.~~

~~14. Section [[coll-exscan]] on page [[coll-exscan]] .~~

~~    Added in place argument to [[versions/v30/API/MPI_EXSCAN|MPI_EXSCAN]] .~~

~~15. Section [[versions/v30/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v30/sections/context#Communicator Constructors|Communicator Constructors]] , and Section [[versions/v30/sections/context#Inter-Communication|Inter-Communication]] on page [[versions/v30/sections/context#Inter-Communication|Inter-Communication]] .~~

~~    Implementations that did not implement [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] on intercommunicators will need to add that functionality. As the standard described the behavior of this operation on intercommunicators, it is believed that most implementations already provide this functionality. Note also that the C++ binding for both [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] and [[versions/v30/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] explicitly allow Intercomms.~~

~~16. Section [[versions/v30/sections/context#Communicator Constructors|Communicator Constructors]] on page [[versions/v30/sections/context#Communicator Constructors|Communicator Constructors]] .~~

~~    [[versions/v30/API/MPI_COMM_CREATE|MPI_COMM_CREATE]] is extended to allow several disjoint subgroups as input if comm is an intracommunicator. If comm is an intercommunicator it was clarified that all processes in the same local group of comm must specify the same value for group.~~

~~17. Section [[versions/v30/sections/topol#Distributed (Graph) Constructor|Distributed (Graph) Constructor]] on page [[versions/v30/sections/topol#Distributed (Graph) Constructor|Distributed (Graph) Constructor]] .~~

~~    New functions for a scalable distributed graph topology interface has been added. In this section, the functions [[versions/v30/API/MPI_DIST_GRAPH_CREATE_ADJACENT|MPI_DIST_GRAPH_CREATE_ADJACENT]] and [[versions/v30/API/MPI_DIST_GRAPH_CREATE|MPI_DIST_GRAPH_CREATE]] , the constants `MPI_UNWEIGHTED`, and the derived C++ class Distgraphcomm were added.~~

~~18. Section [[versions/v30/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v30/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] .~~

~~    For the scalable distributed graph topology interface, the functions [[MPI_DIST_NEIGHBORS_COUNT]] and [[MPI_DIST_NEIGHBORS]] and the constant `MPI_DIST_GRAPH` were added.~~

~~19. Section [[versions/v30/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[versions/v30/sections/topol#Topology Inquiry Functions|Topology Inquiry Functions]] .~~

~~    Remove ambiguity regarding duplicated neighbors with [[versions/v30/API/MPI_GRAPH_NEIGHBORS|MPI_GRAPH_NEIGHBORS]] and [[versions/v30/API/MPI_GRAPH_NEIGHBORS_COUNT|MPI_GRAPH_NEIGHBORS_COUNT]] .~~

~~20. Section [[versions/v30/sections/inquiry#Version Inquiries|Version Inquiries]] on page [[versions/v30/sections/inquiry#Version Inquiries|Version Inquiries]] .~~

~~    The subversion number changed from 1 to 2.~~

~~21. Section [[versions/v30/sections/inquiry#Error Handling|Error Handling]] on page [[versions/v30/sections/inquiry#Error Handling|Error Handling]] , Section [[sect-deprecated-mpiiidoti]] on page [[sect-deprecated-mpiiidoti]] , and Annex [[versions/v30/sections/appLang-Const#Prototype definitions|Prototype definitions]] on page [[versions/v30/sections/appLang-Const#Prototype definitions|Prototype definitions]] .~~

~~    Changed function pointer typedef names `MPI_`<span class="roman">$`\{`$</span>`Comm,File,Win`<span class="roman">$`\}`$</span>`_errhandler_fn` to `MPI_`<span class="roman">$`\{`$</span>`Comm,File,Win`<span class="roman">$`\}`$</span>`_errhandler_function`. Deprecated old “\_fn” names.~~

~~22. Section [[versions/v30/sections/inquiry#Allowing User Functions at Process Termination|Allowing User Functions at Process Termination]] on page [[versions/v30/sections/inquiry#Allowing User Functions at Process Termination|Allowing User Functions at Process Termination]] .~~

~~    Attribute deletion callbacks on `MPI_COMM_SELF` are now called in LIFO order. Implementors must now also register all implementation-internal attribute deletion callbacks on `MPI_COMM_SELF` before returning from [[versions/v30/API/MPI_INIT|MPI_INIT]] / [[versions/v30/API/MPI_INIT_THREAD|MPI_INIT_THREAD]] .~~

~~23. Section [[versions/v30/sections/one-side#Accumulate Functions|Accumulate Functions]] on page [[versions/v30/sections/one-side#Accumulate Functions|Accumulate Functions]] .~~

~~    The restriction added in MPI 2.1 that the operation `MPI_REPLACE` in [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] can be used only with predefined datatypes has been removed. `MPI_REPLACE` can now be used even with derived datatypes, as it was in MPI 2.0. Also, a clarification has been made that `MPI_REPLACE` can be used only in [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , not in collective operations that do reductions, such as [[versions/v30/API/MPI_REDUCE|MPI_REDUCE]] and others.~~

~~24. Section [[versions/v30/sections/ei#Generalized Requests|Generalized Requests]] on page [[versions/v30/sections/ei#Generalized Requests|Generalized Requests]] .~~

~~    Add “`*`” to the `query_fn`, `free_fn`, and `cancel_fn` arguments to the C++ binding for `MPI::Grequest::Start()` for consistency with the rest of MPI functions that take function pointer arguments.~~

~~25. Section [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , and Table [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] .~~

~~    `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T`, `MPI_AINT`, `MPI_OFFSET`, `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, `MPI_C_LONG_DOUBLE_COMPLEX`, and `MPI_C_BOOL` are added as predefined datatypes in the external32 representation.~~

~~26. Section [[versions/v30/sections/binding#Attributes|Attributes]] on page [[versions/v30/sections/binding#Attributes|Attributes]] .~~

~~    The description was modified that it only describes how an MPI implementation behaves, but not how MPI stores attributes internally. The erroneous MPI-2.1 Example 16.17 was replaced with three new examples [[versions/v30/sections/binding#Attributes|Attributes]] , [[versions/v30/sections/binding#Attributes|Attributes]] , and [[versions/v30/sections/binding#Attributes|Attributes]] on pages [[versions/v30/sections/binding#Attributes|Attributes]] - [[versions/v30/sections/binding#Attributes|Attributes]] explicitly detailing cross-language attribute behavior. Implementations that matched the behavior of the old example will need to be updated.~~

~~27. Annex [[versions/v30/sections/appLang-Const#Defined Constants|Defined Constants]] on page [[versions/v30/sections/appLang-Const#Defined Constants|Defined Constants]] .~~

~~    Removed type `MPI::Fint` (compare `MPI_Fint` in Section [[versions/v30/sections/appLang-Const#Types|Types]] on page [[versions/v30/sections/appLang-Const#Types|Types]] ).~~

~~28. Annex [[versions/v30/sections/appLang-Const#Defined Constants|Defined Constants]] on page [[versions/v30/sections/appLang-Const#Defined Constants|Defined Constants]] . Table *Named Predefined Datatypes*.~~

~~    Added `MPI_(U)INT`<span class="roman">$`\{`$</span>`8,16,32,64`<span class="roman">$`\}`$</span>`_T`, `MPI_AINT`, `MPI_OFFSET`, `MPI_C_BOOL`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` are added as predefined datatypes.~~

## Text by release

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/changes#Changes from Version 4.1 to Version 5.0]]

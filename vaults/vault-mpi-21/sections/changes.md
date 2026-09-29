# Change-Log



This annex summarizes changes from the previous version of the MPI standard to the version presented by this document. Only changes (i.e., clarifications and new features) are presented that may cause implementation effort in the MPI libraries. Editorial modifications, formatting, typo corrections and minor clarifications are not shown.

## Changes from Version 2.0 to Version 2.1

1.  Section [[pt2pt#Message Data|Message Data]] on page [[pt2pt#Message Data|Message Data]] , Section [[binding#C++ Datatypes|C++ Datatypes]] on page [[binding#C++ Datatypes|C++ Datatypes]] , and Annex [[appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[appLang-Const#Defined Values and Handles|Defined Values and Handles]] .

    In addition, the `MPI_LONG_LONG` should be added as an optional type; it is a synonym for `MPI_LONG_LONG_INT`.

2.  Section [[pt2pt#Message Data|Message Data]] on page [[pt2pt#Message Data|Message Data]] , Section [[binding#C++ Datatypes|C++ Datatypes]] on page [[binding#C++ Datatypes|C++ Datatypes]] , and Annex [[appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[appLang-Const#Defined Values and Handles|Defined Values and Handles]] .

    `MPI_LONG_LONG_INT`, `MPI_LONG_LONG` (as synonym), `MPI_UNSIGNED_LONG_LONG`, `MPI_SIGNED_CHAR`, and `MPI_WCHAR` are moved from optional to official and they are therefore defined for all three language bindings.

3.  Section [[pt2pt#Return Status|Return Status]] on page [[pt2pt#Return Status|Return Status]] .

    [[MPI_GET_COUNT]] with zero-length datatypes:

    The value returned as the `count` argument of [[MPI_GET_COUNT]] for a datatype of length zero where zero bytes have been transferred is zero. If the number of bytes transferred is greater than zero, MPI_UNDEFINED is returned.

4.  Section [[datatypes#Derived Datatypes|Derived Datatypes]] on page [[datatypes#Derived Datatypes|Derived Datatypes]] .

    General rule about derived datatypes:

    Most datatype constructors have replication count or block length arguments. Allowed values are nonnegative integers. If the value is zero, no elements are generated in the type map and there is no effect on datatype bounds or extent.

5.  Section [[canonical_pack]] on page [[canonical_pack]] .

    MPI_BYTE should be used to send and receive data that is packed using [[MPI_PACK_EXTERNAL]] .

6.  Section [[coll#All-Reduce|All-Reduce]] on page [[coll#All-Reduce|All-Reduce]] .

    If `comm` is an intercommunicator in [[MPI_ALLREDUCE]] , then

    both groups should provide `count` and `datatype` arguments that specify the same type signature

    (i.e., it is not necessary that both groups provide the same `count` value).

7.  Section [[context#Group Accessors|Group Accessors]] on page [[context#Group Accessors|Group Accessors]] .

    [[MPI_GROUP_TRANSLATE_RANKS]] and MPI_PROC_NULL:

    MPI_PROC_NULL is a valid rank for input to [[MPI_GROUP_TRANSLATE_RANKS]] , which returns MPI_PROC_NULL as the translated rank.

8.  Section [[context#Caching|Caching]] on page [[context#Caching|Caching]] .

    About the attribute caching functions:

    > [!warning] Advice to implementors

    > High-quality implementations should raise an error when a keyval
    >
    > that was created by a call to `MPI_XXX_CREATE_KEYVAL` is used with an object of the wrong type with a call to `MPI_YYY_GET_ATTR` , `MPI_YYY_SET_ATTR` , `MPI_YYY_DELETE_ATTR` , or `MPI_YYY_FREE_KEYVAL` . To do so, it is necessary to maintain, with each keyval, information on the type of the associated user function.

9.  Section [[context#Naming Objects|Naming Objects]] on page [[context#Naming Objects|Naming Objects]] .

    In [[MPI_COMM_GET_NAME]] :

    In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then MPI_MAX_OBJECT-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then MPI_MAX_OBJECT.

10. Section [[topol#Overview of the Functions|Overview of the Functions]] on page [[topol#Overview of the Functions|Overview of the Functions]] .

    About [[MPI_GRAPH_CREATE]] and [[MPI_CART_CREATE]] :

    All input arguments must have identical values on all processes of the group of `comm_old`.

11. Section [[topol#Cartesian Constructor|Cartesian Constructor]] on page [[topol#Cartesian Constructor|Cartesian Constructor]] .

    In [[MPI_CART_CREATE]] :

    If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.

12. Section [[topol#General (Graph) Constructor|General (Graph) Constructor]] on page [[topol#General (Graph) Constructor|General (Graph) Constructor]] .

    In [[MPI_GRAPH_CREATE]] :

    If the graph is empty, i.e., `nnodes == 0`, then MPI_COMM_NULL is returned in all processes.

13. Section [[topol#General (Graph) Constructor|General (Graph) Constructor]] on page [[topol#General (Graph) Constructor|General (Graph) Constructor]] .

    In [[MPI_GRAPH_CREATE]] :

    A single process is allowed to be defined multiple times in the list of neighbors of a process (i.e., there may be multiple edges between two processes). A process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be non-symmetric.

    > [!note] Advice to users

    > Performance implications of using multiple edges or a non-symmetric adjacency matrix are not defined. The definition of a node-neighbor edge does not imply a direction of the communication.

14. Section [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] .

    In [[MPI_CARTDIM_GET]] and [[MPI_CART_GET]] :

    If `comm` is associated with a zero-dimensional Cartesian topology, [[MPI_CARTDIM_GET]] returns `ndims=0` and [[MPI_CART_GET]] will keep all output arguments unchanged.

15. Section [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] .

    In [[MPI_CART_RANK]] :

    If `comm` is associated with a zero-dimensional Cartesian topology, `coord` is not significant and 0 is returned in `rank`.

16. Section [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] on page [[topol#Topology Inquiry Functions|Topology Inquiry Functions]] .

    In [[MPI_CART_COORDS]] :

    If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.

17. Section [[topol#Cartesian Shift Coordinates|Cartesian Shift Coordinates]] on page [[topol#Cartesian Shift Coordinates|Cartesian Shift Coordinates]] .

    In [[MPI_CART_SHIFT]] :

    It is erroneous to call [[MPI_CART_SHIFT]] with a direction that is either negative or greater than or equal to the number of dimensions in the Cartesian communicator. This implies that it is erroneous to call [[MPI_CART_SHIFT]] with a `comm` that is associated with a zero-dimensional Cartesian topology.

18. Section [[topol#Partitioning of Cartesian structures|Partitioning of Cartesian structures]] on page [[topol#Partitioning of Cartesian structures|Partitioning of Cartesian structures]] .

    In [[MPI_CART_SUB]] :

    If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology.

19. Section [[inquiry#Environmental Inquiries|Environmental Inquiries]] on page [[inquiry#Environmental Inquiries|Environmental Inquiries]] .

    In [[MPI_GET_PROCESSOR_NAME]] :

    In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then MPI_MAX_PROCESSOR_NAME-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then MPI_MAX_PROCESSOR_NAME.

20. Section [[inquiry#Error Handling|Error Handling]] on page [[inquiry#Error Handling|Error Handling]] .

    `MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER` behave as if a new error handler object is created. That is, once the error handler is no longer needed, [[MPI_ERRHANDLER_FREE]] should be called with the error handler returned from [[MPI_ERRHANDLER_GET]] or `MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER` to mark the error handler for deallocation. This provides behavior similar to that of [[MPI_COMM_GROUP]] and [[MPI_GROUP_FREE]] .

21. Section [[inquiry#Startup|Startup]] on page [[inquiry#Startup|Startup]] , see explanations to [[MPI_FINALIZE]] .

    [[MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over MPI_COMM_WORLD; otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in Section [[dynamic#Releasing Connections|Releasing Connections]] on page [[dynamic#Releasing Connections|Releasing Connections]] .

22. Section [[inquiry#Startup|Startup]] on page [[inquiry#Startup|Startup]] .

    About [[MPI_ABORT]] :

    > [!note] Advice to users

    > Whether the errorcode is returned from the executable or from the MPI process startup mechanism (e.g., mpiexec), is an aspect of quality of the MPI library but not mandatory.

    > [!warning] Advice to implementors

    > Where possible, a high-quality implementation will try to return the errorcode from the MPI process startup mechanism (e.g. mpiexec or singleton init).

23. Section [[misc#The Info Object|The Info Object]] on page [[misc#The Info Object|The Info Object]] .

    An implementation must support info objects as caches for arbitrary (`key`, `value`) pairs, regardless of whether it recognizes the key. Each function that

    takes hints in the form of an `MPI_Info` must be prepared to ignore any key it does not recognize. This description of info objects does not attempt to define how a particular function should react if it recognizes a key but not the associated value. [[MPI_INFO_GET_NKEYS]] , [[MPI_INFO_GET_NTHKEY]] , [[MPI_INFO_GET_VALUELEN]] , and [[MPI_INFO_GET]] must retain all (`key`,`value`) pairs so that layered functionality can also use the `Info` object.

24. Section [[one-side#Communication Calls|Communication Calls]] on page [[one-side#Communication Calls|Communication Calls]] .

    MPI_PROC_NULL is a valid target rank in the MPI RMA calls [[MPI_ACCUMULATE]] , [[MPI_GET]] , and [[MPI_PUT]] . The effect is the same as for MPI_PROC_NULL in MPI point-to-point communication.

    See also item [[changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.

25. Section [[one-side#Communication Calls|Communication Calls]] on page [[one-side#Communication Calls|Communication Calls]] .

    After any RMA operation with rank MPI_PROC_NULL, it is still necessary to finish the RMA epoch with the synchronization method that started the epoch.

    See also item [[changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.

26. Section [[one-side#Accumulate Functions|Accumulate Functions]] on page [[one-side#Accumulate Functions|Accumulate Functions]] .

    MPI_REPLACE

    in [[MPI_ACCUMULATE]] ,

    like the other predefined operations, is defined only for the predefined MPI datatypes.

27. Section [[io#File Info|File Info]] on page [[io#File Info|File Info]] .

    About [[MPI_FILE_SET_VIEW]] and [[MPI_FILE_SET_INFO]] :

    When an info object that specifies a subset of valid hints is passed to [[MPI_FILE_SET_VIEW]] or [[MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.

28. Section [[io#File Info|File Info]] on page [[io#File Info|File Info]] .

    About [[MPI_FILE_GET_INFO]] :

    If no hint exists

    for the file associated with `fh`,

    a handle to a newly created info object is returned that contains no key/value pair.

29. Section [[io#File Views|File Views]] on page [[io#File Views|File Views]] .

    If a file does not have the mode MPI_MODE_SEQUENTIAL, then MPI_DISPLACEMENT_CURRENT is invalid as `disp` in [[MPI_FILE_SET_VIEW]] .

30. Section [[io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[io#External Data Representation: “external32”|External Data Representation: “external32”]] .

    The bias of 16 byte doubles was defined with 10383. The correct value is 16383.

31. Section [[binding#Class Member Functions for MPI|Class Member Functions for MPI]] on page [[binding#Class Member Functions for MPI|Class Member Functions for MPI]] .

    In the example in this section, the buffer should be declared as `const void* buf`.

32. Section [[f90-types]] on page [[f90-types]] .

    About [[MPI_TYPE_CREATE_F90_xxxx]] :

    > [!warning] Advice to implementors

    > An application may often repeat a call to [[MPI_TYPE_CREATE_F90_xxxx]] with the same combination of (`xxxx`,`p`,`r`). The application is not allowed to free the returned predefined, unnamed datatype handles. To prevent the creation of a potentially huge amount of handles, the MPI implementation should return the same datatype handle for the same (`REAL/COMPLEX/INTEGER`,`p`,`r`) combination. Checking for the combination (`p`,`r`) in the preceding call to [[MPI_TYPE_CREATE_F90_xxxx]] and using a hash-table to find formerly generated handles should limit the overhead of finding a previously generated datatype with same combination of (`xxxx`,`p`,`r`).

33. Section [[appLang-Const#Defined Constants|Defined Constants]] on page [[appLang-Const#Defined Constants|Defined Constants]] .

    MPI_BOTTOM is defined as

    `void * const MPI::BOTTOM`.

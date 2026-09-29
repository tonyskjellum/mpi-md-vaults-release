---
title: "Changes from Version 2.0 to Version 2.1"
chapter: changes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/changes]
---

# Changes from Version 2.0 to Version 2.1

Chapter **changes** · in [[versions/v21/sections/changes#Changes from Version 2.0 to Version 2.1|MPI-2.1]], [[versions/v22/sections/changes#Changes from Version 2.0 to Version 2.1|MPI-2.2]], [[versions/v30/sections/changes#Changes from Version 2.0 to Version 2.1|MPI-3.0]], [[versions/v31/sections/changes#Changes from Version 2.0 to Version 2.1|MPI-3.1]], [[versions/v40/sections/changes#Changes from Version 2.0 to Version 2.1|MPI-4.0]], [[versions/v41/sections/changes#Changes from Version 2.0 to Version 2.1|MPI-4.1]], [[versions/v50/sections/changes#Changes from Version 2.0 to Version 2.1|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (18 changed paragraphs)

The value returned as the `count` argument of [[versions/v22/API/MPI_GET_COUNT|MPI_GET_COUNT]] for a datatype of length zero where zero bytes have been transferred is zero. If the number of bytes transferred is greater than zero, ~~MPI_UNDEFINED~~ ==`MPI_UNDEFINED`== is returned.

Most datatype constructors have replication count or block length arguments. Allowed values are ~~nonnegative~~ ==non-negative== integers. If the value is zero, no elements are generated in the type map and there is no effect on datatype bounds or extent.

~~MPI_BYTE~~ ==`MPI_BYTE`== should be used to send and receive data that is packed using [[versions/v22/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] .

[[versions/v22/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] and ~~MPI_PROC_NULL:~~ ==`MPI_PROC_NULL`:==

~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== is a valid rank for input to [[versions/v22/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] , which returns ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== as the translated rank.

In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then ~~MPI_MAX_OBJECT-1.~~ ==`MPI_MAX_OBJECT_NAME`-1.== In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then ~~MPI_MAX_OBJECT.~~ ==`MPI_MAX_OBJECT_NAME`.==

If the graph is empty, i.e., `nnodes == 0`, then ~~MPI_COMM_NULL~~ ==`MPI_COMM_NULL`== is returned in all processes.

~~19. Section [[versions/v22/sections/inquiry#Environmental Inquiries|Environmental Inquiries]] on page [[versions/v22/sections/inquiry#Environmental Inquiries|Environmental Inquiries]] .~~

==19. Section [[versions/v22/sections/inquiry#Version Inquiries|Version Inquiries]] on page [[versions/v22/sections/inquiry#Version Inquiries|Version Inquiries]] .==

==    The subversion number changed from 0 to 1.==

==20. Section [[versions/v22/sections/inquiry#Environmental Inquiries|Environmental Inquiries]] on page [[versions/v22/sections/inquiry#Environmental Inquiries|Environmental Inquiries]] .==

In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then ~~MPI_MAX_PROCESSOR_NAME-1.~~ ==`MPI_MAX_PROCESSOR_NAME`-1.== In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then ~~MPI_MAX_PROCESSOR_NAME.~~ ==`MPI_MAX_PROCESSOR_NAME`.==

~~20.~~ ==21.== Section [[versions/v22/sections/inquiry#Error Handling|Error Handling]] on page [[versions/v22/sections/inquiry#Error Handling|Error Handling]] .

~~`MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER`~~ ==`MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER`== behave as if a new error handler object is created. That is, once the error handler is no longer needed, [[versions/v22/API/MPI_ERRHANDLER_FREE|MPI_ERRHANDLER_FREE]] should be called with the error handler returned from [[versions/v22/API/MPI_ERRHANDLER_GET|MPI_ERRHANDLER_GET]] or ~~`MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER`~~ ==`MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER`== to mark the error handler for deallocation. This provides behavior similar to that of [[versions/v22/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] and [[versions/v22/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] .

~~21.~~ ==22.== Section [[versions/v22/sections/inquiry#Startup|Startup]] on page [[versions/v22/sections/inquiry#Startup|Startup]] , see explanations to [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] .

[[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] is collective over all connected processes. If no processes were spawned, accepted or connected then this means over ~~MPI_COMM_WORLD;~~ ==`MPI_COMM_WORLD`;== otherwise it is collective over the union of all processes that have been and continue to be connected, as explained in Section [[versions/v22/sections/dynamic#Releasing Connections|Releasing Connections]] on page [[versions/v22/sections/dynamic#Releasing Connections|Releasing Connections]] .

~~22.~~ ==23.== Section [[versions/v22/sections/inquiry#Startup|Startup]] on page [[versions/v22/sections/inquiry#Startup|Startup]] .

~~23.~~ ==24.== Section [[versions/v22/sections/misc#The Info Object|The Info Object]] on page [[versions/v22/sections/misc#The Info Object|The Info Object]] .

~~24.~~ ==25.== Section [[versions/v22/sections/one-side#Communication Calls|Communication Calls]] on page [[versions/v22/sections/one-side#Communication Calls|Communication Calls]] .

~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== is a valid target rank in the MPI RMA calls [[versions/v22/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v22/API/MPI_GET|MPI_GET]] , and [[versions/v22/API/MPI_PUT|MPI_PUT]] . The effect is the same as for ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== in MPI point-to-point communication.

~~25.~~ ==26.== Section [[versions/v22/sections/one-side#Communication Calls|Communication Calls]] on page [[versions/v22/sections/one-side#Communication Calls|Communication Calls]] .

After any RMA operation with rank ~~MPI_PROC_NULL,~~ ==`MPI_PROC_NULL`,== it is still necessary to finish the RMA epoch with the synchronization method that started the epoch.

~~26.~~ ==27.== Section [[versions/v22/sections/one-side#Accumulate Functions|Accumulate Functions]] on page [[versions/v22/sections/one-side#Accumulate Functions|Accumulate Functions]] .

~~MPI_REPLACE~~ ==`MPI_REPLACE`==

~~27.~~ ==28.== Section [[versions/v22/sections/io#File Info|File Info]] on page [[versions/v22/sections/io#File Info|File Info]] .

~~28.~~ ==29.== Section [[versions/v22/sections/io#File Info|File Info]] on page [[versions/v22/sections/io#File Info|File Info]] .

~~29.~~ ==30.== Section [[versions/v22/sections/io#File Views|File Views]] on page [[versions/v22/sections/io#File Views|File Views]] .

If a file does not have the mode ~~MPI_MODE_SEQUENTIAL,~~ ==`MPI_MODE_SEQUENTIAL`,== then ~~MPI_DISPLACEMENT_CURRENT~~ ==`MPI_DISPLACEMENT_CURRENT`== is invalid as `disp` in [[versions/v22/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] .

~~30.~~ ==31.== Section [[versions/v22/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page [[versions/v22/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] .

~~31.~~ ==32.== Section [[versions/v22/sections/binding#Class Member Functions for MPI|Class Member Functions for MPI]] on page [[versions/v22/sections/binding#Class Member Functions for MPI|Class Member Functions for MPI]] .

~~32.~~ ==33.== Section [[f90-types]] on page [[f90-types]] .

~~33.~~ ==34.== Section [[versions/v22/sections/appLang-Const#Defined Constants|Defined Constants]] on page [[versions/v22/sections/appLang-Const#Defined Constants|Defined Constants]] .

~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== is defined as

### MPI-2.2 → MPI-3.0  (21 changed paragraphs)

~~1.  Section [[versions/v30/sections/pt2pt#Message Data|Message Data]] on page [[versions/v30/sections/pt2pt#Message Data|Message Data]] , Section [[versions/v30/sections/binding#C++ Datatypes|C++ Datatypes]] on page [[versions/v30/sections/binding#C++ Datatypes|C++ Datatypes]] , and Annex [[versions/v30/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[versions/v30/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] .~~

==1.  Section [[versions/v30/sections/pt2pt#Message Data|Message Data]] on page [[versions/v30/sections/pt2pt#Message Data|Message Data]] ,==

==    and Annex [[versions/v30/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[versions/v30/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] .==

~~2.  Section [[versions/v30/sections/pt2pt#Message Data|Message Data]] on page [[versions/v30/sections/pt2pt#Message Data|Message Data]] , Section [[versions/v30/sections/binding#C++ Datatypes|C++ Datatypes]] on page [[versions/v30/sections/binding#C++ Datatypes|C++ Datatypes]] , and Annex [[versions/v30/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[versions/v30/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] .~~

~~    `MPI_LONG_LONG_INT`, `MPI_LONG_LONG` (as synonym), `MPI_UNSIGNED_LONG_LONG`, `MPI_SIGNED_CHAR`, and `MPI_WCHAR` are moved from optional to official and they are therefore defined for all three language bindings.~~

==2.  Section [[versions/v30/sections/pt2pt#Message Data|Message Data]] on page [[versions/v30/sections/pt2pt#Message Data|Message Data]] ,==

==    and Annex [[versions/v30/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] on page [[versions/v30/sections/appLang-Const#Defined Values and Handles|Defined Values and Handles]] .==

==    `MPI_LONG_LONG_INT`, `MPI_LONG_LONG` (as synonym),\     `MPI_UNSIGNED_LONG_LONG`, `MPI_SIGNED_CHAR`, and `MPI_WCHAR` are moved from optional to official and they are therefore defined for all three language bindings.==

~~    [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] with zero-length datatypes:~~

~~    The value returned as the `count` argument of [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] for a datatype of length zero where zero bytes have been transferred is zero. If the number of bytes transferred is greater than zero, `MPI_UNDEFINED` is returned.~~

==    [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] with zero-length datatypes: The value returned as the `count` argument of [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] for a datatype of length zero where zero bytes have been transferred is zero. If the number of bytes transferred is greater than zero, `MPI_UNDEFINED` is returned.==

~~    General rule about derived datatypes:~~

~~    Most datatype constructors have replication count or block length arguments. Allowed values are non-negative integers. If the value is zero, no elements are generated in the type map and there is no effect on datatype bounds or extent.~~

==    General rule about derived datatypes: Most datatype constructors have replication count or block length arguments. Allowed values are non-negative integers. If the value is zero, no elements are generated in the type map and there is no effect on datatype bounds or extent.==

~~    If `comm` is an intercommunicator in [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , then~~

~~    both groups should provide `count` and `datatype` arguments that specify the same type signature~~

~~    (i.e., it is not necessary that both groups provide the same `count` value).~~

==    If `comm` is an intercommunicator in [[versions/v30/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , then both groups should provide `count` and `datatype` arguments that specify the same type signature (i.e., it is not necessary that both groups provide the same `count` value).==

~~    [[versions/v30/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] and `MPI_PROC_NULL`:~~

~~    `MPI_PROC_NULL` is a valid rank for input to [[versions/v30/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] , which returns `MPI_PROC_NULL` as the translated rank.~~

==    [[versions/v30/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] and `MPI_PROC_NULL`: `MPI_PROC_NULL` is a valid rank for input to [[versions/v30/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] , which returns `MPI_PROC_NULL` as the translated rank.==

~~    In [[versions/v30/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] :~~

~~    In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then `MPI_MAX_OBJECT_NAME`-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then `MPI_MAX_OBJECT_NAME`.~~

==    In [[versions/v30/API/MPI_COMM_GET_NAME|MPI_COMM_GET_NAME]] : In C, a null character is additionally stored at `name``[``resultlen``]`. `resultlen` cannot be larger then `MPI_MAX_OBJECT_NAME`-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then `MPI_MAX_OBJECT_NAME`.==

~~    About [[versions/v30/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] and [[versions/v30/API/MPI_CART_CREATE|MPI_CART_CREATE]] :~~

~~    All input arguments must have identical values on all processes of the group of `comm_old`.~~

==    About [[versions/v30/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] and [[versions/v30/API/MPI_CART_CREATE|MPI_CART_CREATE]] : All input arguments must have identical values on all processes of the group of `comm_old`.==

~~    In [[versions/v30/API/MPI_CART_CREATE|MPI_CART_CREATE]] :~~

~~    If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.~~

~~12. Section [[versions/v30/sections/topol#General (Graph) Constructor|General (Graph) Constructor]] on page [[versions/v30/sections/topol#General (Graph) Constructor|General (Graph) Constructor]] .~~

~~    In [[versions/v30/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] :~~

~~    If the graph is empty, i.e., `nnodes == 0`, then `MPI_COMM_NULL` is returned in all processes.~~

~~13. Section [[versions/v30/sections/topol#General (Graph) Constructor|General (Graph) Constructor]] on page [[versions/v30/sections/topol#General (Graph) Constructor|General (Graph) Constructor]] .~~

~~    In [[versions/v30/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] :~~

~~    A single process is allowed to be defined multiple times in the list of neighbors of a process (i.e., there may be multiple edges between two processes). A process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be non-symmetric.~~

==    In [[versions/v30/API/MPI_CART_CREATE|MPI_CART_CREATE]] : If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.==

==12. Section [[versions/v30/sections/topol#Graph Constructor|Graph Constructor]] on page [[versions/v30/sections/topol#Graph Constructor|Graph Constructor]] .==

==    In [[versions/v30/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] : If the graph is empty, i.e., `nnodes == 0`, then `MPI_COMM_NULL` is returned in all processes.==

==13. Section [[versions/v30/sections/topol#Graph Constructor|Graph Constructor]] on page [[versions/v30/sections/topol#Graph Constructor|Graph Constructor]] .==

==    In [[versions/v30/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] : A single process is allowed to be defined multiple times in the list of neighbors of a process (i.e., there may be multiple edges between two processes). A process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be non-symmetric.==

~~    In [[versions/v30/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] and [[versions/v30/API/MPI_CART_GET|MPI_CART_GET]] :~~

~~    If `comm` is associated with a zero-dimensional Cartesian topology, [[versions/v30/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] returns `ndims=0` and [[versions/v30/API/MPI_CART_GET|MPI_CART_GET]] will keep all output arguments unchanged.~~

==    In [[versions/v30/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] and [[versions/v30/API/MPI_CART_GET|MPI_CART_GET]] : If `comm` is associated with a zero-dimensional Cartesian topology, [[versions/v30/API/MPI_CARTDIM_GET|MPI_CARTDIM_GET]] returns `ndims=0` and [[versions/v30/API/MPI_CART_GET|MPI_CART_GET]] will keep all output arguments unchanged.==

~~    In [[versions/v30/API/MPI_CART_RANK|MPI_CART_RANK]] :~~

~~    If `comm` is associated with a zero-dimensional Cartesian topology, `coord` is not significant and 0 is returned in `rank`.~~

==    In [[versions/v30/API/MPI_CART_RANK|MPI_CART_RANK]] : If `comm` is associated with a zero-dimensional Cartesian topology, `coord` is not significant and 0 is returned in `rank`.==

~~    In [[versions/v30/API/MPI_CART_COORDS|MPI_CART_COORDS]] :~~

~~    If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.~~

==    In [[versions/v30/API/MPI_CART_COORDS|MPI_CART_COORDS]] : If `comm` is associated with a zero-dimensional Cartesian topology, `coords` will be unchanged.==

~~    In [[versions/v30/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] :~~

~~    It is erroneous to call [[versions/v30/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with a direction that is either negative or greater than or equal to the number of dimensions in the Cartesian communicator. This implies that it is erroneous to call [[versions/v30/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with a `comm` that is associated with a zero-dimensional Cartesian topology.~~

~~18. Section [[versions/v30/sections/topol#Partitioning of Cartesian structures|Partitioning of Cartesian structures]] on page [[versions/v30/sections/topol#Partitioning of Cartesian structures|Partitioning of Cartesian structures]] .~~

~~    In [[versions/v30/API/MPI_CART_SUB|MPI_CART_SUB]] :~~

~~    If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology.~~

==    In [[versions/v30/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] : It is erroneous to call [[versions/v30/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with a direction that is either negative or greater than or equal to the number of dimensions in the Cartesian communicator. This implies that it is erroneous to call [[versions/v30/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with a `comm` that is associated with a zero-dimensional Cartesian topology.==

==18. Section [[versions/v30/sections/topol#Partitioning of Cartesian Structures|Partitioning of Cartesian Structures]] on page [[versions/v30/sections/topol#Partitioning of Cartesian Structures|Partitioning of Cartesian Structures]] .==

==    In [[versions/v30/API/MPI_CART_SUB|MPI_CART_SUB]] : If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology.==

~~    In [[versions/v30/API/MPI_GET_PROCESSOR_NAME|MPI_GET_PROCESSOR_NAME]] :~~

~~    In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then `MPI_MAX_PROCESSOR_NAME`-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then `MPI_MAX_PROCESSOR_NAME`.~~

==    In [[versions/v30/API/MPI_GET_PROCESSOR_NAME|MPI_GET_PROCESSOR_NAME]] : In C, a null character is additionally stored at `name[resultlen]`. `resultlen` cannot be larger then `MPI_MAX_PROCESSOR_NAME`-1. In Fortran, name is padded on the right with blank characters. `resultlen` cannot be larger then `MPI_MAX_PROCESSOR_NAME`.==

~~    `MPI_PROC_NULL` is a valid target rank in the MPI RMA calls [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v30/API/MPI_GET|MPI_GET]] , and [[versions/v30/API/MPI_PUT|MPI_PUT]] . The effect is the same as for `MPI_PROC_NULL` in MPI point-to-point communication.~~

~~    See also item [[versions/v30/sections/changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.~~

==    `MPI_PROC_NULL` is a valid target rank in the MPI RMA calls [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , [[versions/v30/API/MPI_GET|MPI_GET]] , and [[versions/v30/API/MPI_PUT|MPI_PUT]] . The effect is the same as for `MPI_PROC_NULL` in MPI point-to-point communication. See also item [[versions/v30/sections/changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.==

~~    After any RMA operation with rank `MPI_PROC_NULL`, it is still necessary to finish the RMA epoch with the synchronization method that started the epoch.~~

~~    See also item [[versions/v30/sections/changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.~~

==    After any RMA operation with rank `MPI_PROC_NULL`, it is still necessary to finish the RMA epoch with the synchronization method that started the epoch. See also item [[versions/v30/sections/changes#Changes from Version 2.0 to Version 2.1|Changes from Version 2.0 to Version 2.1]] in this list.==

~~    `MPI_REPLACE`~~

~~    in [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] ,~~

~~    like the other predefined operations, is defined only for the predefined MPI datatypes.~~

==    `MPI_REPLACE` in [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] , like the other predefined operations, is defined only for the predefined MPI datatypes.==

~~    About [[versions/v30/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] and [[versions/v30/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] :~~

~~    When an info object that specifies a subset of valid hints is passed to [[versions/v30/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v30/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.~~

==    About [[versions/v30/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] and [[versions/v30/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] : When an info object that specifies a subset of valid hints is passed to [[versions/v30/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] or [[versions/v30/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , there will be no effect on previously set or defaulted hints that the `info` does not specify.==

~~    About [[versions/v30/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] :~~

~~    If no hint exists~~

~~    for the file associated with `fh`,~~

~~    a handle to a newly created info object is returned that contains no key/value pair.~~

==    About [[versions/v30/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] : If no hint exists for the file associated with `fh`, a handle to a newly created info object is returned that contains no key/value pair.==

32. ==MPI-2.2,== Section ~~[[versions/v30/sections/binding#Class Member Functions for MPI|Class Member Functions for MPI]] on page [[versions/v30/sections/binding#Class Member Functions for MPI|Class Member Functions for MPI]] .~~ ==16.1.4 (Section was removed in MPI-3.0).==

~~    `MPI_BOTTOM` is defined as~~

~~    `void * const MPI::BOTTOM`.~~

==    `MPI_BOTTOM` is defined as `void * const MPI::BOTTOM`.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

About ~~[[MPI_TYPE_CREATE_F90_xxxx]]~~ ==`MPI_TYPE_CREATE_F90_XXX`== :

> An application may often repeat a call to ~~[[MPI_TYPE_CREATE_F90_xxxx]]~~ ==`MPI_TYPE_CREATE_F90_XXX`== with the same combination of ~~(`xxxx`,`p`,`r`).~~ ==(`XXX`,`p`,`r`).== The application is not allowed to free the returned predefined, unnamed datatype handles. To prevent the creation of a potentially huge amount of handles, the MPI implementation should return the same datatype handle for the same (`REAL/COMPLEX/INTEGER`,`p`,`r`) combination. Checking for the combination (`p`,`r`) in the preceding call to ~~[[MPI_TYPE_CREATE_F90_xxxx]]~~ ==`MPI_TYPE_CREATE_F90_XXX`== and using a hash-table to find formerly generated handles should limit the overhead of finding a previously generated datatype with same combination of ~~(`xxxx`,`p`,`r`).~~ ==(`XXX`,`p`,`r`).==

### MPI-3.1 → MPI-4.0  (7 changed paragraphs)

If `comm` is an ~~intercommunicator~~ ==inter-communicator== in [[versions/v40/API/MPI_ALLREDUCE|MPI_ALLREDUCE]] , then both groups should provide `count` and `datatype` arguments that specify the same type signature (i.e., it is not necessary that both groups provide the same `count` value).

In [[versions/v40/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] : If the graph is empty, i.e., ~~`nnodes ==~~ ==`nnodes``==== 0`, then `MPI_COMM_NULL` is returned in all processes.

In [[versions/v40/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] : A single process is allowed to be defined multiple times in the list of neighbors of a process (i.e., there may be multiple edges between two processes). A process is also allowed to be a neighbor to itself (i.e., a self loop in the graph). The adjacency matrix is allowed to be ~~non-symmetric.~~ ==nonsymmetric.==

> Performance implications of using multiple edges or a ~~non-symmetric~~ ==nonsymmetric== adjacency matrix are not defined. The definition of a node-neighbor edge does not imply a direction of the communication.

22. Section ~~[[versions/v40/sections/inquiry#Startup|Startup]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== on page ~~[[versions/v40/sections/inquiry#Startup|Startup]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== , see explanations to [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] .

23. Section ~~[[versions/v40/sections/inquiry#Startup|Startup]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== on page ~~[[versions/v40/sections/inquiry#Startup|Startup]]~~ ==[[versions/v40/sections/dynamic#Starting MPI Processes|Starting MPI Processes]]== .

31. Section [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== on page [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== .

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

General rule about derived datatypes: Most datatype constructors have replication count or block length arguments. Allowed values are ~~non-negative~~ ==nonnegative== integers. If the value is zero, no elements are generated in the type map and there is no effect on datatype bounds or extent.

In [[versions/v41/API/MPI_GRAPH_CREATE|MPI_GRAPH_CREATE]] : If the graph is empty, i.e., ~~`nnodes``==~~ ==`nnodes``=== 0`, then `MPI_COMM_NULL` is returned in all processes.

~~`MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER`~~ ==`MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER`== behave as if a new error handler object is created. That is, once the error handler is no longer needed, [[versions/v41/API/MPI_ERRHANDLER_FREE|MPI_ERRHANDLER_FREE]] should be called with the error handler returned from [[MPI_ERRHANDLER_GET]] or ~~`MPI\_<span class="roman">{</span>COMM,WIN,FILE<span class="roman">}</span>\_GET_ERRHANDLER`~~ ==`MPI\_{COMM,WIN,FILE}\_GET_ERRHANDLER`== to mark the error handler for deallocation. This provides behavior similar to that of [[versions/v41/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] and [[versions/v41/API/MPI_GROUP_FREE|MPI_GROUP_FREE]] .

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/changes#Changes from Version 2.0 to Version 2.1]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/changes#Changes from Version 2.0 to Version 2.1]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/changes#Changes from Version 2.0 to Version 2.1]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/changes#Changes from Version 2.0 to Version 2.1]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/changes#Changes from Version 2.0 to Version 2.1]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/changes#Changes from Version 2.0 to Version 2.1]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/changes#Changes from Version 2.0 to Version 2.1]]

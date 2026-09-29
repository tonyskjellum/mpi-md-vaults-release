---
title: "Data Access Conventions"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Data Access Conventions

Chapter **io** · in [[versions/v20/sections/io#Data Access Conventions|MPI-2.0]], [[versions/v21/sections/io#Data Access Conventions|MPI-2.1]], [[versions/v22/sections/io#Data Access Conventions|MPI-2.2]], [[versions/v30/sections/io#Data Access Conventions|MPI-3.0]], [[versions/v31/sections/io#Data Access Conventions|MPI-3.1]], [[versions/v40/sections/io#Data Access Conventions|MPI-4.0]], [[versions/v41/sections/io#Data Access Conventions|MPI-4.1]], [[versions/v50/sections/io#Data Access Conventions|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

~~The layout of data in memory corresponding to `buf`, `count`, `datatype` is interpreted the same way as in MPI-1 communication functions; see Section 3.12.5 in .~~

==The layout of data in memory corresponding to `buf`, `count`, `datatype` is interpreted the same way as in==

==MPI==

==communication functions;==

==see Section [[versions/v21/sections/pt2pt#Message Data|Message Data]] on page [[versions/v21/sections/pt2pt#Message Data|Message Data]] and Section [[versions/v21/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] on page [[versions/v21/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] .==

by the calling process can be extracted from `status` by using `MPI_GET_COUNT` and `MPI_GET_ELEMENTS`, respectively. The interpretation of the ~~[[MPI_ERROR]]~~ ==`MPI_ERROR`== field is the same as for other operations — normally undefined, but meaningful if an MPI routine returns ~~[[MPI_ERR_IN_STATUS]] .~~ ==MPI_ERR_IN_STATUS.== The user can pass (in C and Fortran) MPI_STATUS_IGNORE in the `status` argument if the return value of this argument is not needed. In C++, the `status` argument is optional.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

by the calling process can be extracted from `status` by using `MPI_GET_COUNT` and `MPI_GET_ELEMENTS`, respectively. The interpretation of the `MPI_ERROR` field is the same as for other operations — normally undefined, but meaningful if an MPI routine returns ~~MPI_ERR_IN_STATUS.~~ ==`MPI_ERR_IN_STATUS`.== The user can pass (in C and Fortran) ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== in the `status` argument if the return value of this argument is not needed. In C++, the `status` argument is optional.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~Data is moved between files and processes by calling read and write routines. Read routines move data from a file into memory. Write routines move data from memory into a file. The file is designated by a file handle, `fh`. The location of the file data is specified by an offset into the current view. The data in memory is specified by a triple: `buf`, `count`, and `datatype`.~~

~~Upon completion, the amount of data accessed by the calling process is returned in a `status`.~~

==Data is moved between files and processes by calling read and write routines. Read routines move data from a file into memory. Write routines move data from memory into a file. The file is designated by a file handle, `fh`. The location of the file data is specified by an offset into the current view. The data in memory is specified by a triple: `buf`, `count`, and `datatype`. Upon completion, the amount of data accessed by the calling process is returned in a `status`.==

~~A data access routine attempts to transfer (read or write)~~

~~`count` data items of type `datatype` between the user’s buffer `buf` and the file.~~

~~The `datatype` passed to the routine must be a committed datatype.~~

~~The layout of data in memory corresponding to `buf`, `count`, `datatype` is interpreted the same way as in~~

~~MPI~~

~~communication functions;~~

~~see Section [[versions/v30/sections/pt2pt#Message Data|Message Data]] on page [[versions/v30/sections/pt2pt#Message Data|Message Data]] and Section [[versions/v30/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] on page [[versions/v30/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] .~~

~~The data is accessed from those parts of the file specified by the current view (Section [[versions/v30/sections/io#File Views|File Views]] , page [[versions/v30/sections/io#File Views|File Views]] ). The type signature of `datatype` must match the type signature of some number of contiguous copies of the `etype` of the current view. As in a receive, it is erroneous to specify a `datatype` for reading that contains overlapping regions (areas of memory which would be stored into more than once).~~

==A data access routine attempts to transfer (read or write) `count` data items of type `datatype` between the user’s buffer `buf` and the file. The `datatype` passed to the routine must be a committed datatype. The layout of data in memory corresponding to `buf`, `count`, `datatype` is interpreted the same way as in==

==MPI communication functions;==

==see Section [[versions/v30/sections/pt2pt#Message Data|Message Data]] on page [[versions/v30/sections/pt2pt#Message Data|Message Data]] and Section [[versions/v30/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] on page [[versions/v30/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] . The data is accessed from those parts of the file specified by the current view (Section [[versions/v30/sections/io#File Views|File Views]] , page [[versions/v30/sections/io#File Views|File Views]] ). The type signature of `datatype` must match the type signature of some number of contiguous copies of the `etype` of the current view. As in a receive, it is erroneous to specify a `datatype` for reading that contains overlapping regions (areas of memory which would be stored into more than once).==

~~operation.~~

~~Nonblocking operations are completed via `MPI_TEST`, `MPI_WAIT`, or any of their variants.~~

==operation. Nonblocking operations are completed via `MPI_TEST`, `MPI_WAIT`, or any of their variants.==

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in ~~subsections “Problems~~ ==> > Sections [[versions/v30/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] – [[versions/v30/sections/binding#Comparison with C|Comparison with C]] , especially in > > Sections [[versions/v30/sections/binding#Problems== Due to Data Copying and Sequence ~~Association,”~~ ==Association with Subscript Triplets|Problems Due to Data Copying== and ~~“A Problem~~ ==Sequence Association== with ~~Register Optimization” in Section [[binding#A Problem~~ ==Subscript Triplets]] and [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association== with ~~Register Optimization|A Problem~~ ==Vector Subscripts|Problems Due to Data Copying and Sequence Association== with ~~Register Optimization]] ,~~ ==Vector Subscripts]] on== pages [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence ~~Association|Problems~~ ==Association with Subscript Triplets|Problems== Due to Data Copying and Sequence ~~Association]]~~ ==Association with Subscript Triplets]] – [[versions/v30/sections/binding#Problems Due to Data Copying== and ~~[[binding#A Problem~~ ==Sequence Association== with ==Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “Problems Due to Data Copying and Sequence Association with Subscript Triplets” and “Vector Subscripts,” > > and in Sections [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “Optimization Problems,” “Code Movements and== Register ~~Optimization|A Problem with Register Optimization]] .~~ ==Optimization,” “Temporary Data Movements,” and “Permanent Data Movements.”==

For blocking routines, `status` is returned directly. For nonblocking routines and split collective routines, `status` is returned when the operation is completed. The number of `datatype` entries and predefined elements accessed ==by the calling process can be extracted from `status` by using `MPI_GET_COUNT` and `MPI_GET_ELEMENTS` (or `MPI_GET_ELEMENTS_X`), respectively. The interpretation of the <span class="sans-serif">MPI_ERROR</span> field is the same as for other operations — normally undefined, but meaningful if an MPI routine returns `MPI_ERR_IN_STATUS`. The user can pass (in C and Fortran)==

~~by the calling process can be extracted from `status` by using `MPI_GET_COUNT` and `MPI_GET_ELEMENTS`, respectively. The interpretation of the `MPI_ERROR` field is the same as for other operations — normally undefined, but meaningful if an MPI routine returns `MPI_ERR_IN_STATUS`. The user can pass (in C and Fortran)~~ `MPI_STATUS_IGNORE` in the `status` argument if the return value of this argument is not needed. ~~In C++, the `status` argument is optional.~~

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~A data access routine attempts to transfer (read or write) `count` data items of type `datatype` between the user’s buffer `buf` and the file. The `datatype` passed to the routine must be a committed datatype. The layout of data in memory corresponding to `buf`, `count`, `datatype` is interpreted the same way as in~~

~~MPI communication functions;~~

~~see Section [[versions/v31/sections/pt2pt#Message Data|Message Data]] on page [[versions/v31/sections/pt2pt#Message Data|Message Data]] and Section [[versions/v31/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] on page [[versions/v31/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] . The data is accessed from those parts of the file specified by the current view (Section [[versions/v31/sections/io#File Views|File Views]] , page [[versions/v31/sections/io#File Views|File Views]] ). The type signature of `datatype` must match the type signature of some number of contiguous copies of the `etype` of the current view. As in a receive, it is erroneous to specify a `datatype` for reading that contains overlapping regions (areas of memory which would be stored into more than once).~~

~~The nonblocking data access routines indicate that MPI can start a data access and associate a request handle, `request`, with the I/O~~

~~operation. Nonblocking operations are completed via `MPI_TEST`, `MPI_WAIT`, or any of their variants.~~

==A data access routine attempts to transfer (read or write) `count` data items of type `datatype` between the user’s buffer `buf` and the file. The `datatype` passed to the routine must be a committed datatype. The layout of data in memory corresponding to `buf`, `count`, `datatype` is interpreted the same way as in MPI communication functions; see [[versions/v31/sections/pt2pt#Message Data|Message Data]] and [[versions/v31/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] . The data is accessed from those parts of the file specified by the current view ( [[versions/v31/sections/io#File Views|File Views]] ). The type signature of `datatype` must match the type signature of some number of contiguous copies of the `etype` of the current view. As in a receive, it is erroneous to specify a `datatype` for reading that contains overlapping regions (areas of memory which would be stored into more than once).==

==The nonblocking data access routines indicate that MPI can start a data access and associate a request handle, `request`, with the I/O operation. Nonblocking operations are completed via [[versions/v31/API/MPI_TEST|MPI_TEST]] , [[versions/v31/API/MPI_WAIT|MPI_WAIT]] , or any of their variants.==

~~> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in > > Sections [[versions/v31/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] – [[versions/v31/sections/binding#Comparison with C|Comparison with C]] , especially in > > Sections [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] and [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] on pages [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] – [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “Problems Due to Data Copying and Sequence Association with Subscript Triplets” and “Vector Subscripts,” > > and in Sections [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “Optimization Problems,” “Code Movements and Register Optimization,” “Temporary Data Movements,” and “Permanent Data Movements.”~~

~~For blocking routines, `status` is returned directly. For nonblocking routines and split collective routines, `status` is returned when the operation is completed. The number of `datatype` entries and predefined elements accessed by the calling process can be extracted from `status` by using `MPI_GET_COUNT` and `MPI_GET_ELEMENTS` (or `MPI_GET_ELEMENTS_X`), respectively. The interpretation of the <span class="sans-serif">MPI_ERROR</span> field is the same as for other operations — normally undefined, but meaningful if an MPI routine returns `MPI_ERR_IN_STATUS`. The user can pass (in C and Fortran)~~

~~`MPI_STATUS_IGNORE` in the `status` argument if the return value of this argument is not needed.~~

~~The `status` can be passed to `MPI_TEST_CANCELLED` to determine if the operation was cancelled. All other fields of `status` are undefined.~~

==> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in > > Sections [[versions/v31/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] – [[versions/v31/sections/binding#Comparison with C|Comparison with C]] .==

==For blocking routines, `status` is returned directly. For nonblocking routines and split collective routines, `status` is returned when the operation is completed. The number of `datatype` entries and predefined elements accessed by the calling process can be extracted from `status` by using [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] (or [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] ), respectively. The interpretation of the `MPI_ERROR` field is the same as for other operations — normally undefined, but meaningful if an MPI routine returns `MPI_ERR_IN_STATUS`. The user can pass (in C and Fortran) `MPI_STATUS_IGNORE` in the `status` argument if the return value of this argument is not needed. The `status` can be passed to [[versions/v31/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] to determine if the operation was cancelled. All other fields of `status` are undefined.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

For blocking routines, `status` is returned directly. For nonblocking routines and split collective routines, `status` is returned when the operation is completed. The number of `datatype` entries and predefined elements accessed by the calling process can be extracted from `status` by using [[versions/v40/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v40/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] (or [[versions/v40/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] ), respectively. The interpretation of the `MPI_ERROR` field is the same as for other ~~operations — normally~~ ==operations—normally== undefined, but meaningful if an MPI routine returns `MPI_ERR_IN_STATUS`. The user can pass (in C and Fortran) `MPI_STATUS_IGNORE` in the `status` argument if the return value of this argument is not needed. The `status` can be passed to [[versions/v40/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] to determine if the operation was cancelled. All other fields of `status` are undefined.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

A data access routine attempts to transfer (read or write) `count` data items of type `datatype` between the user’s buffer `buf` and the file. The `datatype` passed to the routine must be a committed datatype. The layout of data in memory corresponding to `buf`, `count`, `datatype` is interpreted the same way as in MPI communication functions; see [[versions/v41/sections/pt2pt#Message Data|Message Data]] and [[versions/v41/sections/datatypes#Use of General Datatypes in Communication|Use of General Datatypes in Communication]] . The data is accessed from those parts of the file specified by the current view ( [[versions/v41/sections/io#File Views|File Views]] ). The type signature of `datatype` must match the type signature of some number of contiguous copies of the `etype` of the current view. As in a receive, it is erroneous to specify a `datatype` for reading that contains overlapping regions (areas of memory ~~which~~ ==that== would be stored into more than once).

For blocking routines, `status` is returned directly. For nonblocking routines and split collective routines, `status` is returned when the operation is completed. The number of `datatype` entries and predefined elements accessed by the calling process can be extracted from `status` by using [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ~~(or [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] ),~~ ==,== respectively. The interpretation of the `MPI_ERROR` field is the same as for other operations—normally undefined, but meaningful if an MPI routine returns `MPI_ERR_IN_STATUS`. The user can pass (in C and Fortran) `MPI_STATUS_IGNORE` in the `status` argument if the return value of this argument is not needed. The `status` can be passed to [[versions/v41/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] to determine if the operation was cancelled. All other fields of `status` are undefined.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

When reading, a program can detect the end of ==the== file by noting that the amount of data read is less than the amount requested. Writing past the end of ==the== file increases the file size. The amount of data accessed will be the amount requested, unless an error is raised (or a read reaches the end of ==the== file).

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Data Access Conventions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Data Access Conventions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Data Access Conventions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Data Access Conventions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Data Access Conventions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Data Access Conventions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Data Access Conventions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Data Access Conventions]]

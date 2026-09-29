---
title: "Definitions"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Definitions

Chapter **io** · in [[versions/v20/sections/io#Definitions|MPI-2.0]], [[versions/v21/sections/io#Definitions|MPI-2.1]], [[versions/v22/sections/io#Definitions|MPI-2.2]], [[versions/v30/sections/io#Definitions|MPI-3.0]], [[versions/v31/sections/io#Definitions|MPI-3.1]], [[versions/v40/sections/io#Definitions|MPI-4.0]], [[versions/v41/sections/io#Definitions|MPI-4.1]], [[versions/v50/sections/io#Definitions|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

etype An *etype* (*elementary* datatype) is the unit of data access and positioning. It can be any MPI predefined or derived datatype. Derived etypes can be constructed using any of the MPI datatype constructor routines, provided all resulting typemap displacements are ~~nonnegative~~ ==non-negative== and monotonically nondecreasing. Data access is performed in etype units, reading or writing whole data items of type etype. Offsets are expressed as a count of etypes; file pointers point to the beginning of etypes. Depending on context, the term “etype” is used to describe one of three aspects of an elementary datatype: a particular MPI type, a data item of that type, or the extent of that type.

but they must be ~~nonnegative~~ ==non-negative== and monotonically nondecreasing.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~filetype   A *filetype* is the basis for partitioning a file among processes and defines a template for accessing the file. A filetype is either a single etype or a derived MPI datatype constructed from multiple instances of the same etype. In addition,~~

~~the extent of any hole in the filetype must be a multiple of the etype’s extent.~~

~~The displacements in the typemap of the filetype are not required to be distinct,~~

~~but they must be non-negative and monotonically nondecreasing.~~

~~view   A *view* defines the current set of data visible and accessible from an open file as an ordered set of etypes. Each process has its own view of the file, defined by three quantities: a displacement, an etype, and a filetype. The pattern described by a filetype is repeated, beginning at the displacement, to define the view.~~

~~The pattern of repetition is defined to be the same pattern that `MPI_TYPE_CONTIGUOUS` would produce if it were passed the filetype and an arbitrarily large count. Figure [[versions/v30/sections/io#Definitions|Definitions]] shows how the tiling works; note that the filetype in this example must have explicit lower and upper bounds set in order for the initial and final holes to be repeated in the view.~~

~~Views can be changed by the user during program execution. The default view is a linear byte stream (displacement is zero, etype and filetype equal to `MPI_BYTE`).~~

==filetype   A *filetype* is the basis for partitioning a file among processes and defines a template for accessing the file. A filetype is either a single etype or a derived MPI datatype constructed from multiple instances of the same etype. In addition, the extent of any hole in the filetype must be a multiple of the etype’s extent. The displacements in the typemap of the filetype are not required to be distinct, but they must be non-negative and monotonically nondecreasing.==

==view   A *view* defines the current set of data visible and accessible from an open file as an ordered set of etypes. Each process has its own view of the file, defined by three quantities: a displacement, an etype, and a filetype. The pattern described by a filetype is repeated, beginning at the displacement, to define the view. The pattern of repetition is defined to be the same pattern that `MPI_TYPE_CONTIGUOUS` would produce if it were passed the filetype and an arbitrarily large count. Figure [[versions/v30/sections/io#Definitions|Definitions]] shows how the tiling works; note that the filetype in this example must have explicit lower and upper bounds set in order for the initial and final holes to be repeated in the view. Views can be changed by the user during program execution. The default view is a linear byte stream (displacement is zero, etype and filetype equal to `MPI_BYTE`).==

~~offset   An *offset* is a position~~

~~in the file~~

~~relative to the current view, expressed as a count of etypes.~~

~~Holes in the view’s filetype are skipped when calculating this position. Offset 0 is the location of the first etype visible in the view (after skipping the displacement and any initial holes in the view).~~

~~For example, an offset of 2 for process 1~~

~~in Figure [[versions/v30/sections/io#Definitions|Definitions]] is the position of the 8th etype in the file after the displacement.~~

~~An “explicit offset” is an offset that is used as a formal parameter in explicit data access routines.~~

==offset   An *offset* is a position in the file relative to the current view, expressed as a count of etypes. Holes in the view’s filetype are skipped when calculating this position. Offset 0 is the location of the first etype visible in the view (after skipping the displacement and any initial holes in the view).==

==For example, an offset of 2 for process 1 in Figure [[versions/v30/sections/io#Definitions|Definitions]] is the position of the eighth etype in the file after the displacement. An “explicit offset” is an offset that is used as an argument in explicit data access routines.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~file   An MPI file is an ordered collection of typed data items. MPI supports random or sequential access to any integral set of these items.~~

~~A file is opened collectively by a group of processes. All collective I/O calls on a file are collective over this group.~~

~~displacement   A file *displacement* is an absolute byte position relative to the beginning of a file. The displacement defines the location where a *view* begins.~~

~~Note that a “file displacement” is distinct from a “typemap displacement.”~~

~~etype   An *etype* (*elementary* datatype) is the unit of data access and positioning. It can be any MPI predefined or derived datatype. Derived etypes can be constructed using any of the MPI datatype constructor routines, provided all resulting typemap displacements are non-negative and monotonically nondecreasing. Data access is performed in etype units, reading or writing whole data items of type etype. Offsets are expressed as a count of etypes; file pointers point to the beginning of etypes. Depending on context, the term “etype” is used to describe one of three aspects of an elementary datatype: a particular MPI type, a data item of that type, or the extent of that type.~~

~~filetype   A *filetype* is the basis for partitioning a file among processes and defines a template for accessing the file. A filetype is either a single etype or a derived MPI datatype constructed from multiple instances of the same etype. In addition, the extent of any hole in the filetype must be a multiple of the etype’s extent. The displacements in the typemap of the filetype are not required to be distinct, but they must be non-negative and monotonically nondecreasing.~~

~~view   A *view* defines the current set of data visible and accessible from an open file as an ordered set of etypes. Each process has its own view of the file, defined by three quantities: a displacement, an etype, and a filetype. The pattern described by a filetype is repeated, beginning at the displacement, to define the view. The pattern of repetition is defined to be the same pattern that `MPI_TYPE_CONTIGUOUS` would produce if it were passed the filetype and an arbitrarily large count. Figure [[versions/v31/sections/io#Definitions|Definitions]] shows how the tiling works; note that the filetype in this example must have explicit lower and upper bounds set in order for the initial and final holes to be repeated in the view. Views can be changed by the user during program execution. The default view is a linear byte stream (displacement is zero, etype and filetype equal to `MPI_BYTE`).~~

==**file**   An MPI file is an ordered collection of typed data items. MPI supports random or sequential access to any integral set of these items. A file is opened collectively by a group of processes. All collective I/O calls on a file are collective over this group.==

==**displacement**   A file *displacement* is an absolute byte position relative to the beginning of a file. The displacement defines the location where a *view* begins. Note that a “file displacement” is distinct from a “typemap displacement.”==

==**etype**   An *etype* (*elementary* datatype) is the unit of data access and positioning. It can be any MPI predefined or derived datatype. Derived etypes can be constructed using any of the MPI datatype constructor routines, provided all resulting typemap displacements are non-negative and monotonically nondecreasing. Data access is performed in etype units, reading or writing whole data items of type etype. Offsets are expressed as a count of etypes; file pointers point to the beginning of etypes. Depending on context, the term “etype” is used to describe one of three aspects of an elementary datatype: a particular MPI type, a data item of that type, or the extent of that type.==

==**filetype**   A *filetype* is the basis for partitioning a file among processes and defines a template for accessing the file. A filetype is either a single etype or a derived MPI datatype constructed from multiple instances of the same etype. In addition, the extent of any hole in the filetype must be a multiple of the etype’s extent. The displacements in the typemap of the filetype are not required to be distinct, but they must be non-negative and monotonically nondecreasing.==

==**view**   A *view* defines the current set of data visible and accessible from an open file as an ordered set of etypes. Each process has its own view of the file, defined by three quantities: a displacement, an etype, and a filetype. The pattern described by a filetype is repeated, beginning at the displacement, to define the view. The pattern of repetition is defined to be the same pattern that [[versions/v31/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] would produce if it were passed the filetype and an arbitrarily large count. Figure [[versions/v31/sections/io#Definitions|Definitions]] shows how the tiling works; note that the filetype in this example must have explicit lower and upper bounds set in order for the initial and final holes to be repeated in the view. Views can be changed by the user during program execution. The default view is a linear byte stream (displacement is zero, etype and filetype equal to `MPI_BYTE`).==

~~offset   An *offset* is a position in the file relative to the current view, expressed as a count of etypes. Holes in the view’s filetype are skipped when calculating this position. Offset 0 is the location of the first etype visible in the view (after skipping the displacement and any initial holes in the view).~~

~~For example, an offset of 2 for process 1 in Figure [[versions/v31/sections/io#Definitions|Definitions]] is the position of the eighth etype in the file after the displacement. An “explicit offset” is an offset that is used as an argument in explicit data access routines.~~

~~file size and end of file   The *size* of an MPI file is measured in bytes from the beginning of the file. A newly created file has a size of zero bytes. Using the size as an absolute displacement gives the position of the byte immediately following the last byte in the file. For any given view, the *end of file* is the offset of the first etype accessible in the current view starting after the last byte in the file.~~

~~file pointer   A *file pointer* is an implicit offset maintained by MPI. “Individual file pointers” are file pointers that are local to each process that opened the file. A “shared file pointer” is a file pointer that is shared by the group of processes that opened the file.~~

~~file handle   A *file handle* is an opaque object created by `MPI_FILE_OPEN` and freed by `MPI_FILE_CLOSE`. All operations on an open file reference the file through the file handle.~~

==**offset**   An *offset* is a position in the file relative to the current view, expressed as a count of etypes. Holes in the view’s filetype are skipped when calculating this position. Offset 0 is the location of the first etype visible in the view (after skipping the displacement and any initial holes in the view). For example, an offset of 2 for process 1 in Figure [[versions/v31/sections/io#Definitions|Definitions]] is the position of the eighth etype in the file after the displacement. An “explicit offset” is an offset that is used as an argument in explicit data access routines.==

==**file size** and **end of file**   The *size* of an MPI file is measured in bytes from the beginning of the file. A newly created file has a size of zero bytes. Using the size as an absolute displacement gives the position of the byte immediately following the last byte in the file. For any given view, the *end of file* is the offset of the first etype accessible in the current view starting after the last byte in the file.==

==**file pointer**   A *file pointer* is an implicit offset maintained by MPI. “Individual file pointers” are file pointers that are local to each process that opened the file. A “shared file pointer” is a file pointer that is shared by the group of processes that opened the file.==

==**file handle**   A *file handle* is an opaque object created by [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] and freed by [[versions/v31/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] . All operations on an open file reference the file through the file handle.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~**file**~~ ==**file**:== An MPI file is an ordered collection of typed data items. MPI supports random or sequential access to any integral set of these items. A file is opened collectively by a group of processes. All collective I/O calls on a file are collective over this group.

~~**displacement**~~ ==**displacement**:== A file *displacement* is an absolute byte position relative to the beginning of a file. The displacement defines the location where a *view* begins. Note that a “file displacement” is distinct from a “typemap displacement.”

~~**etype**~~ ==**etype**:== An *etype* (*elementary* datatype) is the unit of data access and positioning. It can be any MPI predefined or derived datatype. Derived etypes can be constructed using any of the MPI datatype constructor routines, provided all resulting typemap displacements are ~~non-negative~~ ==nonnegative== and monotonically nondecreasing. Data access is performed in etype units, reading or writing whole data items of type etype. Offsets are expressed as a count of etypes; file pointers point to the beginning of etypes. Depending on context, the term “etype” is used to describe one of three aspects of an elementary datatype: a particular MPI type, a data item of that type, or the extent of that type.

~~**filetype**~~ ==**filetype**:== A *filetype* is the basis for partitioning a file among processes and defines a template for accessing the file. A filetype is either a single etype or a derived MPI datatype constructed from multiple instances of the same etype. In addition, the extent of any hole in the filetype must be a multiple of the etype’s extent. The displacements in the typemap of the filetype are not required to be distinct, but they must be ~~non-negative~~ ==nonnegative== and monotonically nondecreasing.

~~**view**~~ ==**view**:== A *view* defines the current set of data visible and accessible from an open file as an ordered set of etypes. Each process has its own view of the file, defined by three quantities: a displacement, an etype, and a filetype. The pattern described by a filetype is repeated, beginning at the displacement, to define the view. The pattern of repetition is defined to be the same pattern that [[versions/v41/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] would produce if it were passed the filetype and an arbitrarily large count. Figure [[versions/v41/sections/io#Definitions|Definitions]] shows how the tiling works; note that the filetype in this example must have explicit lower and upper bounds set in order for the initial and final holes to be repeated in the view. Views can be changed by the user during program execution. The default view is a linear byte stream (displacement is zero, etype and filetype equal to `MPI_BYTE`).

~~**offset**~~ ==**offset**:== An *offset* is a position in the file relative to the current view, expressed as a count of etypes. Holes in the view’s filetype are skipped when calculating this position. Offset 0 is the location of the first etype visible in the view (after skipping the displacement and any initial holes in the view). For example, an offset of 2 for process 1 in Figure [[versions/v41/sections/io#Definitions|Definitions]] is the position of the eighth etype in the file after the displacement. An “explicit offset” is an offset that is used as an argument in explicit data access routines.

**file size** and **end of ~~file**~~ ==file**:== The *size* of an MPI file is measured in bytes from the beginning of the file. A newly created file has a size of zero bytes. Using the size as an absolute displacement gives the position of the byte immediately following the last byte in the file. For any given view, the *end of file* is the offset of the first etype accessible in the current view starting after the last byte in the file.

**file ~~pointer**~~ ==pointer**:== A *file pointer* is an implicit offset maintained by MPI. “Individual file pointers” are file pointers that are local to each process that opened the file. A “shared file pointer” is a file pointer that is shared by the group of processes that opened the file.

**file ~~handle**~~ ==handle**:== A *file handle* is an opaque object created by [[versions/v41/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] and freed by [[versions/v41/API/MPI_FILE_CLOSE|MPI_FILE_CLOSE]] . All operations on an open file reference the file through the file handle.

### MPI-4.1 → MPI-5.0  (4 changed paragraphs)

~~**file**:~~ ==**MPI file**:== An MPI file is an ordered collection of typed data items. MPI supports random or sequential access to any integral set of these items. A file is opened collectively by a group of processes. All collective I/O calls on a file are collective over this group.

**etype**: An *etype* (*elementary* datatype) is the unit of data access and positioning. It can be any MPI predefined or derived datatype. Derived etypes can be constructed using any of the MPI datatype constructor routines, provided all resulting typemap displacements are nonnegative and monotonically ~~nondecreasing.~~ ==increasing.== Data access is performed in etype units, reading or writing whole data items of type etype. Offsets are expressed as a count of etypes; file pointers point to the beginning of etypes. Depending on context, the term “etype” is used to describe one of three aspects of an elementary datatype: a particular MPI type, a data item of that type, or the extent of that type.

A group of processes can use complementary views to achieve a global data ~~distribution~~ ==distribution,== such as a scatter/gather pattern (see Figure [[versions/v50/sections/io#Definitions|Definitions]] ).

**offset**: An *offset* is a position in ~~the~~ ==a== file relative to the current view, expressed as a count of etypes. Holes in the view’s filetype are skipped when calculating this position. Offset 0 is the location of the first etype visible in the view (after skipping the displacement and any initial holes in the view). For example, an offset of 2 for ~~process~~ ==Process== 1 in Figure [[versions/v50/sections/io#Definitions|Definitions]] is the position of the eighth etype in the file after the displacement. An “explicit offset” is an offset that is used as an argument in explicit data access routines.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Definitions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Definitions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Definitions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Definitions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Definitions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Definitions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Definitions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Definitions]]

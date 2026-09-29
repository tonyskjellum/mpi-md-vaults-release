---
title: "File Views"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# File Views

Chapter **io** · in [[versions/v20/sections/io#File Views|MPI-2.0]], [[versions/v21/sections/io#File Views|MPI-2.1]], [[versions/v22/sections/io#File Views|MPI-2.2]], [[versions/v30/sections/io#File Views|MPI-3.0]], [[versions/v31/sections/io#File Views|MPI-3.1]], [[versions/v40/sections/io#File Views|MPI-4.0]], [[versions/v41/sections/io#File Views|MPI-4.1]], [[versions/v50/sections/io#File Views|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

==MPI_DISPLACEMENT_CURRENT is invalid unless the amode for the file has MPI_MODE_SEQUENTIAL set.==

> It is expected that a call to `MPI_FILE_SET_VIEW` will immediately follow `MPI_FILE_OPEN` in numerous instances. A ~~high quality~~ ==high-quality== implementation will ensure that this behavior is efficient.

### MPI-2.1 → MPI-2.2  (5 changed paragraphs)

If ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== mode was specified when the file was opened, the special displacement ~~MPI_DISPLACEMENT_CURRENT~~ ==`MPI_DISPLACEMENT_CURRENT`== must be passed in `disp`. This sets the displacement to the current position of the shared file pointer.

~~MPI_DISPLACEMENT_CURRENT~~ ==`MPI_DISPLACEMENT_CURRENT`== is invalid unless the amode for the file has ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== set.

> For some sequential files, such as those corresponding to magnetic tapes or streaming network connections, the *displacement* may not be meaningful. ~~MPI_DISPLACEMENT_CURRENT~~ ==`MPI_DISPLACEMENT_CURRENT`== allows the view to be changed for these types of files.

An *etype* (*elementary* datatype) is the unit of data access and positioning. It can be any MPI predefined or derived datatype. Derived etypes can be constructed by using any of the MPI datatype constructor routines, provided all resulting typemap displacements are ~~nonnegative~~ ==non-negative== and monotonically nondecreasing. Data access is performed in etype units, reading or writing whole data items of type etype. Offsets are expressed as a count of `etype`s; file pointers point to the beginning of etypes.

The `info` argument is used to provide information regarding file access patterns and file system specifics to direct optimization (see Section [[versions/v22/sections/io#File Info|File Info]] , page [[versions/v22/sections/io#File Info|File Info]] ). The constant ~~MPI_INFO_NULL~~ ==`MPI_INFO_NULL`== refers to the null info and can be used when no info needs to be specified.

The data representation is returned in `datarep`. The user is responsible for ensuring that `datarep` is large enough to hold the returned data representation string. The length of a data representation string is limited to the value of ~~MPI_MAX_DATAREP_STRING.~~ ==`MPI_MAX_DATAREP_STRING`.==

### MPI-2.2 → MPI-3.0  (7 changed paragraphs)

~~The `MPI_FILE_SET_VIEW` routine changes the process’s view of the data in the file.~~

~~The start of the view is set to `disp`;~~

~~the type of data is set to `etype`; the distribution of data to processes is set to `filetype`;~~

~~and the representation of data in the file is set to `datarep`.~~

~~In addition, `MPI_FILE_SET_VIEW` resets the individual file pointers and the shared file pointer to zero. `MPI_FILE_SET_VIEW` is collective; the values for `datarep` and~~

~~the extents of `etype` in the file data representation~~

==The `MPI_FILE_SET_VIEW` routine changes the process’s view of the data in the file. The start of the view is set to `disp`;==

==the type of data is set to `etype`; the distribution of data to processes is set to `filetype`; and the representation of data in the file is set to `datarep`. In addition, `MPI_FILE_SET_VIEW` resets the individual file pointers and the shared file pointer to zero. `MPI_FILE_SET_VIEW` is collective; the values for `datarep` and the extents of `etype` in the file data representation==

~~If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, the special displacement `MPI_DISPLACEMENT_CURRENT` must be passed in `disp`. This sets the displacement to the current position of the shared file pointer.~~

~~`MPI_DISPLACEMENT_CURRENT` is invalid unless the amode for the file has `MPI_MODE_SEQUENTIAL` set.~~

==If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, the special displacement `MPI_DISPLACEMENT_CURRENT` must be passed in `disp`. This sets the displacement to the current position of the shared file pointer. `MPI_DISPLACEMENT_CURRENT` is invalid unless the amode for the file has `MPI_MODE_SEQUENTIAL` set.==

~~The `disp` displacement argument specifies the position~~

~~(absolute offset in bytes from the beginning of the file)~~

~~where the view begins.~~

==The `disp` displacement argument specifies the position (absolute offset in bytes from the beginning of the file) where the view begins.==

> `disp` can be used to skip headers or when the file includes a sequence of data segments that are to be accessed in different patterns (see Figure [[versions/v30/sections/io#File Views|File Views]] ). Separate views, ~~> >~~ each using a different displacement and filetype, > > can be used to access each segment. > > *Figure: Displacements*

An *etype* (*elementary* datatype) is the unit of data access and positioning. It can be any MPI predefined or derived datatype. Derived etypes can be constructed by using any of the MPI datatype constructor routines, provided all resulting typemap displacements are non-negative and monotonically nondecreasing. Data access is performed in etype units, reading or writing whole data items of type etype. Offsets are expressed as a count of ~~`etype`s;~~ ==etypes;== file pointers point to the beginning of etypes.

~~A filetype is either a single etype or a derived MPI datatype constructed from multiple instances of the same etype. In addition,~~

~~the extent of any hole in the filetype must be a multiple of the etype’s extent.~~

~~These displacements are not required to be distinct, but they cannot be negative, and they must be monotonically nondecreasing.~~

~~If the file is opened for writing, neither the `etype` nor the `filetype` is permitted to contain overlapping regions. This restriction is equivalent to the “datatype used in a receive cannot specify overlapping regions” restriction for communication. Note that `filetype`s from different processes may still overlap each other.~~

~~If `filetype` has holes in it, then the data in the holes is inaccessible to the calling process. However, the `disp`, `etype` and `filetype` arguments can be changed via future calls to `MPI_FILE_SET_VIEW` to access a different part of the file.~~

~~It is erroneous to use absolute addresses in the construction of the `etype` and `filetype`.~~

==A filetype is either a single etype or a derived MPI datatype constructed from multiple instances of the same etype. In addition, the extent of any hole in the filetype must be a multiple of the etype’s extent. These displacements are not required to be distinct, but they cannot be negative, and they must be monotonically nondecreasing.==

==If the file is opened for writing, neither the etype nor the filetype is permitted to contain overlapping regions. This restriction is equivalent to the “datatype used in a receive cannot specify overlapping regions” restriction for communication. Note that filetypes from different processes may still overlap each other.==

==If a filetype has holes in it, then the data in the holes is inaccessible to the calling process. However, the `disp`, `etype`, and `filetype` arguments can be changed via future calls to `MPI_FILE_SET_VIEW` to access a different part of the file.==

==It is erroneous to use absolute addresses in the construction of the etype and filetype.==

The user is responsible for ensuring that all nonblocking requests and split collective operations on `fh` have been completed before calling ~~`MPI_FILE_SET_VIEW`—otherwise,~~ ==`MPI_FILE_SET_VIEW` — otherwise,== the call to `MPI_FILE_SET_VIEW` is erroneous.

~~In addition, if a portable datatype was used to set the current view, then the corresponding datatype returned by `MPI_FILE_GET_VIEW` is also a portable datatype. If `etype` or `filetype` are derived datatypes, the user is responsible for freeing them.~~

~~The `etype` and `filetype` returned are both in a committed state.~~

==In addition, if a portable datatype was used to set the current view, then the corresponding datatype returned by `MPI_FILE_GET_VIEW` is also a portable datatype. If `etype` or `filetype` are derived datatypes, the user is responsible for freeing them. The `etype` and `filetype` returned are both in a committed state.==

### MPI-3.0 → MPI-3.1  (8 changed paragraphs)

~~The `MPI_FILE_SET_VIEW` routine changes the process’s view of the data in the file. The start of the view is set to `disp`;~~

~~the type of data is set to `etype`; the distribution of data to processes is set to `filetype`; and the representation of data in the file is set to `datarep`. In addition, `MPI_FILE_SET_VIEW` resets the individual file pointers and the shared file pointer to zero. `MPI_FILE_SET_VIEW` is collective; the values for `datarep` and the extents of `etype` in the file data representation~~

~~must be identical on all processes in the group; values for `disp`, `filetype`, and `info` may vary. The datatypes passed in `etype` and `filetype` must be committed.~~

~~The `etype` always specifies the data layout in the file. If `etype` is a portable datatype (see Section [[terms-semantic]] , page [[terms-semantic]] ), the extent of `etype` is computed by scaling any displacements in the datatype to match the file data representation. If `etype` is not a portable datatype, no scaling is done when computing the extent of `etype`. The user must be careful when using nonportable `etype`s in heterogeneous environments; see Section [[versions/v31/sections/io#Datatypes for File Interoperability|Datatypes for File Interoperability]] , page [[versions/v31/sections/io#Datatypes for File Interoperability|Datatypes for File Interoperability]] for further details.~~

==The [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] routine changes the process’s view of the data in the file. The start of the view is set to `disp`; the type of data is set to `etype`; the distribution of data to processes is set to `filetype`; and the representation of data in the file is set to `datarep`. In addition, [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] resets the individual file pointers and the shared file pointer to zero. [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] is collective; the values for `datarep` and the extents of `etype` in the file data representation must be identical on all processes in the group; values for `disp`, `filetype`, and `info` may vary. The datatypes passed in `etype` and `filetype` must be committed.==

==The `etype` always specifies the data layout in the file. If `etype` is a portable datatype (see [[terms-semantic]] ), the extent of `etype` is computed by scaling any displacements in the datatype to match the file data representation. If `etype` is not a portable datatype, no scaling is done when computing the extent of `etype`. The user must be careful when using nonportable `etype`s in heterogeneous environments; see [[versions/v31/sections/io#Datatypes for File Interoperability|Datatypes for File Interoperability]] for further details.==

> It is expected that a call to ~~`MPI_FILE_SET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]]== will immediately follow ~~`MPI_FILE_OPEN`~~ ==[[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]]== in numerous instances. A high-quality implementation will ensure that this behavior is efficient.

> `disp` can be used to skip headers or when the file includes a sequence of data segments that are to be accessed in different patterns (see Figure [[versions/v31/sections/io#File Views|File Views]] ). Separate views, each using a different displacement and filetype, ~~> >~~ can be used to access each segment. > > *Figure: Displacements*

> In order to ensure interoperability in a heterogeneous environment, additional restrictions must be observed when constructing the `etype` (see ~~Section [[versions/v31/sections/io#File Interoperability|File Interoperability]] , page~~ [[versions/v31/sections/io#File Interoperability|File Interoperability]] ).

If a filetype has holes in it, then the data in the holes is inaccessible to the calling process. However, the `disp`, `etype`, and `filetype` arguments can be changed via future calls to ~~`MPI_FILE_SET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]]== to access a different part of the file.

The `info` argument is used to provide information regarding file access patterns and file system specifics to direct optimization (see ~~Section [[versions/v31/sections/io#File Info|File Info]] , page~~ [[versions/v31/sections/io#File Info|File Info]] ). The constant `MPI_INFO_NULL` refers to the null info and can be used when no info needs to be specified.

The `datarep` argument is a string that specifies the representation of data in the file. See the file interoperability section ~~(Section [[versions/v31/sections/io#File Interoperability|File Interoperability]] , page~~ ==(== [[versions/v31/sections/io#File Interoperability|File Interoperability]] ) for details and a discussion of valid values.

The user is responsible for ensuring that all nonblocking requests and split collective operations on `fh` have been completed before calling ~~`MPI_FILE_SET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]]== — otherwise, the call to ~~`MPI_FILE_SET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]]== is erroneous.

~~`MPI_FILE_GET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_GET_VIEW|MPI_FILE_GET_VIEW]]== returns the process’s view of the data in the file. The current value of the displacement is returned in `disp`. The `etype` and `filetype` are new datatypes with typemaps equal to the typemaps of the current etype and filetype, respectively.

In addition, if a portable datatype was used to set the current view, then the corresponding datatype returned by ~~`MPI_FILE_GET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_GET_VIEW|MPI_FILE_GET_VIEW]]== is also a portable datatype. If `etype` or `filetype` are derived datatypes, the user is responsible for freeing them. The `etype` and `filetype` returned are both in a committed state.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The user is responsible for ensuring that all nonblocking requests and split collective operations on `fh` have been completed before calling [[versions/v40/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] ~~— otherwise,~~ ==—otherwise,== the call to [[versions/v40/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] is erroneous.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, the special displacement `MPI_DISPLACEMENT_CURRENT` must be passed in `disp`. This sets the displacement to the current position of the shared file pointer. `MPI_DISPLACEMENT_CURRENT` is invalid unless the ~~amode~~ ==`amode`== for the file has `MPI_MODE_SEQUENTIAL` set.

An *etype* (*elementary* datatype) is the unit of data access and positioning. It can be any MPI predefined or derived datatype. Derived etypes can be constructed by using any of the MPI datatype constructor routines, provided all resulting typemap displacements are ~~non-negative~~ ==nonnegative== and monotonically nondecreasing. Data access is performed in etype units, reading or writing whole data items of type etype. Offsets are expressed as a count of etypes; file pointers point to the beginning of etypes.

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The [[versions/v50/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] routine changes the process’s view of the data in the file. The start of the view is set to `disp`; the type of data is set to `etype`; the distribution of data to processes is set to `filetype`; and the representation of data in the file is set to `datarep`. In addition, [[versions/v50/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] resets the individual file pointers and the shared file pointer to zero. [[versions/v50/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] is collective; the values for `datarep` and the ~~extents~~ ==extent== of `etype` in the file data representation must be identical on all processes in the group; values for `disp`, `filetype`, and `info` may vary. The datatypes passed in `etype` and `filetype` must be committed.

An *etype* (*elementary* datatype) is the unit of data access and positioning. It can be any MPI predefined or derived datatype. Derived etypes can be constructed by using any of the MPI datatype constructor routines, provided all resulting typemap displacements are nonnegative and monotonically ~~nondecreasing.~~ ==increasing.== Data access is performed in etype units, reading or writing whole data items of type etype. Offsets are expressed as a count of etypes; file pointers point to the beginning of etypes.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#File Views]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#File Views]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#File Views]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#File Views]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#File Views]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#File Views]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#File Views]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#File Views]]

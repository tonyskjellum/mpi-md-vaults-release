---
title: "File Interoperability"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# File Interoperability

Chapter **io** · in [[versions/v20/sections/io#File Interoperability|MPI-2.0]], [[versions/v21/sections/io#File Interoperability|MPI-2.1]], [[versions/v22/sections/io#File Interoperability|MPI-2.2]], [[versions/v30/sections/io#File Interoperability|MPI-3.0]], [[versions/v31/sections/io#File Interoperability|MPI-3.1]], [[versions/v40/sections/io#File Interoperability|MPI-4.0]], [[versions/v41/sections/io#File Interoperability|MPI-4.1]], [[versions/v50/sections/io#File Interoperability|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (4 changed paragraphs)

In a ~~high quality~~ ==high-quality== implementation of MPI, users will be able to manipulate MPI files using the same or similar tools that the native file system offers for manipulating its files.

~~The native and internal data representations are implementation dependent, while the external32 representation is common to all MPI implementations and facilitates file interoperability. The data representation is specified in the *datarep* argument to `MPI_FILE_SET_VIEW`.~~

==The==

==“native” and “internal”==

==data representations are implementation dependent, while the==

==“external32”==

==representation is common to all MPI implementations and facilitates file interoperability. The data representation is specified in the *datarep* argument to `MPI_FILE_SET_VIEW`.==

> When implementing read and write operations on top of MPI ~~message passing,~~ ==message-passing,== the message data should be typed as `MPI_BYTE` to ensure that the message routines do not perform any type conversions on the data.

> When implementing read and write operations on top of MPI ~~message passing,~~ ==message-passing,== the message data should be converted to and from the “external32” representation in the client, and sent as type `MPI_BYTE`. This will avoid possible double data type conversions and the associated further loss of precision and performance.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

Interoperability within a single MPI environment (which could be considered “operability”) ensures that file data written by one MPI process can be read by any other MPI process, subject to the consistency constraints (see Section [[versions/v22/sections/io#File Consistency|File Consistency]] , page [[versions/v22/sections/io#File Consistency|File Consistency]] ), provided that it would have been possible to start the two processes simultaneously and have them reside in a single ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.== Furthermore, both processes must see the same data values at every absolute byte offset in the file for which data was written.

### MPI-2.2 → MPI-3.0  (7 changed paragraphs)

~~At the most basic level, file interoperability is the ability to read the information previously written to a file—not just the bits of data, but the actual information the bits represent. MPI guarantees full interoperability within a single MPI environment,~~

~~and supports increased interoperability outside that environment through the external data representation (Section [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , page [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] ) as well as the data conversion functions (Section [[versions/v30/sections/io#User-Defined Data Representations|User-Defined Data Representations]] , page [[versions/v30/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ).~~

==At the most basic level, file interoperability is the ability to read the information previously written to a file — not just the bits of data, but the actual information the bits represent. MPI guarantees full interoperability within a single MPI environment, and supports increased interoperability outside that environment through the external data representation (Section [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , page [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] ) as well as the data conversion functions (Section [[versions/v30/sections/io#User-Defined Data Representations|User-Defined Data Representations]] , page [[versions/v30/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ).==

~~This single environment file interoperability implies that file data is accessible~~

~~regardless of the number of processes.~~

==This single environment file interoperability implies that file data is accessible regardless of the number of processes.==

~~The first two aspects of file interoperability are beyond the scope of this standard, as both are highly machine dependent. However, transferring the bits of a file into and out of the MPI environment (e.g., by writing a file to tape) is required to be supported by all MPI implementations.~~

~~In particular, an implementation must specify how familiar operations similar to POSIX `cp`, `rm`, and `mv` can~~

~~be performed on the file. Furthermore, it is expected that the facility provided maintains the correspondence between absolute byte offsets (e.g., after possible file structure conversion, the data bits at byte offset 102 in the MPI environment are at byte offset 102 outside the MPI environment). As an example, a simple off-line conversion utility that transfers and converts files between the native file system and the MPI environment would suffice, provided it maintained the offset coherence mentioned above.~~

~~In a high-quality implementation of MPI, users will be able to manipulate MPI files using the same or similar tools that the native file system offers for manipulating its files.~~

~~The remaining aspect of file interoperability, converting between different machine representations,~~

~~is supported~~

~~by the typing information specified in the etype and filetype. This facility allows the information in files to be shared between any two applications, regardless of whether they use MPI, and regardless of the machine architectures on which they run.~~

~~MPI supports multiple data representations: “native,” “internal,” and “external32.”~~

~~An implementation may support additional data representations. MPI also supports user-defined data representations (see Section [[versions/v30/sections/io#User-Defined Data Representations|User-Defined Data Representations]] , page [[versions/v30/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ).~~

==The first two aspects of file interoperability are beyond the scope of this standard, as both are highly machine dependent. However, transferring the bits of a file into and out of the MPI environment (e.g., by writing a file to tape) is required to be supported by all MPI implementations. In particular, an implementation must specify how familiar operations similar to POSIX `cp`, `rm`, and `mv` can be performed on the file. Furthermore, it is expected that the facility provided maintains the correspondence between absolute byte offsets (e.g., after possible file structure conversion, the data bits at byte offset 102 in the MPI environment are at byte offset 102 outside the MPI environment). As an example, a simple off-line conversion utility that transfers and converts files between the native file system and the MPI environment would suffice, provided it maintained the offset coherence mentioned above. In a high-quality implementation of MPI, users will be able to manipulate MPI files using the same or similar tools that the native file system offers for manipulating its files.==

==The remaining aspect of file interoperability, converting between different machine representations, is supported by the typing information specified in the etype and filetype. This facility allows the information in files to be shared between any two applications, regardless of whether they use MPI, and regardless of the machine architectures on which they run.==

==MPI supports multiple data representations: “native,” “internal,” and “external32.” An implementation may support additional data representations. MPI also supports user-defined data representations (see Section [[versions/v30/sections/io#User-Defined Data Representations|User-Defined Data Representations]] , page [[versions/v30/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ).==

~~“native” and “internal”~~

~~data representations are implementation dependent, while the~~

~~“external32”~~

~~representation is common to all MPI implementations and facilitates file interoperability. The data representation is specified in the *datarep* argument to `MPI_FILE_SET_VIEW`.~~

==“native” and “internal” data representations are implementation dependent, while the==

==“external32” representation is common to all MPI implementations and facilitates file interoperability. The data representation is specified in the *datarep* argument to `MPI_FILE_SET_VIEW`.==

~~“native”   Data in this representation is stored in a file exactly as it is in memory. The advantage of this data representation is that~~

~~data precision and I/O performance are not lost in type conversions with a purely homogeneous environment. The disadvantage is the loss of transparent interoperability within a heterogeneous MPI environment.~~

==“native”   Data in this representation is stored in a file exactly as it is in memory. The advantage of this data representation is that data precision and I/O performance are not lost in type conversions with a purely homogeneous environment. The disadvantage is the loss of transparent interoperability within a heterogeneous MPI environment.==

~~“internal”   This data representation can be used for I/O operations in a homogeneous or heterogeneous environment; the implementation will perform type conversions if necessary. The implementation is free to store data in any format of its choice,~~

~~with the restriction that it will maintain constant extents for all predefined datatypes in any one file.~~

~~The environment in which the resulting file can be reused is implementation-defined and must be documented by the implementation.~~

==“internal”   This data representation can be used for I/O operations in a homogeneous or heterogeneous environment; the implementation will perform type conversions if necessary. The implementation is free to store data in any format of its choice, with the restriction that it will maintain constant extents for all predefined datatypes in any one file. The environment in which the resulting file can be reused is implementation-defined and must be documented by the implementation.==

~~“external32”   This data representation states that read and write operations convert all data from and to the “external32” representation defined in Section [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , page [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] . The data conversion rules for communication also apply to these conversions (see Section 3.3.2, page 25-27, of the MPI-1 document). The data on the storage medium is always in this canonical representation, and the data in memory~~

~~is always in the local process’s native representation.~~

~~This data representation has several advantages. First, all processes reading the file in a heterogeneous MPI environment will automatically have the data converted to their respective native representations.~~

~~Second, the file can be exported from one MPI environment and imported into any other MPI environment with the guarantee that the second environment will be able to read all the data in the file.~~

==“external32”   This data representation states that read and write operations convert all data from and to the “external32” representation defined in Section [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , page [[versions/v30/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] . The data conversion rules for communication also apply to these conversions (see Section [[versions/v30/sections/pt2pt#Data Conversion|Data Conversion]] , page [[versions/v30/sections/pt2pt#Data Conversion|Data Conversion]] ). The data on the storage medium is always in this canonical representation, and the data in memory is always in the local process’s native representation.==

==This data representation has several advantages. First, all processes reading the file in a heterogeneous MPI environment will automatically have the data converted to their respective native representations. Second, the file can be exported from one MPI environment and imported into any other MPI environment with the guarantee that the second environment will be able to read all the data in the file.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

At the most basic level, file interoperability is the ability to read the information previously written to a file — not just the bits of data, but the actual information the bits represent. MPI guarantees full interoperability within a single MPI environment, and supports increased interoperability outside that environment through the external data representation ~~(Section [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , page~~ ==(== [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] ) as well as the data conversion functions ~~(Section [[versions/v31/sections/io#User-Defined Data Representations|User-Defined Data Representations]] , page~~ ==(== [[versions/v31/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ).

Interoperability within a single MPI environment (which could be considered “operability”) ensures that file data written by one MPI process can be read by any other MPI process, subject to the consistency constraints (see ~~Section [[versions/v31/sections/io#File Consistency|File Consistency]] , page~~ [[versions/v31/sections/io#File Consistency|File Consistency]] ), provided that it would have been possible to start the two processes simultaneously and have them reside in a single `MPI_COMM_WORLD`. Furthermore, both processes must see the same data values at every absolute byte offset in the file for which data was written.

~~MPI supports multiple data representations: “native,” “internal,” and “external32.” An implementation may support additional data representations. MPI also supports user-defined data representations (see Section [[versions/v31/sections/io#User-Defined Data Representations|User-Defined Data Representations]] , page [[versions/v31/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ).~~

~~The~~

~~“native” and “internal” data representations are implementation dependent, while the~~

~~“external32” representation is common to all MPI implementations and facilitates file interoperability. The data representation is specified in the *datarep* argument to `MPI_FILE_SET_VIEW`.~~

==MPI supports multiple data representations: “native,” “internal,” and “external32.” An implementation may support additional data representations. MPI also supports user-defined data representations (see [[versions/v31/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ). The “native” and “internal” data representations are implementation dependent, while the “external32” representation is common to all MPI implementations and facilitates file interoperability. The data representation is specified in the `datarep` argument to [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] .==

“external32” This data representation states that read and write operations convert all data from and to the “external32” representation defined in ~~Section [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , page~~ [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] . The data conversion rules for communication also apply to these conversions (see ~~Section [[versions/v31/sections/pt2pt#Data Conversion|Data Conversion]] , page~~ [[versions/v31/sections/pt2pt#Data Conversion|Data Conversion]] ). The data on the storage medium is always in this canonical representation, and the data in memory is always in the local process’s native representation.

### MPI-3.1 → MPI-4.0  (8 changed paragraphs)

At the most basic level, file interoperability is the ability to read the information previously written to a ~~file — not~~ ==file—not== just the bits of data, but the actual information the bits represent. MPI guarantees full interoperability within a single MPI environment, and supports increased interoperability outside that environment through the external data representation ( [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== ) as well as the data conversion functions ( [[versions/v40/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ).

MPI supports multiple data representations: ~~“native,” “internal,”~~ ==`native`, `internal`,== and ~~“external32.”~~ ==`external32`.== An implementation may support additional data representations. MPI also supports user-defined data representations (see [[versions/v40/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ). The ~~“native”~~ ==`native`== and ~~“internal”~~ ==`internal`== data representations are implementation dependent, while the ~~“external32”~~ ==`external32`== representation is common to all MPI implementations and facilitates file interoperability. The data representation is specified in the `datarep` argument to [[versions/v40/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] .

~~“native”~~ ==`native`== Data in this representation is stored in a file exactly as it is in memory. The advantage of this data representation is that data precision and I/O performance are not lost in type conversions with a purely homogeneous environment. The disadvantage is the loss of transparent interoperability within a heterogeneous MPI environment.

> This data representation should only be used in a homogeneous MPI environment, or when the MPI application is capable of performing the ~~data type~~ ==datatype== conversions itself.

~~“internal”~~ ==`internal`== This data representation can be used for I/O operations in a homogeneous or heterogeneous environment; the implementation will perform type conversions if necessary. The implementation is free to store data in any format of its choice, with the restriction that it will maintain constant extents for all predefined datatypes in any one file. The environment in which the resulting file can be reused is implementation-defined and must be documented by the implementation.

> Since ~~“external32”~~ ==`external32`== is a superset of the functionality provided by ~~“internal,”~~ ==`internal`,== an implementation may choose to implement ~~“internal”~~ ==`internal`== as ~~“external32.”~~ ==`external32`.==

~~“external32”~~ ==`external32`== This data representation states that read and write operations convert all data from and to the ~~“external32”~~ ==`external32`== representation defined in [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== . The data conversion rules for communication also apply to these conversions (see [[versions/v40/sections/pt2pt#Data Conversion|Data Conversion]] ). The data on the storage medium is always in this canonical representation, and the data in memory is always in the local process’s native representation.

The disadvantage of this data representation is that data precision and I/O performance may be lost in ~~data type~~ ==datatype== conversions.

> When implementing read and write operations on top of MPI message-passing, the message data should be converted to and from the ~~“external32”~~ ==`external32`== representation in the client, and sent as type `MPI_BYTE`. This will avoid possible double ~~data type~~ ==datatype== conversions and the associated further loss of precision and performance.

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

~~`native`~~ ==`native`:== Data in this representation is stored in a file exactly as it is in memory. The advantage of this data representation is that data precision and I/O performance are not lost in type conversions with a purely homogeneous environment. The disadvantage is the loss of transparent interoperability within a heterogeneous MPI environment.

~~`internal`~~ ==`internal`:== This data representation can be used for I/O operations in a homogeneous or heterogeneous environment; the implementation will perform type conversions if necessary. The implementation is free to store data in any format of its choice, with the restriction that it will maintain constant extents for all predefined datatypes in any one file. The environment in which the resulting file can be reused is implementation-defined and must be documented by the implementation.

~~`external32`~~ ==`external32`:== This data representation states that read and write operations convert all data from and to the `external32` representation defined in [[versions/v41/sections/io#External Data Representation: external32|External Data Representation: external32]] . The data conversion rules for communication also apply to these conversions (see [[versions/v41/sections/pt2pt#Data Conversion|Data Conversion]] ). The data on the storage medium is always in this canonical representation, and the data in memory is always in the local process’s native representation.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#File Interoperability]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#File Interoperability]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#File Interoperability]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#File Interoperability]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#File Interoperability]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#File Interoperability]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#File Interoperability]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#File Interoperability]]

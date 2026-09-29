---
title: "Matching Data Representations"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Matching Data Representations

Chapter **io** · in [[versions/v20/sections/io#Matching Data Representations|MPI-2.0]], [[versions/v21/sections/io#Matching Data Representations|MPI-2.1]], [[versions/v22/sections/io#Matching Data Representations|MPI-2.2]], [[versions/v30/sections/io#Matching Data Representations|MPI-3.0]], [[versions/v31/sections/io#Matching Data Representations|MPI-3.1]], [[versions/v40/sections/io#Matching Data Representations|MPI-4.0]], [[versions/v41/sections/io#Matching Data Representations|MPI-4.1]], [[versions/v50/sections/io#Matching Data Representations|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~Compatibility can be obtained when “external32” representation is used, although precision may be lost and the performance may be less than when “native” representation is used.~~

~~Compatibility is guaranteed using "external32" provided at least one of the following conditions is met.~~

==Compatibility can be obtained when “external32” representation is used, although precision may be lost and the performance may be less than when “native” representation is used. Compatibility is guaranteed using “external32” provided at least one of the following conditions is met.==

~~- In the case of Fortran 90 programs,~~

~~  the programs participating in the data accesses obtain compatible datatypes using MPI routines that specify precision and/or range (Section [[f90-types]] , page [[f90-types]] ).~~

==- In the case of Fortran 90 programs, the programs participating in the data accesses obtain compatible datatypes using MPI routines that specify precision and/or range (Section [[f90-types]] , page [[f90-types]] ).==

~~User-defined data representations may be used to provide~~

~~an implementation compatiblity with another implementation’s “native” or “internal” representation.~~

==User-defined data representations may be used to provide an implementation compatibility with another implementation’s “native” or “internal” representation.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

- The data access routines directly use types enumerated in ~~Section [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , page~~ [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , that are supported by all implementations participating in the I/O. The predefined type used to write a data item must also be used to read a data item.

- In the case of Fortran 90 programs, the programs participating in the data accesses obtain compatible datatypes using MPI routines that specify precision and/or range ~~(Section [[f90-types]] , page~~ ==(== [[f90-types]] ).

> ~~Section~~ [[f90-types]] ~~, page [[f90-types]] ,~~ defines routines that support the use of matching datatypes in heterogeneous environments and contains examples illustrating their use.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

Compatibility can be obtained when ~~“external32”~~ ==`external32`== representation is used, although precision may be lost and the performance may be less than when ~~“native”~~ ==`native`== representation is used. Compatibility is guaranteed using ~~“external32”~~ ==`external32`== provided at least one of the following conditions is met.

- The data access routines directly use types enumerated in [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== , that are supported by all implementations participating in the I/O. The predefined type used to write a data item must also be used to read a data item.

User-defined data representations may be used to provide an implementation compatibility with another implementation’s ~~“native”~~ ==`native`== or ~~“internal”~~ ==`internal`== representation.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Matching Data Representations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Matching Data Representations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Matching Data Representations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Matching Data Representations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Matching Data Representations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Matching Data Representations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Matching Data Representations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Matching Data Representations]]

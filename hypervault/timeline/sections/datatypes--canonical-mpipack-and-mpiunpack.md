---
title: "Canonical MPI_PACK and MPI_UNPACK"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Canonical MPI_PACK and MPI_UNPACK

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK|MPI-2.1]], [[versions/v22/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK|MPI-2.2]], [[versions/v30/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK|MPI-3.0]], [[versions/v31/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK|MPI-3.1]], [[versions/v40/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK|MPI-4.0]], [[versions/v41/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK|MPI-4.1]], [[versions/v50/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

~~MPI_BYTE~~ ==`MPI_BYTE`== should be used to send and receive data that is packed using [[versions/v22/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] .

> [[versions/v22/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] specifies that there is no header on the message and further specifies the exact format of the data. Since [[versions/v22/API/MPI_PACK|MPI_PACK]] may (and is allowed to) use a header, the datatype ~~MPI_PACKED~~ ==`MPI_PACKED`== cannot be used for data packed with [[versions/v22/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] .

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~currently~~

~~the only valid value of the `datarep` argument is “external32.”~~

==currently the only valid value of the `datarep` argument is “external32.”==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~These functions read/write data to/from the buffer in the “external32” data format specified in Section [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , and calculate the size needed for packing. Their first arguments specify the data format, for future extensibility, but~~

~~currently the only valid value of the `datarep` argument is “external32.”~~

==These functions read/write data to/from the buffer in the “external32” data format specified in Section [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] , and calculate the size needed for packing. Their first arguments specify the data format, for future extensibility, but currently the only valid value of the `datarep` argument is “external32.”==

~~The buffer will contain exactly the packed data, without headers.~~

~~`MPI_BYTE` should be used to send and receive data that is packed using [[versions/v31/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] .~~

==The buffer will contain exactly the packed data, without headers. `MPI_BYTE` should be used to send and receive data that is packed using [[versions/v31/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] .==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

These functions read/write data to/from the buffer in the ~~“external32”~~ ==`external32`== data format specified in Section [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== , and calculate the size needed for packing. Their first arguments specify the data format, for future extensibility, but currently the only valid value of the `datarep` argument is ~~“external32.”~~ ==`external32`.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

These ~~functions~~ ==procedures== read/write data to/from the buffer in the `external32` data format specified in Section [[versions/v41/sections/io#External Data Representation: external32|External Data Representation: external32]] , and calculate the size needed for packing. Their first arguments specify the data format, for future extensibility, but currently the only valid value of the `datarep` argument is `external32`.

> These ~~functions~~ ==procedures== could be used, for example, to send typed data in a portable format from one MPI implementation to another.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Canonical MPI_PACK and MPI_UNPACK]]

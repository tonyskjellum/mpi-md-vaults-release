---
title: "Type Matching"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Type Matching

Chapter **io** · in [[versions/v20/sections/io#Type Matching|MPI-2.0]], [[versions/v21/sections/io#Type Matching|MPI-2.1]], [[versions/v22/sections/io#Type Matching|MPI-2.2]], [[versions/v30/sections/io#Type Matching|MPI-3.0]], [[versions/v31/sections/io#Type Matching|MPI-3.1]], [[versions/v40/sections/io#Type Matching|MPI-4.0]], [[versions/v41/sections/io#Type Matching|MPI-4.1]], [[versions/v50/sections/io#Type Matching|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

if `etype` is ~~MPI_BYTE,~~ ==`MPI_BYTE`,== then this matches any `datatype` in a data access operation.

> In most cases, use of ~~MPI_BYTE~~ ==`MPI_BYTE`== as a wild card will defeat the file interoperability features of MPI. File interoperability can only perform automatic conversion between heterogeneous data representations when the exact datatypes accessed are explicitly specified.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The type matching rules for I/O mimic the type matching rules for communication with one exception:~~

~~if `etype` is `MPI_BYTE`, then this matches any `datatype` in a data access operation.~~

==The type matching rules for I/O mimic the type matching rules for communication with one exception: if `etype` is `MPI_BYTE`, then this matches any `datatype` in a data access operation.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The type matching rules for I/O mimic the type matching rules for communication with one exception: if `etype` is `MPI_BYTE`, then this matches any `datatype` in a data access operation.~~

~~In general, the etype of data items written must match the etype used to read the items, and for each data access operation, the current etype must also match the type declaration of the data access buffer.~~

==The type matching rules for I/O mimic the type matching rules for communication with one exception: if `etype` is `MPI_BYTE`, then this matches any `datatype` in a data access operation. In general, the etype of data items written must match the etype used to read the items, and for each data access operation, the current etype must also match the type declaration of the data access buffer.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Type Matching]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Type Matching]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Type Matching]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Type Matching]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Type Matching]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Type Matching]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Type Matching]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Type Matching]]

---
title: "Duplicating a Datatype"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Duplicating a Datatype

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Duplicating a Datatype|MPI-2.1]], [[versions/v22/sections/datatypes#Duplicating a Datatype|MPI-2.2]], [[versions/v30/sections/datatypes#Duplicating a Datatype|MPI-3.0]], [[versions/v31/sections/datatypes#Duplicating a Datatype|MPI-3.1]], [[versions/v40/sections/datatypes#Duplicating a Datatype|MPI-4.0]], [[versions/v41/sections/datatypes#Duplicating a Datatype|MPI-4.1]], [[versions/v50/sections/datatypes#Duplicating a Datatype|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~a type constructor~~

~~which duplicates the existing `type` with associated key values.~~

~~For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new datatype. Returns in `newtype` a new datatype with exactly the same properties as `type` and any copied cached~~

~~information, see Section [[versions/v30/sections/context#Datatypes|Datatypes]] on page [[versions/v30/sections/context#Datatypes|Datatypes]] .~~

~~The new datatype has identical upper bound and lower bound and yields the same net result when fully decoded with the functions in Section [[versions/v30/sections/datatypes#Decoding a Datatype|Decoding a Datatype]] . The~~

~~`newtype` has the same committed state as the old `type`.~~

==a type constructor which duplicates the existing `oldtype` with associated key values. For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new datatype. Returns in `newtype` a new datatype with exactly the same properties as `oldtype` and any copied cached==

==information, see Section [[versions/v30/sections/context#Datatypes|Datatypes]] on page [[versions/v30/sections/context#Datatypes|Datatypes]] . The new datatype has identical upper bound and lower bound and yields the same net result when fully decoded with the functions in Section [[versions/v30/sections/datatypes#Decoding a Datatype|Decoding a Datatype]] . The `newtype` has the same committed state as the old `oldtype`.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~`MPI_TYPE_DUP` is~~

~~a type constructor which duplicates the existing `oldtype` with associated key values. For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new datatype. Returns in `newtype` a new datatype with exactly the same properties as `oldtype` and any copied cached~~

~~information, see Section [[versions/v31/sections/context#Datatypes|Datatypes]] on page [[versions/v31/sections/context#Datatypes|Datatypes]] . The new datatype has identical upper bound and lower bound and yields the same net result when fully decoded with the functions in Section [[versions/v31/sections/datatypes#Decoding a Datatype|Decoding a Datatype]] . The `newtype` has the same committed state as the old `oldtype`.~~

==[[versions/v31/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] is a type constructor which duplicates the existing `oldtype` with associated key values. For each key value, the respective copy callback function determines the attribute value associated with this key in the new communicator; one particular action that a copy callback may take is to delete the attribute from the new datatype. Returns in `newtype` a new datatype with exactly the same properties as `oldtype` and any copied cached information, see [[versions/v31/sections/context#Datatypes|Datatypes]] . The new datatype has identical upper bound and lower bound and yields the same net result when fully decoded with the functions in Section [[versions/v31/sections/datatypes#Decoding a Datatype|Decoding a Datatype]] . The `newtype` has the same committed state as the old `oldtype`.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

[[versions/v41/API/MPI_TYPE_DUP|MPI_TYPE_DUP]] is a type constructor ~~which~~ ==that== duplicates the existing `oldtype` with associated key values. For each key value, the respective copy callback function determines the attribute value associated with this key in the new ~~communicator;~~ ==datatype;== one particular action that a copy callback may take is to delete the attribute from the new datatype. Returns in `newtype` a new datatype with exactly the same properties as `oldtype` and any copied cached information, see [[versions/v41/sections/context#Datatypes|Datatypes]] . The new datatype has identical upper bound and lower bound and yields the same net result when fully decoded with the ~~functions~~ ==procedures== in Section [[versions/v41/sections/datatypes#Decoding a Datatype|Decoding a Datatype]] . The `newtype` has the same committed state as the old `oldtype`.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Duplicating a Datatype]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Duplicating a Datatype]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Duplicating a Datatype]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Duplicating a Datatype]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Duplicating a Datatype]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Duplicating a Datatype]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Duplicating a Datatype]]

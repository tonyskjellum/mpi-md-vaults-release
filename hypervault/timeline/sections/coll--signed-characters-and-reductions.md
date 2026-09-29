---
title: "Signed Characters and Reductions"
chapter: coll
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Signed Characters and Reductions

Chapter **coll** · in [[versions/v21/sections/coll#Signed Characters and Reductions|MPI-2.1]], [[versions/v22/sections/coll#Signed Characters and Reductions|MPI-2.2]], [[versions/v30/sections/coll#Signed Characters and Reductions|MPI-3.0]], [[versions/v31/sections/coll#Signed Characters and Reductions|MPI-3.1]], [[versions/v40/sections/coll#Signed Characters and Reductions|MPI-4.0]], [[versions/v41/sections/coll#Signed Characters and Reductions|MPI-4.1]], [[versions/v50/sections/coll#Signed Characters and Reductions|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The types `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` can be used in reduction operations. ~~`MPI_CHAR`~~ ==`MPI_CHAR`, `MPI_WCHAR`, and `MPI_CHARACTER`== (which ~~represents~~ ==represent== printable characters) cannot be used in reduction operations.

In a heterogeneous environment, ~~`MPI_CHAR`~~ ==`MPI_CHAR`, `MPI_WCHAR`,== and ~~`MPI_WCHAR`~~ ==`MPI_CHARACTER`== will be translated so as to preserve the printable character, whereas `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` will be translated so as to preserve the integer value.

> The types ~~`MPI_CHAR`~~ ==`MPI_CHAR`, `MPI_WCHAR`,== and `MPI_CHARACTER` are intended for characters, and so will be translated to preserve the printable representation, rather than the integer value, if sent between machines with different character codes. The types `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` should be used in C if the integer value should be preserved.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The types `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` can be used in reduction operations. `MPI_CHAR`, `MPI_WCHAR`, and `MPI_CHARACTER` (which represent printable characters) cannot be used in reduction operations.~~

~~In a heterogeneous environment, `MPI_CHAR`, `MPI_WCHAR`, and `MPI_CHARACTER` will be translated so as to preserve the printable character, whereas `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` will be translated so as to preserve the integer value.~~

==The types `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` can be used in reduction operations. `MPI_CHAR`, `MPI_WCHAR`, and `MPI_CHARACTER` (which represent printable characters) cannot be used in reduction operations. In a heterogeneous environment, `MPI_CHAR`, `MPI_WCHAR`, and `MPI_CHARACTER` will be translated so as to preserve the printable character, whereas `MPI_SIGNED_CHAR` and `MPI_UNSIGNED_CHAR` will be translated so as to preserve the integer value.==

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Signed Characters and Reductions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Signed Characters and Reductions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Signed Characters and Reductions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Signed Characters and Reductions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Signed Characters and Reductions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Signed Characters and Reductions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Signed Characters and Reductions]]

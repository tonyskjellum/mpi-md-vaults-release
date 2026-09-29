---
title: "Hindexed"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/datatypes]
---

# Hindexed

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Hindexed|MPI-2.1]], [[versions/v22/sections/datatypes#Hindexed|MPI-2.2]], [[versions/v30/sections/datatypes#Hindexed|MPI-3.0]], [[versions/v31/sections/datatypes#Hindexed|MPI-3.1]], [[versions/v40/sections/datatypes#Hindexed|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~The function~~

~~[[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]]~~

~~is identical to [[versions/v30/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] , except that block displacements in `array_of_displacements` are specified in bytes, rather than in multiples of the `oldtype` extent.~~

==The function [[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] is identical to [[versions/v30/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] , except that block displacements in `array_of_displacements` are specified in bytes, rather than in multiples of the `oldtype` extent.==

~~This function replaces [[versions/v22/API/MPI_TYPE_HINDEXED|MPI_TYPE_HINDEXED]] , whose use is deprecated. See also Chapter [[versions/v30/sections/deprecated#Deprecated Functions|Deprecated Functions]] .~~

with extent $`ex`$. Let `B` be the ~~`array_of_blocklength`~~ ==`array_of_blocklengths`== argument and `D` be the

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~with extent $`ex`$. Let `B` be the `array_of_blocklengths` argument and `D` be the~~

~~`array_of_displacements` argument. The newly created datatype has a type map with $`n \cdot \sum_{i=0}^{\textsf{count}-1} \texttt{B[i]}`$ entries: ``` math \{ (type_0, disp_0 + \texttt{D[0]}  ) , ... , (type_{n-1} , disp_{n-1} + \texttt{D[0]} ) , ... , ```~~

==with extent $`ex`$. Let `B` be the `array_of_blocklengths` argument and `D` be the `array_of_displacements` argument. The newly created datatype has a type map with $`n \cdot \sum_{i=0}^{\texttt{count}-1} \texttt{B[i]}`$ entries: ``` math \{ (type_0, disp_0 + \texttt{D[0]}  ) , ... , (type_{n-1} , disp_{n-1} + \texttt{D[0]} ) , ... , ```==

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Hindexed]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Hindexed]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Hindexed]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Hindexed]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Hindexed]]

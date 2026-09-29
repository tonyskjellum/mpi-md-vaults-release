---
title: "Cartesian Convenience Function: MPI_DIMS_CREATE"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Cartesian Convenience Function: MPI_DIMS_CREATE

Chapter **topol** · in [[versions/v13/sections/topol#Cartesian Convenience Function: `MPI_DIMS_CREATE`|MPI-1.3]], [[versions/v21/sections/topol#Cartesian Convenience Function: `MPI_DIMS_CREATE`|MPI-2.1]], [[versions/v22/sections/topol#Cartesian Convenience Function: `MPI_DIMS_CREATE`|MPI-2.2]], [[versions/v30/sections/topol#Cartesian Convenience Function: `MPI_DIMS_CREATE`|MPI-3.0]], [[versions/v31/sections/topol#Cartesian Convenience Function: MPI_DIMS_CREATE|MPI-3.1]], [[versions/v40/sections/topol#Cartesian Convenience Function: MPI_DIMS_CREATE|MPI-4.0]], [[versions/v41/sections/topol#Cartesian Convenience Function: MPI_DIMS_CREATE|MPI-4.1]], [[versions/v50/sections/topol#Cartesian Convenience Function: MPI_DIMS_CREATE|MPI-5.0]]

Heading by release: MPI-1.3: “Cartesian Convenience Function: `MPI_DIMS_CREATE`”; MPI-2.1: “Cartesian Convenience Function: `MPI_DIMS_CREATE`”; MPI-2.2: “Cartesian Convenience Function: `MPI_DIMS_CREATE`”; MPI-3.0: “Cartesian Convenience Function: `MPI_DIMS_CREATE`”; MPI-3.1: “Cartesian Convenience Function: MPI_DIMS_CREATE”; MPI-4.0: “Cartesian Convenience Function: MPI_DIMS_CREATE”; MPI-4.1: “Cartesian Convenience Function: MPI_DIMS_CREATE”; MPI-5.0: “Cartesian Convenience Function: MPI_DIMS_CREATE”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

For ~~cartesian~~ ==Cartesian== topologies, the function `MPI_DIMS_CREATE` helps the user select a balanced distribution of processes per coordinate direction, depending on the number of processes in the group to be balanced and optional constraints that can be specified by the user. One use is to partition all the processes (the size of MPI_COMM_WORLD’s group) into an $`n`$-dimensional topology.

The entries in the array `dims` are set to describe a ~~cartesian~~ ==Cartesian== grid with `ndims` dimensions and a total of `nnodes` nodes. The dimensions are set to be as close to each other as possible, using an appropriate divisibility algorithm. The caller may further constrain the operation of this routine by specifying elements of array `dims`. If `dims[i]` is set to a positive number, the routine will not modify the number of nodes in dimension `i`; only those entries where `dims[i] = 0` are modified by the call.

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

For Cartesian topologies, the function `MPI_DIMS_CREATE` helps the user select a balanced distribution of processes per coordinate direction, depending on the number of processes in the group to be balanced and optional constraints that can be specified by the user. One use is to partition all the processes (the size of ~~MPI_COMM_WORLD’s~~ ==`MPI_COMM_WORLD`’s== group) into an $`n`$-dimensional topology.

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

For Cartesian topologies, the function ~~`MPI_DIMS_CREATE`~~ ==[[versions/v31/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]]== helps the user select a balanced distribution of processes per coordinate direction, depending on the number of processes in the group to be balanced and optional constraints that can be specified by the user. One use is to partition all the processes (the size of `MPI_COMM_WORLD`’s group) into an $`n`$-dimensional topology.

Negative input values of `dims[i]` are erroneous. An error will occur if `nnodes` is not a multiple of ~~$`\displaystyle~~ ==``` math== \prod_{i, dims[i]\neq 0} ~~dims[i]`$.~~ ==dims[i]. ```==

For `dims[i]` set by the call, `dims[i]` will be ordered in non-increasing order. Array `dims` is suitable for use as input to routine ~~`MPI_CART_CREATE`.~~ ==[[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] .== [[versions/v31/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] is local.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The entries in the array `dims` are set to describe a Cartesian grid with `ndims` dimensions and a total of `nnodes` nodes. The dimensions are set to be as close to each other as possible, using an appropriate divisibility algorithm. The caller may further constrain the operation of this routine by specifying elements of array `dims`. If `dims[i]` is set to a positive number, the routine will not modify the number of nodes in dimension `i`; only those entries where ~~`dims[i] =~~ ==`dims[i]``=== 0` are modified by the call.

Negative input values of `dims[i]` are erroneous. An error will occur if `nnodes` is not a multiple of ``` math \prod_{i, ~~dims[i]\neq~~ ==\textsf{dims}[i]\neq== 0} ~~dims[i].~~ ==\texttt{dims[$i$]}.== ```

For `dims[i]` set by the call, `dims[i]` will be ordered in ~~non-increasing~~ ==nonincreasing== order. Array `dims` is suitable for use as input to routine [[versions/v40/API/MPI_CART_CREATE|MPI_CART_CREATE]] . [[versions/v40/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] is local. ==If `ndims` is zero and `nnodes` is one, [[versions/v40/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] returns `MPI_SUCCESS`.==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

For Cartesian topologies, the function [[versions/v41/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] helps the user select a balanced distribution of ==MPI== processes per coordinate direction, depending on the number of ==MPI== processes in the group to be balanced and optional constraints that can be specified by the user. ~~One use is to partition all the processes (the size of `MPI_COMM_WORLD`’s group) into an $`n`$-dimensional topology.~~

Negative input values of `dims[i]` are erroneous. An error will occur if `nnodes` is not a multiple of ``` math \prod_{i, ~~\textsf{dims}[i]\neq~~ ==\textsf{ {}dims}[i]\neq== 0} \texttt{dims[$i$]}. ```

== The use of the array argument `dims` in [[versions/v41/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] .==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

| | | | ~~|:------------|:------------------------------------|:---------------|~~ ==|:------------|:---------------------------------------|:---------------|== | `dims` | function call | `dims` | | before call | | on return | | (0,0) | [[versions/v50/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] ==`(6, 2, dims)`== | (3,2) | | (0,0) | [[versions/v50/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] ==`(7, 2, dims)`== | (7,1) | | (0,3,0) | [[versions/v50/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] ==`(6, 3, dims)`== | (2,3,1) | | (0,3,0) | [[versions/v50/API/MPI_DIMS_CREATE|MPI_DIMS_CREATE]] ==`(7, 3, dims)`== | erroneous call |

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#Cartesian Convenience Function: `MPI_DIMS_CREATE`]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#Cartesian Convenience Function: `MPI_DIMS_CREATE`]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Cartesian Convenience Function: `MPI_DIMS_CREATE`]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Cartesian Convenience Function: `MPI_DIMS_CREATE`]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Cartesian Convenience Function: MPI_DIMS_CREATE]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Cartesian Convenience Function: MPI_DIMS_CREATE]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Cartesian Convenience Function: MPI_DIMS_CREATE]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Cartesian Convenience Function: MPI_DIMS_CREATE]]

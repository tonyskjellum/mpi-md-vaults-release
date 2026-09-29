---
title: "Cartesian Constructor"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Cartesian Constructor

Chapter **topol** · in [[versions/v13/sections/topol#Cartesian Constructor|MPI-1.3]], [[versions/v21/sections/topol#Cartesian Constructor|MPI-2.1]], [[versions/v22/sections/topol#Cartesian Constructor|MPI-2.2]], [[versions/v30/sections/topol#Cartesian Constructor|MPI-3.0]], [[versions/v31/sections/topol#Cartesian Constructor|MPI-3.1]], [[versions/v40/sections/topol#Cartesian Constructor|MPI-4.0]], [[versions/v41/sections/topol#Cartesian Constructor|MPI-4.1]], [[versions/v50/sections/topol#Cartesian Constructor|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~[[versions/v21/API/MPI_CART_CREATE|MPI_CART_CREATE]] returns a handle to a new communicator to which the cartesian topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes (possibly so as to choose a good embedding of the virtual topology onto the physical machine). If the total size of the cartesian grid is smaller than the size of the group of `comm`, then some processes are returned MPI_COMM_NULL, in analogy to [[versions/v21/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] . The call is erroneous if it specifies a grid that is larger than the group size.~~

==[[versions/v21/API/MPI_CART_CREATE|MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes (possibly so as to choose a good embedding of the virtual topology onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of `comm`, then some processes are returned MPI_COMM_NULL, in analogy to [[versions/v21/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .==

==If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

[[versions/v22/API/MPI_CART_CREATE|MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes (possibly so as to choose a good embedding of the virtual topology onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of `comm`, then some processes are returned ~~MPI_COMM_NULL,~~ ==`MPI_COMM_NULL`,== in analogy to [[versions/v22/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

[[versions/v30/API/MPI_CART_CREATE|MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes (possibly so as to choose a good embedding of the virtual topology onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of ~~`comm`,~~ ==`comm_old`,== then some processes are returned `MPI_COMM_NULL`, in analogy to [[versions/v30/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~[[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes (possibly so as to choose a good embedding of the virtual topology onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of `comm_old`, then some processes are returned `MPI_COMM_NULL`, in analogy to [[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .~~

~~If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.~~

==[[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If `reorder = false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes (possibly so as to choose a good embedding of the virtual topology onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of `comm_old`, then some processes are returned `MPI_COMM_NULL`, in analogy to [[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] . If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

[[versions/v40/API/MPI_CART_CREATE|MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If ~~`reorder =~~ ==`reorder``=== false` then the rank of each process in the new group is identical to its rank in the old group. Otherwise, the function may reorder the processes (possibly so as to choose a good embedding of the virtual topology onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of `comm_old`, then some processes are returned `MPI_COMM_NULL`, in analogy to [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] . If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative. ==[[versions/v40/API/MPI_CART_CREATE|MPI_CART_CREATE]] will associate information representing a Cartesian topology with the specified number of dimensions, numbers of MPI processes in each coordinate direction, and periodicity with the new communicator.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

[[versions/v41/API/MPI_CART_CREATE|MPI_CART_CREATE]] returns a handle to a new communicator to which the Cartesian topology information is attached. If `reorder``= false` then the rank of each ==MPI== process in the ==group of the== new ~~group~~ ==communicator== is identical to its rank in the ==group of the== old ~~group. Otherwise,~~ ==communicator. If `reorder``= true` then== the ~~function~~ ==procedure== may reorder the ==ranks of the MPI== processes (possibly so as to choose a good embedding of the ~~virtual topology~~ ==*virtual topology*== onto the physical machine). If the total size of the Cartesian grid is smaller than the size of the group of `comm_old`, then some ==MPI== processes ~~are returned~~ ==return== `MPI_COMM_NULL`, in analogy to [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] . If `ndims` is zero then a zero-dimensional Cartesian topology is created. The call is erroneous if it specifies a grid that is larger than the group size or if `ndims` is negative. [[versions/v41/API/MPI_CART_CREATE|MPI_CART_CREATE]] will associate information representing a Cartesian topology with the specified number of dimensions, numbers of MPI processes in each coordinate direction, and periodicity with the new communicator.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#Cartesian Constructor]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#Cartesian Constructor]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Cartesian Constructor]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Cartesian Constructor]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Cartesian Constructor]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Cartesian Constructor]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Cartesian Constructor]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Cartesian Constructor]]

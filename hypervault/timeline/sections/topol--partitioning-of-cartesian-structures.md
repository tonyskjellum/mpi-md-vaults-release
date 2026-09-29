---
title: "Partitioning of Cartesian Structures"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Partitioning of Cartesian Structures

Chapter **topol** · in [[versions/v13/sections/topol#Partitioning of Cartesian structures|MPI-1.3]], [[versions/v21/sections/topol#Partitioning of Cartesian structures|MPI-2.1]], [[versions/v22/sections/topol#Partitioning of Cartesian structures|MPI-2.2]], [[versions/v30/sections/topol#Partitioning of Cartesian Structures|MPI-3.0]], [[versions/v31/sections/topol#Partitioning of Cartesian Structures|MPI-3.1]], [[versions/v40/sections/topol#Partitioning of Cartesian Structures|MPI-4.0]], [[versions/v41/sections/topol#Partitioning of Cartesian Structures|MPI-4.1]], [[versions/v50/sections/topol#Partitioning of Cartesian Structures|MPI-5.0]]

Heading by release: MPI-1.3: “Partitioning of Cartesian structures”; MPI-2.1: “Partitioning of Cartesian structures”; MPI-2.2: “Partitioning of Cartesian structures”; MPI-3.0: “Partitioning of Cartesian Structures”; MPI-3.1: “Partitioning of Cartesian Structures”; MPI-4.0: “Partitioning of Cartesian Structures”; MPI-4.1: “Partitioning of Cartesian Structures”; MPI-5.0: “Partitioning of Cartesian Structures”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~If a cartesian topology has been created with `MPI_CART_CREATE`, the function `MPI_CART_SUB` can be used to partition the communicator group into subgroups that form lower-dimensional cartesian subgrids, and to build for each subgroup a communicator with the associated subgrid cartesian topology. (This function is closely related to [[versions/v21/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .)~~

==If a Cartesian topology has been created with `MPI_CART_CREATE`, the function `MPI_CART_SUB` can be used to partition the communicator group into subgroups that form lower-dimensional Cartesian subgrids, and to build for each subgroup a communicator with the associated subgrid Cartesian topology.==

==If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology.==

==(This function is closely related to [[versions/v21/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .)==

will create three communicators each with eight processes in a $`2 \times 4`$ ~~cartesian~~ ==Cartesian== topology. If `remain_dims = (false, false, true)` then the call to `MPI_CART_SUB(comm, remain_dims, comm_new)` will create six non-overlapping communicators, each with four processes, in a one-dimensional ~~cartesian~~ ==Cartesian== topology.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~If a Cartesian topology has been created with `MPI_CART_CREATE`, the function `MPI_CART_SUB` can be used to partition the communicator group into subgroups that form lower-dimensional Cartesian subgrids, and to build for each subgroup a communicator with the associated subgrid Cartesian topology.~~

~~If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology.~~

~~(This function is closely related to [[versions/v30/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .)~~

==If a Cartesian topology has been created with `MPI_CART_CREATE`, the function `MPI_CART_SUB` can be used to partition the communicator group into subgroups that form lower-dimensional Cartesian subgrids, and to build for each subgroup a communicator with the associated subgrid Cartesian topology. If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology. (This function is closely related to [[versions/v30/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .)==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

If a Cartesian topology has been created with ~~`MPI_CART_CREATE`,~~ ==[[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] ,== the function ~~`MPI_CART_SUB`~~ ==[[versions/v31/API/MPI_CART_SUB|MPI_CART_SUB]]== can be used to partition the communicator group into subgroups that form lower-dimensional Cartesian subgrids, and to build for each subgroup a communicator with the associated subgrid Cartesian topology. If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology. (This function is closely related to [[versions/v31/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .)

Assume that ~~`MPI_CART_CREATE``(...,~~ ==[[versions/v31/API/MPI_CART_CREATE|MPI_CART_CREATE]] `(`$`...`$`,== comm)` has defined a $`(2 \times 3 \times 4)`$ grid. Let `remain_dims = (true, false, true)`. Then a call ~~to,~~ ==to==

MPI_CART_SUB(comm, remain_dims, ~~comm_new),~~ ==comm_new);==

will create three communicators each with eight processes in a $`2 \times 4`$ Cartesian topology. If `remain_dims = (false, false, true)` then the call to ~~`MPI_CART_SUB(comm, remain_dims, comm_new)`~~ ==[[versions/v31/API/MPI_CART_SUB|MPI_CART_SUB]]== will create six non-overlapping communicators, each with four processes, in a one-dimensional Cartesian topology.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~If a Cartesian topology has been created with [[versions/v40/API/MPI_CART_CREATE|MPI_CART_CREATE]] , the function [[versions/v40/API/MPI_CART_SUB|MPI_CART_SUB]] can be used to partition the communicator group into subgroups that form lower-dimensional Cartesian subgrids, and to build for each subgroup a communicator with the associated subgrid Cartesian topology. If all entries in `remain_dims` are false or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology. (This function is closely related to [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .)~~

~~Assume that [[versions/v40/API/MPI_CART_CREATE|MPI_CART_CREATE]] `(`$`...`$`, comm)` has defined a $`(2 \times 3 \times 4)`$ grid. Let `remain_dims = (true, false, true)`. Then a call to~~

~~         MPI_CART_SUB(comm, remain_dims, comm_new);~~

~~will create three communicators each with eight processes in a $`2 \times 4`$ Cartesian topology. If `remain_dims = (false, false, true)` then the call to [[versions/v40/API/MPI_CART_SUB|MPI_CART_SUB]] will create six non-overlapping communicators, each with four processes, in a one-dimensional Cartesian topology.~~

==[[versions/v40/API/MPI_CART_SUB|MPI_CART_SUB]] can be used to partition the group associated with a communicator that has an associated Cartesian topology into subgroups that form lower-dimensional Cartesian subgrids, and to build for each subgroup a communicator with the associated subgrid Cartesian topology. The topologies of the new communicators describe the subgrids. The number of dimensions of the subgrids is the number of remaining dimensions, i.e., the number of `true` values in `remain_dims`. The numbers of MPI processes in each coordinate direction of the subgrids are the remaining numbers of MPI processes in each coordinate direction of the grid associated with the original communicator, i.e., the values of the original grid dimensions for which the corresponding entry in `remain_dims` is `true`. The periodicity for the remaining dimensions in the new communicator is preserved from the original communicator. If all entries in `remain_dims` are `false` or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology. (This function is closely related to [[versions/v40/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .)==

==Assume that `MPI_Cart_create(`$`...`$`, comm)` has defined a $`(2 \times 3 \times 4)`$ grid. Let `remain_dims``= (true, false, true)`. Then a call to==

==MPI_Cart_sub(comm, remain_dims, newcomm)==

==will create three communicators each with eight processes in a $`2 \times 4`$ Cartesian topology. If `remain_dims``= (false, false, true)` then the call to==

==MPI_Cart_sub(comm, remain_dims, newcomm)==

==will create six non-overlapping communicators, each with four processes, in a one-dimensional Cartesian topology.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~[[versions/v41/API/MPI_CART_SUB|MPI_CART_SUB]] can be used to partition the group associated with a communicator that has an associated Cartesian topology into subgroups that form lower-dimensional Cartesian subgrids, and to build for each subgroup a communicator with the associated subgrid Cartesian topology. The topologies of the new communicators describe the subgrids. The number of dimensions of the subgrids is the number of remaining dimensions, i.e., the number of `true` values in `remain_dims`. The numbers of MPI processes in each coordinate direction of the subgrids are the remaining numbers of MPI processes in each coordinate direction of the grid associated with the original communicator, i.e., the values of the original grid dimensions for which the corresponding entry in `remain_dims` is `true`. The periodicity for the remaining dimensions in the new communicator is preserved from the original communicator. If all entries in `remain_dims` are `false` or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology. (This function is closely related to [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .)~~

==[[versions/v41/API/MPI_CART_SUB|MPI_CART_SUB]] can be used to partition the group associated with a communicator that has an associated Cartesian topology into subgroups that form lower-dimensional Cartesian subgrids, and to create for each subgroup a communicator with the associated subgrid Cartesian topology. The topologies of the new communicators describe the subgrids. The number of dimensions of the subgrids is the number of remaining dimensions, i.e., the number of `true` values in `remain_dims`. The numbers of MPI processes in each coordinate direction of the subgrids are the remaining numbers of MPI processes in each coordinate direction of the grid associated with the original communicator, i.e., the values of the original grid dimensions for which the corresponding entry in `remain_dims` is `true`. The periodicity for the remaining dimensions in the new communicator is preserved from the original communicator. If all entries in `remain_dims` are `false` or `comm` is already associated with a zero-dimensional Cartesian topology then `newcomm` is associated with a zero-dimensional Cartesian topology. (This function is closely related to [[versions/v41/API/MPI_COMM_SPLIT|MPI_COMM_SPLIT]] .)==

==Creation of nonoverlapping Cartesian subcommunicators with [[versions/v41/API/MPI_CART_SUB|MPI_CART_SUB]] .==

MPI_Cart_sub(comm, remain_dims, ~~newcomm)~~ ==&newcomm);==

will create three communicators each with eight ==MPI== processes in a $`2 \times 4`$ Cartesian topology. If `remain_dims``= (false, false, true)` then the call to

MPI_Cart_sub(comm, remain_dims, ~~newcomm)~~ ==&newcomm);==

will create six ~~non-overlapping~~ ==nonoverlapping== communicators, each with four ==MPI== processes, in a one-dimensional Cartesian topology.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#Partitioning of Cartesian structures]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#Partitioning of Cartesian structures]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Partitioning of Cartesian structures]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Partitioning of Cartesian Structures]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Partitioning of Cartesian Structures]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Partitioning of Cartesian Structures]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Partitioning of Cartesian Structures]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Partitioning of Cartesian Structures]]

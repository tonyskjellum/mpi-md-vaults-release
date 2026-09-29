---
title: "Global Reduction Operations"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/coll]
---

# Global Reduction Operations

Chapter **coll** · in [[versions/v13/sections/coll#Global Reduction Operations|MPI-1.3]], [[versions/v21/sections/coll#Global Reduction Operations|MPI-2.1]], [[versions/v22/sections/coll#Global Reduction Operations|MPI-2.2]], [[versions/v30/sections/coll#Global Reduction Operations|MPI-3.0]], [[versions/v31/sections/coll#Global Reduction Operations|MPI-3.1]], [[versions/v40/sections/coll#Global Reduction Operations|MPI-4.0]], [[versions/v41/sections/coll#Global Reduction Operations|MPI-4.1]], [[versions/v50/sections/coll#Global Reduction Operations|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~The functions in this section perform a global reduce operation (such as sum, max, logical AND, etc.) across all the members of a group. The reduction operation can be either one of a predefined list of operations, or a user-defined operation. The global reduction functions come in several flavors: a reduce that returns the result of the reduction at one node, an all-reduce that returns this result at all nodes, and a scan (parallel prefix) operation. In addition, a reduce-scatter operation combines the functionality of a reduce and of a scatter operation.~~

==The functions in this section perform a global reduce operation (such as sum, max, logical AND, etc.) across==

==all members of a group. The reduction operation can be either one of a predefined list of operations, or a user-defined operation. The global reduction functions come in several flavors: a reduce that returns the result of the reduction==

==to one member of a group,==

==an all-reduce that returns this result==

==to all members of a group,==

==and==

==two==

==scan (parallel prefix)==

==operations.==

==In addition, a reduce-scatter operation combines the functionality of a reduce and of a scatter operation.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~The functions in this section perform a global reduce operation (such as sum, max, logical AND, etc.) across~~

==The functions in this section perform a global reduce operation==

==(for example sum, maximum, and logical and) across==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~to one member of a group,~~

~~an all-reduce that returns this result~~

~~to all members of a group,~~

~~and~~

~~two~~

~~scan (parallel prefix)~~

~~operations.~~

~~In addition, a reduce-scatter operation combines the functionality of a reduce and of a scatter operation.~~

==to one member of a group, an all-reduce that returns this result==

==to all members of a group, and==

==two scan (parallel prefix) operations. In addition, a reduce-scatter operation combines the functionality of a reduce and of a scatter operation.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The functions in this section perform a global reduce operation~~

~~(for example sum, maximum, and logical and) across~~

~~all members of a group. The reduction operation can be either one of a predefined list of operations, or a user-defined operation. The global reduction functions come in several flavors: a reduce that returns the result of the reduction~~

~~to one member of a group, an all-reduce that returns this result~~

~~to all members of a group, and~~

~~two scan (parallel prefix) operations. In addition, a reduce-scatter operation combines the functionality of a reduce and of a scatter operation.~~

==The functions in this section perform a global reduce operation (for example sum, maximum, and logical and) across all members of a group. The reduction operation can be either one of a predefined list of operations, or a user-defined operation. The global reduction functions come in several flavors: a reduce that returns the result of the reduction to one member of a group, an all-reduce that returns this result to all members of a group, and two scan (parallel prefix) operations. In addition, a reduce-scatter operation combines the functionality of a reduce and of a scatter operation.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Global Reduction Operations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Global Reduction Operations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/coll#Global Reduction Operations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/coll#Global Reduction Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Global Reduction Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Global Reduction Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Global Reduction Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/coll#Global Reduction Operations]]

---
title: "Group Constructors"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Group Constructors

Chapter **context** · in [[versions/v13/sections/context#Group Constructors|MPI-1.3]], [[versions/v21/sections/context#Group Constructors|MPI-2.1]], [[versions/v22/sections/context#Group Constructors|MPI-2.2]], [[versions/v30/sections/context#Group Constructors|MPI-3.0]], [[versions/v31/sections/context#Group Constructors|MPI-3.1]], [[versions/v40/sections/context#Group Constructors|MPI-4.0]], [[versions/v41/sections/context#Group Constructors|MPI-4.1]], [[versions/v50/sections/context#Group Constructors|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The new group can be empty, that is, equal to ~~MPI_GROUP_EMPTY.~~ ==`MPI_GROUP_EMPTY`.==

The function `MPI_GROUP_INCL` creates a group `newgroup` that consists of the `n` processes in `group` with ranks `rank[0],`$`...`$`, rank[n-1]`; the process with rank `i` in `newgroup` is the process with rank `ranks[i]` in `group`. Each of the `n` elements of `ranks` must be a valid rank in `group` and all elements must be distinct, or else the program is erroneous. If `n`$`= 0`$, then `newgroup` is ~~MPI_GROUP_EMPTY.~~ ==`MPI_GROUP_EMPTY`.== This function can, for instance, be used to reorder the elements of a group. See also `MPI_GROUP_COMPARE`.

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

union All elements of the first group (`group1`), followed by all elements of second group (`group2`) not in ~~first.~~ ==the first group.==

intersect all elements of the first group that are also in the second group, ordered as in ==the== first group.

The function `MPI_GROUP_INCL` creates a group `newgroup` that consists of the `n` processes in `group` with ranks ~~`rank[0],`$`...`$`, rank[n-1]`;~~ ==`ranks[0],`$`...`$`, ranks[n-1]`;== the process with rank `i` in `newgroup` is the process with rank `ranks[i]` in `group`. Each of the `n` elements of `ranks` must be a valid rank in `group` and all elements must be distinct, or else the program is erroneous. If `n`$`= 0`$, then `newgroup` is `MPI_GROUP_EMPTY`. This function can, for instance, be used to reorder the elements of a group. See also `MPI_GROUP_COMPARE`.

~~If `ranges` consist of the triplets ``` math (first_1 , last_1, stride_1) , ..., (first_n, last_n, stride_n) ```~~

~~then `newgroup` consists of the sequence of processes in `group` with ranks ``` math first_1 , first_1 + stride_1 , ... , first_1 + \left\lfloor \frac{last_1 - first_1}{stride_1} \right\rfloor stride_1 , ... ```~~

~~(code block removed)~~
``` math
first_n , first_n + stride_n , ... , first_n + \left\lfloor \frac{last_n -
first_n}{stride_n} \right\rfloor stride_n .
```

==If `ranges` consists of the triplets ``` math (first_1 , last_1, stride_1) , ...{...} , (first_n, last_n, stride_n) ```==

==then `newgroup` consists of the sequence of processes in `group` with ranks ``` math first_1 , first_1 + stride_1 , ...{...} , first_1 + \left\lfloor \frac{last_1 - first_1}{stride_1} \right\rfloor stride_1 , ...{...}, ```==

==(code block added)==
``` math
first_n , first_n + stride_n , ...{...} , first_n + \left\lfloor \frac{last_n -
first_n}{stride_n} \right\rfloor stride_n .
```

### MPI-3.0 → MPI-3.1  (6 changed paragraphs)

Group constructors are used to subset and superset existing groups. These constructors construct new groups from existing groups. These are local operations, and distinct groups may be defined on different processes; a process may also define a group that does not include itself. Consistent definitions are required when groups are used as arguments in communicator-building functions. MPI does not provide a mechanism to build a group from scratch, but only from other, previously defined groups. The base group, upon which all other groups are defined, is the group associated with the initial communicator `MPI_COMM_WORLD` (accessible through the function ~~`MPI_COMM_GROUP`).~~ ==[[versions/v31/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] ).==

The function ~~`MPI_GROUP_INCL`~~ ==[[versions/v31/API/MPI_GROUP_INCL|MPI_GROUP_INCL]]== creates a group `newgroup` that consists of the `n` processes in `group` with ranks `ranks[0],`$`...`$`, ranks[n-1]`; the process with rank `i` in `newgroup` is the process with rank `ranks[i]` in `group`. Each of the `n` elements of `ranks` must be a valid rank in `group` and all elements must be distinct, or else the program is erroneous. If `n`$`= 0`$, then `newgroup` is `MPI_GROUP_EMPTY`. This function can, for instance, be used to reorder the elements of a group. See also ~~`MPI_GROUP_COMPARE`.~~ ==[[versions/v31/API/MPI_GROUP_COMPARE|MPI_GROUP_COMPARE]] .==

The function ~~`MPI_GROUP_EXCL`~~ ==[[versions/v31/API/MPI_GROUP_EXCL|MPI_GROUP_EXCL]]== creates a group of processes `newgroup` that is obtained by deleting from `group` those processes with ranks `ranks[0] ,`$`...`$` ranks[n-1]`. The ordering of processes in `newgroup` is identical to the ordering in `group`. Each of the `n` elements of `ranks` must be a valid rank in `group` and all elements must be distinct; otherwise, the program is erroneous. If `n`$`= 0`$, then `newgroup` is identical to `group`.

~~If `ranges` consists of the triplets ``` math (first_1 , last_1, stride_1) , ...{...} , (first_n, last_n, stride_n) ```~~

~~then `newgroup` consists of the sequence of processes in `group` with ranks ``` math first_1 , first_1 + stride_1 , ...{...} , first_1 + \left\lfloor \frac{last_1 - first_1}{stride_1} \right\rfloor stride_1 , ...{...}, ```~~

~~(code block removed)~~
``` math
first_n , first_n + stride_n , ...{...} , first_n + \left\lfloor \frac{last_n -
first_n}{stride_n} \right\rfloor stride_n .
```

==If `ranges` consists of the triplets ``` math (first_1 , last_1, stride_1) , ... , (first_n, last_n, stride_n) ```==

==then `newgroup` consists of the sequence of processes in `group` with ranks ``` math first_1 , first_1 + stride_1 , ... , first_1 + \left\lfloor \frac{last_1 - first_1}{stride_1} \right\rfloor stride_1 , ..., ```==

==(code block added)==
``` math
first_n , first_n + stride_n , ... , first_n + \left\lfloor \frac{last_n -
first_n}{stride_n} \right\rfloor stride_n .
```

The functionality of this routine is specified to be equivalent to expanding the array of ranges to an array of the included ranks and passing the resulting array of ranks and other arguments to ~~`MPI_GROUP_INCL`.~~ ==[[versions/v31/API/MPI_GROUP_INCL|MPI_GROUP_INCL]] .== A call to ~~`MPI_GROUP_INCL`~~ ==[[versions/v31/API/MPI_GROUP_INCL|MPI_GROUP_INCL]]== is equivalent to a call to ~~`MPI_GROUP_RANGE_INCL`~~ ==[[versions/v31/API/MPI_GROUP_RANGE_INCL|MPI_GROUP_RANGE_INCL]]== with each rank `i` in `ranks` replaced by the triplet `(i,i,1)` in the argument `ranges`.

The functionality of this routine is specified to be equivalent to expanding the array of ranges to an array of the excluded ranks and passing the resulting array of ranks and other arguments to ~~`MPI_GROUP_EXCL`.~~ ==[[versions/v31/API/MPI_GROUP_EXCL|MPI_GROUP_EXCL]] .== A call to ~~`MPI_GROUP_EXCL`~~ ==[[versions/v31/API/MPI_GROUP_EXCL|MPI_GROUP_EXCL]]== is equivalent to a call to ~~`MPI_GROUP_RANGE_EXCL`~~ ==[[versions/v31/API/MPI_GROUP_RANGE_EXCL|MPI_GROUP_RANGE_EXCL]]== with each rank `i` in `ranks` replaced by the triplet `(i,i,1)` in the argument `ranges`.

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

~~Group constructors~~ ==MPI provides two approaches to constructing groups. In the first approach, MPI procedures== are ~~used~~ ==provided== to subset and superset existing groups. These constructors construct new groups from existing groups. ~~These~~ ==In the second approach, a group is created using a session handle and associated process set. This second approach is available when using the Sessions Model . With both approaches, these== are local operations, and distinct groups may be defined on different processes; a process may also define a group that does not include itself. Consistent definitions are required when groups are used as arguments in ~~communicator-building~~ ==communicator creation== functions. ==When using the World Model (Section [[versions/v40/sections/dynamic#The World Model|The World Model]] ) for== MPI ~~does not provide a mechanism to build a group from scratch, but only from other, previously defined groups. The~~ ==initialization, the== base group, upon which all other groups are defined, is the group associated with the initial communicator `MPI_COMM_WORLD` (accessible through the function [[versions/v40/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] ).

~~intersect   all elements of the first group that are also in the second group, ordered as in the first group.~~

~~difference   all elements of the first group that are not in the second group, ordered as in the first group.~~

~~Note that for these operations the order of processes in the output group is determined primarily by order in the first group (if possible) and then, if necessary, by order in the second group. Neither union nor intersection are commutative, but both are associative.~~

~~The new group can be empty, that is, equal to `MPI_GROUP_EMPTY`.~~

==intersect   All elements of the first group that are also in the second group, ordered as in the first group.==

==difference   All elements of the first group that are not in the second group, ordered as in the first group.==

==Note that for these operations the order of processes in the output group is determined primarily by order in the first group (if possible) and then, if necessary, by order in the second group. Neither union nor intersection are commutative, but both are associative. The new group can be empty, that is, equal to `MPI_GROUP_EMPTY`.==

The function [[versions/v40/API/MPI_GROUP_INCL|MPI_GROUP_INCL]] creates a group `newgroup` that consists of the `n` processes in `group` with ranks ~~`ranks[0],`$`...`$`, ranks[n-1]`;~~ ==`ranks[0]`,$`...`$, `ranks[n-1]`;== the process with rank `i` in `newgroup` is the process with rank `ranks[i]` in `group`. Each of the `n` elements of `ranks` must be a valid rank in `group` and all elements must be distinct, or else the program is erroneous. If `n`$`= 0`$, then `newgroup` is `MPI_GROUP_EMPTY`. This function can, for instance, be used to reorder the elements of a group. See also [[versions/v40/API/MPI_GROUP_COMPARE|MPI_GROUP_COMPARE]] .

The function [[versions/v40/API/MPI_GROUP_EXCL|MPI_GROUP_EXCL]] creates a group of processes `newgroup` that is obtained by deleting from `group` those processes with ranks ~~`ranks[0] ,`$`...`$` ranks[n-1]`.~~ ==`ranks[0]`,$`...`$, `ranks[n-1]`.== The ordering of processes in `newgroup` is identical to the ordering in `group`. Each of the `n` elements of `ranks` must be a valid rank in `group` and all elements must be distinct; otherwise, the program is erroneous. If `n`$`= 0`$, then `newgroup` is identical to `group`.

==![[versions/v40/API/MPI_GROUP_FROM_SESSION_PSET]]==

==The function [[versions/v40/API/MPI_GROUP_FROM_SESSION_PSET|MPI_GROUP_FROM_SESSION_PSET]] creates a group `newgroup` using the provided session handle and process set. The process set name must be one returned from an invocation of [[versions/v40/API/MPI_SESSION_GET_NTH_PSET|MPI_SESSION_GET_NTH_PSET]] using the supplied `session` handle. If the `pset_name` does not exist, `MPI_GROUP_NULL` will be returned in the `newgroup` argument. As with other group constructors, [[versions/v40/API/MPI_GROUP_FROM_SESSION_PSET|MPI_GROUP_FROM_SESSION_PSET]] is a local function. See [[versions/v40/sections/dynamic#The Sessions Model|The Sessions Model]] for more information on sessions and process sets.==

### MPI-4.0 → MPI-4.1  (6 changed paragraphs)

MPI provides two approaches to constructing groups. In the first approach, MPI procedures are provided to subset and superset existing groups. These constructors construct new groups from existing groups. In the second approach, a group is created using a session handle and associated process set. This second approach is available when using the Sessions Model . With both approaches, these are local operations, and distinct groups may be defined on different ==MPI== processes; ~~a~~ ==an MPI== process may also define a group that does not include itself. Consistent definitions are required when groups are used as arguments in communicator creation functions. When using the World Model (Section [[versions/v41/sections/dynamic#The World Model|The World Model]] ) for MPI initialization, the base group, upon which all other groups are defined, is the group associated with the initial communicator `MPI_COMM_WORLD` (accessible through the function [[versions/v41/API/MPI_COMM_GROUP|MPI_COMM_GROUP]] ).

~~union~~ ==union:== All elements of the first group (`group1`), followed by all elements of second group (`group2`) not in the first group.

~~intersect~~ ==intersect:== All elements of the first group that are also in the second group, ordered as in the first group.

Note that for these operations the order of ==MPI== processes in the output group is determined primarily by order in the first group (if possible) and then, if necessary, by order in the second group. Neither union nor intersection are commutative, but both are associative. The new group can be empty, that is, equal to `MPI_GROUP_EMPTY`.

The function [[versions/v41/API/MPI_GROUP_INCL|MPI_GROUP_INCL]] creates a group `newgroup` that consists of the `n` ==MPI== processes in `group` with ranks `ranks[0]`,$`...`$, `ranks[n-1]`; the ==MPI== process with rank `i` in `newgroup` is the ==MPI== process with rank `ranks[i]` in `group`. Each of the `n` elements of `ranks` must be a valid rank in `group` and all elements must be distinct, or else the program is erroneous. If `n`$`= 0`$, then `newgroup` is `MPI_GROUP_EMPTY`. This function can, for instance, be used to reorder the elements of a group. See also [[versions/v41/API/MPI_GROUP_COMPARE|MPI_GROUP_COMPARE]] .

The function [[versions/v41/API/MPI_GROUP_EXCL|MPI_GROUP_EXCL]] creates a group of ==MPI== processes `newgroup` that is obtained by deleting from `group` those ==MPI== processes with ranks `ranks[0]`,$`...`$, `ranks[n-1]`. The ordering of ==MPI== processes in `newgroup` is identical to the ordering in `group`. Each of the `n` elements of `ranks` must be a valid rank in `group` and all elements must be distinct; otherwise, the program is erroneous. If `n`$`= 0`$, then `newgroup` is identical to `group`.

then `newgroup` consists of the sequence of ==MPI== processes in `group` with ranks ``` math first_1 , first_1 + stride_1 , ... , first_1 + \left\lfloor \frac{last_1 - first_1}{stride_1} \right\rfloor stride_1 , ..., ```

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

~~difference~~ ==difference:== All elements of the first group that are not in the second group, ordered as in the first group.

The function [[versions/v50/API/MPI_GROUP_FROM_SESSION_PSET|MPI_GROUP_FROM_SESSION_PSET]] creates a group `newgroup` using the provided session handle and process ~~set. The process~~ set ~~name must be one~~ ==name. Process set names== returned from ~~an invocation of~~ [[versions/v50/API/MPI_SESSION_GET_NTH_PSET|MPI_SESSION_GET_NTH_PSET]] ~~using~~ ==for== the supplied `session` ~~handle.~~ ==are considered valid process set names by MPI.== If the `pset_name` ~~does~~ ==is== not ~~exist,~~ ==considered valid by MPI at the time of the call,== `MPI_GROUP_NULL` will be returned in the `newgroup` argument. As with other group constructors, [[versions/v50/API/MPI_GROUP_FROM_SESSION_PSET|MPI_GROUP_FROM_SESSION_PSET]] is a local function. See [[versions/v50/sections/dynamic#The Sessions Model|The Sessions Model]] for more information on sessions and process sets.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Group Constructors]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Group Constructors]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Group Constructors]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Group Constructors]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Group Constructors]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Group Constructors]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Group Constructors]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Group Constructors]]

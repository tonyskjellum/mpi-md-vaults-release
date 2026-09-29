---
title: "Group Accessors"
chapter: context
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Group Accessors

Chapter **context** · in [[versions/v13/sections/context#Group Accessors|MPI-1.3]], [[versions/v21/sections/context#Group Accessors|MPI-2.1]], [[versions/v22/sections/context#Group Accessors|MPI-2.2]], [[versions/v30/sections/context#Group Accessors|MPI-3.0]], [[versions/v31/sections/context#Group Accessors|MPI-3.1]], [[versions/v40/sections/context#Group Accessors|MPI-4.0]], [[versions/v41/sections/context#Group Accessors|MPI-4.1]], [[versions/v50/sections/context#Group Accessors|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

==MPI_PROC_NULL is a valid rank for input to [[versions/v21/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] , which returns `MPI_PROC_NULL` as the translated rank.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

This function is important for determining the relative numbering of the same processes in two different groups. For instance, if one knows the ranks of certain processes in the group of ~~MPI_COMM_WORLD,~~ ==`MPI_COMM_WORLD`,== one might want to know their ranks in a subset of that group.

~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== is a valid rank for input to [[versions/v22/API/MPI_GROUP_TRANSLATE_RANKS|MPI_GROUP_TRANSLATE_RANKS]] , which returns `MPI_PROC_NULL` as the translated rank.

~~MPI_IDENT~~ ==`MPI_IDENT`== results if the group members and group order is exactly the same in both groups. This happens for instance if `group1` and `group2` are the same handle. ~~MPI_SIMILAR~~ ==`MPI_SIMILAR`== results if the group members are the same but the order is different. ~~MPI_UNEQUAL~~ ==`MPI_UNEQUAL`== results otherwise.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

`MPI_IDENT` results if the group members and group order ~~is~~ ==are== exactly the same in both groups. This happens for instance if `group1` and `group2` are the same handle. `MPI_SIMILAR` results if the group members are the same but the order is different. `MPI_UNEQUAL` results otherwise.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

This function is important for determining the relative numbering of the same ==MPI== processes in two different groups. For instance, if one knows the ranks of certain ==MPI== processes in the group of `MPI_COMM_WORLD`, one might want to know their ranks in a subset of that group.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/context#Group Accessors]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Group Accessors]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Group Accessors]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Group Accessors]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Group Accessors]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Group Accessors]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Group Accessors]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Group Accessors]]

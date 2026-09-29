---
title: MPI_T_CATEGORY_GET_INDEX
c_name: MPI_T_category_get_index
chapter: tools
introduced: "MPI-3.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_CATEGORY_GET_INDEX, MPI_T_category_get_index]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_CATEGORY_GET_INDEX

**Introduced** in MPI-3.1.

Releases: [[versions/v31/API/MPI_T_CATEGORY_GET_INDEX|MPI-3.1]] · [[versions/v40/API/MPI_T_CATEGORY_GET_INDEX|MPI-4.0]] · [[versions/v41/API/MPI_T_CATEGORY_GET_INDEX|MPI-4.1]] · [[versions/v50/API/MPI_T_CATEGORY_GET_INDEX|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.1–MPI-5.0**
```c
int MPI_T_category_get_index(const char *name, int *cat_index)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `name` | IN | **MPI-3.1–MPI-5.0:** the name of the category (string) |
| `cat_index` | OUT | **MPI-3.1–MPI-5.0:** the index of the category (integer) |

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.1: [[versions/v31/API/MPI_T_CATEGORY_GET_INDEX|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_CATEGORY_GET_INDEX|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_CATEGORY_GET_INDEX|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_CATEGORY_GET_INDEX|API note]] · chapter [[versions/v50/sections/tools|tools]]

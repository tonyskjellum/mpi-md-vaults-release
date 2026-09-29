---
title: MPI_T_CATEGORY_GET_CVARS
c_name: MPI_T_category_get_cvars
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_CATEGORY_GET_CVARS, MPI_T_category_get_cvars]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_CATEGORY_GET_CVARS

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_CATEGORY_GET_CVARS|MPI-3.0]] · [[versions/v31/API/MPI_T_CATEGORY_GET_CVARS|MPI-3.1]] · [[versions/v40/API/MPI_T_CATEGORY_GET_CVARS|MPI-4.0]] Δ · [[versions/v41/API/MPI_T_CATEGORY_GET_CVARS|MPI-4.1]] · [[versions/v50/API/MPI_T_CATEGORY_GET_CVARS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_T_category_get_cvars(int cat_index, int len, int indices[])
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `cat_index` | IN | **MPI-3.0–MPI-3.1:** index of the category to be queried, in the range $[0,N-1]$ (integer)<br>**MPI-4.0–MPI-5.0:** index of the category to be queried, in the range from $0$ to $`num_cat`-1$ (integer) |
| `len` | IN | **MPI-3.0–MPI-5.0:** the length of the indices array (integer) |
| `indices` | OUT | **MPI-3.0–MPI-5.0:** an integer array of size `len`, indicating control variable indices (array of integers) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_CATEGORY_GET_CVARS|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_CATEGORY_GET_CVARS|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_CATEGORY_GET_CVARS|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_CATEGORY_GET_CVARS|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_CATEGORY_GET_CVARS|API note]] · chapter [[versions/v50/sections/tools|tools]]

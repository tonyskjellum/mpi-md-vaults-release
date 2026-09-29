---
title: MPI_T_CATEGORY_GET_INFO
c_name: MPI_T_category_get_info
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_CATEGORY_GET_INFO, MPI_T_category_get_info]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_CATEGORY_GET_INFO

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_CATEGORY_GET_INFO|MPI-3.0]] · [[versions/v31/API/MPI_T_CATEGORY_GET_INFO|MPI-3.1]] · [[versions/v40/API/MPI_T_CATEGORY_GET_INFO|MPI-4.0]] Δ · [[versions/v41/API/MPI_T_CATEGORY_GET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_T_CATEGORY_GET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_T_category_get_info(int cat_index, char *name, int *name_len, char *desc, int *desc_len, int *num_cvars, int *num_pvars, int *num_categories)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `cat_index` | IN | **MPI-3.0–MPI-5.0:** index of the category to be queried (integer) |
| `name` | OUT | **MPI-3.0–MPI-5.0:** buffer to return the string containing the name of the category (string) |
| `{name}_len` | INOUT | **MPI-3.0–MPI-3.1:** length of the string and/or buffer for `name` (integer)<br>_MPI-4.0–MPI-5.0: absent_ |
| `desc` | OUT | **MPI-3.0–MPI-5.0:** buffer to return the string containing the description of the category (string) |
| `{desc}_len` | INOUT | **MPI-3.0–MPI-3.1:** length of the string and/or buffer for `desc` (integer)<br>_MPI-4.0–MPI-5.0: absent_ |
| `num_cvars` | OUT | **MPI-3.0–MPI-5.0:** number of control variables in the category (integer) |
| `num_pvars` | OUT | **MPI-3.0–MPI-5.0:** number of performance variables in the category (integer) |
| `num_categories` | OUT | **MPI-3.0–MPI-5.0:** number of categories contained in the category (integer) |
| `name_len` | INOUT | _MPI-3.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-5.0:** length of the string and/or buffer for `name` (integer) |
| `desc_len` | INOUT | _MPI-3.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-5.0:** length of the string and/or buffer for `desc` (integer) |

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_CATEGORY_GET_INFO|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_CATEGORY_GET_INFO|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_CATEGORY_GET_INFO|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_CATEGORY_GET_INFO|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_CATEGORY_GET_INFO|API note]] · chapter [[versions/v50/sections/tools|tools]]

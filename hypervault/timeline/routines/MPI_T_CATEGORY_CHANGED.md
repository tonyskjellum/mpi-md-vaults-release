---
title: MPI_T_CATEGORY_CHANGED
c_name: MPI_T_category_changed
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_CATEGORY_CHANGED, MPI_T_category_changed]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_CATEGORY_CHANGED

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_CATEGORY_CHANGED|MPI-3.0]] · [[versions/v31/API/MPI_T_CATEGORY_CHANGED|MPI-3.1]] · [[versions/v40/API/MPI_T_CATEGORY_CHANGED|MPI-4.0]] Δ · [[versions/v41/API/MPI_T_CATEGORY_CHANGED|MPI-4.1]] · [[versions/v50/API/MPI_T_CATEGORY_CHANGED|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_T_category_changed(int *stamp)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_T_category_changed(int *update_number)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `stamp` | OUT | **MPI-3.0–MPI-3.1:** a virtual time stamp to indicate the last change to the categories (integer)<br>_MPI-4.0–MPI-5.0: absent_ |
| `update_number` | OUT | _MPI-3.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-5.0:** update number (integer) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_CATEGORY_CHANGED|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_CATEGORY_CHANGED|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_CATEGORY_CHANGED|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_CATEGORY_CHANGED|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_CATEGORY_CHANGED|API note]] · chapter [[versions/v50/sections/tools|tools]]

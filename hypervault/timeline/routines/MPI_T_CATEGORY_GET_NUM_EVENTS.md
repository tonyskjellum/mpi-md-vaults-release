---
title: MPI_T_CATEGORY_GET_NUM_EVENTS
c_name: MPI_T_category_get_num_events
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_CATEGORY_GET_NUM_EVENTS, MPI_T_category_get_num_events]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_CATEGORY_GET_NUM_EVENTS

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_CATEGORY_GET_NUM_EVENTS|MPI-4.0]] · [[versions/v41/API/MPI_T_CATEGORY_GET_NUM_EVENTS|MPI-4.1]] · [[versions/v50/API/MPI_T_CATEGORY_GET_NUM_EVENTS|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_category_get_num_events(int cat_index, int *num_events)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `cat_index` | IN | **MPI-4.0–MPI-5.0:** index of the category to be queried (integer) |
| `num_events` | OUT | **MPI-4.0–MPI-5.0:** number of event types in the category (integer) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_CATEGORY_GET_NUM_EVENTS|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_CATEGORY_GET_NUM_EVENTS|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_CATEGORY_GET_NUM_EVENTS|API note]] · chapter [[versions/v50/sections/tools|tools]]

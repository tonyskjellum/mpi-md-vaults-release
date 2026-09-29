---
title: MPI_T_SOURCE_GET_INFO
c_name: MPI_T_source_get_info
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_SOURCE_GET_INFO, MPI_T_source_get_info]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_SOURCE_GET_INFO

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_SOURCE_GET_INFO|MPI-4.0]] · [[versions/v41/API/MPI_T_SOURCE_GET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_T_SOURCE_GET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_source_get_info(int source_index, char *name, int *name_len, char *desc, int *desc_len, MPI_T_source_order *ordering, MPI_Count *ticks_per_second, MPI_Count *max_ticks, MPI_Info *info)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `source_index` | IN | **MPI-4.0–MPI-5.0:** index of the source to be queried between $0$ and $`num_sources`-1$ (integer) |
| `name` | OUT | **MPI-4.0–MPI-5.0:** buffer to return the string containing the name of the source (string) |
| `name_len` | INOUT | **MPI-4.0–MPI-5.0:** length of the string and/or buffer for `name` (integer) |
| `desc` | OUT | **MPI-4.0–MPI-5.0:** buffer to return the string containing the description of the source (string) |
| `desc_len` | INOUT | **MPI-4.0–MPI-5.0:** length of the string and/or buffer for `desc` (integer) |
| `ordering` | OUT | **MPI-4.0–MPI-5.0:** flag indicating chronological ordering guarantees given by the source (integer) |
| `ticks_per_second` | OUT | **MPI-4.0–MPI-5.0:** the number of ticks per second for the timer of this source (integer) |
| `max_ticks` | OUT | **MPI-4.0–MPI-5.0:** the maximum count of ticks reported by this source before overflow occurs (integer) |
| `info` | OUT | **MPI-4.0–MPI-5.0:** optional info object (handle) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_SOURCE_GET_INFO|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_SOURCE_GET_INFO|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_SOURCE_GET_INFO|API note]] · chapter [[versions/v50/sections/tools|tools]]

---
title: MPI_T_SOURCE_GET_TIMESTAMP
c_name: MPI_T_source_get_timestamp
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_SOURCE_GET_TIMESTAMP, MPI_T_source_get_timestamp]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_SOURCE_GET_TIMESTAMP

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_SOURCE_GET_TIMESTAMP|MPI-4.0]] · [[versions/v41/API/MPI_T_SOURCE_GET_TIMESTAMP|MPI-4.1]] · [[versions/v50/API/MPI_T_SOURCE_GET_TIMESTAMP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_source_get_timestamp(int source_index, MPI_Count *timestamp)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `source_index` | IN | **MPI-4.0–MPI-5.0:** index of the source (integer) |
| `timestamp` | OUT | **MPI-4.0–MPI-5.0:** current timestamp from specified source (integer) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_SOURCE_GET_TIMESTAMP|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_SOURCE_GET_TIMESTAMP|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_SOURCE_GET_TIMESTAMP|API note]] · chapter [[versions/v50/sections/tools|tools]]

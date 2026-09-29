---
title: MPI_T_ENUM_GET_ITEM
c_name: MPI_T_enum_get_item
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_ENUM_GET_ITEM, MPI_T_enum_get_item]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_ENUM_GET_ITEM

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_ENUM_GET_ITEM|MPI-3.0]] · [[versions/v31/API/MPI_T_ENUM_GET_ITEM|MPI-3.1]] · [[versions/v40/API/MPI_T_ENUM_GET_ITEM|MPI-4.0]] Δ · [[versions/v41/API/MPI_T_ENUM_GET_ITEM|MPI-4.1]] · [[versions/v50/API/MPI_T_ENUM_GET_ITEM|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_T_enum_get_item(MPI_T_enum enumtype, int index, int *value, char *name, int *name_len)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `enumtype` | IN | **MPI-3.0–MPI-5.0:** enumeration to be queried (handle) |
| `index` | IN | **MPI-3.0–MPI-5.0:** number of the value to be queried in this enumeration (integer) |
| `value` | OUT | **MPI-3.0–MPI-5.0:** variable value (integer) |
| `name` | OUT | **MPI-3.0–MPI-5.0:** buffer to return the string containing the name of the enumeration item (string) |
| `{name}_len` | INOUT | **MPI-3.0–MPI-3.1:** length of the string and/or buffer for `name` (integer)<br>_MPI-4.0–MPI-5.0: absent_ |
| `name_len` | INOUT | _MPI-3.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-5.0:** length of the string and/or buffer for `name` (integer) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_ENUM_GET_ITEM|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_ENUM_GET_ITEM|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_ENUM_GET_ITEM|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_ENUM_GET_ITEM|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_ENUM_GET_ITEM|API note]] · chapter [[versions/v50/sections/tools|tools]]

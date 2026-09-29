---
title: MPI_T_CVAR_GET_INFO
c_name: MPI_T_cvar_get_info
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_CVAR_GET_INFO, MPI_T_cvar_get_info]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_CVAR_GET_INFO

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_CVAR_GET_INFO|MPI-3.0]] · [[versions/v31/API/MPI_T_CVAR_GET_INFO|MPI-3.1]] · [[versions/v40/API/MPI_T_CVAR_GET_INFO|MPI-4.0]] Δ · [[versions/v41/API/MPI_T_CVAR_GET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_T_CVAR_GET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_T_cvar_get_info(int cvar_index, char *name, int *name_len, int *verbosity, MPI_Datatype *datatype, MPI_T_enum *enumtype, char *desc, int *desc_len, int *bind, int *scope)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `cvar_index` | IN | **MPI-3.0–MPI-3.1:** index of the control variable to be queried, value between $0$ and $num_cvar-1$ (integer)<br>**MPI-4.0–MPI-5.0:** index of the control variable to be queried, value between $0$ and $`num_cvar`-1$ (integer) |
| `name` | OUT | **MPI-3.0–MPI-5.0:** buffer to return the string containing the name of the control variable (string) |
| `{name}_len` | INOUT | **MPI-3.0–MPI-3.1:** length of the string and/or buffer for `name` (integer)<br>_MPI-4.0–MPI-5.0: absent_ |
| `verbosity` | OUT | **MPI-3.0–MPI-5.0:** verbosity level of this variable (integer) |
| `datatype` | OUT | **MPI-3.0–MPI-5.0:** MPI datatype of the information stored in the control variable (handle) |
| `enumtype` | OUT | **MPI-3.0–MPI-5.0:** optional descriptor for enumeration information (handle) |
| `desc` | OUT | **MPI-3.0–MPI-5.0:** buffer to return the string containing a description of the control variable (string) |
| `{desc}_len` | INOUT | **MPI-3.0–MPI-3.1:** length of the string and/or buffer for `desc` (integer)<br>_MPI-4.0–MPI-5.0: absent_ |
| `bind` | OUT | **MPI-3.0–MPI-5.0:** type of MPI object to which this variable must be bound (integer) |
| `scope` | OUT | **MPI-3.0–MPI-5.0:** scope of when changes to this variable are possible (integer) |
| `name_len` | INOUT | _MPI-3.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-5.0:** length of the string and/or buffer for `name` (integer) |
| `desc_len` | INOUT | _MPI-3.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-5.0:** length of the string and/or buffer for `desc` (integer) |

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_CVAR_GET_INFO|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_CVAR_GET_INFO|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_CVAR_GET_INFO|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_CVAR_GET_INFO|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_CVAR_GET_INFO|API note]] · chapter [[versions/v50/sections/tools|tools]]

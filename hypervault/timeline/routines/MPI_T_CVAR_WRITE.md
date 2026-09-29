---
title: MPI_T_CVAR_WRITE
c_name: MPI_T_cvar_write
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_CVAR_WRITE, MPI_T_cvar_write]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_CVAR_WRITE

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_CVAR_WRITE|MPI-3.0]] · [[versions/v31/API/MPI_T_CVAR_WRITE|MPI-3.1]] · [[versions/v40/API/MPI_T_CVAR_WRITE|MPI-4.0]] Δ · [[versions/v41/API/MPI_T_CVAR_WRITE|MPI-4.1]] Δ · [[versions/v50/API/MPI_T_CVAR_WRITE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_T_cvar_write(MPI_T_cvar_handle handle, const void* buf)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_T_cvar_write(MPI_T_cvar_handle handle, const void *buf)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `handle` | IN/INOUT | **MPI-3.0–MPI-4.0:** handle to the control variable to be written (handle)<br>**MPI-4.1–MPI-5.0:** handle to the control variable to be written (handle) |
| `buf` | IN | **MPI-3.0–MPI-5.0:** initial address of storage location for variable value (choice) |

## Named in the change log of

[[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_CVAR_WRITE|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_CVAR_WRITE|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_CVAR_WRITE|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_CVAR_WRITE|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_CVAR_WRITE|API note]] · chapter [[versions/v50/sections/tools|tools]]

---
title: MPI_T_CVAR_HANDLE_ALLOC
c_name: MPI_T_cvar_handle_alloc
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_CVAR_HANDLE_ALLOC, MPI_T_cvar_handle_alloc]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_CVAR_HANDLE_ALLOC

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_CVAR_HANDLE_ALLOC|MPI-3.0]] · [[versions/v31/API/MPI_T_CVAR_HANDLE_ALLOC|MPI-3.1]] · [[versions/v40/API/MPI_T_CVAR_HANDLE_ALLOC|MPI-4.0]] · [[versions/v41/API/MPI_T_CVAR_HANDLE_ALLOC|MPI-4.1]] · [[versions/v50/API/MPI_T_CVAR_HANDLE_ALLOC|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_T_cvar_handle_alloc(int cvar_index, void *obj_handle, MPI_T_cvar_handle *handle, int *count)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `cvar_index` | IN | **MPI-3.0–MPI-5.0:** index of control variable for which handle is to be allocated (index) |
| `obj_handle` | IN | **MPI-3.0–MPI-5.0:** reference to a handle of the MPI object to which this variable is supposed to be bound (pointer) |
| `handle` | OUT | **MPI-3.0–MPI-5.0:** allocated handle (handle) |
| `count` | OUT | **MPI-3.0–MPI-5.0:** number of elements used to represent this variable (integer) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_CVAR_HANDLE_ALLOC|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_CVAR_HANDLE_ALLOC|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_CVAR_HANDLE_ALLOC|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_CVAR_HANDLE_ALLOC|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_CVAR_HANDLE_ALLOC|API note]] · chapter [[versions/v50/sections/tools|tools]]

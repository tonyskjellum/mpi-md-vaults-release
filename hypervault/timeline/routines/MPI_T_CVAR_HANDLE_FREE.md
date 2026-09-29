---
title: MPI_T_CVAR_HANDLE_FREE
c_name: MPI_T_cvar_handle_free
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_CVAR_HANDLE_FREE, MPI_T_cvar_handle_free]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_CVAR_HANDLE_FREE

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_CVAR_HANDLE_FREE|MPI-3.0]] · [[versions/v31/API/MPI_T_CVAR_HANDLE_FREE|MPI-3.1]] · [[versions/v40/API/MPI_T_CVAR_HANDLE_FREE|MPI-4.0]] · [[versions/v41/API/MPI_T_CVAR_HANDLE_FREE|MPI-4.1]] · [[versions/v50/API/MPI_T_CVAR_HANDLE_FREE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_T_cvar_handle_free(MPI_T_cvar_handle *handle)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `handle` | INOUT | **MPI-3.0–MPI-5.0:** handle to be freed (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_CVAR_HANDLE_FREE|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_CVAR_HANDLE_FREE|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_CVAR_HANDLE_FREE|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_CVAR_HANDLE_FREE|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_CVAR_HANDLE_FREE|API note]] · chapter [[versions/v50/sections/tools|tools]]

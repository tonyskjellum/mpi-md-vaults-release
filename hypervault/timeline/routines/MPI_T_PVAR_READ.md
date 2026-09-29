---
title: MPI_T_PVAR_READ
c_name: MPI_T_pvar_read
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_PVAR_READ, MPI_T_pvar_read]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_PVAR_READ

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_PVAR_READ|MPI-3.0]] · [[versions/v31/API/MPI_T_PVAR_READ|MPI-3.1]] · [[versions/v40/API/MPI_T_PVAR_READ|MPI-4.0]] Δ · [[versions/v41/API/MPI_T_PVAR_READ|MPI-4.1]] · [[versions/v50/API/MPI_T_PVAR_READ|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-3.1**
```c
int MPI_T_pvar_read(MPI_T_pvar_session session, MPI_T_pvar_handle handle, void* buf)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_T_pvar_read(MPI_T_pvar_session pe_session, MPI_T_pvar_handle handle, void *buf)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `session` | IN | **MPI-3.0–MPI-3.1:** identifier of performance experiment session (handle)<br>_MPI-4.0–MPI-5.0: absent_ |
| `handle` | IN | **MPI-3.0–MPI-5.0:** handle of a performance variable (handle) |
| `buf` | OUT | **MPI-3.0–MPI-5.0:** initial address of storage location for variable value (choice) |
| `pe_session` | IN | _MPI-3.0–MPI-3.1: absent_<br>**MPI-4.0–MPI-5.0:** identifier of performance experiment session (handle) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_PVAR_READ|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_PVAR_READ|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_PVAR_READ|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_PVAR_READ|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_PVAR_READ|API note]] · chapter [[versions/v50/sections/tools|tools]]

---
title: MPI_T_INIT_THREAD
c_name: MPI_T_init_thread
chapter: tools
introduced: "MPI-3.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_INIT_THREAD, MPI_T_init_thread]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_INIT_THREAD

**Introduced** in MPI-3.0.

Releases: [[versions/v30/API/MPI_T_INIT_THREAD|MPI-3.0]] · [[versions/v31/API/MPI_T_INIT_THREAD|MPI-3.1]] · [[versions/v40/API/MPI_T_INIT_THREAD|MPI-4.0]] · [[versions/v41/API/MPI_T_INIT_THREAD|MPI-4.1]] · [[versions/v50/API/MPI_T_INIT_THREAD|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.0–MPI-5.0**
```c
int MPI_T_init_thread(int required, int *provided)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `required` | IN | **MPI-3.0–MPI-5.0:** desired level of thread support (integer) |
| `provided` | OUT | **MPI-3.0–MPI-5.0:** provided level of thread support (integer) |

## Per-release notes

- MPI-3.0: [[versions/v30/API/MPI_T_INIT_THREAD|API note]] · chapter [[versions/v30/sections/tools|tools]]
- MPI-3.1: [[versions/v31/API/MPI_T_INIT_THREAD|API note]] · chapter [[versions/v31/sections/tools|tools]]
- MPI-4.0: [[versions/v40/API/MPI_T_INIT_THREAD|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_INIT_THREAD|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_INIT_THREAD|API note]] · chapter [[versions/v50/sections/tools|tools]]

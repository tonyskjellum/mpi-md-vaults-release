---
title: MPI_GREQUEST_START
c_name: MPI_Grequest_start
chapter: ei
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_GREQUEST_START, MPI_Grequest_start]
tags: [mpi/routine, mpi/ei]
---

# MPI_GREQUEST_START

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_GREQUEST_START|MPI-2.0]] · [[versions/v21/API/MPI_GREQUEST_START|MPI-2.1]] · [[versions/v22/API/MPI_GREQUEST_START|MPI-2.2]] Δ · [[versions/v30/API/MPI_GREQUEST_START|MPI-3.0]] Δ · [[versions/v31/API/MPI_GREQUEST_START|MPI-3.1]] Δ · [[versions/v40/API/MPI_GREQUEST_START|MPI-4.0]] Δ · [[versions/v41/API/MPI_GREQUEST_START|MPI-4.1]] · [[versions/v50/API/MPI_GREQUEST_START|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_Grequest_start(MPI_Grequest_query_function *query_fn, MPI_Grequest_free_function *free_fn, MPI_Grequest_cancel_function *cancel_fn, void *extra_state, MPI_Request *request)
typedef int MPI_Grequest_query_function(void *extra_state, MPI_Status *status);
typedef int MPI_Grequest_free_function(void *extra_state);
typedef int MPI_Grequest_cancel_function(void *extra_state, int complete);
```

## C++

**MPI-2.0–MPI-2.1**
```c
static MPI::Grequest MPI::Grequest::Start(const MPI::Grequest::Query_function query_fn, const MPI::Grequest::Free_function free_fn, const MPI::Grequest::Cancel_function cancel_fn, void *extra_state)
typedef int MPI::Grequest::Query_function(void* extra_state, MPI::Status& status);
typedef int MPI::Grequest::Free_function(void* extra_state);
typedef int MPI::Grequest::Cancel_function(void* extra_state, bool complete);
```

**MPI-2.2**
```c
static MPI::Grequest MPI::Grequest::Start(const MPI::Grequest::Query_function* query_fn, const MPI::Grequest::Free_function* free_fn, const MPI::Grequest::Cancel_function* cancel_fn, void *extra_state)
typedef int MPI::Grequest::Query_function(void* extra_state, MPI::Status& status);
typedef int MPI::Grequest::Free_function(void* extra_state);
typedef int MPI::Grequest::Cancel_function(void* extra_state, bool complete);
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_Grequest_start(query_fn, free_fn, cancel_fn, extra_state, request, ierror) BIND(C)
    PROCEDURE(MPI_Grequest_query_function) :: query_fn
    PROCEDURE(MPI_Grequest_free_function) :: free_fn
    PROCEDURE(MPI_Grequest_cancel_function) :: cancel_fn
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_Grequest_start(query_fn, free_fn, cancel_fn, extra_state, request, ierror)
    PROCEDURE(MPI_Grequest_query_function) :: query_fn
    PROCEDURE(MPI_Grequest_free_function) :: free_fn
    PROCEDURE(MPI_Grequest_cancel_function) :: cancel_fn
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: extra_state
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_GREQUEST_START(QUERY_FN, FREE_FN, CANCEL_FN, EXTRA_STATE, REQUEST, IERROR)
    INTEGER REQUEST, IERROR
    EXTERNAL QUERY_FN, FREE_FN, CANCEL_FN
    INTEGER (KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_GREQUEST_START(QUERY_FN, FREE_FN, CANCEL_FN, EXTRA_STATE, REQUEST, IERROR)
    EXTERNAL QUERY_FN, FREE_FN, CANCEL_FN
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
    INTEGER REQUEST, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `query_fn` | IN | **MPI-2.0–MPI-5.0:** callback function invoked when request status is queried (function) |
| `free_fn` | IN | **MPI-2.0–MPI-5.0:** callback function invoked when request is freed (function) |
| `cancel_fn` | IN | **MPI-2.0–MPI-5.0:** callback function invoked when request is cancelled (function) |
| `extra_state` | IN | **MPI-2.0–MPI-5.0:** extra state |
| `request` | OUT | **MPI-2.0–MPI-5.0:** generalized request (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_GREQUEST_START|API note]] · chapter [[versions/v20/sections/ei|ei]]
- MPI-2.1: [[versions/v21/API/MPI_GREQUEST_START|API note]] · chapter [[versions/v21/sections/ei|ei]]
- MPI-2.2: [[versions/v22/API/MPI_GREQUEST_START|API note]] · chapter [[versions/v22/sections/ei|ei]]
- MPI-3.0: [[versions/v30/API/MPI_GREQUEST_START|API note]] · chapter [[versions/v30/sections/ei|ei]]
- MPI-3.1: [[versions/v31/API/MPI_GREQUEST_START|API note]] · chapter [[versions/v31/sections/ei|ei]]
- MPI-4.0: [[versions/v40/API/MPI_GREQUEST_START|API note]] · chapter [[versions/v40/sections/ei|ei]]
- MPI-4.1: [[versions/v41/API/MPI_GREQUEST_START|API note]] · chapter [[versions/v41/sections/ei|ei]]
- MPI-5.0: [[versions/v50/API/MPI_GREQUEST_START|API note]] · chapter [[versions/v50/sections/ei|ei]]

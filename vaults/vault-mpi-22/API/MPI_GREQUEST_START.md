---
title: MPI_GREQUEST_START
c_name: MPI_Grequest_start
lis_name: MPI_GREQUEST_START
chapter: ei
aliases: [MPI_GREQUEST_START, MPI_Grequest_cancel_function, MPI_Grequest_free_function, MPI_Grequest_query_function, MPI_Grequest_start]
tags: [mpi/function, mpi/ei]
---

# MPI_GREQUEST_START

**C**
```c
int MPI_Grequest_start(MPI_Grequest_query_function *query_fn, MPI_Grequest_free_function *free_fn, MPI_Grequest_cancel_function *cancel_fn, void *extra_state, MPI_Request *request)
typedef int MPI_Grequest_query_function(void *extra_state, MPI_Status *status);
typedef int MPI_Grequest_free_function(void *extra_state);
typedef int MPI_Grequest_cancel_function(void *extra_state, int complete);
```

**C++**
```cpp
static MPI::Grequest MPI::Grequest::Start(const MPI::Grequest::Query_function* query_fn, const MPI::Grequest::Free_function* free_fn, const MPI::Grequest::Cancel_function* cancel_fn, void *extra_state)
typedef int MPI::Grequest::Query_function(void* extra_state, MPI::Status& status);
typedef int MPI::Grequest::Free_function(void* extra_state);
typedef int MPI::Grequest::Cancel_function(void* extra_state, bool complete);
```

| Parameter | Intent | Description |
|---|---|---|
| `query_fn` | IN | callback function invoked when request status is queried (function) |
| `free_fn` | IN | callback function invoked when request is freed (function) |
| `cancel_fn` | IN | callback function invoked when request is cancelled (function) |
| `extra_state` | IN | extra state |
| `request` | OUT | generalized request (handle) |

**Fortran (mpif.h)**
```fortran
MPI_GREQUEST_START(QUERY_FN, FREE_FN, CANCEL_FN, EXTRA_STATE, REQUEST, IERROR)
  INTEGER REQUEST, IERROR
  EXTERNAL QUERY_FN, FREE_FN, CANCEL_FN
  INTEGER (KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

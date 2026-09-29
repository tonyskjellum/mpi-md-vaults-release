---
title: MPI_SESSION_GET_NUM_PSETS
c_name: MPI_Session_get_num_psets
lis_name: MPI_SESSION_GET_NUM_PSETS
chapter: dynamic
aliases: [MPI_SESSION_GET_NUM_PSETS, MPI_Session_get_num_psets]
tags: [mpi/function, mpi/dynamic]
---

# MPI_SESSION_GET_NUM_PSETS

**C**
```c
int MPI_Session_get_num_psets(MPI_Session session, MPI_Info info, int *npset_names)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session (handle) |
| `info` | IN | info object (handle) |
| `npset_names` | OUT | number of available process sets (nonnegative integer) |

**Fortran 2008**
```fortran
MPI_Session_get_num_psets(session, info, npset_names, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, INTENT(OUT) :: npset_names
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_GET_NUM_PSETS(SESSION, INFO, NPSET_NAMES, IERROR)
  INTEGER SESSION, INFO, NPSET_NAMES, IERROR
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

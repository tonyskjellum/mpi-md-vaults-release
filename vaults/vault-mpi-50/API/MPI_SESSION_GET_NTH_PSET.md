---
title: MPI_SESSION_GET_NTH_PSET
c_name: MPI_Session_get_nth_pset
lis_name: MPI_SESSION_GET_NTH_PSET
chapter: dynamic
aliases: [MPI_SESSION_GET_NTH_PSET, MPI_Session_get_nth_pset]
tags: [mpi/function, mpi/dynamic]
---

# MPI_SESSION_GET_NTH_PSET

**C**
```c
int MPI_Session_get_nth_pset(MPI_Session session, MPI_Info info, int n, int *pset_len, char *pset_name)
```

| Parameter | Intent | Description |
|---|---|---|
| `session` | IN | session (handle) |
| `info` | IN | info object (handle) |
| `n` | IN | index of the desired process set name (integer) |
| `pset_len` | INOUT | length of the pset_name argument (integer) |
| `pset_name` | OUT | name of the `n`th process set (string) |

**Fortran 2008**
```fortran
MPI_Session_get_nth_pset(session, info, n, pset_len, pset_name, ierror)
  TYPE(MPI_Session), INTENT(IN) :: session
  TYPE(MPI_Info), INTENT(IN) :: info
  INTEGER, INTENT(IN) :: n
  INTEGER, INTENT(INOUT) :: pset_len
  CHARACTER(LEN=*), INTENT(OUT) :: pset_name
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_SESSION_GET_NTH_PSET(SESSION, INFO, N, PSET_LEN, PSET_NAME, IERROR)
  INTEGER SESSION, INFO, N, PSET_LEN, IERROR
  CHARACTER*(*) PSET_NAME
```


> [!info] Semantics
> See the chapter note [[dynamic]] for the normative text.

---
title: MPI_INTERCOMM_MERGE
c_name: MPI_Intercomm_merge
lis_name: MPI_INTERCOMM_MERGE
chapter: context
aliases: [MPI_INTERCOMM_MERGE, MPI_Intercomm_merge]
tags: [mpi/function, mpi/context]
---

# MPI_INTERCOMM_MERGE

**C**
```c
int MPI_Intercomm_merge(MPI_Comm intercomm, int high, MPI_Comm *newintracomm)
```

| Parameter | Intent | Description |
|---|---|---|
| `intercomm` | IN | Inter-Communicator (handle) |
| `high` | IN | (logical) |
| `newintracomm` | OUT | new intra-communicator (handle) |

**Fortran (mpif.h)**
```fortran
MPI_INTERCOMM_MERGE(INTERCOMM, HIGH, INTRACOMM, IERROR)
  INTEGER INTERCOMM, INTRACOMM, IERROR
  LOGICAL HIGH
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

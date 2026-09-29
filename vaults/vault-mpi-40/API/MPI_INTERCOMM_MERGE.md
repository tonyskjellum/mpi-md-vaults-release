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
| `intercomm` | IN | inter-communicator (handle) |
| `high` | IN | ordering of the local and remote groups in the new intra-communicator (logical) |
| `newintracomm` | OUT | new intra-communicator (handle) |

**Fortran 2008**
```fortran
MPI_Intercomm_merge(intercomm, high, newintracomm, ierror)
  TYPE(MPI_Comm), INTENT(IN) :: intercomm
  LOGICAL, INTENT(IN) :: high
  TYPE(MPI_Comm), INTENT(OUT) :: newintracomm
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_INTERCOMM_MERGE(INTERCOMM, HIGH, NEWINTRACOMM, IERROR)
  INTEGER INTERCOMM, NEWINTRACOMM, IERROR
  LOGICAL HIGH
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

---
title: MPI_PROBE
c_name: MPI_Probe
lis_name: MPI_PROBE
chapter: pt2pt
aliases: [MPI_PROBE, MPI_Probe]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_PROBE

**C**
```c
int MPI_Probe(int source, int tag, MPI_Comm comm, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `source` | IN | rank of source or `MPI_ANY_SOURCE` (integer) |
| `tag` | IN | message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | communicator (handle) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_Probe(source, tag, comm, status, ierror) BIND(C)
  INTEGER, INTENT(IN) :: source, tag
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PROBE(SOURCE, TAG, COMM, STATUS, IERROR)
  INTEGER SOURCE, TAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

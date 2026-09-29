---
title: MPI_IPROBE
c_name: MPI_Iprobe
lis_name: MPI_IPROBE
chapter: pt2pt
aliases: [MPI_IPROBE, MPI_Iprobe]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_IPROBE

**C**
```c
int MPI_Iprobe(int source, int tag, MPI_Comm comm, int *flag, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `source` | IN | rank of source or `MPI_ANY_SOURCE` (integer) |
| `tag` | IN | message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | communicator (handle) |
| `flag` | OUT | (logical) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_Iprobe(source, tag, comm, flag, status, ierror)
  INTEGER, INTENT(IN) :: source, tag
  TYPE(MPI_Comm), INTENT(IN) :: comm
  LOGICAL, INTENT(OUT) :: flag
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_IPROBE(SOURCE, TAG, COMM, FLAG, STATUS, IERROR)
  LOGICAL FLAG
  INTEGER SOURCE, TAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

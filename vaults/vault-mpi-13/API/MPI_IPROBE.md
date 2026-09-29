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
| `source` | IN | source rank, or MPI_ANY_SOURCE (integer) |
| `tag` | IN | tag value or MPI_ANY_TAG (integer) |
| `comm` | IN | communicator (handle) |
| `flag` | OUT | (logical) |
| `status` | OUT | status object (Status) |

**Fortran (mpif.h)**
```fortran
MPI_IPROBE(SOURCE, TAG, COMM, FLAG, STATUS, IERROR)
  LOGICAL FLAG
  INTEGER SOURCE, TAG, COMM, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

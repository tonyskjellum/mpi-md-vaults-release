---
title: MPI_MPROBE
c_name: MPI_Mprobe
lis_name: MPI_MPROBE
chapter: pt2pt
aliases: [MPI_MPROBE, MPI_Mprobe]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_MPROBE

**C**
```c
int MPI_Mprobe(int source, int tag, MPI_Comm comm, MPI_Message *message, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `source` | IN | rank of source or `MPI_ANY_SOURCE` (integer) |
| `tag` | IN | message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | communicator (handle) |
| `message` | OUT | returned message (handle) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_Mprobe(source, tag, comm, message, status, ierror) BIND(C)
  INTEGER, INTENT(IN) :: source, tag
  TYPE(MPI_Comm), INTENT(IN) :: comm
  TYPE(MPI_Message), INTENT(OUT) :: message
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_MPROBE(SOURCE, TAG, COMM, MESSAGE, STATUS, IERROR)
  INTEGER SOURCE, TAG, COMM, MESSAGE, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

---
title: MPI_IMPROBE
c_name: MPI_Improbe
lis_name: MPI_IMPROBE
chapter: pt2pt
aliases: [MPI_IMPROBE, MPI_Improbe]
tags: [mpi/function, mpi/pt2pt]
---

# MPI_IMPROBE

**C**
```c
int MPI_Improbe(int source, int tag, MPI_Comm comm, int *flag, MPI_Message *message, MPI_Status *status)
```

| Parameter | Intent | Description |
|---|---|---|
| `source` | IN | rank of source or `MPI_ANY_SOURCE` (integer) |
| `tag` | IN | message tag or `MPI_ANY_TAG` (integer) |
| `comm` | IN | communicator (handle) |
| `flag` | OUT | flag (logical) |
| `message` | OUT | returned message (handle) |
| `status` | OUT | status object (Status) |

**Fortran 2008**
```fortran
MPI_Improbe(source, tag, comm, flag, message, status, ierror) BIND(C)
  INTEGER, INTENT(IN) :: source, tag
  TYPE(MPI_Comm), INTENT(IN) :: comm
  INTEGER, INTENT(OUT) :: flag
  TYPE(MPI_Message), INTENT(OUT) :: message
  TYPE(MPI_Status) :: status
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_IMPROBE(SOURCE, TAG, COMM, FLAG, MESSAGE, STATUS, IERROR)
  INTEGER SOURCE, TAG, COMM, FLAG, MESSAGE, STATUS(MPI_STATUS_SIZE), IERROR
```


> [!info] Semantics
> See the chapter note [[pt2pt]] for the normative text.

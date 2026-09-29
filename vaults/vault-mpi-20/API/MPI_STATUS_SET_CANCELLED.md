---
title: MPI_STATUS_SET_CANCELLED
c_name: MPI_Status_set_cancelled
lis_name: MPI_STATUS_SET_CANCELLED
chapter: ei
aliases: [MPI_STATUS_SET_CANCELLED, MPI_Status_set_cancelled]
tags: [mpi/function, mpi/ei]
---

# MPI_STATUS_SET_CANCELLED

**C**
```c
int MPI_Status_set_cancelled(MPI_Status *status, int flag)
```

**C++**
```cpp
void MPI::Status::Set_cancelled(bool flag)
```

| Parameter | Intent | Description |
|---|---|---|
| `status` | INOUT | status to associate cancel flag with (Status) |
| `flag` | IN | if true indicates request was cancelled (logical) |

**Fortran (mpif.h)**
```fortran
MPI_STATUS_SET_CANCELLED(STATUS, FLAG, IERROR)
  INTEGER STATUS(MPI_STATUS_SIZE), IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

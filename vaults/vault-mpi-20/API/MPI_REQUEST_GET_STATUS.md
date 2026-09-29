---
title: MPI_REQUEST_GET_STATUS
c_name: MPI_Request_get_status
lis_name: MPI_REQUEST_GET_STATUS
chapter: misc
aliases: [MPI_REQUEST_GET_STATUS, MPI_Request_get_status]
tags: [mpi/function, mpi/misc]
---

# MPI_REQUEST_GET_STATUS

**C**
```c
int MPI_Request_get_status(MPI_Request request, int *flag, MPI_Status *status)
```

**C++**
```cpp
bool MPI::Request::Get_status(MPI::Status& status) const
bool MPI::Request::Get_status() const
```

| Parameter | Intent | Description |
|---|---|---|
| `request` | IN | request (handle) |
| `flag` | OUT | boolean flag, same as from `MPI_TEST` (logical) |
| `status` | OUT | `MPI_STATUS` object if flag is true (Status) |

**Fortran (mpif.h)**
```fortran
MPI_REQUEST_GET_STATUS( REQUEST, FLAG, STATUS, IERROR)
  INTEGER REQUEST, STATUS(MPI_STATUS_SIZE), IERROR
  LOGICAL FLAG
```


> [!info] Semantics
> See the chapter note [[misc]] for the normative text.

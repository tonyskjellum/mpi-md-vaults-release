---
title: MPI_COMM_DELETE_ATTR
c_name: MPI_Comm_delete_attr
lis_name: MPI_COMM_DELETE_ATTR
chapter: ei
aliases: [MPI_COMM_DELETE_ATTR, MPI_Comm_delete_attr]
tags: [mpi/function, mpi/ei]
---

# MPI_COMM_DELETE_ATTR

**C**
```c
int MPI_Comm_delete_attr(MPI_Comm comm, int comm_keyval)
```

**C++**
```cpp
void MPI::Comm::Delete_attr(int comm_keyval)
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | INOUT | communicator from which the attribute is deleted (handle) |
| `comm_keyval` | IN | key value (integer) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_DELETE_ATTR(COMM, COMM_KEYVAL, IERROR)
  INTEGER COMM, COMM_KEYVAL, IERROR
```


> [!info] Semantics
> See the chapter note [[ei]] for the normative text.

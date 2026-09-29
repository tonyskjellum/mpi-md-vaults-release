---
title: MPI_COMM_GROUP
c_name: MPI_Comm_group
lis_name: MPI_COMM_GROUP
chapter: context
aliases: [MPI_COMM_GROUP, MPI_Comm_group]
tags: [mpi/function, mpi/context]
---

# MPI_COMM_GROUP

**C**
```c
int MPI_Comm_group(MPI_Comm comm, MPI_Group *group)
```

**C++**
```cpp
MPI::Group MPI::Comm::Get_group() const
```

| Parameter | Intent | Description |
|---|---|---|
| `comm` | IN | communicator (handle) |
| `group` | OUT | group corresponding to `comm` (handle) |

**Fortran (mpif.h)**
```fortran
MPI_COMM_GROUP(COMM, GROUP, IERROR)
  INTEGER COMM, GROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

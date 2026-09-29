---
title: MPI_GROUP_SIZE
c_name: MPI_Group_size
lis_name: MPI_GROUP_SIZE
chapter: context
aliases: [MPI_GROUP_SIZE, MPI_Group_size]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_SIZE

**C**
```c
int MPI_Group_size(MPI_Group group, int *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group (handle) |
| `size` | OUT | number of processes in the group (integer) |

**Fortran 2008**
```fortran
MPI_Group_size(group, size, ierror) BIND(C)
  TYPE(MPI_Group), INTENT(IN) :: group
  INTEGER, INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GROUP_SIZE(GROUP, SIZE, IERROR)
  INTEGER GROUP, SIZE, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

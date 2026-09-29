---
title: MPI_GROUP_INTERSECTION
c_name: MPI_Group_intersection
lis_name: MPI_GROUP_INTERSECTION
chapter: context
aliases: [MPI_GROUP_INTERSECTION, MPI_Group_intersection]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_INTERSECTION

**C**
```c
int MPI_Group_intersection(MPI_Group group1, MPI_Group group2, MPI_Group *newgroup)
```

| Parameter | Intent | Description |
|---|---|---|
| `group1` | IN | first group (handle) |
| `group2` | IN | second group (handle) |
| `newgroup` | OUT | intersection group (handle) |

**Fortran (mpif.h)**
```fortran
MPI_GROUP_INTERSECTION(GROUP1, GROUP2, NEWGROUP, IERROR)
  INTEGER GROUP1, GROUP2, NEWGROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

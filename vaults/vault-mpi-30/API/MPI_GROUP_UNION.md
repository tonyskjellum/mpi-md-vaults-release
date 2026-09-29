---
title: MPI_GROUP_UNION
c_name: MPI_Group_union
lis_name: MPI_GROUP_UNION
chapter: context
aliases: [MPI_GROUP_UNION, MPI_Group_union]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_UNION

**C**
```c
int MPI_Group_union(MPI_Group group1, MPI_Group group2, MPI_Group *newgroup)
```

| Parameter | Intent | Description |
|---|---|---|
| `group1` | IN | first group (handle) |
| `group2` | IN | second group (handle) |
| `newgroup` | OUT | union group (handle) |

**Fortran 2008**
```fortran
MPI_Group_union(group1, group2, newgroup, ierror) BIND(C)
  TYPE(MPI_Group), INTENT(IN) :: group1, group2
  TYPE(MPI_Group), INTENT(OUT) :: newgroup
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GROUP_UNION(GROUP1, GROUP2, NEWGROUP, IERROR)
  INTEGER GROUP1, GROUP2, NEWGROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

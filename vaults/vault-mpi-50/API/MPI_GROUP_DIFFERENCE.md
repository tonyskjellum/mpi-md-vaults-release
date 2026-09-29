---
title: MPI_GROUP_DIFFERENCE
c_name: MPI_Group_difference
lis_name: MPI_GROUP_DIFFERENCE
chapter: context
aliases: [MPI_GROUP_DIFFERENCE, MPI_Group_difference]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_DIFFERENCE

**C**
```c
int MPI_Group_difference(MPI_Group group1, MPI_Group group2, MPI_Group *newgroup)
```

| Parameter | Intent | Description |
|---|---|---|
| `group1` | IN | first group (handle) |
| `group2` | IN | second group (handle) |
| `newgroup` | OUT | difference group (handle) |

**Fortran 2008**
```fortran
MPI_Group_difference(group1, group2, newgroup, ierror)
  TYPE(MPI_Group), INTENT(IN) :: group1, group2
  TYPE(MPI_Group), INTENT(OUT) :: newgroup
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GROUP_DIFFERENCE(GROUP1, GROUP2, NEWGROUP, IERROR)
  INTEGER GROUP1, GROUP2, NEWGROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

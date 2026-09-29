---
title: MPI_GROUP_RANGE_INCL
c_name: MPI_Group_range_incl
lis_name: MPI_GROUP_RANGE_INCL
chapter: context
aliases: [MPI_GROUP_RANGE_INCL, MPI_Group_range_incl]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_RANGE_INCL

**C**
```c
int MPI_Group_range_incl(MPI_Group group, int n, int ranges[][3], MPI_Group *newgroup)
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group (handle) |
| `n` | IN | number of triplets in array `ranges` (integer) |
| `ranges` | IN | a one-dimensional array of integer triplets, of the form (first rank, last rank, stride) indicating ranks in `group` of processes to be included in `newgroup` |
| `newgroup` | OUT | new group derived from above, in the order defined by `ranges` (handle) |

**Fortran 2008**
```fortran
MPI_Group_range_incl(group, n, ranges, newgroup, ierror) BIND(C)
  TYPE(MPI_Group), INTENT(IN) :: group
  INTEGER, INTENT(IN) :: n, ranges(3,n)
  TYPE(MPI_Group), INTENT(OUT) :: newgroup
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GROUP_RANGE_INCL(GROUP, N, RANGES, NEWGROUP, IERROR)
  INTEGER GROUP, N, RANGES(3,*), NEWGROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

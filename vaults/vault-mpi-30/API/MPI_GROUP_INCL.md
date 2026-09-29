---
title: MPI_GROUP_INCL
c_name: MPI_Group_incl
lis_name: MPI_GROUP_INCL
chapter: context
aliases: [MPI_GROUP_INCL, MPI_Group_incl]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_INCL

**C**
```c
int MPI_Group_incl(MPI_Group group, int n, const int ranks[], MPI_Group *newgroup)
```

| Parameter | Intent | Description |
|---|---|---|
| `group` | IN | group (handle) |
| `n` | IN | number of elements in array ranks (and size of `newgroup`) (integer) |
| `ranks` | IN | ranks of processes in `group` to appear in `newgroup` (array of integers) |
| `newgroup` | OUT | new group derived from above, in the order defined by ` ranks` (handle) |

**Fortran 2008**
```fortran
MPI_Group_incl(group, n, ranks, newgroup, ierror) BIND(C)
  TYPE(MPI_Group), INTENT(IN) :: group
  INTEGER, INTENT(IN) :: n, ranks(n)
  TYPE(MPI_Group), INTENT(OUT) :: newgroup
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GROUP_INCL(GROUP, N, RANKS, NEWGROUP, IERROR)
  INTEGER GROUP, N, RANKS(*), NEWGROUP, IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

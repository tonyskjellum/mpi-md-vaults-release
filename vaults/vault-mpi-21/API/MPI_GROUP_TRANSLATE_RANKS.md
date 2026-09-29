---
title: MPI_GROUP_TRANSLATE_RANKS
c_name: MPI_Group_translate_ranks
lis_name: MPI_GROUP_TRANSLATE_RANKS
chapter: context
aliases: [MPI_GROUP_TRANSLATE_RANKS, MPI_Group_translate_ranks]
tags: [mpi/function, mpi/context]
---

# MPI_GROUP_TRANSLATE_RANKS

**C**
```c
int MPI_Group_translate_ranks (MPI_Group group1, int n, int *ranks1, MPI_Group group2, int *ranks2)
```

**C++**
```cpp
static void MPI::Group::Translate_ranks (const MPI::Group& group1, int n, const int ranks1[], const MPI::Group& group2, int ranks2[])
```

| Parameter | Intent | Description |
|---|---|---|
| `group1` | IN | group1 (handle) |
| `n` | IN | number of ranks in ` ranks1` and `ranks2` arrays (integer) |
| `ranks1` | IN | array of zero or more valid ranks in group1 |
| `group2` | IN | group2 (handle) |
| `ranks2` | OUT | array of corresponding ranks in group2, MPI_UNDEFINED when no correspondence exists. |

**Fortran (mpif.h)**
```fortran
MPI_GROUP_TRANSLATE_RANKS(GROUP1, N, RANKS1, GROUP2, RANKS2, IERROR)
  INTEGER GROUP1, N, RANKS1(*), GROUP2, RANKS2(*), IERROR
```


> [!info] Semantics
> See the chapter note [[context]] for the normative text.

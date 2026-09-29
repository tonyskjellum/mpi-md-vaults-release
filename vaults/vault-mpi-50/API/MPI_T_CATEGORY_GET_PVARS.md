---
title: MPI_T_CATEGORY_GET_PVARS
c_name: MPI_T_category_get_pvars
lis_name: MPI_T_CATEGORY_GET_PVARS
chapter: tools
aliases: [MPI_T_CATEGORY_GET_PVARS, MPI_T_category_get_pvars]
tags: [mpi/function, mpi/tools]
---

# MPI_T_CATEGORY_GET_PVARS

**C**
```c
int MPI_T_category_get_pvars(int cat_index, int len, int indices[])
```

| Parameter | Intent | Description |
|---|---|---|
| `cat_index` | IN | index of the category to be queried, in the range from $0$ to $`num_cat`-1$ (integer) |
| `len` | IN | the length of the indices array (integer) |
| `indices` | OUT | an integer array of size `len`, indicating performance variable indices (array of integers) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

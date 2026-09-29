---
title: MPI_T_CATEGORY_GET_CVARS
c_name: MPI_T_category_get_cvars
lis_name: MPI_T_CATEGORY_GET_CVARS
chapter: tools
aliases: [MPI_T_CATEGORY_GET_CVARS, MPI_T_category_get_cvars]
tags: [mpi/function, mpi/tools]
---

# MPI_T_CATEGORY_GET_CVARS

**C**
```c
int MPI_T_category_get_cvars(int cat_index, int len, int indices[])
```

| Parameter | Intent | Description |
|---|---|---|
| `cat_index` | IN | index of the category to be queried, in the range $[0,N-1]$ (integer) |
| `len` | IN | the length of the indices array (integer) |
| `indices` | OUT | an integer array of size `len`, indicating control variable indices (array of integers) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

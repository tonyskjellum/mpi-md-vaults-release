---
title: MPI_T_CATEGORY_GET_EVENTS
c_name: MPI_T_category_get_events
lis_name: MPI_T_CATEGORY_GET_EVENTS
chapter: tools
aliases: [MPI_T_CATEGORY_GET_EVENTS, MPI_T_category_get_events]
tags: [mpi/function, mpi/tools]
---

# MPI_T_CATEGORY_GET_EVENTS

**C**
```c
int MPI_T_category_get_events(int cat_index, int len, int indices[])
```

| Parameter | Intent | Description |
|---|---|---|
| `cat_index` | IN | index of the category to be queried, in the range from $0$ to $`num_cat`-1$ (integer) |
| `len` | IN | the length of the indices array (integer) |
| `indices` | OUT | an integer array of size `len`, indicating event type indices (array of integers) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

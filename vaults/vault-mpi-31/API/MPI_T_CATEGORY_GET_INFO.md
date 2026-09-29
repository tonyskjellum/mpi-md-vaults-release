---
title: MPI_T_CATEGORY_GET_INFO
c_name: MPI_T_category_get_info
lis_name: MPI_T_CATEGORY_GET_INFO
chapter: tools
aliases: [MPI_T_CATEGORY_GET_INFO, MPI_T_category_get_info]
tags: [mpi/function, mpi/tools]
---

# MPI_T_CATEGORY_GET_INFO

**C**
```c
int MPI_T_category_get_info(int cat_index, char *name, int *name_len, char *desc, int *desc_len, int *num_cvars, int *num_pvars, int *num_categories)
```

| Parameter | Intent | Description |
|---|---|---|
| `cat_index` | IN | index of the category to be queried (integer) |
| `name` | OUT | buffer to return the string containing the name of the category (string) |
| `{name}_len` | INOUT | length of the string and/or buffer for `name` (integer) |
| `desc` | OUT | buffer to return the string containing the description of the category (string) |
| `{desc}_len` | INOUT | length of the string and/or buffer for `desc` (integer) |
| `num_cvars` | OUT | number of control variables in the category (integer) |
| `num_pvars` | OUT | number of performance variables in the category (integer) |
| `num_categories` | OUT | number of categories contained in the category (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

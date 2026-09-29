---
title: MPI_T_CATEGORY_GET_NUM_EVENTS
c_name: MPI_T_category_get_num_events
lis_name: MPI_T_CATEGORY_GET_NUM_EVENTS
chapter: tools
aliases: [MPI_T_CATEGORY_GET_NUM_EVENTS, MPI_T_category_get_num_events]
tags: [mpi/function, mpi/tools]
---

# MPI_T_CATEGORY_GET_NUM_EVENTS

**C**
```c
int MPI_T_category_get_num_events(int cat_index, int *num_events)
```

| Parameter | Intent | Description |
|---|---|---|
| `cat_index` | IN | index of the category to be queried (integer) |
| `num_events` | OUT | number of event types in the category (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

---
title: MPI_T_EVENT_GET_INFO
c_name: MPI_T_event_get_info
lis_name: MPI_T_EVENT_GET_INFO
chapter: tools
aliases: [MPI_T_EVENT_GET_INFO, MPI_T_event_get_info]
tags: [mpi/function, mpi/tools]
---

# MPI_T_EVENT_GET_INFO

**C**
```c
int MPI_T_event_get_info(int event_index, char *name, int *name_len, int *verbosity, MPI_Datatype array_of_datatypes[], MPI_Aint array_of_displacements[], int *num_elements, MPI_T_enum *enumtype, MPI_Info *info, char *desc, int *desc_len, int *bind)
```

| Parameter | Intent | Description |
|---|---|---|
| `event_index` | IN | index of the event type to be queried between $0$ and $`num_events`-1$ (integer) |
| `name` | OUT | buffer to return the string containing the name of the event type (string) |
| `name_len` | INOUT | length of the string and/or buffer for `name` (integer) |
| `verbosity` | OUT | verbosity level of this event type (integer) |
| `array_of_datatypes` | OUT | array of MPI basic datatypes used to encode the event data (array of handles) |
| `array_of_displacements` | OUT | array of byte displacements of the elements in the event buffer (array of non-negative integers) |
| `num_elements` | INOUT | length of `array_of_datatypes` and `array_of_displacements` arrays (non-negative integer) |
| `enumtype` | OUT | optional descriptor for enumeration information (handle) |
| `info` | OUT | optional info object (handle) |
| `desc` | OUT | buffer to return the string containing a description of the event type (string) |
| `desc_len` | INOUT | length of the string and/or buffer for `desc` (integer) |
| `bind` | OUT | type of MPI object to which an event of this type must be bound (integer) |


> [!info] Semantics
> See the chapter note [[tools]] for the normative text.

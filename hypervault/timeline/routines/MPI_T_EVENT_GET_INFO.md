---
title: MPI_T_EVENT_GET_INFO
c_name: MPI_T_event_get_info
chapter: tools
introduced: "MPI-4.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_T_EVENT_GET_INFO, MPI_T_event_get_info]
tags: [mpi/routine, mpi/tools]
---

# MPI_T_EVENT_GET_INFO

**Introduced** in MPI-4.0.

Releases: [[versions/v40/API/MPI_T_EVENT_GET_INFO|MPI-4.0]] · [[versions/v41/API/MPI_T_EVENT_GET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_T_EVENT_GET_INFO|MPI-5.0]] Δ

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-4.0–MPI-5.0**
```c
int MPI_T_event_get_info(int event_index, char *name, int *name_len, int *verbosity, MPI_Datatype array_of_datatypes[], MPI_Aint array_of_displacements[], int *num_elements, MPI_T_enum *enumtype, MPI_Info *info, char *desc, int *desc_len, int *bind)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `event_index` | IN | **MPI-4.0–MPI-5.0:** index of the event type to be queried between $0$ and $`num_events`-1$ (integer) |
| `name` | OUT | **MPI-4.0–MPI-5.0:** buffer to return the string containing the name of the event type (string) |
| `name_len` | INOUT | **MPI-4.0–MPI-5.0:** length of the string and/or buffer for `name` (integer) |
| `verbosity` | OUT | **MPI-4.0–MPI-5.0:** verbosity level of this event type (integer) |
| `array_of_datatypes` | OUT | **MPI-4.0–MPI-5.0:** array of MPI basic datatypes used to encode the event data (array of handles) |
| `array_of_displacements` | OUT | **MPI-4.0–MPI-4.1:** array of byte displacements of the elements in the event buffer (array of non-negative integers)<br>**MPI-5.0:** array of byte displacements of the elements in the event buffer (array of nonnegative integers) |
| `num_elements` | INOUT | **MPI-4.0–MPI-4.1:** length of `array_of_datatypes` and `array_of_displacements` arrays (non-negative integer)<br>**MPI-5.0:** length of `array_of_datatypes` and `array_of_displacements` arrays (nonnegative integer) |
| `enumtype` | OUT | **MPI-4.0–MPI-5.0:** optional descriptor for enumeration information (handle) |
| `info` | OUT | **MPI-4.0–MPI-5.0:** optional info object (handle) |
| `desc` | OUT | **MPI-4.0–MPI-5.0:** buffer to return the string containing a description of the event type (string) |
| `desc_len` | INOUT | **MPI-4.0–MPI-5.0:** length of the string and/or buffer for `desc` (integer) |
| `bind` | OUT | **MPI-4.0–MPI-5.0:** type of MPI object to which an event of this type must be bound (integer) |

## Per-release notes

- MPI-4.0: [[versions/v40/API/MPI_T_EVENT_GET_INFO|API note]] · chapter [[versions/v40/sections/tools|tools]]
- MPI-4.1: [[versions/v41/API/MPI_T_EVENT_GET_INFO|API note]] · chapter [[versions/v41/sections/tools|tools]]
- MPI-5.0: [[versions/v50/API/MPI_T_EVENT_GET_INFO|API note]] · chapter [[versions/v50/sections/tools|tools]]

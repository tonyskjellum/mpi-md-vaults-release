---
title: "Compare and Swap Function"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/one-side]
---

# Compare and Swap Function

Chapter **one-side** · in [[versions/v30/sections/one-side#Compare and Swap Function|MPI-3.0]], [[versions/v31/sections/one-side#Compare and Swap Function|MPI-3.1]], [[versions/v40/sections/one-side#Compare and Swap Function|MPI-4.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

This function compares one element of type `datatype` in the compare buffer `compare_addr` with the buffer at offset `target_disp` in the target window specified by `target_rank` and `win` and replaces the value at the target with the value in the origin buffer `origin_addr` if the compare buffer and the target buffer are identical. The original value at the target is returned in the buffer `result_addr`. The parameter `datatype` must belong to one of the following categories of predefined datatypes: C integer, Fortran integer, Logical, Multi-language types, or Byte as specified in ~~Section [[coll-predefined-op]] on page~~ [[coll-predefined-op]] . The origin and result buffers (`origin_addr` and `result_addr`) must be disjoint.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Compare and Swap Function]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Compare and Swap Function]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Compare and Swap Function]]

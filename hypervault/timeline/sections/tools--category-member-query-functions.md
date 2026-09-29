---
title: "Category Member Query Functions"
chapter: tools
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Category Member Query Functions

Chapter **tools** · in [[versions/v40/sections/tools#Category Member Query Functions|MPI-4.0]], [[versions/v41/sections/tools#Category Member Query Functions|MPI-4.1]], [[versions/v50/sections/tools#Category Member Query Functions|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

If two calls to this routine return the same update number, it is guaranteed that the category information has not changed between the two calls. If the update number retrieved from the second call is higher, then some categories have been added or expanded. ==If the number of changes to categories exceeds the limit of `update_number`, an implementation shall set `update_number` to the maximum possible value for the type of `update_number`.==

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Category Member Query Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Category Member Query Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Category Member Query Functions]]

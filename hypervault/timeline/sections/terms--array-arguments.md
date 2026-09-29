---
title: "Array Arguments"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Array Arguments

Chapter **terms** · in [[versions/v13/sections/terms#Array arguments|MPI-1.3]], [[versions/v20/sections/terms#Array Arguments|MPI-2.0]], [[versions/v21/sections/terms#Array Arguments|MPI-2.1]], [[versions/v22/sections/terms#Array Arguments|MPI-2.2]], [[versions/v30/sections/terms#Array Arguments|MPI-3.0]], [[versions/v31/sections/terms#Array Arguments|MPI-3.1]], [[versions/v40/sections/terms#Array Arguments|MPI-4.0]], [[versions/v41/sections/terms#Array Arguments|MPI-4.1]], [[versions/v50/sections/terms#Array Arguments|MPI-5.0]]

Heading by release: MPI-1.3: “Array arguments”; MPI-2.0: “Array Arguments”; MPI-2.1: “Array Arguments”; MPI-2.2: “Array Arguments”; MPI-3.0: “Array Arguments”; MPI-3.1: “Array Arguments”; MPI-4.0: “Array Arguments”; MPI-4.1: “Array Arguments”; MPI-5.0: “Array Arguments”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

An MPI call may need an argument that is an array of opaque objects, or an array of handles. The array-of-handles is a regular array with entries that are handles to objects of the same type in consecutive locations in the array. Whenever such an array is used, an additional `len` argument is required to indicate the number of valid entries (unless this number can be derived otherwise). The valid entries are at the ~~begining~~ ==beginning== of the array; `len` indicates how many of them there are, and need not be the ~~entire~~ size of the ==entire== array. The same approach is followed for other array arguments. ==In some cases `NULL` handles are considered valid entries. When a `NULL` argument is desired for an array of statuses, one uses MPI_STATUSES_IGNORE.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

An MPI call may need an argument that is an array of opaque objects, or an array of handles. The array-of-handles is a regular array with entries that are handles to objects of the same type in consecutive locations in the array. Whenever such an array is used, an additional `len` argument is required to indicate the number of valid entries (unless this number can be derived otherwise). The valid entries are at the beginning of the array; `len` indicates how many of them there are, and need not be the size of the entire array. The same approach is followed for other array arguments. In some cases `NULL` handles are considered valid entries. When a `NULL` argument is desired for an array of statuses, one uses ~~MPI_STATUSES_IGNORE.~~ ==`MPI_STATUSES_IGNORE`.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Array arguments]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Array Arguments]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Array Arguments]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Array Arguments]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Array Arguments]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Array Arguments]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Array Arguments]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Array Arguments]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Array Arguments]]

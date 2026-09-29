---
title: "Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/io]
---

# Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$

Chapter **io** · in [[versions/v20/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$|MPI-2.0]], [[versions/v21/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$|MPI-2.1]], [[versions/v22/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$|MPI-2.2]], [[versions/v30/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$|MPI-3.0]], [[versions/v31/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$|MPI-3.1]], [[versions/v40/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$|MPI-4.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~Assume $`A_1`$ is a data access operation using $`fh_{1a}`$, and $`A_2`$ is a data access operation using $`fh_{1b}`$.~~

~~If for any access $`A_1`$, there is no access $`A_2`$ that conflicts with $`A_1`$, then MPI guarantees sequential consistency.~~

~~However, unlike POSIX semantics, the default MPI semantics~~

~~for conflicting accesses do not guarantee sequential consistency. If $`A_1`$ and $`A_2`$ conflict,~~

~~sequential consistency can be guaranteed by either enabling atomic mode via the `MPI_FILE_SET_ATOMICITY` routine, or meeting the~~

~~condition~~

~~described in Case 3 below.~~

==Assume $`A_1`$ is a data access operation using $`fh_{1a}`$, and $`A_2`$ is a data access operation using $`fh_{1b}`$. If for any access $`A_1`$, there is no access $`A_2`$ that conflicts with $`A_1`$, then MPI guarantees sequential consistency.==

==However, unlike POSIX semantics, the default MPI semantics for conflicting accesses do not guarantee sequential consistency. If $`A_1`$ and $`A_2`$ conflict, sequential consistency can be guaranteed by either enabling atomic mode via the `MPI_FILE_SET_ATOMICITY` routine, or meeting the condition described in Case 3 below.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

However, unlike POSIX semantics, the default MPI semantics for conflicting accesses do not guarantee sequential consistency. If $`A_1`$ and $`A_2`$ conflict, sequential consistency can be guaranteed by either enabling atomic mode via the ~~`MPI_FILE_SET_ATOMICITY`~~ ==[[versions/v31/API/MPI_FILE_SET_ATOMICITY|MPI_FILE_SET_ATOMICITY]]== routine, or meeting the condition described in Case 3 below.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$]]

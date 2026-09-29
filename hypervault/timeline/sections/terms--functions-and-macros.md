---
title: "Functions and Macros"
chapter: terms
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Functions and Macros

Chapter **terms** · in [[versions/v21/sections/terms#Functions and Macros|MPI-2.1]], [[versions/v22/sections/terms#Functions and Macros|MPI-2.2]], [[versions/v30/sections/terms#Functions and Macros|MPI-3.0]], [[versions/v31/sections/terms#Functions and Macros|MPI-3.1]], [[versions/v40/sections/terms#Functions and Macros|MPI-4.0]], [[versions/v41/sections/terms#Functions and Macros|MPI-4.1]], [[versions/v50/sections/terms#Functions and Macros|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

An implementation is allowed to implement [[versions/v31/API/MPI_WTIME|MPI_WTIME]] , ==[[PMPI_WTIME]] ,== [[versions/v31/API/MPI_WTICK|MPI_WTICK]] , ~~[[PMPI_WTIME]]~~ ==[[PMPI_WTICK]]== , ~~[[PMPI_WTICK]]~~ ==[[versions/v31/API/MPI_AINT_ADD|MPI_AINT_ADD]] , [[PMPI_AINT_ADD]] , [[versions/v31/API/MPI_AINT_DIFF|MPI_AINT_DIFF]] , [[PMPI_AINT_DIFF]]== , and the handle-conversion functions (`MPI_Group_f2c`, etc.) in Section [[versions/v31/sections/binding#Transfer of Handles|Transfer of Handles]] , and no others, as macros in C.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

An implementation is allowed to implement ~~[[versions/v41/API/MPI_WTIME|MPI_WTIME]] , [[PMPI_WTIME]] , [[versions/v41/API/MPI_WTICK|MPI_WTICK]] , [[PMPI_WTICK]] ,~~ [[versions/v41/API/MPI_AINT_ADD|MPI_AINT_ADD]] , [[PMPI_AINT_ADD]] , [[versions/v41/API/MPI_AINT_DIFF|MPI_AINT_DIFF]] , ==and== [[PMPI_AINT_DIFF]] ~~, and the handle-conversion functions (`MPI_Group_f2c`, etc.) in Section [[versions/v41/sections/binding#Transfer of Handles|Transfer of Handles]]~~ , and no others, as macros in C.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Functions and Macros]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Functions and Macros]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Functions and Macros]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Functions and Macros]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Functions and Macros]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Functions and Macros]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Functions and Macros]]

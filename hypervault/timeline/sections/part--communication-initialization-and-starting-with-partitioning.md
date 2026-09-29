---
title: "Communication Initialization and Starting with Partitioning"
chapter: part
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/part]
---

# Communication Initialization and Starting with Partitioning

Chapter **part** · in [[versions/v40/sections/part#Communication Initialization and Starting with Partitioning|MPI-4.0]], [[versions/v41/sections/part#Communication Initialization and Starting with Partitioning|MPI-4.1]], [[versions/v50/sections/part#Communication Initialization and Starting with Partitioning|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

> The ~~info~~ ==`info`== argument is provided in order to support per-operation implementation-/defined info keys.

> Unlike [[versions/v50/API/MPI_RECV_INIT|MPI_RECV_INIT]] , [[versions/v50/API/MPI_PRECV_INIT|MPI_PRECV_INIT]] may communicate. Also unlike [[versions/v50/API/MPI_RECV_INIT|MPI_RECV_INIT]] , [[versions/v50/API/MPI_PRECV_INIT|MPI_PRECV_INIT]] takes an ~~info~~ ==`info`== argument.

~~A call to [[versions/v50/API/MPI_PREADY_LIST|MPI_PREADY_LIST]] has the same effect as calls to [[versions/v50/API/MPI_PREADY|MPI_PREADY]] , executed for the partitions specified in the range $`array_of_partitions[0]`$` ,`$`...`$`, `$`array_of_partitions[count-1]`$ of the `array_of_partitions`, executed in some arbitrary order. Calls to [[versions/v50/API/MPI_PREADY_LIST|MPI_PREADY_LIST]] follow the same rules as those for [[versions/v50/API/MPI_PREADY|MPI_PREADY]] calls.~~

==A call to [[versions/v50/API/MPI_PREADY_LIST|MPI_PREADY_LIST]] has the same effect as calls to [[versions/v50/API/MPI_PREADY|MPI_PREADY]] , executed for the partitions specified by the elements ``` math \texttt{$array_of_partitions[0]$ ,$...$, $array_of_partitions[count-1]$} ```==

==of the `array_of_partitions`, executed in some arbitrary order. Calls to [[versions/v50/API/MPI_PREADY_LIST|MPI_PREADY_LIST]] follow the same rules as those for [[versions/v50/API/MPI_PREADY|MPI_PREADY]] calls.==

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/part#Communication Initialization and Starting with Partitioning]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/part#Communication Initialization and Starting with Partitioning]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/part#Communication Initialization and Starting with Partitioning]]

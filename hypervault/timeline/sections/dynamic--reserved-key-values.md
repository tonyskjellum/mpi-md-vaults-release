---
title: "Reserved Key Values"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Reserved Key Values

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Reserved Key Values|MPI-2.0]], [[versions/v21/sections/dynamic#Reserved Key Values|MPI-2.1]], [[versions/v22/sections/dynamic#Reserved Key Values|MPI-2.2]], [[versions/v30/sections/dynamic#Reserved Key Values|MPI-3.0]], [[versions/v31/sections/dynamic#Reserved Key Values|MPI-3.1]], [[versions/v40/sections/dynamic#Reserved Key Values|MPI-4.0]], [[versions/v41/sections/dynamic#Reserved Key Values|MPI-4.1]], [[versions/v50/sections/dynamic#Reserved Key Values|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The following key values are reserved. An implementation is not required to~~

~~interpret these key values, but if it does interpret the key value, it must provide the functionality described.~~

==The following key values are reserved. An implementation is not required to interpret these key values, but if it does interpret the key value, it must provide the functionality described.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~`ip_port`~~ ==`ip_port`:== Value contains IP port number at which to establish a `port`. (Reserved for [[versions/v41/API/MPI_OPEN_PORT|MPI_OPEN_PORT]] only).

~~`ip_address`~~ ==`ip_address`:== Value contains IP address at which to establish a `port`. If the address is not a valid IP address of the host on which the [[versions/v41/API/MPI_OPEN_PORT|MPI_OPEN_PORT]] call is made, the results are undefined. (Reserved for [[versions/v41/API/MPI_OPEN_PORT|MPI_OPEN_PORT]] only).

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

==`ip_address`:   Value contains IP address at which to establish a `port`. If the address is not a valid IP address of the host on which the [[versions/v50/API/MPI_OPEN_PORT|MPI_OPEN_PORT]] call is made, the results are undefined. (Reserved for [[versions/v50/API/MPI_OPEN_PORT|MPI_OPEN_PORT]] only).==

~~`ip_address`:   Value contains IP address at which to establish a `port`. If the address is not a valid IP address of the host on which the [[versions/v50/API/MPI_OPEN_PORT|MPI_OPEN_PORT]] call is made, the results are undefined. (Reserved for [[versions/v50/API/MPI_OPEN_PORT|MPI_OPEN_PORT]] only).~~

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Reserved Key Values]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Reserved Key Values]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Reserved Key Values]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Reserved Key Values]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Reserved Key Values]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Reserved Key Values]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Reserved Key Values]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Reserved Key Values]]

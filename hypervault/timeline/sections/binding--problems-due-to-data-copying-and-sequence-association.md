---
title: "Problems Due to Data Copying and Sequence Association"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Problems Due to Data Copying and Sequence Association

Chapter **binding** · in [[versions/v20/sections/binding#Problems Due to Data Copying and Sequence Association|MPI-2.0]], [[versions/v21/sections/binding#Problems Due to Data Copying and Sequence Association|MPI-2.1]], [[versions/v22/sections/binding#Problems Due to Data Copying and Sequence Association|MPI-2.2]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

Because MPI dummy buffer arguments are assumed-size arrays, this leads to a serious problem for a ~~non-blocking~~ ==nonblocking== call: the compiler copies the temporary array back on return but MPI continues to copy data to the memory that held it. For example, consider the following code fragment:

[[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] , or any ~~non-blocking~~ ==nonblocking== MPI routine. If a

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Problems Due to Data Copying and Sequence Association]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Problems Due to Data Copying and Sequence Association]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Problems Due to Data Copying and Sequence Association]]

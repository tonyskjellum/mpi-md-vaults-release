---
title: MPI_GET_ADDRESS
c_name: MPI_Get_address
lis_name: MPI_GET_ADDRESS
chapter: datatypes
aliases: [MPI_GET_ADDRESS, MPI_Get_address]
tags: [mpi/function, mpi/datatypes]
---

# MPI_GET_ADDRESS

**C**
```c
int MPI_Get_address(void *location, MPI_Aint *address)
```

**C++**
```cpp
MPI::Aint MPI::Get_address(void* location)
```

| Parameter | Intent | Description |
|---|---|---|
| `location` | IN | location in caller memory (choice) |
| `address` | OUT | address of location (integer) |

**Fortran (mpif.h)**
```fortran
MPI_GET_ADDRESS(LOCATION, ADDRESS, IERROR)
  <type> LOCATION(*)
  INTEGER IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) ADDRESS
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.

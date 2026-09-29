---
title: MPI_ADDRESS
c_name: MPI_Address
lis_name: MPI_ADDRESS
chapter: deprecated
aliases: [MPI_ADDRESS, MPI_Address]
tags: [mpi/function, mpi/deprecated]
---

# MPI_ADDRESS

**C**
```c
int MPI_Address(void* location, MPI_Aint *address)
```

| Parameter | Intent | Description |
|---|---|---|
| `location` | IN | location in caller memory (choice) |
| `address` | OUT | address of location (integer) |

**Fortran (mpif.h)**
```fortran
MPI_ADDRESS(LOCATION, ADDRESS, IERROR)
  <type> LOCATION(*)
  INTEGER ADDRESS, IERROR
```


> [!info] Semantics
> See the chapter note [[deprecated]] for the normative text.

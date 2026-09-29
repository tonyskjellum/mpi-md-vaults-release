---
title: MPI_ABI_GET_VERSION
c_name: MPI_Abi_get_version
lis_name: MPI_ABI_GET_VERSION
chapter: abi
aliases: [MPI_ABI_GET_VERSION, MPI_Abi_get_version]
tags: [mpi/function, mpi/abi]
---

# MPI_ABI_GET_VERSION

**C**
```c
int MPI_Abi_get_version(int *abi_major, int *abi_minor)
```

| Parameter | Intent | Description |
|---|---|---|
| `abi_major` | OUT | ABI major version (integer) |
| `abi_minor` | OUT | ABI minor version (integer) |

**Fortran 2008**
```fortran
MPI_Abi_get_version(abi_major, abi_minor, ierror)
  INTEGER, INTENT(OUT) :: abi_major, abi_minor
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ABI_GET_VERSION(ABI_MAJOR, ABI_MINOR, IERROR)
  INTEGER ABI_MAJOR, ABI_MINOR, IERROR
```


> [!info] Semantics
> See the chapter note [[abi]] for the normative text.

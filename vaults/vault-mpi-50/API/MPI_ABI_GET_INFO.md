---
title: MPI_ABI_GET_INFO
c_name: MPI_Abi_get_info
lis_name: MPI_ABI_GET_INFO
chapter: abi
aliases: [MPI_ABI_GET_INFO, MPI_Abi_get_info]
tags: [mpi/function, mpi/abi]
---

# MPI_ABI_GET_INFO

**C**
```c
int MPI_Abi_get_info(MPI_Info *info)
```

| Parameter | Intent | Description |
|---|---|---|
| `info` | OUT | ABI details info object (implementation-defined) (handle) |

**Fortran 2008**
```fortran
MPI_Abi_get_info(info, ierror)
  TYPE(MPI_Info), INTENT(OUT) :: info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_ABI_GET_INFO(INFO, IERROR)
  INTEGER INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[abi]] for the normative text.

---
title: MPI_GET_HW_RESOURCE_INFO
c_name: MPI_Get_hw_resource_info
lis_name: MPI_GET_HW_RESOURCE_INFO
chapter: inquiry
aliases: [MPI_GET_HW_RESOURCE_INFO, MPI_Get_hw_resource_info]
tags: [mpi/function, mpi/inquiry]
---

# MPI_GET_HW_RESOURCE_INFO

**C**
```c
int MPI_Get_hw_resource_info(MPI_Info *hw_info)
```

| Parameter | Intent | Description |
|---|---|---|
| `hw_info` | OUT | info object created (handle) |

**Fortran 2008**
```fortran
MPI_Get_hw_resource_info(hw_info, ierror)
  TYPE(MPI_Info), INTENT(OUT) :: hw_info
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_GET_HW_RESOURCE_INFO(HW_INFO, IERROR)
  INTEGER HW_INFO, IERROR
```


> [!info] Semantics
> See the chapter note [[inquiry]] for the normative text.

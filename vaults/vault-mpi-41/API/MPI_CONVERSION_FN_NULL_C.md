---
title: MPI_CONVERSION_FN_NULL_C
c_name: MPI_CONVERSION_FN_NULL_C
lis_name: MPI_CONVERSION_FN_NULL_C
chapter: appLang-C
aliases: [MPI_CONVERSION_FN_NULL_C]
tags: [mpi/function, mpi/appLang-C]
---

# MPI_CONVERSION_FN_NULL_C

**C**
```c
int MPI_CONVERSION_FN_NULL_C(void *userbuf, MPI_Datatype datatype, MPI_Count count, void *filebuf, MPI_Offset position, void *extra_state)
```



**Fortran 2008**
```fortran
MPI_CONVERSION_FN_NULL_C(userbuf, datatype, count, filebuf, position, extra_state, ierror) !(_c)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  TYPE(C_PTR), VALUE :: userbuf, filebuf
  TYPE(MPI_Datatype) :: datatype
  INTEGER(KIND=MPI_COUNT_KIND) :: count
  INTEGER(KIND=MPI_OFFSET_KIND) :: position
  INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state
  INTEGER :: ierror
```


> [!info] Semantics
> See the chapter note [[appLang-C]] for the normative text.

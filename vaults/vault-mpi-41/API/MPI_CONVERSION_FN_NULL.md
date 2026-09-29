---
title: MPI_CONVERSION_FN_NULL
c_name: MPI_CONVERSION_FN_NULL
lis_name: MPI_CONVERSION_FN_NULL
chapter: appLang-C
aliases: [MPI_CONVERSION_FN_NULL]
tags: [mpi/function, mpi/appLang-C]
---

# MPI_CONVERSION_FN_NULL

**C**
```c
int MPI_CONVERSION_FN_NULL(void *userbuf, MPI_Datatype datatype, int count, void *filebuf, MPI_Offset position, void *extra_state)
```



**Fortran 2008**
```fortran
MPI_CONVERSION_FN_NULL(userbuf, datatype, count, filebuf, position, extra_state, ierror)
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_PTR
  TYPE(C_PTR), VALUE :: userbuf, filebuf
  TYPE(MPI_Datatype) :: datatype
  INTEGER :: count, ierror
  INTEGER(KIND=MPI_OFFSET_KIND) :: position
  INTEGER(KIND=MPI_ADDRESS_KIND) :: extra_state
```

**Fortran (mpif.h)**
```fortran
MPI_CONVERSION_FN_NULL(USERBUF, DATATYPE, COUNT, FILEBUF, POSITION, EXTRA_STATE, IERROR)
  <TYPE> USERBUF(*), FILEBUF(*)
  INTEGER DATATYPE, COUNT, IERROR
  INTEGER(KIND=MPI_OFFSET_KIND) POSITION
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
```


> [!info] Semantics
> See the chapter note [[appLang-C]] for the normative text.

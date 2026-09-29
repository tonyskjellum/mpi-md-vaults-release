---
title: MPI_TYPE_CREATE_HVECTOR
c_name: MPI_Type_create_hvector
lis_name: MPI_TYPE_CREATE_HVECTOR
chapter: datatypes
aliases: [MPI_TYPE_CREATE_HVECTOR, MPI_Type_create_hvector, MPI_Type_create_hvector_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_HVECTOR

**C**
```c
int MPI_Type_create_hvector(int count, int blocklength, MPI_Aint stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
int MPI_Type_create_hvector_c(MPI_Count count, MPI_Count blocklength, MPI_Count stride, MPI_Datatype oldtype, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `count` | IN | number of blocks (non-negative integer) |
| `blocklength` | IN | number of elements in each block (non-negative integer) |
| `stride` | IN | number of bytes between start of each block (integer) |
| `oldtype` | IN | old datatype (handle) |
| `newtype` | OUT | new datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_create_hvector(count, blocklength, stride, oldtype, newtype, ierror)
  INTEGER, INTENT(IN) :: count, blocklength
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: stride
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Type_create_hvector(count, blocklength, stride, oldtype, newtype, ierror) !(_c)
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count, blocklength, stride
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_HVECTOR(COUNT, BLOCKLENGTH, STRIDE, OLDTYPE, NEWTYPE, IERROR)
  INTEGER COUNT, BLOCKLENGTH, OLDTYPE, NEWTYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) STRIDE
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.

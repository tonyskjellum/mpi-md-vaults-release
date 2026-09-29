---
title: MPI_TYPE_CREATE_RESIZED
c_name: MPI_Type_create_resized
lis_name: MPI_TYPE_CREATE_RESIZED
chapter: datatypes
aliases: [MPI_TYPE_CREATE_RESIZED, MPI_Type_create_resized, MPI_Type_create_resized_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_TYPE_CREATE_RESIZED

**C**
```c
int MPI_Type_create_resized(MPI_Datatype oldtype, MPI_Aint lb, MPI_Aint extent, MPI_Datatype *newtype)
int MPI_Type_create_resized_c(MPI_Datatype oldtype, MPI_Count lb, MPI_Count extent, MPI_Datatype *newtype)
```

| Parameter | Intent | Description |
|---|---|---|
| `oldtype` | IN | input datatype (handle) |
| `lb` | IN | new lower bound of datatype (integer) |
| `extent` | IN | new extent of datatype (integer) |
| `newtype` | OUT | output datatype (handle) |

**Fortran 2008**
```fortran
MPI_Type_create_resized(oldtype, lb, extent, newtype, ierror)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(IN) :: lb, extent
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Type_create_resized(oldtype, lb, extent, newtype, ierror) !(_c)
  TYPE(MPI_Datatype), INTENT(IN) :: oldtype
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: lb, extent
  TYPE(MPI_Datatype), INTENT(OUT) :: newtype
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_TYPE_CREATE_RESIZED(OLDTYPE, LB, EXTENT, NEWTYPE, IERROR)
  INTEGER OLDTYPE, NEWTYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) LB, EXTENT
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.

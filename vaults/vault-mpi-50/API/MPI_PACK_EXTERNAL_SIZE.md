---
title: MPI_PACK_EXTERNAL_SIZE
c_name: MPI_Pack_external_size
lis_name: MPI_PACK_EXTERNAL_SIZE
chapter: datatypes
aliases: [MPI_PACK_EXTERNAL_SIZE, MPI_Pack_external_size, MPI_Pack_external_size_c]
tags: [mpi/function, mpi/datatypes]
---

# MPI_PACK_EXTERNAL_SIZE

**C**
```c
int MPI_Pack_external_size(const char datarep[], int incount, MPI_Datatype datatype, MPI_Aint *size)
int MPI_Pack_external_size_c(const char datarep[], MPI_Count incount, MPI_Datatype datatype, MPI_Count *size)
```

| Parameter | Intent | Description |
|---|---|---|
| `datarep` | IN | data representation (string) |
| `incount` | IN | number of input data items (integer) |
| `datatype` | IN | datatype of each input data item (handle) |
| `size` | OUT | output buffer size, in bytes (integer) |

**Fortran 2008**
```fortran
MPI_Pack_external_size(datarep, incount, datatype, size, ierror)
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  INTEGER, INTENT(IN) :: incount
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_Pack_external_size(datarep, incount, datatype, size, ierror) !(_c)
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: incount
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PACK_EXTERNAL_SIZE(DATAREP, INCOUNT, DATATYPE, SIZE, IERROR)
  CHARACTER*(*) DATAREP
  INTEGER INCOUNT, DATATYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.

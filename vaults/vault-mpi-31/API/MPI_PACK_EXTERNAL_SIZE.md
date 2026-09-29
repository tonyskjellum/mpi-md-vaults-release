---
title: MPI_PACK_EXTERNAL_SIZE
c_name: MPI_Pack_external_size
lis_name: MPI_PACK_EXTERNAL_SIZE
chapter: datatypes
aliases: [MPI_PACK_EXTERNAL_SIZE, MPI_Pack_external_size]
tags: [mpi/function, mpi/datatypes]
---

# MPI_PACK_EXTERNAL_SIZE

**C**
```c
int MPI_Pack_external_size(const char datarep[], int incount, MPI_Datatype datatype, MPI_Aint *size)
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
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER, INTENT(IN) :: incount
  CHARACTER(LEN=*), INTENT(IN) :: datarep
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: size
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_PACK_EXTERNAL_SIZE(DATAREP, INCOUNT, DATATYPE, SIZE, IERROR)
  INTEGER INCOUNT, DATATYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) SIZE
  CHARACTER*(*) DATAREP
```


> [!info] Semantics
> See the chapter note [[datatypes]] for the normative text.

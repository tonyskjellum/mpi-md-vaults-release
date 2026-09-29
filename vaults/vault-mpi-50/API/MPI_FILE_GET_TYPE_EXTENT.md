---
title: MPI_FILE_GET_TYPE_EXTENT
c_name: MPI_File_get_type_extent
lis_name: MPI_FILE_GET_TYPE_EXTENT
chapter: io
aliases: [MPI_FILE_GET_TYPE_EXTENT, MPI_File_get_type_extent, MPI_File_get_type_extent_c]
tags: [mpi/function, mpi/io]
---

# MPI_FILE_GET_TYPE_EXTENT

**C**
```c
int MPI_File_get_type_extent(MPI_File fh, MPI_Datatype datatype, MPI_Aint *extent)
int MPI_File_get_type_extent_c(MPI_File fh, MPI_Datatype datatype, MPI_Count *extent)
```

| Parameter | Intent | Description |
|---|---|---|
| `fh` | IN | file handle (handle) |
| `datatype` | IN | datatype (handle) |
| `extent` | OUT | datatype extent (integer) |

**Fortran 2008**
```fortran
MPI_File_get_type_extent(fh, datatype, extent, ierror)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: extent
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran 2008**
```fortran
MPI_File_get_type_extent(fh, datatype, extent, ierror) !(_c)
  TYPE(MPI_File), INTENT(IN) :: fh
  TYPE(MPI_Datatype), INTENT(IN) :: datatype
  INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: extent
  INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**Fortran (mpif.h)**
```fortran
MPI_FILE_GET_TYPE_EXTENT(FH, DATATYPE, EXTENT, IERROR)
  INTEGER FH, DATATYPE, IERROR
  INTEGER(KIND=MPI_ADDRESS_KIND) EXTENT
```


> [!info] Semantics
> See the chapter note [[io]] for the normative text.

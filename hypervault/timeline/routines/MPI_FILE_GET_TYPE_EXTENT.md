---
title: MPI_FILE_GET_TYPE_EXTENT
c_name: MPI_File_get_type_extent
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_GET_TYPE_EXTENT, MPI_File_get_type_extent]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_GET_TYPE_EXTENT

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_GET_TYPE_EXTENT|MPI-2.0]] · [[versions/v21/API/MPI_FILE_GET_TYPE_EXTENT|MPI-2.1]] · [[versions/v22/API/MPI_FILE_GET_TYPE_EXTENT|MPI-2.2]] · [[versions/v30/API/MPI_FILE_GET_TYPE_EXTENT|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_GET_TYPE_EXTENT|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_GET_TYPE_EXTENT|MPI-4.0]] Δ · [[versions/v41/API/MPI_FILE_GET_TYPE_EXTENT|MPI-4.1]] · [[versions/v50/API/MPI_FILE_GET_TYPE_EXTENT|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-3.1**
```c
int MPI_File_get_type_extent(MPI_File fh, MPI_Datatype datatype, MPI_Aint *extent)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_File_get_type_extent(MPI_File fh, MPI_Datatype datatype, MPI_Aint *extent)
int MPI_File_get_type_extent_c(MPI_File fh, MPI_Datatype datatype, MPI_Count *extent)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Aint MPI::File::Get_type_extent(const MPI::Datatype& datatype) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_get_type_extent(fh, datatype, extent, ierror) BIND(C)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_File_get_type_extent(fh, datatype, extent, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_File_get_type_extent(fh, datatype, extent, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_ADDRESS_KIND), INTENT(OUT) :: extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_File_get_type_extent(fh, datatype, extent, ierror) !(_c)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(OUT) :: extent
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_FILE_GET_TYPE_EXTENT(FH, DATATYPE, EXTENT, IERROR)
    INTEGER FH, DATATYPE, IERROR
    INTEGER(KIND=MPI_ADDRESS_KIND) EXTENT
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `fh` | IN | **MPI-2.0–MPI-5.0:** file handle (handle) |
| `datatype` | IN | **MPI-2.0–MPI-5.0:** datatype (handle) |
| `extent` | OUT | **MPI-2.0–MPI-5.0:** datatype extent (integer) |

## Named in the change log of

[[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_GET_TYPE_EXTENT|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_GET_TYPE_EXTENT|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_GET_TYPE_EXTENT|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_GET_TYPE_EXTENT|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_GET_TYPE_EXTENT|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_GET_TYPE_EXTENT|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_GET_TYPE_EXTENT|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_GET_TYPE_EXTENT|API note]] · chapter [[versions/v50/sections/io|io]]

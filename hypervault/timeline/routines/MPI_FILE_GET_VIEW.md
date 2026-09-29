---
title: MPI_FILE_GET_VIEW
c_name: MPI_File_get_view
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_GET_VIEW, MPI_File_get_view]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_GET_VIEW

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_GET_VIEW|MPI-2.0]] · [[versions/v21/API/MPI_FILE_GET_VIEW|MPI-2.1]] Δ · [[versions/v22/API/MPI_FILE_GET_VIEW|MPI-2.2]] · [[versions/v30/API/MPI_FILE_GET_VIEW|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_GET_VIEW|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_GET_VIEW|MPI-4.0]] Δ · [[versions/v41/API/MPI_FILE_GET_VIEW|MPI-4.1]] · [[versions/v50/API/MPI_FILE_GET_VIEW|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_File_get_view(MPI_File fh, MPI_Offset *disp, MPI_Datatype *etype, MPI_Datatype *filetype, char *datarep)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::File::Get_view(MPI::Offset& disp, MPI::Datatype& etype, MPI::Datatype& filetype, char* datarep) const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_get_view(fh, disp, etype, filetype, datarep, ierror) BIND(C)
    TYPE(MPI_File), INTENT(IN) :: fh
    INTEGER(KIND=MPI_OFFSET_KIND), INTENT(OUT) :: disp
    TYPE(MPI_Datatype), INTENT(OUT) :: etype, filetype
    CHARACTER(LEN=*), INTENT(OUT) :: datarep
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_File_get_view(fh, disp, etype, filetype, datarep, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    INTEGER(KIND=MPI_OFFSET_KIND), INTENT(OUT) :: disp
    TYPE(MPI_Datatype), INTENT(OUT) :: etype, filetype
    CHARACTER(LEN=*), INTENT(OUT) :: datarep
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0**
```fortran
MPI_FILE_GET_VIEW(FH, DISP, ETYPE, FILETYPE, DATAREP, IERROR)
    INTEGER FH, ETYPE, FILETYPE, IERROR
    CHARACTER*(*) DATAREP, INTEGER(KIND=MPI_OFFSET_KIND) DISP
```

**MPI-2.1–MPI-3.1**
```fortran
MPI_FILE_GET_VIEW(FH, DISP, ETYPE, FILETYPE, DATAREP, IERROR)
    INTEGER FH, ETYPE, FILETYPE, IERROR
    CHARACTER*(*) DATAREP
    INTEGER(KIND=MPI_OFFSET_KIND) DISP
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_FILE_GET_VIEW(FH, DISP, ETYPE, FILETYPE, DATAREP, IERROR)
    INTEGER FH, ETYPE, FILETYPE, IERROR
    INTEGER(KIND=MPI_OFFSET_KIND) DISP
    CHARACTER*(*) DATAREP
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `fh` | IN | **MPI-2.0–MPI-5.0:** file handle (handle) |
| `disp` | OUT | **MPI-2.0–MPI-5.0:** displacement (integer) |
| `etype` | OUT | **MPI-2.0–MPI-5.0:** elementary datatype (handle) |
| `filetype` | OUT | **MPI-2.0–MPI-5.0:** filetype (handle) |
| `datarep` | OUT | **MPI-2.0–MPI-5.0:** data representation (string) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_GET_VIEW|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_GET_VIEW|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_GET_VIEW|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_GET_VIEW|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_GET_VIEW|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_GET_VIEW|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_GET_VIEW|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_GET_VIEW|API note]] · chapter [[versions/v50/sections/io|io]]

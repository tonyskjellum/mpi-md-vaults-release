---
title: MPI_FILE_IREAD_AT_ALL
c_name: MPI_File_iread_at_all
chapter: io
introduced: "MPI-3.1"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_IREAD_AT_ALL, MPI_File_iread_at_all]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_IREAD_AT_ALL

**Introduced** in MPI-3.1.

Releases: [[versions/v31/API/MPI_FILE_IREAD_AT_ALL|MPI-3.1]] · [[versions/v40/API/MPI_FILE_IREAD_AT_ALL|MPI-4.0]] Δ · [[versions/v41/API/MPI_FILE_IREAD_AT_ALL|MPI-4.1]] · [[versions/v50/API/MPI_FILE_IREAD_AT_ALL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-3.1**
```c
int MPI_File_iread_at_all(MPI_File fh, MPI_Offset offset, void *buf, int count, MPI_Datatype datatype, MPI_Request *request)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_File_iread_at_all(MPI_File fh, MPI_Offset offset, void *buf, int count, MPI_Datatype datatype, MPI_Request *request)
int MPI_File_iread_at_all_c(MPI_File fh, MPI_Offset offset, void *buf, MPI_Count count, MPI_Datatype datatype, MPI_Request *request)
```

## Fortran 2008

**MPI-3.1**
```fortran
MPI_File_iread_at_all(fh, offset, buf, count, datatype, request, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    INTEGER(KIND=MPI_OFFSET_KIND), INTENT(IN) :: offset
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_File_iread_at_all(fh, offset, buf, count, datatype, request, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    INTEGER(KIND=MPI_OFFSET_KIND), INTENT(IN) :: offset
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_File_iread_at_all(fh, offset, buf, count, datatype, request, ierror) !(_c)
    TYPE(MPI_File), INTENT(IN) :: fh
    INTEGER(KIND=MPI_OFFSET_KIND), INTENT(IN) :: offset
    TYPE(*), DIMENSION(..), ASYNCHRONOUS :: buf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Request), INTENT(OUT) :: request
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-3.1**
```fortran
MPI_FILE_IREAD_AT_ALL(FH, OFFSET, BUF, COUNT, DATATYPE, REQUEST, IERROR)
    <type> BUF(*)
    INTEGER FH, COUNT, DATATYPE, REQUEST, IERROR
    INTEGER(KIND=MPI_OFFSET_KIND) OFFSET
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_FILE_IREAD_AT_ALL(FH, OFFSET, BUF, COUNT, DATATYPE, REQUEST, IERROR)
    INTEGER FH, COUNT, DATATYPE, REQUEST, IERROR
    INTEGER(KIND=MPI_OFFSET_KIND) OFFSET
    <type> BUF(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `fh` | IN | **MPI-3.1–MPI-5.0:** file handle (handle) |
| `offset` | IN | **MPI-3.1–MPI-5.0:** file offset (integer) |
| `buf` | OUT | **MPI-3.1–MPI-5.0:** initial address of buffer (choice) |
| `count` | IN | **MPI-3.1–MPI-5.0:** number of elements in buffer (integer) |
| `datatype` | IN | **MPI-3.1–MPI-5.0:** datatype of each buffer element (handle) |
| `request` | OUT | **MPI-3.1–MPI-5.0:** request object (handle) |

## Named in the change log of

[[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-3.1: [[versions/v31/API/MPI_FILE_IREAD_AT_ALL|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_IREAD_AT_ALL|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_IREAD_AT_ALL|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_IREAD_AT_ALL|API note]] · chapter [[versions/v50/sections/io|io]]

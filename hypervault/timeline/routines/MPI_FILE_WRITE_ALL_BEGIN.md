---
title: MPI_FILE_WRITE_ALL_BEGIN
c_name: MPI_File_write_all_begin
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_WRITE_ALL_BEGIN, MPI_File_write_all_begin]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_WRITE_ALL_BEGIN

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_WRITE_ALL_BEGIN|MPI-2.0]] · [[versions/v21/API/MPI_FILE_WRITE_ALL_BEGIN|MPI-2.1]] · [[versions/v22/API/MPI_FILE_WRITE_ALL_BEGIN|MPI-2.2]] · [[versions/v30/API/MPI_FILE_WRITE_ALL_BEGIN|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_WRITE_ALL_BEGIN|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_WRITE_ALL_BEGIN|MPI-4.0]] Δ · [[versions/v41/API/MPI_FILE_WRITE_ALL_BEGIN|MPI-4.1]] · [[versions/v50/API/MPI_FILE_WRITE_ALL_BEGIN|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_File_write_all_begin(MPI_File fh, void *buf, int count, MPI_Datatype datatype)
```

**MPI-3.0–MPI-3.1**
```c
int MPI_File_write_all_begin(MPI_File fh, const void *buf, int count, MPI_Datatype datatype)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_File_write_all_begin(MPI_File fh, const void *buf, int count, MPI_Datatype datatype)
int MPI_File_write_all_begin_c(MPI_File fh, const void *buf, MPI_Count count, MPI_Datatype datatype)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::File::Write_all_begin(const void* buf, int count, const MPI::Datatype& datatype)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_write_all_begin(fh, buf, count, datatype, ierror) BIND(C)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_File_write_all_begin(fh, buf, count, datatype, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_File_write_all_begin(fh, buf, count, datatype, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_File_write_all_begin(fh, buf, count, datatype, ierror) !(_c)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(*), DIMENSION(..), INTENT(IN), ASYNCHRONOUS :: buf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_FILE_WRITE_ALL_BEGIN(FH, BUF, COUNT, DATATYPE, IERROR)
    <type> BUF(*)
    INTEGER FH, COUNT, DATATYPE, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_FILE_WRITE_ALL_BEGIN(FH, BUF, COUNT, DATATYPE, IERROR)
    INTEGER FH, COUNT, DATATYPE, IERROR
    <type> BUF(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `fh` | INOUT | **MPI-2.0–MPI-5.0:** file handle (handle) |
| `buf` | IN | **MPI-2.0–MPI-5.0:** initial address of buffer (choice) |
| `count` | IN | **MPI-2.0–MPI-5.0:** number of elements in buffer (integer) |
| `datatype` | IN | **MPI-2.0–MPI-5.0:** datatype of each buffer element (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_WRITE_ALL_BEGIN|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_WRITE_ALL_BEGIN|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_WRITE_ALL_BEGIN|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_WRITE_ALL_BEGIN|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_WRITE_ALL_BEGIN|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_WRITE_ALL_BEGIN|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_WRITE_ALL_BEGIN|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_WRITE_ALL_BEGIN|API note]] · chapter [[versions/v50/sections/io|io]]

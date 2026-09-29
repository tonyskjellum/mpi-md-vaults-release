---
title: MPI_FILE_READ_ALL
c_name: MPI_File_read_all
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_READ_ALL, MPI_File_read_all]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_READ_ALL

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_READ_ALL|MPI-2.0]] · [[versions/v21/API/MPI_FILE_READ_ALL|MPI-2.1]] · [[versions/v22/API/MPI_FILE_READ_ALL|MPI-2.2]] · [[versions/v30/API/MPI_FILE_READ_ALL|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_READ_ALL|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_READ_ALL|MPI-4.0]] Δ · [[versions/v41/API/MPI_FILE_READ_ALL|MPI-4.1]] · [[versions/v50/API/MPI_FILE_READ_ALL|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-3.1**
```c
int MPI_File_read_all(MPI_File fh, void *buf, int count, MPI_Datatype datatype, MPI_Status *status)
```

**MPI-4.0–MPI-5.0**
```c
int MPI_File_read_all(MPI_File fh, void *buf, int count, MPI_Datatype datatype, MPI_Status *status)
int MPI_File_read_all_c(MPI_File fh, void *buf, MPI_Count count, MPI_Datatype datatype, MPI_Status *status)
```

## C++

**MPI-2.0–MPI-2.2**
```c
void MPI::File::Read_all(void* buf, int count, const MPI::Datatype& datatype, MPI::Status& status)
void MPI::File::Read_all(void* buf, int count, const MPI::Datatype& datatype)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_read_all(fh, buf, count, datatype, status, ierror) BIND(C)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(*), DIMENSION(..) :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1**
```fortran
MPI_File_read_all(fh, buf, count, datatype, status, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(*), DIMENSION(..) :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_File_read_all(fh, buf, count, datatype, status, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(*), DIMENSION(..) :: buf
    INTEGER, INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
MPI_File_read_all(fh, buf, count, datatype, status, ierror) !(_c)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(*), DIMENSION(..) :: buf
    INTEGER(KIND=MPI_COUNT_KIND), INTENT(IN) :: count
    TYPE(MPI_Datatype), INTENT(IN) :: datatype
    TYPE(MPI_Status) :: status
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_FILE_READ_ALL(FH, BUF, COUNT, DATATYPE, STATUS, IERROR)
    <type> BUF(*)
    INTEGER FH, COUNT, DATATYPE, STATUS(MPI_STATUS_SIZE), IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_FILE_READ_ALL(FH, BUF, COUNT, DATATYPE, STATUS, IERROR)
    INTEGER FH, COUNT, DATATYPE, STATUS(MPI_STATUS_SIZE), IERROR
    <type> BUF(*)
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `fh` | INOUT | **MPI-2.0–MPI-5.0:** file handle (handle) |
| `buf` | OUT | **MPI-2.0–MPI-5.0:** initial address of buffer (choice) |
| `count` | IN | **MPI-2.0–MPI-5.0:** number of elements in buffer (integer) |
| `datatype` | IN | **MPI-2.0–MPI-5.0:** datatype of each buffer element (handle) |
| `status` | OUT | **MPI-2.0–MPI-3.1:** status object (Status)<br>**MPI-4.0–MPI-5.0:** status object (status) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_READ_ALL|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_READ_ALL|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_READ_ALL|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_READ_ALL|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_READ_ALL|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_READ_ALL|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_READ_ALL|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_READ_ALL|API note]] · chapter [[versions/v50/sections/io|io]]

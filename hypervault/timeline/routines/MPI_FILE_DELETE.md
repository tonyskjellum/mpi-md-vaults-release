---
title: MPI_FILE_DELETE
c_name: MPI_File_delete
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_DELETE, MPI_File_delete]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_DELETE

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_DELETE|MPI-2.0]] · [[versions/v21/API/MPI_FILE_DELETE|MPI-2.1]] · [[versions/v22/API/MPI_FILE_DELETE|MPI-2.2]] · [[versions/v30/API/MPI_FILE_DELETE|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_DELETE|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_DELETE|MPI-4.0]] · [[versions/v41/API/MPI_FILE_DELETE|MPI-4.1]] · [[versions/v50/API/MPI_FILE_DELETE|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_File_delete(char *filename, MPI_Info info)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_File_delete(const char *filename, MPI_Info info)
```

## C++

**MPI-2.0–MPI-2.2**
```c
static void MPI::File::Delete(const char* filename, const MPI::Info& info)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_delete(filename, info, ierror) BIND(C)
    CHARACTER(LEN=*), INTENT(IN) :: filename
    TYPE(MPI_Info), INTENT(IN) :: info
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_File_delete(filename, info, ierror)
    CHARACTER(LEN=*), INTENT(IN) :: filename
    TYPE(MPI_Info), INTENT(IN) :: info
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_FILE_DELETE(FILENAME, INFO, IERROR)
    CHARACTER*(*) FILENAME
    INTEGER INFO, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `filename` | IN | **MPI-2.0–MPI-5.0:** name of file to delete (string) |
| `info` | IN | **MPI-2.0–MPI-5.0:** info object (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_DELETE|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_DELETE|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_DELETE|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_DELETE|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_DELETE|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_DELETE|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_DELETE|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_DELETE|API note]] · chapter [[versions/v50/sections/io|io]]

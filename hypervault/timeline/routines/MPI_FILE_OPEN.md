---
title: MPI_FILE_OPEN
c_name: MPI_File_open
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_OPEN, MPI_File_open]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_OPEN

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_OPEN|MPI-2.0]] · [[versions/v21/API/MPI_FILE_OPEN|MPI-2.1]] · [[versions/v22/API/MPI_FILE_OPEN|MPI-2.2]] · [[versions/v30/API/MPI_FILE_OPEN|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_OPEN|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_OPEN|MPI-4.0]] Δ · [[versions/v41/API/MPI_FILE_OPEN|MPI-4.1]] · [[versions/v50/API/MPI_FILE_OPEN|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-2.2**
```c
int MPI_File_open(MPI_Comm comm, char *filename, int amode, MPI_Info info, MPI_File *fh)
```

**MPI-3.0–MPI-5.0**
```c
int MPI_File_open(MPI_Comm comm, const char *filename, int amode, MPI_Info info, MPI_File *fh)
```

## C++

**MPI-2.0–MPI-2.2**
```c
static MPI::File MPI::File::Open(const MPI::Intracomm& comm, const char* filename, int amode, const MPI::Info& info)
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_open(comm, filename, amode, info, fh, ierror) BIND(C)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    CHARACTER(LEN=*), INTENT(IN) :: filename
    INTEGER, INTENT(IN) :: amode
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_File), INTENT(OUT) :: fh
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_File_open(comm, filename, amode, info, fh, ierror)
    TYPE(MPI_Comm), INTENT(IN) :: comm
    CHARACTER(LEN=*), INTENT(IN) :: filename
    INTEGER, INTENT(IN) :: amode
    TYPE(MPI_Info), INTENT(IN) :: info
    TYPE(MPI_File), INTENT(OUT) :: fh
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-3.1**
```fortran
MPI_FILE_OPEN(COMM, FILENAME, AMODE, INFO, FH, IERROR)
    CHARACTER*(*) FILENAME
    INTEGER COMM, AMODE, INFO, FH, IERROR
```

**MPI-4.0–MPI-5.0**
```fortran
MPI_FILE_OPEN(COMM, FILENAME, AMODE, INFO, FH, IERROR)
    INTEGER COMM, AMODE, INFO, FH, IERROR
    CHARACTER*(*) FILENAME
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `comm` | IN | **MPI-2.0–MPI-5.0:** communicator (handle) |
| `filename` | IN | **MPI-2.0–MPI-5.0:** name of file to open (string) |
| `amode` | IN | **MPI-2.0–MPI-5.0:** file access mode (integer) |
| `info` | IN | **MPI-2.0–MPI-5.0:** info object (handle) |
| `fh` | OUT | **MPI-2.0–MPI-5.0:** new file handle (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_OPEN|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_OPEN|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_OPEN|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_OPEN|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_OPEN|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_OPEN|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_OPEN|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_OPEN|API note]] · chapter [[versions/v50/sections/io|io]]

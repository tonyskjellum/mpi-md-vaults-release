---
title: MPI_FILE_GET_ATOMICITY
c_name: MPI_File_get_atomicity
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_GET_ATOMICITY, MPI_File_get_atomicity]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_GET_ATOMICITY

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_GET_ATOMICITY|MPI-2.0]] · [[versions/v21/API/MPI_FILE_GET_ATOMICITY|MPI-2.1]] · [[versions/v22/API/MPI_FILE_GET_ATOMICITY|MPI-2.2]] · [[versions/v30/API/MPI_FILE_GET_ATOMICITY|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_GET_ATOMICITY|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_GET_ATOMICITY|MPI-4.0]] · [[versions/v41/API/MPI_FILE_GET_ATOMICITY|MPI-4.1]] · [[versions/v50/API/MPI_FILE_GET_ATOMICITY|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_File_get_atomicity(MPI_File fh, int *flag)
```

## C++

**MPI-2.0–MPI-2.2**
```c
bool MPI::File::Get_atomicity() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_get_atomicity(fh, flag, ierror) BIND(C)
    TYPE(MPI_File), INTENT(IN) :: fh
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_File_get_atomicity(fh, flag, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    LOGICAL, INTENT(OUT) :: flag
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_FILE_GET_ATOMICITY(FH, FLAG, IERROR)
    INTEGER FH, IERROR
    LOGICAL FLAG
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `fh` | IN | **MPI-2.0–MPI-5.0:** file handle (handle) |
| `flag` | OUT | **MPI-2.0–MPI-5.0:** `true` if atomic mode, `false` if nonatomic mode (logical) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_GET_ATOMICITY|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_GET_ATOMICITY|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_GET_ATOMICITY|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_GET_ATOMICITY|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_GET_ATOMICITY|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_GET_ATOMICITY|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_GET_ATOMICITY|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_GET_ATOMICITY|API note]] · chapter [[versions/v50/sections/io|io]]

---
title: MPI_FILE_GET_INFO
c_name: MPI_File_get_info
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_GET_INFO, MPI_File_get_info]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_GET_INFO

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_GET_INFO|MPI-2.0]] · [[versions/v21/API/MPI_FILE_GET_INFO|MPI-2.1]] · [[versions/v22/API/MPI_FILE_GET_INFO|MPI-2.2]] · [[versions/v30/API/MPI_FILE_GET_INFO|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_GET_INFO|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_GET_INFO|MPI-4.0]] · [[versions/v41/API/MPI_FILE_GET_INFO|MPI-4.1]] · [[versions/v50/API/MPI_FILE_GET_INFO|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_File_get_info(MPI_File fh, MPI_Info *info_used)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Info MPI::File::Get_info() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_get_info(fh, info_used, ierror) BIND(C)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(MPI_Info), INTENT(OUT) :: info_used
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_File_get_info(fh, info_used, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(MPI_Info), INTENT(OUT) :: info_used
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_FILE_GET_INFO(FH, INFO_USED, IERROR)
    INTEGER FH, INFO_USED, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `fh` | IN | **MPI-2.0–MPI-5.0:** file handle (handle) |
| `info_used` | OUT | **MPI-2.0–MPI-5.0:** new info object (handle) |

## Named in the change log of

[[versions/v21/sections/changes|MPI-2.1]], [[versions/v22/sections/changes|MPI-2.2]], [[versions/v30/sections/changes|MPI-3.0]], [[versions/v31/sections/changes|MPI-3.1]], [[versions/v40/sections/changes|MPI-4.0]], [[versions/v41/sections/changes|MPI-4.1]], [[versions/v50/sections/changes|MPI-5.0]]

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_GET_INFO|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_GET_INFO|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_GET_INFO|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_GET_INFO|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_GET_INFO|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_GET_INFO|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_GET_INFO|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_GET_INFO|API note]] · chapter [[versions/v50/sections/io|io]]

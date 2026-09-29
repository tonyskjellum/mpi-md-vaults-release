---
title: MPI_FILE_GET_GROUP
c_name: MPI_File_get_group
chapter: io
introduced: "MPI-2.0"
deprecated: null
removed: null
continued_as: null
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
aliases: [MPI_FILE_GET_GROUP, MPI_File_get_group]
tags: [mpi/routine, mpi/io]
---

# MPI_FILE_GET_GROUP

**Introduced** in MPI-2.0.

Releases: [[versions/v20/API/MPI_FILE_GET_GROUP|MPI-2.0]] · [[versions/v21/API/MPI_FILE_GET_GROUP|MPI-2.1]] · [[versions/v22/API/MPI_FILE_GET_GROUP|MPI-2.2]] · [[versions/v30/API/MPI_FILE_GET_GROUP|MPI-3.0]] Δ · [[versions/v31/API/MPI_FILE_GET_GROUP|MPI-3.1]] Δ · [[versions/v40/API/MPI_FILE_GET_GROUP|MPI-4.0]] · [[versions/v41/API/MPI_FILE_GET_GROUP|MPI-4.1]] Δ · [[versions/v50/API/MPI_FILE_GET_GROUP|MPI-5.0]]

_Δ interface or argument wording changed on the edge into this release; † listed in the deprecated chapter._

## C

**MPI-2.0–MPI-5.0**
```c
int MPI_File_get_group(MPI_File fh, MPI_Group *group)
```

## C++

**MPI-2.0–MPI-2.2**
```c
MPI::Group MPI::File::Get_group() const
```

**MPI-3.0–MPI-5.0**
_(no C++ binding)_

## Fortran 2008

**MPI-2.0–MPI-2.2**
_(no Fortran 2008 binding)_

**MPI-3.0**
```fortran
MPI_File_get_group(fh, group, ierror) BIND(C)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(MPI_Group), INTENT(OUT) :: group
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

**MPI-3.1–MPI-5.0**
```fortran
MPI_File_get_group(fh, group, ierror)
    TYPE(MPI_File), INTENT(IN) :: fh
    TYPE(MPI_Group), INTENT(OUT) :: group
    INTEGER, OPTIONAL, INTENT(OUT) :: ierror
```

## mpif.h

**MPI-2.0–MPI-5.0**
```fortran
MPI_FILE_GET_GROUP(FH, GROUP, IERROR)
    INTEGER FH, GROUP, IERROR
```

## Arguments

| argument | intent | description (by release) |
|---|---|---|
| `fh` | IN | **MPI-2.0–MPI-5.0:** file handle (handle) |
| `group` | OUT | **MPI-2.0–MPI-4.0:** group which opened the file (handle)<br>**MPI-4.1–MPI-5.0:** group that opened the file (handle) |

## Per-release notes

- MPI-2.0: [[versions/v20/API/MPI_FILE_GET_GROUP|API note]] · chapter [[versions/v20/sections/io|io]]
- MPI-2.1: [[versions/v21/API/MPI_FILE_GET_GROUP|API note]] · chapter [[versions/v21/sections/io|io]]
- MPI-2.2: [[versions/v22/API/MPI_FILE_GET_GROUP|API note]] · chapter [[versions/v22/sections/io|io]]
- MPI-3.0: [[versions/v30/API/MPI_FILE_GET_GROUP|API note]] · chapter [[versions/v30/sections/io|io]]
- MPI-3.1: [[versions/v31/API/MPI_FILE_GET_GROUP|API note]] · chapter [[versions/v31/sections/io|io]]
- MPI-4.0: [[versions/v40/API/MPI_FILE_GET_GROUP|API note]] · chapter [[versions/v40/sections/io|io]]
- MPI-4.1: [[versions/v41/API/MPI_FILE_GET_GROUP|API note]] · chapter [[versions/v41/sections/io|io]]
- MPI-5.0: [[versions/v50/API/MPI_FILE_GET_GROUP|API note]] · chapter [[versions/v50/sections/io|io]]

---
title: "Random Access vs. Sequential Files"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Random Access vs. Sequential Files

Chapter **io** · in [[versions/v20/sections/io#Random Access vs. Sequential Files|MPI-2.0]], [[versions/v21/sections/io#Random Access vs. Sequential Files|MPI-2.1]], [[versions/v22/sections/io#Random Access vs. Sequential Files|MPI-2.2]], [[versions/v30/sections/io#Random Access vs. Sequential Files|MPI-3.0]], [[versions/v31/sections/io#Random Access vs. Sequential Files|MPI-3.1]], [[versions/v40/sections/io#Random Access vs. Sequential Files|MPI-4.0]], [[versions/v41/sections/io#Random Access vs. Sequential Files|MPI-4.1]], [[versions/v50/sections/io#Random Access vs. Sequential Files|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

MPI distinguishes ordinary random access files from sequential stream files, such as pipes and tape files. Sequential stream files must be opened with the ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== flag set in the amode. For these files, the only permitted data access operations are shared file pointer reads and writes. Filetypes and etypes with holes are erroneous. In addition, the notion of file pointer is not meaningful; therefore, calls to `MPI_FILE_SEEK_SHARED` and `MPI_FILE_GET_POSITION_SHARED` are erroneous, and the pointer update rules specified for the data access routines do not apply. The amount of data accessed by a data access operation will be the amount requested unless the end of file is reached or an error is raised.

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

MPI distinguishes ordinary random access files from sequential stream files, such as pipes and tape files. Sequential stream files must be opened with the `MPI_MODE_SEQUENTIAL` flag set in the amode. For these files, the only permitted data access operations are shared file pointer reads and writes. Filetypes and etypes with holes are erroneous. In addition, the notion of file pointer is not meaningful; therefore, calls to ~~`MPI_FILE_SEEK_SHARED`~~ ==[[versions/v31/API/MPI_FILE_SEEK_SHARED|MPI_FILE_SEEK_SHARED]]== and ~~`MPI_FILE_GET_POSITION_SHARED`~~ ==[[versions/v31/API/MPI_FILE_GET_POSITION_SHARED|MPI_FILE_GET_POSITION_SHARED]]== are erroneous, and the pointer update rules specified for the data access routines do not apply. The amount of data accessed by a data access operation will be the amount requested unless the end of file is reached or an error is raised.

Finally, for some sequential files, such as those corresponding to magnetic tapes or streaming network connections, writes to the file may be destructive. In other words, a write may act as a truncate (a ~~`MPI_FILE_SET_SIZE`~~ ==[[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]]== with `size` set to the current position) followed by the write.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Random Access vs. Sequential Files]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Random Access vs. Sequential Files]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Random Access vs. Sequential Files]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Random Access vs. Sequential Files]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Random Access vs. Sequential Files]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Random Access vs. Sequential Files]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Random Access vs. Sequential Files]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Random Access vs. Sequential Files]]

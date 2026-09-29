---
title: "Deleting a File"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Deleting a File

Chapter **io** · in [[versions/v20/sections/io#Deleting a File|MPI-2.0]], [[versions/v21/sections/io#Deleting a File|MPI-2.1]], [[versions/v22/sections/io#Deleting a File|MPI-2.2]], [[versions/v30/sections/io#Deleting a File|MPI-3.0]], [[versions/v31/sections/io#Deleting a File|MPI-3.1]], [[versions/v40/sections/io#Deleting a File|MPI-4.0]], [[versions/v41/sections/io#Deleting a File|MPI-4.1]], [[versions/v50/sections/io#Deleting a File|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The `info` argument can be used to provide information regarding file system specifics (see Section [[versions/v22/sections/io#File Info|File Info]] , page [[versions/v22/sections/io#File Info|File Info]] ). The constant ~~MPI_INFO_NULL~~ ==`MPI_INFO_NULL`==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The `info` argument can be used to provide information regarding file system specifics (see Section [[versions/v30/sections/io#File Info|File Info]] , page [[versions/v30/sections/io#File Info|File Info]] ). The constant `MPI_INFO_NULL`~~

~~refers to the null info, and~~

~~can be used when no info needs to be specified.~~

~~If a process currently has the file open, the behavior of any access to the file (as well as the behavior of any outstanding accesses) is implementation dependent.~~

~~In addition, whether an open file is deleted or not is also implementation dependent. If the file is not deleted,~~

~~an error in the class `MPI_ERR_FILE_IN_USE` or `MPI_ERR_ACCESS` will be raised. Errors are raised~~

~~using the default error handler~~

~~(see Section [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] , page [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] ).~~

==The `info` argument can be used to provide information regarding file system specifics (see Section [[versions/v30/sections/io#File Info|File Info]] , page [[versions/v30/sections/io#File Info|File Info]] ). The constant `MPI_INFO_NULL` refers to the null info, and can be used when no info needs to be specified.==

==If a process currently has the file open, the behavior of any access to the file (as well as the behavior of any outstanding accesses) is implementation dependent. In addition, whether an open file is deleted or not is also implementation dependent. If the file is not deleted, an error in the class `MPI_ERR_FILE_IN_USE` or `MPI_ERR_ACCESS` will be raised. Errors are raised using the default error handler (see Section [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] , page [[versions/v30/sections/io#I/O Error Handling|I/O Error Handling]] ).==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~`MPI_FILE_DELETE`~~ ==[[versions/v31/API/MPI_FILE_DELETE|MPI_FILE_DELETE]]== deletes the file identified by the file name `filename`. If the file does not exist, ~~`MPI_FILE_DELETE`~~ ==[[versions/v31/API/MPI_FILE_DELETE|MPI_FILE_DELETE]]== raises an error in the class `MPI_ERR_NO_SUCH_FILE`.

The `info` argument can be used to provide information regarding file system specifics (see ~~Section [[versions/v31/sections/io#File Info|File Info]] , page~~ [[versions/v31/sections/io#File Info|File Info]] ). The constant `MPI_INFO_NULL` refers to the null info, and can be used when no info needs to be specified.

If a process currently has the file open, the behavior of any access to the file (as well as the behavior of any outstanding accesses) is implementation dependent. In addition, whether an open file is deleted or not is also implementation dependent. If the file is not deleted, an error in the class `MPI_ERR_FILE_IN_USE` or `MPI_ERR_ACCESS` will be raised. Errors are raised using the default error handler (see ~~Section [[versions/v31/sections/io#I/O Error Handling|I/O Error Handling]] , page~~ [[versions/v31/sections/io#I/O Error Handling|I/O Error Handling]] ).

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

If a process currently has the file open, the behavior of any access to the file (as well as the behavior of any outstanding accesses) is implementation dependent. In addition, whether an open file is deleted or not is also implementation dependent. If the file is not deleted, an error in the class `MPI_ERR_FILE_IN_USE` or `MPI_ERR_ACCESS` will be raised. Errors are raised using the default ==file== error handler (see [[versions/v40/sections/io#I/O Error Handling|I/O Error Handling]] ).

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

[[versions/v50/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] deletes the file identified by the file name `filename`. If the file does not exist, [[versions/v50/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] raises an error ~~in the~~ ==of== class `MPI_ERR_NO_SUCH_FILE`.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Deleting a File]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Deleting a File]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Deleting a File]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Deleting a File]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Deleting a File]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Deleting a File]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Deleting a File]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Deleting a File]]

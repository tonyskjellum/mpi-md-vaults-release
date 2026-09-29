---
title: "Collective Operations"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Collective Operations

Chapter **io** · in [[versions/v20/sections/io#Collective Operations|MPI-2.0]], [[versions/v21/sections/io#Collective Operations|MPI-2.1]], [[versions/v22/sections/io#Collective Operations|MPI-2.2]], [[versions/v30/sections/io#Collective Operations|MPI-3.0]], [[versions/v31/sections/io#Collective Operations|MPI-3.1]], [[versions/v40/sections/io#Collective Operations|MPI-4.0]], [[versions/v41/sections/io#Collective Operations|MPI-4.1]], [[versions/v50/sections/io#Collective Operations|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~access, the call might return only after all the processes~~

~~within the group have initiated their accesses.~~

==access, the call might return only after all the processes within the group have initiated their accesses.==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~The semantics of a collective access using a shared file pointer is that the accesses to the file will be in the order determined by the ranks of the processes within the group.~~

~~For each process, the location in the file at which data is accessed is the position at which the shared file pointer would be after all processes whose ranks within the group less than that of this process had accessed their data. In addition, in order to prevent subsequent shared offset accesses by the same processes from interfering with this collective~~

~~access, the call might return only after all the processes within the group have initiated their accesses.~~

~~When the call returns, the shared file pointer points to the next etype accessible, according to the file view used by all processes, after the last etype requested.~~

==The semantics of a collective access using a shared file pointer is that the accesses to the file will be in the order determined by the ranks of the processes within the group. For each process, the location in the file at which data is accessed is the position at which the shared file pointer would be after all processes whose ranks within the group less than that of this process had accessed their data. In addition, in order to prevent subsequent shared offset accesses by the same processes from interfering with this collective access, the call might return only after all the processes within the group have initiated their accesses. When the call returns, the shared file pointer points to the next etype accessible, according to the file view used by all processes, after the last etype requested.==

> There may be some programs in which all processes in the group need to access the file using the shared file pointer, but the program may not *require* that data be accessed in order of process rank. In such programs, using the shared ordered routines (e.g., ~~`MPI_FILE_WRITE_ORDERED`~~ ==[[versions/v31/API/MPI_FILE_WRITE_ORDERED|MPI_FILE_WRITE_ORDERED]]== rather than ~~`MPI_FILE_WRITE_SHARED`)~~ ==[[versions/v31/API/MPI_FILE_WRITE_SHARED|MPI_FILE_WRITE_SHARED]] )== may enable an implementation to optimize access, improving performance.

~~`MPI_FILE_READ_ORDERED`~~ ==[[versions/v31/API/MPI_FILE_READ_ORDERED|MPI_FILE_READ_ORDERED]]== is a collective version of the ~~`MPI_FILE_READ_SHARED`~~ ==[[versions/v31/API/MPI_FILE_READ_SHARED|MPI_FILE_READ_SHARED]]== interface.

~~`MPI_FILE_WRITE_ORDERED` is a collective version of the~~

~~`MPI_FILE_WRITE_SHARED` interface.~~

==[[versions/v31/API/MPI_FILE_WRITE_ORDERED|MPI_FILE_WRITE_ORDERED]] is a collective version of the [[versions/v31/API/MPI_FILE_WRITE_SHARED|MPI_FILE_WRITE_SHARED]] interface.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The semantics of a collective access using a shared file pointer ~~is~~ ==are== that the accesses to the file will be in the order determined by the ranks of the processes within the group. For each process, the location in the file at which data is accessed is the position at which the shared file pointer would be after all processes whose ranks within the group less than that of this process had accessed their data. In addition, in order to prevent subsequent shared offset accesses by the same processes from interfering with this collective access, the call might return only after all the processes within the group have initiated their accesses. When the call returns, the shared file pointer points to the next etype accessible, according to the file view used by all processes, after the last etype requested.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The semantics of ~~a~~ collective access using a shared file pointer are that the accesses to the file will be in the order determined by the ranks of the processes within the group. For each ~~process,~~ ==process in the group,== the location in the file at which data is accessed is the position at which the shared file pointer would be after all processes ~~whose~~ ==with== ranks ~~within~~ ==in== the group less than that of this process had accessed their data. In addition, in order to prevent subsequent shared offset accesses by the same processes from interfering with this collective access, the call might return only after all the processes within the group have initiated their accesses. When the call returns, the shared file pointer points to the next etype accessible, according to the file view used by all processes, after the last etype requested.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Collective Operations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Collective Operations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Collective Operations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Collective Operations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Collective Operations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Collective Operations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Collective Operations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Collective Operations]]

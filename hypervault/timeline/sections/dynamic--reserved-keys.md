---
title: "Reserved Keys"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Reserved Keys

Chapter **dynamic** · in [[versions/v20/sections/dynamic#Reserved Keys|MPI-2.0]], [[versions/v21/sections/dynamic#Reserved Keys|MPI-2.1]], [[versions/v22/sections/dynamic#Reserved Keys|MPI-2.2]], [[versions/v30/sections/dynamic#Reserved Keys|MPI-3.0]], [[versions/v31/sections/dynamic#Reserved Keys|MPI-3.1]], [[versions/v40/sections/dynamic#Reserved Keys|MPI-4.0]], [[versions/v41/sections/dynamic#Reserved Keys|MPI-4.1]], [[versions/v50/sections/dynamic#Reserved Keys|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~The following keys are reserved. An~~

~~implementation is not required to interpret these keys, but if it does interpret the key, it must provide the functionality described.~~

==The following keys are reserved. An implementation is not required to interpret these keys, but if it does interpret the key, it must provide the functionality described.==

~~`wdir`   Value is the name of a directory on a machine on which the spawned process(es) execute(s).~~

~~This directory is made the working directory of the executing process(es).~~

~~The format of the directory name is determined by the implementation.~~

~~`path`   Value is a directory or set of directories where the implementation should look for the executable. The format of path is determined by the implementation.~~

==`wdir`   Value is the name of a directory on a machine on which the spawned process(es) execute(s). This directory is made the working directory of the executing process(es). The format of the directory name is determined by the implementation.==

==`path`   Value is a directory or set of directories where the implementation should look for the executable. The format of `path` is determined by the implementation.==

3. `1,2,4,8,16,32,64,128,256,512,1024,2048,4096` allows ==a== power-of-two number of processes.

4. `2:10000:2` allows ==an== even number of processes.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

==`mpi_initial_errhandler`   Value is the name of an errhandler that will be set as the initial error handler. The `mpi_initial_errhandler` key can take the case insensitive values `mpi_errors_are_fatal`, `mpi_errors_abort`, and `mpi_errors_return` representing the predefined MPI error handlers (`MPI_ERRORS_ARE_FATAL`—the default, `MPI_ERRORS_ABORT`, and `MPI_ERRORS_RETURN`, respectively). Other, nonstandard values may be supported by the implementation, which should document the resultant behavior.==

4. `2:10000:2` allows an even number of ==processes up to a maximum of 10,000== processes.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~`host`   Value is a hostname. The format of the hostname is determined by the implementation.~~

~~`arch`   Value is an architecture name. Valid architecture names and what they mean are determined by the implementation.~~

~~`wdir`   Value is the name of a directory on a machine on which the spawned process(es) execute(s). This directory is made the working directory of the executing process(es). The format of the directory name is determined by the implementation.~~

~~`path`   Value is a directory or set of directories where the implementation should look for the executable. The format of `path` is determined by the implementation.~~

~~`file`   Value is the name of a file in which additional information is specified. The format of the filename and internal format of the file are determined by the implementation.~~

~~`mpi_initial_errhandler`   Value is the name of an errhandler that will be set as the initial error handler. The `mpi_initial_errhandler` key can take the case insensitive values `mpi_errors_are_fatal`, `mpi_errors_abort`, and `mpi_errors_return` representing the predefined MPI error handlers (`MPI_ERRORS_ARE_FATAL`—the default, `MPI_ERRORS_ABORT`, and `MPI_ERRORS_RETURN`, respectively). Other, nonstandard values may be supported by the implementation, which should document the resultant behavior.~~

~~`soft`   Value specifies a set of numbers which are allowed values for the number of processes that [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] (et al.) may create. The format of the value is a comma-separated list of Fortran-90 triplets each of which specifies a set of integers and which together specify the set formed by the union of these sets. Negative values in this set and values greater than `maxprocs` are ignored. MPI will spawn the largest number of processes it can, consistent with some number in the set. The order in which triplets are given is not significant.~~

==Value is a hostname. The format of the hostname is determined by the implementation.==

==Value is an architecture name. Valid architecture names and what they mean are determined by the implementation.==

==Value is the name of a directory on a machine on which the spawned process(es) execute(s). This directory is made the working directory of the executing process(es). The format of the directory name is determined by the implementation.==

==Value is a directory or set of directories where the implementation should look for the executable. The format of `path` is determined by the implementation.==

==Value is the name of a file in which additional information is specified. The format of the filename and internal format of the file are determined by the implementation.==

==Value is the name of an errhandler that will be set as the initial error handler. The `mpi_initial_errhandler` key can take the case insensitive values `mpi_errors_are_fatal`, `mpi_errors_abort`, and `mpi_errors_return` representing the predefined MPI error handlers (`MPI_ERRORS_ARE_FATAL`—the default, `MPI_ERRORS_ABORT`, and `MPI_ERRORS_RETURN`, respectively). Other, nonstandard values may be supported by the implementation, which should document the resultant behavior.==

==Value is a comma separated list of memory allocation kinds. Support for these memory allocation kinds is requested from the MPI library (see Section [[versions/v41/sections/dynamic#Memory Allocation Info|Memory Allocation Info]] ).==

==Value specifies a set of numbers that are allowed values for the number of processes that [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] (et al.) may create. The format of the value is a comma-separated list of Fortran-90 triplets each of which specifies a set of integers and that together specify the set formed by the union of these sets. Negative values in this set and values greater than `maxprocs` are ignored. MPI will spawn the largest number of processes it can, consistent with some number in the set. The order in which triplets are given is not significant.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#Reserved Keys]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#Reserved Keys]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#Reserved Keys]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#Reserved Keys]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#Reserved Keys]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Reserved Keys]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Reserved Keys]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Reserved Keys]]

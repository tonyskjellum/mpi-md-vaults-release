---
title: "Subarray Filetype Constructor"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Subarray Filetype Constructor

Chapter **io** · in [[versions/v20/sections/io#Subarray Filetype Constructor|MPI-2.0]], [[versions/v21/sections/io#Subarray Filetype Constructor|MPI-2.1]], [[versions/v22/sections/io#Subarray Filetype Constructor|MPI-2.2]], [[versions/v30/sections/io#Subarray Filetype Constructor|MPI-3.0]], [[versions/v31/sections/io#Subarray Filetype Constructor|MPI-3.1]], [[versions/v40/sections/io#Subarray Filetype Constructor|MPI-4.0]], [[versions/v41/sections/io#Subarray Filetype Constructor|MPI-4.1]], [[versions/v50/sections/io#Subarray Filetype Constructor|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~Assume we are writing out a 100x100 2D array of double precision floating point numbers that is distributed among 4 processes such that each process has a block of 25 columns (e.g., process 0 has columns 0-24, process 1 has columns 25-49, etc.; see Figure [[versions/v21/sections/io#Subarray Filetype Constructor|Subarray Filetype Constructor]] ). To create the filetypes for each process one could use the following C program:~~

==Assume we are writing out a 100x100 2D array of double precision floating point numbers that is distributed among 4 processes such that each process has a block of 25 columns (e.g., process 0 has columns 0-24, process 1 has columns 25-49, etc.; see Figure [[versions/v21/sections/io#Subarray Filetype Constructor|Subarray Filetype Constructor]] ). To create the filetypes for each process one could use the following C program==

==(see Section [[versions/v21/sections/datatypes#Subarray Datatype Constructor|Subarray Datatype Constructor]] on==

==page [[versions/v21/sections/datatypes#Subarray Datatype Constructor|Subarray Datatype Constructor]] ):==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~Assume we are writing out a 100x100 2D array of double precision floating point numbers that is distributed among 4 processes such that each process has a block of 25 columns (e.g., process 0 has columns 0-24, process 1 has columns 25-49, etc.; see Figure [[versions/v30/sections/io#Subarray Filetype Constructor|Subarray Filetype Constructor]] ). To create the filetypes for each process one could use the following C program~~

~~(see Section [[versions/v30/sections/datatypes#Subarray Datatype Constructor|Subarray Datatype Constructor]] on~~

==Assume we are writing out a 100x100 2D array of double precision floating point numbers that is distributed among 4 processes such that each process has a block of 25 columns (e.g., process 0 has columns 0–24, process 1 has columns 25–49, etc.; see Figure [[versions/v30/sections/io#Subarray Filetype Constructor|Subarray Filetype Constructor]] ). To create the filetypes for each process one could use the following C program (see Section [[versions/v30/sections/datatypes#Subarray Datatype Constructor|Subarray Datatype Constructor]] on==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Assume we are writing out a 100x100 2D array of double precision floating point numbers that is distributed among 4 processes such that each process has a block of 25 columns (e.g., process 0 has columns 0–24, process 1 has columns 25–49, etc.; see Figure [[versions/v31/sections/io#Subarray Filetype Constructor|Subarray Filetype Constructor]] ). To create the filetypes for each process one could use the following C program (see Section [[versions/v31/sections/datatypes#Subarray Datatype Constructor|Subarray Datatype Constructor]] on~~

~~page [[versions/v31/sections/datatypes#Subarray Datatype Constructor|Subarray Datatype Constructor]] ):~~

==Assume we are writing out a 100x100 2D array of double precision floating point numbers that is distributed among 4 processes such that each process has a block of 25 columns (e.g., process 0 has columns 0–24, process 1 has columns 25–49, etc.; see Figure [[versions/v31/sections/io#Subarray Filetype Constructor|Subarray Filetype Constructor]] ). To create the filetypes for each process one could use the following C program (see Section [[versions/v31/sections/datatypes#Subarray Datatype Constructor|Subarray Datatype Constructor]] ):==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

Assume we are writing out a ~~100x100~~ ==$`100\times100`$== 2D array of double precision floating point numbers that is distributed among 4 processes such that each process has a block of 25 columns (e.g., process 0 has columns 0–24, process 1 has columns 25–49, etc.; see Figure [[versions/v40/sections/io#Subarray Filetype Constructor|Subarray Filetype Constructor]] ). To create the filetypes for each process one could use the following C program (see Section [[versions/v40/sections/datatypes#Subarray Datatype Constructor|Subarray Datatype Constructor]] ):

double precision subarray(100,25) integer filetype, rank, ierror integer sizes(2), subsizes(2), starts(2)

call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror) ~~sizes(1)=100 sizes(2)=100 subsizes(1)=100 subsizes(2)=25 starts(1)=0 starts(2)=rank*subsizes(2)~~ ==sizes(1) = 100 sizes(2) = 100 subsizes(1) = 100 subsizes(2) = 25 starts(1) = 0 starts(2) = rank*subsizes(2)==

call MPI_TYPE_CREATE_SUBARRAY(2, sizes, subsizes, starts, & MPI_ORDER_FORTRAN, MPI_DOUBLE_PRECISION, & filetype, ierror)

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~       double subarray[100][25];        MPI_Datatype filetype;        int sizes[2], subsizes[2], starts[2];        int rank;~~

~~       MPI_Comm_rank(MPI_COMM_WORLD, &rank);        sizes[0]=100; sizes[1]=100;        subsizes[0]=100; subsizes[1]=25;        starts[0]=0; starts[1]=rank*subsizes[1];~~

~~       MPI_Type_create_subarray(2, sizes, subsizes, starts, MPI_ORDER_C,                                 MPI_DOUBLE, &filetype);~~

==(code block added)==
``` [MPI]C
double subarray[100][25];
MPI_Datatype filetype;
int sizes[2], subsizes[2], starts[2];
int rank;

MPI_Comm_rank(MPI_COMM_WORLD, &rank);
sizes[0]=100; sizes[1]=100;
subsizes[0]=100; subsizes[1]=25;
starts[0]=0; starts[1]=rank*subsizes[1];

MPI_Type_create_subarray(2, sizes, subsizes, starts, MPI_ORDER_C,
                         MPI_DOUBLE, &filetype);
```

~~    double precision subarray(100,25)     integer filetype, rank, ierror     integer sizes(2), subsizes(2), starts(2)~~

~~    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)     sizes(1)    = 100     sizes(2)    = 100     subsizes(1) = 100     subsizes(2) = 25     starts(1)   = 0     starts(2)   = rank*subsizes(2)~~

~~    call MPI_TYPE_CREATE_SUBARRAY(2, sizes, subsizes, starts, &                MPI_ORDER_FORTRAN, MPI_DOUBLE_PRECISION,       &                filetype, ierror)~~

==Writing out a $`100\times100`$ 2D array of double precision floating point numbers that is distributed among 4 processes such that each process has a block of 25 columns (e.g., process 0 has columns 0–24, process 1 has columns 25–49, etc.; see Figure [[versions/v41/sections/io#Subarray Filetype Constructor|Subarray Filetype Constructor]] ).==

==(code block added)==
``` [MPI]Fortran
double precision subarray(100,25)
integer filetype, rank, ierror
integer sizes(2), subsizes(2), starts(2)

call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)
sizes(1)    = 100
sizes(2)    = 100
subsizes(1) = 100
subsizes(2) = 25
starts(1)   = 0
starts(2)   = rank*subsizes(2)

call MPI_TYPE_CREATE_SUBARRAY(2, sizes, subsizes, starts, &
           MPI_ORDER_FORTRAN, MPI_DOUBLE_PRECISION,       &
           filetype, ierror)
```

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

~~*Figure: Example local array filetype for process 1*~~

==*Figure: Example local array filetype for process 1*==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Subarray Filetype Constructor]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Subarray Filetype Constructor]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Subarray Filetype Constructor]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Subarray Filetype Constructor]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Subarray Filetype Constructor]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Subarray Filetype Constructor]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Subarray Filetype Constructor]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Subarray Filetype Constructor]]

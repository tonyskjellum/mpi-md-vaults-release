---
title: "Portable MPI Process Startup"
chapter: inquiry
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/inquiry]
---

# Portable MPI Process Startup

Chapter **inquiry** · in [[versions/v21/sections/inquiry#Portable MPI Process Startup|MPI-2.1]], [[versions/v22/sections/inquiry#Portable MPI Process Startup|MPI-2.2]], [[versions/v30/sections/inquiry#Portable MPI Process Startup|MPI-3.0]], [[versions/v31/sections/inquiry#Portable MPI Process Startup|MPI-3.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

be at least one way to start `<program>` with an initial ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== whose group contains `<numprocs>` processes. Other arguments to `mpiexec` may be implementation-dependent.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~Having a standard startup mechanism also extends the portability of MPI programs one step further, to the command lines and scripts that manage them. For example, a validation suite script that runs hundreds of programs can be a portable script if it is written using such a standard starup mechanism.~~

~~In order that the “standard” command not be confused with existing practice, which is not standard and not portable among implementations,~~

==Having a standard startup mechanism also extends the portability of MPI programs one step further, to the command lines and scripts that manage them. For example, a validation suite script that runs hundreds of programs can be a portable script if it is written using such a standard starup mechanism. In order that the “standard” command not be confused with existing practice, which is not standard and not portable among implementations,==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

> Implementors, if they do provide a special startup command for MPI programs, are advised to give it the following form. The syntax is chosen in order that `mpiexec` be able to be viewed as a command-line version of [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] (See Section [[versions/v31/sections/dynamic#Reserved Keys|Reserved Keys]] ). > > Analogous to [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , we have > > mpiexec -n <maxprocs> > -soft < > > -host < > > -arch < > > -wdir < > > -path < > > -file < > > ... > <command line> > > for the case where a single command line for the application program and its arguments will suffice. See Section [[versions/v31/sections/dynamic#Reserved Keys|Reserved Keys]] for the meanings of these arguments. For the case corresponding to [[versions/v31/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] there are two possible formats: > > Form A: > > mpiexec { <above arguments> } : { ... } : { ... } : ... : { ... } > > As with [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , all the arguments are optional. (Even the `-n ~~x `~~ ==x`== argument is optional; the default is implementation dependent. It might be `1`, it might be taken from an environment variable, or it might be specified at compile time.) The names and meanings of the arguments are taken from the keys in the `info` argument to [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . There may be other, implementation-dependent arguments as well. > > Note that Form A, though convenient to type, prevents colons from being program arguments. Therefore an alternate, file-based form is allowed: > > Form B: > > mpiexec -configfile <filename> > > where the lines of $`<`$`filename`$`>`$ are of the form separated by the colons in Form A. Lines beginning with ‘`#`’ are comments, and lines may be continued by terminating the partial line with ‘`‘`\ > ’. > > > > Start 16 instances of `myprog` on the current or default machine: > > mpiexec -n 16 myprog > > > > > > Start 10 processes on the machine called `ferrari`: > > mpiexec -n 10 -host ferrari myprog > > > > > > Start three copies of the same program with different command-line arguments: > > mpiexec myprog infile1 : myprog infile2 : myprog infile3 > > > > > > Start the `ocean` program on five Suns and the `atmos` program on 10 RS/6000’s: > > mpiexec -n 5 -arch sun ocean : -n 10 -arch rs6000 atmos > > It is assumed that the implementation in this case has a method for choosing hosts of the appropriate type. Their ranks are in the order specified. > > > > > > Start the `ocean` program on five Suns and the `atmos` program on 10 RS/6000’s (Form B): > > mpiexec -configfile myfile > > where `myfile` contains > > -n 5 -arch sun ocean > -n 10 -arch rs6000 atmos > >

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Portable MPI Process Startup]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Portable MPI Process Startup]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Portable MPI Process Startup]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Portable MPI Process Startup]]

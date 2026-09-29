---
title: "Portable MPI Process Startup"
chapter: dynamic
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/dynamic]
---

# Portable MPI Process Startup

Chapter **dynamic** · in [[versions/v40/sections/dynamic#Portable MPI Process Startup|MPI-4.0]], [[versions/v41/sections/dynamic#Portable MPI Process Startup|MPI-4.1]], [[versions/v50/sections/dynamic#Portable MPI Process Startup|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

While a standardized startup mechanism improves the usability of MPI, the range of environments is so diverse (e.g., there may not even be a command line interface) that MPI cannot mandate such a mechanism. Instead, MPI specifies an `mpiexec` startup command and ~~recommends~~ ==recommends,== but does not require it, as advice to implementors. However, if an implementation does provide a command called `mpiexec`, it must be of the form described below.

> Implementors, if they do provide a special startup command for MPI programs, are advised to give it the following form. The syntax is chosen in order that `mpiexec` be able to be viewed as a command-line version of [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] (See Section [[versions/v41/sections/dynamic#Reserved Keys|Reserved Keys]] ). > > Analogous to [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , we have > > mpiexec -n <maxprocs> > -soft < > > -host < > > -arch < > > -wdir < > > -path < > > -file < > > -initial-errhandler ==< > > -memory-alloc-kinds== < > > ... > <command line> > > for the case where a single command line for the application program and its arguments will suffice. See Section [[versions/v41/sections/dynamic#Reserved Keys|Reserved Keys]] for the meanings of these arguments. For the case corresponding to [[versions/v41/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] there are two possible formats: > > Form A: > > mpiexec { <above arguments> } : { ... } : { ... } : ... : { ... } > > As with [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , all the arguments are optional. (Even the `-n x` argument is optional; the default is implementation dependent. It might be `1`, it might be taken from an environment variable, or it might be specified at compile time.) The names and meanings of the arguments are taken from the keys in the `info` argument to [[versions/v41/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . There may be other, implementation-dependent arguments as well. > > Note that Form A, though convenient to type, prevents colons from being program arguments. Therefore an alternate, file-based form is allowed: > > Form B: > > mpiexec -configfile <filename> > > where the lines of $`<`$`filename`$`>`$ are of the form separated by the colons in Form A. Lines beginning with ‘`#`’ are comments, and lines may be continued by terminating the partial line with ‘`‘`\ > ’. > > > > Start 16 instances of `myprog` on the current or default machine: > > mpiexec -n 16 myprog > > > > > > Start 10 instances of `myprog` on the machine called `ferrari`: > > mpiexec -n 10 -host ferrari myprog > > > > > > Start 3 instances of the same program `myprog` with different command-/line arguments: > > mpiexec myprog infile1 : myprog infile2 : myprog infile3 > > > > > > Start 5 instances of the `ocean` program on x86_64 hosts and 10 instances of the `atmos` program on Power9 hosts (Form B): > > mpiexec -n 5 -arch x86_64 ocean : -n 10 -arch power9 atmos > > It is assumed that the implementation in this case has a method for choosing hosts of the appropriate type. Their ranks ==in `MPI_COMM_WORLD`== are in the order specified. > > > > > > Start the `ocean` program on five Suns and the `atmos` program on 10 RS/6000’s (Form B): > > mpiexec -configfile myfile > > where `myfile` contains > > -n 5 -arch sun ocean > -n 10 -arch rs6000 atmos > >

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

A number of implementations of MPI provide a startup command for MPI programs that is of the form ==`mpirun`==

~~Having a standard startup mechanism also extends the portability of MPI programs one step further, to the command lines and scripts that manage them. For example, a validation suite script that runs hundreds of programs can be a portable script if it is written using such a standard startup mechanism. In order that the “standard” command not be confused with existing practice, which is not standard and not portable among implementations,~~

~~instead of `mpirun` MPI specifies `mpiexec`.~~

~~While a standardized startup mechanism improves the usability of MPI, the range of environments is so diverse (e.g., there may not even be a command line interface) that MPI cannot mandate such a mechanism. Instead, MPI specifies an `mpiexec` startup command and recommends, but does not require it, as advice to implementors. However, if an implementation does provide a command called `mpiexec`, it must be of the form described below.~~

==Having a standard startup mechanism also extends the portability of MPI programs one step further, to the command lines and scripts that manage them. For example, a validation suite script that runs hundreds of programs can be a portable script if it is written using such a standard startup mechanism. In order that the “standard” command not be confused with existing practice, which is not standard and not portable among implementations, instead of `mpirun` MPI specifies `mpiexec`.==

==While a standardized startup mechanism improves the usability of MPI, the range of environments is so diverse (e.g., there may not even be a command line interface) that MPI cannot mandate such a mechanism. Instead, MPI specifies an `mpiexec` startup command and recommends but does not require it, as advice to implementors. However, if an implementation does provide a command called `mpiexec`, it must be of the form described below.==

> Implementors, if they do provide a special startup command for MPI programs, are advised to give it the following form. The syntax is chosen in order that `mpiexec` be able to be viewed as a command-line version of [[versions/v50/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] (See Section [[versions/v50/sections/dynamic#Reserved Keys|Reserved Keys]] ). > > Analogous to [[versions/v50/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , we have > > mpiexec -n <maxprocs> > -soft < > > -host < > > -arch < > > -wdir < > > -path < > > -file < > > -initial-errhandler < > > -memory-alloc-kinds < > > ... > <command line> > > for the case where a single command line for the application program and its arguments will suffice. See Section [[versions/v50/sections/dynamic#Reserved Keys|Reserved Keys]] for the meanings of these arguments. For the case corresponding to [[versions/v50/API/MPI_COMM_SPAWN_MULTIPLE|MPI_COMM_SPAWN_MULTIPLE]] there are two possible formats: > > Form A: > > mpiexec { <above arguments> } : { ... } : { ... } : ... : { ... } > > As with [[versions/v50/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , all the arguments are optional. (Even the `-n x` argument is optional; the default is implementation dependent. It might be `1`, it might be taken from an environment variable, or it might be specified at compile time.) The names and meanings of the arguments are taken from the keys in the `info` argument to [[versions/v50/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] . There may be other, implementation-dependent arguments as well. > > Note that Form A, though convenient to type, prevents colons from being program arguments. Therefore an alternate, file-based form is allowed: > > Form B: > > mpiexec -configfile <filename> > > where the lines of $`<`$`filename`$`>`$ are of the form separated by the colons in Form A. Lines beginning with ‘`#`’ are comments, and lines may be continued by terminating the partial line with ‘`‘`\ > ’. > > > > Start 16 instances of `myprog` on the current or default machine: > > mpiexec -n 16 myprog > > > > > > Start 10 instances of `myprog` on the machine called `ferrari`: > > mpiexec -n 10 -host ferrari myprog > > > > > > Start 3 instances of the same program `myprog` with different command-/line arguments: > > mpiexec ==-n 1== myprog infile1 : ==-n 1== myprog infile2 : ==-n 1== myprog infile3 > > > > > > Start 5 instances of the `ocean` program on x86_64 hosts and 10 instances of the `atmos` program on Power9 hosts (Form B): > > mpiexec -n 5 -arch x86_64 ocean : -n 10 -arch power9 atmos > > It is assumed that the implementation in this case has a method for choosing hosts of the appropriate type. Their ranks in `MPI_COMM_WORLD` are in the order specified. > > > > > > Start the `ocean` program on five Suns and the `atmos` program on 10 RS/6000’s (Form B): > > mpiexec -configfile myfile > > where `myfile` contains > > -n 5 -arch sun ocean > -n 10 -arch rs6000 atmos > >

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#Portable MPI Process Startup]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/dynamic#Portable MPI Process Startup]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/dynamic#Portable MPI Process Startup]]

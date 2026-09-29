---
title: "Optimization Problems, an Overview"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Optimization Problems, an Overview

Chapter **binding** · in [[versions/v30/sections/binding#Optimization Problems, an Overview|MPI-3.0]], [[versions/v31/sections/binding#Optimization Problems, an Overview|MPI-3.1]], [[versions/v40/sections/binding#Optimization Problems, an Overview|MPI-4.0]], [[versions/v41/sections/binding#Optimization Problems, an Overview|MPI-4.1]], [[versions/v50/sections/binding#Optimization Problems, an Overview|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

- Code movement and register optimization problems; see ~~Section [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] on page~~ [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] .

- Temporary data movement and temporary memory modifications; see ~~Section [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] on page~~ [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] .

- Permanent data movement (e.g., through garbage collection); see ~~Section [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on page~~ [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] .

- to minimize the burden for the application programmer, e.g., as shown in Sections “Solutions” through “The (Poorly Performing) Fortran VOLATILE Attribute” on pages [[versions/v31/sections/binding#Solutions|Solutions]] ~~-~~ ==–== [[versions/v31/sections/binding#The (Poorly Performing) Fortran VOLATILE Attribute|The (Poorly Performing) Fortran VOLATILE Attribute]] ,

- to minimize the requirements defined in ~~Section [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] on page~~ [[versions/v31/sections/binding#Requirements on Fortran Compilers|Requirements on Fortran Compilers]] .

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

MPI provides operations that may be hidden from the user code and run concurrently with it, accessing the same memory as user code. Examples include the data transfer for an [[versions/v41/API/MPI_IRECV|MPI_IRECV]] . The optimizer of a compiler will assume that it can recognize periods when a copy of a variable can be kept in a register without reloading from or storing to memory. When the user code is working with a register copy of some variable while the hidden operation reads or writes the memory copy, problems occur. These problems are independent of the Fortran support method; i.e., they occur with the `mpi_f08` module, the `mpi` module, and the ==(deprecated)== `mpif.h` include file.

<table> <caption> Occurrence of Fortran optimization problems in several usage areas</caption> <tbody> <tr> <td style="text-align: ~~left;">Optimization ...</td>~~ ==left;"><strong>Optimization ...</strong></td>== <td colspan="4" style="text-align: ~~center;">...~~ ==center;"><strong>...== may cause a problem ~~in</td>~~ ==in</strong></td>== </tr> <tr> <td style="text-align: left;"></td> <td colspan="4" style="text-align: ~~center;">following~~ ==center;"><strong>following== usage ~~areas</td>~~ ==areas</strong></td>== </tr> <tr> <td style="text-align: left;"></td> <td style="text-align: left;">Nonbl.</td> <td style="text-align: left;">1-sided</td> <td style="text-align: left;">Split</td> <td style="text-align: left;">Bottom</td> </tr> <tr> <td style="text-align: left;">Code movement</td> <td style="text-align: left;">yes</td> <td style="text-align: left;">yes</td> <td style="text-align: left;">no</td> <td style="text-align: left;">yes</td> </tr> <tr> <td style="text-align: left;">and register optimization</td> <td style="text-align: left;"></td> <td style="text-align: left;"></td> <td style="text-align: left;"></td> <td style="text-align: left;"></td> </tr> <tr> <td style="text-align: left;">Temporary data movement</td> <td style="text-align: left;">yes</td> <td style="text-align: left;">yes</td> <td style="text-align: left;">yes</td> <td style="text-align: left;">no</td> </tr> <tr> <td style="text-align: left;">Permanent data movement</td> <td style="text-align: left;">yes</td> <td style="text-align: left;">yes</td> <td style="text-align: left;">yes</td> <td style="text-align: left;">yes</td> </tr> </tbody> </table>

- to minimize the burden for the application programmer, e.g., as shown in Sections ~~“Solutions”~~ through ~~“The (Poorly Performing) Fortran VOLATILE Attribute”~~ on pages [[versions/v41/sections/binding#Solutions|Solutions]] – [[versions/v41/sections/binding#The (Poorly Performing) Fortran VOLATILE Attribute|The (Poorly Performing) Fortran VOLATILE Attribute]] ,

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Optimization Problems, an Overview]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Optimization Problems, an Overview]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Optimization Problems, an Overview]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Optimization Problems, an Overview]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Optimization Problems, an Overview]]

---
title: "Registers and Compiler Optimizations"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Registers and Compiler Optimizations

Chapter **one-side** · in [[versions/v20/sections/one-side#Registers and Compiler Optimizations|MPI-2.0]], [[versions/v21/sections/one-side#Registers and Compiler Optimizations|MPI-2.1]], [[versions/v22/sections/one-side#Registers and Compiler Optimizations|MPI-2.2]], [[versions/v30/sections/one-side#Registers and Compiler Optimizations|MPI-3.0]], [[versions/v31/sections/one-side#Registers and Compiler Optimizations|MPI-3.1]], [[versions/v40/sections/one-side#Registers and Compiler Optimizations|MPI-4.0]], [[versions/v41/sections/one-side#Registers and Compiler Optimizations|MPI-4.1]], [[versions/v50/sections/one-side#Registers and Compiler Optimizations|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

A coherence problem exists between variables kept in registers and the memory ~~value~~ ==values== of these variables. An RMA call may access a variable in memory (or cache), while the up-to-date value of this variable is in register. A get will not return the latest variable value, and a put may be overwritten when the register is stored back in memory. ==Note that these issues are unrelated to the RMA memory model; that is, these issues apply even if the memory model is `MPI_WIN_UNIFIED`.==

~~This problem, which also afflicts in some cases send/receive communication, is discussed more at length in Section [[versions/v30/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]] .~~

~~MPI implementations will avoid this problem for standard conforming C programs. Many Fortran compilers will avoid this problem, without disabling compiler optimizations. However, in order to avoid register coherence problems in a completely portable manner, users should restrict their use of RMA windows to variables stored in `COMMON` blocks, or to variables that were declared `VOLATILE` (while `VOLATILE` is not a standard Fortran declaration, it is supported by many Fortran compilers). Details and an additional solution are discussed in Section [[versions/v30/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]] , “A Problem with Register Optimization,” on page [[versions/v30/sections/binding#A Problem with Register Optimization|A Problem with Register Optimization]] . See also, “Problems Due to Data Copying and Sequence Association,” on page [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association|Problems Due to Data Copying and Sequence Association]] , for additional Fortran problems.~~

==This problem, which also afflicts in some cases send/receive communication, is discussed more at length in Section [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] .==

==Programs written in C avoid this problem, because of the semantics of C. Many Fortran compilers will avoid this problem, without disabling compiler optimizations. However, in order to avoid register coherence problems in a completely portable manner, users should restrict their use of RMA windows to variables stored in==

==modules or `COMMON` blocks. To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in Sections [[versions/v30/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] – [[versions/v30/sections/binding#Comparison with C|Comparison with C]] , especially in==

==Sections [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] and [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] on pages [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] – [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “<span class="sans-serif">Problems Due to Data Copying and Sequence Association with Subscript Triplets</span>” and “<span class="sans-serif">Vector Subscripts</span>”,==

==and in Sections [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “<span class="sans-serif">Optimization Problems</span>”, “<span class="sans-serif">Code Movements and Register Optimization</span>”, “<span class="sans-serif">Temporary Data Movements</span>” and “<span class="sans-serif">Permanent Data Movements</span>”. Sections “<span class="sans-serif">Solutions</span>” to “<span class="sans-serif">VOLATILE</span>” on pages [[versions/v30/sections/binding#Solutions|Solutions]] - [[versions/v30/sections/binding#The (Poorly Performing) Fortran VOLATILE Attribute|The (Poorly Performing) Fortran VOLATILE Attribute]] discuss several solutions for the problem in this example.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~Source~~ ==**Source== of Process ~~1 Source~~ ==1Source== of Process ~~2 Executed~~ ==2Executed== in Process ~~2\~~ ==2**\== bbbb = 777 buff = 999 reg_A:=999\ call MPI_WIN_FENCE call MPI_WIN_FENCE\ call MPI_PUT(bbbb stop appl. thread\ into buff of process 2) buff:=777 in PUT handler\ continue appl. thread\ call MPI_WIN_FENCEcall MPI_WIN_FENCE\ ccc = buff ccc:=reg_A

~~Programs written in C avoid this problem, because of the semantics of C. Many Fortran compilers will avoid this problem, without disabling compiler optimizations. However, in order to avoid register coherence problems in a completely portable manner, users should restrict their use of RMA windows to variables stored in~~

~~modules or `COMMON` blocks. To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in Sections [[versions/v31/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] – [[versions/v31/sections/binding#Comparison with C|Comparison with C]] , especially in~~

~~Sections [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] and [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] on pages [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] – [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “<span class="sans-serif">Problems Due to Data Copying and Sequence Association with Subscript Triplets</span>” and “<span class="sans-serif">Vector Subscripts</span>”,~~

~~and in Sections [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] to [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “<span class="sans-serif">Optimization Problems</span>”, “<span class="sans-serif">Code Movements and Register Optimization</span>”, “<span class="sans-serif">Temporary Data Movements</span>” and “<span class="sans-serif">Permanent Data Movements</span>”. Sections “<span class="sans-serif">Solutions</span>” to “<span class="sans-serif">VOLATILE</span>” on pages [[versions/v31/sections/binding#Solutions|Solutions]] - [[versions/v31/sections/binding#The (Poorly Performing) Fortran VOLATILE Attribute|The (Poorly Performing) Fortran VOLATILE Attribute]] discuss several solutions for the problem in this example.~~

==Programs written in C avoid this problem, because of the semantics of C. Many Fortran compilers will avoid this problem, without disabling compiler optimizations. However, in order to avoid register coherence problems in a completely portable manner, users should restrict their use of RMA windows to variables stored in modules or `COMMON` blocks. To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in Sections [[versions/v31/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] – [[versions/v31/sections/binding#Comparison with C|Comparison with C]] .==

==Sections [[versions/v31/sections/binding#Solutions|Solutions]] to [[versions/v31/sections/binding#The (Poorly Performing) Fortran VOLATILE Attribute|The (Poorly Performing) Fortran VOLATILE Attribute]] discuss several solutions for the problem in this example.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~The problem is illustrated by the following code:~~

~~**Source of Process 1Source of Process 2Executed in Process 2**\ bbbb = 777 buff = 999 reg_A:=999\ call MPI_WIN_FENCE call MPI_WIN_FENCE\ call MPI_PUT(bbbb stop appl. thread\ into buff of process 2) buff:=777 in PUT handler\ continue appl. thread\ call MPI_WIN_FENCEcall MPI_WIN_FENCE\ ccc = buff ccc:=reg_A~~

==The problem is illustrated in Example [[versions/v41/sections/one-side#Registers and Compiler Optimizations|Registers and Compiler Optimizations]] .==

==    \textbf{Source of Process 1}                         \textbf{Source of Process 2}                      \textbf{Executed in Process 2}     bbbb = 777               buff = 999            reg_A:=999     call MPI_WIN_FENCE       call MPI_WIN_FENCE     call MPI_PUT(bbbb                              stop appl.\,thread      into buff of process 2)                       buff:=777 in PUT handler                                                    continue appl.\,thread     call MPI_WIN_FENCE       call MPI_WIN_FENCE                              ccc = buff            ccc:=reg_A==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~Sections [[versions/v50/sections/binding#Solutions|Solutions]]~~ ==In Section [[versions/v50/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] ,== to ~~[[versions/v50/sections/binding#The (Poorly Performing) Fortran VOLATILE Attribute|The (Poorly Performing) Fortran VOLATILE Attribute]]~~ discuss several solutions for the problem in this example.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Registers and Compiler Optimizations]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Registers and Compiler Optimizations]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Registers and Compiler Optimizations]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Registers and Compiler Optimizations]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Registers and Compiler Optimizations]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Registers and Compiler Optimizations]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Registers and Compiler Optimizations]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Registers and Compiler Optimizations]]

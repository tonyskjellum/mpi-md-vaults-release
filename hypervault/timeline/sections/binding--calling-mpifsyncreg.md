---
title: "Calling MPI_F_SYNC_REG"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Calling MPI_F_SYNC_REG

Chapter **binding** · in [[versions/v30/sections/binding#Calling MPI_F_SYNC_REG|MPI-3.0]], [[versions/v31/sections/binding#Calling MPI_F_SYNC_REG|MPI-3.1]], [[versions/v40/sections/binding#Calling MPI_F_SYNC_REG|MPI-4.0]], [[versions/v41/sections/binding#Calling MPI_F_SYNC_REG|MPI-4.1]], [[versions/v50/sections/binding#Calling MPI_F_SYNC_REG|MPI-5.0]]

Heading by release: MPI-3.0: “Calling MPI_F_SYNC_REG”; MPI-3.1: “Calling MPI_F_SYNC_REG”; MPI-4.0: “Calling MPI_F_SYNC_REG”; MPI-4.1: “Calling MPI_F_SYNC_REG”; MPI-5.0: “Calling MPI_F_SYNC_REG”

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~The compiler may be prevented from moving a reference to a buffer across a call to an MPI subroutine by surrounding the call by calls to an external subroutine with the buffer as an actual argument.~~

~~The MPI library provides the [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] routine for this purpose; see Section [[f90-syncreg]] on page [[f90-syncreg]] .~~

==The compiler may be prevented from moving a reference to a buffer across a call to an MPI subroutine by surrounding the call by calls to an external subroutine with the buffer as an actual argument. The MPI library provides the [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] routine for this purpose; see [[f90-syncreg]] .==

- In the example in ~~Section [[versions/v31/sections/one-side#Registers and Compiler Optimizations|Registers and Compiler Optimizations]] on page~~ [[versions/v31/sections/one-side#Registers and Compiler Optimizations|Registers and Compiler Optimizations]] , two asynchronous accesses must be protected: in Process 1, the access to `bbbb` must be protected similar to Example [[versions/v31/sections/binding#Nonblocking Operations|Nonblocking Operations]] , i.e., a call to [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] is needed after the second [[versions/v31/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] to guarantee that further accesses to `bbbb` are not moved ahead of the call to [[versions/v31/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] . In Process 2, both calls to [[versions/v31/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] together act as a communication call with `MPI_BOTTOM` as the buffer. That is, before the first fence and after the second fence, a call to [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] is needed to guarantee that accesses to `buff` are not moved after or ahead of the calls to [[versions/v31/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] . Using [[versions/v31/API/MPI_GET|MPI_GET]] instead of [[versions/v31/API/MPI_PUT|MPI_PUT]] , the same calls to [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] are necessary.

~~Source~~ ==**Source== of Process ~~1 Source~~ ==1** **Source== of Process ~~2\~~ ==2**\== bbbb = 777 buff = 999 call MPI_F_SYNC_REG(buff)\ call MPI_WIN_FENCE call MPI_WIN_FENCE\ call MPI_PUT(bbbb\ into buff of process 2)\ \ call MPI_WIN_FENCE call MPI_WIN_FENCE\ call MPI_F_SYNC_REG(bbbb) call MPI_F_SYNC_REG(buff)\ ccc = buff

- The temporary memory modification problem, i.e., ~~Example [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] on page [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] ,~~ ==[[Example]] exa:lang:memory:modification,== can **not** be solved with this method.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

~~{ Example~~ ==\textrm{Example== [[versions/v40/sections/binding#Nonblocking Operations|Nonblocking Operations]] } ~~{ Example~~ ==\textrm{Example== [[versions/v40/sections/binding#Nonblocking Operations|Nonblocking Operations]] } ~~can~~ ==\textrm{can== be solved ~~with can~~ ==with} \textrm{can== be solved ~~with~~ ==with}== call MPI_IRECV(buf,..req) buf = val call MPI_ISEND(buf,..req) copy = buf call MPI_WAIT(req,..) call MPI_WAIT(req,..) call MPI_F_SYNC_REG(buf) call MPI_F_SYNC_REG(buf) b1 = buf buf = val_overwrite

~~{ Example~~ ==\textrm{Example== [[versions/v40/sections/binding#MPIBOTTOM and Combining Independent Variables in Datatypes|MPIBOTTOM and Combining Independent Variables in Datatypes]] } ~~{ Example~~ ==\textrm{Example== [[versions/v40/sections/binding#MPIBOTTOM and Combining Independent Variables in Datatypes|MPIBOTTOM and Combining Independent Variables in Datatypes]] } ~~can~~ ==\textrm{can== be solved ~~with can~~ ==with} \textrm{can== be solved ~~with~~ ==with}== call MPI_F_SYNC_REG(buf) call MPI_F_SYNC_REG(buf) call MPI_RECV(MPI_BOTTOM,...) call MPI_SEND(MPI_BOTTOM,...) call MPI_F_SYNC_REG(buf) call MPI_F_SYNC_REG(buf)

The first call to [[versions/v40/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] is needed to finish all load and store references to `buf` prior to [[versions/v40/API/MPI_RECV|MPI_RECV]] / [[versions/v40/API/MPI_SEND|MPI_SEND]] ; the second call is needed to assure that any subsequent access to `buf` is not moved before [[versions/v40/API/MPI_RECV|MPI_RECV]] / ~~[[SEND]]~~ ==[[versions/v40/API/MPI_SEND|MPI_SEND]]== .

~~**Source~~ ==<span class="roman">**Source== of Process ~~1** **Source~~ ==1**</span> <span class="roman">**Source== of Process ~~2**\~~ ==2**</span>\== bbbb = 777 buff = ~~999~~ ==999\== call MPI_F_SYNC_REG(buff)\ call MPI_WIN_FENCE call MPI_WIN_FENCE\ call MPI_PUT(bbbb\ into buff of process 2)\ \ call MPI_WIN_FENCE call MPI_WIN_FENCE\ call MPI_F_SYNC_REG(bbbb) call MPI_F_SYNC_REG(buff)\ ccc = buff

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

~~\textrm{Example~~ ==<table> <tbody> <tr> <td style="text-align: left;">Example== [[versions/v41/sections/binding#Nonblocking Operations|Nonblocking Operations]] ~~} \textrm{Example~~ ==can be solved with</td> <td style="text-align: left;">Example== [[versions/v41/sections/binding#Nonblocking Operations|Nonblocking Operations]] ~~} \textrm{can~~ ==can== be solved ~~with} \textrm{can be solved with}~~ ==with</td> </tr> <tr> <td style="text-align: left;"><pre class="[MPI]Fortran" data-language="[MPI]Fortran"><code>call MPI_IRECV(buf,..req) &#10;== call ~~MPI_IRECV(buf,..req) buf~~ ==MPI_WAIT(req,..) call MPI_F_SYNC_REG(buf) b1 = buf</code></pre></td> <td style="text-align: left;"><pre class="[MPI]Fortran" data-language="[MPI]Fortran"><code>buf== = val call MPI_ISEND(buf,..req) copy = buf call MPI_WAIT(req,..) call ~~MPI_WAIT(req,..) call~~ MPI_F_SYNC_REG(buf) ~~call MPI_F_SYNC_REG(buf) b1 = buf~~ buf = ~~val_overwrite~~ ==val_overwrite</code></pre></td> </tr> </tbody> </table>==

~~\textrm{Example~~ ==<table> <tbody> <tr> <td style="text-align: left;">Example== [[versions/v41/sections/binding#MPIBOTTOM and Combining Independent Variables in Datatypes|MPIBOTTOM and Combining Independent Variables in Datatypes]] ~~} \textrm{Example~~ ==can be solved with</td> <td style="text-align: left;">Example== [[versions/v41/sections/binding#MPIBOTTOM and Combining Independent Variables in Datatypes|MPIBOTTOM and Combining Independent Variables in Datatypes]] ~~} \textrm{can~~ ==can== be solved ~~with} \textrm{can be solved with} call MPI_F_SYNC_REG(buf) call~~ ==with</td> </tr> <tr> <td style="text-align: left;"><pre class="[MPI]Fortran" data-language="[MPI]Fortran"><code>call== MPI_F_SYNC_REG(buf) call MPI_RECV(MPI_BOTTOM,...) call ==MPI_F_SYNC_REG(buf)</code></pre></td> <td style="text-align: left;"><pre class="[MPI]Fortran" data-language="[MPI]Fortran"><code>call MPI_F_SYNC_REG(buf) call== MPI_SEND(MPI_BOTTOM,...) call ~~MPI_F_SYNC_REG(buf) call MPI_F_SYNC_REG(buf)~~ ==MPI_F_SYNC_REG(buf)</code></pre></td> </tr> </tbody> </table>==

~~- In the example in [[versions/v41/sections/one-side#Registers and Compiler Optimizations|Registers and Compiler Optimizations]] , two asynchronous accesses must be protected: in Process 1, the access to `bbbb` must be protected similar to Example [[versions/v41/sections/binding#Nonblocking Operations|Nonblocking Operations]] , i.e., a call to [[versions/v41/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] is needed after the second [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] to guarantee that further accesses to `bbbb` are not moved ahead of the call to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] . In Process 2, both calls to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] together act as a communication call with `MPI_BOTTOM` as the buffer. That is, before the first fence and after the second fence, a call to [[versions/v41/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] is needed to guarantee that accesses to `buff` are not moved after or ahead of the calls to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] . Using [[versions/v41/API/MPI_GET|MPI_GET]] instead of [[versions/v41/API/MPI_PUT|MPI_PUT]] , the same calls to [[versions/v41/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] are necessary.~~

~~  <span class="roman">**Source of Process 1**</span> <span class="roman">**Source of Process 2**</span>\   bbbb = 777 buff = 999\   call MPI_F_SYNC_REG(buff)\   call MPI_WIN_FENCE call MPI_WIN_FENCE\   call MPI_PUT(bbbb\   into buff of process 2)\   \   call MPI_WIN_FENCE call MPI_WIN_FENCE\   call MPI_F_SYNC_REG(bbbb) call MPI_F_SYNC_REG(buff)\   ccc = buff~~

==- In the Example [[versions/v41/sections/one-side#Registers and Compiler Optimizations|Registers and Compiler Optimizations]] in [[versions/v41/sections/one-side#Registers and Compiler Optimizations|Registers and Compiler Optimizations]] , two asynchronous accesses must be protected: in Process 1, the access to `bbbb` must be protected similar to Example [[versions/v41/sections/binding#Nonblocking Operations|Nonblocking Operations]] , i.e., a call to [[versions/v41/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] is needed after the second [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] to guarantee that further accesses to `bbbb` are not moved ahead of the call to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] . In Process 2, both calls to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] together act as a communication call with `MPI_BOTTOM` as the buffer. That is, before the first fence and after the second fence, a call to [[versions/v41/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] is needed to guarantee that accesses to `buff` are not moved after or ahead of the calls to [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] . Using [[versions/v41/API/MPI_GET|MPI_GET]] instead of [[versions/v41/API/MPI_PUT|MPI_PUT]] , the same calls to [[versions/v41/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] are necessary.==

==  Solution for the Fortran register optimization problems with one-sided communication in Example [[versions/v41/sections/one-side#Registers and Compiler Optimizations|Registers and Compiler Optimizations]] .==

==      \textbf{Source of Process 1}                              \textbf{Source of Process 2}       bbbb = 777                    buff = 999                                     call MPI_F_SYNC_REG(buff)       call MPI_WIN_FENCE            call MPI_WIN_FENCE       call MPI_PUT(bbbb       into buff of process 2)==

==      call MPI_WIN_FENCE            call MPI_WIN_FENCE       call MPI_F_SYNC_REG(bbbb)     call MPI_F_SYNC_REG(buff)                                     ccc = buff==

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

- The problems illustrated by the Examples [[versions/v50/sections/binding#Nonblocking Operations|Nonblocking Operations]] and [[versions/v50/sections/binding#Nonblocking Operations|Nonblocking Operations]] can be solved by calling [[versions/v50/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] ==`(buf)`== once immediately after [[versions/v50/API/MPI_WAIT|MPI_WAIT]] .

- The temporary memory modification problem, ~~i.e.,~~ ==(see== [[Example]] ~~exa:lang:memory:modification,~~ ==exa:lang:memory:modification),== can **not** be solved with this method.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Calling MPI_F_SYNC_REG]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Calling MPI_F_SYNC_REG]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Calling MPI_F_SYNC_REG]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Calling MPI_F_SYNC_REG]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Calling MPI_F_SYNC_REG]]

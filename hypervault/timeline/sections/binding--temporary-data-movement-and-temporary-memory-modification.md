---
title: "Temporary Data Movement and Temporary Memory Modification"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Temporary Data Movement and Temporary Memory Modification

Chapter **binding** · in [[versions/v30/sections/binding#Temporary Data Movement and Temporary Memory Modification|MPI-3.0]], [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|MPI-3.1]], [[versions/v40/sections/binding#Temporary Data Movement and Temporary Memory Modification|MPI-4.0]], [[versions/v41/sections/binding#Temporary Data Movement and Temporary Memory Modification|MPI-4.1]], [[versions/v50/sections/binding#Temporary Data Movement and Temporary Memory Modification|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

The compiler is allowed to temporarily modify data in memory. Normally, this problem may occur only when overlapping communication and computation, as in Example [[versions/v31/sections/binding#Solutions|Solutions]] , Case (b) on page [[versions/v31/sections/binding#Solutions|Solutions]] . ~~Example [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] on page [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]]~~ ==[[Example]] exa:lang:memory:modification== also shows a possibility that could be problematic.

- With the local buffer at the origin process, between an RMA communication call and the ensuing synchronization call; see ~~Chapter [[versions/v31/sections/one-side#One-Sided Communications|One-Sided Communications]] on page [[versions/v31/sections/one-side#One-Sided Communications|One-Sided Communications]] .~~ ==[[Chapter]] chap:one-side-2.==

- With the local buffer in MPI parallel file I/O split collective operations between the [[..._BEGIN]] and [[..._END]] calls; see ~~Section [[versions/v31/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] on page~~ [[versions/v31/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] .

As already mentioned in subsection *The Fortran ASYNCHRONOUS attribute* on page [[versions/v31/sections/binding#The Fortran ASYNCHRONOUS Attribute|The Fortran ASYNCHRONOUS Attribute]] of Section [[versions/v31/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] , the `ASYNCHRONOUS` attribute can prevent compiler optimization with temporary data movement, but only if the receive buffer and the local references are separated into different variables, as shown in ~~Example [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on page [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]]~~ ==[[Example]] exa:lang:async:separated== and in ~~Example [[versions/v31/sections/binding#Comparison with C|Comparison with C]] on page [[versions/v31/sections/binding#Comparison with C|Comparison with C]] .~~ ==[[Example]] exa:lang:memory:modification:local-memory:separated.==

In ~~Example [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on page [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]]~~ ==[[Example]] exa:lang:async:separated== (which is a solution for the problem shown in ~~Example [[versions/v31/sections/binding#Solutions|Solutions]] on page [[versions/v31/sections/binding#Solutions|Solutions]] )~~ ==[[Example]] exa:lang:async== and in ~~Example [[versions/v31/sections/binding#Comparison with C|Comparison with C]] on page [[versions/v31/sections/binding#Comparison with C|Comparison with C]]~~ ==[[Example]] exa:lang:memory:modification:local-memory:separated== (which is a solution for the problem shown in ~~Example [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] on page [[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] ),~~ ==[[Example]] exa:lang:memory:modification:local-memory),== the array is split into inner and halo part and both disjoint parts are passed to a subroutine `separated_sections`. This routine overlaps the receiving of the halo data and the calculations on the inner part of the array. In a second step, the whole array is used to do the calculation on the elements where inner+halo is needed. Note that the halo and the inner area are strided arrays. Those can be used in non-blocking communication only with a TS 29113 based MPI library.

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

USE mpi_f08 REAL :: buf(100,100) CALL ~~MPI_Irecv(buf(1,1:100),...req,...)~~ ==MPI_Irecv(buf(1,1:100),..., req,...)== DO j=1,100 DO i=2,100 ~~buf(i,j)=....~~ ==buf(i,j)=...== END DO END DO CALL MPI_Wait(req,...)

REAL :: buf(100,100), buf_1dim(10000) EQUIVALENCE (buf(1,1), buf_1dim(1)) CALL ~~MPI_Irecv(buf(1,1:100),...req,...)~~ ==MPI_Irecv(buf(1,1:100),..., req,...)== tmp(1:100) = buf(1,1:100) DO j=1,10000 buf_1dim(h)=... END DO buf(1,1:100) = tmp(1:100) CALL MPI_Wait(req,...)

REAL :: buf(100,100), local_buf(100,100) CALL ~~MPI_Irecv(buf(1,1:100),...req,...)~~ ==MPI_Irecv(buf(1,1:100),..., req,...)== local_buf = buf DO j=1,100 DO i=2,100 ~~local_buf(i,j)=....~~ ==local_buf(i,j)=...== END DO END DO buf = local_buf ! may overwrite asynchronously received ! data in buf(1,1:100) CALL MPI_Wait(req,...)

- With the local buffer in MPI parallel file I/O split collective operations between the ~~[[..._BEGIN]]~~ ==`MPI_XXX_BEGIN`== and ~~[[..._END]]~~ ==`MPI_XXX_END`== calls; see [[versions/v40/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] .

In [[Example]] exa:lang:async:separated (which is a solution for the problem shown in [[Example]] exa:lang:async and in [[Example]] exa:lang:memory:modification:local-memory:separated (which is a solution for the problem shown in [[Example]] exa:lang:memory:modification:local-memory), the array is split into inner and halo part and both disjoint parts are passed to a subroutine `separated_sections`. This routine overlaps the receiving of the halo data and the calculations on the inner part of the array. In a second step, the whole array is used to do the calculation on the elements where inner+halo is needed. Note that the halo and the inner area are strided arrays. Those can be used in ~~non-blocking~~ ==nonblocking== communication only with a TS 29113 based MPI library.

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

~~    USE mpi_f08     REAL :: buf(100,100)     CALL MPI_Irecv(buf(1,1:100),..., req,...)     DO j=1,100       DO i=2,100         buf(i,j)=...       END DO     END DO     CALL MPI_Wait(req,...)~~

==(code block added)==
``` [MPI]Fortran
USE mpi_f08
REAL :: buf(100,100)
CALL MPI_Irecv(buf(1,1:100),..., req,...)
DO j=1,100
  DO i=2,100
    buf(i,j)=...
  END DO
END DO
CALL MPI_Wait(req,...)
```

~~    REAL :: buf(100,100),  buf_1dim(10000)     EQUIVALENCE (buf(1,1), buf_1dim(1))     CALL MPI_Irecv(buf(1,1:100),..., req,...)     tmp(1:100) = buf(1,1:100)     DO j=1,10000       buf_1dim(h)=...     END DO     buf(1,1:100) = tmp(1:100)     CALL MPI_Wait(req,...)~~

==(code block added)==
``` [MPI]Fortran
REAL :: buf(100,100),  buf_1dim(10000)
EQUIVALENCE (buf(1,1), buf_1dim(1))
CALL MPI_Irecv(buf(1,1:100),..., req,...)
tmp(1:100) = buf(1,1:100)
DO j=1,10000
  buf_1dim(h)=...
END DO
buf(1,1:100) = tmp(1:100)
CALL MPI_Wait(req,...)
```

~~    REAL :: buf(100,100), local_buf(100,100)     CALL MPI_Irecv(buf(1,1:100),..., req,...)     local_buf = buf     DO j=1,100       DO i=2,100         local_buf(i,j)=...       END DO     END DO     buf = local_buf ! may overwrite asynchronously received                     ! data in buf(1,1:100)     CALL MPI_Wait(req,...)~~

==(code block added)==
``` [MPI]Fortran
REAL :: buf(100,100), local_buf(100,100)
CALL MPI_Irecv(buf(1,1:100),..., req,...)
local_buf = buf
DO j=1,100
  DO i=2,100
    local_buf(i,j)=...
  END DO
END DO
buf = local_buf ! may overwrite asynchronously received
                ! data in buf(1,1:100)
CALL MPI_Wait(req,...)
```

As already mentioned in ~~subsection *The Fortran ASYNCHRONOUS attribute*~~ ==Section== on page [[versions/v41/sections/binding#The Fortran ASYNCHRONOUS Attribute|The Fortran ASYNCHRONOUS Attribute]] of Section [[versions/v41/sections/binding#Problems with Code Movement and Register Optimization|Problems with Code Movement and Register Optimization]] , the `ASYNCHRONOUS` attribute can prevent compiler optimization with temporary data movement, but only if the receive buffer and the local references are separated into different variables, as shown in [[Example]] exa:lang:async:separated and in [[Example]] exa:lang:memory:modification:local-memory:separated.

In [[Example]] exa:lang:async:separated (which is a solution for the problem shown in [[Example]] exa:lang:async and in [[Example]] exa:lang:memory:modification:local-memory:separated (which is a solution for the problem shown in [[Example]] exa:lang:memory:modification:local-memory), the array is split into inner and halo part and both disjoint parts are passed to a subroutine `separated_sections`. This routine overlaps the receiving of the halo data and the calculations on the inner part of the array. In a second step, the whole array is used to do the calculation on the elements where inner+halo is needed. Note that the halo and the inner area are strided arrays. Those can be used in nonblocking communication only with a ==Fortran 2018 (or== TS ~~29113~~ ==29113)== based MPI library.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

cannot be used to prevent such temporary data movement. These methods influence compiler optimization when library routines are called. They cannot prevent the optimizations of the code fragments shown in ~~Example~~ ==Examples== [[versions/v50/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] and [[versions/v50/sections/binding#Temporary Data Movement and Temporary Memory Modification|Temporary Data Movement and Temporary Memory Modification]] .

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Temporary Data Movement and Temporary Memory Modification]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Temporary Data Movement and Temporary Memory Modification]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Temporary Data Movement and Temporary Memory Modification]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Temporary Data Movement and Temporary Memory Modification]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Temporary Data Movement and Temporary Memory Modification]]

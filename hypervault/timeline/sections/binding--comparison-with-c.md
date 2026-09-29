---
title: "Comparison with C"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Comparison with C

Chapter **binding** · in [[versions/v30/sections/binding#Comparison with C|MPI-3.0]], [[versions/v31/sections/binding#Comparison with C|MPI-3.1]], [[versions/v40/sections/binding#Comparison with C|MPI-4.0]], [[versions/v41/sections/binding#Comparison with C|MPI-4.1]], [[versions/v50/sections/binding#Comparison with C|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~In C, subroutines which modify variables that are not in the argument list will not cause register optimization problems. This is because taking pointers to storage objects by using the `&` operator and later referencing the objects by indirection on the pointer is an integral part of the language. A C compiler understands the implications, so that the problem should not occur, in general. However, some compilers do offer optional aggressive optimization levels which may not be safe.~~

~~Problems due to temporary memory modifications can also occur in C. As above, the best advice is to avoid the problem: use different variables for buffers in nonblocking MPI operations and computation that is executed while a nonblocking operation is pending.~~

==In C, subroutines which modify variables that are not in the argument list will not cause register optimization problems. This is because taking pointers to storage objects by using the `&` operator and later referencing the objects by indirection on the pointer is an integral part of the language. A C compiler understands the implications, so that the problem should not occur, in general. However, some compilers do offer optional aggressive optimization levels which may not be safe. Problems due to temporary memory modifications can also occur in C. As above, the best advice is to avoid the problem: use different variables for buffers in nonblocking MPI operations and computation that is executed while a nonblocking operation is pending.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Protecting GPU optimizations with the ~~ASYNCHRONOUS~~ ==`ASYNCHRONOUS`== attribute.

USE mpi_f08 REAL :: buf(100,100) CALL separated_sections(buf(1:1,1:100), buf(2:100,1:100)) END SUBROUTINE separated_sections(buf_halo, buf_inner) REAL, ASYNCHRONOUS :: buf_halo(1:1,1:100) REAL :: buf_inner(2:100,1:100) REAL :: local_buf(2:100,100) CALL ~~MPI_Irecv(buf_halo(1,1:100),...req,...)~~ ==MPI_Irecv(buf_halo(1,1:100),..., req,...)== local_buf = buf_inner DO j=1,100 DO i=2,100 ~~local_buf(i,j)=....~~ ==local_buf(i,j)=...== END DO END DO buf_inner = local_buf ! buf_halo is not touched!!! CALL MPI_Wait(req,...)

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

In C, subroutines ~~which~~ ==that== modify variables that are not in the argument list will not cause register optimization problems. This is because taking pointers to storage objects by using the `&` operator and later referencing the objects by indirection on the pointer is an integral part of the language. A C compiler understands the implications, so that the problem should not occur, in general. However, some compilers do offer optional aggressive optimization levels ~~which~~ ==that== may not be safe. Problems due to temporary memory modifications can also occur in C. As above, the best advice is to avoid the problem: use different variables for buffers in nonblocking MPI operations and computation that is executed while a nonblocking ==communication== operation is ~~pending.~~ ==*pending*.==

~~    USE mpi_f08     REAL :: buf(100,100)     CALL separated_sections(buf(1:1,1:100), buf(2:100,1:100))     END     SUBROUTINE separated_sections(buf_halo, buf_inner)     REAL, ASYNCHRONOUS :: buf_halo(1:1,1:100)     REAL :: buf_inner(2:100,1:100)     REAL :: local_buf(2:100,100)     CALL MPI_Irecv(buf_halo(1,1:100),..., req,...)     local_buf = buf_inner     DO j=1,100       DO i=2,100         local_buf(i,j)=...       END DO     END DO     buf_inner = local_buf ! buf_halo is not touched!!!     CALL MPI_Wait(req,...)~~

==(code block added)==
``` [MPI08]Fortran
USE mpi_f08
REAL :: buf(100,100)
CALL separated_sections(buf(1:1,1:100), buf(2:100,1:100))
END

SUBROUTINE separated_sections(buf_halo, buf_inner)
REAL, ASYNCHRONOUS :: buf_halo(1:1,1:100)
REAL :: buf_inner(2:100,1:100)
REAL :: local_buf(2:100,100)

CALL MPI_Irecv(buf_halo(1,1:100),..., req,...)
local_buf = buf_inner
DO j=1,100
  DO i=2,100
    local_buf(i,j)=...
  END DO
END DO
buf_inner = local_buf ! buf_halo is not touched!!!

CALL MPI_Wait(req,...)
```

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Comparison with C]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Comparison with C]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Comparison with C]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Comparison with C]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Comparison with C]]

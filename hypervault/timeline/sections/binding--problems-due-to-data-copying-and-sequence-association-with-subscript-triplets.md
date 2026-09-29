---
title: "Problems Due to Data Copying and Sequence Association with Subscript Triplets"
chapter: binding
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Problems Due to Data Copying and Sequence Association with Subscript Triplets

Chapter **binding** · in [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|MPI-3.0]], [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|MPI-3.1]], [[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|MPI-4.0]], [[versions/v41/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|MPI-4.1]], [[versions/v50/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

In this case, the individual elements `s(1)`, `s(6)`, and `s(11)` are sent between the start of [[versions/v31/API/MPI_ISEND|MPI_ISEND]] and the end of [[versions/v31/API/MPI_WAIT|MPI_WAIT]] even though the compiled code will not copy `s(1:100:5)` to a real contiguous temporary scratch buffer. Instead, the compiled code will pass a descriptor to [[versions/v31/API/MPI_ISEND|MPI_ISEND]] that allows MPI to operate directly on `s(1)`, `s(6)`, `s(11)`, ~~...,~~ ==$`...`$,== `s(96)`. The called [[versions/v31/API/MPI_ISEND|MPI_ISEND]] routine will take only the first three of these elements due to the type signature “`3, MPI_REAL`”.

==  In this case, the use of Fortran arrays with subscript triplets as actual choice buffer arguments in any nonblocking MPI operation (which also includes persistent request, and split collectives) may cause undefined behavior. They may, however, be used in blocking MPI operations.==

~~  In Fortran, array data is not necessarily stored contiguously. For example, the array section `A(1:N:2)` involves only the elements of `A` with indices 1, 3, 5, .... The same is true for a pointer array whose target is such a section. Most compilers ensure that an array that is a dummy argument is held in contiguous memory if it is declared with an explicit shape (e.g., `B(N)`) or is of assumed size (e.g., `B(*)`). If necessary, they do this by making a copy of the array into contiguous memory.~~

~~  [^1]~~

==  In Fortran, array data is not necessarily stored contiguously. For example, the array section `A(1:N:2)` involves only the elements of `A` with indices 1, 3, 5, .... The same is true for a pointer array whose target is such a section. Most compilers ensure that an array that is a dummy argument is held in contiguous memory if it is declared with an explicit shape (e.g., `B(N)`) or is of assumed size (e.g., `B(*)`). If necessary, they do this by making a copy of the array into contiguous memory. [^1]==

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

REAL a(100,100,100) CALL ~~MPI_Send( a(11:17,~~ ==MPI_Send(a(11:17,== 12:99:3, 1:100), 7*30*100, MPI_REAL, ...)

All nonblocking MPI functions (e.g., [[versions/v40/API/MPI_ISEND|MPI_ISEND]] , [[versions/v40/API/MPI_PUT|MPI_PUT]] , [[versions/v40/API/MPI_FILE_WRITE_ALL_BEGIN|MPI_FILE_WRITE_ALL_BEGIN]] ) behave as if *the user-specified elements of choice buffers are copied to a contiguous scratch buffer in the MPI runtime environment*. All datatype descriptions (in the example above, “`3, MPI_REAL`”) read and store data from and to this virtual contiguous scratch buffer. Displacements in MPI derived datatypes are relative to the beginning of this virtual contiguous scratch buffer. Upon completion of a nonblocking receive operation (e.g., when [[versions/v40/API/MPI_WAIT|MPI_WAIT]] on a corresponding `MPI_Request` returns), it is as if the received data has been copied from the virtual contiguous scratch buffer back to the ~~non-contiguous~~ ==noncontiguous== application buffer. In the example above, `r(1)`, `r(6)`, and `r(11)` are guaranteed to be defined with the received data when [[versions/v40/API/MPI_WAIT|MPI_WAIT]] returns.

Note that the above definition does not supercede restrictions about buffers used with ~~non-blocking~~ ==nonblocking== operations (e.g., those specified in Section [[versions/v40/sections/pt2pt#Communication Initiation|Communication Initiation]] ).

> The Fortran descriptor for `TYPE(*),` `DIMENSION(..)` arguments contains enough information that, if desired, the MPI library can make a real contiguous copy of ~~non-contiguous~~ ==noncontiguous== user buffers when the nonblocking operation is started, and release this buffer not before the nonblocking communication has completed (e.g., the [[versions/v40/API/MPI_WAIT|MPI_WAIT]] routine). Efficient implementations may avoid such additional memory-to-memory data copying.

> If `MPI_SUBARRAYS_SUPPORTED` equals `.TRUE.`, ~~non-con­tig­u­ous~~ ==non-/contiguous== buffers are handled inside the MPI library instead of by the compiler through argument association conventions. Therefore, the scope of MPI library scratch buffers can be from the beginning of a nonblocking operation until the completion of the operation although beginning and completion are implemented in different routines.

real :: a call user1(a,rq) call MPI_WAIT(rq,status,ierr) write (*,*) a

subroutine user1(buf,request) call MPI_IRECV(buf,...,request,...) end

Note that copying will almost certainly occur for an argument that is a ~~non-trivial~~ ==nontrivial== expression (one with at least one operator or function call), a section that does not select a contiguous part of its parent (e.g., `A(1:n:2)`), a pointer whose target is such a section, or an assumed-shape array that is (directly or indirectly) associated with such a section.

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

~~       REAL a(100,100,100)        CALL MPI_Send(a(11:17, 12:99:3, 1:100), 7*30*100, MPI_REAL, ...)~~

==Fortran subarrays as actual buffer in MPI procedures.==

==(code block added)==
``` [MPI]Fortran
REAL a(100,100,100)
CALL MPI_Send(a(11:17, 12:99:3, 1:100), 7*30*100, MPI_REAL, ...)
```

~~          REAL s(100), r(100)           CALL MPI_Isend(s(1:100:5), 3, MPI_REAL, ..., rq, ierror)           CALL MPI_Wait(rq, status, ierror)           CALL MPI_Irecv(r(1:100:5), 3, MPI_REAL, ..., rq, ierror)           CALL MPI_Wait(rq, status, ierror)~~

==  Fortran subarrays without restrictions if `MPI_SUBARRAYS_SUPPORTED` equals `.TRUE.`.==

==  ``` [MPI]Fortran   REAL s(100), r(100)   CALL MPI_Isend(s(1:100:5), 3, MPI_REAL, ..., rq, ierror)   CALL MPI_Wait(rq, status, ierror)   CALL MPI_Irecv(r(1:100:5), 3, MPI_REAL, ..., rq, ierror)   CALL MPI_Wait(rq, status, ierror)   ```==

~~          real a(100)           call MPI_IRECV(a(1:100:2), MPI_REAL, 50, ...)~~

==  Fortran subarrays cannot be used if `MPI_SUBARRAYS_SUPPORTED` equals `.FALSE.`.==

==  ``` [MPI]Fortran   !-- THIS EXAMPLE IS ERRONEOUS if MPI_SUBARRAYS_SUPPORTED==.FALSE. --   real a(100)   call MPI_IRECV(a(1:100:2), MPI_REAL, 50, ...)   ```==

~~            real :: a             call user1(a,rq)             call MPI_WAIT(rq,status,ierr)             write (*,*) a~~

~~            subroutine user1(buf,request)             call MPI_IRECV(buf,...,request,...)             end~~

==  Problem with scalar arguments.==

==  ``` [MPI]Fortran   real :: a   call user1(a,rq)   call MPI_WAIT(rq,status,ierr)   write (*,*) a==

==  subroutine user1(buf,request)   call MPI_IRECV(buf,...,request,...)   end   ```==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The same problem can occur with a scalar argument. A compiler may make a copy of scalar dummy arguments within a called procedure when passed as an actual argument to a choice buffer routine. That this can cause a problem is illustrated by ~~the example~~ ==Example [[versions/v50/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] .==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets]]

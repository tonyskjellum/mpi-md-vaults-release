---
title: "Data Access with Individual File Pointers"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Data Access with Individual File Pointers

Chapter **io** · in [[versions/v20/sections/io#Data Access with Individual File Pointers|MPI-2.0]], [[versions/v21/sections/io#Data Access with Individual File Pointers|MPI-2.1]], [[versions/v22/sections/io#Data Access with Individual File Pointers|MPI-2.2]], [[versions/v30/sections/io#Data Access with Individual File Pointers|MPI-3.0]], [[versions/v31/sections/io#Data Access with Individual File Pointers|MPI-3.1]], [[versions/v40/sections/io#Data Access with Individual File Pointers|MPI-4.0]], [[versions/v41/sections/io#Data Access with Individual File Pointers|MPI-4.1]], [[versions/v50/sections/io#Data Access with Individual File Pointers|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~If MPI_MODE_SEQUENTIAL mode was specified when the file was opened, it is erroneous to call the routines in this section.~~

==If MPI_MODE_SEQUENTIAL mode was specified when the file was opened, it is erroneous to call the routines in this==

==section, with the exception of [[versions/v21/API/MPI_FILE_GET_BYTE_OFFSET|MPI_FILE_GET_BYTE_OFFSET]] .==

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

If ~~MPI_MODE_SEQUENTIAL~~ ==`MPI_MODE_SEQUENTIAL`== mode was specified when the file was opened, it is erroneous to call the routines in this

- ~~MPI_SEEK_SET:~~ ==`MPI_SEEK_SET`:== the pointer is set to `offset`

- ~~MPI_SEEK_CUR:~~ ==`MPI_SEEK_CUR`:== the pointer is set to the current pointer position plus `offset`

- ~~MPI_SEEK_END:~~ ==`MPI_SEEK_END`:== the pointer is set to the end of

> The `offset` can be used in a future call to `MPI_FILE_SEEK` using `whence` = ~~MPI_SEEK_SET~~ ==`MPI_SEEK_SET`== to return to the current position. To set the displacement to the current file pointer position, first convert `offset` into an absolute byte position using `MPI_FILE_GET_BYTE_OFFSET`, then call `MPI_FILE_SET_VIEW` with the resulting displacement.

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~MPI maintains one individual file pointer per process per~~

~~file handle.~~

==MPI maintains one individual file pointer per process per file handle.==

~~that will be accessed.~~

~~The file pointer is updated relative to the current view of the file.~~

==that will be accessed. The file pointer is updated relative to the current view of the file.==

~~          integer   bufsize, numread, totprocessed, status(MPI_STATUS_SIZE)           parameter (bufsize=100)           real      localbuffer(bufsize)~~

~~          call MPI_FILE_OPEN( MPI_COMM_WORLD, 'myoldfile', &                               MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr )           call MPI_FILE_SET_VIEW( myfh, 0, MPI_REAL, MPI_REAL, 'native', &                               MPI_INFO_NULL, ierr )           totprocessed = 0           do              call MPI_FILE_READ( myfh, localbuffer, bufsize, MPI_REAL, &                                  status, ierr )              call MPI_GET_COUNT( status, MPI_REAL, numread, ierr )              call process_input( localbuffer, numread )              totprocessed = totprocessed + numread              if ( numread < bufsize ) exit           enddo~~

==          integer   bufsize, numread, totprocessed, status(MPI_STATUS_SIZE)           parameter (bufsize=100)           real      localbuffer(bufsize)           integer (kind=MPI_OFFSET_KIND) zero==

==          zero = 0==

==          call MPI_FILE_OPEN( MPI_COMM_WORLD, 'myoldfile', &                               MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr )           call MPI_FILE_SET_VIEW( myfh, zero, MPI_REAL, MPI_REAL, 'native', &                               MPI_INFO_NULL, ierr )           totprocessed = 0           do              call MPI_FILE_READ( myfh, localbuffer, bufsize, MPI_REAL, &                                  status, ierr )              call MPI_GET_COUNT( status, MPI_REAL, numread, ierr )              call process_input( localbuffer, numread )              totprocessed = totprocessed + numread              if ( numread < bufsize ) exit           enddo==

integer bufsize, req1, req2 integer, dimension(MPI_STATUS_SIZE) :: status1, status2 parameter (bufsize=10) real buf1(bufsize), buf2(bufsize) ==integer (kind=MPI_OFFSET_KIND) zero==

==zero = 0== call MPI_FILE_OPEN( MPI_COMM_WORLD, 'myoldfile', & MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr ) call MPI_FILE_SET_VIEW( myfh, ~~0,~~ ==zero,== MPI_REAL, MPI_REAL, 'native', & MPI_INFO_NULL, ierr ) call MPI_FILE_IREAD( myfh, buf1, bufsize, MPI_REAL, & req1, ierr ) call MPI_FILE_IREAD( myfh, buf2, bufsize, MPI_REAL, & req2, ierr )

~~`MPI_FILE_SEEK` updates the individual file pointer according to `whence`,~~

~~which has the following possible values:~~

==`MPI_FILE_SEEK` updates the individual file pointer according to `whence`, which has the following possible values:==

~~  file~~

~~  plus `offset`~~

==  file plus `offset`==

### MPI-3.0 → MPI-3.1  (14 changed paragraphs)

~~MPI maintains one individual file pointer per process per file handle.~~

~~The current value of this pointer implicitly specifies the offset in the data access routines described in this section.~~

~~These routines only use and update the individual file pointers maintained by MPI. The shared file pointer is not used nor updated.~~

~~The individual file pointer routines have the same semantics as the data access with explicit offset routines described in Section [[versions/v31/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] , page [[versions/v31/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] , with the following modification:~~

==MPI maintains one individual file pointer per process per file handle. The current value of this pointer implicitly specifies the offset in the data access routines described in this section. These routines only use and update the individual file pointers maintained by MPI. The shared file pointer is not used nor updated.==

==The individual file pointer routines have the same semantics as the data access with explicit offset routines described in [[versions/v31/sections/io#Data Access with Explicit Offsets|Data Access with Explicit Offsets]] , with the following modification:==

~~After an individual file pointer operation is initiated, the individual file pointer is updated to point to the next etype after the last one~~

~~that will be accessed. The file pointer is updated relative to the current view of the file.~~

~~If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, it is erroneous to call the routines in this~~

~~section, with the exception of [[versions/v31/API/MPI_FILE_GET_BYTE_OFFSET|MPI_FILE_GET_BYTE_OFFSET]] .~~

==After an individual file pointer operation is initiated, the individual file pointer is updated to point to the next etype after the last one that will be accessed. The file pointer is updated relative to the current view of the file.==

==If `MPI_MODE_SEQUENTIAL` mode was specified when the file was opened, it is erroneous to call the routines in this section, with the exception of [[versions/v31/API/MPI_FILE_GET_BYTE_OFFSET|MPI_FILE_GET_BYTE_OFFSET]] .==

~~`MPI_FILE_READ`~~ ==[[versions/v31/API/MPI_FILE_READ|MPI_FILE_READ]]== reads a file using the individual file pointer.

~~`MPI_FILE_READ_ALL`~~ ==[[versions/v31/API/MPI_FILE_READ_ALL|MPI_FILE_READ_ALL]]== is a collective version of the blocking ~~`MPI_FILE_READ`~~ ==[[versions/v31/API/MPI_FILE_READ|MPI_FILE_READ]]== interface.

~~`MPI_FILE_WRITE`~~ ==[[versions/v31/API/MPI_FILE_WRITE|MPI_FILE_WRITE]]== writes a file using the individual file pointer.

~~`MPI_FILE_WRITE_ALL`~~ ==[[versions/v31/API/MPI_FILE_WRITE_ALL|MPI_FILE_WRITE_ALL]]== is a collective version of the blocking ~~`MPI_FILE_WRITE`~~ ==[[versions/v31/API/MPI_FILE_WRITE|MPI_FILE_WRITE]]== interface.

~~`MPI_FILE_IREAD`~~ ==[[versions/v31/API/MPI_FILE_IREAD|MPI_FILE_IREAD]]== is a nonblocking version of the ~~`MPI_FILE_READ`~~ ==[[versions/v31/API/MPI_FILE_READ|MPI_FILE_READ]]== interface.

==![[versions/v31/API/MPI_FILE_IREAD_ALL]]==

==[[versions/v31/API/MPI_FILE_IREAD_ALL|MPI_FILE_IREAD_ALL]] is a nonblocking version of [[versions/v31/API/MPI_FILE_READ_ALL|MPI_FILE_READ_ALL]] .==

~~`MPI_FILE_IWRITE` is a nonblocking version of the `MPI_FILE_WRITE` interface.~~

==[[versions/v31/API/MPI_FILE_IWRITE|MPI_FILE_IWRITE]] is a nonblocking version of the [[versions/v31/API/MPI_FILE_WRITE|MPI_FILE_WRITE]] interface.==

==![[versions/v31/API/MPI_FILE_IWRITE_ALL]]==

==[[versions/v31/API/MPI_FILE_IWRITE_ALL|MPI_FILE_IWRITE_ALL]] is a nonblocking version of [[versions/v31/API/MPI_FILE_WRITE_ALL|MPI_FILE_WRITE_ALL]] .==

~~`MPI_FILE_SEEK`~~ ==[[versions/v31/API/MPI_FILE_SEEK|MPI_FILE_SEEK]]== updates the individual file pointer according to `whence`, which has the following possible values:

~~- `MPI_SEEK_END`: the pointer is set to the end of~~

~~  file plus `offset`~~

==- `MPI_SEEK_END`: the pointer is set to the end of file plus `offset`==

~~`MPI_FILE_GET_POSITION`~~ ==[[versions/v31/API/MPI_FILE_GET_POSITION|MPI_FILE_GET_POSITION]]== returns, in `offset`, the current position of the individual file pointer in etype units relative to the current view.

> The `offset` can be used in a future call to ~~`MPI_FILE_SEEK`~~ ==[[versions/v31/API/MPI_FILE_SEEK|MPI_FILE_SEEK]]== using `whence` = `MPI_SEEK_SET` to return to the current position. To set the displacement to the current file pointer position, first convert `offset` into an absolute byte position using ~~`MPI_FILE_GET_BYTE_OFFSET`,~~ ==[[versions/v31/API/MPI_FILE_GET_BYTE_OFFSET|MPI_FILE_GET_BYTE_OFFSET]] ,== then call ~~`MPI_FILE_SET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]]== with the resulting displacement.

~~`MPI_FILE_GET_BYTE_OFFSET`~~ ==[[versions/v31/API/MPI_FILE_GET_BYTE_OFFSET|MPI_FILE_GET_BYTE_OFFSET]]== converts a view-relative offset into an absolute byte position. The absolute byte position (from the beginning of the file) of `offset` relative to the current view of `fh` is returned in `disp`.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

integer bufsize, numread, totprocessed, status(MPI_STATUS_SIZE) parameter (bufsize=100) real localbuffer(bufsize) ~~integer (kind=MPI_OFFSET_KIND)~~ ==integer(kind=MPI_OFFSET_KIND)== zero

zero = 0

call ~~MPI_FILE_OPEN( MPI_COMM_WORLD,~~ ==MPI_FILE_OPEN(MPI_COMM_WORLD,== 'myoldfile', & MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ~~ierr )~~ ==ierr)== call ~~MPI_FILE_SET_VIEW( myfh,~~ ==MPI_FILE_SET_VIEW(myfh,== zero, MPI_REAL, MPI_REAL, 'native', & MPI_INFO_NULL, ~~ierr )~~ ==ierr)== totprocessed = 0 do call ~~MPI_FILE_READ( myfh,~~ ==MPI_FILE_READ(myfh,== localbuffer, bufsize, MPI_REAL, & status, ~~ierr )~~ ==ierr)== call ~~MPI_GET_COUNT( status,~~ ==MPI_GET_COUNT(status,== MPI_REAL, numread, ~~ierr )~~ ==ierr)== call ~~process_input( localbuffer, numread )~~ ==process_input(localbuffer, numread)== totprocessed = totprocessed + numread if ~~( numread~~ ==(numread== < ~~bufsize )~~ ==bufsize)== exit ~~enddo~~ ==end do==

~~write(6,1001)~~ ==write(6, 1001)== numread, bufsize, totprocessed 1001 ~~format( "No~~ ==format("No== more data: read", I3, "and expected", I3, & "Processed total of", I6, "before terminating ~~job." )~~ ==job.")==

call ~~MPI_FILE_CLOSE( myfh, ierr )~~ ==MPI_FILE_CLOSE(myfh, ierr)==

! Read the first twenty real words in a file into two local ! buffers. Note that when the first MPI_FILE_IREAD returns, ! the file pointer has been updated to point to the ! eleventh real word in the file.

integer bufsize, req1, req2 integer, dimension(MPI_STATUS_SIZE) :: status1, status2 parameter (bufsize=10) real buf1(bufsize), buf2(bufsize) ~~integer (kind=MPI_OFFSET_KIND)~~ ==integer(kind=MPI_OFFSET_KIND)== zero

zero = 0 call ~~MPI_FILE_OPEN( MPI_COMM_WORLD,~~ ==MPI_FILE_OPEN(MPI_COMM_WORLD,== 'myoldfile', & MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ~~ierr )~~ ==ierr)== call ~~MPI_FILE_SET_VIEW( myfh,~~ ==MPI_FILE_SET_VIEW(myfh,== zero, MPI_REAL, MPI_REAL, 'native', & MPI_INFO_NULL, ~~ierr )~~ ==ierr)== call ~~MPI_FILE_IREAD( myfh,~~ ==MPI_FILE_IREAD(myfh,== buf1, bufsize, MPI_REAL, & req1, ~~ierr )~~ ==ierr)== call ~~MPI_FILE_IREAD( myfh,~~ ==MPI_FILE_IREAD(myfh,== buf2, bufsize, MPI_REAL, & req2, ~~ierr )~~ ==ierr)==

call ~~MPI_WAIT( req1,~~ ==MPI_WAIT(req1,== status1, ~~ierr )~~ ==ierr)== call ~~MPI_WAIT( req2,~~ ==MPI_WAIT(req2,== status2, ~~ierr )~~ ==ierr)==

call ~~MPI_FILE_CLOSE( myfh, ierr )~~ ==MPI_FILE_CLOSE(myfh, ierr)==

[[versions/v40/API/MPI_FILE_IWRITE|MPI_FILE_IWRITE]] is a nonblocking version of ~~the~~ [[versions/v40/API/MPI_FILE_WRITE|MPI_FILE_WRITE]] ~~interface.~~ ==.==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

~~    !   Read a preexisting input file until all data has been read.     !   Call routine "process_input" if all requested data is read.     !   The Fortran 90 "exit" statement exits the loop.~~

~~    integer   bufsize, numread, totprocessed, status(MPI_STATUS_SIZE)     parameter (bufsize=100)     real      localbuffer(bufsize)     integer(kind=MPI_OFFSET_KIND) zero~~

~~    zero = 0~~

~~    call MPI_FILE_OPEN(MPI_COMM_WORLD, 'myoldfile', &                        MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr)     call MPI_FILE_SET_VIEW(myfh, zero, MPI_REAL, MPI_REAL, 'native', &                            MPI_INFO_NULL, ierr)     totprocessed = 0     do        call MPI_FILE_READ(myfh, localbuffer, bufsize, MPI_REAL, &                           status, ierr)        call MPI_GET_COUNT(status, MPI_REAL, numread, ierr)        call process_input(localbuffer, numread)        totprocessed = totprocessed + numread        if (numread < bufsize) exit     end do~~

~~    write(6, 1001) numread, bufsize, totprocessed     1001  format("No more data:  read", I3, "and expected", I3, &                  "Processed total of", I6, "before terminating job.")~~

~~    call MPI_FILE_CLOSE(myfh, ierr)~~

==(code block added)==
``` [MPI]Fortran
!   Read a preexisting input file until all data has been read.
!   Call routine "process_input" if all requested data is read.
!   The Fortran 90 "exit" statement exits the loop.

integer   bufsize, numread, totprocessed, status(MPI_STATUS_SIZE)
parameter (bufsize=100)
real      localbuffer(bufsize)
integer(kind=MPI_OFFSET_KIND) zero

zero = 0

call MPI_FILE_OPEN(MPI_COMM_WORLD, "myoldfile", &
                   MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr)
call MPI_FILE_SET_VIEW(myfh, zero, MPI_REAL, MPI_REAL, 'native', &
                       MPI_INFO_NULL, ierr)
totprocessed = 0
do
   call MPI_FILE_READ(myfh, localbuffer, bufsize, MPI_REAL, &
                      status, ierr)
   call MPI_GET_COUNT(status, MPI_REAL, numread, ierr)
   call process_input(localbuffer, numread)
   totprocessed = totprocessed + numread
   if (numread < bufsize) exit
end do

write(6, 1001) numread, bufsize, totprocessed
1001  format("No more data:  read", I3, "and expected", I3, &
             "Processed total of", I6, "before terminating job.")

call MPI_FILE_CLOSE(myfh, ierr)
```

~~    !   Read the first twenty real words in a file into two local     !   buffers.  Note that when the first MPI_FILE_IREAD returns,     !   the file pointer has been updated to point to the     !   eleventh real word in the file.~~

~~    integer   bufsize, req1, req2     integer, dimension(MPI_STATUS_SIZE) :: status1, status2     parameter (bufsize=10)     real      buf1(bufsize), buf2(bufsize)     integer(kind=MPI_OFFSET_KIND) zero~~

~~    zero = 0     call MPI_FILE_OPEN(MPI_COMM_WORLD, 'myoldfile', &                        MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr)     call MPI_FILE_SET_VIEW(myfh, zero, MPI_REAL, MPI_REAL, 'native', &                            MPI_INFO_NULL, ierr)     call MPI_FILE_IREAD(myfh, buf1, bufsize, MPI_REAL, &                         req1, ierr)     call MPI_FILE_IREAD(myfh, buf2, bufsize, MPI_REAL, &                         req2, ierr)~~

~~    call MPI_WAIT(req1, status1, ierr)     call MPI_WAIT(req2, status2, ierr)~~

~~    call MPI_FILE_CLOSE(myfh, ierr)~~

==(code block added)==
``` [MPI]Fortran
!   Read the first twenty real words in a file into two local
!   buffers.  Note that when the first MPI_FILE_IREAD returns,
!   the file pointer has been updated to point to the
!   eleventh real word in the file.

integer   bufsize, req1, req2
integer, dimension(MPI_STATUS_SIZE) :: status1, status2
parameter (bufsize=10)
real      buf1(bufsize), buf2(bufsize)
integer(kind=MPI_OFFSET_KIND) zero

zero = 0
call MPI_FILE_OPEN(MPI_COMM_WORLD, 'myoldfile', &
                   MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr)
call MPI_FILE_SET_VIEW(myfh, zero, MPI_REAL, MPI_REAL, 'native', &
                       MPI_INFO_NULL, ierr)
call MPI_FILE_IREAD(myfh, buf1, bufsize, MPI_REAL, &
                    req1, ierr)
call MPI_FILE_IREAD(myfh, buf2, bufsize, MPI_REAL, &
                    req2, ierr)

call MPI_WAIT(req1, status1, ierr)
call MPI_WAIT(req2, status2, ierr)

call MPI_FILE_CLOSE(myfh, ierr)
```

~~- `MPI_SEEK_SET`:~~ the pointer is set to `offset`

~~- `MPI_SEEK_CUR`:~~ the pointer is set to the current pointer position plus `offset`

~~- `MPI_SEEK_END`:~~ the pointer is set to the end of file plus `offset`

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

~~(code block removed)~~
``` [MPI]Fortran
!   Read a preexisting input file until all data has been read.
!   Call routine "process_input" if all requested data is read.
!   The Fortran 90 "exit" statement exits the loop.

integer   bufsize, numread, totprocessed, status(MPI_STATUS_SIZE)
parameter (bufsize=100)
real      localbuffer(bufsize)
integer(kind=MPI_OFFSET_KIND) zero

zero = 0

call MPI_FILE_OPEN(MPI_COMM_WORLD, "myoldfile", &
                   MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr)
call MPI_FILE_SET_VIEW(myfh, zero, MPI_REAL, MPI_REAL, 'native', &
                       MPI_INFO_NULL, ierr)
totprocessed = 0
do
   call MPI_FILE_READ(myfh, localbuffer, bufsize, MPI_REAL, &
                      status, ierr)
   call MPI_GET_COUNT(status, MPI_REAL, numread, ierr)
   call process_input(localbuffer, numread)
   totprocessed = totprocessed + numread
   if (numread < bufsize) exit
end do

write(6, 1001) numread, bufsize, totprocessed
1001  format("No more data:  read", I3, "and expected", I3, &
             "Processed total of", I6, "before terminating job.")

call MPI_FILE_CLOSE(myfh, ierr)
```

==(code block added)==
``` [MPI]Fortran
!   Read a pre-existing input file until all data has been read.
!   Call routine "process_input" if all requested data is read.
!   The Fortran 90 "exit" statement exits the loop.

integer   bufsize, numread, totprocessed, status(MPI_STATUS_SIZE)
parameter (bufsize=100)
real      localbuffer(bufsize)
integer(kind=MPI_OFFSET_KIND) zero

zero = 0

call MPI_FILE_OPEN(MPI_COMM_WORLD, "myoldfile", &
                   MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr)
call MPI_FILE_SET_VIEW(myfh, zero, MPI_REAL, MPI_REAL, 'native', &
                       MPI_INFO_NULL, ierr)
totprocessed = 0
do
   call MPI_FILE_READ(myfh, localbuffer, bufsize, MPI_REAL, &
                      status, ierr)
   call MPI_GET_COUNT(status, MPI_REAL, numread, ierr)
   call process_input(localbuffer, numread)
   totprocessed = totprocessed + numread
   if (numread < bufsize) exit
end do

write(6, 1001) numread, bufsize, totprocessed
1001  format("No more data:  read", I3, "and expected", I3, &
             "Processed total of", I6, "before terminating job.")

call MPI_FILE_CLOSE(myfh, ierr)
```

~~(code block removed)~~
``` [MPI]Fortran
!   Read the first twenty real words in a file into two local
!   buffers.  Note that when the first MPI_FILE_IREAD returns,
!   the file pointer has been updated to point to the
!   eleventh real word in the file.

integer   bufsize, req1, req2
integer, dimension(MPI_STATUS_SIZE) :: status1, status2
parameter (bufsize=10)
real      buf1(bufsize), buf2(bufsize)
integer(kind=MPI_OFFSET_KIND) zero

zero = 0
call MPI_FILE_OPEN(MPI_COMM_WORLD, 'myoldfile', &
                   MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr)
call MPI_FILE_SET_VIEW(myfh, zero, MPI_REAL, MPI_REAL, 'native', &
                       MPI_INFO_NULL, ierr)
call MPI_FILE_IREAD(myfh, buf1, bufsize, MPI_REAL, &
                    req1, ierr)
call MPI_FILE_IREAD(myfh, buf2, bufsize, MPI_REAL, &
                    req2, ierr)

call MPI_WAIT(req1, status1, ierr)
call MPI_WAIT(req2, status2, ierr)

call MPI_FILE_CLOSE(myfh, ierr)
```

==(code block added)==
``` [MPI]Fortran
!   Read the first twenty reals in a file into two local
!   buffers.  Note that when the first MPI_FILE_IREAD returns,
!   the file pointer has been updated to point to the
!   eleventh real in the file.

integer   bufsize, req1, req2
integer, dimension(MPI_STATUS_SIZE) :: status1, status2
parameter (bufsize=10)
real      buf1(bufsize), buf2(bufsize)
integer(kind=MPI_OFFSET_KIND) zero

zero = 0
call MPI_FILE_OPEN(MPI_COMM_WORLD, 'myoldfile', &
                   MPI_MODE_RDONLY, MPI_INFO_NULL, myfh, ierr)
call MPI_FILE_SET_VIEW(myfh, zero, MPI_REAL, MPI_REAL, 'native', &
                       MPI_INFO_NULL, ierr)
call MPI_FILE_IREAD(myfh, buf1, bufsize, MPI_REAL, &
                    req1, ierr)
call MPI_FILE_IREAD(myfh, buf2, bufsize, MPI_REAL, &
                    req2, ierr)

call MPI_WAIT(req1, status1, ierr)
call MPI_WAIT(req2, status2, ierr)

call MPI_FILE_CLOSE(myfh, ierr)
```

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Data Access with Individual File Pointers]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Data Access with Individual File Pointers]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Data Access with Individual File Pointers]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Data Access with Individual File Pointers]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Data Access with Individual File Pointers]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Data Access with Individual File Pointers]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Data Access with Individual File Pointers]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Data Access with Individual File Pointers]]

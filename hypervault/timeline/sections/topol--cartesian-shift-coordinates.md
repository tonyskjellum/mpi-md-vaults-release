---
title: "Cartesian Shift Coordinates"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# Cartesian Shift Coordinates

Chapter **topol** · in [[versions/v13/sections/topol#Cartesian Shift Coordinates|MPI-1.3]], [[versions/v21/sections/topol#Cartesian Shift Coordinates|MPI-2.1]], [[versions/v22/sections/topol#Cartesian Shift Coordinates|MPI-2.2]], [[versions/v30/sections/topol#Cartesian Shift Coordinates|MPI-3.0]], [[versions/v31/sections/topol#Cartesian Shift Coordinates|MPI-3.1]], [[versions/v40/sections/topol#Cartesian Shift Coordinates|MPI-4.0]], [[versions/v41/sections/topol#Cartesian Shift Coordinates|MPI-4.1]], [[versions/v50/sections/topol#Cartesian Shift Coordinates|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~If the process topology is a cartesian structure, a `MPI_SENDRECV` operation is likely to be used along a coordinate direction to perform a shift of data. As input, `MPI_SENDRECV` takes the rank of a source process for the receive, and the rank of a destination process for the send. If the function `MPI_CART_SHIFT` is called for a cartesian process group, it provides the calling process with the above identifiers, which then can be passed to `MPI_SENDRECV`. The user specifies the coordinate direction and the size of the step (positive or negative). The function is local.~~

==If the process topology is a Cartesian structure,==

==an==

==`MPI_SENDRECV` operation is likely to be used along a coordinate direction to perform a shift of data. As input, `MPI_SENDRECV` takes the rank of a source process for the receive, and the rank of a destination process for the send. If the function `MPI_CART_SHIFT` is called for a Cartesian process group, it provides the calling process with the above identifiers, which then can be passed to `MPI_SENDRECV`. The user specifies the coordinate direction and the size of the step (positive or negative). The function is local.==

~~Depending on the periodicity of the cartesian group in the specified coordinate direction, `MPI_CART_SHIFT` provides the identifiers for a circular or an end-off shift. In the case of an end-off shift, the value MPI_PROC_NULL may be returned in `rank_source` or `rank_dest`, indicating that the source or the destination for the shift is out of range.~~

~~ The communicator, `comm`, has a two-dimensional, periodic, cartesian topology associated with it. A two-dimensional array of `REAL`s is stored one element per process, in variable `A`. One wishes to skew this array, by shifting column `i` (vertically, i.e., along the column) by `i` steps.~~

~~    ....     C find process rank           CALL MPI_COMM_RANK(comm, rank, ierr))     C find cartesian coordinates           CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr)     C compute shift source and destination           CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr)     C skew array           CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm,          +                          status, ierr)~~

==Depending on the periodicity of the Cartesian group in the specified coordinate direction, `MPI_CART_SHIFT` provides the identifiers for a circular or an end-off shift. In the case of an end-off shift, the value MPI_PROC_NULL may be returned in `rank_source` or `rank_dest`, indicating that the source or the destination for the shift is out of range.==

==It is erroneous to call [[versions/v21/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with a direction that is either negative or greater than or equal to the number of dimensions in the Cartesian communicator. This implies that it is erroneous to call [[versions/v21/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] with a `comm` that is associated with a zero-dimensional Cartesian topology.==

== The communicator, `comm`, has a two-dimensional, periodic, Cartesian topology associated with it. A two-dimensional array of `REAL`s is stored one element per process, in variable `A`. One wishes to skew this array, by shifting column `i` (vertically, i.e., along the column) by `i` steps.==

==    ....     C find process rank           CALL MPI_COMM_RANK(comm, rank, ierr))     C find Cartesian coordinates           CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr)     C compute shift source and destination           CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr)     C skew array           CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm,          +                          status, ierr)==

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

The ~~`direction`~~ ==direction== argument indicates the ==coordinate== dimension ~~of the shift, i.e., the coordinate which value is modified~~ ==to be traversed== by the shift. The ~~coordinates~~ ==dimensions== are numbered from 0 to `ndims-1`, ~~when~~ ==where== `ndims` is the number of dimensions.

Depending on the periodicity of the Cartesian group in the specified coordinate direction, `MPI_CART_SHIFT` provides the identifiers for a circular or an end-off shift. In the case of an end-off shift, the value ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== may be returned in `rank_source` or `rank_dest`, indicating that the source or the destination for the shift is out of range.

.... C find process rank CALL MPI_COMM_RANK(comm, rank, ~~ierr))~~ ==ierr)== C find Cartesian coordinates CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr) C compute shift source and destination CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr) C skew array CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm, + status, ierr)

> In Fortran, the dimension indicated by ~~DIRECTION~~ ==`DIRECTION== = ~~i~~ ==i`== has ~~DIMS(i+1)~~ ==`DIMS(i+1)`== nodes, where ~~DIMS~~ ==`DIMS`== is the array that was used to create the grid. In C, the dimension indicated by ~~direction~~ ==`direction== = ~~i~~ ==i`== is the dimension specified by ~~dims\[i\].~~ ==`dims[i]`.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~an~~

~~`MPI_SENDRECV` operation is likely to be used along a coordinate direction to perform a shift of data. As input, `MPI_SENDRECV` takes the rank of a source process for the receive, and the rank of a destination process for the send. If the function `MPI_CART_SHIFT` is called for a Cartesian process group, it provides the calling process with the above identifiers, which then can be passed to `MPI_SENDRECV`. The user specifies the coordinate direction and the size of the step (positive or negative). The function is local.~~

==an `MPI_SENDRECV` operation is likely to be used along a coordinate direction to perform a shift of data. As input, `MPI_SENDRECV` takes the rank of a source process for the receive, and the rank of a destination process for the send. If the function `MPI_CART_SHIFT` is called for a Cartesian process group, it provides the calling process with the above identifiers, which then can be passed to `MPI_SENDRECV`. The user specifies the coordinate direction and the size of the step (positive or negative). The function is local.==

The ~~direction~~ ==`direction`== argument indicates the coordinate dimension to be traversed by the shift. The dimensions are numbered from 0 to `ndims-1`, where `ndims` is the number of dimensions.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~If the process topology is a Cartesian structure,~~

~~an `MPI_SENDRECV` operation is likely to be used along a coordinate direction to perform a shift of data. As input, `MPI_SENDRECV` takes the rank of a source process for the receive, and the rank of a destination process for the send. If the function `MPI_CART_SHIFT` is called for a Cartesian process group, it provides the calling process with the above identifiers, which then can be passed to `MPI_SENDRECV`. The user specifies the coordinate direction and the size of the step (positive or negative). The function is local.~~

==If the process topology is a Cartesian structure, an [[versions/v31/API/MPI_SENDRECV|MPI_SENDRECV]] operation may be used along a coordinate direction to perform a shift of data. As input, [[versions/v31/API/MPI_SENDRECV|MPI_SENDRECV]] takes the rank of a source process for the receive, and the rank of a destination process for the send. If the function [[versions/v31/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] is called for a Cartesian process group, it provides the calling process with the above identifiers, which then can be passed to [[versions/v31/API/MPI_SENDRECV|MPI_SENDRECV]] . The user specifies the coordinate direction and the size of the step (positive or negative). The function is local.==

The `direction` argument indicates the coordinate dimension to be traversed by the shift. The dimensions are numbered from ~~0~~ ==`0`== to `ndims-1`, where `ndims` is the number of dimensions.

Depending on the periodicity of the Cartesian group in the specified coordinate direction, ~~`MPI_CART_SHIFT`~~ ==[[versions/v31/API/MPI_CART_SHIFT|MPI_CART_SHIFT]]== provides the identifiers for a circular or an end-off shift. In the case of an end-off shift, the value `MPI_PROC_NULL` may be returned in `rank_source` or `rank_dest`, indicating that the source or the destination for the shift is out of range.

The communicator, `comm`, has a two-dimensional, periodic, Cartesian topology associated with it. A two-dimensional array of `REAL`s is stored one element per process, in variable `A`. One wishes to skew this array, by shifting column `i` (vertically, i.e., along the column) by `i` steps.

.... ~~C~~ ==!== find process rank CALL MPI_COMM_RANK(comm, rank, ierr) ~~C~~ ==!== find Cartesian coordinates CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr) ~~C~~ ==!== compute shift source and destination CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr) ~~C~~ ==!== skew array CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm, ~~+~~ ==&== status, ierr)

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

If the process topology is a Cartesian structure, an [[versions/v40/API/MPI_SENDRECV|MPI_SENDRECV]] operation may be used along a coordinate direction to perform a shift of data. As input, [[versions/v40/API/MPI_SENDRECV|MPI_SENDRECV]] takes the rank of a source process for the receive, and the rank of a destination process for the send. If the function [[versions/v40/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] is called for a Cartesian process group, it provides the calling process with the above identifiers, which then can be passed to [[versions/v40/API/MPI_SENDRECV|MPI_SENDRECV]] . The user specifies the coordinate direction and the size of the step (positive or ~~negative).~~ ==negative, but not zero).== The function is local.

~~....~~ ==...== ! find process rank CALL MPI_COMM_RANK(comm, rank, ierr) ! find Cartesian coordinates CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr) ! compute shift source and destination CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr) ! skew array CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm, & status, ierr)

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

If the ==MPI== process topology is a Cartesian structure, an [[versions/v41/API/MPI_SENDRECV|MPI_SENDRECV]] operation may be used along a coordinate direction to perform a shift of data. As input, [[versions/v41/API/MPI_SENDRECV|MPI_SENDRECV]] takes the rank of a source ==MPI== process for the receive, and the rank of a destination ==MPI== process for the send. If the function [[versions/v41/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] is called for a ==communicator with an associated== Cartesian ~~process group,~~ ==topology,== it provides the calling ==MPI== process with the above identifiers, which then can be passed to [[versions/v41/API/MPI_SENDRECV|MPI_SENDRECV]] . The user specifies the coordinate direction and the size of the step (positive or negative, but not zero). The function is local.

Depending on the periodicity of the Cartesian ~~group~~ ==topology== in the specified coordinate direction, [[versions/v41/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] provides the identifiers for a circular or an end-off shift. In the case of an end-off shift, the value `MPI_PROC_NULL` ~~may be~~ ==is== returned in `rank_source` or `rank_dest`, indicating that the source or the destination for the shift is out of range.

~~The communicator, `comm`, has a two-dimensional, periodic, Cartesian topology associated with it. A two-dimensional array of `REAL`s is stored one element per process, in variable `A`. One wishes to skew this array, by shifting column `i` (vertically, i.e., along the column) by `i` steps.~~

~~    ...     ! find process rank     CALL MPI_COMM_RANK(comm, rank, ierr)     ! find Cartesian coordinates     CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr)     ! compute shift source and destination     CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr)     ! skew array     CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm, &                               status, ierr)~~

==Using [[versions/v41/API/MPI_CART_SHIFT|MPI_CART_SHIFT]] for a Cartesian topology.==

==The communicator, `comm`, has a two-dimensional, periodic, Cartesian topology associated with it. A two-dimensional array of `REAL`s is stored one element per MPI process, in variable `A`. One wishes to skew this array, by shifting column `i` (vertically, i.e., along the column) by `i` steps.==

==(code block added)==
``` [MPI]Fortran
...
! find MPI process rank
CALL MPI_COMM_RANK(comm, rank, ierr)
! find Cartesian coordinates
CALL MPI_CART_COORDS(comm, rank, maxdims, coords, ierr)
! compute shift source and destination
CALL MPI_CART_SHIFT(comm, 0, coords(2), source, dest, ierr)
! skew array
CALL MPI_SENDRECV_REPLACE(A, 1, MPI_REAL, dest, 0, source, 0, comm, &
                          status, ierr)
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#Cartesian Shift Coordinates]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#Cartesian Shift Coordinates]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#Cartesian Shift Coordinates]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#Cartesian Shift Coordinates]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#Cartesian Shift Coordinates]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#Cartesian Shift Coordinates]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#Cartesian Shift Coordinates]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#Cartesian Shift Coordinates]]

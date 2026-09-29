---
title: "An Application Example"
chapter: topol
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/topol]
---

# An Application Example

Chapter **topol** · in [[versions/v13/sections/topol#An Application Example|MPI-1.3]], [[versions/v21/sections/topol#An Application Example|MPI-2.1]], [[versions/v22/sections/topol#An Application Example|MPI-2.2]], [[versions/v30/sections/topol#An Application Example|MPI-3.0]], [[versions/v31/sections/topol#An Application Example|MPI-3.1]], [[versions/v40/sections/topol#An Application Example|MPI-4.0]], [[versions/v41/sections/topol#An Application Example|MPI-4.1]], [[versions/v50/sections/topol#An Application Example|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

The example in ~~figure~~ ==Figure== [[poisson]] shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the processes organize themselves in a two-dimensional structure. Each process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`. In each relaxation step each process computes new values for the solution grid function at all points owned by the process. Then the values at inter-process boundaries have to be exchanged with neighboring processes. For example, the exchange subroutine might contain a call like `MPI_SEND(...,neigh_rank(1),...)` to send updated values to the left-hand neighbor `(i-1,j)`.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

The example in ~~Figure [[poisson]]~~ ==Figures [[poisson-begin]] - [[poisson-end]]== shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the processes organize themselves in a two-dimensional structure. Each process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`. In each relaxation step each process computes new values for the solution grid function at ~~all~~ ==the== points ==`u(1:100,1:100)`== owned by the process. Then the values at inter-process boundaries have to be exchanged with neighboring processes. For example, the ~~exchange subroutine might contain a call like `MPI_SEND(...,neigh_rank(1),...)` to send updated~~ ==newly calculated== values ~~to~~ ==in `u(1,1:100)` must be sent into the halo cells `u(101,1:100)` of== the left-hand neighbor ~~`(i-1,j)`.~~ ==with coordinates `(own_coord(1)-1,own_coord(2))`.==

==*Figure: Communication routine with local data copying and sparse neighborhood all-to-all.*==

==*Figure: Communication routine with sparse neighborhood all-to-all-w and without local data copying.*==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The example in Figures [[poisson-begin]] - [[poisson-end]] shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the processes organize themselves in a two-dimensional structure. Each process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`. In each relaxation step each process computes new values for the solution grid function at the points `u(1:100,1:100)` owned by the process. Then the values at inter-process boundaries have to be exchanged with neighboring processes. For example, the newly calculated values in `u(1,1:100)` must be sent into the halo cells `u(101,1:100)` of the left-hand neighbor with coordinates `(own_coord(1)-1,own_coord(2))`.~~

==The example in Figures [[poisson-begin]] - [[poisson-end]] shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the processes organize themselves in a two-dimensional structure. Each process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`.==

==In each relaxation step each process computes new values for the solution grid function at the points `u(1:100,1:100)` owned by the process. Then the values at inter-process boundaries have to be exchanged with neighboring processes. For example, the newly calculated values in `u(1,1:100)` must be sent into the halo cells `u(101,1:100)` of the left-hand neighbor with coordinates `(own_coord(1)-1,own_coord(2))`.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

The example in Figures [[poisson-begin]] - ~~[[poisson-end]]~~ ==[[poisson-persistent]]== shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the processes organize themselves in a two-dimensional structure. Each process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`.

~~*Figure: Set-up of process structure for two-dimensional parallel Poisson solver.*~~

~~*Figure: Communication routine with local data copying and sparse neighborhood all-to-all.*~~

~~*Figure: Communication routine with sparse neighborhood all-to-all-w and without local data copying.*~~

==*Figure: Set-up of process structure for two-dimensional parallel Poisson solver*==

==*Figure: Communication routine with local data copying and sparse neighborhood all-to-all*==

==*Figure: Communication routine with sparse neighborhood all-to-all-w and without local data copying*==

==*Figure: Two-dimensional parallel Poisson solver with persistent sparse neighborhood all-to-all-w and without local data copying*==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~The example in Figures [[poisson-begin]] - [[poisson-persistent]] shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the processes organize themselves in a two-dimensional structure. Each process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`.~~

~~In each relaxation step each process computes new values for the solution grid function at the points `u(1:100,1:100)` owned by the process. Then the values at inter-process boundaries have to be exchanged with neighboring processes. For example, the newly calculated values in `u(1,1:100)` must be sent into the halo cells `u(101,1:100)` of the left-hand neighbor with coordinates `(own_coord(1)-1,own_coord(2))`.~~

~~*Figure: Set-up of process structure for two-dimensional parallel Poisson solver*~~

~~*Figure: Communication routine with local data copying and sparse neighborhood all-to-all*~~

~~*Figure: Communication routine with sparse neighborhood all-to-all-w and without local data copying*~~

~~*Figure: Two-dimensional parallel Poisson solver with persistent sparse neighborhood all-to-all-w and without local data copying*~~

==Neighborhood collective communication in a Cartesian virtual topology.==

==The example in Figures [[poisson-begin]] – [[poisson-persistent]] shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the MPI processes organize themselves in a two-dimensional structure. Each MPI process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`.==

==In each relaxation step each MPI process computes new values for the solution grid function at the points `u(1:100,1:100)` owned by the MPI process. Then the values at inter-process boundaries have to be exchanged with neighboring MPI processes. For example, the newly calculated values in `u(1,1:100)` must be sent into the halo cells `u(101,1:100)` of the left-hand neighbor with coordinates `(own_coord(1)-1,own_coord(2))`.==

==*Figure: Set-up of MPI process structure for two-dimensional parallel Poisson solver*==

==*Figure: Communication routine with local data copying and sparse neighborhood alltoall*==

==*Figure: Communication routine with sparse neighborhood alltoallw and without local data copying*==

==*Figure: Two-dimensional parallel Poisson solver with persistent sparse neighborhood alltoallw and without local data copying*==

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The example in ~~Figures~~ ==Listings== [[poisson-begin]] – [[poisson-persistent]] shows how the grid definition and inquiry functions can be used in an application program. A partial differential equation, for instance the Poisson equation, is to be solved on a rectangular domain. First, the MPI processes organize themselves in a two-dimensional structure. Each MPI process then inquires about the ranks of its neighbors in the four directions (up, down, right, left). The numerical problem is solved by an iterative method, the details of which are hidden in the subroutine `relax`.

~~*Figure: Set-up~~ ==[language={[MPI]Fortran},basicstyle=,caption={Set-up== of MPI process structure for two-dimensional parallel Poisson ~~solver*~~ ==solver},label=poisson-begin] INTEGER ndims, num_neigh LOGICAL reorder PARAMETER (ndims=2, num_neigh=4, reorder=.true.) INTEGER comm, comm_size, comm_cart, dims(ndims), ierr INTEGER neigh_rank(num_neigh), own_coords(ndims), i, j, it LOGICAL periods(ndims) REAL u(0:101,0:101), f(0:101,0:101) DATA dims / ndims * 0 / comm = MPI_COMM_WORLD CALL MPI_COMM_SIZE(comm, comm_size, ierr) ! Set MPI process grid size and periodicity CALL MPI_DIMS_CREATE(comm_size, ndims, dims, ierr) periods(1) = .TRUE. periods(2) = .TRUE. ! Create a grid structure in WORLD group and inquire about own position CALL MPI_CART_CREATE(comm, ndims, dims, periods, reorder, & comm_cart, ierr) CALL MPI_CART_GET(comm_cart, ndims, dims, periods, own_coords, ierr) i = own_coords(1) j = own_coords(2) ! Look up the ranks for the neighbors. Own MPI process coordinates are (i,j). ! Neighbors are (i-1,j), (i+1,j), (i,j-1), (i,j+1) modulo (dims(1),dims(2)) CALL MPI_CART_SHIFT(comm_cart, 0,1, neigh_rank(1), neigh_rank(2), ierr) CALL MPI_CART_SHIFT(comm_cart, 1,1, neigh_rank(3), neigh_rank(4), ierr) ! Initialize the grid functions and start the iteration CALL init(u, f) DO it=1,100 CALL relax(u, f) ! Exchange data with neighbor processes CALL exchange(u, comm_cart, neigh_rank, num_neigh) END DO CALL output(u)==

~~*Figure: Communication~~ ==[language={[MPI]Fortran},basicstyle=,caption={Communication== routine with local data copying and sparse neighborhood ~~alltoall*~~ ==alltoall}] SUBROUTINE exchange(u, comm_cart, neigh_rank, num_neigh) USE MPI REAL u(0:101,0:101) INTEGER comm_cart, num_neigh, neigh_rank(num_neigh) REAL sndbuf(100,num_neigh), rcvbuf(100,num_neigh) INTEGER ierr sndbuf(1:100,1) = u( 1,1:100) sndbuf(1:100,2) = u(100,1:100) sndbuf(1:100,3) = u(1:100, 1) sndbuf(1:100,4) = u(1:100,100) CALL MPI_NEIGHBOR_ALLTOALL(sndbuf, 100, MPI_REAL, rcvbuf, 100, MPI_REAL, & comm_cart, ierr) ! instead of ! CALL MPI_IRECV(rcvbuf(1,1),100,MPI_REAL, neigh_rank(1),..., rq(1), ierr) ! CALL MPI_ISEND(sndbuf(1,2),100,MPI_REAL, neigh_rank(2),..., rq(2), ierr) ! Always pairing a receive from rank_source with a send to rank_dest ! of the same direction in MPI_CART_SHIFT! ! CALL MPI_IRECV(rcvbuf(1,2),100,MPI_REAL, neigh_rank(2),..., rq(3), ierr) ! CALL MPI_ISEND(sndbuf(1,1),100,MPI_REAL, neigh_rank(1),..., rq(4), ierr) ! CALL MPI_IRECV(rcvbuf(1,3),100,MPI_REAL, neigh_rank(3),..., rq(5), ierr) ! CALL MPI_ISEND(sndbuf(1,4),100,MPI_REAL, neigh_rank(4),..., rq(6), ierr) ! CALL MPI_IRECV(rcvbuf(1,4),100,MPI_REAL, neigh_rank(4),..., rq(7), ierr) ! CALL MPI_ISEND(sndbuf(1,3),100,MPI_REAL, neigh_rank(3),..., rq(8), ierr) ! Of course, one can first start all four IRECV and then all four ISEND, ! Or vice versa, but both in the sequence shown above. Otherwise, the ! matching would be wrong for 2 or only 1 MPI processes in a direction. ! CALL MPI_WAITALL(2*num_neigh, rq, statuses, ierr) u( 0,1:100) = rcvbuf(1:100,1) u(101,1:100) = rcvbuf(1:100,2) u(1:100, 0) = rcvbuf(1:100,3) u(1:100,101) = rcvbuf(1:100,4) END==

~~*Figure: Communication~~ ==[language={[MPI]Fortran},basicstyle=,caption={Communication== routine with sparse neighborhood alltoallw and without local data ~~copying*~~ ==copying},label=poisson-end] SUBROUTINE exchange(u, comm_cart, neigh_rank, num_neigh) USE MPI IMPLICIT NONE REAL u(0:101,0:101) INTEGER comm_cart, num_neigh, neigh_rank(num_neigh) INTEGER sndcounts(num_neigh), sndtypes(num_neigh) INTEGER rcvcounts(num_neigh), rcvtypes(num_neigh) INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal INTEGER(KIND=MPI_ADDRESS_KIND) sdispls(num_neigh), rdispls(num_neigh) INTEGER type_vec, ierr ! The following initialization need to be done only once ! before the first call of exchange. CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr) CALL MPI_TYPE_VECTOR(100, 1, 102, MPI_REAL, type_vec, ierr) CALL MPI_TYPE_COMMIT(type_vec, ierr) sndtypes(1:2) = type_vec sndcounts(1:2) = 1 sndtypes(3:4) = MPI_REAL sndcounts(3:4) = 100 rcvtypes = sndtypes rcvcounts = sndcounts sdispls(1) = ( 1 + 1*102) * sizeofreal ! first element of u( 1 , 1:100) sdispls(2) = (100 + 1*102) * sizeofreal ! first element of u(100 , 1:100) sdispls(3) = ( 1 + 1*102) * sizeofreal ! first element of u( 1:100, 1 ) sdispls(4) = ( 1 + 100*102) * sizeofreal ! first element of u( 1:100,100 ) rdispls(1) = ( 0 + 1*102) * sizeofreal ! first element of u( 0 , 1:100) rdispls(2) = (101 + 1*102) * sizeofreal ! first element of u(101 , 1:100) rdispls(3) = ( 1 + 0*102) * sizeofreal ! first element of u( 1:100, 0 ) rdispls(4) = ( 1 + 101*102) * sizeofreal ! first element of u( 1:100,101 ) ! the following communication has to be done in each call of exchange CALL MPI_NEIGHBOR_ALLTOALLW(u, sndcounts, sdispls, sndtypes, & u, rcvcounts, rdispls, rcvtypes, & comm_cart, ierr) ! The following finalizing need to be done only once ! after the last call of exchange. CALL MPI_TYPE_FREE(type_vec, ierr) END==

~~*Figure: Two-dimensional~~ ==[language={[MPI]Fortran},caption={Two-dimensional== parallel Poisson solver with persistent sparse neighborhood alltoallw and without local data ~~copying*~~ ==copying},label=poisson-persistent,escapeinside={(*@}{@*)}] INTEGER ndims, num_neigh LOGICAL reorder PARAMETER (ndims=2, num_neigh=4, reorder=.true.) INTEGER comm, comm_size, comm_cart, dims(ndims), it, ierr LOGICAL periods(ndims) REAL u(0:101,0:101), f(0:101,0:101) DATA dims / ndims * 0 / INTEGER sndcounts(num_neigh), sndtypes(num_neigh) INTEGER rcvcounts(num_neigh), rcvtypes(num_neigh) INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal INTEGER(KIND=MPI_ADDRESS_KIND) sdispls(num_neigh), rdispls(num_neigh) INTEGER type_vec, request, info, status(MPI_STATUS_SIZE) comm = MPI_COMM_WORLD CALL MPI_COMM_SIZE(comm, comm_size, ierr) ! Set MPI process grid size and periodicity CALL MPI_DIMS_CREATE(comm_size, ndims, dims, ierr) periods(1) = .TRUE. periods(2) = .TRUE. ! Create a grid structure in WORLD group CALL MPI_CART_CREATE(comm, ndims, dims, periods, reorder, & comm_cart, ierr) ! Create datatypes for the neighborhood communication ! ! Insert code from example in Listing (*@ [[poisson-end]] @*) to create and initialize ! sndcounts, sdispls, sndtypes, rcvcounts, rdispls, and rcvtypes ! ! Initialize the neighborhood alltoallw operation info = MPI_INFO_NULL CALL MPI_NEIGHBOR_ALLTOALLW_INIT(u, sndcounts, sdispls, sndtypes, & u, rcvcounts, rdispls, rcvtypes, & comm_cart, info, request, ierr) ! Initialize the grid functions and start the iteration CALL init(u, f) DO it=1,100 ! Start data exchange with neighbor processes CALL MPI_START(request, ierr) ! Compute inner cells CALL relax_inner (u, f) ! Check on completion of neighbor exchange CALL MPI_WAIT(request, status, ierr) ! Compute edge cells CALL relax_edges(u, f) END DO CALL output(u) CALL MPI_REQUEST_FREE(request, ierr) CALL MPI_TYPE_FREE(type_vec, ierr)==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/topol#An Application Example]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/topol#An Application Example]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/topol#An Application Example]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/topol#An Application Example]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/topol#An Application Example]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/topol#An Application Example]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/topol#An Application Example]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/topol#An Application Example]]

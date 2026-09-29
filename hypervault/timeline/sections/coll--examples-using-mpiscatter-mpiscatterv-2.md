---
title: "Examples using MPI_SCATTER , MPI_SCATTERV"
chapter: coll
present_in: ["MPI-3.1", "MPI-4.0", "MPI-4.1"]
tags: [mpi/section, mpi/coll]
---

# Examples using MPI_SCATTER , MPI_SCATTERV

Chapter **coll** · in [[versions/v31/sections/coll#Examples using MPI_SCATTER , MPI_SCATTERV|MPI-3.1]], [[versions/v40/sections/coll#Examples using MPI_SCATTER , MPI_SCATTERV|MPI-4.0]], [[versions/v41/sections/coll#Examples using MPI_SCATTER , MPI_SCATTERV|MPI-4.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (4 changed paragraphs)

~~The reverse of Example [[coll-exA]] . Scatter sets of 100 ints from the root to each process in the group. See figure [[versions/v21/sections/coll#Examples using MPISCATTER, MPISCATTERV|Examples using MPISCATTER, MPISCATTERV]] .~~

==The examples in this section use intracommunicators.==

== The reverse of Example [[coll-exA]] . Scatter sets of 100 `int`s from the root to each process in the group. See Figure [[versions/v21/sections/coll#Examples using MPISCATTER, MPISCATTERV|Examples using MPISCATTER, MPISCATTERV]] .==

The reverse of Example [[coll-exC]] . The root process scatters sets of 100 ~~ints~~ ==`int`s== to the other processes, but the sets of 100 are ~~*stride* ints~~ ==*stride int*s== apart in the sending buffer. Requires use of `MPI_SCATTERV`. Assume $`stride \geq 100`$. See ~~figure~~ ==Figure== [[versions/v21/sections/coll#Examples using MPISCATTER, MPISCATTERV|Examples using MPISCATTER, MPISCATTERV]] .

*Figure: The root process scatters sets of 100 `int`s, moving by ~~`stride` ints~~ ==`stride int`s== from send to send in the scatter.*

The reverse of Example [[coll-exG]] . We have a varying stride between blocks at sending (root) side, at the receiving side we receive into the ~~ith~~ ==`i`-th== column of a 100$`\times`$<!-- -->150 C array. See ~~figure~~ ==Figure== [[versions/v21/sections/coll#Examples using MPISCATTER, MPISCATTERV|Examples using MPISCATTER, MPISCATTERV]] .

*Figure: The root scatters blocks of ~~100-i ints~~ ==`100-i int`s== into column `i` of a 100$`\times`$<!-- -->150 C array. At the sending side, the blocks are ~~`stride[i]` ints~~ ==`stride[i] int`s== apart.*

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

MPI_Comm comm; int gsize,recvarray[100][150],*rptr; int root, *sendbuf, myrank, ~~bufsize,~~ *stride; MPI_Datatype rtype; int i, *displs, *scounts, offset; ... MPI_Comm_size( comm, &gsize); MPI_Comm_rank( comm, &myrank );

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

MPI_Comm comm; int gsize,*sendbuf; int root, rbuf[100]; ... ~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); sendbuf = (int *)malloc(gsize*100*sizeof(int)); ... ~~MPI_Scatter( sendbuf,~~ ==MPI_Scatter(sendbuf,== 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);

~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); sendbuf = (int *)malloc(gsize*stride*sizeof(int)); ... displs = (int *)malloc(gsize*sizeof(int)); scounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; scounts[i] = 100; } ~~MPI_Scatterv( sendbuf,~~ ==MPI_Scatterv(sendbuf,== scounts, displs, MPI_INT, rbuf, 100, MPI_INT, root, comm);

MPI_Comm comm; int gsize,recvarray[100][150],*rptr; int root, *sendbuf, myrank, *stride; MPI_Datatype rtype; int i, *displs, *scounts, offset; ... ~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); ~~MPI_Comm_rank( comm, &myrank );~~ ==MPI_Comm_rank(comm, &myrank);==

stride = (int *)malloc(gsize*sizeof(int)); ... /* stride[i] for i = 0 to gsize-1 is set somehow * sendbuf comes from elsewhere */ ... displs = (int *)malloc(gsize*sizeof(int)); scounts = (int *)malloc(gsize*sizeof(int)); offset = 0; for (i=0; i<gsize; ++i) { displs[i] = offset; offset += stride[i]; scounts[i] = 100 - i; } /* Create datatype for the column we are receiving */ ~~MPI_Type_vector( 100-myrank,~~ ==MPI_Type_vector(100-myrank,== 1, 150, MPI_INT, &rtype); ~~MPI_Type_commit( &rtype );~~ ==MPI_Type_commit(&rtype);== rptr = &recvarray[0][myrank]; ~~MPI_Scatterv( sendbuf,~~ ==MPI_Scatterv(sendbuf,== scounts, displs, MPI_INT, rptr, 1, rtype, root, comm);

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

The reverse of Example [[coll-exA]] . Scatter sets of 100 `int`s from the root to each process in the group. See Figure [[versions/v31/sections/coll#Examples using ~~MPISCATTER,~~ ==MPISCATTER ,== MPISCATTERV|Examples using ~~MPISCATTER,~~ ==MPISCATTER ,== MPISCATTERV]] .

The reverse of Example [[coll-exC]] . The root process scatters sets of 100 `int`s to the other processes, but the sets of 100 are *stride int*s apart in the sending buffer. Requires use of ~~`MPI_SCATTERV`.~~ ==[[versions/v31/API/MPI_SCATTERV|MPI_SCATTERV]] .== Assume $`stride \geq 100`$. See Figure [[versions/v31/sections/coll#Examples using ~~MPISCATTER,~~ ==MPISCATTER ,== MPISCATTERV|Examples using ~~MPISCATTER,~~ ==MPISCATTER ,== MPISCATTERV]] .

The reverse of Example [[coll-exG]] . We have a varying stride between blocks at sending (root) side, at the receiving side we receive into the `i`-th column of a 100$`\times`$<!-- -->150 C array. See Figure [[versions/v31/sections/coll#Examples using ~~MPISCATTER,~~ ==MPISCATTER ,== MPISCATTERV|Examples using ~~MPISCATTER,~~ ==MPISCATTER ,== MPISCATTERV]] .

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

The examples in this section use ~~intracommunicators.~~ ==intra-communicators.==

MPI_Comm_size(comm, &gsize); sendbuf = (int *)malloc(gsize*stride*sizeof(int)); ... displs = (int *)malloc(gsize*sizeof(int)); scounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; scounts[i] = 100; } MPI_Scatterv(sendbuf, scounts, displs, MPI_INT, rbuf, 100, MPI_INT, root, comm);

stride = (int *)malloc(gsize*sizeof(int)); ... /* stride[i] for i = 0 to gsize-1 is set somehow * sendbuf comes from elsewhere */ ... displs = (int *)malloc(gsize*sizeof(int)); scounts = (int *)malloc(gsize*sizeof(int)); offset = 0; for (i=0; i<gsize; ++i) { displs[i] = offset; offset += stride[i]; scounts[i] = 100 - i; } /* Create datatype for the column we are receiving */ MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &rtype); MPI_Type_commit(&rtype); rptr = &recvarray[0][myrank]; MPI_Scatterv(sendbuf, scounts, displs, MPI_INT, rptr, 1, rtype, root, comm);

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~The reverse of Example [[coll-exA]] . Scatter sets of 100 `int`s from the root to each process in the group. See Figure [[versions/v41/sections/coll#Examples using MPISCATTER , MPISCATTERV|Examples using MPISCATTER , MPISCATTERV]] .~~

~~        MPI_Comm comm;         int gsize,*sendbuf;         int root, rbuf[100];         ...         MPI_Comm_size(comm, &gsize);         sendbuf = (int *)malloc(gsize*100*sizeof(int));         ...         MPI_Scatter(sendbuf, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);~~

~~*Figure: The root process scatters sets of 100 `int`s to each process in the group.*~~

~~The reverse of Example [[coll-exC]] . The root process scatters sets of 100 `int`s to the other processes, but the sets of 100 are *stride int*s apart in the sending buffer. Requires use of [[versions/v41/API/MPI_SCATTERV|MPI_SCATTERV]] . Assume $`stride \geq 100`$. See Figure [[versions/v41/sections/coll#Examples using MPISCATTER , MPISCATTERV|Examples using MPISCATTER , MPISCATTERV]] .~~

~~        MPI_Comm comm;         int gsize,*sendbuf;         int root, rbuf[100], i, *displs, *scounts;~~

~~        ...~~

~~        MPI_Comm_size(comm, &gsize);         sendbuf = (int *)malloc(gsize*stride*sizeof(int));         ...         displs = (int *)malloc(gsize*sizeof(int));         scounts = (int *)malloc(gsize*sizeof(int));         for (i=0; i<gsize; ++i) {             displs[i] = i*stride;             scounts[i] = 100;         }         MPI_Scatterv(sendbuf, scounts, displs, MPI_INT, rbuf, 100, MPI_INT,                      root, comm);~~

~~*Figure: The root process scatters sets of 100 `int`s, moving by `stride int`s from send to send in the scatter.*~~

~~The reverse of Example [[coll-exG]] . We have a varying stride between blocks at sending (root) side, at the receiving side we receive into the `i`-th column of a 100$`\times`$<!-- -->150 C array. See Figure [[versions/v41/sections/coll#Examples using MPISCATTER , MPISCATTERV|Examples using MPISCATTER , MPISCATTERV]] .~~

~~        MPI_Comm comm;         int gsize,recvarray[100][150],*rptr;         int root, *sendbuf, myrank, *stride;         MPI_Datatype rtype;         int i, *displs, *scounts, offset;         ...         MPI_Comm_size(comm, &gsize);         MPI_Comm_rank(comm, &myrank);~~

~~        stride = (int *)malloc(gsize*sizeof(int));         ...         /* stride[i] for i = 0 to gsize-1 is set somehow          * sendbuf comes from elsewhere          */         ...         displs = (int *)malloc(gsize*sizeof(int));         scounts = (int *)malloc(gsize*sizeof(int));         offset = 0;         for (i=0; i<gsize; ++i) {             displs[i] = offset;             offset += stride[i];             scounts[i] = 100 - i;         }         /* Create datatype for the column we are receiving          */         MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &rtype);         MPI_Type_commit(&rtype);         rptr = &recvarray[0][myrank];         MPI_Scatterv(sendbuf, scounts, displs, MPI_INT, rptr, 1, rtype,                      root, comm);~~

==The reverse of Example [[coll-exA]] . Scatter sets of 100 `int`s from the root to each MPI process in the group. See Figure [[versions/v41/sections/coll#Examples using MPISCATTER , MPISCATTERV|Examples using MPISCATTER , MPISCATTERV]] .==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,*sendbuf;
int root, rbuf[100];
...
MPI_Comm_size(comm, &gsize);
sendbuf = (int *)malloc(gsize*100*sizeof(int));
...
MPI_Scatter(sendbuf, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);
```

==*Figure: The root scatters sets of 100 `int`s to each MPI process in the group.*==

==The reverse of Example [[coll-exC]] . The root scatters sets of 100 `int`s to the other MPI processes, but the sets of 100 are `stride int`s apart in the sending buffer. Requires use of [[versions/v41/API/MPI_SCATTERV|MPI_SCATTERV]] . Assume $`stride \geq 100`$. See Figure [[versions/v41/sections/coll#Examples using MPISCATTER , MPISCATTERV|Examples using MPISCATTER , MPISCATTERV]] .==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,*sendbuf;
int root, rbuf[100], i, *displs, *scounts;

...

MPI_Comm_size(comm, &gsize);
sendbuf = (int *)malloc(gsize*stride*sizeof(int));
...
displs = (int *)malloc(gsize*sizeof(int));
scounts = (int *)malloc(gsize*sizeof(int));
for (i=0; i<gsize; ++i) {
    displs[i] = i*stride;
    scounts[i] = 100;
}
MPI_Scatterv(sendbuf, scounts, displs, MPI_INT, rbuf, 100, MPI_INT,
             root, comm);
```

==*Figure: The root scatters sets of 100 `int`s, moving by `stride int`s from send to send in the scatter.*==

==The reverse of Example [[coll-exG]] . We have a varying stride between blocks at sending (root) end, at the receiving end we receive into the `i`-th column of a 100$`\times`$<!-- -->150 C array. See Figure [[versions/v41/sections/coll#Examples using MPISCATTER , MPISCATTERV|Examples using MPISCATTER , MPISCATTERV]] .==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,recvarray[100][150],*rptr;
int root, *sendbuf, myrank, *stride;
MPI_Datatype rtype;
int i, *displs, *scounts, offset;
...
MPI_Comm_size(comm, &gsize);
MPI_Comm_rank(comm, &myrank);

stride = (int *)malloc(gsize*sizeof(int));
...
/* stride[i] for i = 0 to gsize-1 is set somehow
 * sendbuf comes from elsewhere
 */
...
displs = (int *)malloc(gsize*sizeof(int));
scounts = (int *)malloc(gsize*sizeof(int));
offset = 0;
for (i=0; i<gsize; ++i) {
    displs[i] = offset;
    offset += stride[i];
    scounts[i] = 100 - i;
}
/* Create datatype for the column we are receiving
 */
MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &rtype);
MPI_Type_commit(&rtype);
rptr = &recvarray[0][myrank];
MPI_Scatterv(sendbuf, scounts, displs, MPI_INT, rptr, 1, rtype,
             root, comm);
```

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

The reverse of Example [[coll-exA]] . Scatter sets of 100 `int`s from the root to each MPI process in the group. See Figure [[versions/v50/sections/coll#Examples using MPISCATTER ~~,~~ ==and== MPISCATTERV|Examples using MPISCATTER ~~,~~ ==and== MPISCATTERV]] .

*Figure: The root scatters sets of 100 `int`s to each MPI process in the ~~group.*~~ ==group*==

The reverse of Example [[coll-exC]] . The root scatters sets of 100 `int`s to the other MPI processes, but the sets of 100 are `stride int`s apart in the sending buffer. Requires use of [[versions/v50/API/MPI_SCATTERV|MPI_SCATTERV]] . Assume $`stride \geq 100`$. See Figure [[versions/v50/sections/coll#Examples using MPISCATTER ~~,~~ ==and== MPISCATTERV|Examples using MPISCATTER ~~,~~ ==and== MPISCATTERV]] .

*Figure: The root scatters sets of 100 `int`s, moving by `stride int`s from send to send in the ~~scatter.*~~ ==scatter*==

The reverse of Example [[coll-exG]] . We have a varying stride between blocks at sending (root) end, at the receiving end we receive into the `i`-th column of a 100$`\times`$<!-- -->150 C array. See Figure [[versions/v50/sections/coll#Examples using MPISCATTER ~~,~~ ==and== MPISCATTERV|Examples using MPISCATTER ~~,~~ ==and== MPISCATTERV]] .

## Text by release

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/coll#Examples using MPI_SCATTER , MPI_SCATTERV]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/coll#Examples using MPI_SCATTER , MPI_SCATTERV]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/coll#Examples using MPI_SCATTER , MPI_SCATTERV]]

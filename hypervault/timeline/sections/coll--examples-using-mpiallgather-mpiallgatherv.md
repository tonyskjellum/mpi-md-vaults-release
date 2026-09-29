---
title: "Examples using `MPI_ALLGATHER`, `MPI_ALLGATHERV`"
chapter: coll
present_in: ["MPI-1.3", "MPI-2.1"]
tags: [mpi/section, mpi/coll]
---

# Examples using `MPI_ALLGATHER`, `MPI_ALLGATHERV`

Chapter **coll** · in [[versions/v13/sections/coll#Examples using `MPI_ALLGATHER`, `MPI_ALLGATHERV`|MPI-1.3]], [[versions/v21/sections/coll#Examples using `MPI_ALLGATHER`, `MPI_ALLGATHERV`|MPI-2.1]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~The all-gather version of Example [[coll-exA]] . Using `MPI_ALLGATHER`, we will gather 100 ints from every process in the group to every process.~~

==The examples in this section use intracommunicators.==

== The all-gather version of Example [[coll-exA]] . Using `MPI_ALLGATHER`, we will gather 100 `int`s from every process in the group to every process.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~ The all-gather version of Example [[coll-exA]] . Using `MPI_ALLGATHER`, we will gather 100 `int`s from every process in the group to every process.~~

~~        MPI_Comm comm;         int gsize,sendarray[100];         int *rbuf;         ...         MPI_Comm_size( comm, &gsize);         rbuf = (int *)malloc(gsize*100*sizeof(int));         MPI_Allgather( sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, comm);~~

~~After the call, every process has the group-wide concatenation of the sets of data.~~

== Gather 100 `int`s from every process in group to root. See figure [[versions/v22/sections/coll#Examples using MPIGATHER, MPIGATHERV|Examples using MPIGATHER, MPIGATHERV]] .==

==        MPI_Comm comm;         int gsize,sendarray[100];         int root, *rbuf;         ...         MPI_Comm_size( comm, &gsize);         rbuf = (int *)malloc(gsize*100*sizeof(int));         MPI_Gather( sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);==

== Previous example modified – only the root allocates memory for the receive buffer.==

==        MPI_Comm comm;         int gsize,sendarray[100];         int root, myrank, *rbuf;         ...         MPI_Comm_rank( comm, &myrank);         if ( myrank == root) {            MPI_Comm_size( comm, &gsize);            rbuf = (int *)malloc(gsize*100*sizeof(int));         }         MPI_Gather( sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);==

==*Figure: The root process gathers 100 `int`s from each process in the group.*==

== Do the same as the previous example, but use a derived datatype. Note that the type cannot be the entire set of `gsize*100 int`s since type matching is defined pairwise between the root and each process in the gather.==

==        MPI_Comm comm;         int gsize,sendarray[100];         int root, *rbuf;         MPI_Datatype rtype;         ...         MPI_Comm_size( comm, &gsize);         MPI_Type_contiguous( 100, MPI_INT, &rtype );         MPI_Type_commit( &rtype );         rbuf = (int *)malloc(gsize*100*sizeof(int));         MPI_Gather( sendarray, 100, MPI_INT, rbuf, 1, rtype, root, comm);==

== Now have each process send 100 `int`s to root, but place each set (of 100) `stride int`s apart at receiving end. Use `MPI_GATHERV` and the `displs` argument to achieve this effect. Assume $`stride \geq 100`$. See Figure [[versions/v22/sections/coll#Examples using MPIGATHER, MPIGATHERV|Examples using MPIGATHER, MPIGATHERV]] .==

==        MPI_Comm comm;         int gsize,sendarray[100];         int root, *rbuf, stride;         int *displs,i,*rcounts;==

==        ...==

==        MPI_Comm_size( comm, &gsize);         rbuf = (int *)malloc(gsize*stride*sizeof(int));         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         for (i=0; i<gsize; ++i) {             displs[i] = i*stride;             rcounts[i] = 100;         }         MPI_Gatherv( sendarray, 100, MPI_INT, rbuf, rcounts, displs, MPI_INT,                                                                    root, comm);==

==Note that the program is erroneous if $`stride < 100`$.==

==*Figure: The root process gathers 100 `int`s from each process in the group, each set is placed `stride int`s apart.*==

== Same as Example [[coll-exC]] on the receiving side, but send the 100 `int`s from the 0th column of a 100$`\times`$<!-- -->150 `int` array, in C. See Figure [[versions/v22/sections/coll#Examples using MPIGATHER, MPIGATHERV|Examples using MPIGATHER, MPIGATHERV]] .==

==        MPI_Comm comm;         int gsize,sendarray[100][150];         int root, *rbuf, stride;         MPI_Datatype stype;         int *displs,i,*rcounts;==

==        ...==

==        MPI_Comm_size( comm, &gsize);         rbuf = (int *)malloc(gsize*stride*sizeof(int));         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         for (i=0; i<gsize; ++i) {             displs[i] = i*stride;             rcounts[i] = 100;         }         /* Create datatype for 1 column of array          */         MPI_Type_vector( 100, 1, 150, MPI_INT, &stype);         MPI_Type_commit( &stype );         MPI_Gatherv( sendarray, 1, stype, rbuf, rcounts, displs, MPI_INT,                                                                  root, comm);==

==*Figure: The root process gathers column `0` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s apart.*==

== Process `i` sends `(100-i) int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. It is received into a buffer with stride, as in the previous two examples. See Figure [[versions/v22/sections/coll#Examples using MPIGATHER, MPIGATHERV|Examples using MPIGATHER, MPIGATHERV]] .==

==        MPI_Comm comm;         int gsize,sendarray[100][150],*sptr;         int root, *rbuf, stride, myrank;         MPI_Datatype stype;         int *displs,i,*rcounts;==

==        ...==

==        MPI_Comm_size( comm, &gsize);         MPI_Comm_rank( comm, &myrank );         rbuf = (int *)malloc(gsize*stride*sizeof(int));         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         for (i=0; i<gsize; ++i) {             displs[i] = i*stride;             rcounts[i] = 100-i;     /* note change from previous example */         }         /* Create datatype for the column we are sending          */         MPI_Type_vector( 100-myrank, 1, 150, MPI_INT, &stype);         MPI_Type_commit( &stype );         /* sptr is the address of start of "myrank" column          */         sptr = &sendarray[0][myrank];         MPI_Gatherv( sptr, 1, stype, rbuf, rcounts, displs, MPI_INT,                                                             root, comm);==

==Note that a different amount of data is received from each process.==

==*Figure: The root process gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s apart.*==

== Same as Example [[coll-exE]] , but done in a different way at the sending end. We create a datatype that causes the correct striding at the sending end so that we read a column of a C array. A similar thing was done in Example [[pt2pt-exFF]] , Section [[versions/v22/sections/datatypes#Examples|Examples]] .==

==        MPI_Comm comm;         int gsize,sendarray[100][150],*sptr;         int root, *rbuf, stride, myrank, disp[2], blocklen[2];         MPI_Datatype stype,type[2];         int *displs,i,*rcounts;==

==        ...==

==        MPI_Comm_size( comm, &gsize);         MPI_Comm_rank( comm, &myrank );         rbuf = (int *)malloc(gsize*stride*sizeof(int));         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         for (i=0; i<gsize; ++i) {             displs[i] = i*stride;             rcounts[i] = 100-i;         }         /* Create datatype for one int, with extent of entire row          */         disp[0] = 0;       disp[1] = 150*sizeof(int);         type[0] = MPI_INT; type[1] = MPI_UB;         blocklen[0] = 1;   blocklen[1] = 1;         MPI_Type_create_struct( 2, blocklen, disp, type, &stype );         MPI_Type_commit( &stype );         sptr = &sendarray[0][myrank];         MPI_Gatherv( sptr, 100-myrank, stype, rbuf, rcounts, displs, MPI_INT,                                                                    root, comm);==

== Same as Example [[coll-exE]] at sending side, but at receiving side we make the stride between received blocks vary from block to block. See Figure [[versions/v22/sections/coll#Examples using MPIGATHER, MPIGATHERV|Examples using MPIGATHER, MPIGATHERV]] .==

==        MPI_Comm comm;         int gsize,sendarray[100][150],*sptr;         int root, *rbuf, *stride, myrank, bufsize;         MPI_Datatype stype;         int *displs,i,*rcounts,offset;==

==        ...==

==        MPI_Comm_size( comm, &gsize);         MPI_Comm_rank( comm, &myrank );==

==        stride = (int *)malloc(gsize*sizeof(int));         ...         /* stride[i] for i = 0 to gsize-1 is set somehow          */==

==        /* set up displs and rcounts vectors first          */         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         offset = 0;         for (i=0; i<gsize; ++i) {             displs[i] = offset;             offset += stride[i];             rcounts[i] = 100-i;         }         /* the required buffer size for rbuf is now easily obtained          */         bufsize = displs[gsize-1]+rcounts[gsize-1];         rbuf = (int *)malloc(bufsize*sizeof(int));         /* Create datatype for the column we are sending          */         MPI_Type_vector( 100-myrank, 1, 150, MPI_INT, &stype);         MPI_Type_commit( &stype );         sptr = &sendarray[0][myrank];         MPI_Gatherv( sptr, 1, stype, rbuf, rcounts, displs, MPI_INT,                                                             root, comm);==

==*Figure: The root process gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride[i] int`s apart (a varying stride).*==

== Process `i` sends `num int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. The complicating factor is that the various values of `num` are not known to `root`, so a separate gather must first be run to find these out. The data is placed contiguously at the receiving end.==

==        MPI_Comm comm;         int gsize,sendarray[100][150],*sptr;         int root, *rbuf, myrank, disp[2], blocklen[2];         MPI_Datatype stype,type[2];         int *displs,i,*rcounts,num;==

==        ...==

==        MPI_Comm_size( comm, &gsize);         MPI_Comm_rank( comm, &myrank );==

==        /* First, gather nums to root          */         rcounts = (int *)malloc(gsize*sizeof(int));         MPI_Gather( &num, 1, MPI_INT, rcounts, 1, MPI_INT, root, comm);         /* root now has correct rcounts, using these we set displs[] so          * that data is placed contiguously (or concatenated) at receive end          */         displs = (int *)malloc(gsize*sizeof(int));         displs[0] = 0;         for (i=1; i<gsize; ++i) {             displs[i] = displs[i-1]+rcounts[i-1];         }         /* And, create receive buffer          */         rbuf = (int *)malloc(gsize*(displs[gsize-1]+rcounts[gsize-1])                                                                  *sizeof(int));         /* Create datatype for one int, with extent of entire row          */         disp[0] = 0;       disp[1] = 150*sizeof(int);         type[0] = MPI_INT; type[1] = MPI_UB;         blocklen[0] = 1;   blocklen[1] = 1;         MPI_Type_create_struct( 2, blocklen, disp, type, &stype );         MPI_Type_commit( &stype );         sptr = &sendarray[0][myrank];         MPI_Gatherv( sptr, num, stype, rbuf, rcounts, displs, MPI_INT,                                                                    root, comm);==

### MPI-2.2 → MPI-3.0  (11 changed paragraphs)

Gather 100 `int`s from every process in group to root. See ~~figure~~ ==Figure== [[versions/v30/sections/coll#Examples using MPIGATHER, MPIGATHERV|Examples using MPIGATHER, MPIGATHERV]] .

MPI_Comm comm; int gsize,sendarray[100]; int root, *rbuf; ... ~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); rbuf = (int *)malloc(gsize*100*sizeof(int)); ~~MPI_Gather( sendarray,~~ ==MPI_Gather(sendarray,== 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);

Previous example modified ~~–~~ ==—== only the root allocates memory for the receive buffer.

MPI_Comm comm; int gsize,sendarray[100]; int root, myrank, *rbuf; ... ~~MPI_Comm_rank( comm,~~ ==MPI_Comm_rank(comm,== &myrank); if ~~( myrank~~ ==(myrank== == root) { ~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); rbuf = (int *)malloc(gsize*100*sizeof(int)); } ~~MPI_Gather( sendarray,~~ ==MPI_Gather(sendarray,== 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);

MPI_Comm comm; int gsize,sendarray[100]; int root, *rbuf; MPI_Datatype rtype; ... ~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); ~~MPI_Type_contiguous( 100,~~ ==MPI_Type_contiguous(100,== MPI_INT, ~~&rtype ); MPI_Type_commit( &rtype );~~ ==&rtype); MPI_Type_commit(&rtype);== rbuf = (int *)malloc(gsize*100*sizeof(int)); ~~MPI_Gather( sendarray,~~ ==MPI_Gather(sendarray,== 100, MPI_INT, rbuf, 1, rtype, root, comm);

~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); rbuf = (int *)malloc(gsize*stride*sizeof(int)); displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; rcounts[i] = 100; } ~~MPI_Gatherv( sendarray,~~ ==MPI_Gatherv(sendarray,== 100, MPI_INT, rbuf, rcounts, displs, MPI_INT, root, comm);

~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); rbuf = (int *)malloc(gsize*stride*sizeof(int)); displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; rcounts[i] = 100; } /* Create datatype for 1 column of array */ ~~MPI_Type_vector( 100,~~ ==MPI_Type_vector(100,== 1, 150, MPI_INT, &stype); ~~MPI_Type_commit( &stype ); MPI_Gatherv( sendarray,~~ ==MPI_Type_commit(&stype); MPI_Gatherv(sendarray,== 1, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); ~~MPI_Comm_rank( comm, &myrank );~~ ==MPI_Comm_rank(comm, &myrank);== rbuf = (int *)malloc(gsize*stride*sizeof(int)); displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; rcounts[i] = 100-i; /* note change from previous example */ } /* Create datatype for the column we are sending */ ~~MPI_Type_vector( 100-myrank,~~ ==MPI_Type_vector(100-myrank,== 1, 150, MPI_INT, &stype); ~~MPI_Type_commit( &stype );~~ ==MPI_Type_commit(&stype);== /* sptr is the address of start of "myrank" column */ sptr = &sendarray[0][myrank]; ~~MPI_Gatherv( sptr,~~ ==MPI_Gatherv(sptr,== 1, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

MPI_Comm comm; int ~~gsize,sendarray[100][150],*sptr;~~ ==gsize, sendarray[100][150], *sptr;== int root, *rbuf, stride, ~~myrank, disp[2], blocklen[2];~~ ==myrank;== MPI_Datatype ~~stype,type[2];~~ ==stype;== int ~~*displs,i,*rcounts;~~ ==*displs, i, *rcounts;==

~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); ~~MPI_Comm_rank( comm, &myrank );~~ ==MPI_Comm_rank(comm, &myrank);== rbuf = (int *)malloc(gsize*stride*sizeof(int)); displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; rcounts[i] = 100-i; } /* Create datatype for one int, with extent of entire row */ ~~disp[0] = 0; disp[1] = 150*sizeof(int); type[0] = MPI_INT; type[1] = MPI_UB; blocklen[0] = 1; blocklen[1] = 1; MPI_Type_create_struct( 2, blocklen, disp, type, &stype ); MPI_Type_commit( &stype );~~ ==MPI_Type_create_resized( MPI_INT, 0, 150*sizeof(int), &stype); MPI_Type_commit(&stype);== sptr = &sendarray[0][myrank]; ~~MPI_Gatherv( sptr,~~ ==MPI_Gatherv(sptr,== 100-myrank, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); ~~MPI_Comm_rank( comm, &myrank );~~ ==MPI_Comm_rank(comm, &myrank);==

/* set up displs and rcounts vectors first */ displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); offset = 0; for (i=0; i<gsize; ++i) { displs[i] = offset; offset += stride[i]; rcounts[i] = 100-i; } /* the required buffer size for rbuf is now easily obtained */ bufsize = displs[gsize-1]+rcounts[gsize-1]; rbuf = (int *)malloc(bufsize*sizeof(int)); /* Create datatype for the column we are sending */ ~~MPI_Type_vector( 100-myrank,~~ ==MPI_Type_vector(100-myrank,== 1, 150, MPI_INT, &stype); ~~MPI_Type_commit( &stype );~~ ==MPI_Type_commit(&stype);== sptr = &sendarray[0][myrank]; ~~MPI_Gatherv( sptr,~~ ==MPI_Gatherv(sptr,== 1, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

MPI_Comm comm; int gsize,sendarray[100][150],*sptr; int root, *rbuf, ~~myrank, disp[2], blocklen[2];~~ ==myrank;== MPI_Datatype ~~stype,type[2];~~ ==stype;== int *displs,i,*rcounts,num;

~~MPI_Comm_size( comm,~~ ==MPI_Comm_size(comm,== &gsize); ~~MPI_Comm_rank( comm, &myrank );~~ ==MPI_Comm_rank(comm, &myrank);==

/* First, gather nums to root */ rcounts = (int *)malloc(gsize*sizeof(int)); ~~MPI_Gather( &num,~~ ==MPI_Gather(&num,== 1, MPI_INT, rcounts, 1, MPI_INT, root, comm); /* root now has correct rcounts, using these we set displs[] so * that data is placed contiguously (or concatenated) at receive end */ displs = (int *)malloc(gsize*sizeof(int)); displs[0] = 0; for (i=1; i<gsize; ++i) { displs[i] = displs[i-1]+rcounts[i-1]; } /* And, create receive buffer */ rbuf = (int *)malloc(gsize*(displs[gsize-1]+rcounts[gsize-1]) *sizeof(int)); /* Create datatype for one int, with extent of entire row */ ~~disp[0] = 0; disp[1] = 150*sizeof(int); type[0] = MPI_INT; type[1] = MPI_UB; blocklen[0] = 1; blocklen[1] = 1; MPI_Type_create_struct( 2, blocklen, disp, type, &stype ); MPI_Type_commit( &stype );~~ ==MPI_Type_create_resized( MPI_INT, 0, 150*sizeof(int), &stype); MPI_Type_commit(&stype);== sptr = &sendarray[0][myrank]; ~~MPI_Gatherv( sptr,~~ ==MPI_Gatherv(sptr,== num, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

### MPI-3.0 → MPI-3.1  (9 changed paragraphs)

Gather 100 `int`s from every process in group to root. See Figure [[versions/v31/sections/coll#Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV|Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV]] .

Previous example modified — only the root allocates memory for the receive buffer.

Do the same as the previous example, but use a derived datatype. Note that the type cannot be the entire set of `gsize*100 int`s since type matching is defined pairwise between the root and each process in the gather.

Now have each process send 100 `int`s to root, but place each set (of 100) `stride int`s apart at receiving end. Use ~~`MPI_GATHERV`~~ ==[[versions/v31/API/MPI_GATHERV|MPI_GATHERV]]== and the `displs` argument to achieve this effect. Assume $`stride \geq 100`$. See Figure [[versions/v31/sections/coll#Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV|Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV]] .

Same as Example [[coll-exC]] on the receiving side, but send the 100 `int`s from the 0th column of a 100$`\times`$<!-- -->150 `int` array, in C. See Figure [[versions/v31/sections/coll#Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV|Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV]] .

Process `i` sends `(100-i) int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. It is received into a buffer with stride, as in the previous two examples. See Figure [[versions/v31/sections/coll#Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV|Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV]] .

Same as Example [[coll-exE]] , but done in a different way at the sending end. We create a datatype that causes the correct striding at the sending end so that we read a column of a C array. A similar thing was done in Example [[pt2pt-exFF]] , Section [[versions/v31/sections/datatypes#Examples|Examples]] .

Same as Example [[coll-exE]] at sending side, but at receiving side we make the stride between received blocks vary from block to block. See Figure [[versions/v31/sections/coll#Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV|Examples using ~~MPIGATHER,~~ ==MPIGATHER ,== MPIGATHERV]] .

Process `i` sends `num int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. The complicating factor is that the various values of `num` are not known to `root`, so a separate gather must first be run to find these out. The data is placed contiguously at the receiving end.

### MPI-3.1 → MPI-4.0  (9 changed paragraphs)

The examples in this section use ~~intracommunicators.~~ ==intra-communicators.==

Previous example ~~modified — only~~ ==modified—only== the root allocates memory for the receive buffer.

MPI_Comm_size(comm, &gsize); rbuf = (int *)malloc(gsize*stride*sizeof(int)); displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; rcounts[i] = 100; } MPI_Gatherv(sendarray, 100, MPI_INT, rbuf, rcounts, displs, MPI_INT, root, comm);

MPI_Comm_size(comm, &gsize); rbuf = (int *)malloc(gsize*stride*sizeof(int)); displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; rcounts[i] = 100; } /* Create datatype for 1 column of array */ MPI_Type_vector(100, 1, 150, MPI_INT, &stype); MPI_Type_commit(&stype); MPI_Gatherv(sendarray, 1, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

MPI_Comm_size(comm, &gsize); MPI_Comm_rank(comm, &myrank); rbuf = (int *)malloc(gsize*stride*sizeof(int)); displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; rcounts[i] = 100-i; /* note change from previous example */ } /* Create datatype for the column we are sending */ MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &stype); MPI_Type_commit(&stype); /* sptr is the address of start of "myrank" column */ sptr = &sendarray[0][myrank]; MPI_Gatherv(sptr, 1, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

MPI_Comm comm; int gsize, sendarray[100][150], *sptr; int root, *rbuf, stride, myrank; MPI_Datatype stype; int *displs, i, *rcounts;

MPI_Comm_size(comm, &gsize); MPI_Comm_rank(comm, &myrank); rbuf = (int *)malloc(gsize*stride*sizeof(int)); displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); for (i=0; i<gsize; ++i) { displs[i] = i*stride; rcounts[i] = 100-i; } /* Create datatype for one int, with extent of entire row */ ~~MPI_Type_create_resized( MPI_INT,~~ ==MPI_Type_create_resized(MPI_INT,== 0, 150*sizeof(int), &stype); MPI_Type_commit(&stype); sptr = &sendarray[0][myrank]; MPI_Gatherv(sptr, 100-myrank, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

/* set up displs and rcounts vectors first */ displs = (int *)malloc(gsize*sizeof(int)); rcounts = (int *)malloc(gsize*sizeof(int)); offset = 0; for (i=0; i<gsize; ++i) { displs[i] = offset; offset += stride[i]; rcounts[i] = 100-i; } /* the required buffer size for rbuf is now easily obtained */ bufsize = displs[gsize-1]+rcounts[gsize-1]; rbuf = (int *)malloc(bufsize*sizeof(int)); /* Create datatype for the column we are sending */ MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &stype); MPI_Type_commit(&stype); sptr = &sendarray[0][myrank]; MPI_Gatherv(sptr, 1, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

/* First, gather nums to root */ rcounts = (int *)malloc(gsize*sizeof(int)); MPI_Gather(&num, 1, MPI_INT, rcounts, 1, MPI_INT, root, comm); /* root now has correct rcounts, using these we set displs[] so * that data is placed contiguously (or concatenated) at receive end */ displs = (int *)malloc(gsize*sizeof(int)); displs[0] = 0; for (i=1; i<gsize; ++i) { displs[i] = displs[i-1]+rcounts[i-1]; } /* And, create receive buffer */ rbuf = (int *)malloc(gsize*(displs[gsize-1]+rcounts[gsize-1]) *sizeof(int)); /* Create datatype for one int, with extent of entire row */ ~~MPI_Type_create_resized( MPI_INT,~~ ==MPI_Type_create_resized(MPI_INT,== 0, 150*sizeof(int), &stype); MPI_Type_commit(&stype); sptr = &sendarray[0][myrank]; MPI_Gatherv(sptr, num, stype, rbuf, rcounts, displs, MPI_INT, root, comm);

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

~~Gather 100 `int`s from every process in group to root. See Figure [[versions/v41/sections/coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .~~

~~        MPI_Comm comm;         int gsize,sendarray[100];         int root, *rbuf;         ...         MPI_Comm_size(comm, &gsize);         rbuf = (int *)malloc(gsize*100*sizeof(int));         MPI_Gather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);~~

==Gather 100 `int`s from every MPI process in group to the root. See Figure [[versions/v41/sections/coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100];
int root, *rbuf;
...
MPI_Comm_size(comm, &gsize);
rbuf = (int *)malloc(gsize*100*sizeof(int));
MPI_Gather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);
```

~~        MPI_Comm comm;         int gsize,sendarray[100];         int root, myrank, *rbuf;         ...         MPI_Comm_rank(comm, &myrank);         if (myrank == root) {            MPI_Comm_size(comm, &gsize);            rbuf = (int *)malloc(gsize*100*sizeof(int));         }         MPI_Gather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);~~

~~*Figure: The root process gathers 100 `int`s from each process in the group.*~~

~~Do the same as the previous example, but use a derived datatype. Note that the type cannot be the entire set of `gsize*100 int`s since type matching is defined pairwise between the root and each process in the gather.~~

~~        MPI_Comm comm;         int gsize,sendarray[100];         int root, *rbuf;         MPI_Datatype rtype;         ...         MPI_Comm_size(comm, &gsize);         MPI_Type_contiguous(100, MPI_INT, &rtype);         MPI_Type_commit(&rtype);         rbuf = (int *)malloc(gsize*100*sizeof(int));         MPI_Gather(sendarray, 100, MPI_INT, rbuf, 1, rtype, root, comm);~~

~~Now have each process send 100 `int`s to root, but place each set (of 100) `stride int`s apart at receiving end. Use [[versions/v41/API/MPI_GATHERV|MPI_GATHERV]] and the `displs` argument to achieve this effect. Assume $`stride \geq 100`$. See Figure [[versions/v41/sections/coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .~~

~~        MPI_Comm comm;         int gsize,sendarray[100];         int root, *rbuf, stride;         int *displs,i,*rcounts;~~

~~        ...~~

~~        MPI_Comm_size(comm, &gsize);         rbuf = (int *)malloc(gsize*stride*sizeof(int));         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         for (i=0; i<gsize; ++i) {             displs[i] = i*stride;             rcounts[i] = 100;         }         MPI_Gatherv(sendarray, 100, MPI_INT, rbuf, rcounts, displs, MPI_INT,                     root, comm);~~

~~Note that the program is erroneous if $`stride < 100`$.~~

~~*Figure: The root process gathers 100 `int`s from each process in the group, each set is placed `stride int`s apart.*~~

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100];
int root, myrank, *rbuf;
...
MPI_Comm_rank(comm, &myrank);
if (myrank == root) {
   MPI_Comm_size(comm, &gsize);
   rbuf = (int *)malloc(gsize*100*sizeof(int));
}
MPI_Gather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);
```

==*Figure: The root gathers 100 `int`s from each MPI process in the group.*==

==Do the same as the previous example, but use a derived datatype. Note that the type cannot be the entire set of `gsize*100 int`s since type matching is defined pairwise between the root and each MPI process in the gather.==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100];
int root, *rbuf;
MPI_Datatype rtype;
...
MPI_Comm_size(comm, &gsize);
MPI_Type_contiguous(100, MPI_INT, &rtype);
MPI_Type_commit(&rtype);
rbuf = (int *)malloc(gsize*100*sizeof(int));
MPI_Gather(sendarray, 100, MPI_INT, rbuf, 1, rtype, root, comm);
```

==Now have each MPI process send 100 `int`s to the root, but place each set (of 100) `stride int`s apart at the receiving end. Use [[versions/v41/API/MPI_GATHERV|MPI_GATHERV]] and the `displs` argument to achieve this effect. Assume `stride` $`\geq 100`$. See Figure [[versions/v41/sections/coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100];
int root, *rbuf, stride;
int *displs,i,*rcounts;

...

MPI_Comm_size(comm, &gsize);
rbuf = (int *)malloc(gsize*stride*sizeof(int));
displs = (int *)malloc(gsize*sizeof(int));
rcounts = (int *)malloc(gsize*sizeof(int));
for (i=0; i<gsize; ++i) {
    displs[i] = i*stride;
    rcounts[i] = 100;
}
MPI_Gatherv(sendarray, 100, MPI_INT, rbuf, rcounts, displs, MPI_INT,
            root, comm);
```

==Note that the program is erroneous if `stride` $`< 100`$.==

==*Figure: The root gathers 100 `int`s from each MPI process in the group, each set is placed `stride int`s apart.*==

~~        MPI_Comm comm;         int gsize,sendarray[100][150];         int root, *rbuf, stride;         MPI_Datatype stype;         int *displs,i,*rcounts;~~

~~        ...~~

~~        MPI_Comm_size(comm, &gsize);         rbuf = (int *)malloc(gsize*stride*sizeof(int));         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         for (i=0; i<gsize; ++i) {             displs[i] = i*stride;             rcounts[i] = 100;         }         /* Create datatype for 1 column of array          */         MPI_Type_vector(100, 1, 150, MPI_INT, &stype);         MPI_Type_commit(&stype);         MPI_Gatherv(sendarray, 1, stype, rbuf, rcounts, displs, MPI_INT,                     root, comm);~~

~~*Figure: The root process gathers column `0` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s apart.*~~

~~Process `i` sends `(100-i) int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. It is received into a buffer with stride, as in the previous two examples. See Figure [[versions/v41/sections/coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .~~

~~        MPI_Comm comm;         int gsize,sendarray[100][150],*sptr;         int root, *rbuf, stride, myrank;         MPI_Datatype stype;         int *displs,i,*rcounts;~~

~~        ...~~

~~        MPI_Comm_size(comm, &gsize);         MPI_Comm_rank(comm, &myrank);         rbuf = (int *)malloc(gsize*stride*sizeof(int));         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         for (i=0; i<gsize; ++i) {             displs[i] = i*stride;             rcounts[i] = 100-i;     /* note change from previous example */         }         /* Create datatype for the column we are sending          */         MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &stype);         MPI_Type_commit(&stype);         /* sptr is the address of start of "myrank" column          */         sptr = &sendarray[0][myrank];         MPI_Gatherv(sptr, 1, stype, rbuf, rcounts, displs, MPI_INT,                     root, comm);~~

~~Note that a different amount of data is received from each process.~~

~~*Figure: The root process gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s apart.*~~

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100][150];
int root, *rbuf, stride;
MPI_Datatype stype;
int *displs,i,*rcounts;

...

MPI_Comm_size(comm, &gsize);
rbuf = (int *)malloc(gsize*stride*sizeof(int));
displs = (int *)malloc(gsize*sizeof(int));
rcounts = (int *)malloc(gsize*sizeof(int));
for (i=0; i<gsize; ++i) {
    displs[i] = i*stride;
    rcounts[i] = 100;
}
/* Create datatype for 1 column of array
 */
MPI_Type_vector(100, 1, 150, MPI_INT, &stype);
MPI_Type_commit(&stype);
MPI_Gatherv(sendarray, 1, stype, rbuf, rcounts, displs, MPI_INT,
            root, comm);
```

==*Figure: The root gathers column `0` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s apart.*==

==MPI process `i` sends `(100-i) int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. It is received into a buffer with stride, as in the previous two examples. See Figure [[versions/v41/sections/coll#Examples using MPIGATHER , MPIGATHERV|Examples using MPIGATHER , MPIGATHERV]] .==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100][150],*sptr;
int root, *rbuf, stride, myrank;
MPI_Datatype stype;
int *displs,i,*rcounts;

...

MPI_Comm_size(comm, &gsize);
MPI_Comm_rank(comm, &myrank);
rbuf = (int *)malloc(gsize*stride*sizeof(int));
displs = (int *)malloc(gsize*sizeof(int));
rcounts = (int *)malloc(gsize*sizeof(int));
for (i=0; i<gsize; ++i) {
    displs[i] = i*stride;
    rcounts[i] = 100-i;     /* note change from previous example */
}
/* Create datatype for the column we are sending
 */
MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &stype);
MPI_Type_commit(&stype);
/* sptr is the address of start of "myrank" column
 */
sptr = &sendarray[0][myrank];
MPI_Gatherv(sptr, 1, stype, rbuf, rcounts, displs, MPI_INT,
            root, comm);
```

==Note that a different amount of data is received from each MPI process.==

==*Figure: The root gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s apart.*==

~~        MPI_Comm comm;         int gsize, sendarray[100][150], *sptr;         int root, *rbuf, stride, myrank;         MPI_Datatype stype;         int *displs, i, *rcounts;~~

~~        ...~~

~~        MPI_Comm_size(comm, &gsize);         MPI_Comm_rank(comm, &myrank);         rbuf = (int *)malloc(gsize*stride*sizeof(int));         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         for (i=0; i<gsize; ++i) {             displs[i] = i*stride;             rcounts[i] = 100-i;         }         /* Create datatype for one int, with extent of entire row          */         MPI_Type_create_resized(MPI_INT, 0, 150*sizeof(int), &stype);         MPI_Type_commit(&stype);         sptr = &sendarray[0][myrank];         MPI_Gatherv(sptr, 100-myrank, stype, rbuf, rcounts, displs, MPI_INT,                     root, comm);~~

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize, sendarray[100][150], *sptr;
int root, *rbuf, stride, myrank;
MPI_Datatype stype;
int *displs, i, *rcounts;

...

MPI_Comm_size(comm, &gsize);
MPI_Comm_rank(comm, &myrank);
rbuf = (int *)malloc(gsize*stride*sizeof(int));
displs = (int *)malloc(gsize*sizeof(int));
rcounts = (int *)malloc(gsize*sizeof(int));
for (i=0; i<gsize; ++i) {
    displs[i] = i*stride;
    rcounts[i] = 100-i;
}
/* Create datatype for one int, with extent of entire row
 */
MPI_Type_create_resized(MPI_INT, 0, 150*sizeof(int), &stype);
MPI_Type_commit(&stype);
sptr = &sendarray[0][myrank];
MPI_Gatherv(sptr, 100-myrank, stype, rbuf, rcounts, displs, MPI_INT,
            root, comm);
```

~~        MPI_Comm comm;         int gsize,sendarray[100][150],*sptr;         int root, *rbuf, *stride, myrank, bufsize;         MPI_Datatype stype;         int *displs,i,*rcounts,offset;~~

~~        ...~~

~~        MPI_Comm_size(comm, &gsize);         MPI_Comm_rank(comm, &myrank);~~

~~        stride = (int *)malloc(gsize*sizeof(int));         ...         /* stride[i] for i = 0 to gsize-1 is set somehow          */~~

~~        /* set up displs and rcounts vectors first          */         displs = (int *)malloc(gsize*sizeof(int));         rcounts = (int *)malloc(gsize*sizeof(int));         offset = 0;         for (i=0; i<gsize; ++i) {             displs[i] = offset;             offset += stride[i];             rcounts[i] = 100-i;         }         /* the required buffer size for rbuf is now easily obtained          */         bufsize = displs[gsize-1]+rcounts[gsize-1];         rbuf = (int *)malloc(bufsize*sizeof(int));         /* Create datatype for the column we are sending          */         MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &stype);         MPI_Type_commit(&stype);         sptr = &sendarray[0][myrank];         MPI_Gatherv(sptr, 1, stype, rbuf, rcounts, displs, MPI_INT,                     root, comm);~~

~~*Figure: The root process gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride[i] int`s apart (a varying stride).*~~

~~Process `i` sends `num int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. The complicating factor is that the various values of `num` are not known to `root`, so a separate gather must first be run to find these out. The data is placed contiguously at the receiving end.~~

~~        MPI_Comm comm;         int gsize,sendarray[100][150],*sptr;         int root, *rbuf, myrank;         MPI_Datatype stype;         int *displs,i,*rcounts,num;~~

~~        ...~~

~~        MPI_Comm_size(comm, &gsize);         MPI_Comm_rank(comm, &myrank);~~

~~        /* First, gather nums to root          */         rcounts = (int *)malloc(gsize*sizeof(int));         MPI_Gather(&num, 1, MPI_INT, rcounts, 1, MPI_INT, root, comm);         /* root now has correct rcounts, using these we set displs[] so          * that data is placed contiguously (or concatenated) at receive end          */         displs = (int *)malloc(gsize*sizeof(int));         displs[0] = 0;         for (i=1; i<gsize; ++i) {             displs[i] = displs[i-1]+rcounts[i-1];         }         /* And, create receive buffer          */         rbuf = (int *)malloc(gsize*(displs[gsize-1]+rcounts[gsize-1])                                                                  *sizeof(int));         /* Create datatype for one int, with extent of entire row          */         MPI_Type_create_resized(MPI_INT, 0, 150*sizeof(int), &stype);         MPI_Type_commit(&stype);         sptr = &sendarray[0][myrank];         MPI_Gatherv(sptr, num, stype, rbuf, rcounts, displs, MPI_INT,                     root, comm);~~

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100][150],*sptr;
int root, *rbuf, *stride, myrank, bufsize;
MPI_Datatype stype;
int *displs,i,*rcounts,offset;

...

MPI_Comm_size(comm, &gsize);
MPI_Comm_rank(comm, &myrank);

stride = (int *)malloc(gsize*sizeof(int));
...
/* stride[i] for i = 0 to gsize-1 is set somehow
 */

/* set up displs and rcounts vectors first
 */
displs = (int *)malloc(gsize*sizeof(int));
rcounts = (int *)malloc(gsize*sizeof(int));
offset = 0;
for (i=0; i<gsize; ++i) {
    displs[i] = offset;
    offset += stride[i];
    rcounts[i] = 100-i;
}
/* the required buffer size for rbuf is now easily obtained
 */
bufsize = displs[gsize-1]+rcounts[gsize-1];
rbuf = (int *)malloc(bufsize*sizeof(int));
/* Create datatype for the column we are sending
 */
MPI_Type_vector(100-myrank, 1, 150, MPI_INT, &stype);
MPI_Type_commit(&stype);
sptr = &sendarray[0][myrank];
MPI_Gatherv(sptr, 1, stype, rbuf, rcounts, displs, MPI_INT,
            root, comm);
```

==*Figure: The root gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride[i] int`s apart (a varying stride).*==

==MPI process `i` sends `num int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. The complicating factor is that the various values of `num` are not known to `root`, so a separate gather must first be run to find these out. The data is placed contiguously at the receiving end.==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100][150],*sptr;
int root, *rbuf, myrank;
MPI_Datatype stype;
int *displs,i,*rcounts,num;

...

MPI_Comm_size(comm, &gsize);
MPI_Comm_rank(comm, &myrank);

/* First, gather nums to root
 */
rcounts = (int *)malloc(gsize*sizeof(int));
MPI_Gather(&num, 1, MPI_INT, rcounts, 1, MPI_INT, root, comm);
/* root now has correct rcounts, using these we set displs[] so that
 * data is placed contiguously (or concatenated) at the receiving end
 */
displs = (int *)malloc(gsize*sizeof(int));
displs[0] = 0;
for (i=1; i<gsize; ++i) {
    displs[i] = displs[i-1]+rcounts[i-1];
}
/* And, create receive buffer
 */
rbuf = (int *)malloc(gsize*(displs[gsize-1]+rcounts[gsize-1])
                                                      *sizeof(int));
/* Create datatype for one int, with extent of entire row
 */
MPI_Type_create_resized(MPI_INT, 0, 150*sizeof(int), &stype);
MPI_Type_commit(&stype);
sptr = &sendarray[0][myrank];
MPI_Gatherv(sptr, num, stype, rbuf, rcounts, displs, MPI_INT,
            root, comm);
```

### MPI-4.1 → MPI-5.0  (8 changed paragraphs)

Gather 100 `int`s from every MPI process in group to the root. See Figure [[versions/v50/sections/coll#Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV|Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV]] .

~~Previous example modified—only the root allocates memory for the receive buffer.~~

~~(code block removed)~~
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100];
int root, myrank, *rbuf;
...
MPI_Comm_rank(comm, &myrank);
if (myrank == root) {
   MPI_Comm_size(comm, &gsize);
   rbuf = (int *)malloc(gsize*100*sizeof(int));
}
MPI_Gather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);
```

~~*Figure: The root gathers 100 `int`s from each MPI process in the group.*~~

==Previous example modified—only the root allocates memory for the receive buffer. The argument `rbuf` still must be initialized on all processes.==

==(code block added)==
``` [MPI]C
MPI_Comm comm;
int gsize,sendarray[100];
int root, myrank, *rbuf = NULL;
...
MPI_Comm_rank(comm, &myrank);
if (myrank == root) {
   MPI_Comm_size(comm, &gsize);
   rbuf = (int *)malloc(gsize*100*sizeof(int));
}
MPI_Gather(sendarray, 100, MPI_INT, rbuf, 100, MPI_INT, root, comm);
```

==*Figure: The root gathers 100 `int`s from each MPI process in the group*==

Now have each MPI process send 100 `int`s to the root, but place each set (of 100) `stride int`s apart at the receiving end. Use [[versions/v50/API/MPI_GATHERV|MPI_GATHERV]] and the `displs` argument to achieve this effect. Assume `stride` $`\geq 100`$. See Figure [[versions/v50/sections/coll#Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV|Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV]] .

*Figure: The root gathers 100 `int`s from each MPI process in the group, each set is placed `stride int`s ~~apart.*~~ ==apart*==

Same as Example [[coll-exC]] on the receiving side, but send the 100 `int`s from the 0th column of a 100$`\times`$<!-- -->150 `int` array, in C. See Figure [[versions/v50/sections/coll#Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV|Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV]] .

*Figure: The root gathers column `0` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s ~~apart.*~~ ==apart*==

MPI process `i` sends `(100-i) int`s from the `i`-th column of a 100 $`\times`$ 150 `int` array, in C. It is received into a buffer with stride, as in the previous two examples. See Figure [[versions/v50/sections/coll#Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV|Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV]] .

*Figure: The root gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride int`s ~~apart.*~~ ==apart*==

Same as Example [[coll-exE]] at sending side, but at receiving side we make the stride between received blocks vary from block to block. See Figure [[versions/v50/sections/coll#Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV|Examples using MPIGATHER ~~,~~ ==and== MPIGATHERV]] .

*Figure: The root gathers `100-i int`s from column `i` of a 100$`\times`$<!-- -->150 C array, and each set is placed `stride[i] int`s apart (a varying ~~stride).*~~ ==stride)*==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/coll#Examples using `MPI_ALLGATHER`, `MPI_ALLGATHERV`]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/coll#Examples using `MPI_ALLGATHER`, `MPI_ALLGATHERV`]]

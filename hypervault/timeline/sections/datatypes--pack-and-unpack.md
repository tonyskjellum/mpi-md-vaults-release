---
title: "Pack and Unpack"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Pack and Unpack

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Pack and Unpack|MPI-2.1]], [[versions/v22/sections/datatypes#Pack and Unpack|MPI-2.2]], [[versions/v30/sections/datatypes#Pack and Unpack|MPI-3.0]], [[versions/v31/sections/datatypes#Pack and Unpack|MPI-3.1]], [[versions/v40/sections/datatypes#Pack and Unpack|MPI-4.0]], [[versions/v41/sections/datatypes#Pack and Unpack|MPI-4.1]], [[versions/v50/sections/datatypes#Pack and Unpack|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (7 changed paragraphs)

~~    int position, i, j, a[2];     char buff[1000];     ....~~

~~    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);     if (myrank == 0)     {        / * SENDER CODE */~~

~~      position = 0;       MPI_Pack(&i, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);       MPI_Pack(&j, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);       MPI_Send( buff, position, MPI_PACKED, 1, 0, MPI_COMM_WORLD);     }     else  /* RECEIVER CODE */       MPI_Recv( a, 2, MPI_INT, 0, 0, MPI_COMM_WORLD)~~

~~    }~~

==    int        position, i, j, a[2];     char       buff[1000];==

==    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);     if (myrank == 0)     {        /* SENDER CODE */==

==       position = 0;        MPI_Pack(&i, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);        MPI_Pack(&j, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);        MPI_Send( buff, position, MPI_PACKED, 1, 0, MPI_COMM_WORLD);     }     else  /* RECEIVER CODE */        MPI_Recv( a, 2, MPI_INT, 0, 0, MPI_COMM_WORLD);==

int position, i; float a[1000]; char ~~buff[1000] ....~~ ==buff[1000];==

MPI_Comm_rank(MPI_Comm_world, &myrank); if (myrank == 0) { ~~/ *~~ ==/*== SENDER CODE */

MPI_Send( buff, position, MPI_PACKED, 1, 0, ~~MPI_COMM_WORLD)~~ ==MPI_COMM_WORLD);==

MPI_Recv( buff, 1000, MPI_PACKED, 0, 0, ==MPI_COMM_WORLD,== &status);

~~    int count, gsize, counts[64], totalcount, k1, k2, k,         displs[64], position, concat_pos;     char chr[100], *lbuf, *rbuf, *cbuf;     ...     MPI_Comm_size(comm, &gsize);     MPI_Comm_rank(comm, &myrank);~~

==    int  count, gsize, counts[64], totalcount, k1, k2, k,          displs[64], position, concat_pos;     char chr[100], *lbuf, *rbuf, *cbuf;==

==    MPI_Comm_size(comm, &gsize);     MPI_Comm_rank(comm, &myrank);==

if (myrank != root) { /* gather at root sizes of all packed messages */ MPI_Gather( &position, 1, MPI_INT, NULL, ~~NULL, NULL,~~ ==0, MPI_DATATYPE_NULL,== root, comm);

/* gather at root packed messages */ MPI_Gatherv( ~~&buf,~~ ==lbuf,== position, MPI_PACKED, NULL, NULL, NULL, NULL, root, comm);

/* gather all packed messages */ displs[0] = 0; for (i=1; i < gsize; i++) displs[i] = displs[i-1] + counts[i-1]; totalcount = ~~dipls[gsize-1]~~ ==displs[gsize-1]== + counts[gsize-1]; rbuf = (char *)malloc(totalcount); cbuf = (char *)malloc(totalcount); MPI_Gatherv( lbuf, position, MPI_PACKED, rbuf, counts, displs, MPI_PACKED, root, comm);

/* unpack all messages and concatenate strings */ concat_pos = 0; for (i=0; i < gsize; i++) { position = 0; MPI_Unpack( rbuf+displs[i], totalcount-displs[i], &position, &count, 1, MPI_INT, comm); MPI_Unpack( rbuf+displs[i], totalcount-displs[i], &position, cbuf+concat_pos, count, MPI_CHAR, comm); concat_pos += count; } cbuf[concat_pos] = ~~`\0';~~ =='\textbackslash0';== }

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~Packs the message in the send buffer specified by `inbuf, incount, datatype` into the buffer space specified by `outbuf` and~~

~~`outsize`. The input buffer can be any communication buffer allowed in [[versions/v30/API/MPI_SEND|MPI_SEND]] . The output buffer is a contiguous storage area containing `outsize` bytes, starting at the address `outbuf` (length is counted in <span class="sans-serif">bytes</span>, not elements, as if it were a communication buffer for a message of type `MPI_PACKED`).~~

==Packs the message in the send buffer specified by `inbuf, incount, datatype` into the buffer space specified by `outbuf` and `outsize`. The input buffer can be any communication buffer allowed in [[versions/v30/API/MPI_SEND|MPI_SEND]] . The output buffer is a contiguous storage area containing `outsize` bytes, starting at the address `outbuf` (length is counted in <span class="sans-serif">bytes</span>, not elements, as if it were a communication buffer for a message of type `MPI_PACKED`).==

~~Unpacks a message into the receive buffer specified by `outbuf, outcount, datatype` from the buffer space specified by `inbuf` and `insize`. The output buffer can be any communication buffer allowed in [[versions/v30/API/MPI_RECV|MPI_RECV]] . The input buffer is a contiguous storage area containing `insize` bytes, starting at address `inbuf`.~~

~~The input value of `position` is the first location in the input buffer occupied by the packed message. `position` is incremented by the size of the packed message, so that the output value of `position` is the first location in the input buffer~~

~~after the locations occupied by the message that was unpacked. `comm` is the communicator used to receive the packed message.~~

==Unpacks a message into the receive buffer specified by `outbuf, outcount, datatype` from the buffer space specified by `inbuf` and `insize`. The output buffer can be any communication buffer allowed in [[versions/v30/API/MPI_RECV|MPI_RECV]] . The input buffer is a contiguous storage area containing `insize` bytes, starting at address `inbuf`. The input value of `position` is the first location in the input buffer occupied by the packed message. `position` is incremented by the size of the packed message, so that the output value of `position` is the first location in the input buffer after the locations occupied by the message that was unpacked. `comm` is the communicator used to receive the packed message.==

==If the packed size of the datatype cannot be expressed by the `size` parameter, then `MPI_PACK_SIZE` sets the value of `size` to `MPI_UNDEFINED`.==

MPI_Comm_rank(MPI_COMM_WORLD, &myrank); if (myrank == 0) { /* SENDER CODE */

position = 0; MPI_Pack(&i, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD); MPI_Pack(&j, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD); ~~MPI_Send( buff,~~ ==MPI_Send(buff,== position, MPI_PACKED, 1, 0, MPI_COMM_WORLD); } else /* RECEIVER CODE */ ~~MPI_Recv( a,~~ ==MPI_Recv(a,== 2, MPI_INT, 0, 0, ~~MPI_COMM_WORLD);~~ ==MPI_COMM_WORLD, MPI_STATUS_IGNORE);==

~~MPI_Comm_rank(MPI_Comm_world,~~ ==MPI_Comm_rank(MPI_COMM_WORLD,== &myrank); if (myrank == 0) { /* SENDER CODE */

int len[2]; MPI_Aint disp[2]; MPI_Datatype type[2], newtype;

/* build datatype for i followed by a[0]...a[i-1] */

len[0] = 1; len[1] = i; ~~MPI_Address( &i,~~ ==MPI_Get_address(&i,== disp); ~~MPI_Address( a,~~ ==MPI_Get_address(a,== disp+1); type[0] = MPI_INT; type[1] = MPI_FLOAT; ~~MPI_Type_struct( 2,~~ ==MPI_Type_create_struct(2,== len, disp, type, &newtype); ~~MPI_Type_commit( &newtype);~~ ==MPI_Type_commit(&newtype);==

/* Pack i followed by a[0]...a[i-1]*/

position = 0; ~~MPI_Pack( MPI_BOTTOM,~~ ==MPI_Pack(MPI_BOTTOM,== 1, newtype, buff, 1000, &position, MPI_COMM_WORLD);

/* Send */

~~MPI_Send( buff,~~ ==MPI_Send(buff,== position, MPI_PACKED, 1, 0, MPI_COMM_WORLD);

/* ***** One can replace the last three lines with ~~MPI_Send( MPI_BOTTOM,~~ ==MPI_Send(MPI_BOTTOM,== 1, newtype, 1, 0, MPI_COMM_WORLD); ***** */ } else if (myrank == 1) { /* RECEIVER CODE */

MPI_Status status;

/* Receive */

~~MPI_Recv( buff,~~ ==MPI_Recv(buff,== 1000, MPI_PACKED, 0, 0, MPI_COMM_WORLD, &status);

/* Unpack i */

position = 0; MPI_Unpack(buff, 1000, &position, &i, 1, MPI_INT, MPI_COMM_WORLD);

/* Unpack a[0]...a[i-1] */ MPI_Unpack(buff, 1000, &position, a, i, MPI_FLOAT, MPI_COMM_WORLD); }

if (myrank != root) { /* gather at root sizes of all packed messages */ ~~MPI_Gather( &position,~~ ==MPI_Gather(&position,== 1, MPI_INT, NULL, 0, MPI_DATATYPE_NULL, root, comm);

/* gather at root packed messages */ ~~MPI_Gatherv( lbuf,~~ ==MPI_Gatherv(lbuf,== position, MPI_PACKED, NULL, NULL, NULL, ~~NULL,~~ ==MPI_DATATYPE_NULL,== root, comm);

} else { /* root code */ /* gather sizes of all packed messages */ ~~MPI_Gather( &position,~~ ==MPI_Gather(&position,== 1, MPI_INT, counts, 1, MPI_INT, root, comm);

/* gather all packed messages */ displs[0] = 0; for (i=1; i < gsize; i++) displs[i] = displs[i-1] + counts[i-1]; totalcount = displs[gsize-1] + counts[gsize-1]; rbuf = (char *)malloc(totalcount); cbuf = (char *)malloc(totalcount); ~~MPI_Gatherv( lbuf,~~ ==MPI_Gatherv(lbuf,== position, MPI_PACKED, rbuf, counts, displs, MPI_PACKED, root, comm);

/* unpack all messages and concatenate strings */ concat_pos = 0; for (i=0; i < gsize; i++) { position = 0; ~~MPI_Unpack( rbuf+displs[i],~~ ==MPI_Unpack(rbuf+displs[i],== totalcount-displs[i], &position, &count, 1, MPI_INT, comm); ~~MPI_Unpack( rbuf+displs[i],~~ ==MPI_Unpack(rbuf+displs[i],== totalcount-displs[i], &position, cbuf+concat_pos, count, MPI_CHAR, comm); concat_pos += count; } cbuf[concat_pos] = ~~'\textbackslash0';~~ =='\0';== }

### MPI-3.0 → MPI-3.1  (6 changed paragraphs)

Packs the message in the send buffer specified by `inbuf, incount, datatype` into the buffer space specified by `outbuf` and `outsize`. The input buffer can be any communication buffer allowed in [[versions/v31/API/MPI_SEND|MPI_SEND]] . The output buffer is a contiguous storage area containing `outsize` bytes, starting at the address `outbuf` (length is counted in ~~<span class="sans-serif">bytes</span>,~~ ==*bytes*,== not elements, as if it were a communication buffer for a message of type `MPI_PACKED`).

To understand the behavior of pack and unpack, it is convenient to think of the data part of a message as being the sequence obtained by concatenating the successive values sent in that message. The pack operation stores this sequence in the buffer space, as if sending the message to that buffer. The unpack operation retrieves this sequence from buffer space, as if receiving a message from that buffer. (It is helpful to think of internal Fortran files or ~~<span class="sans-serif">sscanf</span>~~ ==`sscanf`== in C, for a similar function.)

~~A call to [[versions/v31/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] returns in `size` an upper bound on the increment in `position` that is effected by a call to [[versions/v31/API/MPI_PACK|MPI_PACK]] .~~

~~If the packed size of the datatype cannot be expressed by the `size` parameter, then `MPI_PACK_SIZE` sets the value of `size` to `MPI_UNDEFINED`.~~

==A call to [[versions/v31/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] returns in `size` an upper bound on the increment in `position` that is effected by a call to [[versions/v31/API/MPI_PACK|MPI_PACK]] . If the packed size of the datatype cannot be expressed by the `size` parameter, then [[versions/v31/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] sets the value of `size` to `MPI_UNDEFINED`.==

An example using ~~`MPI_PACK`.~~ ==[[versions/v31/API/MPI_PACK|MPI_PACK]] .==

An elaborate example.

Each process sends a count, followed by count characters to the root; the root concatenates all characters into one string.

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

> Note the difference between [[versions/v40/API/MPI_RECV|MPI_RECV]] and [[versions/v40/API/MPI_UNPACK|MPI_UNPACK]] : in [[versions/v40/API/MPI_RECV|MPI_RECV]] , the `count` argument specifies the maximum number of items that can be received. The actual number of items received is determined by the length of the incoming message. In ~~`MPI_UNPACK`,~~ ==[[versions/v40/API/MPI_UNPACK|MPI_UNPACK]] ,== the `count` argument specifies the actual number of items that are unpacked; the “size” of the corresponding message is the increment in `position`. The reason for this change is that the “incoming message size” is not predetermined since the user decides how much to unpack; nor is it easy to determine the “message size” from the number of items to be unpacked. In fact, in a heterogeneous system, this number may not be determined *a priori*.

Several messages can be successively packed into one **packing unit**. This is effected by several successive **related** calls to ~~`MPI_PACK`,~~ ==[[versions/v40/API/MPI_PACK|MPI_PACK]] ,== where the first call provides ~~`position =~~ ==`position``=== 0`, and each successive call inputs the value of `position` that was output by the previous call, and the same values for `outbuf, outcount` and `comm`. This packing unit now contains the equivalent information that would have been stored in a message by one send call with a send buffer that is the “concatenation” of the individual send buffers.

A packing unit can be sent using type `MPI_PACKED`. Any ~~point to point~~ ==point-to-point== or collective communication function can be used to move the sequence of bytes that forms the packing unit from one process to another. This packing unit can now be received using any receive operation, with any datatype: the type matching rules are relaxed for messages sent with type `MPI_PACKED`.

A packing unit (or a message created by a regular, “typed” send) can be unpacked into several successive messages. This is effected by several successive related calls to [[versions/v40/API/MPI_UNPACK|MPI_UNPACK]] , where the first call provides ~~`position =~~ ==`position``=== 0`, and each successive call inputs the value of `position` that was output by the previous call, and the same values for `inbuf, insize` and `comm`.

~~    int   position, i;     float a[1000];     char  buff[1000];~~

~~    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);     if (myrank == 0)     {         /* SENDER CODE */~~

==    int   position, i = 200;     float a[200];     char  buff[1000]; /* larger than or equal to the size returned                          from MPI_PACK_SIZE for 1,newtype */     MPI_Comm_rank(MPI_COMM_WORLD, &myrank);     if (myrank == 0)     {         /* SENDER CODE */==

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

Some existing communication libraries provide pack/unpack ~~functions~~ ==procedures== for sending noncontiguous data. In these, the user explicitly packs data into a contiguous buffer before sending it, and unpacks it from a contiguous buffer after receiving it. Derived datatypes, which are described in Section [[versions/v41/sections/datatypes#Derived Datatypes|Derived Datatypes]] , allow one, in most cases, to avoid explicit packing and unpacking. The user specifies the layout of the data to be sent or received, and the communication library directly accesses a noncontiguous buffer. The pack/unpack routines are provided for compatibility with previous libraries. Also, they provide some functionality that is not otherwise available in MPI. For instance, a message can be received in several parts, where the receive operation done on a later part may depend on the content of a former part. Another use is that outgoing messages may be explicitly buffered in user supplied space, thus overriding the system buffering policy. Finally, the availability of pack and unpack operations facilitates the development of additional communication libraries layered on top of MPI.

A packing unit can be sent using type `MPI_PACKED`. Any point-to-point or collective communication ~~function~~ ==operation== can be used to move the sequence of bytes that forms the packing unit from one process to another. This packing unit can now be received using any receive operation, with any datatype: the type matching rules are relaxed for messages sent with type `MPI_PACKED`.

~~    int        position, i, j, a[2];     char       buff[1000];~~

~~    MPI_Comm_rank(MPI_COMM_WORLD, &myrank);     if (myrank == 0)     {         /* SENDER CODE */~~

~~        position = 0;         MPI_Pack(&i, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);         MPI_Pack(&j, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);         MPI_Send(buff, position, MPI_PACKED, 1, 0, MPI_COMM_WORLD);     }     else  /* RECEIVER CODE */         MPI_Recv(a, 2, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);~~

==(code block added)==
``` [MPI]C
int        position, i, j, a[2];
char       buff[1000];

MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
if (myrank == 0)
{
    /* SENDER CODE */
    position = 0;
    MPI_Pack(&i, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);
    MPI_Pack(&j, 1, MPI_INT, buff, 1000, &position, MPI_COMM_WORLD);
    MPI_Send(buff, position, MPI_PACKED, 1, 0, MPI_COMM_WORLD);
}
else  /* RECEIVER CODE */
    MPI_Recv(a, 2, MPI_INT, 0, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
```

~~    int   position, i = 200;     float a[200];     char  buff[1000]; /* larger than or equal to the size returned                          from MPI_PACK_SIZE for 1,newtype */     MPI_Comm_rank(MPI_COMM_WORLD, &myrank);     if (myrank == 0)     {         /* SENDER CODE */~~

~~        int len[2];         MPI_Aint disp[2];         MPI_Datatype type[2], newtype;~~

~~        /* build datatype for i followed by a[0]...a[i-1] */~~

~~        len[0] = 1;         len[1] = i;         MPI_Get_address(&i, disp);         MPI_Get_address(a, disp+1);         type[0] = MPI_INT;         type[1] = MPI_FLOAT;         MPI_Type_create_struct(2, len, disp, type, &newtype);         MPI_Type_commit(&newtype);~~

~~        /* Pack i followed by a[0]...a[i-1]*/~~

~~        position = 0;         MPI_Pack(MPI_BOTTOM, 1, newtype, buff, 1000, &position, MPI_COMM_WORLD);~~

~~        /* Send */~~

~~        MPI_Send(buff, position, MPI_PACKED, 1, 0,                  MPI_COMM_WORLD);~~

~~    /* *****        One can replace the last three lines with        MPI_Send(MPI_BOTTOM, 1, newtype, 1, 0, MPI_COMM_WORLD);        ***** */     }     else if (myrank == 1)     {         /* RECEIVER CODE */~~

~~        MPI_Status status;~~

~~        /* Receive */~~

~~        MPI_Recv(buff, 1000, MPI_PACKED, 0, 0, MPI_COMM_WORLD, &status);~~

~~        /* Unpack i */~~

~~        position = 0;         MPI_Unpack(buff, 1000, &position, &i, 1, MPI_INT, MPI_COMM_WORLD);~~

~~        /* Unpack a[0]...a[i-1] */         MPI_Unpack(buff, 1000, &position, a, i, MPI_FLOAT, MPI_COMM_WORLD);     }~~

==(code block added)==
``` [MPI]C
int   position, i = 200;
float a[200];
char  buff[1000]; /* larger than or equal to the size returned
                     from MPI_PACK_SIZE for 1,newtype */
MPI_Comm_rank(MPI_COMM_WORLD, &myrank);
if (myrank == 0)
{
    /* SENDER CODE */
    int len[2];
    MPI_Aint disp[2];
    MPI_Datatype type[2], newtype;

    /* build datatype for i followed by a[0]...a[i-1] */
    len[0] = 1;
    len[1] = i;
    MPI_Get_address(&i, disp);
    MPI_Get_address(a, disp+1);
    type[0] = MPI_INT;
    type[1] = MPI_FLOAT;
    MPI_Type_create_struct(2, len, disp, type, &newtype);
    MPI_Type_commit(&newtype);

    /* Pack i followed by a[0]...a[i-1]*/
    position = 0;
    MPI_Pack(MPI_BOTTOM, 1, newtype, buff, 1000, &position,
             MPI_COMM_WORLD);

    /* Send */
    MPI_Send(buff, position, MPI_PACKED, 1, 0,
             MPI_COMM_WORLD);

/* *****
   One can replace the last three lines with
   MPI_Send(MPI_BOTTOM, 1, newtype, 1, 0, MPI_COMM_WORLD);
   ***** */
}
else if (myrank == 1)
{
    /* RECEIVER CODE */
    MPI_Status status;

    /* Receive */
    MPI_Recv(buff, 1000, MPI_PACKED, 0, 0, MPI_COMM_WORLD, &status);

    /* Unpack i */
    position = 0;
    MPI_Unpack(buff, 1000, &position, &i, 1, MPI_INT, MPI_COMM_WORLD);

    /* Unpack a[0]...a[i-1] */
    MPI_Unpack(buff, 1000, &position, a, i, MPI_FLOAT, MPI_COMM_WORLD);
}
```

~~    int  count, gsize, counts[64], totalcount, k1, k2, k,          displs[64], position, concat_pos;     char chr[100], *lbuf, *rbuf, *cbuf;~~

~~    MPI_Comm_size(comm, &gsize);     MPI_Comm_rank(comm, &myrank);~~

~~          /* allocate local pack buffer */     MPI_Pack_size(1, MPI_INT, comm, &k1);     MPI_Pack_size(count, MPI_CHAR, comm, &k2);     k = k1+k2;     lbuf = (char *)malloc(k);~~

~~          /* pack count, followed by count characters */     position = 0;     MPI_Pack(&count, 1, MPI_INT, lbuf, k, &position, comm);     MPI_Pack(chr, count, MPI_CHAR, lbuf, k, &position, comm);~~

~~    if (myrank != root) {         /* gather at root sizes of all packed messages */         MPI_Gather(&position, 1, MPI_INT, NULL, 0,                    MPI_DATATYPE_NULL, root, comm);~~

~~        /* gather at root packed messages */         MPI_Gatherv(lbuf, position, MPI_PACKED, NULL,                     NULL, NULL, MPI_DATATYPE_NULL, root, comm);~~

~~    } else {   /* root code */         /* gather sizes of all packed messages */         MPI_Gather(&position, 1, MPI_INT, counts, 1,                    MPI_INT, root, comm);~~

~~        /* gather all packed messages */         displs[0] = 0;         for (i=1; i < gsize; i++)             displs[i] = displs[i-1] + counts[i-1];         totalcount = displs[gsize-1] + counts[gsize-1];         rbuf = (char *)malloc(totalcount);         cbuf = (char *)malloc(totalcount);         MPI_Gatherv(lbuf, position, MPI_PACKED, rbuf,                     counts, displs, MPI_PACKED, root, comm);~~

~~        /* unpack all messages and concatenate strings */         concat_pos = 0;         for (i=0; i < gsize; i++) {             position = 0;             MPI_Unpack(rbuf+displs[i], totalcount-displs[i],                        &position, &count, 1, MPI_INT, comm);             MPI_Unpack(rbuf+displs[i], totalcount-displs[i],                        &position, cbuf+concat_pos, count, MPI_CHAR, comm);             concat_pos += count;         }         cbuf[concat_pos] = '\0';     }~~

==(code block added)==
``` [MPI]C
int  count, gsize, counts[64], totalcount, k1, k2, k,
     displs[64], position, concat_pos;
char chr[100], *lbuf, *rbuf, *cbuf;

MPI_Comm_size(comm, &gsize);
MPI_Comm_rank(comm, &myrank);

      /* allocate local pack buffer */
MPI_Pack_size(1, MPI_INT, comm, &k1);
MPI_Pack_size(count, MPI_CHAR, comm, &k2);
k = k1+k2;
lbuf = (char *)malloc(k);

      /* pack count, followed by count characters */
position = 0;
MPI_Pack(&count, 1, MPI_INT, lbuf, k, &position, comm);
MPI_Pack(chr, count, MPI_CHAR, lbuf, k, &position, comm);

if (myrank != root) {
    /* gather at root sizes of all packed messages */
    MPI_Gather(&position, 1, MPI_INT, NULL, 0,
               MPI_DATATYPE_NULL, root, comm);

    /* gather at root packed messages */
    MPI_Gatherv(lbuf, position, MPI_PACKED, NULL,
                NULL, NULL, MPI_DATATYPE_NULL, root, comm);

} else {   /* root code */
    /* gather sizes of all packed messages */
    MPI_Gather(&position, 1, MPI_INT, counts, 1,
               MPI_INT, root, comm);

    /* gather all packed messages */
    displs[0] = 0;
    for (i=1; i < gsize; i++)
        displs[i] = displs[i-1] + counts[i-1];
    totalcount = displs[gsize-1] + counts[gsize-1];
    rbuf = (char *)malloc(totalcount);
    cbuf = (char *)malloc(totalcount);
    MPI_Gatherv(lbuf, position, MPI_PACKED, rbuf,
                counts, displs, MPI_PACKED, root, comm);

    /* unpack all messages and concatenate strings */
    concat_pos = 0;
    for (i=0; i < gsize; i++) {
        position = 0;
        MPI_Unpack(rbuf+displs[i], totalcount-displs[i],
                   &position, &count, 1, MPI_INT, comm);
        MPI_Unpack(rbuf+displs[i], totalcount-displs[i],
                   &position, cbuf+concat_pos, count, MPI_CHAR, comm);
        concat_pos += count;
    }
    cbuf[concat_pos] = '\0';
}
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

A call to [[versions/v50/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] ==`(incount, datatype, comm, size)`== returns in `size` an upper bound on the increment in `position` that is effected by a call to [[versions/v50/API/MPI_PACK|MPI_PACK]] ~~.~~ ==`(inbuf, incount, datatype, outbuf, outcount, position, comm)`.== If the packed size of the datatype cannot be expressed by the `size` parameter, then [[versions/v50/API/MPI_PACK_SIZE|MPI_PACK_SIZE]] sets the value of `size` to `MPI_UNDEFINED`.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Pack and Unpack]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Pack and Unpack]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Pack and Unpack]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Pack and Unpack]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Pack and Unpack]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Pack and Unpack]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Pack and Unpack]]

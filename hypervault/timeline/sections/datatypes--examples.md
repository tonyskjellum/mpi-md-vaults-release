---
title: "Examples"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Examples

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Examples|MPI-2.1]], [[versions/v22/sections/datatypes#Examples|MPI-2.2]], [[versions/v30/sections/datatypes#Examples|MPI-3.0]], [[versions/v31/sections/datatypes#Examples|MPI-3.1]], [[versions/v40/sections/datatypes#Examples|MPI-4.0]], [[versions/v41/sections/datatypes#Examples|MPI-4.1]], [[versions/v50/sections/datatypes#Examples|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (10 changed paragraphs)

C compute start and size of each column DO i=1, 100 disp(i) = 100*(i-1) + i ~~block(i)~~ ==blocklen(i)== = 100-i END DO

C create datatype for lower triangular part CALL MPI_TYPE_INDEXED( 100, ~~block,~~ ==blocklen,== disp, MPI_REAL, ltype, ierr)

struct Partstruct { int class; /* particle class */ double d[6]; /* particle coordinates */ char b[7]; /* some additional information */ };

int i, dest, ~~rank;~~ ==rank, tag;== MPI_Comm comm;

MPI_Address( particle, disp); MPI_Address( particle[0].d, disp+1); MPI_Address( particle[0].b, disp+2); base = disp[0]; for (i=0; i ~~<3;~~ ==< 3;== i++) disp[i] -= base;

MPI_Address( particle, disp1); MPI_Address( particle[0].d, disp1+1); MPI_Address( particle[0].b, disp1+2); MPI_Address( particle+1, disp1+3); base = disp1[0]; for (i=0; i ~~<4;~~ ==< 4;== i++) disp1[i] -= base;

MPI_Aint zdisp[1000]; int zblock[1000], j, k; int zzblock[2] = {1,1}; MPI_Aint zzdisp[2]; MPI_Datatype zztype[2];

/* compute displacements of class zero particles */ j = 0; for(i=0; i < 1000; i++) if ~~(particle[i].class==0)~~ ==(particle[i].class == 0)== { zdisp[j] = i; zblock[j] = 1; j++; }

/* consecutive particles with index zero are handled as one block */ j=0; for (i=0; i < 1000; i++) if ~~(particle[i].index==0)~~ ==(particle[i].index == 0)== { for (k=i+1; (k < 1000)&&(particle[k].index == 0) ; k++); zdisp[j] = i; zblock[j] = k-i; j++; i = k; } MPI_Type_indexed( j, zblock, zdisp, Particletype, &Zparticles);

The same manipulations as in the previous example, but use absolute addresses in datatypes.

struct Partstruct { int class; double d[6]; char b[7]; };

MPI_Aint ~~zdisp[1000]~~ ==zdisp[1000];== int zblock[1000], i, j, k; int zzblock[2] = {1,1}; MPI_Datatype zztype[2]; MPI_Aint zzdisp[2];

j=0; for (i=0; i < 1000; i++) if ~~(particle[i].index==0)~~ ==(particle[i].index == 0)== { for (k=i+1; (k < 1000)&&(particle[k].index ~~=~~ ====== 0) ; k++); zdisp[j] = i; zblock[j] = k-i; j++; i = k; } MPI_Type_indexed( j, zblock, zdisp, Particletype, &Zparticles); /* Zparticles describe particles with class zero, using their absolute addresses*/

union { int ival; float fval; } ~~u[1000]~~ ==u[1000];==

### MPI-2.2 → MPI-3.0  (26 changed paragraphs)

REAL a(100,100,100), e(9,9,9) INTEGER oneslice, twoslice, threeslice, ~~sizeofreal,~~ myrank, ierr INTEGER ==(KIND=MPI_ADDRESS_KIND) lb, sizeofreal INTEGER== status(MPI_STATUS_SIZE)

C extract the section a(1:17:2, 3:11, 2:10) C and store it in e(:,:,:).

CALL ~~MPI_TYPE_EXTENT( MPI_REAL,~~ ==MPI_TYPE_GET_EXTENT(MPI_REAL, lb,== sizeofreal, ierr)

C create datatype for a 1D section CALL ~~MPI_TYPE_VECTOR( 9,~~ ==MPI_TYPE_VECTOR(9,== 1, 2, MPI_REAL, oneslice, ierr)

C create datatype for a 2D section CALL ~~MPI_TYPE_HVECTOR(9,~~ ==MPI_TYPE_CREATE_HVECTOR(9,== 1, 100*sizeofreal, oneslice, twoslice, ierr)

C create datatype for the entire section CALL ~~MPI_TYPE_HVECTOR( 9,~~ ==MPI_TYPE_CREATE_HVECTOR(9,== 1, 100*100*sizeofreal, twoslice, threeslice, ierr)

CALL ~~MPI_TYPE_COMMIT( threeslice,~~ ==MPI_TYPE_COMMIT(threeslice,== ierr) CALL MPI_SENDRECV(a(1,3,2), 1, threeslice, myrank, 0, e, 9*9*9, MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)

C create datatype for lower triangular part CALL ~~MPI_TYPE_INDEXED( 100,~~ ==MPI_TYPE_INDEXED(100,== blocklen, disp, MPI_REAL, ltype, ierr)

CALL MPI_TYPE_COMMIT(ltype, ierr) CALL ~~MPI_SENDRECV( a,~~ ==MPI_SENDRECV(a,== 1, ltype, myrank, 0, b, 1, ltype, myrank, 0, MPI_COMM_WORLD, status, ierr)

REAL a(100,100), b(100,100) INTEGER row, xpose, ~~sizeofreal,~~ myrank, ierr INTEGER ==(KIND=MPI_ADDRESS_KIND) lb, sizeofreal INTEGER== status(MPI_STATUS_SIZE)

CALL ~~MPI_TYPE_EXTENT( MPI_REAL,~~ ==MPI_TYPE_GET_EXTENT(MPI_REAL, lb,== sizeofreal, ierr)

C create datatype for one row CALL ~~MPI_TYPE_VECTOR( 100,~~ ==MPI_TYPE_VECTOR(100,== 1, 100, MPI_REAL, row, ierr)

C create datatype for matrix in row-major order CALL ~~MPI_TYPE_HVECTOR( 100,~~ ==MPI_TYPE_CREATE_HVECTOR(100,== 1, sizeofreal, row, xpose, ierr)

CALL ~~MPI_TYPE_COMMIT( xpose,~~ ==MPI_TYPE_COMMIT(xpose,== ierr)

C send matrix in row-major order and receive in column major order CALL ~~MPI_SENDRECV( a,~~ ==MPI_SENDRECV(a,== 1, xpose, myrank, 0, b, 100*100, MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)

REAL a(100,100), b(100,100) INTEGER ==row, row1 INTEGER (KIND=MPI_ADDRESS_KIND)== disp(2), ~~blocklen(2), type(2), row, row1,~~ ==lb,== sizeofreal INTEGER myrank, ierr INTEGER status(MPI_STATUS_SIZE)

CALL ~~MPI_TYPE_EXTENT( MPI_REAL,~~ ==MPI_TYPE_GET_EXTENT(MPI_REAL, lb,== sizeofreal, ierr)

C create datatype for one row CALL ~~MPI_TYPE_VECTOR( 100,~~ ==MPI_TYPE_VECTOR(100,== 1, 100, MPI_REAL, row, ierr)

C create datatype for one row, with the extent of one real number ~~disp(1)~~ ==lb== = 0 ~~disp(2) = sizeofreal type(1) = row type(2) = MPI_UB blocklen(1) = 1 blocklen(2) = 1~~ CALL ~~MPI_TYPE_STRUCT( 2, blocklen, disp, type,~~ ==MPI_TYPE_CREATE_RESIZED(row, lb, sizeofreal,== row1, ierr)

CALL ~~MPI_TYPE_COMMIT( row1,~~ ==MPI_TYPE_COMMIT(row1,== ierr)

C send 100 rows and receive in column major order CALL ~~MPI_SENDRECV( a,~~ ==MPI_SENDRECV(a,== 100, row1, myrank, 0, b, 100*100, MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)

struct Partstruct { int ~~class;~~ ==type;== /* particle ~~class~~ ==type== */ double d[6]; /* particle coordinates */ char b[7]; /* some additional information */ };

int i, dest, ~~rank,~~ tag; MPI_Comm comm;

MPI_Datatype ==Particlestruct,== Particletype; MPI_Datatype type[3] = {MPI_INT, MPI_DOUBLE, MPI_CHAR}; int blocklen[3] = {1, 6, 7}; MPI_Aint disp[3]; MPI_Aint ~~base;~~ ==base, lb, sizeofentry;==

~~MPI_Address( particle,~~ ==MPI_Get_address(particle,== disp); ~~MPI_Address( particle[0].d,~~ ==MPI_Get_address(particle[0].d,== disp+1); ~~MPI_Address( particle[0].b,~~ ==MPI_Get_address(particle[0].b,== disp+2); base = disp[0]; for (i=0; i < 3; i++) disp[i] -= base;

~~MPI_Type_struct( 3,~~ ==MPI_Type_create_struct(3,== blocklen, disp, type, ~~&Particletype);~~ ==&Particlestruct);==

~~    MPI_Datatype type1[4] = {MPI_INT, MPI_DOUBLE, MPI_CHAR, MPI_UB};     int          blocklen1[4] = {1, 6, 7, 1};     MPI_Aint     disp1[4];~~

~~    /* compute displacements of structure components */~~

~~    MPI_Address( particle, disp1);     MPI_Address( particle[0].d, disp1+1);     MPI_Address( particle[0].b, disp1+2);     MPI_Address( particle+1, disp1+3);     base = disp1[0];     for (i=0; i < 4; i++) disp1[i] -= base;~~

==    /* compute extent of the structure */==

==    MPI_Get_address(particle+1, &sizeofentry);     sizeofentry -= base;==

~~MPI_Type_struct( 4, blocklen1, disp1, type1,~~ ==MPI_Type_create_resized(Particlestruct, 0, sizeofentry,== &Particletype);

~~MPI_Type_commit( &Particletype); MPI_Send( particle,~~ ==MPI_Type_commit(&Particletype); MPI_Send(particle,== 1000, Particletype, dest, tag, comm);

/* 4.2: send only the entries of ~~class~~ ==type== zero particles, preceded by the number of such entries */

MPI_Datatype Zparticles; /* datatype describing all particles with ~~class~~ ==type== zero (needs to be recomputed if ~~classes~~ ==types== change) */ MPI_Datatype Ztype;

~~MPI_Aint~~ ==int== zdisp[1000]; int zblock[1000], j, k; int zzblock[2] = {1,1}; MPI_Aint zzdisp[2]; MPI_Datatype zztype[2];

/* compute displacements of ~~class~~ ==type== zero particles */ j = 0; ~~for(i=0;~~ ==for (i=0;== i < 1000; i++) if ~~(particle[i].class~~ ==(particle[i].type== == 0) { zdisp[j] = i; zblock[j] = 1; j++; }

/* create datatype for ~~class~~ ==type== zero particles */ ~~MPI_Type_indexed( j,~~ ==MPI_Type_indexed(j,== zblock, zdisp, Particletype, &Zparticles);

/* prepend particle count */ ~~MPI_Address(&j,~~ ==MPI_Get_address(&j,== zzdisp); ~~MPI_Address(particle,~~ ==MPI_Get_address(particle,== zzdisp+1); zztype[0] = MPI_INT; zztype[1] = Zparticles; ~~MPI_Type_struct(2,~~ ==MPI_Type_create_struct(2,== zzblock, zzdisp, zztype, &Ztype);

~~MPI_Type_commit( &Ztype); MPI_Send( MPI_BOTTOM,~~ ==MPI_Type_commit(&Ztype); MPI_Send(MPI_BOTTOM,== 1, Ztype, dest, tag, comm);

/* consecutive particles with index zero are handled as one block */ j=0; for (i=0; i < 1000; i++) if ~~(particle[i].index~~ ==(particle[i].type== == 0) { for (k=i+1; (k < ~~1000)&&(particle[k].index~~ ==1000)&&(particle[k].type== == 0) ; k++); zdisp[j] = i; zblock[j] = k-i; j++; i = k; } ~~MPI_Type_indexed( j,~~ ==MPI_Type_indexed(j,== zblock, zdisp, Particletype, &Zparticles);

~~    MPI_Aint sizeofentry;~~

~~    MPI_Type_extent( Particletype, &sizeofentry);~~

==    MPI_Type_get_extent(Particletype, &lb, &sizeofentry);==

~~MPI_Type_hvector( 1000,~~ ==MPI_Type_create_hvector(1000,== 2, sizeofentry, MPI_DOUBLE, &Allpairs); ~~MPI_Type_commit( &Allpairs); MPI_Send( particle[0].d,~~ ==MPI_Type_commit(&Allpairs); MPI_Send(particle[0].d,== 1, Allpairs, dest, tag, comm);

~~    MPI_Datatype Onepair;   /* datatype for one pair of coordinates, with                               the extent of one particle entry */     MPI_Aint disp2[3];     MPI_Datatype type2[3] = {MPI_LB, MPI_DOUBLE, MPI_UB};     int blocklen2[3] = {1, 2, 1};~~

~~    MPI_Address( particle, disp2);     MPI_Address( particle[0].d, disp2+1);     MPI_Address( particle+1, disp2+2);     base = disp2[0];     for (i=0; i<2; i++) disp2[i] -= base;~~

~~    MPI_Type_struct( 3, blocklen2, disp2, type2, &Onepair);     MPI_Type_commit( &Onepair);     MPI_Send( particle[0].d, 1000, Onepair, dest, tag, comm);~~

==    MPI_Datatype Twodouble;==

==    MPI_Type_contiguous(2, MPI_DOUBLE, &Twodouble);==

==    MPI_Datatype Onepair;   /* datatype for one pair of coordinates, with                               the extent of one particle entry */==

==    MPI_Type_create_resized(Twodouble, 0, sizeofentry, &Onepair );     MPI_Type_commit(&Onepair);     MPI_Send(particle[0].d, 1000, Onepair, dest, tag, comm);==

struct Partstruct { int ~~class;~~ ==type;== double d[6]; char b[7]; };

~~MPI_Address( particle,~~ ==MPI_Get_address(particle,== disp); ~~MPI_Address( particle[0].d,~~ ==MPI_Get_address(particle[0].d,== disp+1); ~~MPI_Address( particle[0].b,~~ ==MPI_Get_address(particle[0].b,== disp+2); ~~MPI_Type_struct( 3,~~ ==MPI_Type_create_struct(3,== block, disp, type, &Particletype);

~~MPI_Type_commit( &Particletype); MPI_Send( MPI_BOTTOM,~~ ==MPI_Type_commit(&Particletype); MPI_Send(MPI_BOTTOM,== 1000, Particletype, dest, tag, comm);

/* 5.2: send the entries of ~~class~~ ==type== zero, preceded by the number of such entries */

~~MPI_Aint~~ ==int== zdisp[1000]; int zblock[1000], i, j, k; int zzblock[2] = {1,1}; MPI_Datatype zztype[2]; MPI_Aint zzdisp[2];

j=0; for (i=0; i < 1000; i++) if ~~(particle[i].index~~ ==(particle[i].type== == 0) { for (k=i+1; (k < ~~1000)&&(particle[k].index~~ ==1000)&&(particle[k].type== == 0) ; k++); zdisp[j] = i; zblock[j] = k-i; j++; i = k; } ~~MPI_Type_indexed( j,~~ ==MPI_Type_indexed(j,== zblock, zdisp, Particletype, &Zparticles); /* Zparticles describe particles with ~~class~~ ==type== zero, using their absolute addresses*/

/* prepend particle count */ ~~MPI_Address(&j,~~ ==MPI_Get_address(&j,== zzdisp); zzdisp[1] = ~~MPI_BOTTOM;~~ ==(MPI_Aint)0;== zztype[0] = MPI_INT; zztype[1] = Zparticles; ~~MPI_Type_struct(2,~~ ==MPI_Type_create_struct(2,== zzblock, zzdisp, zztype, &Ztype);

~~MPI_Type_commit( &Ztype); MPI_Send( MPI_BOTTOM,~~ ==MPI_Type_commit(&Ztype); MPI_Send(MPI_BOTTOM,== 1, Ztype, dest, tag, comm);

~~MPI_Datatype type[2]; int blocklen[2] = {1,1}; MPI_Aint disp[2];~~ MPI_Datatype mpi_utype[2]; MPI_Aint ~~i,j;~~ ==i, extent;==

~~MPI_Address( u,~~ ==MPI_Get_address(u,== &i); ~~MPI_Address( u+1, &j); disp[0] = 0; disp[1] = j-i; type[1] = MPI_UB;~~ ==MPI_Get_address(u+1, &extent); extent -= i;==

~~type[0] = MPI_INT; MPI_Type_struct(2, blocklen, disp, type,~~ ==MPI_Type_create_resized(MPI_INT, 0, extent,== &mpi_utype[0]);

~~type[0] = MPI_FLOAT; MPI_Type_struct(2, blocklen, disp, type,~~ ==MPI_Type_create_resized(MPI_FLOAT, 0, extent,== &mpi_utype[1]);

~~This~~

~~example shows how a datatype can be decoded. The routine printdatatype prints out the elements of the datatype. Note the use of `MPI_Type_free` for datatypes that are not predefined.~~

==This example shows how a datatype can be decoded. The routine printdatatype prints out the elements of the datatype. Note the use of `MPI_Type_free` for datatypes that are not predefined.==

Returns 0 if the datatype is predefined, 1 otherwise */ #include <stdio.h> #include <stdlib.h> #include "mpi.h" int ~~printdatatype( MPI_Datatype datatype )~~ ==printdatatype(MPI_Datatype datatype)== { int *array_of_ints; MPI_Aint *array_of_adds; MPI_Datatype *array_of_dtypes; int num_ints, num_adds, num_dtypes, combiner; int i;

~~MPI_Type_get_envelope( datatype,~~ ==MPI_Type_get_envelope(datatype,== &num_ints, &num_adds, &num_dtypes, ~~&combiner );~~ ==&combiner);== switch (combiner) { case MPI_COMBINER_NAMED: ~~printf( "Datatype~~ ==printf("Datatype== is ~~named:" );~~ ==named:");== /* To print the specific type, we can match against the predefined forms. We can NOT use a switch statement here We could also use MPI_TYPE_GET_NAME if we prefered to use names that the user may have changed. */ if (datatype == MPI_INT) printf( "MPI_INT\n" ); else if (datatype == MPI_DOUBLE) printf( "MPI_DOUBLE\n" ); ... else test for other types ... return 0; break; case MPI_COMBINER_STRUCT: case MPI_COMBINER_STRUCT_INTEGER: ~~printf( "Datatype~~ ==printf("Datatype== is struct ~~containing" );~~ ==containing");== array_of_ints = (int ~~*)malloc( num_ints~~ ==*)malloc(num_ints== * ~~sizeof(int) );~~ ==sizeof(int));== array_of_adds = (MPI_Aint *) ~~malloc( num_adds~~ ==malloc(num_adds== * ~~sizeof(MPI_Aint) );~~ ==sizeof(MPI_Aint));== array_of_dtypes = (MPI_Datatype *) ~~malloc( num_dtypes~~ ==malloc(num_dtypes== * ~~sizeof(MPI_Datatype) ); MPI_Type_get_contents( datatype,~~ ==sizeof(MPI_Datatype)); MPI_Type_get_contents(datatype,== num_ints, num_adds, num_dtypes, array_of_ints, array_of_adds, ~~array_of_dtypes ); printf( "~~ ==array_of_dtypes); printf("== %d datatypes:\n", ~~array_of_ints[0] );~~ ==array_of_ints[0]);== for (i=0; i<array_of_ints[0]; i++) { ~~printf( "blocklength~~ ==printf("blocklength== %d, displacement %ld, type:\n", array_of_ints[i+1], ~~array_of_adds[i] );~~ ==(long)array_of_adds[i]);== if ~~(printdatatype( array_of_dtypes[i] ))~~ ==(printdatatype(array_of_dtypes[i]))== { /* Note that we free the type ONLY if it is not predefined */ ~~MPI_Type_free( &array_of_dtypes[i] );~~ ==MPI_Type_free(&array_of_dtypes[i]);== } } ~~free( array_of_ints ); free( array_of_adds ); free( array_of_dtypes );~~ ==free(array_of_ints); free(array_of_adds); free(array_of_dtypes);== break; ... other combiner values ... default: ~~printf( "Unrecognized~~ ==printf("Unrecognized== combiner ~~type\n" );~~ ==type\n");== } return 1; }

### MPI-3.0 → MPI-3.1  (12 changed paragraphs)

Send and receive a section of a 3D array.

Copy the (strictly) lower triangular part of a matrix.

Transpose a matrix.

Another approach to the transpose problem:

We manipulate an array of structures.

MPI_Get_address(particle, disp); MPI_Get_address(particle[0].d, disp+1); MPI_Get_address(particle[0].b, disp+2); base = disp[0]; for (i=0; i < 3; i++) disp[i] ~~-= base;~~ === MPI_Aint_diff(disp[i], base);==

MPI_Get_address(particle+1, &sizeofentry); sizeofentry ~~-= base;~~ === MPI_Aint_diff(sizeofentry, base);==

/* consecutive particles with index zero are handled as one block */ j=0; for (i=0; i < 1000; i++) if (particle[i].type == 0) { for (k=i+1; (k < 1000)&&(particle[k].type == ~~0) ;~~ ==0);== k++); zdisp[j] = i; zblock[j] = k-i; j++; i = k; } MPI_Type_indexed(j, zblock, zdisp, Particletype, &Zparticles);

j=0; for (i=0; i < 1000; i++) if (particle[i].type == 0) { for (k=i+1; (k < 1000)&&(particle[k].type == ~~0) ;~~ ==0);== k++); zdisp[j] = i; zblock[j] = k-i; j++; i = k; } MPI_Type_indexed(j, zblock, zdisp, Particletype, &Zparticles); /* Zparticles describe particles with type zero, using their absolute addresses*/

Handling of unions.

MPI_Get_address(u, &i); MPI_Get_address(u+1, &extent); extent ~~-= i;~~ === MPI_Aint_diff(extent, i);==

This example shows how a datatype can be decoded. The routine ~~printdatatype~~ ==`printdatatype`== prints out the elements of the datatype. Note the use of `MPI_Type_free` for datatypes that are not predefined.

### MPI-3.1 → MPI-4.0  (19 changed paragraphs)

REAL a(100,100,100), e(9,9,9) INTEGER oneslice, twoslice, threeslice, myrank, ierr ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== lb, sizeofreal INTEGER status(MPI_STATUS_SIZE)

~~C~~ ==!== extract the section a(1:17:2, 3:11, 2:10) ~~C~~ ==!== and store it in e(:,:,:).

CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)

~~C~~ ==!== create datatype for a 1D section CALL MPI_TYPE_VECTOR(9, 1, 2, MPI_REAL, oneslice, ierr)

~~C~~ ==!== create datatype for a 2D section CALL MPI_TYPE_CREATE_HVECTOR(9, 1, 100*sizeofreal, oneslice, ==&== twoslice, ierr)

~~C~~ ==!== create datatype for the entire section CALL MPI_TYPE_CREATE_HVECTOR(9, 1, 100*100*sizeofreal, twoslice, ==&== threeslice, ierr)

CALL MPI_TYPE_COMMIT(threeslice, ierr) CALL MPI_SENDRECV(a(1,3,2), 1, threeslice, myrank, 0, e, 9*9*9, ==&== MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)

REAL a(100,100), b(100,100) INTEGER disp(100), blocklen(100), ltype, myrank, ierr INTEGER status(MPI_STATUS_SIZE)

~~C~~ ==!== copy lower triangular part of array a ~~C~~ ==!== onto lower triangular part of array b

CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

~~C~~ ==!== compute start and size of each column DO ~~i=1, 100~~ ==i=1,100== disp(i) = 100*(i-1) + i blocklen(i) = 100-i END DO

~~C~~ ==!== create datatype for lower triangular part CALL MPI_TYPE_INDEXED(100, blocklen, disp, MPI_REAL, ltype, ierr)

CALL MPI_TYPE_COMMIT(ltype, ierr) CALL MPI_SENDRECV(a, 1, ltype, myrank, 0, b, 1, ==&== ltype, myrank, 0, MPI_COMM_WORLD, status, ierr)

REAL a(100,100), b(100,100) INTEGER row, xpose, myrank, ierr ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== lb, sizeofreal INTEGER status(MPI_STATUS_SIZE)

~~C~~ ==!== transpose matrix a onto b

CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)

~~C~~ ==!== create datatype for one row CALL MPI_TYPE_VECTOR(100, 1, 100, MPI_REAL, row, ierr)

~~C~~ ==!== create datatype for matrix in row-major order CALL MPI_TYPE_CREATE_HVECTOR(100, 1, sizeofreal, row, xpose, ierr)

CALL MPI_TYPE_COMMIT(xpose, ierr)

~~C~~ ==!== send matrix in row-major order and receive in column major order CALL MPI_SENDRECV(a, 1, xpose, myrank, 0, b, 100*100, ==&== MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)

REAL a(100,100), b(100,100) INTEGER row, row1 ~~INTEGER (KIND=MPI_ADDRESS_KIND) disp(2),~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== lb, sizeofreal INTEGER myrank, ierr INTEGER status(MPI_STATUS_SIZE)

CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

~~C~~ ==!== transpose matrix a onto b

CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)

~~C~~ ==!== create datatype for one row CALL MPI_TYPE_VECTOR(100, 1, 100, MPI_REAL, row, ierr)

~~C~~ ==!== create datatype for one row, with the extent of one real number lb = 0 CALL MPI_TYPE_CREATE_RESIZED(row, lb, sizeofreal, row1, ierr)

CALL MPI_TYPE_COMMIT(row1, ierr)

~~C~~ ==!== send 100 rows and receive in column major order CALL MPI_SENDRECV(a, 100, row1, myrank, 0, b, 100*100, ==&== MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)

~~We~~ ==Use of MPI datatypes to== manipulate an array of structures.

~~       /* If compiler does padding in mysterious ways,        the following may be safer */~~

~~    /* compute extent of the structure */~~

~~    MPI_Get_address(particle+1, &sizeofentry);     sizeofentry = MPI_Aint_diff(sizeofentry, base);~~

~~    /* build datatype describing structure */~~

~~    MPI_Type_create_resized(Particlestruct, 0, sizeofentry, &Particletype);~~

~~                  /* 4.1:             send the entire array */~~

==    /* Since the compiler may pad the structure, it is best to explicitly        set the extent of the MPI datatype for a structure element using        MPI_Type_create_resized */==

==    /* compute extent of the structure */     MPI_Get_address(particle+1, &sizeofentry);     sizeofentry = MPI_Aint_diff(sizeofentry, base);==

==    /* build datatype describing structure */     MPI_Type_create_resized(Particlestruct, 0, sizeofentry, &Particletype);==

==    /* 4.1: send the entire array */==

/* 4.2: send only the entries of type zero particles, preceded by the number of such entries */

/* A probably more efficient way of defining Zparticles */

/* 4.3: send the first two coordinates of all entries */

/* sizeofentry can also be computed by subtracting the address of particle[0] from the address of particle[1] */

/* an alternative solution to 4.3 */

/* build datatype describing first array entry */

/* 5.1: send the entire array */

/* 5.2: send the entries of type zero, preceded by the number of such entries */

~~Handling of~~ ==This example shows how datatypes can be used to handle== unions.

int ==i,== utype;

MPI_Datatype mpi_utype[2]; MPI_Aint ~~i,~~ ==ubase,== extent;

MPI_Get_address(u, ~~&i);~~ ==&ubase);== MPI_Get_address(u+1, &extent); extent = MPI_Aint_diff(extent, ~~i);~~ ==ubase);==

~~    /* actual communication */~~

~~    MPI_Send(u, 1000, mpi_utype[utype], dest, tag, comm);~~

==    /* actual communication */     MPI_Send(u, 1000, mpi_utype[utype], dest, tag, comm);==

/* Example of decoding a datatype.

Returns 0 if the datatype is predefined, 1 otherwise */ #include <stdio.h> #include <stdlib.h> #include "mpi.h" int printdatatype(MPI_Datatype datatype) { int *array_of_ints; MPI_Aint *array_of_adds; MPI_Datatype *array_of_dtypes; int num_ints, num_adds, num_dtypes, combiner; int i;

MPI_Type_get_envelope(datatype, &num_ints, &num_adds, &num_dtypes, &combiner); switch (combiner) { case MPI_COMBINER_NAMED: printf("Datatype is named:"); /* To print the specific type, we can match against the predefined forms. We can NOT use a switch statement here We could also use MPI_TYPE_GET_NAME if we prefered to use names that the user may have changed. */ if (datatype == MPI_INT) ~~printf( "MPI_INT\n" );~~ ==printf("MPI_INT\n");== else if (datatype == MPI_DOUBLE) ~~printf( "MPI_DOUBLE\n" );~~ ==printf("MPI_DOUBLE\n");== ... else test for other types ... return 0; break; case MPI_COMBINER_STRUCT: case MPI_COMBINER_STRUCT_INTEGER: printf("Datatype is struct containing"); array_of_ints = (int *)malloc(num_ints * sizeof(int)); array_of_adds = (MPI_Aint *) malloc(num_adds * sizeof(MPI_Aint)); array_of_dtypes = (MPI_Datatype *) malloc(num_dtypes * sizeof(MPI_Datatype)); MPI_Type_get_contents(datatype, num_ints, num_adds, num_dtypes, array_of_ints, array_of_adds, array_of_dtypes); printf(" %d datatypes:\n", array_of_ints[0]); for (i=0; i<array_of_ints[0]; i++) { printf("blocklength %d, displacement %ld, type:\n", array_of_ints[i+1], (long)array_of_adds[i]); if (printdatatype(array_of_dtypes[i])) { /* Note that we free the type ONLY if it is not predefined */ MPI_Type_free(&array_of_dtypes[i]); } } free(array_of_ints); free(array_of_adds); free(array_of_dtypes); break; ... other combiner values ... default: printf("Unrecognized combiner type\n"); } return 1; }

### MPI-4.0 → MPI-4.1  (8 changed paragraphs)

~~    REAL a(100,100,100), e(9,9,9)     INTEGER oneslice, twoslice, threeslice, myrank, ierr     INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal     INTEGER status(MPI_STATUS_SIZE)~~

~~    ! extract the section a(1:17:2, 3:11, 2:10)     ! and store it in e(:,:,:).~~

~~    CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)~~

~~    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)~~

~~    ! create datatype for a 1D section     CALL MPI_TYPE_VECTOR(9, 1, 2, MPI_REAL, oneslice, ierr)~~

~~    ! create datatype for a 2D section     CALL MPI_TYPE_CREATE_HVECTOR(9, 1, 100*sizeofreal, oneslice, &                                        twoslice, ierr)~~

~~    ! create datatype for the entire section     CALL MPI_TYPE_CREATE_HVECTOR(9, 1, 100*100*sizeofreal, twoslice, &                                  threeslice, ierr)~~

~~    CALL MPI_TYPE_COMMIT(threeslice, ierr)     CALL MPI_SENDRECV(a(1,3,2), 1, threeslice, myrank, 0, e, 9*9*9, &                       MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)~~

==(code block added)==
``` [MPI]Fortran
REAL a(100,100,100), e(9,9,9)
INTEGER oneslice, twoslice, threeslice, myrank, ierr
INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal
INTEGER status(MPI_STATUS_SIZE)

! extract the section a(1:17:2, 3:11, 2:10)
! and store it in e(:,:,:).

CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)

! create datatype for a 1D section
CALL MPI_TYPE_VECTOR(9, 1, 2, MPI_REAL, oneslice, ierr)

! create datatype for a 2D section
CALL MPI_TYPE_CREATE_HVECTOR(9, 1, 100*sizeofreal, oneslice, &
                             twoslice, ierr)

! create datatype for the entire section
CALL MPI_TYPE_CREATE_HVECTOR(9, 1, 100*100*sizeofreal, twoslice, &
                             threeslice, ierr)

CALL MPI_TYPE_COMMIT(threeslice, ierr)
CALL MPI_SENDRECV(a(1,3,2), 1, threeslice, myrank, 0, e, 9*9*9, &
                  MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)
```

~~    REAL a(100,100), b(100,100)     INTEGER  disp(100), blocklen(100), ltype, myrank, ierr     INTEGER status(MPI_STATUS_SIZE)~~

~~    ! copy lower triangular part of array a     ! onto lower triangular part of array b~~

~~    CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)~~

~~    ! compute start and size of each column     DO i=1,100        disp(i) = 100*(i-1) + i        blocklen(i) = 100-i     END DO~~

~~    ! create datatype for lower triangular part     CALL MPI_TYPE_INDEXED(100, blocklen, disp, MPI_REAL, ltype, ierr)~~

~~    CALL MPI_TYPE_COMMIT(ltype, ierr)     CALL MPI_SENDRECV(a, 1, ltype, myrank, 0, b, 1, &                       ltype, myrank, 0, MPI_COMM_WORLD, status, ierr)~~

==(code block added)==
``` [MPI]Fortran
REAL a(100,100), b(100,100)
INTEGER  disp(100), blocklen(100), ltype, myrank, ierr
INTEGER status(MPI_STATUS_SIZE)

! copy lower triangular part of array a
! onto lower triangular part of array b

CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

! compute start and size of each column
DO i=1,100
   disp(i) = 100*(i-1) + i
   blocklen(i) = 100-i
END DO

! create datatype for lower triangular part
CALL MPI_TYPE_INDEXED(100, blocklen, disp, MPI_REAL, ltype, ierr)

CALL MPI_TYPE_COMMIT(ltype, ierr)
CALL MPI_SENDRECV(a, 1, ltype, myrank, 0, b, 1, &
                  ltype, myrank, 0, MPI_COMM_WORLD, status, ierr)
```

~~    REAL a(100,100), b(100,100)     INTEGER row, xpose, myrank, ierr     INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal     INTEGER status(MPI_STATUS_SIZE)~~

~~    ! transpose matrix a onto b~~

~~    CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)~~

~~    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)~~

~~    ! create datatype for one row     CALL MPI_TYPE_VECTOR(100, 1, 100, MPI_REAL, row, ierr)~~

~~    ! create datatype for matrix in row-major order     CALL MPI_TYPE_CREATE_HVECTOR(100, 1, sizeofreal, row, xpose, ierr)~~

~~    CALL MPI_TYPE_COMMIT(xpose, ierr)~~

~~    ! send matrix in row-major order and receive in column major order     CALL MPI_SENDRECV(a, 1, xpose, myrank, 0, b, 100*100, &                       MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)~~

==(code block added)==
``` [MPI]Fortran
REAL a(100,100), b(100,100)
INTEGER row, xpose, myrank, ierr
INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal
INTEGER status(MPI_STATUS_SIZE)

! transpose matrix a onto b

CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)

! create datatype for one row
CALL MPI_TYPE_VECTOR(100, 1, 100, MPI_REAL, row, ierr)

! create datatype for matrix in row-major order
CALL MPI_TYPE_CREATE_HVECTOR(100, 1, sizeofreal, row, xpose, ierr)

CALL MPI_TYPE_COMMIT(xpose, ierr)

! send matrix in row-major order and receive in column major order
CALL MPI_SENDRECV(a, 1, xpose, myrank, 0, b, 100*100, &
                  MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)
```

~~    REAL a(100,100), b(100,100)     INTEGER row, row1     INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal     INTEGER myrank, ierr     INTEGER status(MPI_STATUS_SIZE)~~

~~    CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)~~

~~    ! transpose matrix a onto b~~

~~    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)~~

~~    ! create datatype for one row     CALL MPI_TYPE_VECTOR(100, 1, 100, MPI_REAL, row, ierr)~~

~~    ! create datatype for one row, with the extent of one real number     lb = 0     CALL MPI_TYPE_CREATE_RESIZED(row, lb, sizeofreal, row1, ierr)~~

~~    CALL MPI_TYPE_COMMIT(row1, ierr)~~

~~    ! send 100 rows and receive in column major order     CALL MPI_SENDRECV(a, 100, row1, myrank, 0, b, 100*100, &                       MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)~~

==(code block added)==
``` [MPI]Fortran
REAL a(100,100), b(100,100)
INTEGER row, row1
INTEGER(KIND=MPI_ADDRESS_KIND) lb, sizeofreal
INTEGER myrank, ierr
INTEGER status(MPI_STATUS_SIZE)

CALL MPI_COMM_RANK(MPI_COMM_WORLD, myrank, ierr)

! transpose matrix a onto b

CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lb, sizeofreal, ierr)

! create datatype for one row
CALL MPI_TYPE_VECTOR(100, 1, 100, MPI_REAL, row, ierr)

! create datatype for one row, with the extent of one real number
lb = 0
CALL MPI_TYPE_CREATE_RESIZED(row, lb, sizeofreal, row1, ierr)

CALL MPI_TYPE_COMMIT(row1, ierr)

! send 100 rows and receive in column major order
CALL MPI_SENDRECV(a, 100, row1, myrank, 0, b, 100*100, &
                  MPI_REAL, myrank, 0, MPI_COMM_WORLD, status, ierr)
```

~~    struct Partstruct     {        int    type;  /* particle type */        double d[6];   /* particle coordinates */        char   b[7];   /* some additional information */     };~~

~~    struct Partstruct    particle[1000];~~

~~    int          i, dest, tag;     MPI_Comm     comm;~~

~~    /* build datatype describing structure */~~

~~    MPI_Datatype Particlestruct, Particletype;     MPI_Datatype type[3] = {MPI_INT, MPI_DOUBLE, MPI_CHAR};     int          blocklen[3] = {1, 6, 7};     MPI_Aint     disp[3];     MPI_Aint     base, lb, sizeofentry;~~

~~    /* compute displacements of structure components */~~

~~    MPI_Get_address(particle, disp);     MPI_Get_address(particle[0].d, disp+1);     MPI_Get_address(particle[0].b, disp+2);     base = disp[0];     for (i=0; i < 3; i++) disp[i] = MPI_Aint_diff(disp[i], base);~~

~~    MPI_Type_create_struct(3, blocklen, disp, type, &Particlestruct);~~

~~    /* Since the compiler may pad the structure, it is best to explicitly        set the extent of the MPI datatype for a structure element using        MPI_Type_create_resized */~~

~~    /* compute extent of the structure */     MPI_Get_address(particle+1, &sizeofentry);     sizeofentry = MPI_Aint_diff(sizeofentry, base);~~

~~    /* build datatype describing structure */     MPI_Type_create_resized(Particlestruct, 0, sizeofentry, &Particletype);~~

~~    /* 4.1: send the entire array */~~

~~    MPI_Type_commit(&Particletype);     MPI_Send(particle, 1000, Particletype, dest, tag, comm);~~

~~    /* 4.2: send only the entries of type zero particles,             preceded by the number of such entries */~~

~~    MPI_Datatype Zparticles;   /* datatype describing all particles                                   with type zero (needs to be recomputed                                   if types change) */     MPI_Datatype Ztype;~~

~~    int          zdisp[1000];     int          zblock[1000], j, k;     int          zzblock[2] = {1,1};     MPI_Aint     zzdisp[2];     MPI_Datatype zztype[2];~~

~~    /* compute displacements of type zero particles */     j = 0;     for (i=0; i < 1000; i++)        if (particle[i].type == 0)           {             zdisp[j] = i;             zblock[j] = 1;             j++;           }~~

~~    /* create datatype for type zero particles  */     MPI_Type_indexed(j, zblock, zdisp, Particletype, &Zparticles);~~

~~    /* prepend particle count */     MPI_Get_address(&j, zzdisp);     MPI_Get_address(particle, zzdisp+1);     zztype[0] = MPI_INT;     zztype[1] = Zparticles;     MPI_Type_create_struct(2, zzblock, zzdisp, zztype, &Ztype);~~

~~    MPI_Type_commit(&Ztype);     MPI_Send(MPI_BOTTOM, 1, Ztype, dest, tag, comm);~~

~~    /* A probably more efficient way of defining Zparticles */~~

~~    /* consecutive particles with index zero are handled as one block */     j=0;     for (i=0; i < 1000; i++)        if (particle[i].type == 0)           {              for (k=i+1; (k < 1000)&&(particle[k].type == 0); k++);              zdisp[j] = i;              zblock[j] = k-i;              j++;              i = k;           }     MPI_Type_indexed(j, zblock, zdisp, Particletype, &Zparticles);~~

~~    /* 4.3: send the first two coordinates of all entries */~~

~~    MPI_Datatype Allpairs;      /* datatype for all pairs of coordinates */~~

~~    MPI_Type_get_extent(Particletype, &lb, &sizeofentry);~~

~~    /* sizeofentry can also be computed by subtracting the address        of particle[0] from the address of particle[1] */~~

~~    MPI_Type_create_hvector(1000, 2, sizeofentry, MPI_DOUBLE, &Allpairs);     MPI_Type_commit(&Allpairs);     MPI_Send(particle[0].d, 1, Allpairs, dest, tag, comm);~~

~~    /* an alternative solution to 4.3 */~~

~~    MPI_Datatype Twodouble;~~

~~    MPI_Type_contiguous(2, MPI_DOUBLE, &Twodouble);~~

~~    MPI_Datatype Onepair;   /* datatype for one pair of coordinates, with                               the extent of one particle entry */~~

~~    MPI_Type_create_resized(Twodouble, 0, sizeofentry, &Onepair );     MPI_Type_commit(&Onepair);     MPI_Send(particle[0].d, 1000, Onepair, dest, tag, comm);~~

==(code block added)==
``` [MPI]C
struct Partstruct
{
   int    type;   /* particle type */
   double d[6];   /* particle coordinates */
   char   b[7];   /* some additional information */
};

struct Partstruct    particle[1000];

int          i, dest, tag;
MPI_Comm     comm;

/* build datatype describing structure */

MPI_Datatype Particlestruct, Particletype;
MPI_Datatype type[3] = {MPI_INT, MPI_DOUBLE, MPI_CHAR};
int          blocklen[3] = {1, 6, 7};
MPI_Aint     disp[3];
MPI_Aint     base, lb, sizeofentry;

/* compute displacements of structure components */

MPI_Get_address(particle, disp);
MPI_Get_address(particle[0].d, disp+1);
MPI_Get_address(particle[0].b, disp+2);
base = disp[0];
for (i=0; i < 3; i++) disp[i] = MPI_Aint_diff(disp[i], base);

MPI_Type_create_struct(3, blocklen, disp, type, &Particlestruct);

/* Since the compiler may pad the structure, it is best to explicitly
   set the extent of the MPI datatype for a structure element using
   MPI_Type_create_resized */

/* compute extent of the structure */
MPI_Get_address(particle+1, &sizeofentry);
sizeofentry = MPI_Aint_diff(sizeofentry, base);

/* build datatype describing structure */
MPI_Type_create_resized(Particlestruct, 0, sizeofentry, &Particletype);

/* 4.1: send the entire array */

MPI_Type_commit(&Particletype);
MPI_Send(particle, 1000, Particletype, dest, tag, comm);

/* 4.2: send only the entries of type zero particles,
        preceded by the number of such entries */

MPI_Datatype Zparticles;   /* datatype describing all particles
                              with type zero (needs to be recomputed
                              if types change) */
MPI_Datatype Ztype;

int          zdisp[1000];
int          zblock[1000], j, k;
int          zzblock[2] = {1,1};
MPI_Aint     zzdisp[2];
MPI_Datatype zztype[2];

/* compute displacements of type zero particles */
j = 0;
for (i=0; i < 1000; i++)
   if (particle[i].type == 0)
      {
        zdisp[j] = i;
        zblock[j] = 1;
        j++;
      }

/* create datatype for type zero particles  */
MPI_Type_indexed(j, zblock, zdisp, Particletype, &Zparticles);

/* prepend particle count */
MPI_Get_address(&j, zzdisp);
MPI_Get_address(particle, zzdisp+1);
zztype[0] = MPI_INT;
zztype[1] = Zparticles;
MPI_Type_create_struct(2, zzblock, zzdisp, zztype, &Ztype);

MPI_Type_commit(&Ztype);
MPI_Send(MPI_BOTTOM, 1, Ztype, dest, tag, comm);

/* A probably more efficient way of defining Zparticles */

/* consecutive particles with index zero are handled as one block */
j=0;
for (i=0; i < 1000; i++)
   if (particle[i].type == 0)
      {
         for (k=i+1; (k < 1000)&&(particle[k].type == 0); k++);
         zdisp[j] = i;
         zblock[j] = k-i;
         j++;
         i = k;
      }
MPI_Type_indexed(j, zblock, zdisp, Particletype, &Zparticles);

/* 4.3: send the first two coordinates of all entries */

MPI_Datatype Allpairs;      /* datatype for all pairs of coordinates */

MPI_Type_get_extent(Particletype, &lb, &sizeofentry);

/* sizeofentry can also be computed by subtracting the address
   of particle[0] from the address of particle[1] */

MPI_Type_create_hvector(1000, 2, sizeofentry, MPI_DOUBLE, &Allpairs);
MPI_Type_commit(&Allpairs);
MPI_Send(particle[0].d, 1, Allpairs, dest, tag, comm);

/* an alternative solution to 4.3 */

MPI_Datatype Twodouble;

MPI_Type_contiguous(2, MPI_DOUBLE, &Twodouble);

MPI_Datatype Onepair;   /* datatype for one pair of coordinates, with
                          the extent of one particle entry */

MPI_Type_create_resized(Twodouble, 0, sizeofentry, &Onepair );
MPI_Type_commit(&Onepair);
MPI_Send(particle[0].d, 1000, Onepair, dest, tag, comm);
```

~~    struct Partstruct     {         int    type;         double d[6];         char   b[7];     };~~

~~    struct Partstruct particle[1000];~~

~~    /* build datatype describing first array entry */~~

~~    MPI_Datatype Particletype;     MPI_Datatype type[3] = {MPI_INT, MPI_DOUBLE, MPI_CHAR};     int          block[3] = {1, 6, 7};     MPI_Aint     disp[3];~~

~~    MPI_Get_address(particle, disp);     MPI_Get_address(particle[0].d, disp+1);     MPI_Get_address(particle[0].b, disp+2);     MPI_Type_create_struct(3, block, disp, type, &Particletype);~~

~~    /* Particletype describes first array entry -- using absolute        addresses */~~

~~    /* 5.1: send the entire array */~~

~~    MPI_Type_commit(&Particletype);     MPI_Send(MPI_BOTTOM, 1000, Particletype, dest, tag, comm);~~

~~    /* 5.2: send the entries of type zero,             preceded by the number of such entries */~~

~~    MPI_Datatype Zparticles, Ztype;~~

~~    int          zdisp[1000];     int          zblock[1000], i, j, k;     int          zzblock[2] = {1,1};     MPI_Datatype zztype[2];     MPI_Aint     zzdisp[2];~~

~~    j=0;     for (i=0; i < 1000; i++)         if (particle[i].type == 0)             {                 for (k=i+1; (k < 1000)&&(particle[k].type == 0); k++);                 zdisp[j] = i;                 zblock[j] = k-i;                 j++;                 i = k;             }     MPI_Type_indexed(j, zblock, zdisp, Particletype, &Zparticles);     /* Zparticles describe particles with type zero, using        their absolute addresses*/~~

~~    /* prepend particle count */     MPI_Get_address(&j, zzdisp);     zzdisp[1] = (MPI_Aint)0;     zztype[0] = MPI_INT;     zztype[1] = Zparticles;     MPI_Type_create_struct(2, zzblock, zzdisp, zztype, &Ztype);~~

~~    MPI_Type_commit(&Ztype);     MPI_Send(MPI_BOTTOM, 1, Ztype, dest, tag, comm);~~

==(code block added)==
``` [MPI]C
struct Partstruct
{
    int    type;
    double d[6];
    char   b[7];
};

struct Partstruct particle[1000];

/* build datatype describing first array entry */

MPI_Datatype Particletype;
MPI_Datatype type[3] = {MPI_INT, MPI_DOUBLE, MPI_CHAR};
int          block[3] = {1, 6, 7};
MPI_Aint     disp[3];

MPI_Get_address(particle, disp);
MPI_Get_address(particle[0].d, disp+1);
MPI_Get_address(particle[0].b, disp+2);
MPI_Type_create_struct(3, block, disp, type, &Particletype);

/* Particletype describes first array entry -- using absolute
   addresses */

/* 5.1: send the entire array */

MPI_Type_commit(&Particletype);
MPI_Send(MPI_BOTTOM, 1000, Particletype, dest, tag, comm);

/* 5.2: send the entries of type zero,
        preceded by the number of such entries */

MPI_Datatype Zparticles, Ztype;

int          zdisp[1000];
int          zblock[1000], i, j, k;
int          zzblock[2] = {1,1};
MPI_Datatype zztype[2];
MPI_Aint     zzdisp[2];

j=0;
for (i=0; i < 1000; i++)
    if (particle[i].type == 0)
        {
            for (k=i+1; (k < 1000)&&(particle[k].type == 0); k++);
            zdisp[j] = i;
            zblock[j] = k-i;
            j++;
            i = k;
        }
MPI_Type_indexed(j, zblock, zdisp, Particletype, &Zparticles);
/* Zparticles describe particles with type zero, using
   their absolute addresses*/

/* prepend particle count */
MPI_Get_address(&j, zzdisp);
zzdisp[1] = (MPI_Aint)0;
zztype[0] = MPI_INT;
zztype[1] = Zparticles;
MPI_Type_create_struct(2, zzblock, zzdisp, zztype, &Ztype);

MPI_Type_commit(&Ztype);
MPI_Send(MPI_BOTTOM, 1, Ztype, dest, tag, comm);
```

~~    union {        int     ival;        float   fval;           } u[1000];~~

~~    int     i, utype;~~

~~    /* All entries of u have identical type; variable        utype keeps track of their current type */~~

~~    MPI_Datatype   mpi_utype[2];     MPI_Aint       ubase, extent;~~

~~    /* compute an MPI datatype for each possible union type;        assume values are left-aligned in union storage. */~~

~~    MPI_Get_address(u, &ubase);     MPI_Get_address(u+1, &extent);     extent = MPI_Aint_diff(extent, ubase);~~

~~    MPI_Type_create_resized(MPI_INT, 0, extent, &mpi_utype[0]);~~

~~    MPI_Type_create_resized(MPI_FLOAT, 0, extent, &mpi_utype[1]);~~

~~    for(i=0; i<2; i++) MPI_Type_commit(&mpi_utype[i]);~~

~~    /* actual communication */     MPI_Send(u, 1000, mpi_utype[utype], dest, tag, comm);~~

==(code block added)==
``` [MPI]C
union {
   int     ival;
   float   fval;
      } u[1000];

int     i, utype;

/* All entries of u have identical type; variable
   utype keeps track of their current type */

MPI_Datatype   mpi_utype[2];
MPI_Aint       ubase, extent;

/* compute an MPI datatype for each possible union type;
   assume values are left-aligned in union storage. */

MPI_Get_address(u, &ubase);
MPI_Get_address(u+1, &extent);
extent = MPI_Aint_diff(extent, ubase);

MPI_Type_create_resized(MPI_INT, 0, extent, &mpi_utype[0]);

MPI_Type_create_resized(MPI_FLOAT, 0, extent, &mpi_utype[1]);

for(i=0; i<2; i++) MPI_Type_commit(&mpi_utype[i]);

/* actual communication */
MPI_Send(u, 1000, mpi_utype[utype], dest, tag, comm);
```

~~    /*       Example of decoding a datatype.~~

~~      Returns 0 if the datatype is predefined, 1 otherwise      */     #include <stdio.h>     #include <stdlib.h>     #include "mpi.h"     int printdatatype(MPI_Datatype datatype)     {         int *array_of_ints;         MPI_Aint *array_of_adds;         MPI_Datatype *array_of_dtypes;         int num_ints, num_adds, num_dtypes, combiner;         int i;~~

~~        MPI_Type_get_envelope(datatype,                               &num_ints, &num_adds, &num_dtypes, &combiner);         switch (combiner) {         case MPI_COMBINER_NAMED:             printf("Datatype is named:");             /* To print the specific type, we can match against the                predefined forms. We can NOT use a switch statement here                 We could also use MPI_TYPE_GET_NAME if we prefered to use                names that the user may have changed.              */             if      (datatype == MPI_INT)    printf("MPI_INT\n");             else if (datatype == MPI_DOUBLE) printf("MPI_DOUBLE\n");             ... else test for other types ...             return 0;             break;         case MPI_COMBINER_STRUCT:         case MPI_COMBINER_STRUCT_INTEGER:             printf("Datatype is struct containing");             array_of_ints   = (int *)malloc(num_ints * sizeof(int));             array_of_adds   =                        (MPI_Aint *) malloc(num_adds * sizeof(MPI_Aint));             array_of_dtypes = (MPI_Datatype *)                 malloc(num_dtypes * sizeof(MPI_Datatype));             MPI_Type_get_contents(datatype, num_ints, num_adds, num_dtypes,                                array_of_ints, array_of_adds, array_of_dtypes);             printf(" %d datatypes:\n", array_of_ints[0]);             for (i=0; i<array_of_ints[0]; i++) {                 printf("blocklength %d, displacement %ld, type:\n",                         array_of_ints[i+1], (long)array_of_adds[i]);                 if (printdatatype(array_of_dtypes[i])) {                     /* Note that we free the type ONLY if it                        is not predefined */                     MPI_Type_free(&array_of_dtypes[i]);                 }             }             free(array_of_ints);             free(array_of_adds);             free(array_of_dtypes);             break;             ... other combiner values ...         default:             printf("Unrecognized combiner type\n");         }         return 1;     }~~

==(code block added)==
``` [MPI]C
/*
  Example of decoding a datatype.

  Returns 0 if the datatype is predefined, 1 otherwise
 */
#include <stdio.h>
#include <stdlib.h>
#include "mpi.h"
int printdatatype(MPI_Datatype datatype)
{
    int *array_of_ints;
    MPI_Aint *array_of_adds;
    MPI_Datatype *array_of_dtypes;
    int num_ints, num_adds, num_dtypes, combiner;
    int i;

    MPI_Type_get_envelope(datatype,
                          &num_ints, &num_adds, &num_dtypes, &combiner);
    switch (combiner) {
    case MPI_COMBINER_NAMED:
        printf("Datatype is named:");
        /* To print the specific type, we can match against the
           predefined forms. We can NOT use a switch statement here
           We could also use MPI_TYPE_GET_NAME if we prefered to use
           names that the user may have changed.
         */
        if      (datatype == MPI_INT)    printf("MPI_INT\n");
        else if (datatype == MPI_DOUBLE) printf("MPI_DOUBLE\n");
        ... else test for other types ...
        return 0;
        break;
    case MPI_COMBINER_STRUCT:
        printf("Datatype is struct containing");
        array_of_ints   = (int *)malloc(num_ints * sizeof(int));
        array_of_adds   =
                   (MPI_Aint *) malloc(num_adds * sizeof(MPI_Aint));
        array_of_dtypes = (MPI_Datatype *)
            malloc(num_dtypes * sizeof(MPI_Datatype));
        MPI_Type_get_contents(datatype, num_ints, num_adds, num_dtypes,
                         array_of_ints, array_of_adds, array_of_dtypes);
        printf(" %d datatypes:\n", array_of_ints[0]);
        for (i=0; i<array_of_ints[0]; i++) {
            printf("blocklength %d, displacement %ld, type:\n",
                   array_of_ints[i+1], (long)array_of_adds[i]);
            if (printdatatype(array_of_dtypes[i])) {
                /* Note that we free the type ONLY if it
                   is not predefined */
                MPI_Type_free(&array_of_dtypes[i]);
            }
        }
        free(array_of_ints);
        free(array_of_adds);
        free(array_of_dtypes);
        break;
        ... other combiner values ...
    default:
        printf("Unrecognized combiner type\n");
    }
    return 1;
}
```

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Examples]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Examples]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Examples]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Examples]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Examples]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Examples]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Examples]]

---
title: "Examples"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Examples

Chapter **io** · in [[versions/v20/sections/io#Examples|MPI-2.0]], [[versions/v21/sections/io#Examples|MPI-2.1]], [[versions/v22/sections/io#Examples|MPI-2.2]], [[versions/v30/sections/io#Examples|MPI-3.0]], [[versions/v31/sections/io#Examples|MPI-3.1]], [[versions/v40/sections/io#Examples|MPI-4.0]], [[versions/v41/sections/io#Examples|MPI-4.1]], [[versions/v50/sections/io#Examples|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~- The first sync guarantees that the data written by all~~

~~  processes is transferred to the storage device.~~

~~- The second sync guarantees that all data which has been~~

~~  transferred to the storage device is visible to all processes.~~

==- The first sync guarantees that the data written by all processes is transferred to the storage device.==

==- The second sync guarantees that all data which has been transferred to the storage device is visible to all processes.==

### MPI-3.0 → MPI-3.1  (7 changed paragraphs)

/* Process 0 */ int i, ~~a[10] ;~~ ==a[10];== int TRUE = 1;

for ( i=0;i<10;i++) a[i] = ~~5 ;~~ ==5;==

MPI_File_open( MPI_COMM_WORLD, "workfile", MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0 ~~) ;~~ ==);== MPI_File_set_view( fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== MPI_File_set_atomicity( fh0, TRUE ~~) ;~~ ==);== MPI_File_write_at(fh0, 0, a, 10, MPI_INT, ~~&status) ;~~ ==&status);== /* MPI_Barrier( MPI_COMM_WORLD ~~) ;~~ ==);== */

/* Process 1 */ int ~~b[10] ;~~ ==b[10];== int TRUE = 1; MPI_File_open( MPI_COMM_WORLD, "workfile", MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1 ~~) ;~~ ==);== MPI_File_set_view( fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== MPI_File_set_atomicity( fh1, TRUE ~~) ;~~ ==);== /* MPI_Barrier( MPI_COMM_WORLD ~~) ;~~ ==);== */ MPI_File_read_at(fh1, 0, b, 10, MPI_INT, ~~&status) ;~~ ==&status);==

A user may guarantee that the write on process `0` precedes the read on process `1` by imposing temporal order with, for example, calls to ~~`MPI_BARRIER`.~~ ==[[versions/v31/API/MPI_BARRIER|MPI_BARRIER]] .==

> Routines other than ~~`MPI_BARRIER`~~ ==[[versions/v31/API/MPI_BARRIER|MPI_BARRIER]]== may be used to impose temporal order. In the example above, process 0 could use ~~`MPI_SEND`~~ ==[[versions/v31/API/MPI_SEND|MPI_SEND]]== to send a 0 byte message, received by process 1 using ~~`MPI_RECV`.~~ ==[[versions/v31/API/MPI_RECV|MPI_RECV]] .==

/* Process 0 */ int i, ~~a[10] ;~~ ==a[10];== for ( i=0;i<10;i++) a[i] = ~~5 ;~~ ==5;==

MPI_File_open( MPI_COMM_WORLD, "workfile", MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0 ~~) ;~~ ==);== MPI_File_set_view( fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status ~~) ;~~ ==);== MPI_File_sync( fh0 ~~) ;~~ ==);== MPI_Barrier( MPI_COMM_WORLD ~~) ;~~ ==);== MPI_File_sync( fh0 ~~) ;~~ ==);==

/* Process 1 */ int ~~b[10] ;~~ ==b[10];== MPI_File_open( MPI_COMM_WORLD, "workfile", MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1 ~~) ;~~ ==);== MPI_File_set_view( fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== MPI_File_sync( fh1 ~~) ;~~ ==);== MPI_Barrier( MPI_COMM_WORLD ~~) ;~~ ==);== MPI_File_sync( fh1 ~~) ;~~ ==);== MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status ~~) ;~~ ==);==

~~- The second sync guarantees that all data which has been transferred to the storage device is visible to all processes.~~

~~  (This does not affect process 0 in this example.)~~

==- The second sync guarantees that all data which has been transferred to the storage device is visible to all processes. (This does not affect process 0 in this example.)==

/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */ /* Process 0 */ int i, ~~a[10] ;~~ ==a[10];== for ( i=0;i<10;i++) a[i] = ~~5 ;~~ ==5;==

MPI_File_open( MPI_COMM_WORLD, "workfile", MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0 ~~) ;~~ ==);== MPI_File_set_view( fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status ~~) ;~~ ==);== MPI_File_sync( fh0 ~~) ;~~ ==);== MPI_Barrier( MPI_COMM_WORLD ~~) ;~~ ==);==

/* Process 1 */ int ~~b[10] ;~~ ==b[10];== MPI_File_open( MPI_COMM_WORLD, "workfile", MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1 ~~) ;~~ ==);== MPI_File_set_view( fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== MPI_Barrier( MPI_COMM_WORLD ~~) ;~~ ==);== MPI_File_sync( fh1 ~~) ;~~ ==);== MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status ~~) ;~~ ==);==

~~The above program also violates the MPI rule against out-of-order collective operations~~

~~and will deadlock for implementations in which `MPI_FILE_SYNC` blocks.~~

==The above program also violates the MPI rule against out-of-order collective operations and will deadlock for implementations in which [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] blocks.==

> Some implementations may choose to implement ~~`MPI_FILE_SYNC`~~ ==[[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]]== as a temporally synchronizing function. When using such an implementation, the “sync-barrier-sync” construct above can be replaced by a single “sync.” The results of using such code with an implementation for which ~~`MPI_FILE_SYNC`~~ ==[[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]]== is not temporally synchronizing is undefined.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

~~    /* Process 0 */     int  i, a[10];     int  TRUE = 1;~~

~~    for ( i=0;i<10;i++)        a[i] = 5;~~

~~    MPI_File_open( MPI_COMM_WORLD, "workfile",                     MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0 );     MPI_File_set_view( fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL );     MPI_File_set_atomicity( fh0, TRUE );     MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status);     /* MPI_Barrier( MPI_COMM_WORLD ); */~~

~~    /* Process 1 */     int  b[10];     int  TRUE = 1;     MPI_File_open( MPI_COMM_WORLD, "workfile",                     MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1 );     MPI_File_set_view( fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL );     MPI_File_set_atomicity( fh1, TRUE );     /* MPI_Barrier( MPI_COMM_WORLD ); */     MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);~~

==    /* Process 0 */==

==    int  i, a[10];     int  TRUE = 1;==

==    for (i=0;i<10;i++)        a[i] = 5;==

==    MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0);     MPI_File_set_view(fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_set_atomicity(fh0, TRUE);     MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status);     /* MPI_Barrier(MPI_COMM_WORLD); */==

==    /* Process 1 */==

==    int  b[10];     int  TRUE = 1;     MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1);     MPI_File_set_view(fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_set_atomicity(fh1, TRUE);     /* MPI_Barrier(MPI_COMM_WORLD); */     MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);==

~~    /* Process 0 */     int  i, a[10];     for ( i=0;i<10;i++)        a[i] = 5;~~

~~    MPI_File_open( MPI_COMM_WORLD, "workfile",                     MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0 );     MPI_File_set_view( fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL );     MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status );     MPI_File_sync( fh0 );     MPI_Barrier( MPI_COMM_WORLD );     MPI_File_sync( fh0 );~~

~~    /* Process 1 */     int  b[10];     MPI_File_open( MPI_COMM_WORLD, "workfile",                     MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1 );     MPI_File_set_view( fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL );     MPI_File_sync( fh1 );     MPI_Barrier( MPI_COMM_WORLD );     MPI_File_sync( fh1 );     MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status );~~

==    /* Process 0 */     int  i, a[10];     for (i=0;i<10;i++)        a[i] = 5;==

==    MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0);     MPI_File_set_view(fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status );     MPI_File_sync(fh0);     MPI_Barrier(MPI_COMM_WORLD);     MPI_File_sync(fh0);==

==    /* Process 1 */==

==    int  b[10];     MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1);     MPI_File_set_view(fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_sync(fh1);     MPI_Barrier(MPI_COMM_WORLD);     MPI_File_sync(fh1);     MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);==

~~    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */     /* Process 0 */     int  i, a[10];     for ( i=0;i<10;i++)        a[i] = 5;~~

~~    MPI_File_open( MPI_COMM_WORLD, "workfile",                     MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0 );     MPI_File_set_view( fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL );     MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status );     MPI_File_sync( fh0 );     MPI_Barrier( MPI_COMM_WORLD );~~

~~    /* Process 1 */     int  b[10];     MPI_File_open( MPI_COMM_WORLD, "workfile",                     MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1 );     MPI_File_set_view( fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL );     MPI_Barrier( MPI_COMM_WORLD );     MPI_File_sync( fh1 );     MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status );~~

==    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */     /* Process 0 */==

==    int  i, a[10];     for (i=0;i<10;i++)        a[i] = 5;==

==    MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0);     MPI_File_set_view(fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status);     MPI_File_sync(fh0);     MPI_Barrier(MPI_COMM_WORLD);==

==    /* Process 1 */==

==    int  b[10];     MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1);     MPI_File_set_view(fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_Barrier(MPI_COMM_WORLD);     MPI_File_sync(fh1);     MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);==

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

~~The simplest way to achieve consistency for conflicting accesses is to obtain sequential consistency by setting atomic mode. For the code below, process 1 will read either 0 or 10 integers. If the latter, every element of `b` will be `5`. If nonatomic mode is set, the results of the read are undefined.~~

~~    /* Process 0 */~~

~~    int  i, a[10];     int  TRUE = 1;~~

~~    for (i=0;i<10;i++)        a[i] = 5;~~

~~    MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0);     MPI_File_set_view(fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_set_atomicity(fh0, TRUE);     MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status);     /* MPI_Barrier(MPI_COMM_WORLD); */~~

~~    /* Process 1 */~~

~~    int  b[10];     int  TRUE = 1;     MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1);     MPI_File_set_view(fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_set_atomicity(fh1, TRUE);     /* MPI_Barrier(MPI_COMM_WORLD); */     MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);~~

==The simplest way to achieve consistency for conflicting accesses is to obtain sequential consistency by setting atomic mode.==

==For the code below, process 1 will read either 0 or 10 integers. If the latter, every element of `b` will be `5`. If nonatomic mode is set, the results of the read are undefined.==

==(code block added)==
``` [MPI]C
/* Process 0 */

int  i, a[10];
int  TRUE = 1;

for (i=0;i<10;i++)
   a[i] = 5;

MPI_File_open(MPI_COMM_WORLD, "workfile",
              MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0);
MPI_File_set_view(fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
MPI_File_set_atomicity(fh0, TRUE);
MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status);
/* MPI_Barrier(MPI_COMM_WORLD); */
```

==(code block added)==
``` [MPI]C
/* Process 1 */

int  b[10];
int  TRUE = 1;
MPI_File_open(MPI_COMM_WORLD, "workfile",
              MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1);
MPI_File_set_view(fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
MPI_File_set_atomicity(fh1, TRUE);
/* MPI_Barrier(MPI_COMM_WORLD); */
MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);
```

~~    /* Process 0 */     int  i, a[10];     for (i=0;i<10;i++)        a[i] = 5;~~

~~    MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0);     MPI_File_set_view(fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status );     MPI_File_sync(fh0);     MPI_Barrier(MPI_COMM_WORLD);     MPI_File_sync(fh0);~~

~~    /* Process 1 */~~

~~    int  b[10];     MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1);     MPI_File_set_view(fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_sync(fh1);     MPI_Barrier(MPI_COMM_WORLD);     MPI_File_sync(fh1);     MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);~~

==(code block added)==
``` [MPI]C
/* Process 0 */
int  i, a[10];
for (i=0;i<10;i++)
   a[i] = 5;

MPI_File_open(MPI_COMM_WORLD, "workfile",
              MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0);
MPI_File_set_view(fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status );
MPI_File_sync(fh0);
MPI_Barrier(MPI_COMM_WORLD);
MPI_File_sync(fh0);
```

==(code block added)==
``` [MPI]C
/* Process 1 */

int  b[10];
MPI_File_open(MPI_COMM_WORLD, "workfile",
              MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1);
MPI_File_set_view(fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
MPI_File_sync(fh1);
MPI_Barrier(MPI_COMM_WORLD);
MPI_File_sync(fh1);
MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);
```

- The second sync guarantees that all data ~~which~~ ==that== has been transferred to the storage device is visible to all processes. (This does not affect process 0 in this example.)

~~    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */     /* Process 0 */~~

~~    int  i, a[10];     for (i=0;i<10;i++)        a[i] = 5;~~

~~    MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0);     MPI_File_set_view(fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status);     MPI_File_sync(fh0);     MPI_Barrier(MPI_COMM_WORLD);~~

~~    /* Process 1 */~~

~~    int  b[10];     MPI_File_open(MPI_COMM_WORLD, "workfile",                    MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1);     MPI_File_set_view(fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_Barrier(MPI_COMM_WORLD);     MPI_File_sync(fh1);     MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);~~

~~    /* ----------------  THIS EXAMPLE IS ERRONEOUS --------------- */~~

==(code block added)==
``` [MPI]C
/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */
/* Process 0 */

int  i, a[10];
for (i=0;i<10;i++)
   a[i] = 5;

MPI_File_open(MPI_COMM_WORLD, "workfile",
              MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh0);
MPI_File_set_view(fh0, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
MPI_File_write_at(fh0, 0, a, 10, MPI_INT, &status);
MPI_File_sync(fh0);
MPI_Barrier(MPI_COMM_WORLD);
```

==(code block added)==
``` [MPI]C
/* Process 1 */

int  b[10];
MPI_File_open(MPI_COMM_WORLD, "workfile",
              MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &fh1);
MPI_File_set_view(fh1, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
MPI_Barrier(MPI_COMM_WORLD);
MPI_File_sync(fh1);
MPI_File_read_at(fh1, 0, b, 10, MPI_INT, &status);

/* ---------------- THIS EXAMPLE IS ERRONEOUS --------------- */
```

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Examples]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Examples]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Examples]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Examples]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Examples]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Examples]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Examples]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Examples]]

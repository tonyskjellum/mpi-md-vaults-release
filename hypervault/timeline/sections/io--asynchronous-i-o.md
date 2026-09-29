---
title: "Asynchronous I/O"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Asynchronous I/O

Chapter **io** · in [[versions/v20/sections/io#Asynchronous I/O|MPI-2.0]], [[versions/v21/sections/io#Asynchronous I/O|MPI-2.1]], [[versions/v22/sections/io#Asynchronous I/O|MPI-2.2]], [[versions/v30/sections/io#Asynchronous I/O|MPI-3.0]], [[versions/v31/sections/io#Asynchronous I/O|MPI-3.1]], [[versions/v40/sections/io#Asynchronous I/O|MPI-4.0]], [[versions/v41/sections/io#Asynchronous I/O|MPI-4.1]], [[versions/v50/sections/io#Asynchronous I/O|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

The following examples all access a preexisting file ~~“myfile.”~~ ==“`myfile`.”== Word `10` in myfile initially contains the integer `2`. Each example writes and reads word `10`.

### MPI-3.0 → MPI-3.1  (6 changed paragraphs)

int a = 4, b, TRUE=1; MPI_File_open( MPI_COMM_WORLD, "myfile", MPI_MODE_RDWR, MPI_INFO_NULL, &fh ~~) ;~~ ==);== MPI_File_set_view( fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== /* MPI_File_set_atomicity( fh, TRUE ~~) ;~~ ==);== Use this to set atomic mode. */ MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, ~~&reqs[0]) ;~~ ==&reqs[0]);== MPI_File_iread_at(fh, 10, &b, 1, MPI_INT, ~~&reqs[1]) ;~~ ==&reqs[1]);== MPI_Waitall(2, reqs, ~~statuses) ;~~ ==statuses);==

int a = 4, b; MPI_File_open( MPI_COMM_WORLD, "myfile", MPI_MODE_RDWR, MPI_INFO_NULL, &fh ~~) ;~~ ==);== MPI_File_set_view( fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== /* MPI_File_set_atomicity( fh, TRUE ~~) ;~~ ==);== Use this to set atomic mode. */ MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, ~~&reqs[0]) ;~~ ==&reqs[0]);== MPI_File_iread_at(fh, 10, &b, 1, MPI_INT, ~~&reqs[1]) ;~~ ==&reqs[1]);== MPI_Wait(&reqs[0], ~~&status) ;~~ ==&status);== MPI_Wait(&reqs[1], ~~&status) ;~~ ==&status);==

int a = 4, b; MPI_File_open( MPI_COMM_WORLD, "myfile", MPI_MODE_RDWR, MPI_INFO_NULL, &fh ~~) ;~~ ==);== MPI_File_set_view( fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, ~~&reqs[0]) ;~~ ==&reqs[0]);== MPI_Wait(&reqs[0], ~~&status) ;~~ ==&status);== MPI_File_iread_at(fh, 10, &b, 1, MPI_INT, ~~&reqs[1]) ;~~ ==&reqs[1]);== MPI_Wait(&reqs[1], ~~&status) ;~~ ==&status);==

int a = 4, b; MPI_File_open( MPI_COMM_WORLD, "myfile", MPI_MODE_RDWR, MPI_INFO_NULL, &fh ~~) ;~~ ==);== MPI_File_set_view( fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL ~~) ;~~ ==);== MPI_File_write_at(fh, 10, &a, 1, MPI_INT, &status ~~) ;~~ ==);== MPI_File_read_at(fh, 10, &b, 1, MPI_INT, &status ~~) ;~~ ==);==

~~    MPI_File_write_all_begin(fh,...) ;     MPI_File_iread(fh,...) ;     MPI_Wait(fh,...) ;     MPI_File_write_all_end(fh,...) ;~~

==    MPI_File_iwrite_all(fh,...);     MPI_File_iread_all(fh,...);     MPI_Waitall(...);==

==In addition, as mentioned in [[versions/v31/sections/io#Nonblocking Collective File Operations|Nonblocking Collective File Operations]] , nonblocking collective I/O operations have to be called in the same order on the file handle by all processes.==

==Similar considerations apply to conflicting accesses of the form:==

==    MPI_File_write_all_begin(fh,...);     MPI_File_iread(fh,...);     MPI_Wait(fh,...);     MPI_File_write_all_end(fh,...);==

~~MPI_File_write_all_begin(fh,...) ; MPI_File_read_all_begin(fh,...) ; MPI_File_read_all_end(fh,...) ; MPI_File_write_all_end(fh,...) ;~~ ==MPI_File_write_all_begin(fh,...); MPI_File_read_all_begin(fh,...); MPI_File_read_all_end(fh,...); MPI_File_write_all_end(fh,...);==

since split collective operations on the same file handle may not overlap (see ~~Section [[versions/v31/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] , page~~ [[versions/v31/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] ).

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

int a = 4, b, TRUE=1; ~~MPI_File_open( MPI_COMM_WORLD,~~ ==MPI_File_open(MPI_COMM_WORLD,== "myfile", MPI_MODE_RDWR, MPI_INFO_NULL, ~~&fh ); MPI_File_set_view( fh,~~ ==&fh); MPI_File_set_view(fh,== 0, MPI_INT, MPI_INT, "native", ~~MPI_INFO_NULL );~~ ==MPI_INFO_NULL);== /* ~~MPI_File_set_atomicity( fh, TRUE );~~ ==MPI_File_set_atomicity(fh, TRUE);== Use this to set atomic mode. */ MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, &reqs[0]); MPI_File_iread_at(fh, 10, &b, 1, MPI_INT, &reqs[1]); MPI_Waitall(2, reqs, statuses);

int a = 4, b; ~~MPI_File_open( MPI_COMM_WORLD,~~ ==MPI_File_open(MPI_COMM_WORLD,== "myfile", MPI_MODE_RDWR, MPI_INFO_NULL, ~~&fh ); MPI_File_set_view( fh,~~ ==&fh); MPI_File_set_view(fh,== 0, MPI_INT, MPI_INT, "native", ~~MPI_INFO_NULL );~~ ==MPI_INFO_NULL);== /* ~~MPI_File_set_atomicity( fh, TRUE );~~ ==MPI_File_set_atomicity(fh, TRUE);== Use this to set atomic mode. */ MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, &reqs[0]); MPI_File_iread_at(fh, 10, &b, 1, MPI_INT, &reqs[1]); MPI_Wait(&reqs[0], &status); MPI_Wait(&reqs[1], &status);

int a = 4, b; ~~MPI_File_open( MPI_COMM_WORLD,~~ ==MPI_File_open(MPI_COMM_WORLD,== "myfile", MPI_MODE_RDWR, MPI_INFO_NULL, ~~&fh ); MPI_File_set_view( fh,~~ ==&fh); MPI_File_set_view(fh,== 0, MPI_INT, MPI_INT, "native", ~~MPI_INFO_NULL );~~ ==MPI_INFO_NULL);== MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, &reqs[0]); MPI_Wait(&reqs[0], &status); MPI_File_iread_at(fh, 10, &b, 1, MPI_INT, &reqs[1]); MPI_Wait(&reqs[1], &status);

int a = 4, b; ~~MPI_File_open( MPI_COMM_WORLD,~~ ==MPI_File_open(MPI_COMM_WORLD,== "myfile", MPI_MODE_RDWR, MPI_INFO_NULL, ~~&fh ); MPI_File_set_view( fh,~~ ==&fh); MPI_File_set_view(fh,== 0, MPI_INT, MPI_INT, "native", ~~MPI_INFO_NULL );~~ ==MPI_INFO_NULL);== MPI_File_write_at(fh, 10, &a, 1, MPI_INT, &status ); MPI_File_read_at(fh, 10, &b, 1, MPI_INT, &status );

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

~~    int a = 4, b, TRUE=1;     MPI_File_open(MPI_COMM_WORLD, "myfile",                    MPI_MODE_RDWR, MPI_INFO_NULL, &fh);     MPI_File_set_view(fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     /* MPI_File_set_atomicity(fh, TRUE);   Use this to set atomic mode. */     MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, &reqs[0]);     MPI_File_iread_at(fh,  10, &b, 1, MPI_INT, &reqs[1]);     MPI_Waitall(2, reqs, statuses); ~~

==(code block added)==
``` [MPI]C
int a = 4, b, TRUE=1;
MPI_File_open(MPI_COMM_WORLD, "myfile",
              MPI_MODE_RDWR, MPI_INFO_NULL, &fh);
MPI_File_set_view(fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
/* MPI_File_set_atomicity(fh, TRUE);   Use this to set atomic mode. */
MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, &reqs[0]);
MPI_File_iread_at(fh,  10, &b, 1, MPI_INT, &reqs[1]);
MPI_Waitall(2, reqs, statuses);
```

~~    int a = 4, b;     MPI_File_open(MPI_COMM_WORLD, "myfile",                    MPI_MODE_RDWR, MPI_INFO_NULL, &fh);     MPI_File_set_view(fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     /* MPI_File_set_atomicity(fh, TRUE);   Use this to set atomic mode. */     MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, &reqs[0]);     MPI_File_iread_at(fh,  10, &b, 1, MPI_INT, &reqs[1]);     MPI_Wait(&reqs[0], &status);     MPI_Wait(&reqs[1], &status);~~

==(code block added)==
``` [MPI]C
int a = 4, b;
MPI_File_open(MPI_COMM_WORLD, "myfile",
              MPI_MODE_RDWR, MPI_INFO_NULL, &fh);
MPI_File_set_view(fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
/* MPI_File_set_atomicity(fh, TRUE);   Use this to set atomic mode. */
MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, &reqs[0]);
MPI_File_iread_at(fh,  10, &b, 1, MPI_INT, &reqs[1]);
MPI_Wait(&reqs[0], &status);
MPI_Wait(&reqs[1], &status);
```

~~    int a = 4, b;     MPI_File_open(MPI_COMM_WORLD, "myfile",                    MPI_MODE_RDWR, MPI_INFO_NULL, &fh);     MPI_File_set_view(fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, &reqs[0]);     MPI_Wait(&reqs[0], &status);     MPI_File_iread_at(fh,  10, &b, 1, MPI_INT, &reqs[1]);     MPI_Wait(&reqs[1], &status);~~

==(code block added)==
``` [MPI]C
int a = 4, b;
MPI_File_open(MPI_COMM_WORLD, "myfile",
              MPI_MODE_RDWR, MPI_INFO_NULL, &fh);
MPI_File_set_view(fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
MPI_File_iwrite_at(fh, 10, &a, 1, MPI_INT, &reqs[0]);
MPI_Wait(&reqs[0], &status);
MPI_File_iread_at(fh,  10, &b, 1, MPI_INT, &reqs[1]);
MPI_Wait(&reqs[1], &status);
```

~~    int a = 4, b;     MPI_File_open(MPI_COMM_WORLD, "myfile",                    MPI_MODE_RDWR, MPI_INFO_NULL, &fh);     MPI_File_set_view(fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);     MPI_File_write_at(fh, 10, &a, 1, MPI_INT, &status );     MPI_File_read_at(fh,  10, &b, 1, MPI_INT, &status );~~

==(code block added)==
``` [MPI]C
int a = 4, b;
MPI_File_open(MPI_COMM_WORLD, "myfile",
              MPI_MODE_RDWR, MPI_INFO_NULL, &fh);
MPI_File_set_view(fh, 0, MPI_INT, MPI_INT, "native", MPI_INFO_NULL);
MPI_File_write_at(fh, 10, &a, 1, MPI_INT, &status );
MPI_File_read_at(fh,  10, &b, 1, MPI_INT, &status );
```

~~    MPI_File_iwrite_all(fh,...);     MPI_File_iread_all(fh,...);     MPI_Waitall(...);~~

==(code block added)==
``` [MPI]C
MPI_File_iwrite_all(fh,...);
MPI_File_iread_all(fh,...);
MPI_Waitall(...);
```

~~    MPI_File_write_all_begin(fh,...);     MPI_File_iread(fh,...);     MPI_Wait(fh,...);     MPI_File_write_all_end(fh,...);~~

==(code block added)==
``` [MPI]C
MPI_File_write_all_begin(fh,...);
MPI_File_iread(fh,...);
MPI_Wait(fh,...);
MPI_File_write_all_end(fh,...);
```

~~    MPI_File_write_all_begin(fh,...);     MPI_File_read_all_begin(fh,...);     MPI_File_read_all_end(fh,...);     MPI_File_write_all_end(fh,...);~~

==(code block added)==
``` [MPI]C
MPI_File_write_all_begin(fh,...);
MPI_File_read_all_begin(fh,...);
MPI_File_read_all_end(fh,...);
MPI_File_write_all_end(fh,...);
```

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The following examples all access a ~~preexisting~~ ==pre-existing== file “`myfile`.” Word `10` in myfile initially contains the integer `2`. Each example writes and reads word `10`.

~~(code block removed)~~
``` [MPI]C
MPI_File_write_all_begin(fh,...);
MPI_File_iread(fh,...);
MPI_Wait(fh,...);
MPI_File_write_all_end(fh,...);
```

==(code block added)==
``` [MPI]C
MPI_File_write_all_begin(fh,...);
MPI_File_iread(fh,...);
MPI_Wait(...);
MPI_File_write_all_end(fh,...);
```

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Asynchronous I/O]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Asynchronous I/O]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Asynchronous I/O]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Asynchronous I/O]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Asynchronous I/O]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Asynchronous I/O]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Asynchronous I/O]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Asynchronous I/O]]

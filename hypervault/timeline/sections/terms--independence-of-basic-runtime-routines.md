---
title: "Independence of Basic Runtime Routines"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Independence of Basic Runtime Routines

Chapter **terms** · in [[versions/v13/sections/terms#Independence of Basic Runtime Routines|MPI-1.3]], [[versions/v20/sections/terms#Independence of Basic Runtime Routines|MPI-2.0]], [[versions/v21/sections/terms#Independence of Basic Runtime Routines|MPI-2.1]], [[versions/v22/sections/terms#Independence of Basic Runtime Routines|MPI-2.2]], [[versions/v30/sections/terms#Independence of Basic Runtime Routines|MPI-3.0]], [[versions/v31/sections/terms#Independence of Basic Runtime Routines|MPI-3.1]], [[versions/v40/sections/terms#Independence of Basic Runtime Routines|MPI-4.0]], [[versions/v41/sections/terms#Independence of Basic Runtime Routines|MPI-4.1]], [[versions/v50/sections/terms#Independence of Basic Runtime Routines|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~MPI programs require that library routines that are part of the basic language environment (such as `date` and `write` in Fortran and `printf` and `malloc` in ANSI C) and are executed after `MPI_INIT` and before `MPI_FINALIZE` operate independently and that their *completion* is independent of the action of other processes in an MPI program.~~

~~Note that this in no way prevents the creation of library routines that provide parallel services whose operation is collective. However, the following program is expected to complete in an ANSI C environment regardless of the size of `MPI_COMM_WORLD` (assuming that I/O is available at the executing nodes).~~

~~    int rank;     MPI_Init( argc, argv );     MPI_Comm_rank( MPI_COMM_WORLD, &rank );     if (rank == 0) printf( "Starting program\n" );     MPI_Finalize();~~

~~The corresponding Fortran 77 program is also expected to complete.~~

==MPI programs require that library routines that are part of the==

==basic language environment (such as `write` in Fortran and `printf` and `malloc` in==

==ISO C)==

==and are executed after [[versions/v21/API/MPI_INIT|MPI_INIT]] and before [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] operate independently and that their *completion* is independent of the action of other processes in an MPI program.==

==Note that this in no way prevents the creation of library routines that provide parallel services whose operation is collective. However, the following program is expected to complete in an==

==ISO C==

==environment regardless of the size of MPI_COMM_WORLD (assuming that `printf` is available at the executing nodes).==

==    int rank;     MPI_Init((void *)0, (void *)0);     MPI_Comm_rank(MPI_COMM_WORLD, &rank);     if (rank == 0) printf("Starting program\n");     MPI_Finalize();==

==The corresponding Fortran and C++ programs are also expected to complete.==

~~MPI_Comm_rank( MPI_COMM_WORLD, &rank ); printf( "Output~~ ==MPI_Comm_rank(MPI_COMM_WORLD, &rank); printf("Output== from task rank %d\n", ~~rank );~~ ==rank);==

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

~~basic language environment (such as `write` in Fortran and `printf` and `malloc` in ANSI~~

~~C\) and are executed after [[versions/v21/API/MPI_INIT|MPI_INIT]] and before [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] operate independently and that their *completion* is independent of the action of other processes in an MPI program.~~

~~Note that this in no way prevents the creation of library routines that provide parallel services whose operation is collective. However, the following program is expected to complete in an ANSI C environment regardless of the size of MPI_COMM_WORLD (assuming that `printf` is available at the executing nodes).~~

==basic language environment (such as `write` in Fortran and `printf` and `malloc` in==

==ISO C)==

==and are executed after [[versions/v21/API/MPI_INIT|MPI_INIT]] and before [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] operate independently and that their *completion* is independent of the action of other processes in an MPI program.==

==Note that this in no way prevents the creation of library routines that provide parallel services whose operation is collective. However, the following program is expected to complete in an==

==ISO C==

==environment regardless of the size of MPI_COMM_WORLD (assuming that `printf` is available at the executing nodes).==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

environment regardless of the size of ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== (assuming that `printf` is available at the executing nodes).

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~MPI programs require that library routines that are part of the~~

~~basic language environment (such as `write` in Fortran and `printf` and `malloc` in~~

~~ISO C)~~

~~and are executed after [[versions/v30/API/MPI_INIT|MPI_INIT]] and before [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] operate independently and that their *completion* is independent of the action of other processes in an MPI program.~~

==MPI programs require that library routines that are part of the basic language environment (such as `write` in Fortran and `printf` and `malloc` in==

==ISO C) and are executed after [[versions/v30/API/MPI_INIT|MPI_INIT]] and before [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] operate independently and that their *completion* is independent of the action of other processes in an MPI program.==

~~ISO C~~

~~environment regardless of the size of `MPI_COMM_WORLD` (assuming that `printf` is available at the executing nodes).~~

==ISO C environment regardless of the size of `MPI_COMM_WORLD` (assuming that `printf` is available at the executing nodes).==

The corresponding Fortran ~~and C++~~ programs are also expected to complete.

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~MPI programs require that library routines that are part of the basic language environment (such as `write` in Fortran and `printf` and `malloc` in~~

~~ISO C) and are executed after [[versions/v31/API/MPI_INIT|MPI_INIT]] and before [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] operate independently and that their *completion* is independent of the action of other processes in an MPI program.~~

~~Note that this in no way prevents the creation of library routines that provide parallel services whose operation is collective. However, the following program is expected to complete in an~~

~~ISO C environment regardless of the size of `MPI_COMM_WORLD` (assuming that `printf` is available at the executing nodes).~~

==MPI programs require that library routines that are part of the basic language environment (such as `write` in Fortran and `printf` and `malloc` in ISO C) and are executed after [[versions/v31/API/MPI_INIT|MPI_INIT]] and before [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] operate independently and that their *completion* is independent of the action of other processes in an MPI program.==

==Note that this in no way prevents the creation of library routines that provide parallel services whose operation is collective. However, the following program is expected to complete in an ISO C environment regardless of the size of `MPI_COMM_WORLD` (assuming that `printf` is available at the executing nodes).==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

int ~~rank;~~ ==commworld_rank;== MPI_Init((void *)0, (void *)0); MPI_Comm_rank(MPI_COMM_WORLD, ~~&rank);~~ ==&commworld_rank);== if ~~(rank~~ ==(commworld_rank== == 0) printf("Starting program\n"); MPI_Finalize();

MPI_Comm_rank(MPI_COMM_WORLD, ~~&rank);~~ ==&commworld_rank);== printf("Output from ~~task rank %d\n", rank);~~ ==MPI process where commworld_rank=%d\n", commworld_rank);==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~Note that this in no way prevents the creation of library routines that provide parallel services whose operation is collective. However, the following program is expected to complete in an ISO C environment regardless of the size of `MPI_COMM_WORLD` (assuming that `printf` is available at the executing nodes).~~

~~    int commworld_rank;     MPI_Init((void *)0, (void *)0);     MPI_Comm_rank(MPI_COMM_WORLD, &commworld_rank);     if (commworld_rank == 0) printf("Starting program\n");     MPI_Finalize();~~

==Note that this in no way prevents the creation of library routines that provide parallel services whose operation is collective. However, the following program is expected to complete in an ISO C environment regardless of the size of `MPI_COMM_WORLD` (assuming that `printf` is available at the executing MPI processes).==

==(code block added)==
``` [MPI]C
int commworld_rank;
MPI_Init((void *)0, (void *)0);
MPI_Comm_rank(MPI_COMM_WORLD, &commworld_rank);
if (commworld_rank == 0) printf("Starting program\n");
MPI_Finalize();
```

~~An example of what is *not* required is any particular ordering of the action of these routines when called by several tasks. For example, MPI makes neither requirements nor recommendations for the output from the following program (again assuming that I/O is available at the executing nodes).~~

~~    MPI_Comm_rank(MPI_COMM_WORLD, &commworld_rank);     printf("Output from MPI process where commworld_rank=%d\n", commworld_rank);~~

==An example of what is *not* required is any particular ordering of the action of these routines when called by several MPI processes. For example, MPI makes neither requirements nor recommendations for the output from the following program (again assuming that I/O is available at the executing MPI processes).==

==(code block added)==
``` [MPI]C
MPI_Comm_rank(MPI_COMM_WORLD, &commworld_rank);
printf("Output from MPI process where commworld_rank=%d\n",
       commworld_rank);
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Independence of Basic Runtime Routines]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Independence of Basic Runtime Routines]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Independence of Basic Runtime Routines]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Independence of Basic Runtime Routines]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Independence of Basic Runtime Routines]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Independence of Basic Runtime Routines]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Independence of Basic Runtime Routines]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Independence of Basic Runtime Routines]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Independence of Basic Runtime Routines]]

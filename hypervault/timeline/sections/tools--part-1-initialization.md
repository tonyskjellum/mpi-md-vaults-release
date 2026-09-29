---
title: "Part 1— Initialization:"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/tools]
---

# Part 1— Initialization:

Chapter **tools** · in [[versions/v30/sections/tools#Part 1— Initialization:|MPI-3.0]], [[versions/v31/sections/tools#Part 1— Initialization:|MPI-3.1]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

#include <stdio.h> #include <stdlib.h> #include <string.h> #include <assert.h> #include <mpi.h>

int MPI_Init(int *argc, char ***argv ) { int err, num, i, index, namelen, verbosity; int var_class, bind, threadsup; int readonly, continuous, atomic, count; char name[18]; MPI_Comm comm; MPI_Datatype datatype; MPI_T_enum enumtype;

err=PMPI_Init(argc,argv); if (err!=MPI_SUCCESS) return err;

err=PMPI_T_init_thread(MPI_THREAD_SINGLE,&threadsup); if (err!=MPI_SUCCESS) return err;

err=PMPI_T_pvar_get_num(&num); if (err!=MPI_SUCCESS) return err; index=-1; i=0; while ((i<num) && (index<0) && (err==MPI_SUCCESS)) { /* Pass a buffer that is at least one character longer than */ /* the name of the variable being searched for to avoid */ /* finding variables that have a name that has a prefix */ /* equal to the name of the variable being searched. */ namelen=18; err=PMPI_T_pvar_get_info(i, name, &namelen, &verbosity, &var_class, &datatype, &enumtype, NULL, NULL, &bind, &readonly, &continuous, &atomic); if (strcmp(name,"MPI_T_UMQ_LENGTH")==0) index=i; i++; } if (err!=MPI_SUCCESS) return err;

/* this could be handled in a more flexible way for a generic tool */ assert(index>=0); assert(var_class==MPI_T_PVAR_CLASS_LEVEL); assert(datatype==MPI_INT); assert(bind==MPI_T_BIND_MPI_COMM);

/* Create a session */ err=PMPI_T_pvar_session_create(&session); if (err!=MPI_SUCCESS) return err;

/* Get a handle and bind to MPI_COMM_WORLD */ comm=MPI_COMM_WORLD; err=PMPI_T_pvar_handle_alloc(session, index, &comm, &handle, &count); if (err!=MPI_SUCCESS) return err;

/* this could be handled in a more flexible way for a generic tool */ assert(count==1);

/* Start variable */ err=PMPI_T_pvar_start(session, handle); if (err!=MPI_SUCCESS) return err;

return MPI_SUCCESS; }

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

During initialization, the tool searches for the variable and, once the right index is found, allocates a ==performance experiment== session and a handle for the variable with the found index, and starts the performance variable.

/* Global variables for the tool */ static MPI_T_pvar_session ~~session;~~ ==pe_session;== static MPI_T_pvar_handle handle;

~~err=PMPI_Init(argc,argv);~~ ==err=PMPI_Init(argc, argv);== if (err!=MPI_SUCCESS) return err;

~~err=PMPI_T_init_thread(MPI_THREAD_SINGLE,&threadsup);~~ ==err=PMPI_T_init_thread(MPI_THREAD_SINGLE, &threadsup);== if (err!=MPI_SUCCESS) return err;

err=PMPI_T_pvar_get_num(&num); if (err!=MPI_SUCCESS) return err; index=-1; i=0; while ((i<num) && (index<0) && (err==MPI_SUCCESS)) { /* Pass a buffer that is at least one character longer than */ /* the name of the variable being searched for to avoid */ /* finding variables that have a name that has a prefix */ /* equal to the name of the variable being searched. */ namelen=18; err=PMPI_T_pvar_get_info(i, name, &namelen, &verbosity, &var_class, &datatype, &enumtype, NULL, NULL, &bind, &readonly, &continuous, &atomic); if (strcmp(name,"MPI_T_UMQ_LENGTH")==0) index=i; i++; } if (err!=MPI_SUCCESS) return err;

/* Create a session */ ~~err=PMPI_T_pvar_session_create(&session);~~ ==err=PMPI_T_pvar_session_create(&pe_session);== if (err!=MPI_SUCCESS) return err;

/* Get a handle and bind to MPI_COMM_WORLD */ comm=MPI_COMM_WORLD; ~~err=PMPI_T_pvar_handle_alloc(session,~~ ==err=PMPI_T_pvar_handle_alloc(pe_session,== index, &comm, &handle, &count); if (err!=MPI_SUCCESS) return err;

/* Start variable */ ~~err=PMPI_T_pvar_start(session,~~ ==err=PMPI_T_pvar_start(pe_session,== handle); if (err!=MPI_SUCCESS) return err;

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Part 1— Initialization:]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Part 1— Initialization:]]

---
title: "C Bindings"
chapter: appLang-Const
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/appLang-Const]
---

# C Bindings

Chapter **appLang-Const** · in [[versions/v30/sections/appLang-Const#C Bindings|MPI-3.0]], [[versions/v31/sections/appLang-Const#C Bindings|MPI-3.1]], [[versions/v40/sections/appLang-Const#C Bindings|MPI-4.0]], [[versions/v41/sections/appLang-Const#C Bindings|MPI-4.1]], [[versions/v50/sections/appLang-Const#C Bindings|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~(code block removed)~~
```
/* prototypes for user-defined functions */
%
typedef void MPI_User_function(void *invec, void *inoutvec, int *len,
              MPI_Datatype *datatype);

%
typedef int MPI_Comm_copy_attr_function(MPI_Comm oldcomm,
              int comm_keyval, void *extra_state, void *attribute_val_in,
              void *attribute_val_out, int *flag);
%
typedef int MPI_Comm_delete_attr_function(MPI_Comm comm, 
              int comm_keyval, void *attribute_val, void *extra_state);

%
typedef int MPI_Win_copy_attr_function(MPI_Win oldwin, int win_keyval,
              void *extra_state, void *attribute_val_in,
              void *attribute_val_out, int *flag);
%
typedef int MPI_Win_delete_attr_function(MPI_Win win, int win_keyval,
              void *attribute_val, void *extra_state);

%
typedef int MPI_Type_copy_attr_function(MPI_Datatype oldtype,
              int type_keyval, void *extra_state,
              void *attribute_val_in, void *attribute_val_out, int *flag);
%
typedef int MPI_Type_delete_attr_function(MPI_Datatype datatype,
              int type_keyval, void *attribute_val, void *extra_state); 

%
typedef void MPI_Comm_errhandler_function(MPI_Comm *, int *, ...);
%
typedef void MPI_Win_errhandler_function(MPI_Win *, int *, ...);
%
typedef void MPI_File_errhandler_function(MPI_File *, int *, ...);

%
typedef int MPI_Grequest_query_function(void *extra_state, 
            MPI_Status *status);
%
typedef int MPI_Grequest_free_function(void *extra_state);
%
typedef int MPI_Grequest_cancel_function(void *extra_state, int complete); 

%
typedef int MPI_Datarep_extent_function(MPI_Datatype datatype, 
            MPI_Aint *file_extent, void *extra_state);
%
typedef int MPI_Datarep_conversion_function(void *userbuf, 
            MPI_Datatype datatype, int count, void *filebuf, 
            MPI_Offset position, void *extra_state);
```

==    /* prototypes for user-defined functions */==

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/appLang-Const#C Bindings]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/appLang-Const#C Bindings]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/appLang-Const#C Bindings]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/appLang-Const#C Bindings]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/appLang-Const#C Bindings]]

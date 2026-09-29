---
title: "Deprecated Prototype Definitions"
chapter: appLang-Const
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/appLang-Const]
---

# Deprecated Prototype Definitions

Chapter **appLang-Const** · in [[versions/v21/sections/appLang-Const#Deprecated prototype definitions|MPI-2.1]], [[versions/v22/sections/appLang-Const#Deprecated prototype definitions|MPI-2.2]], [[versions/v30/sections/appLang-Const#Deprecated Prototype Definitions|MPI-3.0]], [[versions/v31/sections/appLang-Const#Deprecated Prototype Definitions|MPI-3.1]], [[versions/v40/sections/appLang-Const#Deprecated Prototype Definitions|MPI-4.0]], [[versions/v41/sections/appLang-Const#Deprecated Prototype Definitions|MPI-4.1]], [[versions/v50/sections/appLang-Const#Deprecated Prototype Definitions|MPI-5.0]]

Heading by release: MPI-2.1: “Deprecated prototype definitions”; MPI-2.2: “Deprecated prototype definitions”; MPI-3.0: “Deprecated Prototype Definitions”; MPI-3.1: “Deprecated Prototype Definitions”; MPI-4.0: “Deprecated Prototype Definitions”; MPI-4.1: “Deprecated Prototype Definitions”; MPI-5.0: “Deprecated Prototype Definitions”

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

~~    /* prototypes for user-defined functions */     typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,                   void *extra_state, void *attribute_val_in,                   void *attribute_val_out, int *flag);     typedef int MPI_Delete_function(MPI_Comm comm, int keyval,                   void *attribute_val, void *extra_state);     typedef void MPI_Handler_function(MPI_Comm *, int *, ...);~~

==(code block added)==
```
/* prototypes for user-defined functions */
%
typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,
              void *extra_state, void *attribute_val_in,
              void *attribute_val_out, int *flag);
%
typedef int MPI_Delete_function(MPI_Comm comm, int keyval,
              void *attribute_val, void *extra_state);
%
typedef void MPI_Handler_function(MPI_Comm *, int *, ...);
```

SUBROUTINE HANDLER_FUNCTION(COMM, ~~ERROR_CODE, .....)~~ ==ERROR_CODE)== INTEGER COMM, ERROR_CODE

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~(code block removed)~~
```
/* prototypes for user-defined functions */
%
typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,
              void *extra_state, void *attribute_val_in,
              void *attribute_val_out, int *flag);
%
typedef int MPI_Delete_function(MPI_Comm comm, int keyval,
              void *attribute_val, void *extra_state);
%
typedef void MPI_Handler_function(MPI_Comm *, int *, ...);
```

==(code block added)==
```
/* prototypes for user-defined functions */
%
typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,
              void *extra_state, void *attribute_val_in,
              void *attribute_val_out, int *flag);
%
typedef int MPI_Delete_function(MPI_Comm comm, int keyval,
              void *attribute_val, void *extra_state);
```

~~The~~

~~deprecated copy and delete function arguments~~

~~to `MPI_KEYVAL_CREATE` should be declared like these:~~

==The deprecated copy and delete function arguments to `MPI_KEYVAL_CREATE` should be declared like these:==

~~The~~

~~deprecated~~

~~handler-function for error handlers should be declared like this:~~

~~    SUBROUTINE HANDLER_FUNCTION(COMM, ERROR_CODE)        INTEGER COMM, ERROR_CODE~~

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The deprecated copy and delete function arguments to ~~`MPI_KEYVAL_CREATE`~~ ==[[versions/v31/API/MPI_KEYVAL_CREATE|MPI_KEYVAL_CREATE]]== should be declared like these:

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~(code block removed)~~
```
/* prototypes for user-defined functions */
%
typedef int MPI_Copy_function(MPI_Comm oldcomm, int keyval,
              void *extra_state, void *attribute_val_in,
              void *attribute_val_out, int *flag);
%
typedef int MPI_Delete_function(MPI_Comm comm, int keyval,
              void *attribute_val, void *extra_state);
```

==    /* prototypes for user-defined functions */==

~~    SUBROUTINE COPY_FUNCTION(OLDCOMM, KEYVAL, EXTRA_STATE,                    ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERR)        INTEGER OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN,              ATTRIBUTE_VAL_OUT, IERR        LOGICAL FLAG~~

~~    SUBROUTINE DELETE_FUNCTION(COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERR)         INTEGER COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERR~~

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/appLang-Const#Deprecated prototype definitions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/appLang-Const#Deprecated prototype definitions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/appLang-Const#Deprecated Prototype Definitions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/appLang-Const#Deprecated Prototype Definitions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/appLang-Const#Deprecated Prototype Definitions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/appLang-Const#Deprecated Prototype Definitions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/appLang-Const#Deprecated Prototype Definitions]]

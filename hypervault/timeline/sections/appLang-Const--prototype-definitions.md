---
title: "Prototype Definitions"
chapter: appLang-Const
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/appLang-Const]
---

# Prototype Definitions

Chapter **appLang-Const** · in [[versions/v21/sections/appLang-Const#Prototype definitions|MPI-2.1]], [[versions/v22/sections/appLang-Const#Prototype definitions|MPI-2.2]], [[versions/v30/sections/appLang-Const#Prototype Definitions|MPI-3.0]], [[versions/v31/sections/appLang-Const#Prototype Definitions|MPI-3.1]], [[versions/v40/sections/appLang-Const#Prototype Definitions|MPI-4.0]], [[versions/v41/sections/appLang-Const#Prototype Definitions|MPI-4.1]], [[versions/v50/sections/appLang-Const#Prototype Definitions|MPI-5.0]]

Heading by release: MPI-2.1: “Prototype definitions”; MPI-2.2: “Prototype definitions”; MPI-3.0: “Prototype Definitions”; MPI-3.1: “Prototype Definitions”; MPI-4.0: “Prototype Definitions”; MPI-4.1: “Prototype Definitions”; MPI-5.0: “Prototype Definitions”

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (9 changed paragraphs)

~~    /* prototypes for user-defined functions */     typedef void MPI_User_function(void *invec, void *inoutvec, int *len,                   MPI_Datatype *datatype);~~

~~    typedef int MPI_Comm_copy_attr_function(MPI_Comm oldcomm,                   int comm_keyval, void *extra_state, void *attribute_val_in,                   void *attribute_val_out, int*flag);     typedef int MPI_Comm_delete_attr_function(MPI_Comm comm,                    int comm_keyval, void *attribute_val, void *extra_state);~~

~~    typedef int MPI_Win_copy_attr_function(MPI_Win oldwin, int win_keyval,                   void *extra_state, void *attribute_val_in,                   void *attribute_val_out, int *flag);     typedef int MPI_Win_delete_attr_function(MPI_Win win, int win_keyval,                   void *attribute_val, void *extra_state);~~

~~    typedef int MPI_Type_copy_attr_function(MPI_Datatype oldtype,                   int type_keyval, void *extra_state,                   void *attribute_val_in, void *attribute_val_out, int *flag);     typedef int MPI_Type_delete_attr_function(MPI_Datatype type,                   int type_keyval, void *attribute_val, void *extra_state); ~~

~~    typedef void MPI_Comm_errhandler_fn(MPI_Comm *, int *, ...);     typedef void MPI_Win_errhandler_fn(MPI_Win *, int *, ...);     typedef void MPI_File_errhandler_fn(MPI_File *, int *, ...);~~

~~    typedef int MPI_Grequest_query_function(void *extra_state,                  MPI_Status *status);     typedef int MPI_Grequest_free_function(void *extra_state);     typedef int MPI_Grequest_cancel_function(void *extra_state, int complete); ~~

~~    typedef int MPI_Datarep_extent_function(MPI_Datatype datatype,                  MPI_Aint *file_extent, void *extra_state);     typedef int MPI_Datarep_conversion_function(void *userbuf,                  MPI_Datatype datatype, int count, void *filebuf,                  MPI_Offset position, void *extra_state);~~

==(code block added)==
```
/* prototypes for user-defined functions */
%
typedef void MPI_User_function(void *invec, void *inoutvec, int *len,
              MPI_Datatype *datatype);

%
typedef int MPI_Comm_copy_attr_function(MPI_Comm oldcomm,
              int comm_keyval, void *extra_state, void *attribute_val_in,
              void *attribute_val_out, int*flag);
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
typedef int MPI_Type_delete_attr_function(MPI_Datatype type,
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

The copy and delete function arguments to ~~`MPI_COMM_KEYVAL_CREATE`~~ ==`MPI_COMM_CREATE_KEYVAL`== should be declared like these:

The copy and delete function arguments to ~~`MPI_WIN_KEYVAL_CREATE`~~ ==`MPI_WIN_CREATE_KEYVAL`== should be declared like these:

The copy and delete function arguments to ~~`MPI_TYPE_KEYVAL_CREATE`~~ ==`MPI_TYPE_CREATE_KEYVAL`== should be declared like these:

SUBROUTINE ~~COMM_ERRHANDLER_FN(COMM, ERROR_CODE, ...)~~ ==COMM_ERRHANDLER_FUNCTION(COMM, ERROR_CODE)== INTEGER COMM, ERROR_CODE

SUBROUTINE ~~WIN_ERRHANDLER_FN(WIN, ERROR_CODE, ...)~~ ==WIN_ERRHANDLER_FUNCTION(WIN, ERROR_CODE)== INTEGER WIN, ERROR_CODE

SUBROUTINE ~~FILE_ERRHANDLER_FN(FILE, ERROR_CODE, ...)~~ ==FILE_ERRHANDLER_FUNCTION(FILE, ERROR_CODE)== INTEGER FILE, ERROR_CODE

typedef int Datatype::Copy_attr_function(const Datatype& oldtype, int type_keyval, void* extra_state, const void* attribute_val_in, void* attribute_val_out, bool& flag); typedef int Datatype::Delete_attr_function(Datatype& type, int type_keyval, void* attribute_val, void* extra_state);

typedef void ~~Comm::Errhandler_fn(Comm~~ ==Comm::Errhandler_function(Comm== &, int *, ...); typedef void ~~Win::Errhandler_fn(Win~~ ==Win::Errhandler_function(Win== &, int *, ...); typedef void ~~File::Errhandler_fn(File~~ ==File::Errhandler_function(File== &, int *, ...);

typedef void Datarep_extent_function(const Datatype& datatype, Aint& file_extent, void* extra_state); typedef void Datarep_conversion_function(void* userbuf, Datatype& datatype, int count, void* filebuf, Offset position, void* extra_state); }

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The following are defined C typedefs for user-defined functions, also included in the file `mpi.h`.~~

~~(code block removed)~~
```
/* prototypes for user-defined functions */
%
typedef void MPI_User_function(void *invec, void *inoutvec, int *len,
              MPI_Datatype *datatype);

%
typedef int MPI_Comm_copy_attr_function(MPI_Comm oldcomm,
              int comm_keyval, void *extra_state, void *attribute_val_in,
              void *attribute_val_out, int*flag);
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
typedef int MPI_Type_delete_attr_function(MPI_Datatype type,
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

~~For Fortran, here are examples of how each of the user-defined subroutines should be declared.~~

~~The user-function argument to `MPI_OP_CREATE` should be declared like this:~~

~~    SUBROUTINE USER_FUNCTION(INVEC, INOUTVEC, LEN, TYPE)        <type> INVEC(LEN), INOUTVEC(LEN)        INTEGER LEN, TYPE~~

~~The copy and delete function arguments to `MPI_COMM_CREATE_KEYVAL` should be declared like these:~~

~~    SUBROUTINE COMM_COPY_ATTR_FN(OLDCOMM, COMM_KEYVAL, EXTRA_STATE,                  ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)        INTEGER OLDCOMM, COMM_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,                  ATTRIBUTE_VAL_OUT        LOGICAL FLAG~~

~~    SUBROUTINE COMM_DELETE_ATTR_FN(COMM, COMM_KEYVAL, ATTRIBUTE_VAL,                  EXTRA_STATE, IERROR)        INTEGER COMM, COMM_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE~~

~~The copy and delete function arguments to `MPI_WIN_CREATE_KEYVAL` should be declared like these:~~

~~    SUBROUTINE WIN_COPY_ATTR_FN(OLDWIN, WIN_KEYVAL, EXTRA_STATE,                  ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)        INTEGER OLDWIN, WIN_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,                  ATTRIBUTE_VAL_OUT        LOGICAL FLAG~~

~~    SUBROUTINE WIN_DELETE_ATTR_FN(WIN, WIN_KEYVAL, ATTRIBUTE_VAL,                  EXTRA_STATE, IERROR)        INTEGER WIN, WIN_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE~~

~~The copy and delete function arguments to `MPI_TYPE_CREATE_KEYVAL` should be declared like these:~~

~~    SUBROUTINE TYPE_COPY_ATTR_FN(OLDTYPE, TYPE_KEYVAL, EXTRA_STATE,                   ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)        INTEGER OLDTYPE, TYPE_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE,                   ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT        LOGICAL FLAG~~

~~    SUBROUTINE TYPE_DELETE_ATTR_FN(TYPE, TYPE_KEYVAL, ATTRIBUTE_VAL,                   EXTRA_STATE, IERROR)        INTEGER TYPE, TYPE_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE~~

~~The handler-function argument to `MPI_COMM_CREATE_ERRHANDLER` should be declared like this:~~

~~    SUBROUTINE COMM_ERRHANDLER_FUNCTION(COMM, ERROR_CODE)        INTEGER COMM, ERROR_CODE~~

~~The handler-function argument to `MPI_WIN_CREATE_ERRHANDLER` should be declared like this:~~

~~    SUBROUTINE WIN_ERRHANDLER_FUNCTION(WIN, ERROR_CODE)         INTEGER WIN, ERROR_CODE~~

~~The handler-function argument to `MPI_FILE_CREATE_ERRHANDLER` should be declared like this:~~

~~    SUBROUTINE FILE_ERRHANDLER_FUNCTION(FILE, ERROR_CODE)        INTEGER FILE, ERROR_CODE~~

~~The query, free, and cancel function arguments to `MPI_GREQUEST_START` should be declared like these:~~

~~    SUBROUTINE GREQUEST_QUERY_FUNCTION(EXTRA_STATE, STATUS, IERROR)        INTEGER STATUS(MPI_STATUS_SIZE), IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE~~

~~    SUBROUTINE GREQUEST_FREE_FUNCTION(EXTRA_STATE, IERROR)        INTEGER IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE~~

~~    SUBROUTINE GREQUEST_CANCEL_FUNCTION(EXTRA_STATE, COMPLETE, IERROR)        INTEGER IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE        LOGICAL COMPLETE~~

~~The extend and conversion function arguments to `MPI_REGISTER_DATAREP` should be declared like these:~~

~~    SUBROUTINE DATAREP_EXTENT_FUNCTION(DATATYPE, EXTENT, EXTRA_STATE, IERROR)         INTEGER DATATYPE, IERROR          INTEGER(KIND=MPI_ADDRESS_KIND) EXTENT, EXTRA_STATE~~

~~    SUBROUTINE DATAREP_CONVERSION_FUNCTION(USERBUF, DATATYPE, COUNT, FILEBUF,                   POSITION, EXTRA_STATE, IERROR)         <TYPE> USERBUF(*), FILEBUF(*)          INTEGER COUNT, DATATYPE, IERROR          INTEGER(KIND=MPI_OFFSET_KIND) POSITION          INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE~~

~~The following are defined C++ typedefs, also included in the file `mpi.h`.~~

~~    namespace MPI {       typedef void User_function(const void* invec, void *inoutvec,                    int len, const Datatype& datatype);~~

~~      typedef int Comm::Copy_attr_function(const Comm& oldcomm,                   int comm_keyval, void* extra_state, void* attribute_val_in,                   void* attribute_val_out, bool& flag);       typedef int Comm::Delete_attr_function(Comm& comm, int                   comm_keyval, void* attribute_val, void* extra_state);~~

~~      typedef int Win::Copy_attr_function(const Win& oldwin,                   int win_keyval, void* extra_state, void* attribute_val_in,                   void* attribute_val_out, bool& flag);       typedef int Win::Delete_attr_function(Win& win, int                   win_keyval, void* attribute_val, void* extra_state); ~~

~~      typedef int Datatype::Copy_attr_function(const Datatype& oldtype,                   int type_keyval, void* extra_state,                    const void* attribute_val_in, void* attribute_val_out,                    bool& flag);       typedef int Datatype::Delete_attr_function(Datatype& type,                   int type_keyval, void* attribute_val, void* extra_state);~~

~~      typedef void Comm::Errhandler_function(Comm &, int *, ...);       typedef void Win::Errhandler_function(Win &, int *, ...);       typedef void File::Errhandler_function(File &, int *, ...);~~

~~      typedef int Grequest::Query_function(void* extra_state, Status& status);        typedef int Grequest::Free_function(void* extra_state);       typedef int Grequest::Cancel_function(void* extra_state, bool complete);~~

~~      typedef void Datarep_extent_function(const Datatype& datatype,                     Aint& file_extent, void* extra_state);       typedef void Datarep_conversion_function(void* userbuf,                     Datatype& datatype, int count, void* filebuf,                     Offset position, void* extra_state);     }~~

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/appLang-Const#Prototype definitions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/appLang-Const#Prototype definitions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/appLang-Const#Prototype Definitions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/appLang-Const#Prototype Definitions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/appLang-Const#Prototype Definitions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/appLang-Const#Prototype Definitions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/appLang-Const#Prototype Definitions]]

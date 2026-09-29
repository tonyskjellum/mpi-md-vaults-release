---
title: "Fortran Bindings with `mpif.h` or the `mpi` Module"
chapter: appLang-Const
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/appLang-Const]
---

# Fortran Bindings with `mpif.h` or the `mpi` Module

Chapter **appLang-Const** · in [[versions/v30/sections/appLang-Const#Fortran Bindings with mpif.h or the mpi Module|MPI-3.0]], [[versions/v31/sections/appLang-Const#Fortran Bindings with mpif.h or the mpi Module|MPI-3.1]], [[versions/v40/sections/appLang-Const#Fortran Bindings with `mpif.h` or the `mpi` Module|MPI-4.0]], [[versions/v41/sections/appLang-Const#Fortran Bindings with `mpif.h` or the `mpi` Module|MPI-4.1]], [[versions/v50/sections/appLang-Const#Fortran Bindings with `mpif.h` or the `mpi` Module|MPI-5.0]]

Heading by release: MPI-3.0: “Fortran Bindings with mpif.h or the mpi Module”; MPI-3.1: “Fortran Bindings with mpif.h or the mpi Module”; MPI-4.0: “Fortran Bindings with `mpif.h` or the `mpi` Module”; MPI-4.1: “Fortran Bindings with `mpif.h` or the `mpi` Module”; MPI-5.0: “Fortran Bindings with `mpif.h` or the `mpi` Module”

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (9 changed paragraphs)

The user-function argument to ~~`MPI_OP_CREATE`~~ ==[[versions/v31/API/MPI_OP_CREATE|MPI_OP_CREATE]]== should be declared like this:

The copy and delete function arguments to ~~`MPI_COMM_CREATE_KEYVAL`~~ ==[[versions/v31/API/MPI_COMM_CREATE_KEYVAL|MPI_COMM_CREATE_KEYVAL]]== should be declared like these:

The copy and delete function arguments to ~~`MPI_WIN_CREATE_KEYVAL`~~ ==[[versions/v31/API/MPI_WIN_CREATE_KEYVAL|MPI_WIN_CREATE_KEYVAL]]== should be declared like these:

The copy and delete function arguments to ~~`MPI_TYPE_CREATE_KEYVAL`~~ ==[[versions/v31/API/MPI_TYPE_CREATE_KEYVAL|MPI_TYPE_CREATE_KEYVAL]]== should be declared like these:

The handler-function argument to ~~`MPI_COMM_CREATE_ERRHANDLER`~~ ==[[versions/v31/API/MPI_COMM_CREATE_ERRHANDLER|MPI_COMM_CREATE_ERRHANDLER]]== should be declared like this:

The handler-function argument to ~~`MPI_WIN_CREATE_ERRHANDLER`~~ ==[[versions/v31/API/MPI_WIN_CREATE_ERRHANDLER|MPI_WIN_CREATE_ERRHANDLER]]== should be declared like this:

The handler-function argument to ~~`MPI_FILE_CREATE_ERRHANDLER`~~ ==[[versions/v31/API/MPI_FILE_CREATE_ERRHANDLER|MPI_FILE_CREATE_ERRHANDLER]]== should be declared like this:

The query, free, and cancel function arguments to ~~`MPI_GREQUEST_START`~~ ==[[versions/v31/API/MPI_GREQUEST_START|MPI_GREQUEST_START]]== should be declared like these:

The extent and conversion function arguments to ~~`MPI_REGISTER_DATAREP`~~ ==[[versions/v31/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]]== should be declared like these:

### MPI-3.1 → MPI-4.0  (9 changed paragraphs)

~~    SUBROUTINE USER_FUNCTION(INVEC, INOUTVEC, LEN, DATATYPE)        <type> INVEC(LEN), INOUTVEC(LEN)        INTEGER LEN, DATATYPE~~

~~    SUBROUTINE COMM_COPY_ATTR_FUNCTION(OLDCOMM, COMM_KEYVAL, EXTRA_STATE,                  ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)        INTEGER OLDCOMM, COMM_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,                  ATTRIBUTE_VAL_OUT        LOGICAL FLAG~~

~~    SUBROUTINE COMM_DELETE_ATTR_FUNCTION(COMM, COMM_KEYVAL, ATTRIBUTE_VAL,                  EXTRA_STATE, IERROR)        INTEGER COMM, COMM_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE~~

~~    SUBROUTINE WIN_COPY_ATTR_FUNCTION(OLDWIN, WIN_KEYVAL, EXTRA_STATE,                  ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)        INTEGER OLDWIN, WIN_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,                  ATTRIBUTE_VAL_OUT        LOGICAL FLAG~~

~~    SUBROUTINE WIN_DELETE_ATTR_FUNCTION(WIN, WIN_KEYVAL, ATTRIBUTE_VAL,                  EXTRA_STATE, IERROR)        INTEGER WIN, WIN_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE~~

~~    SUBROUTINE TYPE_COPY_ATTR_FUNCTION(OLDTYPE, TYPE_KEYVAL, EXTRA_STATE,                   ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)        INTEGER OLDTYPE, TYPE_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE,                   ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT        LOGICAL FLAG~~

~~    SUBROUTINE TYPE_DELETE_ATTR_FUNCTION(DATATYPE, TYPE_KEYVAL, ATTRIBUTE_VAL,                   EXTRA_STATE, IERROR)        INTEGER DATATYPE, TYPE_KEYVAL, IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE~~

~~    SUBROUTINE COMM_ERRHANDLER_FUNCTION(COMM, ERROR_CODE)        INTEGER COMM, ERROR_CODE~~

~~    SUBROUTINE WIN_ERRHANDLER_FUNCTION(WIN, ERROR_CODE)         INTEGER WIN, ERROR_CODE~~

~~SUBROUTINE FILE_ERRHANDLER_FUNCTION(FILE, ERROR_CODE) INTEGER FILE, ERROR_CODE~~ ==The handler-function argument to [[versions/v40/API/MPI_SESSION_CREATE_ERRHANDLER|MPI_SESSION_CREATE_ERRHANDLER]] should be declared like this:==

~~    SUBROUTINE GREQUEST_QUERY_FUNCTION(EXTRA_STATE, STATUS, IERROR)        INTEGER STATUS(MPI_STATUS_SIZE), IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE~~

~~    SUBROUTINE GREQUEST_FREE_FUNCTION(EXTRA_STATE, IERROR)        INTEGER IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE~~

~~    SUBROUTINE GREQUEST_CANCEL_FUNCTION(EXTRA_STATE, COMPLETE, IERROR)        INTEGER IERROR        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE        LOGICAL COMPLETE~~

~~    SUBROUTINE DATAREP_EXTENT_FUNCTION(DATATYPE, EXTENT, EXTRA_STATE, IERROR)         INTEGER DATATYPE, IERROR          INTEGER(KIND=MPI_ADDRESS_KIND) EXTENT, EXTRA_STATE~~

~~    SUBROUTINE DATAREP_CONVERSION_FUNCTION(USERBUF, DATATYPE, COUNT, FILEBUF,                   POSITION, EXTRA_STATE, IERROR)         <TYPE> USERBUF(*), FILEBUF(*)          INTEGER COUNT, DATATYPE, IERROR          INTEGER(KIND=MPI_OFFSET_KIND) POSITION          INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE~~

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

With the Fortran `mpi` module or ==(deprecated)== `mpif.h`, here are examples of how each of the user-defined subroutines should be declared.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/appLang-Const#Fortran Bindings with mpif.h or the mpi Module]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/appLang-Const#Fortran Bindings with mpif.h or the mpi Module]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/appLang-Const#Fortran Bindings with `mpif.h` or the `mpi` Module]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/appLang-Const#Fortran Bindings with `mpif.h` or the `mpi` Module]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/appLang-Const#Fortran Bindings with `mpif.h` or the `mpi` Module]]

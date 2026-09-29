# Language Binding



## Introduction

In this section we summarize the specific bindings for both Fortran and C. We present first the C bindings, then the Fortran bindings. Listings are alphabetical within chapter.

## Defined Constants for C and Fortran

These are required defined constants, to be defined in the files `mpi.h` (for C) and `mpif.h` (for Fortran).

    /* return codes (both C and Fortran) */
    MPI_SUCCESS
    MPI_ERR_BUFFER
    MPI_ERR_COUNT
    MPI_ERR_TYPE
    MPI_ERR_TAG
    MPI_ERR_COMM
    MPI_ERR_RANK
    MPI_ERR_REQUEST
    MPI_ERR_ROOT
    MPI_ERR_GROUP
    MPI_ERR_OP
    MPI_ERR_TOPOLOGY
    MPI_ERR_DIMS
    MPI_ERR_ARG
    MPI_ERR_UNKNOWN
    MPI_ERR_TRUNCATE
    MPI_ERR_OTHER
    MPI_ERR_INTERN
    MPI_ERR_PENDING
    MPI_ERR_IN_STATUS
    MPI_ERR_LASTCODE

    /* assorted constants (both C and Fortran) */
    MPI_BOTTOM
    MPI_PROC_NULL
    MPI_ANY_SOURCE
    MPI_ANY_TAG
    MPI_UNDEFINED
    MPI_BSEND_OVERHEAD
    MPI_KEYVAL_INVALID

    /* status size and reserved index values (Fortran) */
    MPI_STATUS_SIZE
    MPI_SOURCE
    MPI_TAG
    MPI_ERROR

    /* Error-handling specifiers (C and Fortran) */
    MPI_ERRORS_ARE_FATAL
    MPI_ERRORS_RETURN

    /* Maximum sizes for strings */
    MPI_MAX_PROCESSOR_NAME
    MPI_MAX_ERROR_STRING

    /* elementary datatypes (C) */
    MPI_CHAR
    MPI_SHORT
    MPI_INT
    MPI_LONG
    MPI_UNSIGNED_CHAR
    MPI_UNSIGNED_SHORT
    MPI_UNSIGNED
    MPI_UNSIGNED_LONG
    MPI_FLOAT
    MPI_DOUBLE
    MPI_LONG_DOUBLE
    MPI_BYTE
    MPI_PACKED

    /* elementary datatypes (Fortran) */
    MPI_INTEGER
    MPI_REAL
    MPI_DOUBLE_PRECISION
    MPI_COMPLEX
    MPI_LOGICAL
    MPI_CHARACTER
    MPI_BYTE
    MPI_PACKED

    /* datatypes for reduction functions (C) */
    MPI_FLOAT_INT
    MPI_DOUBLE_INT
    MPI_LONG_INT
    MPI_2INT
    MPI_SHORT_INT
    MPI_LONG_DOUBLE_INT

    /* datatypes for reduction functions (Fortran) */
    MPI_2REAL
    MPI_2DOUBLE_PRECISION
    MPI_2INTEGER

    /* optional datatypes (Fortran) */
    MPI_DOUBLE_COMPLEX
    MPI_INTEGER1
    MPI_INTEGER2
    MPI_INTEGER4
    MPI_REAL2
    MPI_REAL4
    MPI_REAL8
    etc.

    /* optional datatypes (C) */
    MPI_LONG_LONG_INT
    etc.

    /* special datatypes for constructing derived datatypes
    MPI_UB
    MPI_LB

    /* reserved communicators (C and Fortran) */
    MPI_COMM_WORLD
    MPI_COMM_SELF

    /* results of communicator and group comparisons */

    MPI_IDENT
    MPI_CONGRUENT
    MPI_SIMILAR
    MPI_UNEQUAL

    /* environmental inquiry keys (C and Fortran) */
    MPI_TAG_UB
    MPI_IO
    MPI_HOST
    MPI_WTIME_IS_GLOBAL

    /* collective operations (C and Fortran) */
    MPI_MAX
    MPI_MIN
    MPI_SUM
    MPI_PROD
    MPI_MAXLOC
    MPI_MINLOC
    MPI_BAND
    MPI_BOR
    MPI_BXOR
    MPI_LAND
    MPI_LOR
    MPI_LXOR

    /* Null handles */
    MPI_GROUP_NULL
    MPI_COMM_NULL
    MPI_DATATYPE_NULL
    MPI_REQUEST_NULL
    MPI_OP_NULL
    MPI_ERRHANDLER_NULL

    /* Empty group */
    MPI_GROUP_EMPTY

    /* topologies (C and Fortran) */
    MPI_GRAPH
    MPI_CART

    /* Predefined functions in C and Fortran */
    MPI_NULL_COPY_FN
    MPI_NULL_DELETE_FN
    MPI_DUP_FN

The following are defined C type definitions, also included in the file `mpi.h`.

    /* opaque types (C) */
    MPI_Aint
    MPI_Status

    /* handles to assorted structures (C) */
    MPI_Group
    MPI_Comm
    MPI_Datatype
    MPI_Request
    MPI_Op
    MPI_Errhandler

    /* prototypes for user-defined functions (C) */
    typedef int  MPI_Copy_function(MPI_Comm oldcomm, int keyval,
                        void *extra_state, void *attribute_val_in,
                        void *attribute_val_out, int *flag);
    typedef int  MPI_Delete_function(MPI_Comm comm, int keyval,
                              void *attribute_val, void *extra_state)
    typedef void MPI_Handler_function(MPI_Comm *, int *, ...);
    typedef void MPI_User_function( void *invec, void *inoutvec, int *len,
                          MPI_Datatype *datatype);

For Fortran, here are examples of how each of the user-defined functions should be declared.

The user-function argument to `MPI_OP_CREATE` should be declared like this:

    SUBROUTINE USER_FUNCTION( INVEC, INOUTVEC, LEN, TYPE)
     <type> INVEC(LEN), INOUTVEC(LEN)
     INTEGER LEN, TYPE

The copy-function argument to `MPI_KEYVAL_CREATE` should be declared like this:

    SUBROUTINE COPY_FUNCTION(OLDCOMM, KEYVAL, EXTRA_STATE,
                   ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERR)
     INTEGER OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN,
             ATTRIBUTE_VAL_OUT, IERR
     LOGICAL FLAG

The delete-function argument to `MPI_KEYVAL_CREATE` should be declared like this:

    SUBROUTINE DELETE_FUNCTION(COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERR)
     INTEGER COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERR

The handler-function for error handlers should be declared like this:

    SUBROUTINE HANDLER_FUNCTION(COMM, ERROR_CODE, .....)
     INTEGER COMM, ERROR_CODE

## C bindings for Point-to-Point Communication

These are presented here in the order of their appearance in the chapter.

## C Bindings for Collective Communication

## C Bindings for Groups, Contexts, and Communicators

## C Bindings for Process Topologies

## C bindings for Environmental Inquiry

## C Bindings for Profiling

## Fortran Bindings for Point-to-Point Communication

## Fortran Bindings for Collective Communication

## Fortran Bindings for Groups, Contexts, etc.

## Fortran Bindings for Process Topologies

## Fortran Bindings for Environmental Inquiry

## Fortran Bindings for Profiling

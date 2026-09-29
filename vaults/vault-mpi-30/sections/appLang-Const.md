# Language Bindings Summary



In this section we summarize the specific bindings for C and Fortran. First we present the constants, type definitions, info values and keys. Then we present the routine prototypes separately for each binding. Listings are alphabetical within chapter.

## Defined Values and Handles



### Defined Constants



The C and Fortran names are listed below. Constants with the type `const int` may also be implemented as literal integer constants substituted by the preprocessor.

l **Error classes**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_SUCCESS`\
`MPI_ERR_BUFFER`\
`MPI_ERR_COUNT`\
`MPI_ERR_TYPE`\
`MPI_ERR_TAG`\
`MPI_ERR_COMM`\
`MPI_ERR_RANK`\
`MPI_ERR_REQUEST`\
`MPI_ERR_ROOT`\
`MPI_ERR_GROUP`\
`MPI_ERR_OP`\
`MPI_ERR_TOPOLOGY`\
`MPI_ERR_DIMS`\
`MPI_ERR_ARG`\
`MPI_ERR_UNKNOWN`\
`MPI_ERR_TRUNCATE`\
`MPI_ERR_OTHER`\
`MPI_ERR_INTERN`\
`MPI_ERR_PENDING`\
**(Continued on next page)**

l **Error classes (continued)**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_ERR_IN_STATUS`\
`MPI_ERR_ACCESS`\
`MPI_ERR_AMODE`\
`MPI_ERR_ASSERT`\
`MPI_ERR_BAD_FILE`\
`MPI_ERR_BASE`\
`MPI_ERR_CONVERSION`\
`MPI_ERR_DISP`\
`MPI_ERR_DUP_DATAREP`\
`MPI_ERR_FILE_EXISTS`\
`MPI_ERR_FILE_IN_USE`\
`MPI_ERR_FILE`\
`MPI_ERR_INFO_KEY`\
`MPI_ERR_INFO_NOKEY`\
`MPI_ERR_INFO_VALUE`\
`MPI_ERR_INFO`\
`MPI_ERR_IO`\
`MPI_ERR_KEYVAL`\
`MPI_ERR_LOCKTYPE`\
`MPI_ERR_NAME`\
`MPI_ERR_NO_MEM`\
`MPI_ERR_NOT_SAME`\
`MPI_ERR_NO_SPACE`\
`MPI_ERR_NO_SUCH_FILE`\
`MPI_ERR_PORT`\
`MPI_ERR_QUOTA`\
`MPI_ERR_READ_ONLY`\
`MPI_ERR_RMA_ATTACH`\
`MPI_ERR_RMA_CONFLICT`\
`MPI_ERR_RMA_RANGE`\
`MPI_ERR_RMA_SHARED`\
`MPI_ERR_RMA_SYNC`\
`MPI_ERR_RMA_FLAVOR`\
`MPI_ERR_SERVICE`\
`MPI_ERR_SIZE`\
`MPI_ERR_SPAWN`\
`MPI_ERR_UNSUPPORTED_DATAREP`\
`MPI_ERR_UNSUPPORTED_OPERATION`\
`MPI_ERR_WIN`\
**(Continued on next page)**

l **Error classes (continued)**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_T_ERR_CANNOT_INIT`\
`MPI_T_ERR_NOT_INITIALIZED`\
`MPI_T_ERR_MEMORY`\
`MPI_T_ERR_INVALID_INDEX`\
`MPI_T_ERR_INVALID_ITEM`\
`MPI_T_ERR_INVALID_SESSION`\
`MPI_T_ERR_INVALID_HANDLE`\
`MPI_T_ERR_OUT_OF_HANDLES`\
`MPI_T_ERR_OUT_OF_SESSIONS`\
`MPI_T_ERR_CVAR_SET_NOT_NOW`\
`MPI_T_ERR_CVAR_SET_NEVER`\
`MPI_T_ERR_PVAR_NO_WRITE`\
`MPI_T_ERR_PVAR_NO_STARTSTOP`\
`MPI_T_ERR_PVAR_NO_ATOMIC`\
`MPI_ERR_LASTCODE`\

l **Buffer Address Constants**   C type: `void * const`\
Fortran type: (predefined memory location)$`^1`$\
`MPI_BOTTOM`\
`MPI_IN_PLACE`\
   

l **Assorted Constants**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_PROC_NULL`\
`MPI_ANY_SOURCE`\
`MPI_ANY_TAG`\
`MPI_UNDEFINED`\
`MPI_BSEND_OVERHEAD`\
`MPI_KEYVAL_INVALID`\
`MPI_LOCK_EXCLUSIVE`\
`MPI_LOCK_SHARED`\
`MPI_ROOT`\

l **No Process Message Handle**\
C type: `MPI_Message` \
Fortran type: `INTEGER` or `TYPE(MPI_Message)`\
`MPI_MESSAGE_NO_PROC`\

l **Fortran Support Method Specific Constants**   Fortran type: `LOGICAL`\
`MPI_SUBARRAYS_SUPPORTED` (Fortran only)\
`MPI_ASYNC_PROTECTS_NONBLOCKING` (Fortran only)\

l **Status size and reserved index values (Fortran only)**   Fortran type: `INTEGER`\
`MPI_STATUS_SIZE`\
`MPI_SOURCE`\
`MPI_TAG`\
`MPI_ERROR`\

l **Variable Address Size (Fortran only)**   Fortran type: `INTEGER`\
`MPI_ADDRESS_KIND`\
`MPI_COUNT_KIND`\
`MPI_INTEGER_KIND`\
`MPI_OFFSET_KIND`\

l **Error-handling specifiers**\
C type: `MPI_Errhandler` \
Fortran type: `INTEGER` or `TYPE(MPI_Errhandler)`\
`MPI_ERRORS_ARE_FATAL`\
`MPI_ERRORS_RETURN`\

l **Maximum Sizes for Strings**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_MAX_DATAREP_STRING`\
`MPI_MAX_ERROR_STRING`\
`MPI_MAX_INFO_KEY`\
`MPI_MAX_INFO_VAL`\
`MPI_MAX_LIBRARY_VERSION_STRING`\
`MPI_MAX_OBJECT_NAME`\
`MPI_MAX_PORT_NAME`\
`MPI_MAX_PROCESSOR_NAME`\

l\|l **Named Predefined Datatypes** & C types\
C type: `MPI_Datatype` &\
Fortran type: `INTEGER` &\
or `TYPE(MPI_Datatype)` &\
`MPI_CHAR` & `char`\
& (treated as printable character)\
`MPI_SHORT` & `signed short int`\
`MPI_INT` & `signed int`\
`MPI_LONG` & `signed long`\
`MPI_LONG_LONG_INT` & `signed long long`\
`MPI_LONG_LONG` (as a synonym) & `signed long long`\
`MPI_SIGNED_CHAR` & `signed char`\
& (treated as integral value)\
`MPI_UNSIGNED_CHAR` & `unsigned char`\
& (treated as integral value)\
`MPI_UNSIGNED_SHORT` & `unsigned short`\
`MPI_UNSIGNED` & `unsigned int`\
`MPI_UNSIGNED_LONG` & `unsigned long`\
`MPI_UNSIGNED_LONG_LONG` & `unsigned long long`\
`MPI_FLOAT` & `float`\
`MPI_DOUBLE` & `double`\
`MPI_LONG_DOUBLE` & `long double`\
`MPI_WCHAR` & `wchar_t`\
& (defined in `<stddef.h>`)\
& (treated as printable character)\
`MPI_C_BOOL` & `_Bool`\
`MPI_INT8_T` & `int8_t`\
`MPI_INT16_T` & `int16_t`\
`MPI_INT32_T` & `int32_t`\
`MPI_INT64_T` & `int64_t`\
`MPI_UINT8_T` & `uint8_t`\
`MPI_UINT16_T` & `uint16_t`\
`MPI_UINT32_T` & `uint32_t`\
`MPI_UINT64_T` & `uint64_t`\
`MPI_AINT` & `MPI_Aint`\
`MPI_COUNT` & `MPI_Count`\
`MPI_OFFSET` & `MPI_Offset`\
`MPI_C_COMPLEX` & `float _Complex`\
`MPI_C_FLOAT_COMPLEX` & `float _Complex`\
`MPI_C_DOUBLE_COMPLEX` & `double _Complex`\
`MPI_C_LONG_DOUBLE_COMPLEX` & `long double _Complex`\
`MPI_BYTE` & (any C type)  `MPI_PACKED` & (any C type)  

l\|l **Named Predefined Datatypes** & Fortran types\
C type: `MPI_Datatype` &\
Fortran type: `INTEGER` &\
or `TYPE(MPI_Datatype)` &\
`MPI_INTEGER` & `INTEGER`\
`MPI_REAL` & `REAL`\
`MPI_DOUBLE_PRECISION` & `DOUBLE PRECISION`\
`MPI_COMPLEX` & `COMPLEX`  `MPI_LOGICAL` & `LOGICAL`\
`MPI_CHARACTER` & `CHARACTER(1)`\
`MPI_AINT` & `INTEGER (KIND=MPI_ADDRESS_KIND)`\
`MPI_COUNT` & `INTEGER (KIND=MPI_COUNT_KIND)`\
`MPI_OFFSET` & `INTEGER (KIND=MPI_OFFSET_KIND)`\
`MPI_BYTE` & (any Fortran type)  `MPI_PACKED` & (any Fortran type)  

<table>
<thead>
<tr>
<th style="text-align: left;">Named Predefined Datatypes<sup>1</sup></th>
<th style="text-align: left;">C++ types</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><span> C type: <code>MPI_Datatype</code> </span></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><span> Fortran type: <code>INTEGER</code></span></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><span> or <code>TYPE(MPI_Datatype)</code></span></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CXX_BOOL</code></td>
<td style="text-align: left;"><code>bool</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CXX_FLOAT_COMPLEX</code></td>
<td style="text-align: left;"><code>std::complex&lt;float&gt;</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CXX_DOUBLE_COMPLEX</code></td>
<td style="text-align: left;"><code>std::complex&lt;double&gt;</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_CXX_LONG_DOUBLE_COMPLEX</code></td>
<td style="text-align: left;"><code>std::complex&lt;long double&gt;</code></td>
</tr>
<tr>
<td colspan="2" style="text-align: left;"><sup>1</sup> If an accompanying C++ compiler is missing, then the</td>
</tr>
</tbody>
</table>

l\|l **Optional datatypes (Fortran)** & Fortran types\
C type: `MPI_Datatype` &\
Fortran type: `INTEGER` &\
or `TYPE(MPI_Datatype)` &\
`MPI_DOUBLE_COMPLEX` & `DOUBLE COMPLEX`\
`MPI_INTEGER1` & `INTEGER*1`\
`MPI_INTEGER2` & `INTEGER*2`\
`MPI_INTEGER4` & `INTEGER*4`\
`MPI_INTEGER8` & `INTEGER*8`\
`MPI_INTEGER16` & `INTEGER*16`\
`MPI_REAL2` & `REAL*2`\
`MPI_REAL4` & `REAL*4`\
`MPI_REAL8` & `REAL*8`\
`MPI_REAL16` & `REAL*16`\
`MPI_COMPLEX4` & `COMPLEX*4`\
`MPI_COMPLEX8` & `COMPLEX*8`\
`MPI_COMPLEX16` & `COMPLEX*16`\
`MPI_COMPLEX32` & `COMPLEX*32`\

l **Datatypes for reduction functions (C)**\
C type: `MPI_Datatype` \
Fortran type: `INTEGER` or `TYPE(MPI_Datatype)`\
`MPI_FLOAT_INT`\
`MPI_DOUBLE_INT`\
`MPI_LONG_INT`\
`MPI_2INT`  `MPI_SHORT_INT`\
`MPI_LONG_DOUBLE_INT`\

l **Datatypes for reduction functions (Fortran)**\
C type: `MPI_Datatype` \
Fortran type: `INTEGER` or `TYPE(MPI_Datatype)`\
`MPI_2REAL`  `MPI_2DOUBLE_PRECISION`  `MPI_2INTEGER`  

l **Reserved communicators**\
C type: `MPI_Comm` \
Fortran type: `INTEGER` or `TYPE(MPI_Comm)`\
`MPI_COMM_WORLD`\
`MPI_COMM_SELF`\

l **Communicator split type constants**\
C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_COMM_TYPE_SHARED`\

l **Results of communicator and group comparisons**\
C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_IDENT`\
`MPI_CONGRUENT`\
`MPI_SIMILAR`\
`MPI_UNEQUAL`\

l **Environmental inquiry info key**\
C type: `MPI_Info` \
Fortran type: `INTEGER` or `TYPE(MPI_Info)`\
`MPI_INFO_ENV`\

l **Environmental inquiry keys**\
C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_TAG_UB`\
`MPI_IO`\
`MPI_HOST`\
`MPI_WTIME_IS_GLOBAL`\

l **Collective Operations**   C type: `MPI_Op` \
Fortran type: `INTEGER` or `TYPE(MPI_Op)`\
`MPI_MAX`\
`MPI_MIN`\
`MPI_SUM`\
`MPI_PROD`\
`MPI_MAXLOC`\
`MPI_MINLOC`\
`MPI_BAND`\
`MPI_BOR`\
`MPI_BXOR`\
`MPI_LAND`\
`MPI_LOR`\
`MPI_LXOR`\
`MPI_REPLACE`\
`MPI_NO_OP`\

l **Null Handles**   C/Fortran name\
C type / Fortran type   `MPI_GROUP_NULL`   or `TYPE(MPI_Group)`\
`MPI_COMM_NULL`   or `TYPE(MPI_Comm)`\
`MPI_DATATYPE_NULL`   or `TYPE(MPI_Datatype)`\
`MPI_REQUEST_NULL`   or `TYPE(MPI_Request)`\
`MPI_OP_NULL`   or `TYPE(MPI_Op)`\
`MPI_ERRHANDLER_NULL`   or `TYPE(MPI_Errhandler)`\
`MPI_FILE_NULL`\
or `TYPE(MPI_File)`\
`MPI_INFO_NULL`\
or `TYPE(MPI_Info)`\
`MPI_WIN_NULL`\
or `TYPE(MPI_Win)`\
`MPI_MESSAGE_NULL`\
or `TYPE(MPI_Message)`\

l **Empty group**\
C type: `MPI_Group` \
Fortran type: `INTEGER` or `TYPE(MPI_Group)`\
`MPI_GROUP_EMPTY`\

l **Topologies**\
C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_GRAPH`\
`MPI_CART`\
`MPI_DIST_GRAPH`\



l **Predefined functions**\
C/Fortran name\
C type\
/ Fortran type with `mpi_f08` module   [[MPI_COMM_NULL_COPY_FN]]\
\
\
[[MPI_COMM_DUP_FN]]\
\
\
[[MPI_COMM_NULL_DELETE_FN]]\
\
\
[[MPI_WIN_NULL_COPY_FN]]\
\
\
[[MPI_WIN_DUP_FN]]\
\
\
[[MPI_WIN_NULL_DELETE_FN]]\
\
\
[[MPI_TYPE_NULL_COPY_FN]]\
\
\
[[MPI_TYPE_DUP_FN]]\
\
\
[[MPI_TYPE_NULL_DELETE_FN]]\
\
\
[[MPI_CONVERSION_FN_NULL]]\
\
\
 \

l **Deprecated predefined functions**\
C/Fortran name\
  [[MPI_NULL_COPY_FN]]\
\
[[MPI_DUP_FN]]\
\
[[MPI_NULL_DELETE_FN]]\
\

l **Predefined Attribute Keys**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_APPNUM`\
`MPI_LASTUSEDCODE`\
`MPI_UNIVERSE_SIZE`\
`MPI_WIN_BASE`\
`MPI_WIN_DISP_UNIT`\
`MPI_WIN_SIZE`\
`MPI_WIN_CREATE_FLAVOR`\
`MPI_WIN_MODEL`\

l **MPI Window Create Flavors**\
C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_WIN_FLAVOR_CREATE`\
`MPI_WIN_FLAVOR_ALLOCATE`\
`MPI_WIN_FLAVOR_DYNAMIC`\
`MPI_WIN_FLAVOR_SHARED`\

l **MPI Window Models**\
C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_WIN_SEPARATE`\
`MPI_WIN_UNIFIED`\

l **Mode Constants**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_MODE_APPEND`\
`MPI_MODE_CREATE`\
`MPI_MODE_DELETE_ON_CLOSE`\
`MPI_MODE_EXCL`\
`MPI_MODE_NOCHECK`\
`MPI_MODE_NOPRECEDE`\
`MPI_MODE_NOPUT`\
`MPI_MODE_NOSTORE`\
`MPI_MODE_NOSUCCEED`\
`MPI_MODE_RDONLY`\
`MPI_MODE_RDWR`\
`MPI_MODE_SEQUENTIAL`\
`MPI_MODE_UNIQUE_OPEN`\
`MPI_MODE_WRONLY`\

l **Datatype Decoding Constants**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_COMBINER_CONTIGUOUS`\
`MPI_COMBINER_DARRAY`\
`MPI_COMBINER_DUP`\
`MPI_COMBINER_F90_COMPLEX`\
`MPI_COMBINER_F90_INTEGER`\
`MPI_COMBINER_F90_REAL`\
`MPI_COMBINER_HINDEXED`\
`MPI_COMBINER_HVECTOR`\
`MPI_COMBINER_INDEXED_BLOCK`\
`MPI_COMBINER_HINDEXED_BLOCK`\
`MPI_COMBINER_INDEXED`\
`MPI_COMBINER_NAMED`\
`MPI_COMBINER_RESIZED`\
`MPI_COMBINER_STRUCT`\
`MPI_COMBINER_SUBARRAY`\
`MPI_COMBINER_VECTOR`\

l **Threads Constants**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_THREAD_FUNNELED`\
`MPI_THREAD_MULTIPLE`\
`MPI_THREAD_SERIALIZED`\
`MPI_THREAD_SINGLE`\

l **File Operation Constants, Part 1**   C type: `const MPI_Offset` (or unnamed `enum`)\
Fortran type: `INTEGER (KIND=MPI_OFFSET_KIND)`\
`MPI_DISPLACEMENT_CURRENT`\

l **File Operation Constants, Part 2**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_DISTRIBUTE_BLOCK`\
`MPI_DISTRIBUTE_CYCLIC`\
`MPI_DISTRIBUTE_DFLT_DARG`\
`MPI_DISTRIBUTE_NONE`\
`MPI_ORDER_C`\
`MPI_ORDER_FORTRAN`\
`MPI_SEEK_CUR`\
`MPI_SEEK_END`\
`MPI_SEEK_SET`\

l **F90 Datatype Matching Constants**   C type: `const int` (or unnamed `enum`)\
Fortran type: `INTEGER`\
`MPI_TYPECLASS_COMPLEX`\
`MPI_TYPECLASS_INTEGER`\
`MPI_TYPECLASS_REAL`\

l **Constants Specifying Empty or Ignored Input**   C/Fortran name\
C type / Fortran type$`^1`$   `MPI_ARGVS_NULL`\
\
`MPI_ARGV_NULL`\
\
`MPI_ERRCODES_IGNORE`\
array\
`MPI_STATUSES_IGNORE`\
\
\
`MPI_STATUS_IGNORE`\
\
\
`MPI_UNWEIGHTED`\
array\
`MPI_WEIGHTS_EMPTY`\
array\
   

ll **C Constants Specifying Ignored Input (no Fortran)**   C type: `MPI_Fint*` & equivalent to Fortran\
`MPI_F_STATUSES_IGNORE` & `MPI_STATUSES_IGNORE` in `mpi` / `mpif.h`\
`MPI_F_STATUS_IGNORE` & `MPI_STATUS_IGNORE` in `mpi` / `mpif.h`\
C type: `MPI_F08_status*` & equivalent to Fortran\
`MPI_F08_STATUSES_IGNORE` & `MPI_STATUSES_IGNORE` in `mpi_f08`\
`MPI_F08_STATUS_IGNORE` & `MPI_STATUS_IGNORE` in `mpi_f08`\

|  |
|:---|
| **C preprocessor Constants and Fortran Parameters**    C type: C-preprocessor macro that expands to an `int` value |
|  Fortran type: `INTEGER` |
| `MPI_SUBVERSION` |
| `MPI_VERSION` |

|  |
|:---|
| **Null handles used in the MPI tool information interface**   `MPI_T_ENUM_NULL` |
|  |
| `MPI_T_CVAR_HANDLE_NULL` |
|  |
| `MPI_T_PVAR_HANDLE_NULL` |
|  |
| `MPI_T_PVAR_SESSION_NULL` |
|  |

|  |
|:---|
| **Verbosity Levels in the MPI tool information interface**    C type: `const int` (or unnamed `enum`) |
|  Fortran type: `INTEGER` |
| `MPI_T_VERBOSITY_USER_BASIC` |
| `MPI_T_VERBOSITY_USER_DETAIL` |
| `MPI_T_VERBOSITY_USER_ALL` |
| `MPI_T_VERBOSITY_TUNER_BASIC` |
| `MPI_T_VERBOSITY_TUNER_DETAIL` |
| `MPI_T_VERBOSITY_TUNER_ALL` |
| `MPI_T_VERBOSITY_MPIDEV_BASIC` |
| `MPI_T_VERBOSITY_MPIDEV_DETAIL` |
| `MPI_T_VERBOSITY_MPIDEV_ALL` |

|  |
|:---|
| **Constants to identify associations of variables** |
| **in the MPI tool information interface**    C type: `const int` (or unnamed `enum`) |
|  Fortran type: `INTEGER` |
| `MPI_T_BIND_NO_OBJECT` |
| `MPI_T_BIND_MPI_COMM` |
| `MPI_T_BIND_MPI_DATATYPE` |
| `MPI_T_BIND_MPI_ERRHANDLER` |
| `MPI_T_BIND_MPI_FILE` |
| `MPI_T_BIND_MPI_GROUP` |
| `MPI_T_BIND_MPI_OP` |
| `MPI_T_BIND_MPI_REQUEST` |
| `MPI_T_BIND_MPI_WIN` |
| `MPI_T_BIND_MPI_MESSAGE` |
| `MPI_T_BIND_MPI_INFO` |

|  |
|:---|
| **Constants describing the scope of a control variable** |
| **in the MPI tool information interface**    C type: `const int` (or unnamed `enum`) |
|  Fortran type: `INTEGER` |
| `MPI_T_SCOPE_CONSTANT` |
| `MPI_T_SCOPE_READONLY` |
| `MPI_T_SCOPE_LOCAL` |
| `MPI_T_SCOPE_GROUP` |
| `MPI_T_SCOPE_GROUP_EQ` |
| `MPI_T_SCOPE_ALL` |
| `MPI_T_SCOPE_ALL_EQ` |

|  |
|:---|
| **Additional constants used** |
| **by the MPI tool information interface**    C type: `MPI_T_pvar_handle` |
| `MPI_T_PVAR_ALL_HANDLES` |

|  |
|:---|
| **Performance variables classes used by the** |
| **MPI tool information interface**    C type: `const int` (or unnamed `enum`) |
|  Fortran type: `INTEGER` |
| `MPI_T_PVAR_CLASS_STATE` |
| `MPI_T_PVAR_CLASS_LEVEL` |
| `MPI_T_PVAR_CLASS_SIZE` |
| `MPI_T_PVAR_CLASS_PERCENTAGE` |
| `MPI_T_PVAR_CLASS_HIGHWATERMARK` |
| `MPI_T_PVAR_CLASS_LOWWATERMARK` |
| `MPI_T_PVAR_CLASS_COUNTER` |
| `MPI_T_PVAR_CLASS_AGGREGATE` |
| `MPI_T_PVAR_CLASS_TIMER` |
| `MPI_T_PVAR_CLASS_GENERIC` |

### Types

 The following are defined C type definitions, included in the file `mpi.h`.\
`/* C opaque types */`\
`MPI_Aint`\
`MPI_Count`\
`MPI_Fint`\
`MPI_Offset`\
`MPI_Status`\
`MPI_F08_status`\
\
`/* C handles to assorted structures */`\
`MPI_Comm`\
`MPI_Datatype`\
`MPI_Errhandler`\
`MPI_File`\
`MPI_Group`\
`MPI_Info`\
`MPI_Message`\
`MPI_Op`\
`MPI_Request`\
`MPI_Win`\
\
`/* Types for the MPI_T interface */`\
`MPI_T_enum`\
`MPI_T_cvar_handle`\
`MPI_T_pvar_handle`\
`MPI_T_pvar_session`\
\
The following are defined Fortran type definitions, included in the `mpi_f08` and `mpi` modules.\
`! Fortran opaque types in the mpi_f08 and mpi modules`\
`TYPE(MPI_Status)`\
\
`! Fortran handles in the mpi_f08 and mpi modules`\
`TYPE(MPI_Comm)`\
`TYPE(MPI_Datatype)`\
`TYPE(MPI_Errhandler)`\
`TYPE(MPI_File)`\
`TYPE(MPI_Group)`\
`TYPE(MPI_Info)`\
`TYPE(MPI_Op)`\
`TYPE(MPI_Request)`\
`TYPE(MPI_Win)`

### Prototype Definitions



#### C Bindings

The following are defined C typedefs for user-defined functions, also included in the file `mpi.h`.

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

#### Fortran 2008 Bindings with the mpi_f08 Module

The callback prototypes when using the Fortran `mpi_f08` module are shown below:

The user-function argument to `MPI_Op_create` should be declared according to:

The copy and delete function arguments to `MPI_Comm_create_keyval` should be declared according to:

The copy and delete function arguments to `MPI_Win_create_keyval` should be declared according to:

The copy and delete function arguments to `MPI_Type_create_keyval` should be declared according to:

The handler-function argument to `MPI_Comm_create_errhandler` should be declared like this:

The handler-function argument to `MPI_Win_create_errhandler` should be declared like this:

The handler-function argument to `MPI_File_create_errhandler` should be declared like this:

The query, free, and cancel function arguments to `MPI_Grequest_start` should be declared according to:

The extent and conversion function arguments to `MPI_Register_datarep` should be declared according to:

#### Fortran Bindings with mpif.h or the mpi Module

With the Fortran `mpi` module or `mpif.h`, here are examples of how each of the user-defined subroutines should be declared.

The user-function argument to `MPI_OP_CREATE` should be declared like this:

    SUBROUTINE USER_FUNCTION(INVEC, INOUTVEC, LEN, DATATYPE)
       <type> INVEC(LEN), INOUTVEC(LEN)
       INTEGER LEN, DATATYPE

The copy and delete function arguments to `MPI_COMM_CREATE_KEYVAL` should be declared like these:

    SUBROUTINE COMM_COPY_ATTR_FUNCTION(OLDCOMM, COMM_KEYVAL, EXTRA_STATE,
                 ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
       INTEGER OLDCOMM, COMM_KEYVAL, IERROR
       INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,
                 ATTRIBUTE_VAL_OUT
       LOGICAL FLAG

    SUBROUTINE COMM_DELETE_ATTR_FUNCTION(COMM, COMM_KEYVAL, ATTRIBUTE_VAL,
                 EXTRA_STATE, IERROR)
       INTEGER COMM, COMM_KEYVAL, IERROR
       INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE

The copy and delete function arguments to `MPI_WIN_CREATE_KEYVAL` should be declared like these:

    SUBROUTINE WIN_COPY_ATTR_FUNCTION(OLDWIN, WIN_KEYVAL, EXTRA_STATE,
                 ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
       INTEGER OLDWIN, WIN_KEYVAL, IERROR
       INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE, ATTRIBUTE_VAL_IN,
                 ATTRIBUTE_VAL_OUT
       LOGICAL FLAG

    SUBROUTINE WIN_DELETE_ATTR_FUNCTION(WIN, WIN_KEYVAL, ATTRIBUTE_VAL,
                 EXTRA_STATE, IERROR)
       INTEGER WIN, WIN_KEYVAL, IERROR
       INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE

The copy and delete function arguments to `MPI_TYPE_CREATE_KEYVAL` should be declared like these:

    SUBROUTINE TYPE_COPY_ATTR_FUNCTION(OLDTYPE, TYPE_KEYVAL, EXTRA_STATE,
                  ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERROR)
       INTEGER OLDTYPE, TYPE_KEYVAL, IERROR
       INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE,
                  ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT
       LOGICAL FLAG

    SUBROUTINE TYPE_DELETE_ATTR_FUNCTION(DATATYPE, TYPE_KEYVAL, ATTRIBUTE_VAL,
                  EXTRA_STATE, IERROR)
       INTEGER DATATYPE, TYPE_KEYVAL, IERROR
       INTEGER(KIND=MPI_ADDRESS_KIND) ATTRIBUTE_VAL, EXTRA_STATE

The handler-function argument to `MPI_COMM_CREATE_ERRHANDLER` should be declared like this:

    SUBROUTINE COMM_ERRHANDLER_FUNCTION(COMM, ERROR_CODE)
       INTEGER COMM, ERROR_CODE

The handler-function argument to `MPI_WIN_CREATE_ERRHANDLER` should be declared like this:

    SUBROUTINE WIN_ERRHANDLER_FUNCTION(WIN, ERROR_CODE) 
       INTEGER WIN, ERROR_CODE

The handler-function argument to `MPI_FILE_CREATE_ERRHANDLER` should be declared like this:

    SUBROUTINE FILE_ERRHANDLER_FUNCTION(FILE, ERROR_CODE)
       INTEGER FILE, ERROR_CODE

The query, free, and cancel function arguments to `MPI_GREQUEST_START` should be declared like these:

    SUBROUTINE GREQUEST_QUERY_FUNCTION(EXTRA_STATE, STATUS, IERROR)
       INTEGER STATUS(MPI_STATUS_SIZE), IERROR
       INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
     
    SUBROUTINE GREQUEST_FREE_FUNCTION(EXTRA_STATE, IERROR)
       INTEGER IERROR
       INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
     
    SUBROUTINE GREQUEST_CANCEL_FUNCTION(EXTRA_STATE, COMPLETE, IERROR)
       INTEGER IERROR
       INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE
       LOGICAL COMPLETE

The extent and conversion function arguments to `MPI_REGISTER_DATAREP` should be declared like these:

    SUBROUTINE DATAREP_EXTENT_FUNCTION(DATATYPE, EXTENT, EXTRA_STATE, IERROR)
        INTEGER DATATYPE, IERROR 
        INTEGER(KIND=MPI_ADDRESS_KIND) EXTENT, EXTRA_STATE
     
    SUBROUTINE DATAREP_CONVERSION_FUNCTION(USERBUF, DATATYPE, COUNT, FILEBUF, 
                 POSITION, EXTRA_STATE, IERROR)
        <TYPE> USERBUF(*), FILEBUF(*) 
        INTEGER COUNT, DATATYPE, IERROR 
        INTEGER(KIND=MPI_OFFSET_KIND) POSITION 
        INTEGER(KIND=MPI_ADDRESS_KIND) EXTRA_STATE

### Deprecated Prototype Definitions

The following are defined C typedefs for deprecated user-defined functions, also included in the file `mpi.h`.

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

The following are deprecated Fortran user-defined callback subroutine prototypes.

The deprecated copy and delete function arguments to `MPI_KEYVAL_CREATE` should be declared like these:

    SUBROUTINE COPY_FUNCTION(OLDCOMM, KEYVAL, EXTRA_STATE,
                   ATTRIBUTE_VAL_IN, ATTRIBUTE_VAL_OUT, FLAG, IERR)
       INTEGER OLDCOMM, KEYVAL, EXTRA_STATE, ATTRIBUTE_VAL_IN,
             ATTRIBUTE_VAL_OUT, IERR
       LOGICAL FLAG

    SUBROUTINE DELETE_FUNCTION(COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERR)
        INTEGER COMM, KEYVAL, ATTRIBUTE_VAL, EXTRA_STATE, IERR

### Info Keys

The following info keys are reserved. They are strings.\
access_style\
appnum\
arch\
cb_block_size\
cb_buffer_size\
cb_nodes\
chunked_item\
chunked_size\
chunked\
collective_buffering\
file_perm\
filename\
file\
host\
io_node_list\
ip_address\
ip_port\
nb_proc\
no_locks\
num_io_nodes\
path\
soft\
striping_factor\
striping_unit\
wdir\

### Info Values

The following info values are reserved. They are strings.\
false\
random\
read_mostly\
read_once\
reverse_sequential\
sequential\
true\
write_mostly\
write_once\

# Language Bindings Summary



In this section we summarize the specific bindings for C and Fortran. First we present the constants, type definitions, info values and keys. Then we present the routine prototypes separately for each binding. Listings are alphabetical within chapter.

## Defined Values and Handles



### Defined Constants



The C and Fortran names are listed below. Constants described as “integer constant expression” may be implemented as literal integer constants of the specified integer type substituted by the preprocessor or (where possible) as enum members.

|                              |
|:-----------------------------|
| **Error classes**            |
|  Fortran type: `INTEGER`     |
| `MPI_SUCCESS`                |
| `MPI_ERR_BUFFER`             |
| `MPI_ERR_COUNT`              |
| `MPI_ERR_TYPE`               |
| `MPI_ERR_TAG`                |
| `MPI_ERR_COMM`               |
| `MPI_ERR_RANK`               |
| `MPI_ERR_REQUEST`            |
| `MPI_ERR_ROOT`               |
| `MPI_ERR_GROUP`              |
| `MPI_ERR_OP`                 |
| `MPI_ERR_TOPOLOGY`           |
| `MPI_ERR_DIMS`               |
| `MPI_ERR_ARG`                |
| `MPI_ERR_UNKNOWN`            |
| `MPI_ERR_TRUNCATE`           |
| `MPI_ERR_OTHER`              |
| `MPI_ERR_INTERN`             |
| `MPI_ERR_PENDING`            |
| **(Continued on next page)** |

|                                 |
|:--------------------------------|
| **Error classes (continued)**   |
|  Fortran type: `INTEGER`        |
| `MPI_ERR_IN_STATUS`             |
| `MPI_ERR_ACCESS`                |
| `MPI_ERR_AMODE`                 |
| `MPI_ERR_ASSERT`                |
| `MPI_ERR_BAD_FILE`              |
| `MPI_ERR_BASE`                  |
| `MPI_ERR_CONVERSION`            |
| `MPI_ERR_DISP`                  |
| `MPI_ERR_DUP_DATAREP`           |
| `MPI_ERR_ERRHANDLER`            |
| `MPI_ERR_FILE_EXISTS`           |
| `MPI_ERR_FILE_IN_USE`           |
| `MPI_ERR_FILE`                  |
| `MPI_ERR_INFO_KEY`              |
| `MPI_ERR_INFO_NOKEY`            |
| `MPI_ERR_INFO_VALUE`            |
| `MPI_ERR_INFO`                  |
| `MPI_ERR_IO`                    |
| `MPI_ERR_KEYVAL`                |
| `MPI_ERR_LOCKTYPE`              |
| `MPI_ERR_NAME`                  |
| `MPI_ERR_NO_MEM`                |
| `MPI_ERR_NOT_SAME`              |
| `MPI_ERR_NO_SPACE`              |
| `MPI_ERR_NO_SUCH_FILE`          |
| `MPI_ERR_PORT`                  |
| `MPI_ERR_PROC_ABORTED`          |
| `MPI_ERR_QUOTA`                 |
| `MPI_ERR_READ_ONLY`             |
| `MPI_ERR_RMA_ATTACH`            |
| `MPI_ERR_RMA_CONFLICT`          |
| `MPI_ERR_RMA_RANGE`             |
| `MPI_ERR_RMA_SHARED`            |
| `MPI_ERR_RMA_SYNC`              |
| `MPI_ERR_RMA_FLAVOR`            |
| `MPI_ERR_SERVICE`               |
| `MPI_ERR_SESSION`               |
| `MPI_ERR_SIZE`                  |
| `MPI_ERR_SPAWN`                 |
| `MPI_ERR_UNSUPPORTED_DATAREP`   |
| `MPI_ERR_UNSUPPORTED_OPERATION` |
| `MPI_ERR_VALUE_TOO_LARGE`       |
| `MPI_ERR_WIN`                   |
| **(Continued on next page)**    |

|                               |
|:------------------------------|
| **Error classes (continued)** |
|  Fortran type: `INTEGER`      |
| `MPI_T_ERR_CANNOT_INIT`       |
| `MPI_T_ERR_NOT_ACCESSIBLE`    |
| `MPI_T_ERR_NOT_INITIALIZED`   |
| `MPI_T_ERR_NOT_SUPPORTED`     |
| `MPI_T_ERR_MEMORY`            |
| `MPI_T_ERR_INVALID`           |
| `MPI_T_ERR_INVALID_INDEX`     |
| `MPI_T_ERR_INVALID_ITEM`      |
| `MPI_T_ERR_INVALID_SESSION`   |
| `MPI_T_ERR_INVALID_HANDLE`    |
| `MPI_T_ERR_INVALID_NAME`      |
| `MPI_T_ERR_OUT_OF_HANDLES`    |
| `MPI_T_ERR_OUT_OF_SESSIONS`   |
| `MPI_T_ERR_CVAR_SET_NOT_NOW`  |
| `MPI_T_ERR_CVAR_SET_NEVER`    |
| `MPI_T_ERR_PVAR_NO_WRITE`     |
| `MPI_T_ERR_PVAR_NO_STARTSTOP` |
| `MPI_T_ERR_PVAR_NO_ATOMIC`    |
| `MPI_ERR_LASTCODE`            |

|  |
|:---|
| **Buffer Address Constants** |
| Fortran type: (predefined memory location)$`^1`$ |
| `MPI_BOTTOM` |
| `MPI_BUFFER_AUTOMATIC` |
| `MPI_IN_PLACE` |
| $`^1`$ Note that in Fortran these constants are not usable for initialization |

|                                            |
|:-------------------------------------------|
| **Assorted Constants**                     |
|  Fortran type: `INTEGER`                   |
| `MPI_PROC_NULL`                            |
| `MPI_ANY_SOURCE`                           |
| `MPI_ANY_TAG`                              |
| `MPI_UNDEFINED`                            |
| `MPI_BSEND_OVERHEAD`                       |
| `MPI_KEYVAL_INVALID`                       |
| `MPI_LOCK_EXCLUSIVE`                       |
| `MPI_LOCK_SHARED`                          |
| `MPI_ROOT`                                 |
| |

| **No Process Message Handle**                    |
|:-------------------------------------------------|
|  C type: `MPI_Message`                           |
|  Fortran type: `INTEGER` or `TYPE(MPI_Message)`  |
| `MPI_MESSAGE_NO_PROC`                            |

| **Fortran Support Method Specific Constants**   |
|:------------------------------------------------|
| `MPI_SUBARRAYS_SUPPORTED` (Fortran only)        |
| `MPI_ASYNC_PROTECTS_NONBLOCKING` (Fortran only) |

| **Status array size and reserved index values (Fortran only)** |
|:---------------------------------------------------------------|
|  Fortran type: `INTEGER`                                       |
| `MPI_STATUS_SIZE`                                              |
| `MPI_SOURCE`                                                   |
| `MPI_TAG`                                                      |
| `MPI_ERROR`                                                    |



| **Fortran status array size and reserved index values (C only)** |
|:-----------------------------------------------------------------|
|  C type: integer constant expression of type `int`               |
| `MPI_F_STATUS_SIZE`                                              |
| `MPI_F_SOURCE`                                                   |
| `MPI_F_TAG`                                                      |
| `MPI_F_ERROR`                                                    |

| **Variable Address Size (Fortran only)** |
|:-----------------------------------------|
| `MPI_ADDRESS_KIND`                       |
| `MPI_COUNT_KIND`                         |
| `MPI_INTEGER_KIND`                       |
| `MPI_OFFSET_KIND`                        |

| **Error-handling specifiers**                       |
|:----------------------------------------------------|
|  C type: `MPI_Errhandler`                           |
|  Fortran type: `INTEGER` or `TYPE(MPI_Errhandler)`  |
| `MPI_ERRORS_ARE_FATAL`                              |
| `MPI_ERRORS_ABORT`                                  |
| `MPI_ERRORS_RETURN`                                 |

|                                  |
|:---------------------------------|
| **Maximum Sizes for Strings**    |
|  Fortran type: `INTEGER`         |
| `MPI_MAX_DATAREP_STRING`         |
| `MPI_MAX_ERROR_STRING`           |
| `MPI_MAX_INFO_KEY`               |
| `MPI_MAX_INFO_VAL`               |
| `MPI_MAX_LIBRARY_VERSION_STRING` |
| `MPI_MAX_OBJECT_NAME`            |
| `MPI_MAX_PORT_NAME`              |
| `MPI_MAX_PROCESSOR_NAME`         |
| `MPI_MAX_STRINGTAG_LEN`          |
| `MPI_MAX_PSET_NAME_LEN`          |

l\|l & **C types**\
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
`MPI_C_FLOAT_COMPLEX` (as a synonym)& `float _Complex`\
`MPI_C_DOUBLE_COMPLEX` & `double _Complex`\
`MPI_C_LONG_DOUBLE_COMPLEX` & `long double _Complex`\
`MPI_BYTE` & (any C type)  `MPI_PACKED` & (any C type)  

l\|l & **Fortran types**\
C type: `MPI_Datatype` &\
Fortran type: `INTEGER` &\
or `TYPE(MPI_Datatype)` &\
`MPI_INTEGER` & `INTEGER`\
`MPI_REAL` & `REAL`\
`MPI_DOUBLE_PRECISION` & `DOUBLE PRECISION`\
`MPI_COMPLEX` & `COMPLEX`  `MPI_LOGICAL` & `LOGICAL`\
`MPI_CHARACTER` & `CHARACTER(1)`\
`MPI_AINT` & `ADDRESS`\
`MPI_COUNT` & `COUNT`\
`MPI_OFFSET` & `OFFSET`\
`MPI_BYTE` & (any Fortran type)  `MPI_PACKED` & (any Fortran type)  

<table>
<thead>
<tr>
<th style="text-align: left;"><strong>Named Predefined Datatypes</strong><sup>1</sup></th>
<th style="text-align: left;"><strong>C++ types</strong></th>
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

| **Optional datatypes (Fortran)** | **Fortran types** |
|:---------------------------------|:------------------|
|  C type: `MPI_Datatype`          |                   |
|  Fortran type: `INTEGER`         |                   |
|  or `TYPE(MPI_Datatype)`         |                   |
| `MPI_DOUBLE_COMPLEX`             | `DOUBLE COMPLEX`  |
| `MPI_INTEGER1`                   | `INTEGER*1`       |
| `MPI_INTEGER2`                   | `INTEGER*2`       |
| `MPI_INTEGER4`                   | `INTEGER*4`       |
| `MPI_INTEGER8`                   | `INTEGER*8`       |
| `MPI_INTEGER16`                  | `INTEGER*16`      |
| `MPI_REAL2`                      | `REAL*2`          |
| `MPI_REAL4`                      | `REAL*4`          |
| `MPI_REAL8`                      | `REAL*8`          |
| `MPI_REAL16`                     | `REAL*16`         |
| `MPI_COMPLEX4`                   | `COMPLEX*4`       |
| `MPI_COMPLEX8`                   | `COMPLEX*8`       |
| `MPI_COMPLEX16`                  | `COMPLEX*16`      |
| `MPI_COMPLEX32`                  | `COMPLEX*32`      |

| **Datatypes for reduction functions (C)**         |
|:--------------------------------------------------|
|  C type: `MPI_Datatype`                           |
|  Fortran type: `INTEGER` or `TYPE(MPI_Datatype)`  |
| `MPI_FLOAT_INT`                                   |
| `MPI_DOUBLE_INT`                                  |
| `MPI_LONG_INT`                                    |
| `MPI_2INT`  `MPI_SHORT_INT`                       |
| `MPI_LONG_DOUBLE_INT`                             |

| **Datatypes for reduction functions (Fortran)**        |
|:-------------------------------------------------------|
|  C type: `MPI_Datatype`                                |
|  Fortran type: `INTEGER` or `TYPE(MPI_Datatype)`       |
| `MPI_2REAL`  `MPI_2DOUBLE_PRECISION`  `MPI_2INTEGER`   |

| **Reserved communicators**                    |
|:----------------------------------------------|
|  C type: `MPI_Comm`                           |
|  Fortran type: `INTEGER` or `TYPE(MPI_Comm)`  |
| `MPI_COMM_WORLD`                              |
| `MPI_COMM_SELF`                               |

| **Communicator split type constants**              |
|:---------------------------------------------------|
|  C type: integer constant expression of type `int` |
|  Fortran type: `INTEGER`                           |
| `MPI_COMM_TYPE_SHARED`                             |
| `MPI_COMM_TYPE_HW_UNGUIDED`                        |
| `MPI_COMM_TYPE_HW_GUIDED`                          |
| `MPI_COMM_TYPE_RESOURCE_GUIDED`                    |

| **Results of communicator and group comparisons**  |
|:---------------------------------------------------|
|  C type: integer constant expression of type `int` |
|  Fortran type: `INTEGER`                           |
| `MPI_IDENT`                                        |
| `MPI_CONGRUENT`                                    |
| `MPI_SIMILAR`                                      |
| `MPI_UNEQUAL`                                      |

| **Environmental inquiry info key**            |
|:----------------------------------------------|
|  C type: `MPI_Info`                           |
|  Fortran type: `INTEGER` or `TYPE(MPI_Info)`  |
| `MPI_INFO_ENV`                                |

| **Environmental inquiry keys**                     |
|:---------------------------------------------------|
|  C type: integer constant expression of type `int` |
|  Fortran type: `INTEGER`                           |
| `MPI_TAG_UB`                                       |
| `MPI_IO`                                           |
| `MPI_HOST` (deprecated)                            |
| `MPI_WTIME_IS_GLOBAL`                              |

|                                             |
|:--------------------------------------------|
| **Collective Operations**                   |
|  Fortran type: `INTEGER` or `TYPE(MPI_Op)`  |
| `MPI_MAX`                                   |
| `MPI_MIN`                                   |
| `MPI_SUM`                                   |
| `MPI_PROD`                                  |
| `MPI_MAXLOC`                                |
| `MPI_MINLOC`                                |
| `MPI_BAND`                                  |
| `MPI_BOR`                                   |
| `MPI_BXOR`                                  |
| `MPI_LAND`                                  |
| `MPI_LOR`                                   |
| `MPI_LXOR`                                  |
| `MPI_REPLACE`                               |
| `MPI_NO_OP`                                 |

|                                                                  |
|:-----------------------------------------------------------------|
| **Null Handles**                                                 |
| C type / Fortran type   `MPI_GROUP_NULL`   or `TYPE(MPI_Group)`  |
| `MPI_COMM_NULL`   or `TYPE(MPI_Comm)`                            |
| `MPI_DATATYPE_NULL`   or `TYPE(MPI_Datatype)`                    |
| `MPI_REQUEST_NULL`   or `TYPE(MPI_Request)`                      |
| `MPI_OP_NULL`   or `TYPE(MPI_Op)`                                |
| `MPI_ERRHANDLER_NULL`   or `TYPE(MPI_Errhandler)`                |
| `MPI_FILE_NULL`                                                  |
|  or `TYPE(MPI_File)`                                             |
| `MPI_INFO_NULL`                                                  |
|  or `TYPE(MPI_Info)`                                             |
| `MPI_SESSION_NULL`                                               |
|  or `TYPE(MPI_Session)`                                          |
| `MPI_WIN_NULL`                                                   |
|  or `TYPE(MPI_Win)`                                              |
| `MPI_MESSAGE_NULL`                                               |
|  or `TYPE(MPI_Message)`                                          |

| **Empty group**                                |
|:-----------------------------------------------|
|  C type: `MPI_Group`                           |
|  Fortran type: `INTEGER` or `TYPE(MPI_Group)`  |
| `MPI_GROUP_EMPTY`                              |

| **Topologies**                                     |
|:---------------------------------------------------|
|  C type: integer constant expression of type `int` |
|  Fortran type: `INTEGER`                           |
| `MPI_GRAPH`                                        |
| `MPI_CART`                                         |
| `MPI_DIST_GRAPH`                                   |



| **Predefined functions** |
|:---|
| C/Fortran name |
| C type |
|  / Fortran type with `mpi_f08` module   [[MPI_COMM_NULL_COPY_FN]] |
|  |
|  |
| [[MPI_COMM_DUP_FN]] |
|  |
|  |
| [[MPI_COMM_NULL_DELETE_FN]] |
|  |
|  |
| [[MPI_WIN_NULL_COPY_FN]] |
|  |
|  |
| [[MPI_WIN_DUP_FN]] |
|  |
|  |
| [[MPI_WIN_NULL_DELETE_FN]] |
|  |
|  |
| [[MPI_TYPE_NULL_COPY_FN]] |
|  |
|  |
| [[MPI_TYPE_DUP_FN]] |
|  |
|  |
| [[MPI_TYPE_NULL_DELETE_FN]] |
|  |
|  |
| [[MPI_CONVERSION_FN_NULL]] |
|  |
|  |
| [[MPI_CONVERSION_FN_NULL_C]] |
|  |
| / (n/a) |
| $`^1`$ See the advice to implementors (on page [[advice-context-predefined-Fortran-implementors]] ) and advice to users (on page [[advice-context-predefined-Fortran-users]] ) |
| [[context#Communicators|Communicators]] . |

| **Deprecated predefined functions** |
|:------------------------------------|
| C/Fortran name                      |
|   [[MPI_NULL_COPY_FN]]          |
|                                     |
| [[MPI_DUP_FN]]                  |
|                                     |
| [[MPI_NULL_DELETE_FN]]          |
|                                     |

|                               |
|:------------------------------|
| **Predefined Attribute Keys** |
|  Fortran type: `INTEGER`      |
| `MPI_APPNUM`                  |
| `MPI_LASTUSEDCODE`            |
| `MPI_UNIVERSE_SIZE`           |
| `MPI_WIN_BASE`                |
| `MPI_WIN_DISP_UNIT`           |
| `MPI_WIN_SIZE`                |
| `MPI_WIN_CREATE_FLAVOR`       |
| `MPI_WIN_MODEL`               |

| **MPI Window Create Flavors**                      |
|:---------------------------------------------------|
|  C type: integer constant expression of type `int` |
|  Fortran type: `INTEGER`                           |
| `MPI_WIN_FLAVOR_CREATE`                            |
| `MPI_WIN_FLAVOR_ALLOCATE`                          |
| `MPI_WIN_FLAVOR_DYNAMIC`                           |
| `MPI_WIN_FLAVOR_SHARED`                            |

| **MPI Window Models**                              |
|:---------------------------------------------------|
|  C type: integer constant expression of type `int` |
|  Fortran type: `INTEGER`                           |
| `MPI_WIN_SEPARATE`                                 |
| `MPI_WIN_UNIFIED`                                  |

|                            |
|:---------------------------|
| **Mode Constants**         |
|  Fortran type: `INTEGER`   |
| `MPI_MODE_APPEND`          |
| `MPI_MODE_CREATE`          |
| `MPI_MODE_DELETE_ON_CLOSE` |
| `MPI_MODE_EXCL`            |
| `MPI_MODE_NOCHECK`         |
| `MPI_MODE_NOPRECEDE`       |
| `MPI_MODE_NOPUT`           |
| `MPI_MODE_NOSTORE`         |
| `MPI_MODE_NOSUCCEED`       |
| `MPI_MODE_RDONLY`          |
| `MPI_MODE_RDWR`            |
| `MPI_MODE_SEQUENTIAL`      |
| `MPI_MODE_UNIQUE_OPEN`     |
| `MPI_MODE_WRONLY`          |

|                                 |
|:--------------------------------|
| **Datatype Decoding Constants** |
|  Fortran type: `INTEGER`        |
| `MPI_COMBINER_CONTIGUOUS`       |
| `MPI_COMBINER_DARRAY`           |
| `MPI_COMBINER_DUP`              |
| `MPI_COMBINER_F90_COMPLEX`      |
| `MPI_COMBINER_F90_INTEGER`      |
| `MPI_COMBINER_F90_REAL`         |
| `MPI_COMBINER_HINDEXED`         |
| `MPI_COMBINER_HVECTOR`          |
| `MPI_COMBINER_INDEXED_BLOCK`    |
| `MPI_COMBINER_HINDEXED_BLOCK`   |
| `MPI_COMBINER_INDEXED`          |
| `MPI_COMBINER_NAMED`            |
| `MPI_COMBINER_RESIZED`          |
| `MPI_COMBINER_STRUCT`           |
| `MPI_COMBINER_SUBARRAY`         |
| `MPI_COMBINER_VECTOR`           |

|                          |
|:-------------------------|
| **Threads Constants**    |
|  Fortran type: `INTEGER` |
| `MPI_THREAD_FUNNELED`    |
| `MPI_THREAD_MULTIPLE`    |
| `MPI_THREAD_SERIALIZED`  |
| `MPI_THREAD_SINGLE`      |

|                                      |
|:-------------------------------------|
| **File Operation Constants, Part 1** |
|  Fortran type: `OFFSET`              |
| `MPI_DISPLACEMENT_CURRENT`           |

|                                      |
|:-------------------------------------|
| **File Operation Constants, Part 2** |
|  Fortran type: `INTEGER`             |
| `MPI_DISTRIBUTE_BLOCK`               |
| `MPI_DISTRIBUTE_CYCLIC`              |
| `MPI_DISTRIBUTE_DFLT_DARG`           |
| `MPI_DISTRIBUTE_NONE`                |
| `MPI_ORDER_C`                        |
| `MPI_ORDER_FORTRAN`                  |
| `MPI_SEEK_CUR`                       |
| `MPI_SEEK_END`                       |
| `MPI_SEEK_SET`                       |

|                                     |
|:------------------------------------|
| **F90 Datatype Matching Constants** |
|  Fortran type: `INTEGER`            |
| `MPI_TYPECLASS_COMPLEX`             |
| `MPI_TYPECLASS_INTEGER`             |
| `MPI_TYPECLASS_REAL`                |

|  |
|:---|
| **Constants Specifying Empty or Ignored Input** |
| C type / Fortran type$`^1`$   `MPI_ARGVS_NULL` |
|  |
| `MPI_ARGV_NULL` |
|  |
| `MPI_ERRCODES_IGNORE` |
| array |
| `MPI_STATUSES_IGNORE` |
|  |
|  |
| `MPI_STATUS_IGNORE` |
|  |
|  |
| `MPI_UNWEIGHTED` |
| array |
| `MPI_WEIGHTS_EMPTY` |
| array |
| $`^1`$ Note that in Fortran these constants are not usable for initialization |

<table>
<thead>
<tr>
<th colspan="2" style="text-align: center;"><strong>C Constants Specifying Ignored Input (no Fortran)</strong></th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><code>MPI_F_STATUSES_IGNORE</code></td>
<td style="text-align: left;"><code>MPI_STATUSES_IGNORE</code> in <code>mpi</code> / <code>mpif.h</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F_STATUS_IGNORE</code></td>
<td style="text-align: left;"><code>MPI_STATUS_IGNORE</code> in <code>mpi</code> / <code>mpif.h</code></td>
</tr>
<tr>
<td style="text-align: left;">C constant <span> (type: <code>MPI_F08_status*</code>)</span></td>
<td style="text-align: left;">is equivalent to the Fortran constant</td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F08_STATUSES_IGNORE</code></td>
<td style="text-align: left;"><code>MPI_STATUSES_IGNORE</code> in <code>mpi_f08</code></td>
</tr>
<tr>
<td style="text-align: left;"><code>MPI_F08_STATUS_IGNORE</code></td>
<td style="text-align: left;"><code>MPI_STATUS_IGNORE</code> in <code>mpi_f08</code></td>
</tr>
</tbody>
</table>

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

| **Verbosity Levels in the MPI tool information interface**    C type: integer constant expression of type `int` |
|:---|
| `MPI_T_VERBOSITY_USER_BASIC` |
| `MPI_T_VERBOSITY_USER_DETAIL` |
| `MPI_T_VERBOSITY_USER_ALL` |
| `MPI_T_VERBOSITY_TUNER_BASIC` |
| `MPI_T_VERBOSITY_TUNER_DETAIL` |
| `MPI_T_VERBOSITY_TUNER_ALL` |
| `MPI_T_VERBOSITY_MPIDEV_BASIC` |
| `MPI_T_VERBOSITY_MPIDEV_DETAIL` |
| `MPI_T_VERBOSITY_MPIDEV_ALL` |

|                                                     |
|:----------------------------------------------------|
| **Constants to identify associations of variables** |
| **in the MPI tool information interface**           |
|  C type: integer constant expression of type `int`  |
| `MPI_T_BIND_NO_OBJECT`                              |
| `MPI_T_BIND_MPI_COMM`                               |
| `MPI_T_BIND_MPI_DATATYPE`                           |
| `MPI_T_BIND_MPI_ERRHANDLER`                         |
| `MPI_T_BIND_MPI_FILE`                               |
| `MPI_T_BIND_MPI_GROUP`                              |
| `MPI_T_BIND_MPI_OP`                                 |
| `MPI_T_BIND_MPI_REQUEST`                            |
| `MPI_T_BIND_MPI_WIN`                                |
| `MPI_T_BIND_MPI_MESSAGE`                            |
| `MPI_T_BIND_MPI_INFO`                               |
| `MPI_T_BIND_MPI_SESSION`                            |

|  |
|:---|
| **Constants describing the scope of a control variable** |
| **in the MPI tool information interface**    C type: integer constant expression of type `int` |
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
| **MPI tool information interface**    C type: integer constant expression of type `int` |
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

|                                                                    |
|:-------------------------------------------------------------------|
| **Source event ordering guarantees in the**                        |
| **MPI tool information interface**   C type: `MPI_T_source_order`  |
| `MPI_T_SOURCE_ORDERED`                                             |
| `MPI_T_SOURCE_UNORDERED`                                           |

|                                                                 |
|:----------------------------------------------------------------|
| **Callback safety requirement levels used in the**              |
| **MPI tool information interface**   C type: `MPI_T_cb_safety`  |
| `MPI_T_CB_REQUIRE_NONE`                                         |
| `MPI_T_CB_REQUIRE_MPI_RESTRICTED`                               |
| `MPI_T_CB_REQUIRE_THREAD_SAFE`                                  |
| `MPI_T_CB_REQUIRE_ASYNC_SIGNAL_SAFE`                            |

### Types

 The following are defined C type definitions included in the file `mpi.h`.\
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
`MPI_Session`\
`MPI_Win`\
\
`/* Types for the MPI_T interface */`\
`MPI_T_enum`\
`MPI_T_cvar_handle`\
`MPI_T_pvar_handle`\
`MPI_T_pvar_session`\
`MPI_T_event_instance`\
`MPI_T_event_registration`\
`MPI_T_source_order`\
`MPI_T_cb_safety`\
\
The following are defined Fortran type definitions included in the `mpi_f08` and `mpi` modules.\
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
`TYPE(MPI_Message)`\
`TYPE(MPI_Op)`\
`TYPE(MPI_Request)`\
`TYPE(MPI_Session)`\
`TYPE(MPI_Win)`

### Prototype Definitions



#### C Bindings

The following are defined C typedefs for user-defined functions, also included in the file `mpi.h`.

    /* prototypes for user-defined functions */

#### Fortran 2008 Bindings with the `mpi_f08` Module

The callback prototypes when using the Fortran `mpi_f08` module are shown below:

The user-function argument to `MPI_Op_create` and `MPI_Op_create_c` should be declared according to:

The copy and delete function arguments to `MPI_Comm_create_keyval` should be declared according to:

The copy and delete function arguments to `MPI_Win_create_keyval` should be declared according to:

The copy and delete function arguments to `MPI_Type_create_keyval` should be declared according to:

The handler-function argument to `MPI_Comm_create_errhandler` should be declared like this:

The handler-function argument to `MPI_Win_create_errhandler` should be declared like this:

The handler-function argument to `MPI_File_create_errhandler` should be declared like this:

The handler-function argument to `MPI_Session_create_errhandler` should be declared like this:

The query, free, and cancel function arguments to `MPI_Grequest_start` should be declared according to:

The extent and conversion function arguments to `MPI_Register_datarep` and `MPI_Register_datarep_c` should be declared according to:

#### Fortran Bindings with `mpif.h` or the `mpi` Module

With the Fortran `mpi` module or (deprecated) `mpif.h`, here are examples of how each of the user-defined subroutines should be declared.

The user-function argument to [[MPI_OP_CREATE]] should be declared like this:

The copy and delete function arguments to [[MPI_COMM_CREATE_KEYVAL]] should be declared like these:

The copy and delete function arguments to [[MPI_WIN_CREATE_KEYVAL]] should be declared like these:

The copy and delete function arguments to [[MPI_TYPE_CREATE_KEYVAL]] should be declared like these:

The handler-function argument to [[MPI_COMM_CREATE_ERRHANDLER]] should be declared like this:

The handler-function argument to [[MPI_WIN_CREATE_ERRHANDLER]] should be declared like this:

The handler-function argument to [[MPI_FILE_CREATE_ERRHANDLER]] should be declared like this:

The handler-function argument to [[MPI_SESSION_CREATE_ERRHANDLER]] should be declared like this:

The query, free, and cancel function arguments to [[MPI_GREQUEST_START]] should be declared like these:

The extent and conversion function arguments to [[MPI_REGISTER_DATAREP]] should be declared like these:

### Deprecated Prototype Definitions

The following are defined C typedefs for deprecated user-defined functions, also included in the file `mpi.h`.

    /* prototypes for user-defined functions */

The following are deprecated Fortran user-defined callback subroutine prototypes.

The deprecated copy and delete function arguments to [[MPI_KEYVAL_CREATE]] should be declared like these:

### String Values

#### Default Communicator Names

The following default communicator names are defined by MPI.\
`MPI_COMM_WORLD`\
`MPI_COMM_SELF`\
`MPI_COMM_PARENT`\
`MPI_COMM_NULL`

#### Default Datatype Names

Named predefined datatypes have the default names of the datatype name. In addition, the following default datatype name is defined by MPI.\
`MPI_DATATYPE_NULL`

#### Default Window Names

The following default window name is defined by MPI.\
`MPI_WIN_NULL`

#### Reserved Data Representations

The following data representations are supported by MPI.\
`native`\
`internal`\
`external32`

#### Process Set Names

| **Process set name** | **Comment**                |
|:---------------------|:---------------------------|
| `mpi://`             | reserved namespace         |
| `mpi://SELF`         | mandatory process set name |
| `mpi://WORLD`        | mandatory process set name |

#### Info Keys

The following info keys are reserved. They are strings.\
`access_style`\
`accumulate_ops`\
`accumulate_ordering`\
`alloc_shared_noncontig`\
`appnum`\
`arch`\
`argv`\
`cb_block_size`\
`cb_buffer_size`\
`cb_nodes`\
`chunked_item`\
`chunked_size`\
`chunked`\
`collective_buffering`\
`command`\
`file`\
`file_perm`\
`filename`\
`host`\
`io_node_list`\
`ip_address`\
`ip_port`\
`maxprocs`\
`mpi_accumulate_granularity`\
`mpi_assert_allow_overtaking`\
`mpi_assert_exact_length`\
`mpi_assert_memory_alloc_kinds`\
`mpi_assert_no_any_source`\
`mpi_assert_no_any_tag`\
`mpi_hw_resource_type`\
`mpi_initial_errhandler`\
`mpi_memory_alloc_kinds`\
`mpi_minimum_memory_alignment`\
`mpi_pset_name`\
`mpi_size`\
`nb_proc`\
`no_locks`\
`num_io_nodes`\
`path`\
`same_disp_unit`\
`same_size`\
`soft`\
`striping_factor`\
`striping_unit`\
`thread_level`\
`wdir`

#### Info Values

The following info values are reserved. They are strings.\
`alloc_mem`\
`false`\
`mpi`\
`mpi_errors_abort`\
`mpi_errors_are_fatal`\
`mpi_errors_return`\
`mpi_shared_memory`\
`MPI_THREAD_FUNNELED`\
`MPI_THREAD_MULTIPLE`\
`MPI_THREAD_SERIALIZED`\
`MPI_THREAD_SINGLE`\
`none`\
`random`\
`rar`\
`raw`\
`read_mostly`\
`read_once`\
`reverse_sequential`\
`same_op`\
`same_op_no_op`\
`sequential`\
`system`\
`true`\
`war`\
`waw`\
`win_allocate`\
`win_allocate_shared`\
`write_mostly`\
`write_once`

## Summary of the Semantics of all Operation-Related MPI Procedures



This annex provides the list of MPI procedures that are associated with an MPI operation, or inquiry procedures providing information about an operation.

In many cases, the MPI procedures and their properties are listed under certain constraints, e.g., a call to [[MPI_WAIT]] that completes either a nonblocking or a persistent operation, or RMA calls in combination with various synchronization methods.

**Table Legend:**

- **Stages:** `i`=initialization, `s`=starting, `c`=completion, `f`=freeing. The procedure does at least part of the indicated stage(s).

- **Cpl:** `ic`=incomplete procedure, `c`=completing procedure, `f`=freeing procedure

- **Loc:** `l`=local procedure, `nl`=non-local procedure

- **$`*`$**: exceptions, e.g., `ic+nl` = incomplete+non-local, and `c+l` = completing+local (both are defined as blocking)

- **Blk:** `b`=blocking procedure, `nb`=nonblocking procedure. Note that from a user’s view point, this column is only a hint. Relevant is, whether a routine is local or not and which resources are blocked until when. See both previous and last columns.

- **$`\ddagger`$**: exceptions, e.g., nonblocking procedures without prefix `I`, or that prefix `I` only marks immediate return.

- **Op:** part of operation type: `b-op` = blocking operation, `nb-op` = nonblocking operation, `p-op` = persistent operation, `pp-op` = persistent partitioned operation

- **Collective procedures:**

  - `C` = all processes of the group must call the procedure

  - `sq` = in the same sequence

  - `S1` = blocking synchronization, i.e., no process shall return from this procedure until all processes on the associated process group called this procedure

  - `W1` = the implementation is permitted to do S1 but not required to do S1

  - `S2` = start-complete-synchronization, i.e., no process shall complete the associated operation until all processes on the associated process group have called the associated starting procedure

  - `W2` = the implementation is permitted to do S2 but not required to do S2

- **Blocked resources:** They are blocked after the call until the end of the subsequent stage where this resource is not mentioned further in the table.

**Table Remarks:**

1.  Must not return before the corresponding MPI receive operation is started.

2.  Not related to an MPI operation. Prior to MPI-4.0, [[MPI_PROBE]] and [[MPI_IPROBE]] were also described as blocking and nonblocking. From MPI-4.0 onwards, only non-local and local are used to describe these procedures.

3.  Usually, [[MPI_WAIT]] is non-local, but in this case it is local.

4.  In case of a `MPI\_(I)BARRIER` on an intra-communicator, the `S1/S2` synchronization is required (instead of W1/W2).

5.  Collective: all processes must complete, but with the free choice of using [[MPI_WAIT]] or [[MPI_TEST]] returning `flag``= TRUE`.

6.  It also may not return until [[MPI_INIT]] was called in the children.

7.  Addresses are cached on the request handle.

8.  One of the rare cases that an incomplete call is non-local and therefore blocking.

9.  One shall not free or deallocate the buffer before the operation is freed, that is [[MPI_REQUEST_FREE]] returned.

10. For [[MPI_WAIT]] and [[MPI_TEST]] , see corresponding lines for a) [[MPI_BSEND]] , or b) [[MPI_IBCAST]] .

11. The prefix `I` marks only that this procedure returns immediately.

12. One of the exceptions that a completing and therefore blocking operation-related procedure is local.

13. `MPI\_(I)MPROBE` initializes the operation through generating the message handle whereas `MPI\_(I)MRECV` initializes the receive buffer (i.e., two MPI procedures together implement the initialization stage).

14. Nonblocking procedure without an `I` prefix.

15. Initialization stage (“`i`”) only if `flag``= TRUE` is returned else no operation is progressed.

16. Collective: all processes must start, but with the free choice of using [[MPI_START]] or [[MPI_STARTALL]] for a given persistent request handle (i.e., if one process starts a persistent request handle then all processes of the associated process group must start their corresponding request handle, and if any process starts then all processes must complete their handles).

17. In a correct MPI program, a call to `MPI\_(I)RSEND` requires that the receiver has already started the corresponding receive. Under this assumption, the call to [[MPI_RSEND]] and the call to [[MPI_WAIT]] with an (active) ready send request handle are local.

18. Based on their semantics, when called using an intra-communicator, [[MPI_ALLGATHER]] , [[MPI_ALLTOALL]] , and their [[V]] and [[W]] variants, [[MPI_ALLREDUCE]] , [[MPI_REDUCE_SCATTER]] , and [[MPI_REDUCE_SCATTER_BLOCK]] must synchronize (i.e., `S1/S2` instead of `W1/W2`) provided that all counts and the size of all datatypes are larger than zero.

19. [[MPI_COMM_FREE]] may return before any pending communication has finished and the communicator is deallocated. In contrast, [[MPI_COMM_DISCONNECT]] waits for pending communicaton to finish and deallocates the communicator before it returns.

20. The request handle is in the “active” state after [[MPI_START]] , i.e., [[MPI_REQUEST_FREE]] is now forbidden. But the starting stage is not yet finished, and the contents of the buffer are not yet “blocked.” An additional [[MPI_PREADY]] and variants [[MPI_PREADY_RANGE]] [[MPI_PREADY_LIST]] are required to activate each partition of the send buffer to finish the starting stage.

21. As part of the completion stage, the user is allowed to read part of the output buffer after returning from [[MPI_PARRIVED]] with `flag``= TRUE` before completing the whole operation with a [[MPI_WAIT]] / [[MPI_TEST]] procedure.

22. It initializes the attached buffer as completely free.

23. It uses the attached buffer and performs all four stages on the send buffer. It occupies the needed part of the attached buffer.

24. It waits until the attached buffer is empty, i.e., all messages have been transmitted, and then releases the attached buffer.

25. Although in case of `flag``= TRUE` the operation is completed, a subsequent call to test, wait, or free must be executed for deallocating or inactivating the request handle as final part of the stages c and f. It is listed only in this scenario, but can be used everywhere, where [[MPI_TEST]] can be called.

26. It frees the request handle. If the related communication operation is still ongoing then the completion and freeing stage can take place after the procedure returned.

27. Cancelling a send request is deprecated.

28. Can also be applied to activ persistent requests.

29. As an exception, [[MPI_WAIT]] is local and [[MPI_TEST]] repeatedly called will eventually return `flag``=true`. The cancelled send or receive operation is completed and the buffer can be reused. Whether the message is sent out from the buffer or received in the buffer, this part of the completion stage is only executed if a subsequent [[MPI_TEST_CANCELLED]] for the returned status would return `flag``= FALSE`. The freeing stage will be performed only for non-persistent requests.

30. In some cases, more than one MPI procedure may be needed to implement one stage of an MPI one-sided operation. For details on the semantics of one-sided operations, see [[Chapter]] sec:one-side-2.

31. Local completion only (at origin).

32. Local completion only (at target).

33. Completion at target and locally at origin.

34. Return from [[MPI_WIN_START]] and these subsequent procedures at the origin process may be delayed until [[MPI_WIN_POST]] has been called at the target process (see [[one-side#Synchronization Calls|Synchronization Calls]] and [[Example]] ex:1sided-start-complete).

35. Return from [[MPI_WIN_LOCK]] and these subsequent procedures may be delayed until other origin processes have released their lock (see [[one-side#Synchronization Calls|Synchronization Calls]] and [[Example]] ex:1sided-lock-unlock).

36. The init and freeing stages and the buffer address of the target window only apply to MPI processes in the role of a target of an RMA operation.

37. The freeing stage applies to operations only and does not apply to any request.

38. The same procedure call may serve different stages for different operations, i.e., the completion of a previous RMA and/or exposure epoch and/or the start of a next RMA and/or exposure epoch.

39. In addition to the completion and freeing of the RMA operations prior the the flush call (stages “`c+f`”), this call initializes the next RMA epoch (stage “`i`”).

40. The stages represent the invocation as part of an RMA operation. As collective procedure itself, it is a blocking procedure with all stages.

!

1.0mm

<table>
<tbody>
<tr>
<td style="text-align: left;"><strong>Procedure</strong></td>
<td style="text-align: left;"><strong>Stages</strong></td>
<td style="text-align: left;"><strong>Cpl</strong></td>
<td style="text-align: left;"><strong>Loc</strong></td>
<td style="text-align: left;"><strong>Blk</strong></td>
<td style="text-align: left;"><strong>Op</strong></td>
<td colspan="3" style="text-align: center;"><strong>Collective</strong></td>
<td style="text-align: left;"><strong>Blocked resources</strong></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;"><strong>C</strong></td>
<td style="text-align: center;"><strong>sq</strong></td>
<td style="text-align: center;"><strong>S/W</strong></td>
<td style="text-align: left;"><strong>and remarks</strong></td>
</tr>
<tr>
<td colspan="10" style="text-align: center;"><strong>Chapter 3: Point-to-Point Communication</strong></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_SEND]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_SSEND]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_RSEND]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l<sup>*</sup></td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_BUFFER_ATTACH]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">attached buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_BSEND]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l<sup>*</sup></td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">attached buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_BUFFER_DETACH]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-f</td>
<td style="text-align: left;">f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_RECV]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_ISEND]] , [[MPI_ISSEND]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_IRECV]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer</td>
</tr>
<tr>
<td style="text-align: left;">corresp. [[MPI_REQUEST_GET_STATUS]] ret. flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresp. [[MPI_REQUEST_GET_STATUS]] ret. flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]] (for active request)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_IBSEND]] , [[MPI_IRSEND]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l<sup>*</sup></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]] (for active request)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_ISEND]] , [[MPI_ISSEND]] , [[MPI_IBSEND]] , [[MPI_IRSEND]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]]</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_IRECV]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_CANCEL]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l<sup>*</sup></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST_CANCELLED]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_PROBE]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_IPROBE]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">l<sup>‡</sup></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_MPROBE]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">nl<sup>*</sup></td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">message [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_IMPROBE]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">message [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_MRECV]] of a probed message</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_IMRECV]] of a probed message</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]] (for active request)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">`MPI_[S<span class="math inline">|</span>B<span class="math inline">|</span>R]SEND_INIT` , [[MPI_RECV_INIT]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb<sup>‡</sup></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_START]] , [[MPI_STARTALL]]</td>
<td style="text-align: left;"><span>-</span>-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb<sup>‡</sup></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]] (for `MPI_(B<span class="math inline">|</span>R)SEND_INIT` req.)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">l<sup>*</sup></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]] (for other request)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]] (for active request)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]] (for inactive request)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-f</td>
<td style="text-align: left;">f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_CANCEL]] of nonblocking/persistent pt-to-pt</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_SENDRECV[_REPLACE]]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_ISENDRECV[_REPLACE]]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]] (for active request)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td colspan="10" style="text-align: center;"><strong>Chapter 4: Partitioned Point-to-Point Communication</strong></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_PSEND_INIT]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb<sup>‡</sup></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_START]] , [[MPI_STARTALL]]</td>
<td style="text-align: left;"><span>-</span>-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb<sup>‡</sup></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_PREADY]] and variants</td>
<td style="text-align: left;"><span>-</span>-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb<sup>‡</sup></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]] (for inactive request)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-f</td>
<td style="text-align: left;">f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_PRECV_INIT]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb<sup>‡</sup></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_START]] , [[MPI_STARTALL]]</td>
<td style="text-align: left;"><span>-</span>-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb<sup>‡</sup></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_PARRIVED]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>c</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_PARRIVED]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]] (for inactive request)</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-f</td>
<td style="text-align: left;">f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">pp-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>



!

1.0mm

<table>
<tbody>
<tr>
<td style="text-align: left;"><strong>Procedure</strong></td>
<td style="text-align: left;"><strong>Stages</strong></td>
<td style="text-align: left;"><strong>Cpl</strong></td>
<td style="text-align: left;"><strong>Loc</strong></td>
<td style="text-align: left;"><strong>Blk</strong></td>
<td style="text-align: left;"><strong>Op</strong></td>
<td colspan="3" style="text-align: center;"><strong>Collective</strong></td>
<td style="text-align: left;"><strong>Blocked resources</strong></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;"><strong>C</strong></td>
<td style="text-align: center;"><strong>sq</strong></td>
<td style="text-align: center;"><strong>S/W</strong></td>
<td style="text-align: left;"><strong>and remarks</strong></td>
</tr>
<tr>
<td colspan="10" style="text-align: center;"><strong>Chapter 6: Collective Communication</strong></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_BCAST]] , [[MPI_BARRIER]] , [[MPI_GATHER]] , [[MPI_GATHERV]] , [[MPI_SCATTER]] , [[MPI_SCATTERV]] , [[MPI_ALLGATHER]] , [[MPI_ALLGATHERV]] , [[MPI_ALLTOALL]] , [[MPI_ALLTOALLV]] , [[MPI_ALLTOALLW]] , [[MPI_REDUCE]] , [[MPI_ALLREDUCE]] , [[MPI_REDUCE_SCATTER_BLOCK]] , [[MPI_REDUCE_SCATTER]] , [[MPI_SCAN]] , [[MPI_EXSCAN]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_IBCAST]] , [[MPI_IBARRIER]] , [[MPI_IGATHER]] , [[MPI_ISCATTER]] , [[MPI_IALLGATHER]] , [[MPI_IALLTOALL]] , [[MPI_IREDUCE]] , [[MPI_IALLREDUCE]] , [[MPI_IREDUCE_SCATTER_BLOCK]] , [[MPI_ISCAN]] , [[MPI_IEXSCAN]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_IGATHERV]] , [[MPI_ISCATTERV]] , [[MPI_IALLGATHERV]] , [[MPI_IALLTOALLV]] , [[MPI_IALLTOALLW]] , [[MPI_IREDUCE_SCATTER]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer, array arguments</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer, array arguments [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_BCAST_INIT]] , [[MPI_BARRIER_INIT]] , [[MPI_GATHER_INIT]] , [[MPI_SCATTER_INIT]] , [[MPI_ALLGATHER_INIT]] , [[MPI_ALLTOALL_INIT]] , [[MPI_REDUCE_INIT]] , [[MPI_ALLREDUCE_INIT]] , [[MPI_REDUCE_SCATTER_BLOCK_INIT]] , [[MPI_SCAN_INIT]] , [[MPI_EXSCAN_INIT]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">nl<sup>*</sup></td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_GATHERV_INIT]] , [[MPI_SCATTERV_INIT]] , [[MPI_ALLGATHERV_INIT]] , [[MPI_ALLTOALLV_INIT]] , [[MPI_ALLTOALLW_INIT]] , [[MPI_REDUCE_SCATTER_INIT]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">nl<sup>*</sup></td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">buffer address, array arguments [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_START]] , [[MPI_STARTALL]]</td>
<td style="text-align: left;"><span>-</span>-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb<sup>‡</sup></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buf.addr.+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buf addr+contents &amp; arr-args [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">buf-addr &amp; arr-args [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">buffer address and array arguments cached on the request handle [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-f</td>
<td style="text-align: left;">f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="10" style="text-align: center;"><strong>Chapter 7: Groups, Contexts, Communicators, and Caching</strong></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_CREATE]] , [[MPI_COMM_DUP]] , [[MPI_COMM_DUP_WITH_INFO]] , [[MPI_COMM_SPLIT]] , [[MPI_COMM_SPLIT_TYPE]] , [[MPI_COMM_SET_INFO]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">coll. over comm arg.</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_CREATE_GROUP]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">coll. over group arg.</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_INTERCOMM_CREATE]] , [[MPI_INTERCOMM_MERGE]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">coll. over union oflocal &amp; remote group</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_IDUP]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;"></td>
<td style="text-align: left;">communicator handle</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_FREE]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_DISCONNECT]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
</tbody>
</table>



!

1.0mm

<table>
<tbody>
<tr>
<td style="text-align: left;"><strong>Procedure</strong></td>
<td style="text-align: left;"><strong>Stages</strong></td>
<td style="text-align: left;"><strong>Cpl</strong></td>
<td style="text-align: left;"><strong>Loc</strong></td>
<td style="text-align: left;"><strong>Blk</strong></td>
<td style="text-align: left;"><strong>Op</strong></td>
<td colspan="3" style="text-align: center;"><strong>Collective</strong></td>
<td style="text-align: left;"><strong>Blocked resources</strong></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;"><strong>C</strong></td>
<td style="text-align: center;"><strong>sq</strong></td>
<td style="text-align: center;"><strong>S/W</strong></td>
<td style="text-align: left;"><strong>and remarks</strong></td>
</tr>
<tr>
<td colspan="10" style="text-align: center;"><strong>Chapter 8: Process Topologies</strong></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_CART_CREATE]] , [[MPI_CART_SUB]] , [[MPI_GRAPH_CREATE]] , [[MPI_DIST_GRAPH_CREATE_ADJACENT]] , [[MPI_DIST_GRAPH_CREATE]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">coll. over comm arg.</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_NEIGHBOR_ALLGATHER]] , [[MPI_NEIGHBOR_ALLGATHERV]] , [[MPI_NEIGHBOR_ALLTOALL]] , [[MPI_NEIGHBOR_ALLTOALLV]] , [[MPI_NEIGHBOR_ALLTOALLW]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_INEIGHBOR_ALLGATHER]] , [[MPI_INEIGHBOR_ALLTOALL]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_INEIGHBOR_ALLGATHERV]] , [[MPI_INEIGHBOR_ALLTOALLV]] , [[MPI_INEIGHBOR_ALLTOALLW]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer, array arguments</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer, array arguments [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_NEIGHBOR_ALLGATHER_INIT]] , [[MPI_NEIGHBOR_ALLTOALL_INIT]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">nl<sup>*</sup></td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_NEIGHBOR_ALLGATHERV_INIT]] , [[MPI_NEIGHBOR_ALLTOALLV_INIT]] , [[MPI_NEIGHBOR_ALLTOALLW_INIT]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">nl<sup>*</sup></td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">buffer address, array arguments [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_START]] , [[MPI_STARTALL]]</td>
<td style="text-align: left;"><span>-</span>-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb<sup>‡</sup></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buf.addr.+contents [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>‡</sup> [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buf addr+contents &amp; arr-args [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">buf-addr &amp; arr-args [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;"></td>
<td style="text-align: center;">W2</td>
<td style="text-align: left;">buffer address and array arguments cached on the request handle [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_REQUEST_FREE]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-f</td>
<td style="text-align: left;">f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">p-op</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td colspan="10" style="text-align: center;"><strong>Chapter 11: Process Initialization, Creation, and Management</strong></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_INIT]] , [[MPI_INIT_THREAD]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">collective over<code>MPI_COMM_WORLD</code></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_FINALIZE]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">collective over all connected processes</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_SESSION_INIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_SESSION_FINALIZE]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">collective over connected processes scoped by the session</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_SPAWN]] , ... [[MULTIPLE]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">collective over comm [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_COMM_ACCEPT]] , [[MPI_COMM_CONNECT]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">collective over comm</td>
</tr>
</tbody>
</table>



!

1.0mm

<table>
<tbody>
<tr>
<td style="text-align: left;"><strong>Procedure</strong></td>
<td style="text-align: left;"><strong>Stages</strong></td>
<td style="text-align: left;"><strong>Cpl</strong></td>
<td style="text-align: left;"><strong>Loc</strong></td>
<td style="text-align: left;"><strong>Blk</strong></td>
<td style="text-align: left;"><strong>Op</strong></td>
<td colspan="3" style="text-align: center;"><strong>Collective</strong></td>
<td style="text-align: left;"><strong>Blocked resources</strong></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;"><strong>C</strong></td>
<td style="text-align: center;"><strong>sq</strong></td>
<td style="text-align: center;"><strong>S/W</strong></td>
<td style="text-align: left;"><strong>and remarks</strong></td>
</tr>
<tr>
<td colspan="10" style="text-align: center;"><strong>Chapter 12: One-Sided Communication</strong></td>
</tr>
<tr>
<td colspan="10" style="text-align: center;">Window Allocation and Destruction</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_CREATE]] , [[MPI_WIN_ALLOCATE]] , [[MPI_WIN_ALLOCATE_SHARED]] , [[MPI_WIN_CREATE_DYNAMIC]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">window buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_SET_INFO]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">window buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_FREE]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-f</td>
<td style="text-align: left;">f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td colspan="10" style="text-align: center;">With Fence Synchronization in the Role of an Origin Process</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_FENCE]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"><span>-</span></td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_PUT]] , [[MPI_GET]] , [[MPI_ACCUMULATE]] , [[MPI_GET_ACCUMULATE]] , [[MPI_COMPARE_AND_SWAP]] , [[MPI_FETCH_AND_OP]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">argument buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_FENCE]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td colspan="10" style="text-align: center;">With Fence Synchronization in the Role of a Target Process</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_FENCE]]</td>
<td style="text-align: left;"><span>-</span>-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">window buffer address+content [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_FENCE]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">window buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td colspan="10" style="text-align: center;">With General Active Target Synchronization in the Role of an Origin Process</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_START]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_PUT]] , [[MPI_GET]] , [[MPI_ACCUMULATE]] , [[MPI_GET_ACCUMULATE]] , [[MPI_COMPARE_AND_SWAP]] , [[MPI_FETCH_AND_OP]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">argument buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_COMPLETE]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td colspan="10" style="text-align: center;">With General Active Target Synchronization in the Role of a Target Process</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_POST]]</td>
<td style="text-align: left;"><span>-</span>-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">window buffer address+content</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">window buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-<span>-</span></td>
<td style="text-align: left;">c</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">window buffer address [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td colspan="10" style="text-align: center;">With Lock/Unlock Synchronization in the Role of an Origin Process</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_LOCK]] , [[MPI_WIN_LOCK_ALL]]</td>
<td style="text-align: left;">i-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_PUT]] , [[MPI_GET]] , [[MPI_ACCUMULATE]] , [[MPI_GET_ACCUMULATE]] , [[MPI_COMPARE_AND_SWAP]] , [[MPI_FETCH_AND_OP]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">argument buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_RPUT]] , [[MPI_RGET]] , [[MPI_RACCUMULATE]] , [[MPI_RGET_ACCUMULATE]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">argument buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=FALSE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-<span>-</span>-<span>-</span></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">argument buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_TEST]] returning flag=TRUE</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">corresponding [[MPI_WAIT]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l<sup>*</sup></td>
<td style="text-align: left;"></td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_FLUSH_LOCAL]] , [[MPI_WIN_FLUSH_LOCAL_ALL]]</td>
<td style="text-align: left;"><span>i</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_FLUSH]] , [[MPI_WIN_FLUSH_ALL]]</td>
<td style="text-align: left;"><span>i</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_WIN_UNLOCK]] , [[MPI_WIN_UNLOCK_ALL]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] ) [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )</td>
</tr>
</tbody>
</table>



!

1.0mm

<table>
<tbody>
<tr>
<td style="text-align: left;"><strong>Procedure</strong></td>
<td style="text-align: left;"><strong>Stages</strong></td>
<td style="text-align: left;"><strong>Cpl</strong></td>
<td style="text-align: left;"><strong>Loc</strong></td>
<td style="text-align: left;"><strong>Blk</strong></td>
<td style="text-align: left;"><strong>Op</strong></td>
<td colspan="3" style="text-align: center;"><strong>Collective</strong></td>
<td style="text-align: left;"><strong>Blocked resources</strong></td>
</tr>
<tr>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: left;"></td>
<td style="text-align: center;"><strong>C</strong></td>
<td style="text-align: center;"><strong>sq</strong></td>
<td style="text-align: center;"><strong>S/W</strong></td>
<td style="text-align: left;"><strong>and remarks</strong></td>
</tr>
<tr>
<td colspan="10" style="text-align: center;"><strong>Chapter 14: I/O</strong></td>
</tr>
<tr>
<td style="text-align: left;">`MPI_FILE_READ/WRITE[_AT<span class="math inline">|</span>_SHARED]` , [[MPI_FILE_DELETE/SEEK/GET_VIEW]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">l<sup>*</sup></td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">[[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_FILE_READ/WRITE_AT_ALL]] , `MPI_FILE_READ/WRITE_ALL<span class="math inline">|</span>ORDERED` , [[MPI_FILE_OPEN/CLOSE/SEEK_SHARED]] , [[MPI_FILE_PREALLOCATE/SYNC]] , [[MPI_FILE_SET_VIEW/SIZE/INFO/ATOMICITY]]</td>
<td style="text-align: left;">i-s-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;"></td>
</tr>
<tr>
<td style="text-align: left;">`MPI_FILE_IREAD/IWRITE[_AT<span class="math inline">|</span>_SHARED]`</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">-</td>
<td style="text-align: center;"></td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] a)</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_FILE_IREAD/IWRITE[_AT]_ALL]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">l</td>
<td style="text-align: left;">nb</td>
<td style="text-align: left;">nb-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;"></td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] b)</td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_FILE_READ/WRITE[_AT]_ALL_BEGIN]] [[MPI_FILE_READ/WRITE_ORDERED_BEGIN]]</td>
<td style="text-align: left;">i-s-<span>-</span>-<span>-</span></td>
<td style="text-align: left;">ic</td>
<td style="text-align: left;">nl<sup>*</sup></td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;">buffer [[appLang-Const#Summary of the Semantics of all Operation-Related MPI Procedures|Summary of the Semantics of all Operation-Related MPI Procedures]] )<sup>*</sup></td>
</tr>
<tr>
<td style="text-align: left;">[[MPI_FILE_READ/WRITE[_AT]_ALL_END]] [[MPI_FILE_READ/WRITE_ORDERED_END]]</td>
<td style="text-align: left;"><span>-</span>-<span>-</span>-c-f</td>
<td style="text-align: left;">c+f</td>
<td style="text-align: left;">nl</td>
<td style="text-align: left;">b</td>
<td style="text-align: left;">b-op</td>
<td style="text-align: center;">C</td>
<td style="text-align: center;">sq</td>
<td style="text-align: center;">W1</td>
<td style="text-align: left;"></td>
</tr>
</tbody>
</table>




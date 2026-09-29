# Language Binding



## Introduction

This annex summarizes the specific bindings for Fortran, C, and C++. First the constants, error codes, info keys, and info values are presented. Second, the MPI-1.2 bindings are given. Third, the MPI-2 bindings are given.

## Defined Values and Handles

### Defined Constants



The C and Fortran name is listed in the left column and the C++ name is listed in the right column.

ll **Return Codes**   MPI_ERR_ACCESS & MPI::ERR_ACCESS\
MPI_ERR_AMODE & MPI::ERR_AMODE\
MPI_ERR_ASSERT & MPI::ERR_ASSERT\
MPI_ERR_BAD_FILE & MPI::ERR_BAD_FILE\
MPI_ERR_BASE & MPI::ERR_BASE\
MPI_ERR_CONVERSION & MPI::ERR_CONVERSION\
MPI_ERR_DISP & MPI::ERR_DISP\
MPI_ERR_DUP_DATAREP & MPI::ERR_DUP_DATAREP\
MPI_ERR_FILE_EXISTS & MPI::ERR_FILE_EXISTS\
MPI_ERR_FILE_IN_USE & MPI::ERR_FILE_IN_USE\
MPI_ERR_FILE & MPI::ERR_FILE\
MPI_ERR_INFO_KEY & MPI::ERR_INFO_VALUE\
MPI_ERR_INFO_NOKEY & MPI::ERR_INFO_NOKEY\
MPI_ERR_INFO_VALUE & MPI::ERR_INFO_KEY\
MPI_ERR_INFO & MPI::ERR_INFO\
MPI_ERR_IO & MPI::ERR_IO\
MPI_ERR_KEYVAL & MPI::ERR_KEYVAL\
MPI_ERR_LOCKTYPE & MPI::ERR_LOCKTYPE\
MPI_ERR_NAME & MPI::ERR_NAME\
MPI_ERR_NO_MEM & MPI::ERR_NO_MEM\
MPI_ERR_NOT_SAME & MPI::ERR_NOT_SAME\
MPI_ERR_NO_SPACE & MPI::ERR_NO_SPACE\
MPI_ERR_NO_SUCH_FILE & MPI::ERR_NO_SUCH_FILE\
MPI_ERR_PORT & MPI::ERR_PORT\
MPI_ERR_QUOTA & MPI::ERR_QUOTA\
MPI_ERR_READ_ONLY & MPI::ERR_READ_ONLY\
MPI_ERR_RMA_CONFLICT & MPI::ERR_RMA_CONFLICT\
MPI_ERR_RMA_SYNC & MPI::ERR_RMA_SYNC\
MPI_ERR_SERVICE & MPI::ERR_SERVICE\
MPI_ERR_SIZE & MPI::ERR_SIZE\
MPI_ERR_SPAWN & MPI::ERR_SPAWN\
MPI_ERR_UNSUPPORTED_DATAREP & MPI::ERR_UNSUPPORTED_DATAREP\
MPI_ERR_UNSUPPORTED_OPERATION & MPI::ERR_UNSUPPORTED_OPERATION\
MPI_ERR_WIN & MPI::ERR_WIN\

ll **Assorted Constants**   `MPI_IN_PLACE` & `MPI::IN_PLACE`\
`MPI_LOCK_EXCLUSIVE` & `MPI::LOCK_EXCLUSIVE`\
`MPI_LOCK_SHARED` & `MPI::LOCK_SHARED`\
`MPI_ROOT` & `MPI::ROOT`\

ll **Variable Address Size (Fortran only)**   `MPI_ADDRESS_KIND` & Not defined for C++\
`MPI_INTEGER_KIND` & Not defined for C++\
`MPI_OFFSET_KIND` & Not defined for C++\

ll **Maximum Sizes for Strings**   `MPI_MAX_DATAREP_STRING` & `MPI::MAX_DATAREP_STRING`\
`MPI_MAX_INFO_KEY` & `MPI::MAX_INFO_KEY`\
`MPI_MAX_INFO_VAL` & `MPI::MAX_INFO_VAL`\
`MPI_MAX_OBJECT_NAME` & `MPI::MAX_OBJECT_NAME`\
`MPI_MAX_PORT_NAME` & `MPI::MAX_PORT_NAME`\

ll **Named Predefined Datatypes**   `MPI_WCHAR` & `MPI::WCHAR`\

ll **C and C++ (no Fortran) Named Predefined Datatypes**   `MPI_Fint` & `MPI::Fint`\

ll **Optional C and C++ (no Fortran) Named Predefined Datatypes**\
`MPI_UNSIGNED_LONG_LONG` & `MPI::UNSIGNED_LONG_LONG`\
`MPI_SIGNED_CHAR` & `MPI::SIGNED_CHAR`\

ll **Predefined Attribute Keys**   `MPI_APPNUM` & `MPI::APPNUM`\
`MPI_LASTUSEDCODE` & `MPI::LASTUSEDCODE`\
`MPI_UNIVERSE_SIZE` & `MPI::UNIVERSE_SIZE`\
`MPI_WIN_BASE` & `MPI::WIN_BASE`\
`MPI_WIN_DISP_UNIT` & `MPI::WIN_DISP_UNIT`\
`MPI_WIN_SIZE` & `MPI::WIN_SIZE`\

ll **Collective Operations**   `MPI_REPLACE` & `MPI::REPLACE`\

ll **Null Handles**   `MPI_FILE_NULL` & `MPI::FILE_NULL`\
`MPI_INFO_NULL` & `MPI::INFO_NULL`\
`MPI_WIN_NULL` & `MPI::WIN_NULL`\

ll **Mode Constants**   `MPI_MODE_APPEND` & `MPI::MODE_APPEND`\
`MPI_MODE_CREATE` & `MPI::MODE_CREATE`\
`MPI_MODE_DELETE_ON_CLOSE` & `MPI::MODE_DELETE_ON_CLOSE`\
`MPI_MODE_EXCL` & `MPI::MODE_EXCL`\
`MPI_MODE_NOCHECK` & `MPI::MODE_NOCHECK`\
`MPI_MODE_NOPRECEDE` & `MPI::MODE_NOPRECEDE`\
`MPI_MODE_NOPUT` & `MPI::MODE_NOPUT`\
`MPI_MODE_NOSTORE` & `MPI::MODE_NOSTORE`\
`MPI_MODE_NOSUCCEED` & `MPI::MODE_NOSUCCEED`\
`MPI_MODE_RDONLY` & `MPI::MODE_RDONLY`\
`MPI_MODE_RDWR` & `MPI::MODE_RDWR`\
`MPI_MODE_SEQUENTIAL` & `MPI::MODE_SEQUENTIAL`\
`MPI_MODE_UNIQUE_OPEN` & `MPI::MODE_UNIQUE_OPEN`\
`MPI_MODE_WRONLY` & `MPI::MODE_WRONLY`\

ll **Datatype Decoding Constants**   `MPI_COMBINER_CONTIGUOUS` & `MPI::COMBINER_CONTIGUOUS`\
`MPI_COMBINER_DARRAY` & `MPI::COMBINER_DARRAY`\
`MPI_COMBINER_DUP` & `MPI::COMBINER_DUP`\
`MPI_COMBINER_F90_COMPLEX` & `MPI::COMBINER_F90_COMPLEX`\
`MPI_COMBINER_F90_INTEGER` & `MPI::COMBINER_F90_INTEGER`\
`MPI_COMBINER_F90_REAL` & `MPI::COMBINER_F90_REAL`\
`MPI_COMBINER_HINDEXED_INTEGER` & `MPI::COMBINER_HINDEXED_INTEGER`\
`MPI_COMBINER_HINDEXED` & `MPI::COMBINER_HINDEXED`\
`MPI_COMBINER_HVECTOR_INTEGER` & `MPI::COMBINER_HVECTOR_INTEGER`\
`MPI_COMBINER_HVECTOR` & `MPI::COMBINER_HVECTOR`\
`MPI_COMBINER_INDEXED_BLOCK` & `MPI::COMBINER_INDEXED_BLOCK`\
`MPI_COMBINER_INDEXED` & `MPI::COMBINER_INDEXED`\
`MPI_COMBINER_NAMED` & `MPI::COMBINER_NAMED`\
`MPI_COMBINER_RESIZED` & `MPI::COMBINER_RESIZED`\
`MPI_COMBINER_STRUCT_INTEGER` & `MPI::COMBINER_STRUCT_INTEGER`\
`MPI_COMBINER_STRUCT` & `MPI::COMBINER_STRUCT`\
`MPI_COMBINER_SUBARRAY` & `MPI::COMBINER_SUBARRAY`\
`MPI_COMBINER_VECTOR` & `MPI::COMBINER_VECTOR`\

ll **Threads Constants**   `MPI_THREAD_FUNNELED` & `MPI::THREAD_FUNNELED`\
`MPI_THREAD_MULTIPLE` & `MPI::THREAD_MULTIPLE`\
`MPI_THREAD_SERIALIZED` & `MPI::THREAD_SERIALIZED`\
`MPI_THREAD_SINGLE` & `MPI::THREAD_SINGLE`\

ll **File Operation Constants**   `MPI_DISPLACEMENT_CURRENT` & `MPI::DISPLACEMENT_CURRENT`\
`MPI_DISTRIBUTE_BLOCK` & `MPI::DISTRIBUTE_BLOCK`\
`MPI_DISTRIBUTE_CYCLIC` & `MPI::DISTRIBUTE_CYCLIC`\
`MPI_DISTRIBUTE_DFLT_DARG` & `MPI::DISTRIBUTE_DFLT_DARG`\
`MPI_DISTRIBUTE_NONE` & `MPI::DISTRIBUTE_NONE`\
`MPI_ORDER_C` & `MPI::ORDER_C`\
`MPI_ORDER_FORTRAN` & `MPI::ORDER_FORTRAN`\
`MPI_SEEK_CUR` & `MPI::SEEK_CUR`\
`MPI_SEEK_END` & `MPI::SEEK_END`\
`MPI_SEEK_SET` & `MPI::SEEK_SET`\

ll **F90 Datatype Matching Constants**   `MPI_TYPECLASS_COMPLEX` & `MPI::TYPECLASS_COMPLEX`\
`MPI_TYPECLASS_INTEGER` & `MPI::TYPECLASS_INTEGER`\
`MPI_TYPECLASS_REAL` & `MPI::TYPECLASS_REAL`\

ll **Handles to Assorted Structures in C and C++ (no Fortran)**   `MPI_File` & `MPI::File`\
`MPI_Info` & `MPI::Info`\
`MPI_Win` & `MPI::Win`\

ll **Constants Specifying Empty or Ignored Input**   `MPI_ARGVS_NULL` & `MPI::ARGVS_NULL`\
`MPI_ARGV_NULL` & `MPI::ARGV_NULL`\
`MPI_ERRCODES_IGNORE` & Not defined for C++\
`MPI_STATUSES_IGNORE` & Not defined for C++\
`MPI_STATUS_IGNORE` & Not defined for C++\

ll **C Constants Specifying Ignored Input (no C++ or Fortran)**   `MPI_F_STATUSES_IGNORE` & Not defined for C++\
`MPI_F_STATUS_IGNORE` & Not defined for C++\

|                                                                       |
|:----------------------------------------------------------------------|
| **C and C++ cpp Constants and Fortran Parameters**   `MPI_SUBVERSION` |
| `MPI_VERSION`                                                         |

### Info Keys

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

false\
random\
read_mostly\
read_once\
reverse_sequential\
sequential\
true\
write_mostly\
write_once\

## MPI-1.2 C Bindings

## MPI-1.2 Fortran Bindings

## MPI-1.2 C++ Bindings

See Section efcppbinding:getversion.

## MPI-2 C Bindings

### Miscellany

### Process Creation and Management

### One-Sided Communications

### Extended Collective Operations

### External Interfaces

### I/O

### Language Bindings

### User Defined Functions

## MPI-2 Fortran Bindings

### Miscellany

### Process Creation and Management

### One-Sided Communications

### Extended Collective Operations

### External Interfaces

### I/O

### Language Bindings

### User Defined Subroutines

## MPI-2 C++ Bindings

### Miscellany

### Process Creation and Management

### One-Sided Communications

### Extended Collective Operations

### External Interfaces

### I/O

### Language Bindings

### User Defined Functions

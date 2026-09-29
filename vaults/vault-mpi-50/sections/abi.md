# Application Binary Interface (ABI)



## Introduction



The other chapters of the MPI standard specify an Application Programming Interface (API) that defines (amongst other things) a set of opaque handle types and named constants without specifying their memory layout or values, respectively. This allows implementations to choose these according to different types of requirement. However, this flexibility means that different implementations are incompatible from the perspective of compiled applications, because the Application Binary Interface (ABI) is not specified.

This chapter defines an Application Binary Interface (ABI) for MPI, meaning that it specifies the memory layouts of all opaque handle types, the values of integer constants, and other aspects of MPI needed by use cases that require a defined ABI. This standard ABI for MPI exists in parallel with existing implementation ABIs, in order to preserve backwards-compatibility of existing MPI implementations.

A standard ABI for MPI serves many purposes, including support for applications compiled with one implementation of MPI to be executed with another implementation. It is also a necessary requirement for third-party languages that intend to interface with MPI through binary symbol names, rather than direct function calls to the C API. This chapter specifies the ABI of the C API of MPI as well as the implications of the ABI for Fortran implementations.

## Implementation Requirements

Although the ABI is designed to be portable, there are platform and implementation designs where it cannot be supported, or is not useful to support. Furthermore, backwards compatibility of existing implementation ABIs is important to some users, and MPI implementations may continue to support these.

The standard ABI is intended to support systems with the following properties:

- Dynamic shared libraries, which are loaded by the operating system or by the application, are supported.

- The calling convention of C functions and the sizes and alignment requirements of C standard types are known constant properties of the system; if the system possesses any means for changing these, each choice constitutes a different, incompatible system from the perspective of the MPI ABI.

- Addresses can be represented as 32- or 64-bit signed integers and have a direct relationship with C pointers; segmented addressing is not supported.

The following query functions are provided to allow MPI applications, tools, and language bindings to determine whether an implementation provides ABI support and, if so, which version of the ABI is supported. [[MPI_ABI_GET_VERSION]] and [[MPI_ABI_GET_INFO]] , can be called at any time in an MPI program. These functions must always be thread-safe, as defined in [[dynamic#MPI and Threads|MPI and Threads]] .

![[API/MPI_ABI_GET_VERSION]]

[[MPI_ABI_GET_VERSION]] produces the standard ABI version, if supported. Otherwise, the values of the major and minor version are set to $`-1`$. The ABI version is independent of the MPI specification version. The major and minor version of the ABI associated with MPI-5.0 are 1 and 0.

The ABI version macros `MPI_ABI_VERSION` and `MPI_ABI_SUBVERSION` are present in the MPI header and modules so that applications can check for consistency between the compilation environment and the properties of the implementation at runtime.

``` [MPI]C
#define MPI_ABI_VERSION    1
#define MPI_ABI_SUBVERSION 0
```

``` [MPI]Fortran
INTEGER :: MPI_ABI_VERSION, MPI_ABI_SUBVERSION
PARAMETER (MPI_ABI_VERSION    = 1)
PARAMETER (MPI_ABI_SUBVERSION = 0)
```

Backwards-compatible changes, such as the addition of new handle types, will increment the minor version. Backwards-incompatible changes will increment the major version. The addition of new functions to the MPI API does not change the ABI version. The existing function [[MPI_GET_VERSION]] can be used to query the version of the API supported and whether certain functions are present in the MPI library.

![[API/MPI_ABI_GET_INFO]]

Implementations may provide additional information related to the ABI. The function [[MPI_ABI_GET_INFO]] allows the user to query this information via an info object.

The following keys are predefined for this object:

`mpi_aint_size`:  
The size in bytes of `MPI_Aint`.

`mpi_count_size`:  
The size in bytes of `MPI_Count`.

`mpi_offset_size`:  
The size in bytes of `MPI_Offset`.

### The MPI ABI Header File and Shared Library



The ABI must be implemented using a header named `mpi.h`. The MPI library that implements the standard ABI must be named `mpi_abi`. The filename for this library may have a platform-specific prefix and/or a platform-specific suffix. For Linux, for example, `lib` and `.so` would be the default prefix and suffix. Implementors are expected to follow platform-specific conventions for dynamic shared library naming and versioning. ABI-compliant implementations must not require more than `mpi_abi` or its versioned variant as the sole direct dependency of the application binary.

> [!warning] Advice to implementors

> If an implementation implements its own ABI definition, it must clearly document how users employ one or the other, such as the paths of the aforementioned files and any other options required for their correct use.

Applications must not mix different ABIs. If implementations provide both the standard ABI and an implementation-specific ABI, applications must compile and link against only one of these.

The API defined in `mpi.h` associated with the standard ABI does not include features of MPI deprecated in MPI-3.1 or earlier. A full list of deprecated features can be found in Table [[terms#Deprecated and Removed Interfaces|Deprecated and Removed Interfaces]] .

> [!tip] Rationale

> If deprecated features are included in the standard ABI, deleting them will cause a backwards-incompatibility issue in the ABI. Removing them from the ABI now makes it straightforward for them to be deleted from MPI in the future.

## The C Application Binary Interface



### The Status Object

The MPI status object is a struct containing 8 integers: the three public member fields described in [[pt2pt#Return Status|Return Status]] and 5 private member fields that are reserved for implementations and must never be directly accessed by applications.

The MPI status object is defined in C as follows:

``` [MPI]C
typedef struct {
    int MPI_SOURCE;
    int MPI_TAG;
    int MPI_ERROR;
    int MPI_internal[5];
} MPI_Status;
```

The MPI status object must use exactly eight C `int` worth of storage.

> [!warning] Advice to implementors

> The alignment of the status object may be less than the alignment of a pointer or `MPI_Count`. Therefore, implementatons that store such a value in the status object must take care to access it using a method that does not depend on alignment greater than `int`. Such methods include `memcpy` and type-punning.

> [!tip] Rationale

> This definition provides sufficient space to accommodate implementation-specific information and leads to memory alignment that allows efficient access to arrays of status objects.

### Opaque Handles

Handles for MPI objects are defined to be incomplete struct pointers, which allows for C compilers to do type-checking, while also satisfying the existing requirements, such as equality comparison.

> [!tip] Rationale

> Integer handles do not provide type safety, while `struct` or `union` handles fail to satisfy the existing API requirements.

The following handle type definitions are part of the MPI ABI:

``` [MPI]C
typedef struct MPI_ABI_Comm* MPI_Comm;
typedef struct MPI_ABI_Datatype* MPI_Datatype;
typedef struct MPI_ABI_Errhandler* MPI_Errhandler;
typedef struct MPI_ABI_File* MPI_File;
typedef struct MPI_ABI_Group* MPI_Group;
typedef struct MPI_ABI_Info* MPI_Info;
typedef struct MPI_ABI_Message* MPI_Message;
typedef struct MPI_ABI_Op* MPI_Op;
typedef struct MPI_ABI_Request* MPI_Request;
typedef struct MPI_ABI_Session* MPI_Session;
typedef struct MPI_ABI_Win* MPI_Win;
```

### Handle Constants

Every handle type has at least one, and often many, predefined constants of that type, e.g., `MPI_REQUEST_NULL` for `MPI_Request` and `MPI_COMM_WORLD` for `MPI_Comm`. The MPI ABI defines handle constants to be compile-time constants, which are specified as integer expressions cast to the appropriate handle type.

> [!tip] Rationale

> Link-time constants, while convenient, are not strictly portable.

All predefined handle constants correspond to integer representations that are unlikely to be valid addresses, and must not be dereferenced. Implementations must ensure that the handles they create for the user are never in the range reserved for predefined handle constants. The MPI ABI reserves values corresponding to the integers 1 to 4095 for predefined handle constants. The definition of these constants is described in [[abi#Handle Constants|Handle Constants]] . Handle arguments with an integer representation of zero are never valid handles.

> [!tip] Rationale

> Many operating systems support a “zero page” that corresponds to the above address range, in which case, implementations will not need to do any runtime checking to ensure the above requirement is satisfied. Ensuring that an integer representation of zero is never a legal handle argument allows the detection of uninitialized data, which may lead to undefined behavior.

All of the constants are specified in [[appLang-Const#Defined Constants|Defined Constants]] .

### Integer Constants

Integer constants fall into groups, where all constants in each group must have unique values. In cases where integer constants are intended to be combined using bitwise logical expressions, there are additional requirements, specified elsewhere (e.g. [[io#Opening a File|Opening a File]] ). A different constraint exists for constants like `MPI_ANY_SOURCE`, which must be negative, because any non-negative integer may be a valid rank.

The MPI ABI reserves all unused values up to 16384 for integer constants, to allow for adding new constants without creating a noncontiguous range. For example, implementations may define their own extensions for [[MPI_COMM_SPLIT_TYPE]] that use non-standard values of the `split_type` argument – these integer constants must exceed 16384.

### Integer Types

MPI defines four special types of integers in C: `MPI_Aint`, `MPI_Offset`, `MPI_Count`, and `MPI_Fint`. The properties of `MPI_Aint` correspond to the C standard integer type `intptr_t`. Thus, `MPI_Aint` should be defined as a C `typedef` to `intptr_t`. In a compilation environment where `intptr_t` is not available, a type with the same properties must be used.

Essentially all filesystems relevant to MPI use 64-bit addressing so the standard ABI defines `MPI_Offset` to be the C standard integer type `int64_t` (or an equivalent type). On systems where `intptr_t` is 32 or 64 bits, `MPI_Count` is the C standard integer type `int64_t` (or an equivalent type).

`MPI_Fint` is discussed in [[abi#The Fortran Application Binary Interface|The Fortran Application Binary Interface]] .

> [!tip] Rationale

> Fixing the size of `MPI_Offset` ensures the standard ABI depends only on the address size and thus is unambiguous on each platform. The need for MPI to support offsets greater than 64 bits implies the possibility of a single MPI file of more than 8 exabytes in size, which is not currently practical. The use of 64-bit MPI offsets does not prevent MPI from supporting 128-bit filesystems.

### Calling Conventions and Binary Representations

ABI compatibility means that the binary object code of the MPI implementation, libraries that use MPI, and the main MPI application program can be linked and executed correctly. The type layouts, symbol names, and calling conventions of MPI routines behave as if they have been compiled with the system C compiler toolchain (as determined, in particular, by the system C runtime library).

> [!note] Advice to users

> Libraries and applications that use MPI may be built with any toolchain they wish, as long as they adhere to these conventions when calling MPI routines. Compiler options that change the size or layout of types, or calling conventions, should be avoided.

## The Fortran Application Binary Interface



Fortran support for the ABI is more complicated than C, because the sizes of `INTEGER`, `REAL`, and `DOUBLE PRECISION` can be changed with compiler options; there is no ABI constancy even with a single Fortran compiler and platform. This flexibility creates a difficult situation for the MPI C ABI because the functions defined in [[binding#Transfer of Handles|Transfer of Handles]] and [[binding#Status|Status]] in the MPI C API depend on the size of `INTEGER` via `MPI_Fint`. As a result, the functions defined in [[binding#Transfer of Handles|Transfer of Handles]] and [[binding#Status|Status]] as well as `MPI_F08_Status` are not part of this ABI. Instead, to support Fortran and other use cases where obtaining an integer associated with an MPI handle is necessary, new functions are added that do not depend on `MPI_Fint`.

MPI applications can discover the size of Fortran types such as `MPI_INTEGER` and `MPI_REAL` using [[MPI_TYPE_SIZE]] . Lack of support in the implementation for optional predefined datatypes is indicated when the type size returned is `MPI_UNDEFINED`.

> [!tip] Rationale

> Prior to the ABI, optional predefined datatypes were not present in the MPI header and modules. When absent, usage would generate compilation errors. The standard ABI must define a value for all predefined datatypes, including the optional ones. Therefore, the absence of optional datatypes must be detected at runtime.

### Fortran Type Registration



In order to decouple MPI Fortran support from the rest of the implementation, there must be a way to inform the implementation of the properties of MPI Fortran datatypes. With this, it is possible to implement MPI Fortran support on top of the MPI C implementation, without the latter having to know the properties of the Fortran environment.

![[API/MPI_ABI_SET_FORTRAN_INFO]]

![[API/MPI_ABI_GET_FORTRAN_INFO]]

[[MPI_ABI_SET_FORTRAN_INFO]] allows the application to inform the implementation of the sizes of Fortran types and whether or not optional types are supported by the Fortran compiler. Before setting this information, the application should get this info object using [[MPI_ABI_GET_FORTRAN_INFO]] . When `MPI_INFO_NULL` is returned, the implementation does not know the properties of the Fortran compiler and they must be set by the application.

Only the first call to [[MPI_ABI_SET_FORTRAN_INFO]] affects the state of the MPI library; all subsequent calls will return the error code `MPI_ERR_ABI`. If a call to [[MPI_ABI_SET_FORTRAN_INFO]] is not successful, the user should call [[MPI_ABI_GET_FORTRAN_INFO]] to determine what Fortran compiler properties were set.

The following keys are predefined for this object:

`mpi_logical_size`:  
The size in bytes of the Fortran default `LOGICAL` kind.

`mpi_integer_size`:  
The size in bytes of the Fortran default `INTEGER` kind.

`mpi_real_size`:  
The size in bytes of the Fortran default `REAL` kind.

`mpi_double_precision_size`:  
The size in bytes of the Fortran `DOUBLE PRECISION` kind.

`mpi_logical1_supported`:  
(boolean) `MPI_LOGICAL1` is supported.

`mpi_logical2_supported`:  
(boolean) `MPI_LOGICAL2` is supported.

`mpi_logical4_supported`:  
(boolean) `MPI_LOGICAL4` is supported.

`mpi_logical8_supported`:  
(boolean) `MPI_LOGICAL8` is supported.

`mpi_logical16_supported`:  
(boolean) `MPI_LOGICAL16` is supported.

`mpi_integer1_supported`:  
(boolean) `MPI_INTEGER1` is supported.

`mpi_integer2_supported`:  
(boolean) `MPI_INTEGER2` is supported.

`mpi_integer4_supported`:  
(boolean) `MPI_INTEGER4` is supported.

`mpi_integer8_supported`:  
(boolean) `MPI_INTEGER8` is supported.

`mpi_integer16_supported`:  
(boolean) `MPI_INTEGER16` is supported.

`mpi_real2_supported`:  
(boolean) `MPI_REAL2` is supported.

`mpi_real4_supported`:  
(boolean) `MPI_REAL4` is supported.

`mpi_real8_supported`:  
(boolean) `MPI_REAL8` is supported.

`mpi_real16_supported`:  
(boolean) `MPI_REAL16` is supported.

`mpi_complex4_supported`:  
(boolean) `MPI_COMPLEX4` is supported.

`mpi_complex8_supported`:  
(boolean) `MPI_COMPLEX8` is supported.

`mpi_complex16_supported`:  
(boolean) `MPI_COMPLEX16` is supported.

`mpi_complex32_supported`:  
(boolean) `MPI_COMPLEX32` is supported.

`mpi_double_complex_supported`:  
(boolean) `MPI_DOUBLE_COMPLEX` is supported.

![[API/MPI_ABI_SET_FORTRAN_BOOLEANS]]

![[API/MPI_ABI_GET_FORTRAN_BOOLEANS]]

[[MPI_ABI_SET_FORTRAN_BOOLEANS]] allows the application to inform the implementation of the literal values of the Fortran booleans. Boolean literals must be passed directly so that they can be observed by the implementation, since it may not be possible to obtain their literal values directly. This function has a size argument to allow it to be called before [[MPI_ABI_SET_FORTRAN_INFO]] . Before setting this information, the application should check if the logical values are already set using [[MPI_ABI_GET_FORTRAN_BOOLEANS]] . When `is_set``= false`, the implementation does not know the properties of the Fortran compiler and they must be set by the application. When `is_set``= true`, the implementation already knows the literal values of the Fortran booleans and they cannot be set. As with [[MPI_ABI_SET_FORTRAN_INFO]] , only the first call to this function affects the state of the MPI library; subsequent calls will return the error code `MPI_ERR_ABI`.

> [!tip] Rationale

> MPI does not assume that Fortran boolean literals follow the C convention (zero is false and non-zero is true).

### The MPI ABI Fortran Modules and Shared Library



The ABI must be implemented using modules named `mpi` and `mpi_f08`. The MPI library that implements the standard ABI must be named `mpifort_abi` and follow all of the requirements stated in [[abi#The MPI ABI Header File and Shared Library|The MPI ABI Header File and Shared Library]] for naming, versioning, and dependencies.

### The Status Object



The MPI status object is defined in Fortran as follows:

``` [MPI]Fortran
integer, parameter :: MPI_STATUS_SIZE = 8
type, bind(C) :: Status
   integer  :: MPI_SOURCE
   integer  :: MPI_TAG
   integer  :: MPI_ERROR
   integer  :: MPI_INTERNAL(5)
end type Status
```

The MPI status object must use exactly eight Fortran `INTEGER` worth of storage.

The following constants can be specified:

``` [MPI]C
#define MPI_F_STATUS_SIZE 8
#define MPI_F_SOURCE      0
#define MPI_F_TAG         1
#define MPI_F_ERROR       2
```

### Integer Constants

As specified elsewhere (Section [[binding#Constants|Constants]] ), constants have the same value in all languages, unless specified otherwise.

The constants `MPI_F_STATUS_IGNORE`, `MPI_F_STATUSES_IGNORE`, `MPI_F08_STATUS_IGNORE` and `MPI_F08_STATUSES_IGNORE` are not specified in the C header file.

> [!tip] Rationale

> Users can obtain the addresses of Fortran sentinels by passing them as arguments to a Fortran function call that is implemented in C.

### Handle Serialization



[[binding#Transfer of Handles|Transfer of Handles]] defines methods for converting handles to integers of the type `MPI_Fint`. In order to provide this functionality without depending on the behavior of the Fortran compiler, new functions that convert handles to and from `int` are necessary. Because these functions depend only on C language features, they are not referred to as C-Fortran conversion functions but handle serialization functions.

In the C ABI, handles are pointers and therefore applications can trivially serialize handles into the type `intptr_t` using a cast, but this does not support use cases where a language integer type is narrower than this.

> [!tip] Rationale

> While it is possible to implement this functionality outside of MPI, e.g. using a lookup table or hash function, it is possible to implement more efficiently within an MPI implementation, particularly if the implementation is already using a limited range of values for C handles. An implementation may also store the integer associated with a C handle, in which case the lookup is trivial.

The function `MPI_Comm_toint` translates a C communicator handle into a C integer. For all predefined handles, the integer value must be the same as the values listed in Section [[appLang-Const#Language Bindings Summary|Language Bindings Summary]] . For user-defined handles, the implementation must return the same integer for every call to this function with the same handle, which does not conflict with the reserved range for predefined handles. It is erroneous to call this function with an invalid handle argument.

The function `MPI_Comm_fromint` translates a C integer to the appropriate C communicator handle. Only an integer obtained from a previous call to `MPI_Comm_toint` may be passed to this function. It is erroneous to pass to this function an integer associated with a handle that has been freed, disconnected, or aborted (or that was derived from a session that has been finalized).

Similar functions are provided for the other types of opaque objects.

Within the context of the ABI, where the layout of the status object is known and representable directly in terms of C `int`, no serialization functionality is necessary.

## Handle Constants



Predefined handle constants are represented as integers in the range 1 to 4095. To make it easy for implementations and tools to decode handle constants, their values are derived from a Huffman code. The Huffman code currently uses the lower 10 bits of the 12 bits allocated above. In the following, we will describe constants in their binary representation, $`0b***_***_***_***`$, where underscores are added for readability. We count bits from the right starting from zero; the rightmost three bits will be denoted $`2:0`$.

Datatypes are the most common type of predefined handle and use the range $`0b00_10_********`$. Bits $`7:3`$ identify the category and the bits $`2:0`$ identify the specific instances thereof. The first set of predefined datatypes are not fixed-sized. While `long` has a fixed size for a given platform ABI, it is not fixed across all platforms. In contrast, types like `int32_t` and `REAL*8` (or its Fortran standard equivalents) have the same size on all platforms. Fixed-sized types allow the implementation to determine the size of the datatype from the predefined handle value itself, without a lookup table.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0010** | **00000** |  | Language-independent types |  |
|  |  | **000** |  | `MPI_DATATYPE_NULL` |
|  |  | **001** |  | `MPI_AINT` |
|  |  | **010** |  | `MPI_COUNT` |
|  |  | **011** |  | `MPI_OFFSET` |
|  |  | **111** |  | `MPI_PACKED` |

Predefined MPI datatype categories and instance values, for types without a specified size. All unassigned values are reserved.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0010** | **00001** |  | C integer types |  |
|  |  | **000** |  | `MPI_SHORT` |
|  |  | **001** |  | `MPI_INT` |
|  |  | **010** |  | `MPI_LONG` |
|  |  | **011** |  | `MPI_LONG_LONG` |
|  |  | **100** |  | `MPI_UNSIGNED_SHORT` |
|  |  | **101** |  | `MPI_UNSIGNED` |
|  |  | **110** |  | `MPI_UNSIGNED_LONG` |
|  |  | **111** |  | `MPI_UNSIGNED_LONG_LONG` |

Predefined MPI datatype categories and instance values, for types without a specified size. All unassigned values are reserved.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0010** | **00010** |  | C/C++ floating- |  |
|  |  |  | point types |  |
|  |  | **000** |  | `MPI_FLOAT` |
|  |  | **001** |  | `MPI_C_FLOAT_COMPLEX` |
|  |  | **010** |  | `MPI_CXX_FLOAT_COMPLEX` |
|  |  | **100** |  | `MPI_DOUBLE` |
|  |  | **101** |  | `MPI_C_DOUBLE_COMPLEX` |
|  |  | **110** |  | `MPI_CXX_DOUBLE_COMPLEX` |

Predefined MPI datatype categories and instance values, for types without a specified width. All unassigned values are reserved.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0010** | **00011** |  | Fortran types |  |
|  |  | **000** |  | `MPI_LOGICAL` |
|  |  | **001** |  | `MPI_INTEGER` |
|  |  | **010** |  | `MPI_REAL` |
|  |  | **011** |  | `MPI_COMPLEX` |
|  |  | **100** |  | `MPI_DOUBLE_PRECISION` |
|  |  | **101** |  | `MPI_DOUBLE_COMPLEX` |
|  |  | **110** |  | `MPI_CHARACTER` |

Predefined MPI datatype categories and instance values, for types without a specified width. All unassigned values are reserved.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0010** | **00100** |  | Long double |  |
|  |  |  | types |  |
|  |  | **000** |  | `MPI_LONG_DOUBLE` |
|  |  | **100** |  | `MPI_C_LONG_DOUBLE_COMPLEX` |
|  |  | **101** |  | `MPI_CXX_LONG_DOUBLE_COMPLEX` |

Predefined MPI datatype categories and instance values, for types without a specified width. All unassigned values are reserved.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0010** | **00101** |  | C pair types |  |
|  |  | **000** |  | `MPI_FLOAT_INT` |
|  |  | **001** |  | `MPI_DOUBLE_INT` |
|  |  | **010** |  | `MPI_LONG_INT` |
|  |  | **011** |  | `MPI_2INT` |
|  |  | **100** |  | `MPI_SHORT_INT` |
|  |  | **101** |  | `MPI_LONG_DOUBLE_INT` |
| **0010** | **00110** |  | Fortran pair types |  |
|  |  | **000** |  | `MPI_2REAL` |
|  |  | **001** |  | `MPI_2DOUBLE_PRECISION` |
|  |  | **010** |  | `MPI_2INTEGER` |

Predefined MPI datatype categories and instance values, for types without a specified width. All unassigned values are reserved.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0010** | **00111** |  | Other C/C++ types |  |
|  |  | **000** |  | `MPI_C_BOOL` |
|  |  | **001** |  | `MPI_CXX_BOOL` |
|  |  | **100** |  | `MPI_WCHAR` |

Predefined MPI datatype categories and instance values, for types without a specified width. All unassigned values are reserved.

The Huffman code for fixed-size types encodes the base-2 logarithm of the type size in bits $`5:3`$. Implemenations can identify datatypes with fixed-size using bit $`6`$.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0010** | **01000** |  | 1-byte C/C++ types |  |
|  |  | **000** |  | `MPI_INT8_T` |
|  |  | **001** |  | `MPI_UINT8_T` |
|  |  | **011** |  | `MPI_CHAR` |
|  |  | **100** |  | `MPI_SIGNED_CHAR` |
|  |  | **101** |  | `MPI_UNSIGNED_CHAR` |
|  |  | **111** |  | `MPI_BYTE` |
| **0010** | **01001** |  | 2-byte C/C++ types |  |
|  |  | **000** |  | `MPI_INT16_T` |
|  |  | **001** |  | `MPI_UINT16_T` |
| **0010** | **01010** |  | 4-byte C/C++ types |  |
|  |  | **000** |  | `MPI_INT32_T` |
|  |  | **001** |  | `MPI_UINT32_T` |
| **0010** | **01011** |  | 8-byte C/C++ types |  |
|  |  | **000** |  | `MPI_INT64_T` |
|  |  | **001** |  | `MPI_UINT64_T` |

Predefined MPI datatype categories and instance values, for types with a specified width. All unassigned values are reserved.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0010** | **11000** |  | 1-byte Fortran types |  |
|  |  | **000** |  | `MPI_LOGICAL1` |
|  |  | **001** |  | `MPI_INTEGER1` |
| **0010** | **11001** |  | 2-byte Fortran types |  |
|  |  | **000** |  | `MPI_LOGICAL2` |
|  |  | **001** |  | `MPI_INTEGER2` |
|  |  | **010** |  | `MPI_REAL2` |
| **0010** | **11010** |  | 4-byte Fortran types |  |
|  |  | **000** |  | `MPI_LOGICAL4` |
|  |  | **001** |  | `MPI_INTEGER4` |
|  |  | **010** |  | `MPI_REAL4` |
|  |  | **011** |  | `MPI_COMPLEX4` |
| **0010** | **11011** |  | 8-byte Fortran types |  |
|  |  | **000** |  | `MPI_LOGICAL8` |
|  |  | **001** |  | `MPI_INTEGER8` |
|  |  | **010** |  | `MPI_REAL8` |
|  |  | **011** |  | `MPI_COMPLEX8` |
| **0010** | **11100** |  | 16-byte Fortran types |  |
|  |  | **000** |  | `MPI_LOGICAL16` |
|  |  | **001** |  | `MPI_INTEGER16` |
|  |  | **010** |  | `MPI_REAL16` |
|  |  | **011** |  | `MPI_COMPLEX16` |
| **0010** | **11101** |  | 32-byte Fortran types |  |
|  |  | **011** |  | `MPI_COMPLEX32` |

Predefined MPI datatype categories and instance values, for types with a specified width. All unassigned values are reserved.

Reduction operators use the range $`0b00_00_001_*****`$ and the predefined values fall into four categories: arithmetic, bit-wise, logical, and other.

All other predefined handles use the range $`0b00_01_********`$. In general, predefined null handles have all zero bits other than those required to detect the handle type.



| **Bits $`11:5`$** | **Bits $`4:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0000001** | **00** |  | Arithmetic operations |  |
|  |  | **000** |  | `MPI_OP_NULL` |
|  |  | **001** |  | `MPI_SUM` |
|  |  | **010** |  | `MPI_MIN` |
|  |  | **011** |  | `MPI_MAX` |
|  |  | **100** |  | `MPI_PROD` |
| **0000001** | **01** |  | Bit operations |  |
|  |  | **000** |  | `MPI_BAND` |
|  |  | **001** |  | `MPI_BOR` |
|  |  | **010** |  | `MPI_BXOR` |
| **0000001** | **10** |  | Logical operations |  |
|  |  | **000** |  | `MPI_LAND` |
|  |  | **001** |  | `MPI_LOR` |
|  |  | **010** |  | `MPI_LXOR` |
| **0000001** | **11** |  | Other operations |  |
|  |  | **000** |  | `MPI_MINLOC` |
|  |  | **001** |  | `MPI_MAXLOC` |
|  |  | **100** |  | `MPI_REPLACE` |
|  |  | **101** |  | `MPI_NO_OP` |

Predefined `MPI_Op` categories and instance values. All unassigned values are reserved.



| **Bits $`11:8`$** | **Bits $`7:3`$** | **Bits $`2:0`$** | **Category** | **Instance** |
|:---|:---|:---|:---|:---|
| **0001** | **00000** |  | Communicators |  |
|  |  | **000** |  | `MPI_COMM_NULL` |
|  |  | **001** |  | `MPI_COMM_WORLD` |
|  |  | **010** |  | `MPI_COMM_SELF` |
| **0001** | **00001** |  | Group |  |
|  |  | **000** |  | `MPI_GROUP_NULL` |
|  |  | **001** |  | `MPI_GROUP_EMPTY` |
| **0001** | **00010** |  | Windows |  |
|  |  | **000** |  | `MPI_WIN_NULL` |
| **0001** | **00011** |  | Files |  |
|  |  | **000** |  | `MPI_FILE_NULL` |
| **0001** | **00100** |  | Sessions |  |
|  |  | **000** |  | `MPI_SESSION_NULL` |
| **0001** | **00101** |  | Messages |  |
|  |  | **000** |  | `MPI_MESSAGE_NULL` |
|  |  | **001** |  | `MPI_MESSAGE_NO_PROC` |
| **0001** | **00110** |  | Info |  |
|  |  | **000** |  | `MPI_INFO_NULL` |
|  |  | **001** |  | `MPI_INFO_ENV` |
| **0001** | **01000** |  | Errhandlers |  |
|  |  | **000** |  | `MPI_ERRHANDLER_NULL` |
|  |  | **001** |  | `MPI_ERRORS_ARE_FATAL` |
|  |  | **010** |  | `MPI_ERRORS_RETURN` |
|  |  | **011** |  | `MPI_ERRORS_ABORT` |
| **0001** | **10000** |  | Requests |  |
|  |  | **000** |  | `MPI_REQUEST_NULL` |

Predefined MPI handle categories and instance values. All unassigned values are reserved.


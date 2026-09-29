---
title: "External Data Representation: `external32`"
chapter: io
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# External Data Representation: `external32`

Chapter **io** · in [[versions/v40/sections/io#External Data Representation: `external32`|MPI-4.0]], [[versions/v41/sections/io#External Data Representation: `external32`|MPI-4.1]], [[versions/v50/sections/io#External Data Representation: `external32`|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (4 changed paragraphs)

~~Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double,” and “Double Extended” formats, requiring 4, 8 and 16 bytes of storage, respectively. For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits, bias = +10383, 112 fraction bits, and an encoding analogous to the “Double” format.~~

==Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double,” and “Double Extended” formats, requiring 4, 8 and 16 bytes of storage, respectively. For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits,==

==bias = +16383,==

==112 fraction bits, and an encoding analogous to the “Double” format.==

~~All data items are stored contiguously in the file.~~

==All data items are stored contiguously in the file==

==(if the file view is contiguous).==

~~            Type                  Length             ------------------    ------             MPI_PACKED                1             MPI_BYTE                  1             MPI_CHAR                  1             MPI_UNSIGNED_CHAR         1             MPI_SIGNED_CHAR           1             MPI_WCHAR                 2             MPI_SHORT                 2             MPI_UNSIGNED_SHORT        2             MPI_INT                   4             MPI_UNSIGNED              4             MPI_LONG                  4             MPI_UNSIGNED_LONG         4             MPI_FLOAT                 4             MPI_DOUBLE                8             MPI_LONG_DOUBLE          16~~

~~            MPI_CHARACTER             1             MPI_LOGICAL               4             MPI_INTEGER               4             MPI_REAL                  4             MPI_DOUBLE_PRECISION      8             MPI_COMPLEX             2*4             MPI_DOUBLE_COMPLEX      2*8~~

~~            Optional Type         Length             ------------------    ------             MPI_INTEGER1              1             MPI_INTEGER2              2             MPI_INTEGER4              4             MPI_INTEGER8              8             MPI_LONG_LONG             8             MPI_UNSIGNED_LONG_LONG    8~~

~~            MPI_REAL4                 4             MPI_REAL8                 8             MPI_REAL16               16~~

==            Type                  Length             ------------------    ------             MPI_PACKED                1             MPI_BYTE                  1             MPI_CHAR                  1             MPI_UNSIGNED_CHAR         1             MPI_SIGNED_CHAR           1             MPI_WCHAR                 2             MPI_SHORT                 2             MPI_UNSIGNED_SHORT        2             MPI_INT                   4             MPI_UNSIGNED              4             MPI_LONG                  4             MPI_UNSIGNED_LONG         4             MPI_LONG_LONG_INT         8             MPI_UNSIGNED_LONG_LONG    8             MPI_FLOAT                 4             MPI_DOUBLE                8             MPI_LONG_DOUBLE          16             MPI_CHARACTER             1             MPI_LOGICAL               4             MPI_INTEGER               4             MPI_REAL                  4             MPI_DOUBLE_PRECISION      8             MPI_COMPLEX             2*4             MPI_DOUBLE_COMPLEX      2*8             Optional Type         Length             ------------------    ------             MPI_INTEGER1              1             MPI_INTEGER2              2             MPI_INTEGER4              4             MPI_INTEGER8              8             MPI_REAL4                 4             MPI_REAL8                 8             MPI_REAL16               16==

==Table [[versions/v21/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] specifies the sizes of predefined datatypes in “external32” format.==

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

Support of optional datatypes (e.g., ~~MPI_INTEGER2)~~ ==`MPI_INTEGER2`)== is not required.

~~All integral values are in two’s complement big-endian format. Big-endian means most significant byte at lowest address byte. For Fortran `LOGICAL` and C++ `bool`, `0` implies false and nonzero implies true. Fortran `COMPLEX` and `DOUBLE COMPLEX` are represented by a pair of floating point format values for the real and imaginary components. Characters are in ISO 8859-1 format .~~

~~Wide characters (of type MPI_WCHAR) are in Unicode format .~~

~~All signed numerals (e.g., MPI_INT, MPI_REAL)~~

~~have the sign bit at the most significant bit. MPI_COMPLEX and MPI_DOUBLE_COMPLEX have the sign bit of the real and imaginary parts at the most significant bit of each part.~~

==All integral values are in two’s complement big-endian format. Big-endian means most significant byte at lowest address byte.==

==For C `_Bool`, Fortran `LOGICAL` and C++ `bool`, `0` implies false and nonzero implies true. C `float _Complex`, `double _Complex` and `long double _Complex` as well as Fortran `COMPLEX` and `DOUBLE COMPLEX` are represented by a pair of floating point format values for the real and imaginary components.==

==Characters are in ISO 8859-1 format .==

==Wide characters (of type `MPI_WCHAR`) are in Unicode format .==

==All signed numerals (e.g., `MPI_INT`, `MPI_REAL`)==

==have the sign bit at the most significant bit. `MPI_COMPLEX` and `MPI_DOUBLE_COMPLEX` have the sign bit of the real and imaginary parts at the most significant bit of each part.==

> The type ~~MPI_PACKED~~ ==`MPI_PACKED`== is treated as bytes and is not converted. The user should be aware that `MPI_PACK` has the option of placing a header in the beginning of the pack buffer.

==Type Length Optional== Type Length ------------------ ------ ==------------------ ------== MPI_PACKED ==1 MPI_INTEGER1== 1 MPI_BYTE 1 ==MPI_INTEGER2 2== MPI_CHAR 1 ==MPI_INTEGER4 4== MPI_UNSIGNED_CHAR 1 ==MPI_INTEGER8 8== MPI_SIGNED_CHAR 1 ==MPI_INTEGER16 16== MPI_WCHAR 2 MPI_SHORT 2 ==MPI_REAL2 2== MPI_UNSIGNED_SHORT 2 ==MPI_REAL4 4== MPI_INT 4 ==MPI_REAL8 8== MPI_UNSIGNED 4 ==MPI_REAL16 16== MPI_LONG 4 MPI_UNSIGNED_LONG 4 ==MPI_COMPLEX4 2*2== MPI_LONG_LONG_INT 8 ==MPI_COMPLEX8 2*4== MPI_UNSIGNED_LONG_LONG 8 ==MPI_COMPLEX16 2*8== MPI_FLOAT 4 ==MPI_COMPLEX32 2*16== MPI_DOUBLE 8 MPI_LONG_DOUBLE 16 ==MPI_C_BOOL 4 MPI_INT8_T 1 MPI_INT16_T 2 MPI_INT32_T 4 MPI_INT64_T 8 MPI_UINT8_T 1 MPI_UINT16_T 2 MPI_UINT32_T 4 MPI_UINT64_T 8 MPI_AINT 8 MPI_OFFSET 8 MPI_C_COMPLEX 2*4 MPI_C_FLOAT_COMPLEX 2*4 MPI_C_DOUBLE_COMPLEX 2*8 MPI_C_LONG_DOUBLE_COMPLEX 2*16== MPI_CHARACTER 1 MPI_LOGICAL 4 MPI_INTEGER 4 MPI_REAL 4 MPI_DOUBLE_PRECISION 8 MPI_COMPLEX 2*4 MPI_DOUBLE_COMPLEX 2*8 ~~Optional Type Length ------------------ ------ MPI_INTEGER1 1 MPI_INTEGER2 2 MPI_INTEGER4 4 MPI_INTEGER8 8 MPI_REAL4 4 MPI_REAL8 8 MPI_REAL16 16~~

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~All MPI implementations are required to support the data representation defined in this section.~~

~~Support of optional datatypes (e.g., `MPI_INTEGER2`) is not required.~~

~~All floating point values are in big-endian IEEE format of the appropriate size.~~

~~Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double,” and “Double Extended” formats, requiring 4, 8 and 16 bytes of storage, respectively. For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits,~~

~~bias = +16383,~~

~~112 fraction bits, and an encoding analogous to the “Double” format.~~

~~All integral values are in two’s complement big-endian format. Big-endian means most significant byte at lowest address byte.~~

~~For C `_Bool`, Fortran `LOGICAL` and C++ `bool`, `0` implies false and nonzero implies true. C `float _Complex`, `double _Complex` and `long double _Complex` as well as Fortran `COMPLEX` and `DOUBLE COMPLEX` are represented by a pair of floating point format values for the real and imaginary components.~~

~~Characters are in ISO 8859-1 format .~~

~~Wide characters (of type `MPI_WCHAR`) are in Unicode format .~~

==All MPI implementations are required to support the data representation defined in this section. Support of optional datatypes (e.g., `MPI_INTEGER2`) is not required.==

==All floating point values are in big-endian IEEE format of the appropriate size. Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double,” and “Double Extended” formats, requiring 4, 8, and 16 bytes of storage, respectively. For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits,==

==bias = +16383, 112 fraction bits, and an encoding analogous to the “Double” format. All integral values are in two’s complement big-endian format. Big-endian means most significant byte at lowest address byte. For C `_Bool`, Fortran `LOGICAL`, and C++ `bool`, `0` implies false and nonzero implies true. C `float _Complex`, `double _Complex`, and `long double _Complex`, Fortran `COMPLEX` and `DOUBLE COMPLEX`, and other complex types are represented by a pair of floating point format values for the real and imaginary components. Characters are in ISO 8859-1 format . Wide characters (of type `MPI_WCHAR`) are in Unicode format .==

~~All data is byte aligned, regardless of type.~~

~~All data items are stored contiguously in the file~~

~~(if the file view is contiguous).~~

==All data is byte aligned, regardless of type. All data items are stored contiguously in the file (if the file view is contiguous).==

Type Length Optional Type Length ------------------ ------ ------------------ ------ MPI_PACKED 1 MPI_INTEGER1 1 MPI_BYTE 1 MPI_INTEGER2 2 MPI_CHAR 1 MPI_INTEGER4 4 MPI_UNSIGNED_CHAR 1 MPI_INTEGER8 8 MPI_SIGNED_CHAR 1 MPI_INTEGER16 16 MPI_WCHAR 2 MPI_SHORT 2 MPI_REAL2 2 MPI_UNSIGNED_SHORT 2 MPI_REAL4 4 MPI_INT 4 MPI_REAL8 8 MPI_UNSIGNED 4 MPI_REAL16 16 MPI_LONG 4 MPI_UNSIGNED_LONG 4 MPI_COMPLEX4 2*2 MPI_LONG_LONG_INT 8 MPI_COMPLEX8 2*4 MPI_UNSIGNED_LONG_LONG 8 MPI_COMPLEX16 2*8 MPI_FLOAT 4 MPI_COMPLEX32 2*16 MPI_DOUBLE 8 MPI_LONG_DOUBLE 16 MPI_C_BOOL ~~4~~ ==1== MPI_INT8_T 1 ==C++ Types Length== MPI_INT16_T 2 ==------------------ ------== MPI_INT32_T 4 ==MPI_CXX_BOOL 1== MPI_INT64_T 8 ==MPI_CXX_FLOAT_COMPLEX 2*4== MPI_UINT8_T 1 ==MPI_CXX_DOUBLE_COMPLEX 2*8== MPI_UINT16_T 2 ==MPI_CXX_LONG_DOUBLE_COMPLEX 2*16== MPI_UINT32_T 4 MPI_UINT64_T 8 MPI_AINT ==8 MPI_COUNT== 8 MPI_OFFSET 8 MPI_C_COMPLEX 2*4 MPI_C_FLOAT_COMPLEX 2*4 MPI_C_DOUBLE_COMPLEX 2*8 MPI_C_LONG_DOUBLE_COMPLEX 2*16 MPI_CHARACTER 1 MPI_LOGICAL 4 MPI_INTEGER 4 MPI_REAL 4 MPI_DOUBLE_PRECISION 8 MPI_COMPLEX 2*4 MPI_DOUBLE_COMPLEX 2*8

The ~~size~~ ==sizes== of the predefined datatypes returned from [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] , [[versions/v30/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] , and [[versions/v30/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] are defined in Section [[f90-types]] , page [[f90-kind-external32]] .

> When converting a larger size integer to a smaller size integer, only the ~~less~~ ==least== significant bytes are moved. Care must be taken to preserve the sign bit value. This allows no conversion errors if the data range is within the range of the smaller size integer.

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~All floating point values are in big-endian IEEE format of the appropriate size. Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double,” and “Double Extended” formats, requiring 4, 8, and 16 bytes of storage, respectively. For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits,~~

~~bias = +16383, 112 fraction bits, and an encoding analogous to the “Double” format. All integral values are in two’s complement big-endian format. Big-endian means most significant byte at lowest address byte. For C `_Bool`, Fortran `LOGICAL`, and C++ `bool`, `0` implies false and nonzero implies true. C `float _Complex`, `double _Complex`, and `long double _Complex`, Fortran `COMPLEX` and `DOUBLE COMPLEX`, and other complex types are represented by a pair of floating point format values for the real and imaginary components. Characters are in ISO 8859-1 format . Wide characters (of type `MPI_WCHAR`) are in Unicode format .~~

~~All signed numerals (e.g., `MPI_INT`, `MPI_REAL`)~~

~~have the sign bit at the most significant bit. `MPI_COMPLEX` and `MPI_DOUBLE_COMPLEX` have the sign bit of the real and imaginary parts at the most significant bit of each part.~~

==All floating point values are in big-endian IEEE format of the appropriate size. Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double,” and “Double Extended” formats, requiring 4, 8, and 16 bytes of storage, respectively. For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits, bias = +16383, 112 fraction bits, and an encoding analogous to the “Double” format. All integral values are in two’s complement big-endian format. Big-endian means most significant byte at lowest address byte. For C `_Bool`, Fortran `LOGICAL`, and C++ `bool`, `0` implies false and nonzero implies true. C `float _Complex`, `double _Complex`, and `long double _Complex`, Fortran `COMPLEX` and `DOUBLE COMPLEX`, and other complex types are represented by a pair of floating point format values for the real and imaginary components. Characters are in ISO 8859-1 format . Wide characters (of type `MPI_WCHAR`) are in Unicode format .==

==All signed numerals (e.g., `MPI_INT`, `MPI_REAL`) have the sign bit at the most significant bit. `MPI_COMPLEX` and `MPI_DOUBLE_COMPLEX` have the sign bit of the real and imaginary parts at the most significant bit of each part.==

> The type `MPI_PACKED` is treated as bytes and is not converted. The user should be aware that ~~`MPI_PACK`~~ ==[[versions/v31/API/MPI_PACK|MPI_PACK]]== has the option of placing a header in the beginning of the pack buffer.

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

All floating point values are in big-endian IEEE format of the appropriate size. Floating point values are represented by one of three IEEE formats. These are the IEEE ~~“Single,” “Double,”~~ ==“Single (binary32),” “Double (binary64),”== and “Double ~~Extended”~~ ==Extended (binary128)”== formats, requiring 4, 8, and 16 bytes of storage, respectively. For the IEEE “Double ~~Extended”~~ ==Extended (binary128)”== formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits, bias = +16383, 112 fraction bits, and an encoding analogous to the ~~“Double”~~ ==“Double (binary64)”== format. All integral values are in two’s complement big-endian format. Big-endian means most significant byte at lowest address byte. For C `_Bool`, Fortran `LOGICAL`, and C++ `bool`, `0` implies false and nonzero implies true. C `float _Complex`, `double _Complex`, and `long double _Complex`, Fortran `COMPLEX` and `DOUBLE COMPLEX`, and other complex types are represented by a pair of floating point format values for the real and imaginary components. Characters are in ISO 8859-1 format . Wide characters (of type `MPI_WCHAR`) are in Unicode format .

> The MPI treatment of “NaN” is similar to the approach used in XDR ~~(see ftp://ds.internic.net/rfc/rfc1832.txt).~~ ==.==

~~    Type                      Length         Optional Type             Length      ------------------        ------         ------------------        ------      MPI_PACKED                    1          MPI_INTEGER1                  1       MPI_BYTE                      1          MPI_INTEGER2                  2       MPI_CHAR                      1          MPI_INTEGER4                  4       MPI_UNSIGNED_CHAR             1          MPI_INTEGER8                  8       MPI_SIGNED_CHAR               1          MPI_INTEGER16                16       MPI_WCHAR                     2                                                MPI_SHORT                     2          MPI_REAL2                     2       MPI_UNSIGNED_SHORT            2          MPI_REAL4                     4       MPI_INT                       4          MPI_REAL8                     8       MPI_UNSIGNED                  4          MPI_REAL16                   16       MPI_LONG                      4                                                MPI_UNSIGNED_LONG             4          MPI_COMPLEX4                2*2       MPI_LONG_LONG_INT             8          MPI_COMPLEX8                2*4       MPI_UNSIGNED_LONG_LONG        8          MPI_COMPLEX16               2*8       MPI_FLOAT                     4          MPI_COMPLEX32              2*16       MPI_DOUBLE                    8                MPI_LONG_DOUBLE              16                MPI_C_BOOL                    1     MPI_INT8_T                    1          C++ Types                 Length     MPI_INT16_T                   2          ------------------        ------     MPI_INT32_T                   4          MPI_CXX_BOOL                   1     MPI_INT64_T                   8          MPI_CXX_FLOAT_COMPLEX        2*4     MPI_UINT8_T                   1          MPI_CXX_DOUBLE_COMPLEX       2*8     MPI_UINT16_T                  2          MPI_CXX_LONG_DOUBLE_COMPLEX 2*16     MPI_UINT32_T                  4     MPI_UINT64_T                  8     MPI_AINT                      8     MPI_COUNT                     8     MPI_OFFSET                    8     MPI_C_COMPLEX               2*4     MPI_C_FLOAT_COMPLEX         2*4     MPI_C_DOUBLE_COMPLEX        2*8     MPI_C_LONG_DOUBLE_COMPLEX  2*16      MPI_CHARACTER                 1     MPI_LOGICAL                   4     MPI_INTEGER                   4     MPI_REAL                      4     MPI_DOUBLE_PRECISION          8     MPI_COMPLEX                 2*4     MPI_DOUBLE_COMPLEX          2*8~~

==| Predefined Type               | Length | |:------------------------------|:-------| | `MPI_PACKED`                  | 1      | | `MPI_BYTE`                    | 1      | | `MPI_CHAR`                    | 1      | | `MPI_UNSIGNED_CHAR`           | 1      | | `MPI_SIGNED_CHAR`             | 1      | | `MPI_WCHAR`                   | 2      | | `MPI_SHORT`                   | 2      | | `MPI_UNSIGNED_SHORT`          | 2      | | `MPI_INT`                     | 4      | | `MPI_LONG`                    | 4      | | `MPI_UNSIGNED`                | 4      | | `MPI_UNSIGNED_LONG`           | 4      | | `MPI_LONG_LONG_INT`           | 8      | | `MPI_UNSIGNED_LONG_LONG`      | 8      | | `MPI_FLOAT`                   | 4      | | `MPI_DOUBLE`                  | 8      | | `MPI_LONG_DOUBLE`             | 16     | | `MPI_C_BOOL`                  | 1      | | `MPI_INT8_T`                  | 1      | | `MPI_INT16_T`                 | 2      | | `MPI_INT32_T`                 | 4      | | `MPI_INT64_T`                 | 8      | | `MPI_UINT8_T`                 | 1      | | `MPI_UINT16_T`                | 2      | | `MPI_UINT32_T`                | 4      | | `MPI_UINT64_T`                | 8      | | `MPI_AINT`                    | 8      | | `MPI_COUNT`                   | 8      | | `MPI_OFFSET`                  | 8      | | `MPI_C_COMPLEX`               | 2\*4   | | `MPI_C_FLOAT_COMPLEX`         | 2\*4   | | `MPI_C_DOUBLE_COMPLEX`        | 2\*8   | | `MPI_C_LONG_DOUBLE_COMPLEX`   | 2\*16  | | `MPI_CHARACTER`               | 1      | | `MPI_LOGICAL`                 | 4      | | `MPI_INTEGER`                 | 4      | | `MPI_REAL`                    | 4      | | `MPI_DOUBLE_PRECISION`        | 8      | | `MPI_COMPLEX`                 | 2\*4   | | `MPI_DOUBLE_COMPLEX`          | 2\*8   | | `MPI_CXX_BOOL`                | 1      | | `MPI_CXX_FLOAT_COMPLEX`       | 2\*4   | | `MPI_CXX_DOUBLE_COMPLEX`      | 2\*8   | | `MPI_CXX_LONG_DOUBLE_COMPLEX` | 2\*16  |==

==`external32` sizes of predefined datatypes==

==\|l\|l\| Predefined Type & Length\ `MPI_INTEGER1` & 1\ `MPI_INTEGER2` & 2  `MPI_INTEGER4` & 4\ `MPI_INTEGER8` & 8\ `MPI_INTEGER16` & 16\ `MPI_REAL2` & 2\ `MPI_REAL4` & 4\ `MPI_REAL8` & 8\ `MPI_REAL16` & 16\ `MPI_COMPLEX4` & 2\*2\ `MPI_COMPLEX8` & 2\*4\ `MPI_COMPLEX16` & 2\*8\ `MPI_COMPLEX32` & 2\*16\==

==| C++ Types                     | Length | |:------------------------------|:-------| | `MPI_CXX_BOOL`                | 1      | | `MPI_CXX_FLOAT_COMPLEX`       | 2\*4   | | `MPI_CXX_DOUBLE_COMPLEX`      | 2\*8   | | `MPI_CXX_LONG_DOUBLE_COMPLEX` | 2\*16  |==

==`external32` sizes of C++ datatypes==

Table [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]] specifies~~ ==external32]] , [[versions/v40/sections/io#External Data Representation: external32|External Data Representation: external32]] , and [[versions/v40/sections/io#External Data Representation: external32|External Data Representation: external32]] specify== the sizes of ~~predefined~~ ==predefined, optional, and C++== datatypes in ~~“external32” format.~~ ==`external32` format, respectively.==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

All floating point values are in big-endian IEEE format of the appropriate size. Floating point values are represented by one of three IEEE formats. These are the IEEE “Single (binary32),” “Double (binary64),” and “Double Extended (binary128)” formats, requiring 4, 8, and 16 bytes of storage, respectively. For the IEEE “Double Extended (binary128)” formats, MPI specifies a ~~Format Width~~ ==format width== of 16 bytes, with 15 exponent bits, bias = +16383, 112 fraction bits, and an encoding analogous to the “Double (binary64)” format. All integral values are in two’s complement big-endian format. Big-endian means most significant byte at lowest address byte. For C `_Bool`, Fortran `LOGICAL`, and C++ `bool`, `0` implies false and nonzero implies true. C `float _Complex`, `double _Complex`, and `long double _Complex`, Fortran `COMPLEX` and `DOUBLE COMPLEX`, and other complex types are represented by a pair of floating point format values for the real and imaginary components. Characters are in ISO 8859-1 format . Wide characters (of type `MPI_WCHAR`) are in Unicode format .

| ~~Predefined Type~~ ==**Predefined Type**== | ~~Length~~ ==**Length**== | ~~|:------------------------------|:-------|~~ ==|:------------------------------|:-----------|== | `MPI_PACKED` | 1 | | `MPI_BYTE` | 1 | | `MPI_CHAR` | 1 | | `MPI_UNSIGNED_CHAR` | 1 | | `MPI_SIGNED_CHAR` | 1 | | `MPI_WCHAR` | 2 | | `MPI_SHORT` | 2 | | `MPI_UNSIGNED_SHORT` | 2 | | `MPI_INT` | 4 | | `MPI_LONG` | 4 | | `MPI_UNSIGNED` | 4 | | `MPI_UNSIGNED_LONG` | 4 | | `MPI_LONG_LONG_INT` | 8 | | `MPI_UNSIGNED_LONG_LONG` | 8 | | `MPI_FLOAT` | 4 | | `MPI_DOUBLE` | 8 | | `MPI_LONG_DOUBLE` | 16 | | `MPI_C_BOOL` | 1 | | `MPI_INT8_T` | 1 | | `MPI_INT16_T` | 2 | | `MPI_INT32_T` | 4 | | `MPI_INT64_T` | 8 | | `MPI_UINT8_T` | 1 | | `MPI_UINT16_T` | 2 | | `MPI_UINT32_T` | 4 | | `MPI_UINT64_T` | 8 | | `MPI_AINT` | 8 | | `MPI_COUNT` | 8 | | `MPI_OFFSET` | 8 | | `MPI_C_COMPLEX` | 2\*4 | | `MPI_C_FLOAT_COMPLEX` | 2\*4 | | `MPI_C_DOUBLE_COMPLEX` | 2\*8 | | `MPI_C_LONG_DOUBLE_COMPLEX` | 2\*16 | | `MPI_CHARACTER` | 1 | | `MPI_LOGICAL` | 4 | | `MPI_INTEGER` | 4 | | `MPI_REAL` | 4 | | `MPI_DOUBLE_PRECISION` | 8 | | `MPI_COMPLEX` | 2\*4 | | `MPI_DOUBLE_COMPLEX` | 2\*8 | | `MPI_CXX_BOOL` | 1 | | `MPI_CXX_FLOAT_COMPLEX` | 2\*4 | | `MPI_CXX_DOUBLE_COMPLEX` | 2\*8 | | `MPI_CXX_LONG_DOUBLE_COMPLEX` | 2\*16 |

~~\|l\|l\| Predefined Type & Length\ `MPI_INTEGER1` & 1\ `MPI_INTEGER2` & 2  `MPI_INTEGER4` & 4\ `MPI_INTEGER8` & 8\ `MPI_INTEGER16` & 16\ `MPI_REAL2` & 2\ `MPI_REAL4` & 4\ `MPI_REAL8` & 8\ `MPI_REAL16` & 16\ `MPI_COMPLEX4` & 2\*2\ `MPI_COMPLEX8` & 2\*4\ `MPI_COMPLEX16` & 2\*8\ `MPI_COMPLEX32` & 2\*16\~~

~~| C++ Types                     | Length | |:------------------------------|:-------| | `MPI_CXX_BOOL`                | 1      | | `MPI_CXX_FLOAT_COMPLEX`       | 2\*4   | | `MPI_CXX_DOUBLE_COMPLEX`      | 2\*8   | | `MPI_CXX_LONG_DOUBLE_COMPLEX` | 2\*16  |~~

==| **Predefined Type** | **Length** | |:--------------------|:-----------| | `MPI_INTEGER1`      | 1          | | `MPI_INTEGER2`      | 2          | | `MPI_INTEGER4`      | 4          | | `MPI_INTEGER8`      | 8          | | `MPI_INTEGER16`     | 16         | | `MPI_REAL2`         | 2          | | `MPI_REAL4`         | 4          | | `MPI_REAL8`         | 8          | | `MPI_REAL16`        | 16         | | `MPI_COMPLEX4`      | 2\*2       | | `MPI_COMPLEX8`      | 2\*4       | | `MPI_COMPLEX16`     | 2\*8       | | `MPI_COMPLEX32`     | 2\*16      |==

==`external32` sizes of optional datatypes==

==| **C++ Types**                 | **Length** | |:------------------------------|:-----------| | `MPI_CXX_BOOL`                | 1          | | `MPI_CXX_FLOAT_COMPLEX`       | 2\*4       | | `MPI_CXX_DOUBLE_COMPLEX`      | 2\*8       | | `MPI_CXX_LONG_DOUBLE_COMPLEX` | 2\*16      |==

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

| **Predefined Type** | **Length** | |:--------------------|:-----------| | `MPI_INTEGER1` | 1 | | `MPI_INTEGER2` | 2 | | `MPI_INTEGER4` | 4 | | `MPI_INTEGER8` | 8 | | `MPI_INTEGER16` ==| 16 | | `MPI_LOGICAL1` | 1 | | `MPI_LOGICAL2` | 2 | | `MPI_LOGICAL4` | 4 | | `MPI_LOGICAL8` | 8 | | `MPI_LOGICAL16`== | 16 | | `MPI_REAL2` | 2 | | `MPI_REAL4` | 4 | | `MPI_REAL8` | 8 | | `MPI_REAL16` | 16 | | `MPI_COMPLEX4` | 2\*2 | | `MPI_COMPLEX8` | 2\*4 | | `MPI_COMPLEX16` | 2\*8 | | `MPI_COMPLEX32` | 2\*16 |

~~Table~~ ==Tables== [[versions/v50/sections/io#External Data Representation: external32|External Data Representation: external32]] , [[versions/v50/sections/io#External Data Representation: external32|External Data Representation: external32]] , and [[versions/v50/sections/io#External Data Representation: external32|External Data Representation: external32]] specify the sizes of predefined, optional, and C++ datatypes in `external32` format, respectively.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#External Data Representation: `external32`]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#External Data Representation: `external32`]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#External Data Representation: `external32`]]

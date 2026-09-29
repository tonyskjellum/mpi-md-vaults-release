---
title: "Message Data"
chapter: pt2pt
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/pt2pt]
---

# Message Data

Chapter **pt2pt** · in [[versions/v13/sections/pt2pt#Message data|MPI-1.3]], [[versions/v21/sections/pt2pt#Message Data|MPI-2.1]], [[versions/v22/sections/pt2pt#Message Data|MPI-2.2]], [[versions/v30/sections/pt2pt#Message Data|MPI-3.0]], [[versions/v31/sections/pt2pt#Message Data|MPI-3.1]], [[versions/v40/sections/pt2pt#Message Data|MPI-4.0]], [[versions/v41/sections/pt2pt#Message Data|MPI-4.1]], [[versions/v50/sections/pt2pt#Message Data|MPI-5.0]]

Heading by release: MPI-1.3: “Message data”; MPI-2.1: “Message Data”; MPI-2.2: “Message Data”; MPI-3.0: “Message Data”; MPI-3.1: “Message Data”; MPI-4.0: “Message Data”; MPI-4.1: “Message Data”; MPI-5.0: “Message Data”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

~~The data part of the message consists of a sequence of `count` values, each of the type indicated by `datatype`. `count` may be zero, in which case the data part of the message is empty. The basic datatypes that can be specified for message data values correspond to the basic datatypes of the host language. Possible values of this argument for Fortran and the corresponding Fortran types are listed below.~~

==The data part of the message consists of a sequence of `count` values, each of the type indicated by `datatype`. `count` may be zero, in which case the data part of the message is empty. The basic datatypes that can be specified for message data values correspond to the basic datatypes of the host language. Possible values of this argument for Fortran and the corresponding Fortran types are listed==

==in Table [[versions/v21/sections/pt2pt#Message Data|Message Data]] .==

~~Possible values for this argument for C and the corresponding C types are listed below.~~

~~| MPI datatype         | C datatype           | |:---------------------|:---------------------| | `MPI_CHAR`           | `signed char`        | | `MPI_SHORT`          | `signed short int`   | | `MPI_INT`            | `signed int`         | | `MPI_LONG`           | `signed long int`    | | `MPI_UNSIGNED_CHAR`  | `unsigned char`      | | `MPI_UNSIGNED_SHORT` | `unsigned short int` | | `MPI_UNSIGNED`       | `unsigned int`       | | `MPI_UNSIGNED_LONG`  | `unsigned long int`  | | `MPI_FLOAT`          | `float`              | | `MPI_DOUBLE`         | `double`             | | `MPI_LONG_DOUBLE`    | `long double`        | | `MPI_BYTE`           |                      | | `MPI_PACKED`         |                      |~~

~~The datatypes `MPI_BYTE` and `MPI_PACKED` do not correspond to a Fortran or C datatype. A value of type `MPI_BYTE` consists of a byte (8 binary digits). A byte is uninterpreted and is different from a character. Different machines may have different representations for characters, or may use more than one byte to represent characters. On the other hand, a byte has the same binary value on all machines. The use of the type `MPI_PACKED` is explained in Section [[versions/v21/sections/pt2pt#Pack and unpack|Pack and unpack]] .~~

~~MPI requires support of the datatypes listed above, which match the basic datatypes of Fortran 77 and ANSI C. Additional MPI datatypes should be provided if the host language has additional data types: `MPI_LONG_LONG_INT`,~~

~~for C integers declared to be of type <span class="sans-serif">long long</span>; `MPI_DOUBLE_COMPLEX` for double precision complex in~~

==Predefined MPI datatypes corresponding to Fortran datatypes==

==Possible values for this argument for C and the corresponding C types are listed==

==in Table [[versions/v21/sections/pt2pt#Message Data|Message Data]] .==

==| MPI datatype                   | C datatype                       | |:-------------------------------|:---------------------------------| | `MPI_CHAR`                     | `signed char`                    | |                                | (treated as printable character) | | `MPI_SHORT`                    | `signed short int`               | | `MPI_INT`                      | `signed int`                     | | `MPI_LONG`                     | `signed long int`                | | `MPI_LONG_LONG_INT`            | `signed long long int`           | | `MPI_LONG_LONG` (as a synonym) | `signed long long int`           | | `MPI_SIGNED_CHAR`              | `signed char`                    | |                                | (treated as integral value)      | | `MPI_UNSIGNED_CHAR`            | `unsigned char`                  | |                                | (treated as integral value)      | | `MPI_UNSIGNED_SHORT`           | `unsigned short int`             | | `MPI_UNSIGNED`                 | `unsigned int`                   | | `MPI_UNSIGNED_LONG`            | `unsigned long int`              | | `MPI_UNSIGNED_LONG_LONG`       | `unsigned long long int`         | | `MPI_FLOAT`                    | `float`                          | | `MPI_DOUBLE`                   | `double`                         | | `MPI_LONG_DOUBLE`              | `long double`                    | | `MPI_WCHAR`                    | `wchar_t`                        | |                                | (defined in `<stddef.h>`)        | |                                | (treated as printable character) | | `MPI_BYTE`                     |                                  | | `MPI_PACKED`                   |                                  |==

==Predefined MPI datatypes corresponding to C datatypes==

==The datatypes `MPI_BYTE` and `MPI_PACKED` do not correspond to a Fortran or C datatype. A value of type `MPI_BYTE` consists of a byte (8 binary digits). A byte is uninterpreted and is different from a character. Different machines may have different representations for characters, or may use more than one byte to represent characters. On the other hand, a byte has the same binary value on all machines. The use of the type `MPI_PACKED` is explained in Section [[versions/v21/sections/datatypes#Pack and Unpack|Pack and Unpack]] .==

==MPI requires support of==

==these datatypes,==

==which match the basic datatypes of==

==Fortran and ISO C.==

==Additional MPI datatypes should be provided if the host language has==

==additional data types:==

==`MPI_DOUBLE_COMPLEX` for double precision complex in==

> One goal of the design is to allow for MPI to be implemented as a library, with no need for additional preprocessing or compilation. Thus, one cannot assume that a communication call has information on the datatype of variables in the communication buffer; this information must be supplied by an explicit argument. The need for such datatype information will become clear in Section [[versions/v21/sections/pt2pt#Data ~~conversion|Data conversion]]~~ ==Conversion|Data Conversion]]== .

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

| MPI datatype | C datatype | ~~|:-------------------------------|:---------------------------------|~~ ==|:-------------------------------------|:---------------------------------|== | `MPI_CHAR` | ~~`signed char`~~ ==`char`== | | | (treated as printable character) | | `MPI_SHORT` | `signed short int` | | `MPI_INT` | `signed int` | | `MPI_LONG` | `signed long int` | | `MPI_LONG_LONG_INT` | `signed long long int` | | `MPI_LONG_LONG` (as a synonym) | `signed long long int` | | `MPI_SIGNED_CHAR` | `signed char` | | | (treated as integral value) | | `MPI_UNSIGNED_CHAR` | `unsigned char` | | | (treated as integral value) | | `MPI_UNSIGNED_SHORT` | `unsigned short int` | | `MPI_UNSIGNED` | `unsigned int` | | `MPI_UNSIGNED_LONG` | `unsigned long int` | | `MPI_UNSIGNED_LONG_LONG` | `unsigned long long int` | | `MPI_FLOAT` | `float` | | `MPI_DOUBLE` | `double` | | `MPI_LONG_DOUBLE` | `long double` | | `MPI_WCHAR` | `wchar_t` | | | (defined in `<stddef.h>`) | | | (treated as printable character) | | ==`MPI_C_BOOL` | `_Bool` | | `MPI_INT8_T` | `int8_t` | | `MPI_INT16_T` | `int16_t` | | `MPI_INT32_T` | `int32_t` | | `MPI_INT64_T` | `int64_t` | | `MPI_UINT8_T` | `uint8_t` | | `MPI_UINT16_T` | `uint16_t` | | `MPI_UINT32_T` | `uint32_t` | | `MPI_UINT64_T` | `uint64_t` | | `MPI_C_COMPLEX` | `float _Complex` | | `MPI_C_FLOAT_COMPLEX (as a synonym)` | `float _Complex` | | `MPI_C_DOUBLE_COMPLEX` | `double _Complex` | | `MPI_C_LONG_DOUBLE_COMPLEX` | `long double _Complex` | |== `MPI_BYTE` | | | `MPI_PACKED` | |

==| MPI datatype | C datatype   | Fortran datatype                  | |:-------------|:-------------|:----------------------------------| | `MPI_AINT`   | `MPI_Aint`   | `INTEGER (KIND=MPI_ADDRESS_KIND)` | | `MPI_OFFSET` | `MPI_Offset` | `INTEGER (KIND=MPI_OFFSET_KIND)`  |==

==Predefined MPI datatypes corresponding to both C and Fortran datatypes==

==> [!tip] Rationale==

==> The datatypes `MPI_C_BOOL`, `MPI_INT8_T`, `MPI_INT16_T`, `MPI_INT32_T`, `MPI_UINT8_T`, `MPI_UINT16_T`, `MPI_UINT32_T`, `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` have no corresponding C++ bindings. This was intentionally done to avoid potential collisions with the C preprocessor and namespaced C++ names. C++ applications can use the C bindings with no loss of functionality.==

==The datatypes `MPI_AINT` and `MPI_OFFSET` correspond to the MPI-defined C types `MPI_Aint` and `MPI_Offset` and their Fortran equivalents `INTEGER (KIND=``MPI_ADDRESS_KIND)` and `INTEGER (KIND=``MPI_OFFSET_KIND``)`. This is described in Table [[versions/v22/sections/pt2pt#Message Data|Message Data]] . See Section [[versions/v22/sections/binding#Interlanguage Communication|Interlanguage Communication]] for information on interlanguage communication with these types.==

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

| MPI datatype | C datatype | Fortran datatype | |:-------------|:-------------|:----------------------------------| | `MPI_AINT` | `MPI_Aint` | `INTEGER (KIND=MPI_ADDRESS_KIND)` | | `MPI_OFFSET` | `MPI_Offset` | `INTEGER (KIND=MPI_OFFSET_KIND)` | ==| `MPI_COUNT` | `MPI_Count` | `INTEGER (KIND=MPI_COUNT_KIND)` |==

~~MPI requires support of~~

~~these datatypes,~~

==MPI requires support of these datatypes,==

~~Fortran and ISO C.~~

~~Additional MPI datatypes should be provided if the host language has~~

~~additional data types:~~

~~`MPI_DOUBLE_COMPLEX` for double precision complex in~~

~~Fortran declared to be of type `DOUBLE COMPLEX`;~~

~~`MPI_REAL2`, `MPI_REAL4` and `MPI_REAL8` for Fortran reals, declared to be of type `REAL*2`, `REAL*4` and `REAL*8`, respectively; `MPI_INTEGER1` `MPI_INTEGER2` and `MPI_INTEGER4` for Fortran integers, declared to be of type `INTEGER*1`, `INTEGER*2` and `INTEGER*4`, respectively; etc.~~

==Fortran and ISO C. Additional MPI datatypes should be provided if the host language has additional data types: `MPI_DOUBLE_COMPLEX` for double precision complex in Fortran declared to be of type `DOUBLE COMPLEX`; `MPI_REAL2`, `MPI_REAL4`, and `MPI_REAL8` for Fortran reals, declared to be of type `REAL*2`, `REAL*4` and `REAL*8`, respectively; `MPI_INTEGER1`, `MPI_INTEGER2`, and `MPI_INTEGER4` for Fortran integers, declared to be of type `INTEGER*1`, `INTEGER*2`, and `INTEGER*4`, respectively; etc.==

~~> [!tip] Rationale~~

~~> The datatypes `MPI_C_BOOL`, `MPI_INT8_T`, `MPI_INT16_T`, `MPI_INT32_T`, `MPI_UINT8_T`, `MPI_UINT16_T`, `MPI_UINT32_T`, `MPI_C_COMPLEX`, `MPI_C_FLOAT_COMPLEX`, `MPI_C_DOUBLE_COMPLEX`, and `MPI_C_LONG_DOUBLE_COMPLEX` have no corresponding C++ bindings. This was intentionally done to avoid potential collisions with the C preprocessor and namespaced C++ names. C++ applications can use the C bindings with no loss of functionality.~~

~~The datatypes `MPI_AINT` and `MPI_OFFSET` correspond to the MPI-defined C types `MPI_Aint` and `MPI_Offset` and their Fortran equivalents `INTEGER (KIND=``MPI_ADDRESS_KIND)` and `INTEGER (KIND=``MPI_OFFSET_KIND``)`. This is described in Table [[versions/v30/sections/pt2pt#Message Data|Message Data]] . See Section [[versions/v30/sections/binding#Interlanguage Communication|Interlanguage Communication]] for information on interlanguage communication with these types.~~

==The datatypes `MPI_AINT`, `MPI_OFFSET`, and `MPI_COUNT` correspond to the MPI-defined C types `MPI_Aint`, `MPI_Offset`, and `MPI_Count` and their Fortran equivalents `INTEGER (KIND=``MPI_ADDRESS_KIND``)` , `INTEGER (KIND=``MPI_OFFSET_KIND``),`==

==and `INTEGER (KIND=``MPI_COUNT_KIND``).`==

==This is described in Table [[versions/v30/sections/pt2pt#Message Data|Message Data]] . All predefined datatype handles are available in all language bindings. See==

==Sections [[versions/v30/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v30/sections/binding#Interlanguage Communication|Interlanguage Communication]] on page [[versions/v30/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v30/sections/binding#Interlanguage Communication|Interlanguage Communication]]==

==for information on interlanguage communication with these types.==

==If there is an accompanying C++ compiler then the datatypes in Table [[versions/v30/sections/pt2pt#Message Data|Message Data]] are also supported in C and Fortran.==

==| MPI datatype                  | C++ datatype                          | |:------------------------------|:--------------------------------------| | `MPI_CXX_BOOL`                | `bool`                                | | `MPI_CXX_FLOAT_COMPLEX`       | `std::complex`$`<`$`float`$`>`$       | | `MPI_CXX_DOUBLE_COMPLEX`      | `std::complex`$`<`$`double`$`>`$      | | `MPI_CXX_LONG_DOUBLE_COMPLEX` | `std::complex`$`<`$`long double`$`>`$ |==

==Predefined MPI datatypes corresponding to C++ datatypes==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~The send buffer specified by the `MPI_SEND` operation consists of `count` successive entries of the type indicated by `datatype`, starting with the entry at address `buf`. Note that we specify the message length in terms of number of *elements*, not number of *bytes*. The former is machine independent and closer to the application level.~~

~~The data part of the message consists of a sequence of `count` values, each of the type indicated by `datatype`. `count` may be zero, in which case the data part of the message is empty. The basic datatypes that can be specified for message data values correspond to the basic datatypes of the host language. Possible values of this argument for Fortran and the corresponding Fortran types are listed~~

~~in Table [[versions/v31/sections/pt2pt#Message Data|Message Data]] .~~

==The send buffer specified by the [[versions/v31/API/MPI_SEND|MPI_SEND]] operation consists of `count` successive entries of the type indicated by `datatype`, starting with the entry at address `buf`. Note that we specify the message length in terms of number of *elements*, not number of *bytes*. The former is machine independent and closer to the application level.==

==The data part of the message consists of a sequence of `count` values, each of the type indicated by `datatype`. `count` may be zero, in which case the data part of the message is empty. The basic datatypes that can be specified for message data values correspond to the basic datatypes of the host language. Possible values of this argument for Fortran and the corresponding Fortran types are listed in Table [[versions/v31/sections/pt2pt#Message Data|Message Data]] .==

~~Possible values for this argument for C and the corresponding C types are listed~~

~~in Table [[versions/v31/sections/pt2pt#Message Data|Message Data]] .~~

==Possible values for this argument for C and the corresponding C types are listed in Table [[versions/v31/sections/pt2pt#Message Data|Message Data]] .==

~~MPI requires support of these datatypes,~~

~~which match the basic datatypes of~~

~~Fortran and ISO C. Additional MPI datatypes should be provided if the host language has additional data types: `MPI_DOUBLE_COMPLEX` for double precision complex in Fortran declared to be of type `DOUBLE COMPLEX`; `MPI_REAL2`, `MPI_REAL4`, and `MPI_REAL8` for Fortran reals, declared to be of type `REAL*2`, `REAL*4` and `REAL*8`, respectively; `MPI_INTEGER1`, `MPI_INTEGER2`, and `MPI_INTEGER4` for Fortran integers, declared to be of type `INTEGER*1`, `INTEGER*2`, and `INTEGER*4`, respectively; etc.~~

==MPI requires support of these datatypes, which match the basic datatypes of Fortran and ISO C. Additional MPI datatypes should be provided if the host language has additional data types: `MPI_DOUBLE_COMPLEX` for double precision complex in Fortran declared to be of type `DOUBLE COMPLEX`; `MPI_REAL2`, `MPI_REAL4`, and `MPI_REAL8` for Fortran reals, declared to be of type `REAL*2`, `REAL*4` and `REAL*8`, respectively; `MPI_INTEGER1`, `MPI_INTEGER2`, and `MPI_INTEGER4` for Fortran integers, declared to be of type `INTEGER*1`, `INTEGER*2`, and `INTEGER*4`, respectively; etc.==

~~The datatypes `MPI_AINT`, `MPI_OFFSET`, and `MPI_COUNT` correspond to the MPI-defined C types `MPI_Aint`, `MPI_Offset`, and `MPI_Count` and their Fortran equivalents `INTEGER (KIND=``MPI_ADDRESS_KIND``)` , `INTEGER (KIND=``MPI_OFFSET_KIND``),`~~

~~and `INTEGER (KIND=``MPI_COUNT_KIND``).`~~

~~This is described in Table [[versions/v31/sections/pt2pt#Message Data|Message Data]] . All predefined datatype handles are available in all language bindings. See~~

~~Sections [[versions/v31/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v31/sections/binding#Interlanguage Communication|Interlanguage Communication]] on page [[versions/v31/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v31/sections/binding#Interlanguage Communication|Interlanguage Communication]]~~

~~for information on interlanguage communication with these types.~~

==The datatypes `MPI_AINT`, `MPI_OFFSET`, and `MPI_COUNT` correspond to the MPI-defined C types `MPI_Aint`, `MPI_Offset`, and `MPI_Count` and their Fortran equivalents `INTEGER (KIND=``MPI_ADDRESS_KIND``)`, `INTEGER (KIND=``MPI_OFFSET_KIND``),` and `INTEGER (KIND=``MPI_COUNT_KIND``).` This is described in Table [[versions/v31/sections/pt2pt#Message Data|Message Data]] . All predefined datatype handles are available in all language bindings. See Sections [[versions/v31/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v31/sections/binding#Interlanguage Communication|Interlanguage Communication]] on page [[versions/v31/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v31/sections/binding#Interlanguage Communication|Interlanguage Communication]] for information on interlanguage communication with these types.==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

~~The send buffer specified by the [[versions/v40/API/MPI_SEND|MPI_SEND]] operation consists of `count` successive entries of the type indicated by `datatype`, starting with the entry at address `buf`. Note that we specify the message length in terms of number of *elements*, not number of *bytes*. The former is machine independent and closer to the application level.~~

~~The data part of the message consists of a sequence of `count` values, each of the type indicated by `datatype`. `count` may be zero, in which case the data part of the message is empty. The basic datatypes that can be specified for message data values correspond to the basic datatypes of the host language. Possible values of this argument for Fortran and the corresponding Fortran types are listed in Table [[versions/v40/sections/pt2pt#Message Data|Message Data]] .~~

==The send buffer specified by the [[versions/v40/API/MPI_SEND|MPI_SEND]] procedure consists of `count` successive entries of the type indicated by `datatype`, starting with the entry at address `buf`. Note that we specify the message length in terms of number of *elements*, not number of *bytes*. The former is machine independent and closer to the application level.==

==The data part of the message consists of a sequence of `count` values, each of the type indicated by `datatype`. `count` may be zero, in which case the data part of the message is empty. The **basic datatypes** that can be specified for message data values correspond to the basic datatypes of the host language. Possible values of this argument for Fortran and the corresponding Fortran types are listed in Table [[versions/v40/sections/pt2pt#Message Data|Message Data]] .==

==Possible values for this argument for C and the corresponding C types are listed in Table [[versions/v40/sections/pt2pt#Message Data|Message Data]] .==

~~Possible values for this argument for C and the corresponding C types are listed in Table [[versions/v40/sections/pt2pt#Message Data|Message Data]] .~~

~~| MPI datatype                         | C datatype                       | |:-------------------------------------|:---------------------------------| | `MPI_CHAR`                           | `char`                           | |                                      | (treated as printable character) | | `MPI_SHORT`                          | `signed short int`               | | `MPI_INT`                            | `signed int`                     | | `MPI_LONG`                           | `signed long int`                | | `MPI_LONG_LONG_INT`                  | `signed long long int`           | | `MPI_LONG_LONG` (as a synonym)       | `signed long long int`           | | `MPI_SIGNED_CHAR`                    | `signed char`                    | |                                      | (treated as integral value)      | | `MPI_UNSIGNED_CHAR`                  | `unsigned char`                  | |                                      | (treated as integral value)      | | `MPI_UNSIGNED_SHORT`                 | `unsigned short int`             | | `MPI_UNSIGNED`                       | `unsigned int`                   | | `MPI_UNSIGNED_LONG`                  | `unsigned long int`              | | `MPI_UNSIGNED_LONG_LONG`             | `unsigned long long int`         | | `MPI_FLOAT`                          | `float`                          | | `MPI_DOUBLE`                         | `double`                         | | `MPI_LONG_DOUBLE`                    | `long double`                    | | `MPI_WCHAR`                          | `wchar_t`                        | |                                      | (defined in `<stddef.h>`)        | |                                      | (treated as printable character) | | `MPI_C_BOOL`                         | `_Bool`                          | | `MPI_INT8_T`                         | `int8_t`                         | | `MPI_INT16_T`                        | `int16_t`                        | | `MPI_INT32_T`                        | `int32_t`                        | | `MPI_INT64_T`                        | `int64_t`                        | | `MPI_UINT8_T`                        | `uint8_t`                        | | `MPI_UINT16_T`                       | `uint16_t`                       | | `MPI_UINT32_T`                       | `uint32_t`                       | | `MPI_UINT64_T`                       | `uint64_t`                       | | `MPI_C_COMPLEX`                      | `float _Complex`                 | | `MPI_C_FLOAT_COMPLEX (as a synonym)` | `float _Complex`                 | | `MPI_C_DOUBLE_COMPLEX`               | `double _Complex`                | | `MPI_C_LONG_DOUBLE_COMPLEX`          | `long double _Complex`           | | `MPI_BYTE`                           |                                  | | `MPI_PACKED`                         |                                  |~~

==| MPI datatype                         | C datatype                       | |:-------------------------------------|:---------------------------------| | `MPI_CHAR`                           | `char`                           | |                                      | (treated as printable character) | | `MPI_SHORT`                          | `signed short int`               | | `MPI_INT`                            | `signed int`                     | | `MPI_LONG`                           | `signed long int`                | | `MPI_LONG_LONG_INT`                  | `signed long long int`           | | `MPI_LONG_LONG` (as a synonym)       | `signed long long int`           | | `MPI_SIGNED_CHAR`                    | `signed char`                    | |                                      | (treated as integral value)      | | `MPI_UNSIGNED_CHAR`                  | `unsigned char`                  | |                                      | (treated as integral value)      | | `MPI_UNSIGNED_SHORT`                 | `unsigned short int`             | | `MPI_UNSIGNED`                       | `unsigned int`                   | | `MPI_UNSIGNED_LONG`                  | `unsigned long int`              | | `MPI_UNSIGNED_LONG_LONG`             | `unsigned long long int`         | | `MPI_FLOAT`                          | `float`                          | | `MPI_DOUBLE`                         | `double`                         | | `MPI_LONG_DOUBLE`                    | `long double`                    | | `MPI_WCHAR`                          | `wchar_t`                        | |                                      | (defined in `<stddef.h>`)        | |                                      | (treated as printable character) | | `MPI_C_BOOL`                         | `_Bool`                          | | `MPI_INT8_T`                         | `int8_t`                         | | `MPI_INT16_T`                        | `int16_t`                        | | `MPI_INT32_T`                        | `int32_t`                        | | `MPI_INT64_T`                        | `int64_t`                        | | `MPI_UINT8_T`                        | `uint8_t`                        | | `MPI_UINT16_T`                       | `uint16_t`                       | | `MPI_UINT32_T`                       | `uint32_t`                       | | `MPI_UINT64_T`                       | `uint64_t`                       | | `MPI_C_COMPLEX`                      | `float _Complex`                 | | `MPI_C_FLOAT_COMPLEX` (as a synonym) | `float _Complex`                 | | `MPI_C_DOUBLE_COMPLEX`               | `double _Complex`                | | `MPI_C_LONG_DOUBLE_COMPLEX`          | `long double _Complex`           | | `MPI_BYTE`                           |                                  | | `MPI_PACKED`                         |                                  |==

| MPI datatype | C datatype | Fortran datatype | ~~|:-------------|:-------------|:----------------------------------|~~ ==|:-------------|:-------------|:---------------------------------|== | `MPI_AINT` | `MPI_Aint` | ~~`INTEGER (KIND=MPI_ADDRESS_KIND)`~~ ==`INTEGER(KIND=MPI_ADDRESS_KIND)`== | | `MPI_OFFSET` | `MPI_Offset` | ~~`INTEGER (KIND=MPI_OFFSET_KIND)`~~ ==`INTEGER(KIND=MPI_OFFSET_KIND)`== | | `MPI_COUNT` | `MPI_Count` | ~~`INTEGER (KIND=MPI_COUNT_KIND)`~~ ==`INTEGER(KIND=MPI_COUNT_KIND)`== |

MPI requires support of these datatypes, which match the basic datatypes of Fortran and ISO C. Additional MPI datatypes should be provided if the host language has additional ~~data types:~~ ==datatypes[^1]:== `MPI_DOUBLE_COMPLEX` for double precision complex in Fortran declared to be of type `DOUBLE COMPLEX`; `MPI_REAL2`, `MPI_REAL4`, ==`MPI_REAL8`,== and ~~`MPI_REAL8`~~ ==`MPI_REAL16`== for Fortran reals, declared to be of type `REAL*2`, ~~`REAL*4`~~ ==`REAL*4`, `REAL*8`,== and ~~`REAL*8`,~~ ==`REAL*16`,== respectively; `MPI_INTEGER1`, `MPI_INTEGER2`, ==`MPI_INTEGER4`,== and ~~`MPI_INTEGER4`~~ ==`MPI_INTEGER8`== for Fortran integers, declared to be of type `INTEGER*1`, `INTEGER*2`, ==`INTEGER*4`,== and ~~`INTEGER*4`,~~ ==`INTEGER*8`, respectively; `MPI_COMPLEX4`, `MPI_COMPLEX8`, `MPI_COMPLEX16`, and `MPI_COMPLEX32` for complex numbers in Fortran declared to be of type `COMPLEX*4`, `COMPLEX*8`, `COMPLEX*16`, and `COMPLEX*32`,== respectively; etc.

The datatypes `MPI_AINT`, `MPI_OFFSET`, and `MPI_COUNT` correspond to the MPI-defined C types `MPI_Aint`, `MPI_Offset`, and `MPI_Count` and their Fortran equivalents ~~`INTEGER (KIND=``MPI_ADDRESS_KIND``)`, `INTEGER (KIND=``MPI_OFFSET_KIND``),`~~ ==`INTEGER(KIND=``MPI_ADDRESS_KIND``)`, `INTEGER(KIND=``MPI_OFFSET_KIND``),`== and ~~`INTEGER (KIND=``MPI_COUNT_KIND``).`~~ ==`INTEGER(KIND=``MPI_COUNT_KIND``).`== This is described in Table [[versions/v40/sections/pt2pt#Message Data|Message Data]] . All predefined datatype handles are available in all language bindings. See Sections [[versions/v40/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v40/sections/binding#Interlanguage Communication|Interlanguage Communication]] on page [[versions/v40/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v40/sections/binding#Interlanguage Communication|Interlanguage Communication]] for information on interlanguage communication with these types.

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

| ~~MPI datatype~~ ==**MPI datatype**== | ~~Fortran datatype~~ ==**Fortran datatype**== | ~~|:-----------------------|:-------------------|~~ ==|:-----------------------|:---------------------|== | `MPI_INTEGER` | `INTEGER` | | `MPI_REAL` | `REAL` | | `MPI_DOUBLE_PRECISION` | `DOUBLE PRECISION` | | `MPI_COMPLEX` | `COMPLEX` | | `MPI_LOGICAL` | `LOGICAL` | | `MPI_CHARACTER` | `CHARACTER(1)` | | `MPI_BYTE` | | | `MPI_PACKED` | |

| ~~MPI datatype~~ ==**MPI datatype**== | ~~C datatype~~ ==**C datatype**== | |:-------------------------------------|:---------------------------------| | `MPI_CHAR` | `char` | | | (treated as printable character) | | `MPI_SHORT` | `signed short int` | | `MPI_INT` | `signed int` | | `MPI_LONG` | `signed long int` | | `MPI_LONG_LONG_INT` | `signed long long int` | | `MPI_LONG_LONG` (as a synonym) | `signed long long int` | | `MPI_SIGNED_CHAR` | `signed char` | | | (treated as integral value) | | `MPI_UNSIGNED_CHAR` | `unsigned char` | | | (treated as integral value) | | `MPI_UNSIGNED_SHORT` | `unsigned short int` | | `MPI_UNSIGNED` | `unsigned int` | | `MPI_UNSIGNED_LONG` | `unsigned long int` | | `MPI_UNSIGNED_LONG_LONG` | `unsigned long long int` | | `MPI_FLOAT` | `float` | | `MPI_DOUBLE` | `double` | | `MPI_LONG_DOUBLE` | `long double` | | `MPI_WCHAR` | `wchar_t` | | | (defined in `<stddef.h>`) | | | (treated as printable character) | | `MPI_C_BOOL` | `_Bool` | | `MPI_INT8_T` | `int8_t` | | `MPI_INT16_T` | `int16_t` | | `MPI_INT32_T` | `int32_t` | | `MPI_INT64_T` | `int64_t` | | `MPI_UINT8_T` | `uint8_t` | | `MPI_UINT16_T` | `uint16_t` | | `MPI_UINT32_T` | `uint32_t` | | `MPI_UINT64_T` | `uint64_t` | | `MPI_C_COMPLEX` | `float _Complex` | | `MPI_C_FLOAT_COMPLEX` (as a synonym) | `float _Complex` | | `MPI_C_DOUBLE_COMPLEX` | `double _Complex` | | `MPI_C_LONG_DOUBLE_COMPLEX` | `long double _Complex` | | `MPI_BYTE` | | | `MPI_PACKED` | |

| ~~MPI datatype~~ ==**MPI datatype**== | ~~C datatype~~ ==**C datatype**== | ~~Fortran datatype~~ ==**Fortran datatype**== | ~~|:-------------|:-------------|:---------------------------------|~~ ==|:-----------------|:---------------|:---------------------|== | `MPI_AINT` | `MPI_Aint` | ~~`INTEGER(KIND=MPI_ADDRESS_KIND)`~~ ==`ADDRESS`== | | `MPI_OFFSET` | `MPI_Offset` | ~~`INTEGER(KIND=MPI_OFFSET_KIND)`~~ ==`OFFSET`== | | `MPI_COUNT` | `MPI_Count` | ~~`INTEGER(KIND=MPI_COUNT_KIND)`~~ ==`COUNT`== |

The datatypes `MPI_AINT`, `MPI_OFFSET`, and `MPI_COUNT` correspond to the MPI-defined C types `MPI_Aint`, `MPI_Offset`, and `MPI_Count` and their Fortran equivalents ~~`INTEGER(KIND=``MPI_ADDRESS_KIND``)`, `INTEGER(KIND=``MPI_OFFSET_KIND``),`~~ ==`ADDRESS`, `OFFSET`,== and ~~`INTEGER(KIND=``MPI_COUNT_KIND``).`~~ ==`COUNT`.== This is described in Table [[versions/v41/sections/pt2pt#Message Data|Message Data]] . All predefined datatype handles are available in all language bindings. See Sections [[versions/v41/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v41/sections/binding#Interlanguage Communication|Interlanguage Communication]] on page [[versions/v41/sections/binding#MPI Opaque Objects|MPI Opaque Objects]] and [[versions/v41/sections/binding#Interlanguage Communication|Interlanguage Communication]] for information on interlanguage communication with these types.

| ~~MPI datatype~~ ==**MPI datatype**== | ~~C++ datatype~~ ==**C++ datatype**== | |:------------------------------|:--------------------------------------| | `MPI_CXX_BOOL` | `bool` | | `MPI_CXX_FLOAT_COMPLEX` | `std::complex`$`<`$`float`$`>`$ | | `MPI_CXX_DOUBLE_COMPLEX` | `std::complex`$`<`$`double`$`>`$ | | `MPI_CXX_LONG_DOUBLE_COMPLEX` | `std::complex`$`<`$`long double`$`>`$ |

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

MPI requires support of these datatypes, which match the basic datatypes of Fortran and ISO C. Additional MPI datatypes should be provided if the host language has additional datatypes[^1]: `MPI_DOUBLE_COMPLEX` for double precision complex in Fortran declared to be of type `DOUBLE COMPLEX`; `MPI_REAL2`, `MPI_REAL4`, `MPI_REAL8`, and `MPI_REAL16` for Fortran reals, declared to be of type `REAL*2`, `REAL*4`, `REAL*8`, and `REAL*16`, respectively; `MPI_INTEGER1`, `MPI_INTEGER2`, `MPI_INTEGER4`, ==`MPI_INTEGER8`,== and ~~`MPI_INTEGER8`~~ ==`MPI_INTEGER16`== for Fortran integers, declared to be of type `INTEGER*1`, `INTEGER*2`, `INTEGER*4`, ==`INTEGER*8`,== and ~~`INTEGER*8`,~~ ==`INTEGER*16` respectively; `MPI_LOGICAL1`, `MPI_LOGICAL2`, `MPI_LOGICAL4`, `MPI_LOGICAL8`, and `MPI_LOGICAL16` for Fortran integers, declared to be of type `LOGICAL*1`, `LOGICAL*2`, `LOGICAL*4`, `LOGICAL*8`, and `LOGICAL*16`== respectively; `MPI_COMPLEX4`, `MPI_COMPLEX8`, `MPI_COMPLEX16`, and `MPI_COMPLEX32` for complex numbers in Fortran declared to be of type `COMPLEX*4`, `COMPLEX*8`, `COMPLEX*16`, and `COMPLEX*32`, respectively; etc.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/pt2pt#Message data]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/pt2pt#Message Data]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/pt2pt#Message Data]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/pt2pt#Message Data]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/pt2pt#Message Data]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/pt2pt#Message Data]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/pt2pt#Message Data]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/pt2pt#Message Data]]

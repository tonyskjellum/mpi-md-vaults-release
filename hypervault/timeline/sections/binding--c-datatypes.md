---
title: "C++ Datatypes"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# C++ Datatypes

Chapter **binding** · in [[versions/v20/sections/binding#C++ Datatypes|MPI-2.0]], [[versions/v21/sections/binding#C++ Datatypes|MPI-2.1]], [[versions/v22/sections/binding#C++ Datatypes|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (6 changed paragraphs)

~~`MPI::BYTE` and `MPI::PACKED` conform to the same restrictions as `MPI_BYTE` and `MPI_PACKED`, listed in Sections 3.2.2 and 3.13 of MPI-1, respectively.~~

~~| MPI datatype               | C datatype       | C++ datatype           | |:---------------------------|:-----------------|:-----------------------| | `MPI::CHAR`                | `char`           | `char`                 | | `MPI::WCHAR`               | `wchar_t`        | `wchar_t`              | | `MPI::SHORT`               | `signed short`   | `signed short`         | | `MPI::INT`                 | `signed int`     | `signed int`           | | `MPI::LONG`                | `signed long`    | `signed long`          | | `MPI::SIGNED_CHAR`         | `signed char`    | `signed char`          | | `MPI::UNSIGNED_CHAR`       | `unsigned char`  | `unsigned char`        | | `MPI::UNSIGNED_SHORT`      | `unsigned short` | `unsigned short`       | | `MPI::UNSIGNED`            | `unsigned int`   | `unsigned int`         | | `MPI::UNSIGNED_LONG`       | `unsigned long`  | `unsigned long int`    | | `MPI::FLOAT`               | `float`          | `float`                | | `MPI::DOUBLE`              | `double`         | `double`               | | `MPI::LONG_DOUBLE`         | `long double`    | `long double`          | | `MPI::BOOL`                |                  | `bool`                 | | `MPI::COMPLEX`             |                  | `Complex<float>`       | | `MPI::DOUBLE_COMPLEX`      |                  | `Complex<double>`      | | `MPI::LONG_DOUBLE_COMPLEX` |                  | `Complex<long double>` | | `MPI::BYTE`                |                  |                        | | `MPI::PACKED`              |                  |                        |~~

==`MPI::BYTE` and `MPI::PACKED` conform to the same restrictions as `MPI_BYTE` and `MPI_PACKED`, listed in==

==Sections [[versions/v21/sections/pt2pt#Message Data|Message Data]] on page [[versions/v21/sections/pt2pt#Message Data|Message Data]] and Sections [[versions/v21/sections/datatypes#Pack and Unpack|Pack and Unpack]] on page [[versions/v21/sections/datatypes#Pack and Unpack|Pack and Unpack]] ,==

==respectively.==

==| MPI datatype               | C datatype           | C++ datatype           | |:---------------------------|:---------------------|:-----------------------| | `MPI::CHAR`                | `char`               | `char`                 | | `MPI::SHORT`               | `signed short`       | `signed short`         | | `MPI::INT`                 | `signed int`         | `signed int`           | | `MPI::LONG`                | `signed long`        | `signed long`          | | `MPI::LONG_LONG`           | `signed long long`   | `signed long long`     | | `MPI::SIGNED_CHAR`         | `signed char`        | `signed char`          | | `MPI::UNSIGNED_CHAR`       | `unsigned char`      | `unsigned char`        | | `MPI::UNSIGNED_SHORT`      | `unsigned short`     | `unsigned short`       | | `MPI::UNSIGNED`            | `unsigned int`       | `unsigned int`         | | `MPI::UNSIGNED_LONG`       | `unsigned long`      | `unsigned long int`    | | `MPI::UNSIGNED_LONG_LONG`  | `unsigned long long` | `unsigned long long`   | | `MPI::FLOAT`               | `float`              | `float`                | | `MPI::DOUBLE`              | `double`             | `double`               | | `MPI::LONG_DOUBLE`         | `long double`        | `long double`          | | `MPI::BOOL`                |                      | `bool`                 | | `MPI::COMPLEX`             |                      | `Complex<float>`       | | `MPI::DOUBLE_COMPLEX`      |                      | `Complex<double>`      | | `MPI::LONG_DOUBLE_COMPLEX` |                      | `Complex<long double>` | | `MPI::WCHAR`               | `wchar_t`            | `wchar_t`              | | `MPI::BYTE`                |                      |                        | | `MPI::PACKED`              |                      |                        |==

| MPI datatype | Fortran datatype | |:------------------------|:-------------------| ~~| `MPI::CHARACTER` | `CHARACTER(1)` |~~ | `MPI::INTEGER` | `INTEGER` | | `MPI::REAL` | `REAL` | | `MPI::DOUBLE_PRECISION` | `DOUBLE PRECISION` | | ==`MPI::F_COMPLEX` | `COMPLEX` | |== `MPI::LOGICAL` | `LOGICAL` | | ~~`MPI::F_COMPLEX`~~ ==`MPI::CHARACTER`== | ~~`COMPLEX`~~ ==`CHARACTER(1)`== | | `MPI::BYTE` | | | `MPI::PACKED` | |

| MPI datatype | Description | |:---------------------------|:-----------------------| | `MPI::FLOAT_INT` | C/C++ reduction type | | `MPI::DOUBLE_INT` | C/C++ reduction type | | `MPI::LONG_INT` | C/C++ reduction type | | `MPI::TWOINT` | C/C++ reduction type | | `MPI::SHORT_INT` | C/C++ reduction type | | `MPI::LONG_DOUBLE_INT` | C/C++ reduction ~~type | | `MPI::LONG_LONG` | Optional C/C++ type | | `MPI::UNSIGNED_LONG_LONG` | Optional C/C++~~ type | | `MPI::TWOREAL` | Fortran reduction type | | `MPI::TWODOUBLE_PRECISION` | Fortran reduction type | | `MPI::TWOINTEGER` | Fortran reduction type | | `MPI::F_DOUBLE_COMPLEX` | Optional Fortran type | | `MPI::INTEGER1` | Explicit size type | | `MPI::INTEGER2` | Explicit size type | | `MPI::INTEGER4` | Explicit size type | | `MPI::INTEGER8` | Explicit size type | | `MPI::REAL4` | Explicit size type | | `MPI::REAL8` | Explicit size type | | `MPI::REAL16` | Explicit size type |

~~`MPI::UNSIGNED_LONG, MPI::SIGNED_CHAR,`~~

~~`MPI::UNSIGNED_CHAR`~~

==`MPI::UNSIGNED_LONG,`==

==`MPI::_LONG_LONG, MPI::UNSIGNED_LONG_LONG,`==

==`MPI::SIGNED_CHAR, MPI::UNSIGNED_CHAR`==

~~Valid datatypes for each reduction operation is specified below in terms of the groups defined above.~~

==Valid datatypes for each reduction operation==

==are==

==specified below in terms of the groups defined above.==

~~MPI::MINLOC and MPI::MAXLOC perform just as their C and Fortran counterparts; see Section 4.9.3 in MPI-1.~~

==MPI::MINLOC and MPI::MAXLOC perform just as their C and Fortran counterparts; see==

==Section [[coll-minloc-maxloc]] on page [[coll-minloc-maxloc]] .==

### MPI-2.1 → MPI-2.2  (6 changed paragraphs)

| MPI datatype | Description | |:---------------------------|:-----------------------| | `MPI::FLOAT_INT` | C/C++ reduction type | | `MPI::DOUBLE_INT` | C/C++ reduction type | | `MPI::LONG_INT` | C/C++ reduction type | | `MPI::TWOINT` | C/C++ reduction type | | `MPI::SHORT_INT` | C/C++ reduction type | | `MPI::LONG_DOUBLE_INT` | C/C++ reduction type | | `MPI::TWOREAL` | Fortran reduction type | | `MPI::TWODOUBLE_PRECISION` | Fortran reduction type | | `MPI::TWOINTEGER` | Fortran reduction type | | `MPI::F_DOUBLE_COMPLEX` | Optional Fortran type | | `MPI::INTEGER1` | Explicit size type | | `MPI::INTEGER2` | Explicit size type | | `MPI::INTEGER4` | Explicit size type | | `MPI::INTEGER8` | Explicit size type | | ==`MPI::INTEGER16` | Explicit size type | | `MPI::REAL2` | Explicit size type | |== `MPI::REAL4` | Explicit size type | | `MPI::REAL8` | Explicit size type | | `MPI::REAL16` | Explicit size type | ==| `MPI::F_COMPLEX4` | Explicit size type | | `MPI::F_COMPLEX8` | Explicit size type | | `MPI::F_COMPLEX16` | Explicit size type | | `MPI::F_COMPLEX32` | Explicit size type |==

~~`MPI::INT, MPI::LONG, MPI::SHORT,`~~ ==`MPI::INT`, `MPI::LONG`, `MPI::SHORT`,==

~~`MPI::UNSIGNED_SHORT, MPI::UNSIGNED,`~~ ==`MPI::UNSIGNED_SHORT`, `MPI::UNSIGNED`,==

~~`MPI::UNSIGNED_LONG,`~~ ==`MPI::UNSIGNED_LONG`,==

~~`MPI::_LONG_LONG, MPI::UNSIGNED_LONG_LONG,`~~ ==`MPI::_LONG_LONG`, `MPI::UNSIGNED_LONG_LONG`,==

~~`MPI::SIGNED_CHAR, MPI::UNSIGNED_CHAR`~~ ==`MPI::SIGNED_CHAR`, `MPI::UNSIGNED_CHAR`==

~~`MPI::FLOAT, MPI::DOUBLE, MPI::REAL,`~~

~~`MPI::DOUBLE_PRECISION,`~~

==and handles returned from==

==`MPI::Datatype::Create_f90_integer` ,==

==and if available: `MPI::INTEGER1`,==

==`MPI::INTEGER2`, `MPI::INTEGER4`,==

==`MPI::INTEGER8`, `MPI::INTEGER16`==

==`MPI::FLOAT`, `MPI::DOUBLE`, `MPI::REAL`,==

==`MPI::DOUBLE_PRECISION`,==

~~`MPI::LOGICAL, MPI::BOOL`~~

~~`MPI::F_COMPLEX, MPI::COMPLEX,`~~

~~`MPI::F_DOUBLE_COMPLEX,`~~

~~`MPI::DOUBLE_COMPLEX,`~~

==and handles returned from==

==`MPI::Datatype::Create_f90_real` ,==

==and if available: `MPI::REAL2`,==

==`MPI::REAL4`, `MPI::REAL8`, `MPI::REAL16`==

==`MPI::LOGICAL`, `MPI::BOOL`==

==`MPI::F_COMPLEX`, `MPI::COMPLEX`,==

==`MPI::F_DOUBLE_COMPLEX`,==

==`MPI::DOUBLE_COMPLEX`,==

==and handles returned from==

==`MPI::Datatype::Create_f90_complex` ,==

==and if available: `MPI::F_DOUBLE_COMPLEX`,==

==`MPI::F_COMPLEX4`, `MPI::F_COMPLEX8`,==

==`MPI::F_COMPLEX16`, `MPI::F_COMPLEX32`==

~~MPI::MINLOC~~ ==`MPI::MINLOC`== and ~~MPI::MAXLOC~~ ==`MPI::MAXLOC`== perform just as their C and Fortran counterparts; see

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#C++ Datatypes]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#C++ Datatypes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#C++ Datatypes]]

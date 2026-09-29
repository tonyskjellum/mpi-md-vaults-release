---
title: "Named Constants"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Named Constants

Chapter **terms** · in [[versions/v13/sections/terms#Named constants|MPI-1.3]], [[versions/v20/sections/terms#Named Constants|MPI-2.0]], [[versions/v21/sections/terms#Named Constants|MPI-2.1]], [[versions/v22/sections/terms#Named Constants|MPI-2.2]], [[versions/v30/sections/terms#Named Constants|MPI-3.0]], [[versions/v31/sections/terms#Named Constants|MPI-3.1]], [[versions/v40/sections/terms#Named Constants|MPI-4.0]], [[versions/v41/sections/terms#Named Constants|MPI-4.1]], [[versions/v50/sections/terms#Named Constants|MPI-5.0]]

Heading by release: MPI-1.3: “Named constants”; MPI-2.0: “Named Constants”; MPI-2.1: “Named Constants”; MPI-2.2: “Named Constants”; MPI-3.0: “Named Constants”; MPI-3.1: “Named Constants”; MPI-4.0: “Named Constants”; MPI-4.1: “Named Constants”; MPI-5.0: “Named Constants”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~MPI procedures sometimes assign a special meaning to a special value of a basic type argument; e.g. `tag` is an integer-valued argument of point-to-point communication operations, with a special wild-card value, MPI_ANY_TAG. Such arguments will have a range of regular values, which is a proper subrange of the range of values of the corresponding basic type; special values (such as MPI_ANY_TAG) will be outside the regular range. The range of regular values can be queried using environmental inquiry functions (Chapter [[versions/v21/sections/inquiry#MPI Environmental Management|MPI Environmental Management]] ).~~

~~MPI also provides predefined named constant handles, such as MPI_COMM_WORLD which is a handle to an object that represents all processes available at start-up time and allowed to communicate with any of them.~~

~~All named constants, with the exception of MPI_BOTTOM in Fortran, can be used in initialization expressions or assignments. These constants do not change values during execution. Opaque objects accessed by constant handles are defined and do not change value between MPI initialization ( [[versions/v21/API/MPI_INIT|MPI_INIT]] call) and MPI completion ( [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] call).~~

==MPI procedures sometimes assign a special meaning to a special value of a basic type argument; e.g., `tag` is an integer-valued argument of point-to-point communication operations, with a special wild-card value, MPI_ANY_TAG. Such arguments will have a range of regular values, which is a proper subrange of the range of values of the corresponding basic type; special values (such as MPI_ANY_TAG) will be outside the regular range.==

==The range of regular values, such as `tag`, can be queried using environmental inquiry functions (Chapter 7 of the MPI-1 document). The range of other values, such as `source`, depends on values given by other MPI routines (in the case of `source` it is the communicator size).==

==MPI also provides predefined named constant handles, such as MPI_COMM_WORLD.==

==All named constants, with the exceptions noted below for Fortran, can be used in initialization expressions or assignments. These constants do not change values during execution. Opaque objects accessed by constant handles are defined and do not change value between MPI initialization ( [[versions/v21/API/MPI_INIT|MPI_INIT]] ) and MPI completion ( [[versions/v21/API/MPI_FINALIZE|MPI_FINALIZE]] ).==

==The constants that cannot be used in initialization expressions or assignments in Fortran are:==

==      MPI_BOTTOM       MPI_STATUS_IGNORE       MPI_STATUSES_IGNORE       MPI_ERRCODES_IGNORE       MPI_IN_PLACE       MPI_ARGV_NULL       MPI_ARGVS_NULL==

==> [!warning] Advice to implementors==

==> In Fortran the implementation of these special constants may require the use of language constructs that are outside the Fortran standard. Using special values for the constants (e.g., by defining them through `parameter` statements) is not possible because an implementation cannot distinguish these values from legal data. Typically, these constants are implemented as predefined static variables (e.g., a variable in an MPI-declared `COMMON` block), relying on the fact that the target compiler passes data by address. Inside the subroutine, this address can be extracted by some mechanism outside the Fortran standard (e.g., by Fortran extensions or by implementing the function in C).==

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

MPI procedures sometimes assign a special meaning to a special value of a basic type argument; e.g., `tag` is an integer-valued argument of point-to-point communication operations, with a special wild-card value, ~~MPI_ANY_TAG.~~ ==`MPI_ANY_TAG`.== Such arguments will have a range of regular values, which is a proper subrange of the range of values of the corresponding basic type; special values (such as ~~MPI_ANY_TAG)~~ ==`MPI_ANY_TAG`)== will be outside the regular range.

~~MPI also provides predefined named constant handles, such as MPI_COMM_WORLD.~~

~~All named constants, with the exceptions noted below for Fortran, can be used in initialization expressions or assignments. These constants do not change values during execution. Opaque objects accessed by constant handles are defined and do not change value between MPI initialization ( [[versions/v22/API/MPI_INIT|MPI_INIT]] ) and MPI completion ( [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] ).~~

==MPI also provides predefined named constant handles, such as `MPI_COMM_WORLD`.==

==All named constants, with the exceptions noted below for Fortran, can be used in initialization expressions or assignments, but not necessarily in array declarations or as labels in C/C++ `switch` or Fortran `select`/`case` statements. This implies named constants to be link-time but not necessarily compile-time constants. The named constants listed below are required to be compile-time constants in both C/C++ and Fortran. These constants do not change values during execution. Opaque objects accessed by constant handles are defined and do not change value between MPI initialization ( [[versions/v22/API/MPI_INIT|MPI_INIT]] ) and MPI completion ( [[versions/v22/API/MPI_FINALIZE|MPI_FINALIZE]] ). The handles themselves are constants and can be also used in initialization expressions or assignments.==

==The constants that are required to be compile-time constants (and can thus be used for array length declarations and labels in C/C++ `switch` and Fortran `case`/`select` statements) are:==

==`MPI_MAX_PROCESSOR_NAME`\ `MPI_MAX_ERROR_STRING`\ `MPI_MAX_DATAREP_STRING`\ `MPI_MAX_INFO_KEY`\ `MPI_MAX_INFO_VAL`\ `MPI_MAX_OBJECT_NAME`\ `MPI_MAX_PORT_NAME`\ `MPI_STATUS_SIZE` (Fortran only)\ `MPI_ADDRESS_KIND` (Fortran only)\ `MPI_INTEGER_KIND` (Fortran only)\ `MPI_OFFSET_KIND` (Fortran only)==

==and their C++ counterparts where appropriate.==

~~MPI_BOTTOM MPI_STATUS_IGNORE MPI_STATUSES_IGNORE MPI_ERRCODES_IGNORE MPI_IN_PLACE MPI_ARGV_NULL MPI_ARGVS_NULL~~ ==\ MPI_BOTTOM\ MPI_STATUS_IGNORE\ MPI_STATUSES_IGNORE\ MPI_ERRCODES_IGNORE\ MPI_IN_PLACE\ MPI_ARGV_NULL\ MPI_ARGVS_NULL\ MPI_UNWEIGHTED==

> In Fortran the implementation of these special constants may require the use of language constructs that are outside the Fortran standard. Using special values for the constants (e.g., by defining them through ~~`parameter`~~ ==`PARAMETER`== statements) is not possible because an implementation cannot distinguish these values from legal data. Typically, these constants are implemented as predefined static variables (e.g., a variable in an MPI-declared `COMMON` block), relying on the fact that the target compiler passes data by address. Inside the subroutine, this address can be extracted by some mechanism outside the Fortran standard (e.g., by Fortran extensions or by implementing the function in C).

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

~~MPI procedures sometimes assign a special meaning to a special value of a basic type argument; e.g., `tag` is an integer-valued argument of point-to-point communication operations, with a special wild-card value, `MPI_ANY_TAG`. Such arguments will have a range of regular values, which is a proper subrange of the range of values of the corresponding basic type; special values (such as `MPI_ANY_TAG`) will be outside the regular range.~~

~~The range of regular values, such as `tag`, can be queried using environmental inquiry functions (Chapter 7 of the MPI-1 document). The range of other values, such as `source`, depends on values given by other MPI routines (in the case of `source` it is the communicator size).~~

==MPI procedures sometimes assign a special meaning to a special value of a basic type argument; e.g., `tag` is an integer-valued argument of point-to-point communication operations, with a special wild-card value, `MPI_ANY_TAG`. Such arguments will have a range of regular values, which is a proper subrange of the range of values of the corresponding basic type; special values (such as `MPI_ANY_TAG`) will be outside the regular range. The range of regular values, such as `tag`, can be queried using environmental inquiry functions (Chapter 7 of the MPI-1 document). The range of other values, such as `source`, depends on values given by other MPI routines (in the case of `source` it is the communicator size).==

~~All named constants, with the exceptions noted below for Fortran, can be used in initialization expressions or assignments, but not necessarily in array declarations or as labels in C/C++ `switch` or Fortran `select`/`case` statements. This implies named constants to be link-time but not necessarily compile-time constants. The named constants listed below are required to be compile-time constants in both C/C++ and Fortran. These constants do not change values during execution. Opaque objects accessed by constant handles are defined and do not change value between MPI initialization ( [[versions/v30/API/MPI_INIT|MPI_INIT]] ) and MPI completion ( [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] ). The handles themselves are constants and can be also used in initialization expressions or assignments.~~

~~The constants that are required to be compile-time constants (and can thus be used for array length declarations and labels in C/C++ `switch` and Fortran `case`/`select` statements) are:~~

~~`MPI_MAX_PROCESSOR_NAME`\ `MPI_MAX_ERROR_STRING`\ `MPI_MAX_DATAREP_STRING`\ `MPI_MAX_INFO_KEY`\ `MPI_MAX_INFO_VAL`\ `MPI_MAX_OBJECT_NAME`\ `MPI_MAX_PORT_NAME`\ `MPI_STATUS_SIZE` (Fortran only)\ `MPI_ADDRESS_KIND` (Fortran only)\ `MPI_INTEGER_KIND` (Fortran only)\ `MPI_OFFSET_KIND` (Fortran only)~~

~~and their C++ counterparts where appropriate.~~

~~The constants that cannot be used in initialization expressions or assignments in Fortran are:~~

~~\ MPI_BOTTOM\ MPI_STATUS_IGNORE\ MPI_STATUSES_IGNORE\ MPI_ERRCODES_IGNORE\ MPI_IN_PLACE\ MPI_ARGV_NULL\ MPI_ARGVS_NULL\ MPI_UNWEIGHTED~~

==All named constants, with the exceptions noted below for Fortran, can be used in initialization expressions or assignments, but not necessarily in array declarations or as labels in C `switch` or Fortran `select`/`case` statements. This implies named constants to be link-time but not necessarily compile-time constants. The named constants listed below are required to be compile-time constants in both C and Fortran. These constants do not change values during execution. Opaque objects accessed by constant handles are defined and do not change value between MPI initialization ( [[versions/v30/API/MPI_INIT|MPI_INIT]] ) and MPI completion ( [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] ). The handles themselves are constants and can be also used in initialization expressions or assignments.==

==The constants that are required to be compile-time constants (and can thus be used for array length declarations and labels in C `switch` and Fortran `case`/`select` statements) are:==

==`MPI_MAX_PROCESSOR_NAME`\ `MPI_MAX_LIBRARY_VERSION_STRING`\ `MPI_MAX_ERROR_STRING`\ `MPI_MAX_DATAREP_STRING`\ `MPI_MAX_INFO_KEY`\ `MPI_MAX_INFO_VAL`\ `MPI_MAX_OBJECT_NAME`\ `MPI_MAX_PORT_NAME`\ `MPI_VERSION`\ `MPI_SUBVERSION`\ `MPI_STATUS_SIZE` (Fortran only)\ `MPI_ADDRESS_KIND` (Fortran only)\ `MPI_COUNT_KIND` (Fortran only)\ `MPI_INTEGER_KIND` (Fortran only)\ `MPI_OFFSET_KIND` (Fortran only)\ \ `MPI_SUBARRAYS_SUPPORTED` (Fortran only)\ \ \ `MPI_ASYNC_PROTECTS_NONBLOCKING` (Fortran only)\ The constants that cannot be used in initialization expressions or assignments in Fortran are:==

==\ MPI_BOTTOM\ MPI_STATUS_IGNORE\ MPI_STATUSES_IGNORE\ MPI_ERRCODES_IGNORE\ MPI_IN_PLACE\ MPI_ARGV_NULL\ MPI_ARGVS_NULL\ MPI_UNWEIGHTED\ MPI_WEIGHTS_EMPTY==

> In Fortran the implementation of these special constants may require the use of language constructs that are outside the Fortran standard. Using special values for the constants (e.g., by defining them through `PARAMETER` statements) is not possible because an implementation cannot distinguish these values from ~~legal~~ ==valid== data. Typically, these constants are implemented as predefined static variables (e.g., a variable in an MPI-declared `COMMON` block), relying on the fact that the target compiler passes data by address. Inside the subroutine, this address can be extracted by some mechanism outside the Fortran standard (e.g., by Fortran extensions or by implementing the function in C).

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

MPI procedures sometimes assign a special meaning to a special value of a basic type argument; e.g., `tag` is an integer-valued argument of point-to-point communication operations, with a special wild-card value, `MPI_ANY_TAG`. Such arguments will have a range of regular values, which is a proper subrange of the range of values of the corresponding basic type; special values (such as `MPI_ANY_TAG`) will be outside the regular range. The range of regular values, such as `tag`, can be queried using environmental inquiry ~~functions (Chapter 7 of the MPI-1 document).~~ ==functions, see [[Chapter]] chap:environment.== The range of other values, such as `source`, depends on values given by other MPI routines (in the case of `source` it is the communicator size).

~~`MPI_MAX_PROCESSOR_NAME`\ `MPI_MAX_LIBRARY_VERSION_STRING`\ `MPI_MAX_ERROR_STRING`\ `MPI_MAX_DATAREP_STRING`\ `MPI_MAX_INFO_KEY`\ `MPI_MAX_INFO_VAL`\ `MPI_MAX_OBJECT_NAME`\ `MPI_MAX_PORT_NAME`\ `MPI_VERSION`\ `MPI_SUBVERSION`\ `MPI_STATUS_SIZE` (Fortran only)\ `MPI_ADDRESS_KIND` (Fortran only)\ `MPI_COUNT_KIND` (Fortran only)\ `MPI_INTEGER_KIND` (Fortran only)\ `MPI_OFFSET_KIND` (Fortran only)\ \ `MPI_SUBARRAYS_SUPPORTED` (Fortran only)\ \ \ `MPI_ASYNC_PROTECTS_NONBLOCKING` (Fortran only)\ The constants that cannot be used in initialization expressions or assignments in Fortran are:~~

==`MPI_MAX_PROCESSOR_NAME`\ `MPI_MAX_LIBRARY_VERSION_STRING`\ `MPI_MAX_ERROR_STRING`\ `MPI_MAX_DATAREP_STRING`\ `MPI_MAX_INFO_KEY`\ `MPI_MAX_INFO_VAL`\ `MPI_MAX_OBJECT_NAME`\ `MPI_MAX_PORT_NAME`\ `MPI_VERSION`\ `MPI_SUBVERSION`\ `MPI_STATUS_SIZE` (Fortran only)\ `MPI_ADDRESS_KIND` (Fortran only)\ `MPI_COUNT_KIND` (Fortran only)\ `MPI_INTEGER_KIND` (Fortran only)\ `MPI_OFFSET_KIND` (Fortran only)\ `MPI_SUBARRAYS_SUPPORTED` (Fortran only)\ `MPI_ASYNC_PROTECTS_NONBLOCKING` (Fortran only)==

==The constants that cannot be used in initialization expressions or assignments in Fortran are as follows:==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

The constants that are required to be compile-time constants (and can thus be used for array length declarations and labels in C `switch` and Fortran `case`/`select` statements) are:

~~`MPI_MAX_PROCESSOR_NAME`\~~ ==MPI_MAX_PROCESSOR_NAME\== `MPI_MAX_LIBRARY_VERSION_STRING`\ `MPI_MAX_ERROR_STRING`\ `MPI_MAX_DATAREP_STRING`\ `MPI_MAX_INFO_KEY`\ `MPI_MAX_INFO_VAL`\ `MPI_MAX_OBJECT_NAME`\ `MPI_MAX_PORT_NAME`\ `MPI_VERSION`\ `MPI_SUBVERSION`\ ==`MPI_F_STATUS_SIZE` (C only)\== `MPI_STATUS_SIZE` (Fortran only)\ `MPI_ADDRESS_KIND` (Fortran only)\ `MPI_COUNT_KIND` (Fortran only)\ `MPI_INTEGER_KIND` (Fortran only)\ `MPI_OFFSET_KIND` (Fortran only)\ `MPI_SUBARRAYS_SUPPORTED` (Fortran only)\ `MPI_ASYNC_PROTECTS_NONBLOCKING` (Fortran only)

~~\~~ MPI_BOTTOM\ ~~MPI_STATUS_IGNORE\ MPI_STATUSES_IGNORE\ MPI_ERRCODES_IGNORE\ MPI_IN_PLACE\ MPI_ARGV_NULL\ MPI_ARGVS_NULL\ MPI_UNWEIGHTED\ MPI_WEIGHTS_EMPTY~~ ==`MPI_STATUS_IGNORE`\ `MPI_STATUSES_IGNORE`\ `MPI_ERRCODES_IGNORE`\ `MPI_IN_PLACE`\ `MPI_ARGV_NULL`\ `MPI_ARGVS_NULL`\ `MPI_UNWEIGHTED`\ `MPI_WEIGHTS_EMPTY`==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

All named ==MPI== constants, with the exceptions noted below for Fortran, can be used in initialization expressions or ~~assignments, but not necessarily in array declarations or as labels in C `switch` or Fortran `select`/`case` statements. This implies named constants to be link-time but not necessarily compile-time constants. The named constants listed below are required to be compile-time constants in both C and Fortran. These constants do not change values during execution.~~ ==assignments.== Opaque objects accessed by constant handles are defined and do not change value between MPI initialization ~~(~~ ==(e.g., with== [[versions/v41/API/MPI_INIT|MPI_INIT]] ) and MPI ~~completion (~~ ==finalization (e.g., with== [[versions/v41/API/MPI_FINALIZE|MPI_FINALIZE]] ). The handles themselves are constants and can be also used in initialization expressions or assignments.

~~The~~ ==In C, all named MPI== constants that are ==described as “integer constant expression” in Section [[versions/v41/sections/appLang-Const#Defined Constants|Defined Constants]] must be implemented as *C integer constant expressions* of the specified integer type. All other MPI constants in C are not== required to be ~~compile-time constants (and can thus~~ ==*C integer constant expressions* but must== be ~~used for~~ ==usable in initialization expressions and assignments. Thus, they are not guaranteed to be usable in== array ~~length~~ declarations ~~and labels~~ ==or as case-labels== in ~~C~~ `switch` ~~and Fortran `case`/`select` statements) are:~~ ==statements.==

~~MPI_MAX_PROCESSOR_NAME\ `MPI_MAX_LIBRARY_VERSION_STRING`\ `MPI_MAX_ERROR_STRING`\ `MPI_MAX_DATAREP_STRING`\ `MPI_MAX_INFO_KEY`\ `MPI_MAX_INFO_VAL`\ `MPI_MAX_OBJECT_NAME`\ `MPI_MAX_PORT_NAME`\ `MPI_VERSION`\ `MPI_SUBVERSION`\ `MPI_F_STATUS_SIZE` (C only)\ `MPI_STATUS_SIZE` (Fortran only)\ `MPI_ADDRESS_KIND` (Fortran only)\ `MPI_COUNT_KIND` (Fortran only)\ `MPI_INTEGER_KIND` (Fortran only)\ `MPI_OFFSET_KIND` (Fortran only)\ `MPI_SUBARRAYS_SUPPORTED` (Fortran only)\ `MPI_ASYNC_PROTECTS_NONBLOCKING` (Fortran only)~~ ==In Fortran, all named MPI constants (with the exceptions below) must be declared with the `PARAMETER` attribute.==

~~MPI_BOTTOM\ `MPI_STATUS_IGNORE`\ `MPI_STATUSES_IGNORE`\ `MPI_ERRCODES_IGNORE`\ `MPI_IN_PLACE`\ `MPI_ARGV_NULL`\ `MPI_ARGVS_NULL`\ `MPI_UNWEIGHTED`\~~ ==`MPI_BOTTOM` `MPI_BUFFER_AUTOMATIC` `MPI_STATUS_IGNORE` `MPI_STATUSES_IGNORE` `MPI_ERRCODES_IGNORE` `MPI_IN_PLACE` `MPI_ARGV_NULL` `MPI_ARGVS_NULL` `MPI_UNWEIGHTED`== `MPI_WEIGHTS_EMPTY`

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Named constants]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Named Constants]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Named Constants]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Named Constants]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Named Constants]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Named Constants]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Named Constants]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Named Constants]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Named Constants]]

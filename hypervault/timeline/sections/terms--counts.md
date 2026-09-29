---
title: "Counts"
chapter: terms
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Counts

Chapter **terms** · in [[versions/v30/sections/terms#Counts|MPI-3.0]], [[versions/v31/sections/terms#Counts|MPI-3.1]], [[versions/v40/sections/terms#Counts|MPI-4.0]], [[versions/v41/sections/terms#Counts|MPI-4.1]], [[versions/v50/sections/terms#Counts|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~As described above, MPI defines types (e.g., `MPI_Aint`) to address locations within memory and other types (e.g., `MPI_Offset`) to address locations within files. In addition, some MPI procedures use *count* arguments that represent a number of MPI datatypes on which to operate. At times, one needs a single type that can be used to address locations within either memory or files as well as express *count* values, and that type is `MPI_Count` in C and `INTEGER (KIND=MPI_COUNT_KIND)` in Fortran. These types must have the same width and encode values in the same manner such that count values in one language may be passed directly to another language without conversion.~~

~~The size of the `MPI_Count` type is determined by the MPI implementation with the restriction that it must be minimally capable of encoding any value that may be stored in a variable of type `int`, `MPI_Aint`, or `MPI_Offset` in C and of type `INTEGER`, `INTEGER (KIND=MPI_ADDRESS_KIND)`, or `INTEGER (KIND=MPI_OFFSET_KIND)` in Fortran.~~

==As described above, MPI defines types (e.g., `MPI_Aint`) to address locations within memory and other types (e.g., `MPI_Offset`) to address locations within files. In addition, some MPI procedures use *count* arguments that represent a number of MPI datatypes on which to operate. At times, one needs a single type that can be used to address locations within either memory or files as well as express *count* values, and that type is `MPI_Count` in C and `INTEGER (KIND=MPI_COUNT_KIND)` in Fortran. These types must have the same width and encode values in the same manner such that count values in one language may be passed directly to another language without conversion. The size of the `MPI_Count` type is determined by the MPI implementation with the restriction that it must be minimally capable of encoding any value that may be stored in a variable of type `int`, `MPI_Aint`, or `MPI_Offset` in C and of type `INTEGER`, `INTEGER (KIND=MPI_ADDRESS_KIND)`, or `INTEGER (KIND=MPI_OFFSET_KIND)` in Fortran.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

As described above, MPI defines types (e.g., `MPI_Aint`) to address locations within memory and other types (e.g., `MPI_Offset`) to address locations within files. In addition, some MPI procedures use *count* arguments that represent a number of MPI datatypes on which to operate. ==Furthermore, *timestamps* in the context of the MPI Tool Information Interface are a count of clock ticks elapsed since some time in the past.== At times, one needs a single type that can be used to address locations within either memory or files as well as express *count* values, and that type is `MPI_Count` in C and ~~`INTEGER (KIND=MPI_COUNT_KIND)`~~ ==`INTEGER(KIND=MPI_COUNT_KIND)`== in Fortran. These types must have the same width and encode values in the same manner such that count values in one language may be passed directly to another language without conversion. The size of the `MPI_Count` type is determined by the MPI implementation with the restriction that it must be minimally capable of encoding any value that may be stored in a variable of type `int`, `MPI_Aint`, or `MPI_Offset` in C and of type `INTEGER`, ~~`INTEGER (KIND=MPI_ADDRESS_KIND)`,~~ ==`INTEGER(KIND=MPI_ADDRESS_KIND)`,== or ~~`INTEGER (KIND=MPI_OFFSET_KIND)`~~ ==`INTEGER(KIND=MPI_OFFSET_KIND)`== in Fortran. ==Even though the `MPI_Count` type is large enough to encode address locations, the `MPI_Count` type shall not be used to represent an *absolute address*.==

~~> Count values logically need to be large enough to encode any value used for expressing element counts, type maps in memory, type maps in file views, etc. For backward compatibility reasons, many MPI routines still use `int` in C and `INTEGER` in Fortran as the type of count arguments.~~

==> Count values need to be large enough to encode any value used for expressing element counts, strides, offsets, indexes, displacements, typemaps in memory, typemaps in file views, etc. Prior to MPI-4.0, many MPI routines used `int` in C and `INTEGER` in Fortran as the type for *count* arguments. To avoid breaking backward compatibility, this version of the standard continues to support `int` in C as well as `INTEGER` in Fortran in such routines. In addition, this version of the standard supports using `MPI_Count` in C (via separate “`_c`” suffixed procedures) as well as `INTEGER(KIND=MPI_COUNT_KIND)` in Fortran (via polymorphic interfaces in newer MPI Fortran bindings (`USE mpi_f08`)) in such routines. See Section [[versions/v40/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|Support for Large Count and Large Byte Displacement in MPI Language Bindings]] for a full explanation.==

==The phrase **large count** refers to the use of `MPI_Count` and `INTEGER(KIND=MPI_COUNT_KIND)` parameter types.==

==There are cases where `MPI_UNDEFINED` can be returned in a **large count** OUT parameter.==

==Per Table [[versions/v40/sections/appLang-Const#Defined Constants|Defined Constants]] (page [[versions/v40/sections/appLang-Const#Defined Constants|Defined Constants]] ), the `MPI_UNDEFINED` constant is defined to be a C `int` (or unnamed `enum`) and a Fortran `INTEGER`.==

==Implementations shall therefore choose the underlying types for `MPI_Count` and `INTEGER(KIND=MPI_COUNT_KIND)` such that they can be compared to `MPI_UNDEFINED`.==

==> [!warning] Advice to implementors==

==> The comparison of `MPI_UNDEFINED` to an `MPI_Count` or `INTEGER(KIND=MPI_COUNT_KIND)` may need to be via a casting operation.==

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

~~As described above, MPI defines types (e.g., `MPI_Aint`) to address locations within memory and other types (e.g., `MPI_Offset`) to address locations within files. In addition, some MPI procedures use *count* arguments that represent a number of MPI datatypes on which to operate. Furthermore, *timestamps* in the context of the MPI Tool Information Interface are a count of clock ticks elapsed since some time in the past. At times, one needs a single type that can be used to address locations within either memory or files as well as express *count* values, and that type is `MPI_Count` in C and `INTEGER(KIND=MPI_COUNT_KIND)` in Fortran. These types must have the same width and encode values in the same manner such that count values in one language may be passed directly to another language without conversion. The size of the `MPI_Count` type is determined by the MPI implementation with the restriction that it must be minimally capable of encoding any value that may be stored in a variable of type `int`, `MPI_Aint`, or `MPI_Offset` in C and of type `INTEGER`, `INTEGER(KIND=MPI_ADDRESS_KIND)`, or `INTEGER(KIND=MPI_OFFSET_KIND)` in Fortran. Even though the `MPI_Count` type is large enough to encode address locations, the `MPI_Count` type shall not be used to represent an *absolute address*.~~

==As described above, MPI defines types (e.g., `MPI_Aint`) to address locations within memory and other types (e.g., `MPI_Offset`) to address locations within files. In addition, some MPI procedures use *count* arguments that represent a number of MPI datatypes on which to operate. Furthermore, *timestamps* in the context of the MPI Tool Information Interface are a count of clock ticks elapsed since some time in the past. At times, one needs a single type that can be used to address locations within either memory or files as well as express *count* values, and that type is `MPI_Count` in C and `INTEGER(KIND=MPI_COUNT_KIND)`==

==in Fortran. These types must have the same width and encode values in the same manner such that count values in one language may be passed directly to another language without conversion. The size of the `MPI_Count` type is determined by the MPI implementation with the restriction that it must be minimally capable of encoding any value that may be stored in a variable of type `int`, `MPI_Aint`, or `MPI_Offset` in C and of type `INTEGER`, `ADDRESS`, or `OFFSET` in Fortran. Even though the `MPI_Count` type is large enough to encode address locations, the `MPI_Count` type shall not be used to represent an *absolute address*.==

> Count values need to be large enough to encode any value used for expressing element counts, strides, offsets, indexes, displacements, typemaps in memory, typemaps in file views, etc. Prior to MPI-4.0, many MPI routines used `int` in C and `INTEGER` in Fortran as the type for *count* arguments. To avoid breaking backward compatibility, this version of the standard continues to support `int` in C as well as `INTEGER` in Fortran in such routines. In addition, this version of the standard supports using `MPI_Count` in C (via separate “`_c`” suffixed procedures) as well as ~~`INTEGER(KIND=MPI_COUNT_KIND)`~~ ==`COUNT`== in Fortran (via polymorphic interfaces in newer MPI Fortran bindings (`USE mpi_f08`)) in such routines. See Section [[versions/v41/sections/binding#Support for Large Count and Large Byte Displacement in MPI Language Bindings|Support for Large Count and Large Byte Displacement in MPI Language Bindings]] for a full explanation.

The phrase **large count** refers to the use of `MPI_Count` and ~~`INTEGER(KIND=MPI_COUNT_KIND)`~~ ==`COUNT`== parameter types.

Implementations shall therefore choose the underlying types for `MPI_Count` and ~~`INTEGER(KIND=MPI_COUNT_KIND)`~~ ==`COUNT`== such that they can be compared to `MPI_UNDEFINED`.

> The comparison of `MPI_UNDEFINED` to an `MPI_Count` or ~~`INTEGER(KIND=MPI_COUNT_KIND)`~~ ==`COUNT`== may need to be via a casting operation.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Counts]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Counts]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Counts]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Counts]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Counts]]

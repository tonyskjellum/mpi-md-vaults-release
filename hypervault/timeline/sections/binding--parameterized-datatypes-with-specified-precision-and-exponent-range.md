---
title: "Parameterized Datatypes with Specified Precision and Exponent Range"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Parameterized Datatypes with Specified Precision and Exponent Range

Chapter **binding** · in [[versions/v20/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range|MPI-2.0]], [[versions/v21/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range|MPI-2.1]], [[versions/v22/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range|MPI-2.2]], [[versions/v30/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range|MPI-3.0]], [[versions/v31/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range|MPI-3.1]], [[versions/v40/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range|MPI-4.0]], [[versions/v41/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range|MPI-4.1]], [[versions/v50/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (4 changed paragraphs)

~~MPI-1 provides named datatypes corresponding to standard Fortran 77 numeric types — MPI_INTEGER, MPI_COMPLEX, MPI_REAL, MPI_DOUBLE_PRECISION and MPI_DOUBLE_COMPLEX. MPI automatically selects the correct data size and provides representation conversion in heterogeneous environments. The mechanism described in this section extends this MPI-1 model to support portable parameterized numeric types.~~

==MPI==

==provides named datatypes corresponding to standard Fortran 77 numeric types — MPI_INTEGER, MPI_COMPLEX, MPI_REAL, MPI_DOUBLE_PRECISION and MPI_DOUBLE_COMPLEX. MPI automatically selects the correct data size and provides representation conversion in heterogeneous environments. The mechanism described in this section extends this model to support portable parameterized numeric types.==

~~> The datatypes returned by the above functions are predefined datatypes. They cannot be freed; they do not need to be committed; they can be used with predefined reduction operations. There are two situations in which they behave differently syntactically, but not semantically, from the MPI named predefined datatypes. > > 1.  [[versions/v21/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] returns special combiners that allow a program to retrieve the values of [[p]] and [[r]] . > > 2.  Because the datatypes are not named, they cannot be used as compile-time initializers or otherwise accessed before a call to one of the [[MPI_TYPE_CREATE_F90]] routines. > > If a variable was declared specifying a non-default `KIND` value that was not obtained with `selected_real_kind()` or `selected_int_kind()`, the only way to obtain a matching MPI datatype is to use the size-based mechanism described in the next section.~~

==> The datatypes returned by the above functions are predefined datatypes. They cannot be freed; they do not need to be committed; they can be used with predefined reduction operations. There are two situations in which they behave differently syntactically, but not semantically, from the MPI named predefined datatypes. > > 1.  [[versions/v21/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] returns special combiners that allow a program to retrieve the values of `p` and `r`. > > 2.  Because the datatypes are not named, they cannot be used as compile-time initializers or otherwise accessed before a call to one of the [[MPI_TYPE_CREATE_F90]] routines. > > If a variable was declared specifying a non-default `KIND` value that was not obtained with `selected_real_kind()` or `selected_int_kind()`, the only way to obtain a matching MPI datatype is to use the size-based mechanism described in the next section.==

==> [!warning] Advice to implementors==

==> An application may often repeat a call to [[MPI_TYPE_CREATE_F90_xxxx]] with the same combination of > > (`xxxx`,`p`,`r`). > > The application is not allowed to free the returned predefined, unnamed datatype handles. To prevent the creation of a potentially huge amount of handles, > > a high quality > > MPI implementation should return the same datatype handle for the same > > (`REAL`/`COMPLEX`/ `INTEGER`,`p`,`r`) > > combination. Checking for the combination (`p`,`r`) in the preceding call to [[MPI_TYPE_CREATE_F90_xxxx]] and using a hash-table to find formerly generated handles should limit the overhead of finding a previously generated datatype with same combination of (`xxxx`,`p`,`r`).==

~~The external32 representations of the datatypes returned by [[MPI_TYPE_CREATE_F90_REAL/COMPLEX/INTEGER]] are given by the following rules.~~

==The external32 representations of the datatypes returned by==

==[[MPI_TYPE_CREATE_F90_REAL/COMPLEX/INTEGER]] are given by the following rules.==

If the external32 representation of a datatype is undefined, the result of using the datatype directly or indirectly (i.e., as part of another datatype or through a duplicated datatype) in operations that require the external32 representation is undefined. These operations include [[versions/v21/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] , [[versions/v21/API/MPI_UNPACK_EXTERNAL|MPI_UNPACK_EXTERNAL]] and many ~~[[MPI_FILE]]~~ ==`MPI_FILE`== functions, when the “external32” data representation is used. The ranges for which the external32 representation is undefined are reserved for future standardization.

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

provides named datatypes corresponding to standard Fortran 77 numeric types — ~~MPI_INTEGER, MPI_COMPLEX, MPI_REAL, MPI_DOUBLE_PRECISION~~ ==`MPI_INTEGER`, `MPI_COMPLEX`, `MPI_REAL`, `MPI_DOUBLE_PRECISION`== and ~~MPI_DOUBLE_COMPLEX.~~ ==`MPI_DOUBLE_COMPLEX`.== MPI automatically selects the correct data size and provides representation conversion in heterogeneous environments. The mechanism described in this section extends this model to support portable parameterized numeric types.

contained in these implicit arrays are not the same as the named MPI datatypes ~~MPI_REAL,~~ ==`MPI_REAL`,== etc., but a new set.

Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to ~~MPI_UNDEFINED.~~ ==`MPI_UNDEFINED`.==

Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to ~~MPI_UNDEFINED.~~ ==`MPI_UNDEFINED`.==

### MPI-2.2 → MPI-3.0  (9 changed paragraphs)

~~MPI~~

~~provides named datatypes corresponding to standard Fortran 77 numeric types — `MPI_INTEGER`, `MPI_COMPLEX`, `MPI_REAL`, `MPI_DOUBLE_PRECISION` and `MPI_DOUBLE_COMPLEX`. MPI automatically selects the correct data size and provides representation conversion in heterogeneous environments. The mechanism described in this section extends this model to support portable parameterized numeric types.~~

~~The model for supporting portable parameterized types is as follows. Real variables are declared (perhaps indirectly) using `selected_real_kind(p, r)` to determine the `KIND` parameter, where `p` is decimal digits of precision and `r` is an exponent range.~~

~~Implicitly MPI maintains~~

~~a two-dimensional array of predefined MPI datatypes `D(p, r)`. `D(p, r)` is defined for each value of `(p, r)` supported by the compiler, including pairs for which one value is unspecified. Attempting to access an element of the array with an index `(p, r)` not supported by the compiler is erroneous.~~

~~MPI implicitly maintains a similar array of `COMPLEX` datatypes.~~

~~For integers, there is a similar implicit array related to `selected_int_kind` and indexed by~~

~~the requested number of digits `r`. Note that the predefined datatypes~~

~~contained in these implicit arrays are not the same as the named MPI datatypes `MPI_REAL`, etc., but a new set.~~

==MPI provides named datatypes corresponding to standard Fortran 77 numeric types: `MPI_INTEGER`, `MPI_COMPLEX`, `MPI_REAL`, `MPI_DOUBLE_PRECISION` and `MPI_DOUBLE_COMPLEX`. MPI automatically selects the correct data size and provides representation conversion in heterogeneous environments. The mechanism described in this section extends this model to support portable parameterized numeric types.==

==The model for supporting portable parameterized types is as follows. Real variables are declared (perhaps indirectly) using `selected_real_kind(p, r)` to determine the `KIND` parameter, where `p` is decimal digits of precision and `r` is an exponent range. Implicitly MPI maintains a two-dimensional array of predefined MPI datatypes `D(p, r)`. `D(p, r)` is defined for each value of `(p, r)` supported by the compiler, including pairs for which one value is unspecified. Attempting to access an element of the array with an index `(p, r)` not supported by the compiler is erroneous. MPI implicitly maintains a similar array of `COMPLEX` datatypes. For integers, there is a similar implicit array related to `selected_int_kind` and indexed by the requested number of digits `r`. Note that the predefined datatypes contained in these implicit arrays are not the same as the named MPI datatypes `MPI_REAL`, etc., but a new set.==

~~This function returns a predefined MPI datatype that matches a `REAL` variable of `KIND` `selected_real_kind(p, r)`. In the model described above it returns a handle for the element `D(p, r)`.~~

~~Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to `MPI_UNDEFINED`.~~

~~In communication, an MPI datatype `A` returned by [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] matches a datatype `B` if and only if `B` was returned by [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] called with the same values for `p` and `r` or `B` is a duplicate of such a datatype.~~

~~Restrictions on using the returned datatype with the “external32” data representation are given on page [[f90-kind-external32]] .~~

==This function returns a predefined MPI datatype that matches a `REAL` variable of `KIND` `selected_real_kind(p, r)`. In the model described above it returns a handle for the element `D(p, r)`. Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to `MPI_UNDEFINED`. In communication, an MPI datatype `A` returned by [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] matches a datatype `B` if and only if `B` was returned by [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] called with the same values for `p` and `r` or `B` is a duplicate of such a datatype. Restrictions on using the returned datatype with the “external32” data representation are given on page [[f90-kind-external32]] .==

~~This function returns a predefined MPI datatype that matches a `COMPLEX` variable of `KIND` `selected_real_kind(p, r)`.~~

~~Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to `MPI_UNDEFINED`.~~

~~Matching rules for datatypes created by this function are analogous to the matching rules for datatypes created by [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] .~~

~~Restrictions on using the returned datatype with the “external32” data representation are given on page [[f90-kind-external32]] .~~

==This function returns a predefined MPI datatype that matches a `COMPLEX` variable of `KIND` `selected_real_kind(p, r)`. Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to `MPI_UNDEFINED`. Matching rules for datatypes created by this function are analogous to the matching rules for datatypes created by [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] . Restrictions on using the returned datatype with the “external32” data representation are given on page [[f90-kind-external32]] .==

~~This function returns a predefined MPI datatype that matches a `INTEGER` variable of `KIND` `selected_int_kind(r)`. Matching rules for datatypes created by this function are analogous to the matching rules for datatypes created by [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] .~~

~~Restrictions on using the returned datatype with the “external32” data representation are given on page [[f90-kind-external32]] .~~

==This function returns a predefined MPI datatype that matches a `INTEGER` variable of `KIND` `selected_int_kind(r)`. Matching rules for datatypes created by this function are analogous to the matching rules for datatypes created by [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] . Restrictions on using the returned datatype with the “external32” data representation are given on page [[f90-kind-external32]] .==

> The datatypes returned by the above functions are predefined datatypes. They cannot be freed; they do not need to be committed; they can be used with predefined reduction operations. There are two situations in which they behave differently syntactically, but not semantically, from the MPI named predefined datatypes. > > 1. [[versions/v30/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] returns special combiners that allow a program to retrieve the values of `p` and `r`. > > 2. Because the datatypes are not named, they cannot be used as compile-time initializers or otherwise accessed before a call to one of the ~~[[MPI_TYPE_CREATE_F90]]~~ ==[[MPI_TYPE_CREATE_F90_xxxx]]== routines. > > If a variable was declared specifying a non-default `KIND` value that was not obtained with `selected_real_kind()` or `selected_int_kind()`, the only way to obtain a matching MPI datatype is to use the size-based mechanism described in the next section.

> An application may often repeat a call to [[MPI_TYPE_CREATE_F90_xxxx]] with the same combination of ~~> >~~ (`xxxx`,`p`,`r`). ~~> >~~ The application is not allowed to free the returned predefined, unnamed datatype handles. To prevent the creation of a potentially huge amount of handles, > > a high quality ~~> >~~ MPI implementation should return the same datatype handle for the same ~~> >~~ (`REAL`/`COMPLEX`/ `INTEGER`,`p`,`r`) ~~> >~~ combination. Checking for the combination (`p`,`r`) in the preceding call to [[MPI_TYPE_CREATE_F90_xxxx]] and using a ~~hash-table~~ ==hash table== to find formerly generated handles should limit the overhead of finding a previously generated datatype with same combination of (`xxxx`,`p`,`r`).

~~The external32 representation specifies data formats for integer and floating point values. Integer values are represented in two’s complement big-endian format. Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double” and “Double Extended” formats, requiring 4, 8 and 16 bytes of storage, respectively.~~

~~For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits, bias = +10383, 112 fraction bits, and an encoding analogous to the “Double” format.~~

==The external32 representation specifies data formats for integer and floating point values. Integer values are represented in two’s complement big-endian format. Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double,” and “Double Extended” formats, requiring 4, 8, and 16 bytes of storage, respectively. For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits, bias = +10383, 112 fraction bits, and an encoding analogous to the “Double” format.==

~~[[MPI_TYPE_CREATE_F90_REAL/COMPLEX/INTEGER]] are given by the following rules.~~

~~  For [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] :~~

==[[MPI_TYPE_CREATE_F90_REAL/COMPLEX/INTEGER]] are given by the following rules.   For [[versions/v30/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] :==

If the external32 representation of a datatype is undefined, the result of using the datatype directly or indirectly (i.e., as part of another datatype or through a duplicated datatype) in operations that require the external32 representation is undefined. These operations include [[versions/v30/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] , [[versions/v30/API/MPI_UNPACK_EXTERNAL|MPI_UNPACK_EXTERNAL]] ==,== and many `MPI_FILE` functions, when the “external32” data representation is used. The ranges for which the external32 representation is undefined are reserved for future standardization.

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

> The datatypes returned by the above functions are predefined datatypes. They cannot be freed; they do not need to be committed; they can be used with predefined reduction operations. There are two situations in which they behave differently syntactically, but not semantically, from the MPI named predefined datatypes. > > 1. [[versions/v31/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] returns special combiners that allow a program to retrieve the values of `p` and `r`. > > 2. Because the datatypes are not named, they cannot be used as compile-time initializers or otherwise accessed before a call to one of the ~~[[MPI_TYPE_CREATE_F90_xxxx]]~~ ==`MPI_TYPE_CREATE_F90_XXX`== routines. > > If a variable was declared specifying a non-default `KIND` value that was not obtained with `selected_real_kind()` or `selected_int_kind()`, the only way to obtain a matching MPI datatype is to use the size-based mechanism described in the next section.

> An application may often repeat a call to ~~[[MPI_TYPE_CREATE_F90_xxxx]]~~ ==`MPI_TYPE_CREATE_F90_XXX`== with the same combination of ~~(`xxxx`,`p`,`r`).~~ ==(`XXX`,`p`,`r`).== The application is not allowed to free the returned predefined, unnamed datatype handles. To prevent the creation of a potentially huge amount of handles, ~~> >~~ a high quality MPI implementation should return the same datatype handle for the same (`REAL`/`COMPLEX`/ `INTEGER`,`p`,`r`) combination. Checking for the combination (`p`,`r`) in the preceding call to ~~[[MPI_TYPE_CREATE_F90_xxxx]]~~ ==`MPI_TYPE_CREATE_F90_XXX`== and using a hash table to find formerly generated handles should limit the overhead of finding a previously generated datatype with same combination of ~~(`xxxx`,`p`,`r`).~~ ==(`XXX`,`p`,`r`).==

> The [[MPI_TYPE_CREATE_F90_REAL/COMPLEX/INTEGER]] interface needs as input the original range and precision values to be able to define useful and compiler-independent external ~~(Section [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page~~ ==(== [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] ) or user-defined ~~(Section [[versions/v31/sections/io#User-Defined Data Representations|User-Defined Data Representations]] on page~~ ==(== [[versions/v31/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ) data representations, and in order to be able to perform automatic and efficient data conversions in a heterogeneous environment.

We now specify how the datatypes described in this section behave when used with the “external32” external data representation described in ~~Section [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] on page~~ [[versions/v31/sections/io#External Data Representation: “external32”|External Data Representation: “external32”]] .

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

This function returns a predefined MPI datatype that matches a `REAL` variable of `KIND` `selected_real_kind(p, r)`. In the model described above it returns a handle for the element `D(p, r)`. Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to `MPI_UNDEFINED`. In communication, an MPI datatype `A` returned by [[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] matches a datatype `B` if and only if `B` was returned by [[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] called with the same values for `p` and `r` or `B` is a duplicate of such a datatype. Restrictions on using the returned datatype with the ~~“external32”~~ ==`external32`== data representation are given on page [[f90-kind-external32]] .

This function returns a predefined MPI datatype that matches a `COMPLEX` variable of `KIND` `selected_real_kind(p, r)`. Either `p` or `r` may be omitted from calls to `selected_real_kind(p, r)` (but not both). Analogously, either `p` or `r` may be set to `MPI_UNDEFINED`. Matching rules for datatypes created by this function are analogous to the matching rules for datatypes created by [[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] . Restrictions on using the returned datatype with the ~~“external32”~~ ==`external32`== data representation are given on page [[f90-kind-external32]] .

This function returns a predefined MPI datatype that matches ~~a~~ ==an== `INTEGER` variable of `KIND` `selected_int_kind(r)`. Matching rules for datatypes created by this function are analogous to the matching rules for datatypes created by [[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] . Restrictions on using the returned datatype with the ~~“external32”~~ ==`external32`== data representation are given on page [[f90-kind-external32]] .

integer longtype, quadtype integer, parameter :: long = selected_int_kind(15) integer(long) ii(10) real(selected_real_kind(30)) x(10) call MPI_TYPE_CREATE_F90_INTEGER(15, longtype, ierror) call MPI_TYPE_CREATE_F90_REAL(30, MPI_UNDEFINED, quadtype, ierror) ...

call MPI_SEND(ii, 10, longtype, ...) call MPI_SEND(x, 10, quadtype, ...)

> The datatypes returned by the above functions are predefined datatypes. They cannot be freed; they do not need to be committed; they can be used with predefined reduction operations. There are two situations in which they behave differently syntactically, but not semantically, from the MPI named predefined datatypes. > > 1. [[versions/v40/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] returns special combiners that allow a program to retrieve the values of `p` and `r`. > > 2. Because the datatypes are not named, they cannot be used as compile-time initializers or otherwise accessed before a call to one of the `MPI_TYPE_CREATE_F90_XXX` routines. > > If a variable was declared specifying a ~~non-default~~ ==nondefault== `KIND` value that was not obtained with `selected_real_kind()` or `selected_int_kind()`, the only way to obtain a matching MPI datatype is to use the size-based mechanism described in the next section.

> The [[MPI_TYPE_CREATE_F90_REAL/COMPLEX/INTEGER]] interface needs as input the original range and precision values to be able to define useful and compiler-independent external ( [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== ) or user-defined ( [[versions/v40/sections/io#User-Defined Data Representations|User-Defined Data Representations]] ) data representations, and in order to be able to perform automatic and efficient data conversions in a heterogeneous environment.

We now specify how the datatypes described in this section behave when used with the ~~“external32”~~ ==`external32`== external data representation described in [[versions/v40/sections/io#External Data Representation: ~~“external32”|External~~ ==external32|External== Data Representation: ~~“external32”]]~~ ==external32]]== .

The ~~external32~~ ==`external32`== representation specifies data formats for integer and floating point values. Integer values are represented in two’s complement big-endian format. Floating point values are represented by one of three IEEE formats. These are the IEEE “Single,” “Double,” and “Double Extended” formats, requiring 4, 8, and 16 bytes of storage, respectively. For the IEEE “Double Extended” formats, MPI specifies a Format Width of 16 bytes, with 15 exponent bits, bias = +10383, 112 fraction bits, and an encoding analogous to the “Double” format.

The ~~external32~~ ==`external32`== representations of the datatypes returned by

[[MPI_TYPE_CREATE_F90_REAL/COMPLEX/INTEGER]] are given by the following ~~rules.~~ ==rules.\== For [[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] :

if (p > 33) or (r > 4931) then external32 representation is undefined else if (p > 15) or (r > 307) then external32_size = 16 else if (p > 6) or (r > 37) then external32_size = 8 else external32_size = 4

For [[versions/v40/API/MPI_TYPE_CREATE_F90_COMPLEX|MPI_TYPE_CREATE_F90_COMPLEX]] : twice the size as for [[versions/v40/API/MPI_TYPE_CREATE_F90_REAL|MPI_TYPE_CREATE_F90_REAL]] ~~.~~ ==.\== For [[versions/v40/API/MPI_TYPE_CREATE_F90_INTEGER|MPI_TYPE_CREATE_F90_INTEGER]] :

if (r > 38) then external32 representation is undefined else if (r > 18) then external32_size = 16 else if (r > 9) then external32_size = 8 else if (r > 4) then external32_size = 4 else if (r > 2) then external32_size = 2 else external32_size = 1

If the ~~external32~~ ==`external32`== representation of a datatype is undefined, the result of using the datatype directly or indirectly (i.e., as part of another datatype or through a duplicated datatype) in operations that require the ~~external32~~ ==`external32`== representation is undefined. These operations include [[versions/v40/API/MPI_PACK_EXTERNAL|MPI_PACK_EXTERNAL]] , [[versions/v40/API/MPI_UNPACK_EXTERNAL|MPI_UNPACK_EXTERNAL]] , and many ~~`MPI_FILE`~~ ==[[MPI_FILE]]== functions, when the ~~“external32”~~ ==`external32`== data representation is used. The ranges for which the ~~external32~~ ==`external32`== representation is undefined are reserved for future standardization.

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~Example:~~

~~    integer       longtype, quadtype     integer, parameter :: long = selected_int_kind(15)     integer(long) ii(10)     real(selected_real_kind(30)) x(10)     call MPI_TYPE_CREATE_F90_INTEGER(15, longtype, ierror)     call MPI_TYPE_CREATE_F90_REAL(30, MPI_UNDEFINED, quadtype, ierror)     ...~~

~~    call MPI_SEND(ii, 10, longtype, ...)     call MPI_SEND(x,  10, quadtype, ...)~~

==Fortran selected integer and real kind buffers in MPI communications.==

==(code block added)==
``` [MPI]Fortran
integer       longtype, quadtype
integer, parameter :: long = selected_int_kind(15)
integer(long) ii(10)
real(selected_real_kind(30)) x(10)
call MPI_TYPE_CREATE_F90_INTEGER(15, longtype, ierror)
call MPI_TYPE_CREATE_F90_REAL(30, MPI_UNDEFINED, quadtype, ierror)
...

call MPI_SEND(ii, 10, longtype, ...)
call MPI_SEND(x,  10, quadtype, ...)
```

> The datatypes returned by the ~~above functions~~ ==procedures in Example [[versions/v41/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range|Parameterized Datatypes with Specified Precision and Exponent Range]]== are predefined datatypes. They cannot be freed; they do not need to be committed; they can be used with predefined reduction operations. There are two situations in which they behave differently syntactically, but not semantically, from the MPI named predefined datatypes. > > 1. [[versions/v41/API/MPI_TYPE_GET_ENVELOPE|MPI_TYPE_GET_ENVELOPE]] returns special combiners that allow a program to retrieve the values of `p` and `r`. > > 2. Because the datatypes are not named, they cannot be used as compile-time initializers or otherwise accessed before a call to one of the `MPI_TYPE_CREATE_F90_XXX` routines. > > If a variable was declared specifying a nondefault `KIND` value that was not obtained with `selected_real_kind()` or `selected_int_kind()`, the only way to obtain a matching MPI datatype is to use the size-based mechanism described in the next section.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Parameterized Datatypes with Specified Precision and Exponent Range]]

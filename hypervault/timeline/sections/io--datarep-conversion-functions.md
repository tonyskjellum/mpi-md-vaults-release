---
title: "Datarep Conversion Functions"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Datarep Conversion Functions

Chapter **io** · in [[versions/v20/sections/io#Datarep Conversion Functions|MPI-2.0]], [[versions/v21/sections/io#Datarep Conversion Functions|MPI-2.1]], [[versions/v22/sections/io#Datarep Conversion Functions|MPI-2.2]], [[versions/v30/sections/io#Datarep Conversion Functions|MPI-3.0]], [[versions/v31/sections/io#Datarep Conversion Functions|MPI-3.1]], [[versions/v40/sections/io#Datarep Conversion Functions|MPI-4.0]], [[versions/v41/sections/io#Datarep Conversion Functions|MPI-4.1]], [[versions/v50/sections/io#Datarep Conversion Functions|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (6 changed paragraphs)

~~`datatype` will be equivalent to the datatype that the user passed to the read or write function.~~

==`datatype` will be equivalent to the datatype that the user passed to the==

==read==

==function.==

> Although the conversion functions have similarities to `MPI_PACK` and ~~`MPI_UNPACK` in MPI-1,~~ ==> > `MPI_UNPACK`, > >== one should note the differences in the use of the arguments `count` and `position`. In the conversion functions, `count` is a count of data items (i.e., count of typemap entries of `datatype`), and `position` is an index into this typemap. In `MPI_PACK`, `incount` refers to the number of whole `datatype`s, and `position` is a number of bytes.

~~If MPI cannot allocate a buffer large enough to hold all the data to be converted from a read operation, it may call the conversion function repeatedly using the same `datatype` and `userbuf`, and reading successive chunks of data to be converted in `filebuf`. For the first call (and in the case when all the data to be converted fits into `filebuf`), MPI will call the function with `position` set to zero. Data converted during this call will be stored in the `userbuf` according to the first `count` data items in `datatype`. Then in subsequent calls to the conversion function, MPI will increment the value in `position` by the `count` of items converted in the previous call.~~

==If MPI cannot allocate a buffer large enough to hold all the data to be converted from a read operation, it may call the conversion function repeatedly using the same `datatype` and `userbuf`, and reading successive chunks of data to be converted in `filebuf`. For the first call (and in the case when all the data to be converted fits into `filebuf`), MPI will call the function with `position` set to zero. Data converted during this call will be stored in the `userbuf` according to the first `count` data items in `datatype`. Then in subsequent calls to the conversion function, MPI will increment the value in `position` by the `count` of items converted in the previous==

==call, and the `userbuf` pointer will be unchanged.==

~~The function must copy `count` data items from `userbuf` in the distribution described by `datatype`, to a contiguous distribution in `filebuf`, converting each data item from native representation to file representation. If the size of `datatype` is less than the size of `count`~~

==The function must copy `count` data items from `userbuf` in the distribution described by==

==`datatype`,==

==to a contiguous distribution in `filebuf`, converting each data item from native representation to file representation. If the size of `datatype` is less than the size of `count`==

~~`datatype` will be equivalent to the datatype that the user passed to the read or write function.~~

==`datatype` will be equivalent to the datatype that the user passed to the==

==write==

==function.==

~~An implementation will only invoke the callback routines in this section (`read_conversion_fn`, `write_conversion_fn`, and `dtype_file_extent_fn`) when one of the read or write routines in Section [[versions/v21/sections/io#Data Access|Data Access]] , page [[versions/v21/sections/io#Data Access|Data Access]] , or `MPI_FILE_GET_TYPE_EXTENT` is called by the user.~~

==An implementation will only invoke the callback routines in this section==

==(`read_conversion_fn`, `write_conversion_fn`, and `dtype_file_extent_fn`) when one of the read or write routines in Section [[versions/v21/sections/io#Data Access|Data Access]] , page [[versions/v21/sections/io#Data Access|Data Access]] , or `MPI_FILE_GET_TYPE_EXTENT` is called by the user.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The predefined constant ~~MPI_CONVERSION_FN_NULL~~ ==`MPI_CONVERSION_FN_NULL`== may be used as either [[write_conversion_fn]] or [[read_conversion_fn]] . In that case, MPI will not attempt to invoke [[write_conversion_fn]] or [[read_conversion_fn]] , respectively, but will perform the requested data access using the native data representation.

The conversion functions should return an error code. If the returned error code has a value other than ~~MPI_SUCCESS,~~ ==`MPI_SUCCESS`,== the implementation will raise an error in the class `MPI_ERR_CONVERSION`.

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~The function [[read_conversion_fn]] must convert from file data representation to native representation. Before calling this routine, MPI allocates and fills `filebuf` with `count`~~

~~contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`.~~

~~The function is passed, in `extra_state`, the argument that was passed to the [[versions/v30/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call. The function must copy all `count` data items from `filebuf` to `userbuf` in the distribution described by `datatype`, converting each data item from file representation to native representation.~~

~~`datatype` will be equivalent to the datatype that the user passed to the~~

~~read~~

~~function.~~

~~If the size of `datatype` is less than the size of the `count` data items, the conversion function must treat `datatype` as being contiguously tiled over the `userbuf`.~~

==The function [[read_conversion_fn]] must convert from file data representation to native representation. Before calling this routine, MPI allocates and fills `filebuf` with `count` contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`. The function is passed, in `extra_state`, the argument that was passed to the [[versions/v30/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call. The function must copy all `count` data items from `filebuf` to `userbuf` in the distribution described by `datatype`, converting each data item from file representation to native representation. `datatype` will be equivalent to the datatype that the user passed to the==

==read function. If the size of `datatype` is less than the size of the `count` data items, the conversion function must treat `datatype` as being contiguously tiled over the `userbuf`.==

> Although the conversion functions have similarities to `MPI_PACK` and > > `MPI_UNPACK`, ~~> >~~ one should note the differences in the use of the arguments `count` and `position`. In the conversion functions, `count` is a count of data items (i.e., count of typemap entries of `datatype`), and `position` is an index into this typemap. In `MPI_PACK`, `incount` refers to the number of whole `datatype`s, and `position` is a number of bytes.

~~The function [[write_conversion_fn]] must convert from native representation to file data representation. Before calling this routine, MPI allocates `filebuf` of a size large enough to hold `count`~~

~~contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`.~~

~~The function must copy `count` data items from `userbuf` in the distribution described by~~

~~`datatype`,~~

~~to a contiguous distribution in `filebuf`, converting each data item from native representation to file representation. If the size of `datatype` is less than the size of `count`~~

~~data items,~~

==The function [[write_conversion_fn]] must convert from native representation to file data representation. Before calling this routine, MPI allocates `filebuf` of a size large enough to hold `count` contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`. The function must copy `count` data items from `userbuf` in the distribution described by==

==`datatype`, to a contiguous distribution in `filebuf`, converting each data item from native representation to file representation. If the size of `datatype` is less than the size of `count` data items,==

~~The function must begin copying at the location in `userbuf` specified by `position` into the (tiled) `datatype`.~~

~~`datatype` will be equivalent to the datatype that the user passed to the~~

~~write~~

~~function.~~

~~The function is passed, in `extra_state`, the argument that was passed to the [[versions/v30/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call.~~

~~The predefined constant `MPI_CONVERSION_FN_NULL` may be used as either [[write_conversion_fn]] or [[read_conversion_fn]] . In that case, MPI will not attempt to invoke [[write_conversion_fn]] or [[read_conversion_fn]] , respectively, but will perform the requested data access using the native data representation.~~

==The function must begin copying at the location in `userbuf` specified by `position` into the (tiled) `datatype`. `datatype` will be equivalent to the datatype that the user passed to the==

==write function. The function is passed, in `extra_state`, the argument that was passed to the [[versions/v30/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call.==

==The predefined constant==

==[[MPI_CONVERSION_FN_NULL]] may be used as either [[write_conversion_fn]] or [[read_conversion_fn]] . In that case, MPI will not attempt to invoke [[write_conversion_fn]] or [[read_conversion_fn]] , respectively, but will perform the requested data access using the native data representation.==

~~(`read_conversion_fn`, `write_conversion_fn`, and `dtype_file_extent_fn`) when one of the read or write routines in Section [[versions/v30/sections/io#Data Access|Data Access]] , page [[versions/v30/sections/io#Data Access|Data Access]] , or `MPI_FILE_GET_TYPE_EXTENT` is called by the user.~~

~~`dtype_file_extent_fn` will only be passed predefined datatypes employed by the user. The conversion functions will only be passed datatypes equivalent to those~~

~~that the user has passed to one of the routines noted above.~~

==(`read_conversion_fn`, `write_conversion_fn`, and `dtype_file_extent_fn`) when one of the read or write routines in Section [[versions/v30/sections/io#Data Access|Data Access]] , page [[versions/v30/sections/io#Data Access|Data Access]] , or `MPI_FILE_GET_TYPE_EXTENT` is called by the user. `dtype_file_extent_fn` will only be passed predefined datatypes employed by the user. The conversion functions will only be passed datatypes equivalent to those that the user has passed to one of the routines noted above.==

~~User defined data representations are restricted to use byte alignment for all types.~~

~~Furthermore, it is erroneous for the conversion functions to call any collective routines or to free `datatype`.~~

==User defined data representations are restricted to use byte alignment for all types. Furthermore, it is erroneous for the conversion functions to call any collective routines or to free `datatype`.==

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~The function [[read_conversion_fn]] must convert from file data representation to native representation. Before calling this routine, MPI allocates and fills `filebuf` with `count` contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`. The function is passed, in `extra_state`, the argument that was passed to the [[versions/v31/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call. The function must copy all `count` data items from `filebuf` to `userbuf` in the distribution described by `datatype`, converting each data item from file representation to native representation. `datatype` will be equivalent to the datatype that the user passed to the~~

~~read function. If the size of `datatype` is less than the size of the `count` data items, the conversion function must treat `datatype` as being contiguously tiled over the `userbuf`.~~

~~The conversion function must begin storing converted data at the location in `userbuf` specified by `position` into the (tiled) `datatype`.~~

==The function [[read_conversion_fn]] must convert from file data representation to native representation. Before calling this routine, MPI allocates and fills `filebuf` with `count` contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`. The function is passed, in `extra_state`, the argument that was passed to the [[versions/v31/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call. The function must copy all `count` data items from `filebuf` to `userbuf` in the distribution described by `datatype`, converting each data item from file representation to native representation. `datatype` will be equivalent to the datatype that the user passed to the read function. If the size of `datatype` is less than the size of the `count` data items, the conversion function must treat `datatype` as being contiguously tiled over the `userbuf`. The conversion function must begin storing converted data at the location in `userbuf` specified by `position` into the (tiled) `datatype`.==

> Although the conversion functions have similarities to ~~`MPI_PACK`~~ ==[[versions/v31/API/MPI_PACK|MPI_PACK]]== and ~~> > `MPI_UNPACK`,~~ ==[[versions/v31/API/MPI_UNPACK|MPI_UNPACK]] ,== one should note the differences in the use of the arguments `count` and `position`. In the conversion functions, `count` is a count of data items (i.e., count of typemap entries of `datatype`), and `position` is an index into this typemap. In ~~`MPI_PACK`,~~ ==[[versions/v31/API/MPI_PACK|MPI_PACK]] ,== `incount` refers to the number of whole `datatype`s, and `position` is a number of bytes.

~~If MPI cannot allocate a buffer large enough to hold all the data to be converted from a read operation, it may call the conversion function repeatedly using the same `datatype` and `userbuf`, and reading successive chunks of data to be converted in `filebuf`. For the first call (and in the case when all the data to be converted fits into `filebuf`), MPI will call the function with `position` set to zero. Data converted during this call will be stored in the `userbuf` according to the first `count` data items in `datatype`. Then in subsequent calls to the conversion function, MPI will increment the value in `position` by the `count` of items converted in the previous~~

~~call, and the `userbuf` pointer will be unchanged.~~

==If MPI cannot allocate a buffer large enough to hold all the data to be converted from a read operation, it may call the conversion function repeatedly using the same `datatype` and `userbuf`, and reading successive chunks of data to be converted in `filebuf`. For the first call (and in the case when all the data to be converted fits into `filebuf`), MPI will call the function with `position` set to zero. Data converted during this call will be stored in the `userbuf` according to the first `count` data items in `datatype`. Then in subsequent calls to the conversion function, MPI will increment the value in `position` by the `count` of items converted in the previous call, and the `userbuf` pointer will be unchanged.==

~~The function [[write_conversion_fn]] must convert from native representation to file data representation. Before calling this routine, MPI allocates `filebuf` of a size large enough to hold `count` contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`. The function must copy `count` data items from `userbuf` in the distribution described by~~

~~`datatype`, to a contiguous distribution in `filebuf`, converting each data item from native representation to file representation. If the size of `datatype` is less than the size of `count` data items,~~

~~the conversion function must treat `datatype` as being contiguously tiled over the `userbuf`.~~

~~The function must begin copying at the location in `userbuf` specified by `position` into the (tiled) `datatype`. `datatype` will be equivalent to the datatype that the user passed to the~~

~~write function. The function is passed, in `extra_state`, the argument that was passed to the [[versions/v31/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call.~~

==The function [[write_conversion_fn]] must convert from native representation to file data representation. Before calling this routine, MPI allocates `filebuf` of a size large enough to hold `count` contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`. The function must copy `count` data items from `userbuf` in the distribution described by `datatype`, to a contiguous distribution in `filebuf`, converting each data item from native representation to file representation. If the size of `datatype` is less than the size of `count` data items, the conversion function must treat `datatype` as being contiguously tiled over the `userbuf`.==

==The function must begin copying at the location in `userbuf` specified by `position` into the (tiled) `datatype`. `datatype` will be equivalent to the datatype that the user passed to the write function. The function is passed, in `extra_state`, the argument that was passed to the [[versions/v31/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call.==

~~(`read_conversion_fn`, `write_conversion_fn`, and `dtype_file_extent_fn`) when one of the read or write routines in Section [[versions/v31/sections/io#Data Access|Data Access]] , page [[versions/v31/sections/io#Data Access|Data Access]] , or `MPI_FILE_GET_TYPE_EXTENT` is called by the user. `dtype_file_extent_fn` will only be passed predefined datatypes employed by the user. The conversion functions will only be passed datatypes equivalent to those that the user has passed to one of the routines noted above.~~

~~The conversion functions must be reentrant.~~

~~User defined data representations are restricted to use byte alignment for all types. Furthermore, it is erroneous for the conversion functions to call any collective routines or to free `datatype`.~~

==(`read_conversion_fn`, `write_conversion_fn`, and `dtype_file_extent_fn`) when one of the read or write routines in [[versions/v31/sections/io#Data Access|Data Access]] , or [[versions/v31/API/MPI_FILE_GET_TYPE_EXTENT|MPI_FILE_GET_TYPE_EXTENT]] is called by the user. `dtype_file_extent_fn` will only be passed predefined datatypes employed by the user. The conversion functions will only be passed datatypes equivalent to those that the user has passed to one of the routines noted above.==

==The conversion functions must be reentrant. User defined data representations are restricted to use byte alignment for all types. Furthermore, it is erroneous for the conversion functions to call any collective routines or to free `datatype`.==

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

The function ~~[[read_conversion_fn]]~~ ==`read_conversion_fn`== must convert from file data representation to native representation. Before calling this routine, MPI allocates and fills `filebuf` with `count` contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`. The function is passed, in `extra_state`, the argument that was passed to the [[versions/v40/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] call. The function must copy all `count` data items from `filebuf` to `userbuf` in the distribution described by `datatype`, converting each data item from file representation to native representation. `datatype` will be equivalent to the datatype that the user passed to the read function. If the size of `datatype` is less than the size of the `count` data items, the conversion function must treat `datatype` as being contiguously tiled over the `userbuf`. The conversion function must begin storing converted data at the location in `userbuf` specified by `position` into the (tiled) `datatype`.

> A converted read operation could be implemented as follows: > > 1. Get file extent of all data items > > 2. Allocate a filebuf large enough to hold all count data items > > 3. Read data from file into filebuf > > 4. Call ~~[[read_conversion_fn]]~~ ==`read_conversion_fn`== to convert data and place it into userbuf > > 5. Deallocate filebuf

The function ~~[[write_conversion_fn]]~~ ==`write_conversion_fn`== must convert from native representation to file data representation. Before calling this routine, MPI allocates `filebuf` of a size large enough to hold `count` contiguous data items. The type of each data item matches the corresponding entry for the predefined datatype in the type signature of `datatype`. The function must copy `count` data items from `userbuf` in the distribution described by `datatype`, to a contiguous distribution in `filebuf`, converting each data item from native representation to file representation. If the size of `datatype` is less than the size of `count` data items, the conversion function must treat `datatype` as being contiguously tiled over the `userbuf`.

~~[[versions/v40/API/MPI_CONVERSION_FN_NULL|MPI_CONVERSION_FN_NULL]] may be used as either [[write_conversion_fn]] or [[read_conversion_fn]] . In that case, MPI will not attempt to invoke [[write_conversion_fn]] or [[read_conversion_fn]] , respectively, but will perform the requested data access using the native data representation.~~

==[[versions/v40/API/MPI_CONVERSION_FN_NULL|MPI_CONVERSION_FN_NULL]] may be used as either `write_conversion_fn` or `read_conversion_fn` in bindings of [[versions/v40/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] without large counts in these conversion callbacks, whereas the constant==

==[[versions/v40/API/MPI_CONVERSION_FN_NULL_C|MPI_CONVERSION_FN_NULL_C]] can be used in the large count version (i.e., [[versions/v40/API/MPI_REGISTER_DATAREP|MPI_Register_datarep_c]] ). In either of these cases, MPI will not attempt to invoke `write_conversion_fn` or `read_conversion_fn`, respectively, but will perform the requested data access using the native data representation.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~[[versions/v41/API/MPI_CONVERSION_FN_NULL|MPI_CONVERSION_FN_NULL]] may be used as either `write_conversion_fn` or `read_conversion_fn` in bindings of [[versions/v41/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] without large counts in these conversion callbacks, whereas the constant~~

~~[[versions/v41/API/MPI_CONVERSION_FN_NULL_C|MPI_CONVERSION_FN_NULL_C]] can be used in the large count version (i.e., [[versions/v41/API/MPI_REGISTER_DATAREP|MPI_Register_datarep_c]] ). In either of these cases, MPI will not attempt to invoke `write_conversion_fn` or `read_conversion_fn`, respectively, but will perform the requested data access using the native data representation.~~

==[[versions/v41/API/MPI_CONVERSION_FN_NULL|MPI_CONVERSION_FN_NULL]] may be used as either `write_conversion_fn` or `read_conversion_fn` in bindings of [[versions/v41/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] without large counts in these conversion callbacks, whereas the constant [[versions/v41/API/MPI_CONVERSION_FN_NULL_C|MPI_CONVERSION_FN_NULL_C]] can be used in the large count version (i.e., `MPI_Register_datarep_c`). In either of these cases, MPI will not attempt to invoke `write_conversion_fn` or `read_conversion_fn`, respectively, but will perform the requested data access using the native data representation.==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

(`read_conversion_fn`, `write_conversion_fn`, and `dtype_file_extent_fn`) when one of the read or write routines in [[versions/v50/sections/io#Data Access|Data Access]] ~~,~~ or [[versions/v50/API/MPI_FILE_GET_TYPE_EXTENT|MPI_FILE_GET_TYPE_EXTENT]] is called by the user. `dtype_file_extent_fn` will only be passed predefined datatypes employed by the user. The conversion functions will only be passed datatypes equivalent to those that the user has passed to one of the routines noted above.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Datarep Conversion Functions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Datarep Conversion Functions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Datarep Conversion Functions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Datarep Conversion Functions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Datarep Conversion Functions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Datarep Conversion Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Datarep Conversion Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Datarep Conversion Functions]]

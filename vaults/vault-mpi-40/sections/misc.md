# The `Info` Object





Many of the routines in MPI take an argument `info`. `info` is an opaque object with a handle of type

`MPI_Info` in C and Fortran with the `mpi_f08` module, and `INTEGER` in Fortran with the `mpi` module or the include file `mpif.h`. It stores an unordered set of (`key`,`value`) pairs (both `key` and `value` are strings). A key can have only one value. MPI reserves several keys and requires that if an implementation uses a reserved key, it must provide the specified functionality. An implementation is not required to support these keys and may support any others not reserved by MPI.

Some info hints allow the MPI library to restrict its support for certain operations in order to improve performance or resource utilization. If an application provides such an info hint, it must be compatible with any changes in the behavior of the MPI library that are allowed by the info hint.

An implementation must support info objects as caches for arbitrary (`key`,`value`) pairs, regardless of whether it recognizes the key. Each function that takes hints in the form of an `MPI_Info` must be prepared to ignore any key it does not recognize. This description of info objects does not attempt to define how a particular function should react if it recognizes a key but not the associated value. [[MPI_INFO_GET_NKEYS]] , [[MPI_INFO_GET_NTHKEY]] , and [[MPI_INFO_GET_STRING]] must retain all (`key`,`value`) pairs so that layered functionality can also use the `Info` object.

Keys have an implementation-defined maximum length of `MPI_MAX_INFO_KEY`, which is at least 32 and at most 255. Values have an implementation-defined maximum length of `MPI_MAX_INFO_VAL`. In Fortran, leading and trailing spaces are stripped from both. Returned values will never be larger than these maximum lengths. Both `key` and `value` are case sensitive.

> [!tip] Rationale

> Keys have a maximum length because the set of known keys will always be finite and known to the implementation and because there is no reason for keys to be complex. The small maximum size allows applications to declare keys of size `MPI_MAX_INFO_KEY`. The limitation on value sizes is so that an implementation is not forced to deal with arbitrarily long strings.

> [!note] Advice to users

> `MPI_MAX_INFO_VAL` might be very large, so it might not be wise to declare a string of that size.

When `info` is used as an argument to any MPI routine, it is interpreted before that routine returns, so that it may be read, modified, or freed immediately after return. Changes to an info object after return from a routine do not affect that interpretation.

When the descriptions refer to a key or value as being a boolean, an integer, or a list, they mean the string representation of these types. An implementation may define its own rules for how info value strings are converted to other types, but to ensure portability, every implementation must support the following representations. Valid values for a boolean must include the strings “true” and “false” (all lowercase). For integers, valid values must include string representations of decimal values of integers that are within the range of a standard integer type in the program. (However it is possible that not every integer is a valid value for a given key.) On positive numbers, $`+`$ signs are optional. No space may appear between a $`+`$ or $`-`$ sign and the leading digit of a number. For comma separated lists, the string must contain valid elements separated by commas. Leading and trailing spaces are stripped automatically from the types of info values described above and for each element of a comma separated list. These rules apply to all info values of these types. Implementations are free to specify a different interpretation for values of other info keys.

![[API/MPI_INFO_CREATE]]

[[MPI_INFO_CREATE]] creates a new info object. The newly created object contains no key/value pairs.

![[API/MPI_INFO_SET]]

[[MPI_INFO_SET]] adds the (`key`,`value`) pair to `info`, and overrides the value if a value for the same key was previously set. `key` and `value` are null-terminated strings in C. In Fortran, leading and trailing spaces in `key` and `value` are stripped. If either `key` or `value` are larger than the allowed maximums, the errors `MPI_ERR_INFO_KEY` or `MPI_ERR_INFO_VALUE` are raised, respectively.

![[API/MPI_INFO_DELETE]]

[[MPI_INFO_DELETE]] deletes a (`key`,`value`) pair from `info`. If `key` is not defined in `info`, the call raises an error of class `MPI_ERR_INFO_NOKEY`.

![[API/MPI_INFO_GET_STRING]]

This function retrieves the value associated with `key` from `info`, if any. If such a key exists in `info`, it sets `flag` to `true` and returns the value in `value`, otherwise it sets `flag` to `false` and leaves `value` unchanged. `buflen` on input is the size of the provided buffer, for the output of `buflen` it is the size of the buffer needed to store the value string. If the `buflen` passed into the function is less than the actual size needed to store the value string (including null terminator in C), the value is truncated. On return, the value of `buflen` will be set to the required buffer size to hold the value string. If `buflen` is set to 0, `value` is not changed. In C, `buflen` includes the required space for the null terminator. In C, this function returns a null terminated string in all cases where the `buflen` input value is greater than 0.

If `key` is larger than `MPI_MAX_INFO_KEY`, the call is erroneous.

> [!note] Advice to users

> The [[MPI_INFO_GET_STRING]] function can be used to obtain the size of the required buffer for a value string by setting the `buflen` to 0. The returned `buflen` can then be used to allocate memory before calling [[MPI_INFO_GET_STRING]] again to obtain the value string.

![[API/MPI_INFO_GET_NKEYS]]

[[MPI_INFO_GET_NKEYS]] returns the number of currently defined keys in `info`.

![[API/MPI_INFO_GET_NTHKEY]]

This function returns the `n`th defined key in `info`. Keys are numbered $`0 ... N-1`$ where $`N`$ is the value returned by [[MPI_INFO_GET_NKEYS]] . All keys between $`0`$ and $`N-1`$ are guaranteed to be defined. The number of a given key does not change as long as `info` is not modified with [[MPI_INFO_SET]] or [[MPI_INFO_DELETE]] .

![[API/MPI_INFO_DUP]]

[[MPI_INFO_DUP]] duplicates an existing info object, creating a new object, with the same (`key`,`value`) pairs and the same ordering of keys.

![[API/MPI_INFO_FREE]]

This function frees `info` and sets it to `MPI_INFO_NULL`.

![[API/MPI_INFO_CREATE_ENV]]

This routine produces an output object `info` with the same construction as `MPI_INFO_ENV` as created during [[MPI_INIT]] or [[MPI_INIT_THREAD]] when the same arguments are used. This construction is described in Section [[dynamic#Starting MPI Processes|Starting MPI Processes]] ; however, this function can be called when not using the World Model, e.g., when using the Sessions Model. This object is not a direct copy or alias of the `MPI_INFO_ENV` object and could contain different values based on the input arguments and other sources. Multiple calls to this procedure that are given the same input arguments will produce `info` objects consistent with the definition of `MPI_INFO_ENV`. The version for ISO C accepts the `argc` and `argv` that are provided by the arguments to `main` or `0` for `argc` and `NULL` for `argv`. The user is responsible for freeing the `info` object via [[MPI_INFO_FREE]] . This procedure is local.

This procedure must always be thread-safe, as defined in Section [[dynamic#MPI and Threads|MPI and Threads]] . It is one of the few routines that may be called before MPI is initialized or after MPI is finalized.

> [!note] Advice to users

> In some circumstances (e.g., when passing `0` to `argc` and `NULL` to `argv` in C or in Fortran where such arguments do not exist), the `info` object may not be populated or may be populated incompletely because this procedure is local and the implementation may not be able to determine the correct values. Note that this could result in different values in the resulting `info` object at different MPI processes.

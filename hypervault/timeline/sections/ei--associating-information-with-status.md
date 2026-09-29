---
title: "Associating Information with Status"
chapter: ei
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/ei]
---

# Associating Information with Status

Chapter **ei** · in [[versions/v20/sections/ei#Associating Information with Status|MPI-2.0]], [[versions/v21/sections/ei#Associating Information with Status|MPI-2.1]], [[versions/v22/sections/ei#Associating Information with Status|MPI-2.2]], [[versions/v30/sections/ei#Associating Information with Status|MPI-3.0]], [[versions/v31/sections/ei#Associating Information with Status|MPI-3.1]], [[versions/v40/sections/ei#Associating Information with Status|MPI-4.0]], [[versions/v41/sections/ei#Associating Information with Status|MPI-4.1]], [[versions/v50/sections/ei#Associating Information with Status|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (4 changed paragraphs)

~~In MPI-1, requests were associated with point-to-point operations.~~

~~In MPI-2 there are several different types of requests. These range from new MPI calls for I/O to generalized requests. It is desirable to allow these calls use the same request mechanism. This allows one to wait or test on different types of requests. However, `MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}` returns a status with information about the request. With the generalization of requests, one needs to define what information will be returned in the status object.~~

~~In MPI-2, each call fills in the appropriate fields in the status object. Any unused fields will have undefined values. A call to `MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}` can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful value for a given request are defined in the sections with the new request.~~

~~Generalized requests raise additional considerations. Here, the user provides the functions to deal with the request. Unlike other MPI calls, the user needs to provide the information to be returned in status. The status argument is provided directly to the callback function where the status needs to be set. Users can directly set the values in 3 of the 5 status values. The count and cancel fields are opaque. To overcome this, new calls are provided:~~

==MPI supports several different types of requests besides those for==

==point-to-point operations.==

==These range from==

==MPI calls for I/O to generalized requests. It is desirable to allow these calls use the same request mechanism. This allows one to wait or test on different types of requests. However,==

==`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}` returns a status with information about the request. With the generalization of requests, one needs to define what information will be returned in the status object.==

==Each MPI==

==call fills in the appropriate fields in the status object. Any unused fields will have undefined values. A call to==

==`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}` can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful value for a given request are defined in the sections with the new request.==

==Generalized requests raise additional considerations. Here, the user provides the functions to deal with the request. Unlike other MPI calls, the user needs to provide the information to be returned in status. The status argument is provided directly to the callback function where the status needs to be set. Users can directly set the values in 3 of the 5 status values. The count and cancel fields are opaque. To overcome this,==

==these calls==

==are provided:==

> The number of elements is set instead of the count because the former can deal with ==> > a > >== nonintegral number of datatypes.

> This is similar to the restriction that holds ==> >== when ~~when~~ ==> >== `count` is set by a receive operation: in that case, the calls to [[versions/v21/API/MPI_GET_COUNT|MPI_GET_COUNT]] and [[versions/v21/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] must use a `datatype` with the same signature as the datatype used in the receive call.

~~If `flag` is set to `true` then a subsequent call to [[versions/v21/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] will also return `flag = true`, otherwise it will return `false`.~~

==If `flag` is set to `true` then a subsequent call to [[versions/v21/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] will also return `flag = true`, otherwise it will return==

==`false`.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

~~`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_<span class="roman">{</span>TEST$`|`$WAIT<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`== returns a status with information about the request. With the generalization of requests, one needs to define what information will be returned in the status object.

~~`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_<span class="roman">{</span>TEST$`|`$WAIT<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`== can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful value for a given request are defined in the sections with the new request.

### MPI-2.2 → MPI-3.0  (7 changed paragraphs)

~~MPI supports several different types of requests besides those for~~

~~point-to-point operations.~~

==MPI supports several different types of requests besides those for point-to-point operations.==

MPI calls for I/O to generalized requests. It is desirable to allow these calls ==to== use the same request ~~mechanism. This~~ ==mechanism, which== allows one to wait or test on different types of requests. However,

~~Each MPI~~

~~call fills in the appropriate fields in the status object. Any unused fields will have undefined values. A call to~~

~~`MPI\_<span class="roman">{</span>TEST$`|`$WAIT<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful value for a given request are defined in the sections with the new request.~~

~~Generalized requests raise additional considerations. Here, the user provides the functions to deal with the request. Unlike other MPI calls, the user needs to provide the information to be returned in status. The status argument is provided directly to the callback function where the status needs to be set. Users can directly set the values in 3 of the 5 status values. The count and cancel fields are opaque. To overcome this,~~

~~these calls~~

~~are provided:~~

==Each MPI call fills in the appropriate fields in the status object. Any unused fields will have undefined values. A call to==

==`MPI\_<span class="roman">{</span>TEST$`|`$WAIT<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>` can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful values for a given request are defined in the sections with the new request.==

==Generalized requests raise additional considerations. Here, the user provides the functions to deal with the request. Unlike other MPI calls, the user needs to provide the information to be returned in the status. The status argument is provided directly to the callback function where the status needs to be set. Users can directly set the values in 3 of the 5 status values. The count and cancel fields are opaque. To overcome this,==

==these calls are provided:==

~~This call modifies the opaque part of `status` so that a call to [[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] will return `count`. [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] will return a compatible value.~~

==![[versions/v30/API/MPI_STATUS_SET_ELEMENTS_X]]==

==These functions modify the opaque part of `status` so that a call to [[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]]==

==or [[versions/v30/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]==

==will return `count`. [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] will return a compatible value.==

> The number of elements is set instead of the count because the former can deal with ~~> >~~ a ~~> >~~ nonintegral number of datatypes.

A subsequent call to [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] ==, [[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ,== or ~~to [[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]]~~ ==[[versions/v30/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]== must use a `datatype` argument that has the same type signature as the `datatype` argument that was used in the call to [[versions/v30/API/MPI_STATUS_SET_ELEMENTS|MPI_STATUS_SET_ELEMENTS]] ==or [[versions/v30/API/MPI_STATUS_SET_ELEMENTS_X|MPI_STATUS_SET_ELEMENTS_X]]== .

> ~~This~~ ==The requirement of matching type signatures for these calls== is similar to the restriction that holds > > when ~~> >~~ `count` is set by a receive operation: in that case, the calls to [[versions/v30/API/MPI_GET_COUNT|MPI_GET_COUNT]] ==, [[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ,== and ~~[[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]]~~ ==[[versions/v30/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]== must use a `datatype` with the same signature as the datatype used in the receive call.

> Users are advised not to reuse the status fields for values other than those for which they were intended. Doing so may lead to unexpected results when using the status object. For example, calling [[versions/v30/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] may cause an error if the value is out of range or it may be impossible to detect such an error. The `extra_state` argument provided with a generalized request can be used to return information that does not logically belong in status. ~~> >~~ Furthermore, modifying the values in a status set internally by MPI, e.g., [[versions/v30/API/MPI_RECV|MPI_RECV]] , may lead to unpredictable results and is strongly discouraged.

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~MPI supports several different types of requests besides those for point-to-point operations.~~

~~These range from~~

~~MPI calls for I/O to generalized requests. It is desirable to allow these calls to use the same request mechanism, which allows one to wait or test on different types of requests. However,~~

==MPI supports several different types of requests besides those for point-to-point operations. These range from MPI calls for I/O to generalized requests. It is desirable to allow these calls to use the same request mechanism, which allows one to wait or test on different types of requests. However,==

~~Generalized requests raise additional considerations. Here, the user provides the functions to deal with the request. Unlike other MPI calls, the user needs to provide the information to be returned in the status. The status argument is provided directly to the callback function where the status needs to be set. Users can directly set the values in 3 of the 5 status values. The count and cancel fields are opaque. To overcome this,~~

~~these calls are provided:~~

==Generalized requests raise additional considerations. Here, the user provides the functions to deal with the request. Unlike other MPI calls, the user needs to provide the information to be returned in the status. The status argument is provided directly to the callback function where the status needs to be set. Users can directly set the values in 3 of the 5 status values. The count and cancel fields are opaque. To overcome this, these calls are provided:==

~~These functions modify the opaque part of `status` so that a call to [[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]]~~

~~or [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]~~

~~will return `count`. [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] will return a compatible value.~~

==These functions modify the opaque part of `status` so that a call to [[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] or [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] will return `count`. [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] will return a compatible value.==

> The requirement of matching type signatures for these calls is similar to the restriction that holds ~~> >~~ when `count` is set by a receive operation: in that case, the calls to [[versions/v31/API/MPI_GET_COUNT|MPI_GET_COUNT]] , [[versions/v31/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] , and [[versions/v31/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] must use a `datatype` with the same signature as the datatype used in the receive call.

~~If `flag` is set to `true` then a subsequent call to [[versions/v31/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] will also return `flag = true`, otherwise it will return~~

~~`false`.~~

==If `flag` is set to `true` then a subsequent call to [[versions/v31/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] will also return `flag = true`, otherwise it will return `false`.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

If `flag` is set to `true` then a subsequent call to [[versions/v40/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] will also return ~~`flag~~ ==`flag`== = ~~true`,~~ ==`true`,== otherwise it will return `false`.

### MPI-4.0 → MPI-4.1  (7 changed paragraphs)

~~`MPI\_<span class="roman">{</span>TEST$`|`$WAIT<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`~~ ==`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}`== returns a status with information about the request. With the generalization of requests, one needs to define what information will be returned in the status object.

~~`MPI\_<span class="roman">{</span>TEST$`|`$WAIT<span class="roman">}{</span>ANY$`|`$SOME$`|`$ALL<span class="roman">}</span>`~~ ==`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}`== can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful values for a given request are defined in the sections with the new request.

~~![[versions/v41/API/MPI_STATUS_SET_ELEMENTS_X]]~~

~~These functions modify the opaque part of `status` so that a call to [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] or [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]] will return `count`. [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] will return a compatible value.~~

==This procedure modifies the opaque part of `status` so calls to [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] will return `count`. Calls to [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] will return a compatible value.==

> The number of elements is set instead of the count because the former can deal with a ~~nonintegral~~ ==non-integer== number of datatypes.

A subsequent call to [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] ~~,~~ ==or== [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ~~, or [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]~~ must use a `datatype` argument that has the same type signature as the `datatype` argument that was used in the call to [[versions/v41/API/MPI_STATUS_SET_ELEMENTS|MPI_STATUS_SET_ELEMENTS]] ~~or [[versions/v41/API/MPI_STATUS_SET_ELEMENTS_X|MPI_STATUS_SET_ELEMENTS_X]]~~ .

> The requirement of matching type signatures for these calls is similar to the restriction that holds when `count` is set by a receive operation: in that case, ~~the~~ calls to [[versions/v41/API/MPI_GET_COUNT|MPI_GET_COUNT]] ~~,~~ ==and== [[versions/v41/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] ~~, and [[versions/v41/API/MPI_GET_ELEMENTS_X|MPI_GET_ELEMENTS_X]]~~ must use a `datatype` with the same signature as the datatype used in the receive call.

If `flag` is set to `true` then a subsequent call to [[versions/v41/API/MPI_TEST_CANCELLED|MPI_TEST_CANCELLED]] will also return ~~`flag` = `true`,~~ ==`flag``= true`,== otherwise it will return `false`.

==While the `MPI_SOURCE`, `MPI_TAG`, and `MPI_ERROR` status values are directly accessible by the user, for convenience in some contexts, users can also modify them via the procedure calls described below. Procedures for querying these fields from a status object are defined in Section [[versions/v41/sections/pt2pt#Return Status|Return Status]] .==

==![[versions/v41/API/MPI_STATUS_SET_SOURCE]]==

==Set the `MPI_SOURCE` field in the `status` object to the provided `source` argument.==

==![[versions/v41/API/MPI_STATUS_SET_TAG]]==

==Set the `MPI_TAG` field in the `status` object to the provided `tag` argument.==

==![[versions/v41/API/MPI_STATUS_SET_ERROR]]==

==Set the `MPI_ERROR` field in the `status` object to the provided `err` error code.==

==> [!tip] Rationale==

==> These functions exist for convenience when using MPI from languages other than C and Fortran, where having a function in the MPI library with a known API reduces the need for utility code written in C.==

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

MPI supports several different types of requests besides those for point-to-point ~~operations. These range from~~ ==operations, this includes== MPI calls for I/O ~~to~~ ==and== generalized requests. It is desirable to allow these calls to use the same request mechanism, which allows one to wait or test on different types of requests. However,

~~`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_{TEST$`|`$WAIT}{$`|`$ANY$`|`$SOME$`|`$ALL}`== returns a status with information about the request. With the generalization of requests, one needs to define what information will be returned in the status object.

Each MPI call fills in the appropriate fields in the status object. Any unused ~~fields~~ ==field== will have ==an== undefined ~~values.~~ ==value.== A call to

~~`MPI\_{TEST$`|`$WAIT}{ANY$`|`$SOME$`|`$ALL}`~~ ==`MPI\_{TEST$`|`$WAIT}{$`|`$ANY$`|`$SOME$`|`$ALL}`== can modify any of the fields in the status object. Specifically, it can modify fields that are undefined. The fields with meaningful values for a given request are defined in the ~~sections with the new request.~~ ==respective sections.==

~~> [!note] Advice to users~~

~~> Users are advised not to reuse the status fields for values other than those for which they were intended. Doing so may lead to unexpected results when using the status object. For example, calling [[versions/v50/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] may cause an error if the value is out of range or it may be impossible to detect such an error. The `extra_state` argument provided with a generalized request can be used to return information that does not logically belong in status. Furthermore, modifying the values in a status set internally by MPI, e.g., [[versions/v50/API/MPI_RECV|MPI_RECV]] , may lead to unpredictable results and is strongly discouraged.~~

==> [!note] Advice to users==

==> Users are advised not to reuse the status fields for values other than those for which they were intended. Doing so may lead to unexpected results when using the status object. For example, calling [[versions/v50/API/MPI_GET_ELEMENTS|MPI_GET_ELEMENTS]] may cause an error if the value is out of range or it may be impossible to detect such an error. The `extra_state` argument provided with a generalized request can be used to return information that does not logically belong in status. Furthermore, modifying the values in a status set internally by MPI, e.g., [[versions/v50/API/MPI_RECV|MPI_RECV]] , may lead to unpredictable results and is strongly discouraged.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/ei#Associating Information with Status]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/ei#Associating Information with Status]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/ei#Associating Information with Status]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/ei#Associating Information with Status]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/ei#Associating Information with Status]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/ei#Associating Information with Status]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/ei#Associating Information with Status]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/ei#Associating Information with Status]]

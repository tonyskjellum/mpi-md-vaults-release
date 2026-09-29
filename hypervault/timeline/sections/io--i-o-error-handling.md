---
title: "I/O Error Handling"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# I/O Error Handling

Chapter **io** · in [[versions/v20/sections/io#I/O Error Handling|MPI-2.0]], [[versions/v21/sections/io#I/O Error Handling|MPI-2.1]], [[versions/v22/sections/io#I/O Error Handling|MPI-2.2]], [[versions/v30/sections/io#I/O Error Handling|MPI-3.0]], [[versions/v31/sections/io#I/O Error Handling|MPI-3.1]], [[versions/v40/sections/io#I/O Error Handling|MPI-4.0]], [[versions/v41/sections/io#I/O Error Handling|MPI-4.1]], [[versions/v50/sections/io#I/O Error Handling|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

> MPI does not specify the state of a computation after an erroneous MPI call has occurred. A ~~high quality~~ ==high-quality== implementation will support > > the I/O error handling facilities, allowing users to write programs using > > common practice for I/O.

~~The MPI-2 I/O error handling routines are defined in Section [[misc-sec-errhandler]] , page [[misc-sec-errhandler]] .~~

==The==

==MPI==

==I/O error handling routines are defined in Section [[versions/v21/sections/inquiry#Error Handling|Error Handling]] , page [[versions/v21/sections/inquiry#Error Handling|Error Handling]] .==

> For communication, the default error handler is inherited from MPI_COMM_WORLD. In I/O, there is no analogous “root” file handle from which default properties can be inherited. Rather than invent a new global file handle, the default file error handler is manipulated as if it were attached to ~~`MPI_FILE_NULL`.~~ ==MPI_FILE_NULL.==

### MPI-2.1 → MPI-2.2  (5 changed paragraphs)

By default, communication errors are ~~fatal—MPI_ERRORS_ARE_FATAL~~ ==fatal—`MPI_ERRORS_ARE_FATAL`== is the default error handler associated with ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.== I/O errors are usually less catastrophic (e.g., “file not found”) than communication errors, and common practice is to catch these errors and continue executing. For this reason, MPI provides additional error facilities for I/O.

the first argument passed to the error handler is ~~MPI_FILE_NULL,~~ ==`MPI_FILE_NULL`,==

important aspect. By default, the predefined error handler for file handles is ~~MPI_ERRORS_RETURN.~~ ==`MPI_ERRORS_RETURN`.==

The default file error handler can be changed by specifying ~~MPI_FILE_NULL~~ ==`MPI_FILE_NULL`== as the `fh` argument to `MPI_FILE_SET_ERRHANDLER`. The current value of the default file error handler can be determined by passing ~~MPI_FILE_NULL~~ ==`MPI_FILE_NULL`== as the `fh` argument to `MPI_FILE_GET_ERRHANDLER`.

> For communication, the default error handler is inherited from ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.== In I/O, there is no analogous “root” file handle from which default properties can be inherited. Rather than invent a new global file handle, the default file error handler is manipulated as if it were attached to ~~MPI_FILE_NULL.~~ ==`MPI_FILE_NULL`.==

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

By default, communication errors are ~~fatal—`MPI_ERRORS_ARE_FATAL`~~ ==fatal — `MPI_ERRORS_ARE_FATAL`== is the default error handler associated with `MPI_COMM_WORLD`. I/O errors are usually less catastrophic (e.g., “file not found”) than communication errors, and common practice is to catch these errors and continue executing. For this reason, MPI provides additional error facilities for I/O.

~~> MPI does not specify the state of a computation after an erroneous MPI call has occurred. A high-quality implementation will support > > the I/O error handling facilities, allowing users to write programs using > > common practice for I/O.~~

~~Like communicators, each file handle has an error handler associated with it.~~

~~The~~

~~MPI~~

~~I/O error handling routines are defined in Section [[versions/v30/sections/inquiry#Error Handling|Error Handling]] , page [[versions/v30/sections/inquiry#Error Handling|Error Handling]] .~~

==> MPI does not specify the state of a computation after an erroneous MPI call has occurred. A high-quality implementation will support the I/O error handling facilities, allowing users to write programs using common practice for I/O.==

==Like communicators, each file handle has an error handler associated with it. The==

==MPI I/O error handling routines are defined in Section [[versions/v30/sections/inquiry#Error Handling|Error Handling]] , page [[versions/v30/sections/inquiry#Error Handling|Error Handling]] .==

~~two arguments passed to the file error handler are the file handle and the error code. For I/O errors that are not associated with a valid file handle (e.g., in `MPI_FILE_OPEN` or `MPI_FILE_DELETE`),~~

~~the first argument passed to the error handler is `MPI_FILE_NULL`,~~

~~I/O error handling differs from communication error handling in~~

~~another~~

~~important aspect. By default, the predefined error handler for file handles is `MPI_ERRORS_RETURN`.~~

~~The default file error handler has two purposes: when a new file handle is created (by `MPI_FILE_OPEN`),~~

~~the error handler for the new file handle is initially set to the default error handler,~~

~~and I/O routines that have no valid file handle on which to raise an error (e.g., `MPI_FILE_OPEN` or `MPI_FILE_DELETE`) use the default file error handler.~~

~~The default file error handler can be changed by specifying `MPI_FILE_NULL` as the `fh` argument to `MPI_FILE_SET_ERRHANDLER`. The current value of the default file error handler can be determined by passing `MPI_FILE_NULL` as the `fh` argument to `MPI_FILE_GET_ERRHANDLER`.~~

==two arguments passed to the file error handler are the file handle and the error code. For I/O errors that are not associated with a valid file handle (e.g., in `MPI_FILE_OPEN` or `MPI_FILE_DELETE`), the first argument passed to the error handler is `MPI_FILE_NULL`.==

==I/O error handling differs from communication error handling in another important aspect. By default, the predefined error handler for file handles is `MPI_ERRORS_RETURN`. The default file error handler has two purposes: when a new file handle is created (by `MPI_FILE_OPEN`), the error handler for the new file handle is initially set to the default error handler, and I/O routines that have no valid file handle on which to raise an error (e.g., `MPI_FILE_OPEN` or `MPI_FILE_DELETE`) use the default file error handler. The default file error handler can be changed by specifying `MPI_FILE_NULL` as the `fh` argument to `MPI_FILE_SET_ERRHANDLER`. The current value of the default file error handler can be determined by passing `MPI_FILE_NULL` as the `fh` argument to `MPI_FILE_GET_ERRHANDLER`.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Like communicators, each file handle has an error handler associated with it. The~~

~~MPI I/O error handling routines are defined in Section [[versions/v31/sections/inquiry#Error Handling|Error Handling]] , page [[versions/v31/sections/inquiry#Error Handling|Error Handling]] .~~

~~When MPI calls a user-defined error handler resulting from an error on a particular file handle, the first~~

~~two arguments passed to the file error handler are the file handle and the error code. For I/O errors that are not associated with a valid file handle (e.g., in `MPI_FILE_OPEN` or `MPI_FILE_DELETE`), the first argument passed to the error handler is `MPI_FILE_NULL`.~~

~~I/O error handling differs from communication error handling in another important aspect. By default, the predefined error handler for file handles is `MPI_ERRORS_RETURN`. The default file error handler has two purposes: when a new file handle is created (by `MPI_FILE_OPEN`), the error handler for the new file handle is initially set to the default error handler, and I/O routines that have no valid file handle on which to raise an error (e.g., `MPI_FILE_OPEN` or `MPI_FILE_DELETE`) use the default file error handler. The default file error handler can be changed by specifying `MPI_FILE_NULL` as the `fh` argument to `MPI_FILE_SET_ERRHANDLER`. The current value of the default file error handler can be determined by passing `MPI_FILE_NULL` as the `fh` argument to `MPI_FILE_GET_ERRHANDLER`.~~

==Like communicators, each file handle has an error handler associated with it. The MPI I/O error handling routines are defined in [[versions/v31/sections/inquiry#Error Handling|Error Handling]] .==

==When MPI calls a user-defined error handler resulting from an error on a particular file handle, the first two arguments passed to the file error handler are the file handle and the error code. For I/O errors that are not associated with a valid file handle (e.g., in [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] or [[versions/v31/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] ), the first argument passed to the error handler is `MPI_FILE_NULL`.==

==I/O error handling differs from communication error handling in another important aspect. By default, the predefined error handler for file handles is `MPI_ERRORS_RETURN`. The default file error handler has two purposes: when a new file handle is created (by [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] ), the error handler for the new file handle is initially set to the default error handler, and I/O routines that have no valid file handle on which to raise an error (e.g., [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] or [[versions/v31/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] ) use the default file error handler. The default file error handler can be changed by specifying `MPI_FILE_NULL` as the `fh` argument to [[versions/v31/API/MPI_FILE_SET_ERRHANDLER|MPI_FILE_SET_ERRHANDLER]] . The current value of the default file error handler can be determined by passing `MPI_FILE_NULL` as the `fh` argument to [[versions/v31/API/MPI_FILE_GET_ERRHANDLER|MPI_FILE_GET_ERRHANDLER]] .==

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

By default, communication errors are ~~fatal — `MPI_ERRORS_ARE_FATAL`~~ ==fatal—`MPI_ERRORS_ARE_FATAL`== is the default error handler associated with `MPI_COMM_WORLD`. I/O errors are usually less catastrophic (e.g., “file not found”) than communication errors, and common practice is to catch these errors and continue executing. For this reason, MPI provides additional error facilities for I/O.

I/O error handling differs from communication error handling in another important aspect. By default, the predefined error handler for file handles is `MPI_ERRORS_RETURN`. The ~~default~~ ==**default== file ~~error~~ ==error**== handler has two purposes: when a new file handle is created (by [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] ), the error handler for the new file handle is initially set to the default ==file== error handler, and I/O routines that have no valid file handle on which to raise an error (e.g., [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] or [[versions/v40/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] ) use the default file error handler. The default file error handler can be changed by specifying `MPI_FILE_NULL` as the `fh` argument to [[versions/v40/API/MPI_FILE_SET_ERRHANDLER|MPI_FILE_SET_ERRHANDLER]] . The current value of the default file error handler can be determined by passing `MPI_FILE_NULL` as the `fh` argument to [[versions/v40/API/MPI_FILE_GET_ERRHANDLER|MPI_FILE_GET_ERRHANDLER]] .

> For communication, the default error handler is inherited from ~~`MPI_COMM_WORLD`.~~ ==`MPI_COMM_WORLD` when using the World Model.== In I/O, there is no analogous “root” file handle from which default properties can be inherited. Rather than invent a new global file handle, the default file error handler is manipulated as if it were attached to `MPI_FILE_NULL`.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

I/O error handling differs from communication error handling in another important aspect. By default, the ~~predefined~~ error handler for file handles is `MPI_ERRORS_RETURN`. The **default file error** handler has two purposes: when a new file handle is created (by [[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] ), the error handler for the new file handle is initially set to the default file error handler, and I/O routines that have no valid file handle on which to raise an error (e.g., [[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] or [[versions/v50/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] ) use the default file error handler. The default file error handler can be changed by specifying `MPI_FILE_NULL` as the `fh` argument to [[versions/v50/API/MPI_FILE_SET_ERRHANDLER|MPI_FILE_SET_ERRHANDLER]] . The current value of the default file error handler can be determined by passing `MPI_FILE_NULL` as the `fh` argument to [[versions/v50/API/MPI_FILE_GET_ERRHANDLER|MPI_FILE_GET_ERRHANDLER]] .

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#I/O Error Handling]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#I/O Error Handling]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#I/O Error Handling]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#I/O Error Handling]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#I/O Error Handling]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#I/O Error Handling]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#I/O Error Handling]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#I/O Error Handling]]

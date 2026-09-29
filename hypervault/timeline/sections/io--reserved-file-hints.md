---
title: "Reserved File Hints"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Reserved File Hints

Chapter **io** · in [[versions/v20/sections/io#Reserved File Hints|MPI-2.0]], [[versions/v21/sections/io#Reserved File Hints|MPI-2.1]], [[versions/v22/sections/io#Reserved File Hints|MPI-2.2]], [[versions/v30/sections/io#Reserved File Hints|MPI-3.0]], [[versions/v31/sections/io#Reserved File Hints|MPI-3.1]], [[versions/v40/sections/io#Reserved File Hints|MPI-4.0]], [[versions/v41/sections/io#Reserved File Hints|MPI-4.1]], [[versions/v50/sections/io#Reserved File Hints|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

Setting this hint is only useful when passed to `MPI_FILE_OPEN` with an `amode` that includes ~~MPI_MODE_CREATE.~~ ==`MPI_MODE_CREATE`.==

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

An implementation is not required to interpret these key values, but if it does interpret the key value, it must provide the functionality described. (For more details on “info,” see ~~Section~~ ==Chapter== [[versions/v30/sections/misc#The Info Object|The Info Object]] , page [[versions/v30/sections/misc#The Info Object|The Info Object]] .)

~~For each hint name introduced, we describe the purpose of the hint, and the type of the hint value.~~

~~The “**\[SAME\]**” annotation specifies that the hint values~~

~~provided by all participating processes must be identical; otherwise the program is erroneous. In addition, some hints are context dependent, and are only used by an implementation at specific times (e.g., `file_perm` is only useful during file creation).~~

==For each hint name introduced, we describe the purpose of the hint, and the type of the hint value. The “**\[SAME\]**” annotation specifies that the hint values provided by all participating processes must be identical; otherwise the program is erroneous. In addition, some hints are context dependent, and are only used by an implementation at specific times (e.g., `file_perm` is only useful during file creation).==

~~or until the `access_style` key value is altered.~~

~~The hint value is a comma separated list of the following: `read_once`, `write_once`, `read_mostly`, `write_mostly`, `sequential`, `reverse_sequential`, and `random`.~~

~~`collective_buffering` (boolean) \[SAME\]:   This hint specifies whether the application may benefit from collective buffering.~~

~~Collective buffering is an optimization performed on collective accesses. Accesses to the file are performed on behalf of all processes in the group by a number of target nodes. These target nodes coalesce small requests into large disk accesses.~~

~~Legal values for this key are `true` and `false`. Collective buffering parameters are further directed via~~

~~additional hints: cb_block_size, cb_buffer_size, and cb_nodes.~~

~~`cb_block_size` (integer) \[SAME\]:   This hint specifies the block size to be used for collective buffering file access. *Target nodes* access data in chunks of this size. The chunks are distributed among target nodes in a round-robin (CYCLIC) pattern.~~

==or until the `access_style` key value is altered. The hint value is a comma separated list of the following: `read_once`, `write_once`, `read_mostly`, `write_mostly`, `sequential`, `reverse_sequential`, and `random`.==

==`collective_buffering` (boolean) \[SAME\]:   This hint specifies whether the application may benefit from collective buffering. Collective buffering is an optimization performed on collective accesses. Accesses to the file are performed on behalf of all processes in the group by a number of target nodes. These target nodes coalesce small requests into large disk accesses.==

==Valid values for this key are `true` and `false`. Collective buffering parameters are further directed via additional hints: cb_block_size, cb_buffer_size, and cb_nodes.==

==`cb_block_size` (integer) \[SAME\]:   This hint specifies the block size to be used for collective buffering file access. *Target nodes* access data in chunks of this size. The chunks are distributed among target nodes in a round-robin (cyclic) pattern.==

~~`file_perm` (string) \[SAME\]:   This hint specifies the file permissions to use for file creation.~~

~~Setting this hint is only useful when passed to `MPI_FILE_OPEN` with an `amode` that includes `MPI_MODE_CREATE`.~~

~~The set of legal values for this key is implementation dependent.~~

==`file_perm` (string) \[SAME\]:   This hint specifies the file permissions to use for file creation. Setting this hint is only useful when passed to `MPI_FILE_OPEN` with an `amode` that includes `MPI_MODE_CREATE`. The set of valid values for this key is implementation dependent.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~Some potentially useful hints (info key values) are outlined below. The following key values are reserved.~~

~~An implementation is not required to interpret these key values, but if it does interpret the key value, it must provide the functionality described. (For more details on “info,” see Chapter [[versions/v31/sections/misc#The Info Object|The Info Object]] , page [[versions/v31/sections/misc#The Info Object|The Info Object]] .)~~

~~These hints mainly affect access patterns and the layout of data on parallel I/O devices.~~

~~For each hint name introduced, we describe the purpose of the hint, and the type of the hint value. The “**\[SAME\]**” annotation specifies that the hint values provided by all participating processes must be identical; otherwise the program is erroneous. In addition, some hints are context dependent, and are only used by an implementation at specific times (e.g., `file_perm` is only useful during file creation).~~

~~`access_style` (comma separated list of strings):   This hint specifies the manner in which the file will be accessed until the file is closed~~

~~or until the `access_style` key value is altered. The hint value is a comma separated list of the following: `read_once`, `write_once`, `read_mostly`, `write_mostly`, `sequential`, `reverse_sequential`, and `random`.~~

~~`collective_buffering` (boolean) \[SAME\]:   This hint specifies whether the application may benefit from collective buffering. Collective buffering is an optimization performed on collective accesses. Accesses to the file are performed on behalf of all processes in the group by a number of target nodes. These target nodes coalesce small requests into large disk accesses.~~

~~Valid values for this key are `true` and `false`. Collective buffering parameters are further directed via additional hints: cb_block_size, cb_buffer_size, and cb_nodes.~~

==Some potentially useful hints (info key values) are outlined below. The following key values are reserved. An implementation is not required to interpret these key values, but if it does interpret the key value, it must provide the functionality described. (For more details on “info,” see [[Chapter]] subsec:info.)==

==These hints mainly affect access patterns and the layout of data on parallel I/O devices. For each hint name introduced, we describe the purpose of the hint, and the type of the hint value. The “**\[SAME\]**” annotation specifies that the hint values provided by all participating processes must be identical; otherwise the program is erroneous. In addition, some hints are context dependent, and are only used by an implementation at specific times (e.g., `file_perm` is only useful during file creation).==

==`access_style` (comma separated list of strings):   This hint specifies the manner in which the file will be accessed until the file is closed or until the `access_style` key value is altered. The hint value is a comma separated list of the following: `read_once`, `write_once`, `read_mostly`, `write_mostly`, `sequential`, `reverse_sequential`, and `random`.==

==`collective_buffering` (boolean) \[SAME\]:   This hint specifies whether the application may benefit from collective buffering. Collective buffering is an optimization performed on collective accesses. Accesses to the file are performed on behalf of all processes in the group by a number of target nodes. These target nodes coalesce small requests into large disk accesses. Valid values for this key are `true` and `false`. Collective buffering parameters are further directed via additional hints: cb_block_size, cb_buffer_size, and cb_nodes.==

~~`filename` (string):   This hint specifies the file name used when the file was opened. If the implementation is capable of returning the file name of an open file, it will be returned using this key by `MPI_FILE_GET_INFO`. This key is ignored when passed to `MPI_FILE_OPEN`, `MPI_FILE_SET_VIEW`,~~

~~`MPI_FILE_SET_INFO`, and `MPI_FILE_DELETE`.~~

~~`file_perm` (string) \[SAME\]:   This hint specifies the file permissions to use for file creation. Setting this hint is only useful when passed to `MPI_FILE_OPEN` with an `amode` that includes `MPI_MODE_CREATE`. The set of valid values for this key is implementation dependent.~~

~~`io_node_list` (comma separated list of strings) \[SAME\]:   This hint specifies the list of I/O devices that should be used to store the file.~~

~~This hint is most relevant when the file is created.~~

==`filename` (string):   This hint specifies the file name used when the file was opened. If the implementation is capable of returning the file name of an open file, it will be returned using this key by [[versions/v31/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] . This key is ignored when passed to [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , [[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , [[versions/v31/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , and [[versions/v31/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] .==

==`file_perm` (string) \[SAME\]:   This hint specifies the file permissions to use for file creation. Setting this hint is only useful when passed to [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] with an `amode` that includes `MPI_MODE_CREATE`. The set of valid values for this key is implementation dependent.==

==`io_node_list` (comma separated list of strings) \[SAME\]:   This hint specifies the list of I/O devices that should be used to store the file. This hint is most relevant when the file is created.==

~~`num_io_nodes` (integer) \[SAME\]:   This hint specifies the number of I/O devices in the system.~~

~~This hint is most relevant when the file is created.~~

==`num_io_nodes` (integer) \[SAME\]:   This hint specifies the number of I/O devices in the system. This hint is most relevant when the file is created.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~`access_style` (comma separated list of strings):~~ This hint specifies the manner in which the file will be accessed until the file is closed or until the `access_style` key value is altered. The hint value is a comma separated list of the following: `read_once`, `write_once`, `read_mostly`, `write_mostly`, `sequential`, `reverse_sequential`, and `random`.

~~`collective_buffering` (boolean) \[SAME\]:~~ This hint specifies whether the application may benefit from collective buffering. Collective buffering is an optimization performed on collective accesses. Accesses to the file are performed on behalf of all processes in the group by a number of target nodes. These target nodes coalesce small requests into large disk accesses. Valid values for this key are `true` and `false`. Collective buffering parameters are further directed via additional hints: ~~cb_block_size, cb_buffer_size,~~ ==`cb_block_size`, `cb_buffer_size`,== and ~~cb_nodes.~~ ==`cb_nodes`.==

~~`cb_block_size` (integer) \[SAME\]:~~ This hint specifies the block size to be used for collective buffering file access. *Target nodes* access data in chunks of this size. The chunks are distributed among target nodes in a round-robin (cyclic) pattern.

~~`cb_buffer_size` (integer) \[SAME\]:~~ This hint specifies the total buffer space that can be used for collective buffering on each target node, usually a multiple of `cb_block_size`.

~~`cb_nodes` (integer) \[SAME\]:~~ This hint specifies the number of target nodes to be used for collective buffering.

~~`chunked` (comma separated list of integers) \[SAME\]:~~ This hint specifies that the file consists of a multidimentional array that is often accessed by subarrays. The value for this hint is a comma separated list of array dimensions, starting from the most significant one (for an array stored in row-major order, as in C, the most significant dimension is the first one; for an array stored in column-major order, as in Fortran, the most significant dimension is the last one, and array dimensions should be reversed).

~~`chunked_item` (comma separated list of integers) \[SAME\]:~~ This hint specifies the size of each array entry, in bytes.

~~`chunked_size` (comma separated list of integers) \[SAME\]:~~ This hint specifies the dimensions of the subarrays. This is a comma separated list of array dimensions, starting from the most significant one.

~~`filename` (string):~~ This hint specifies the file name used when the file was opened. If the implementation is capable of returning the file name of an open file, it will be returned using this key by [[versions/v40/API/MPI_FILE_GET_INFO|MPI_FILE_GET_INFO]] . This key is ignored when passed to [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] , [[versions/v40/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] , [[versions/v40/API/MPI_FILE_SET_INFO|MPI_FILE_SET_INFO]] , and [[versions/v40/API/MPI_FILE_DELETE|MPI_FILE_DELETE]] .

~~`file_perm` (string) \[SAME\]:~~ This hint specifies the file permissions to use for file creation. Setting this hint is only useful when passed to [[versions/v40/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] with an `amode` that includes `MPI_MODE_CREATE`. The set of valid values for this key is implementation dependent.

~~`io_node_list` (comma separated list of strings) \[SAME\]:~~ This hint specifies the list of I/O devices that should be used to store the file. This hint is most relevant when the file is created.

~~`nb_proc` (integer) \[SAME\]:~~ This hint specifies the number of parallel processes that will typically be assigned to run programs that access this file. This hint is most relevant when the file is created.

~~`num_io_nodes` (integer) \[SAME\]:~~ This hint specifies the number of I/O devices in the system. This hint is most relevant when the file is created.

~~`striping_factor` (integer) \[SAME\]:~~ This hint specifies the number of I/O devices that the file should be striped across, and is relevant only when the file is created.

~~`striping_unit` (integer) \[SAME\]:~~ This hint specifies the suggested striping unit to be used for this file. The striping unit is the amount of consecutive data assigned to one I/O device before progressing to the next device, when striping across a number of devices. It is expressed in bytes. This hint is relevant only when the file is created.

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

This hint specifies the block size to be used for collective buffering file access. ~~*Target nodes*~~ ==**Target nodes**== access data in chunks of this size. The chunks are distributed among target nodes in a round-robin (cyclic) pattern.

This hint specifies that the file consists of a ~~multidimentional~~ ==multidimensional== array that is often accessed by subarrays. The value for this hint is a comma separated list of array dimensions, starting from the most significant one (for an array stored in row-major order, as in C, the most significant dimension is the first one; for an array stored in column-major order, as in Fortran, the most significant dimension is the last one, and array dimensions should be reversed).

This hint specifies the number of parallel processes that will typically be assigned to ~~run programs that~~ access this file. This hint is most relevant when the file is created.

==If set, the implementation may assume that the memory for all data buffers passed to MPI operations performed by the calling MPI process on the given file will use only the memory allocation kinds listed in the value string. See Section [[versions/v41/sections/dynamic#Memory Allocation Info|Memory Allocation Info]] .==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

This hint specifies whether the application ~~may~~ ==is expected to== benefit from collective buffering. Collective buffering is an optimization performed on collective accesses. Accesses to the file are performed on behalf of all processes in the group by a number of target nodes. These target nodes coalesce small requests into large disk accesses. Valid values for this key are `true` and `false`. Collective buffering parameters are further directed via additional hints: `cb_block_size`, `cb_buffer_size`, and `cb_nodes`.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Reserved File Hints]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Reserved File Hints]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Reserved File Hints]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Reserved File Hints]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Reserved File Hints]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Reserved File Hints]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Reserved File Hints]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Reserved File Hints]]

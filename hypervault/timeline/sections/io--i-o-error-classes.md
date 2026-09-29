---
title: "I/O Error Classes"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# I/O Error Classes

Chapter **io** · in [[versions/v20/sections/io#I/O Error Classes|MPI-2.0]], [[versions/v21/sections/io#I/O Error Classes|MPI-2.1]], [[versions/v22/sections/io#I/O Error Classes|MPI-2.2]], [[versions/v30/sections/io#I/O Error Classes|MPI-3.0]], [[versions/v31/sections/io#I/O Error Classes|MPI-3.1]], [[versions/v40/sections/io#I/O Error Classes|MPI-4.0]], [[versions/v41/sections/io#I/O Error Classes|MPI-4.1]], [[versions/v50/sections/io#I/O Error Classes|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

~~The implementation dependent error codes returned by the I/O routines can be converted into the following error classes.~~

==The implementation dependent error codes returned by the I/O routines can be converted into the==

==error classes defined in Table [[versions/v21/sections/io#I/O Error Classes|I/O Error Classes]] .==

==I/O Error Classes==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The implementation dependent error codes returned by the I/O routines can be converted into the~~

~~error classes defined in Table [[versions/v30/sections/io#I/O Error Classes|I/O Error Classes]] .~~

==The implementation dependent error codes returned by the I/O routines can be converted into the error classes defined in Table [[versions/v30/sections/io#I/O Error Classes|I/O Error Classes]] .==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

| | | |:---|:---| | `MPI_ERR_FILE` | Invalid file handle | | `MPI_ERR_NOT_SAME` | Collective argument not identical on all processes, or collective routines called in a different order by different processes | | `MPI_ERR_AMODE` | Error related to the `amode` passed to [[versions/v31/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] | | `MPI_ERR_UNSUPPORTED_DATAREP` | Unsupported `datarep` passed to ~~`MPI_FILE_SET_VIEW`~~ ==[[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]]== | | `MPI_ERR_UNSUPPORTED_OPERATION` | Unsupported operation, such as seeking on a file which supports sequential access only | | `MPI_ERR_NO_SUCH_FILE` | File does not exist | | `MPI_ERR_FILE_EXISTS` | File exists | | `MPI_ERR_BAD_FILE` | Invalid file name (e.g., path name too long) | | `MPI_ERR_ACCESS` | Permission denied | | `MPI_ERR_NO_SPACE` | Not enough space | | `MPI_ERR_QUOTA` | Quota exceeded | | `MPI_ERR_READ_ONLY` | Read-only file or file system | | `MPI_ERR_FILE_IN_USE` | File operation could not be completed, as the file is currently open by some process | | `MPI_ERR_DUP_DATAREP` | Conversion functions could not be registered because a data representation identifier that was already defined was passed to ~~`MPI_REGISTER_DATAREP`~~ ==[[versions/v31/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]]== | | `MPI_ERR_CONVERSION` | An error occurred in a user supplied data conversion function. | | `MPI_ERR_IO` | Other I/O error |

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

In addition, calls to routines in this chapter may raise errors in other MPI classes, such as ~~MPI_ERR_TYPE.~~ ==`MPI_ERR_TYPE`.==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

| | | |:---|:---| | `MPI_ERR_FILE` | Invalid file handle | | `MPI_ERR_NOT_SAME` | Collective argument not identical on all processes, or collective routines called in a different order by different processes | | `MPI_ERR_AMODE` | Error related to the `amode` passed to [[versions/v41/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] | | `MPI_ERR_UNSUPPORTED_DATAREP` | Unsupported `datarep` passed to [[versions/v41/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] | | `MPI_ERR_UNSUPPORTED_OPERATION` | Unsupported operation, such as seeking on a file ~~which~~ ==that== supports sequential access only | | `MPI_ERR_NO_SUCH_FILE` | File does not exist | | `MPI_ERR_FILE_EXISTS` | File exists | | `MPI_ERR_BAD_FILE` | Invalid file name (e.g., path name too long) | | `MPI_ERR_ACCESS` | Permission denied | | `MPI_ERR_NO_SPACE` | Not enough space | | `MPI_ERR_QUOTA` | Quota exceeded | | `MPI_ERR_READ_ONLY` | Read-only file or file system | | `MPI_ERR_FILE_IN_USE` | File operation could not be completed, as the file is currently open by some process | | `MPI_ERR_DUP_DATAREP` | Conversion functions could not be registered because a data representation identifier that was already defined was passed to [[versions/v41/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] | | `MPI_ERR_CONVERSION` | An error occurred in a user supplied data conversion function. | | `MPI_ERR_IO` | Other I/O error |

I/O ~~Error Classes~~ ==error classes==

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The implementation dependent error codes returned by the I/O routines can be ~~converted into~~ ==used to obtain== the ==matching== error ~~classes~~ ==classes, as== defined in Table [[versions/v50/sections/io#I/O Error Classes|I/O Error Classes]] .

| | | |:---|:---| | `MPI_ERR_FILE` | Invalid file handle | | `MPI_ERR_NOT_SAME` | Collective argument not identical on all processes, or collective routines called in a different order by different processes | | `MPI_ERR_AMODE` | Error related to the `amode` passed to [[versions/v50/API/MPI_FILE_OPEN|MPI_FILE_OPEN]] | | `MPI_ERR_UNSUPPORTED_DATAREP` | Unsupported `datarep` passed to [[versions/v50/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] | | `MPI_ERR_UNSUPPORTED_OPERATION` | Unsupported operation, such as seeking on a file that supports sequential access only | | `MPI_ERR_NO_SUCH_FILE` | File does not exist | | `MPI_ERR_FILE_EXISTS` | File exists | | `MPI_ERR_BAD_FILE` | Invalid file name (e.g., path name too long) | | `MPI_ERR_ACCESS` | Permission denied | | `MPI_ERR_NO_SPACE` | Not enough space | | `MPI_ERR_QUOTA` | Quota exceeded | | `MPI_ERR_READ_ONLY` | Read-only file or file system | | `MPI_ERR_FILE_IN_USE` | File operation could not be completed, as the file is currently ~~open~~ ==opened== by some process | | `MPI_ERR_DUP_DATAREP` | Conversion functions could not be registered because a data representation identifier that was already defined was passed to [[versions/v50/API/MPI_REGISTER_DATAREP|MPI_REGISTER_DATAREP]] | | `MPI_ERR_CONVERSION` | An error occurred in a user supplied data conversion function. | | `MPI_ERR_IO` | Other I/O error |

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#I/O Error Classes]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#I/O Error Classes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#I/O Error Classes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#I/O Error Classes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#I/O Error Classes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#I/O Error Classes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#I/O Error Classes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#I/O Error Classes]]

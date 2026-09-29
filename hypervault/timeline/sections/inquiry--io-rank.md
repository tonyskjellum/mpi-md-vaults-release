---
title: "IO Rank"
chapter: inquiry
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# IO Rank

Chapter **inquiry** · in [[versions/v13/sections/inquiry#IO rank|MPI-1.3]], [[versions/v21/sections/inquiry#IO Rank|MPI-2.1]], [[versions/v22/sections/inquiry#IO Rank|MPI-2.2]], [[versions/v30/sections/inquiry#IO Rank|MPI-3.0]], [[versions/v31/sections/inquiry#IO Rank|MPI-3.1]], [[versions/v40/sections/inquiry#IO Rank|MPI-4.0]], [[versions/v41/sections/inquiry#IO Rank|MPI-4.1]], [[versions/v50/sections/inquiry#IO Rank|MPI-5.0]]

Heading by release: MPI-1.3: “IO rank”; MPI-2.1: “IO Rank”; MPI-2.2: “IO Rank”; MPI-3.0: “IO Rank”; MPI-3.1: “IO Rank”; MPI-4.0: “IO Rank”; MPI-4.1: “IO Rank”; MPI-5.0: “IO Rank”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~The value returned for MPI_IO is the rank of a processor that can provide language-standard I/O facilities. For Fortran, this means that all of the Fortran I/O operations are supported (e.g., `OPEN`, `REWIND`, `WRITE`). For C, this means that all of the ANSI-C I/O operations are supported (e.g., `fopen`, `fprintf`, `lseek`).~~

==The value returned for MPI_IO is the rank of a processor that can provide language-standard I/O facilities. For Fortran, this means that all of the Fortran I/O operations are supported (e.g., `OPEN`, `REWIND`, `WRITE`). For C==

==and C++,==

==this means that all of the==

==ISO C==

==and C++,==

==I/O operations are supported (e.g., `fopen`, `fprintf`, `lseek`).==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The value returned for ~~MPI_IO~~ ==`MPI_IO`== is the rank of a processor that can provide language-standard I/O facilities. For Fortran, this means that all of the Fortran I/O operations are supported (e.g., `OPEN`, `REWIND`, `WRITE`). For C

If every process can provide language-standard I/O, then the value ~~MPI_ANY_SOURCE~~ ==`MPI_ANY_SOURCE`== will be returned. Otherwise, if the calling process can provide language-standard I/O, then its rank will be returned. Otherwise, if some process can provide language-standard I/O then the rank of one such process will be returned. The same value need not be returned by all processes. If no process can provide language-standard I/O, then the value ~~MPI_PROC_NULL~~ ==`MPI_PROC_NULL`== will be returned.

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~The value returned for `MPI_IO` is the rank of a processor that can provide language-standard I/O facilities. For Fortran, this means that all of the Fortran I/O operations are supported (e.g., `OPEN`, `REWIND`, `WRITE`). For C~~

~~and C++,~~

~~this means that all of the~~

~~ISO C~~

~~and C++,~~

~~I/O operations are supported (e.g., `fopen`, `fprintf`, `lseek`).~~

==The value returned for `MPI_IO` is the rank of a processor that can provide language-standard I/O facilities. For Fortran, this means that all of the Fortran I/O operations are supported (e.g., `OPEN`, `REWIND`, `WRITE`). For C, this means that all of the==

==ISO C I/O operations are supported (e.g., `fopen`, `fprintf`, `lseek`).==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~The value returned for `MPI_IO` is the rank of a processor that can provide language-standard I/O facilities. For Fortran, this means that all of the Fortran I/O operations are supported (e.g., `OPEN`, `REWIND`, `WRITE`). For C, this means that all of the~~

~~ISO C I/O operations are supported (e.g., `fopen`, `fprintf`, `lseek`).~~

==The value returned for `MPI_IO` is the rank of a processor that can provide language-standard I/O facilities. For Fortran, this means that all of the Fortran I/O operations are supported (e.g., `OPEN`, `REWIND`, `WRITE`). For C, this means that all of the ISO C I/O operations are supported (e.g., `fopen`, `fprintf`, `lseek`).==

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The value returned for `MPI_IO` is the rank of ~~a processor~~ ==an MPI process== that can provide language-standard I/O facilities. For Fortran, this means that all of the Fortran I/O operations are supported (e.g., `OPEN`, `REWIND`, `WRITE`). For C, this means that all of the ISO C I/O operations are supported (e.g., `fopen`, `fprintf`, `lseek`).

If every ==MPI== process can provide language-standard I/O, then the value `MPI_ANY_SOURCE` will be returned. Otherwise, if the calling ==MPI== process can provide language-standard ~~I/O, then~~ ==I/O== its rank ==in the group of the communicator== will be returned. Otherwise, if some ==MPI== process can provide language-standard I/O then the rank of one such ==MPI== process ==in the group of the communicator== will be returned. The same value need not be returned by all ==MPI== processes. If no ==MPI== process can provide language-standard I/O, then the value `MPI_PROC_NULL` will be returned.

> Note that input is not collective, and this attribute does *not* indicate which ==MPI== process can or does provide input.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/inquiry#IO rank]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#IO Rank]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#IO Rank]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#IO Rank]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#IO Rank]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#IO Rank]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#IO Rank]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#IO Rank]]

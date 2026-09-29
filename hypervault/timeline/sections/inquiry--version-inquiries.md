---
title: "Version Inquiries"
chapter: inquiry
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Version Inquiries

Chapter **inquiry** · in [[versions/v13/sections/inquiry#Version Inquiries|MPI-1.3]], [[versions/v21/sections/inquiry#Version Inquiries|MPI-2.1]], [[versions/v22/sections/inquiry#Version Inquiries|MPI-2.2]], [[versions/v30/sections/inquiry#Version Inquiries|MPI-3.0]], [[versions/v31/sections/inquiry#Version Inquiries|MPI-3.1]], [[versions/v40/sections/inquiry#Version Inquiries|MPI-4.0]], [[versions/v41/sections/inquiry#Version Inquiries|MPI-4.1]], [[versions/v50/sections/inquiry#Version Inquiries|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (3 changed paragraphs)

#define MPI_VERSION ~~1~~ ==2== #define MPI_SUBVERSION ~~2~~ ==1==

INTEGER MPI_VERSION, MPI_SUBVERSION PARAMETER (MPI_VERSION = ~~1)~~ ==2)== PARAMETER (MPI_SUBVERSION = ~~2)~~ ==1)==

==Valid (MPI_VERSION, MPI_SUBVERSION) pairs in this and previous versions of the MPI standard are (2,1), (2,0), and (1,2).==

### MPI-2.1 → MPI-2.2  (3 changed paragraphs)

#define MPI_VERSION 2 #define MPI_SUBVERSION ~~1~~ ==2==

INTEGER MPI_VERSION, MPI_SUBVERSION PARAMETER (MPI_VERSION = 2) PARAMETER (MPI_SUBVERSION = ~~1)~~ ==2)==

Valid ~~(MPI_VERSION, MPI_SUBVERSION)~~ ==(`MPI_VERSION`, `MPI_SUBVERSION`)== pairs in this and previous versions of the MPI standard are ==(2,2),== (2,1), (2,0), and (1,2).

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

The “version” will be represented by two separate integers, for the version and subversion: In ~~C and C++,~~ ==C,==

#define MPI_VERSION ~~2~~ ==3== #define MPI_SUBVERSION ~~2~~ ==0==

INTEGER ==::== MPI_VERSION, MPI_SUBVERSION PARAMETER (MPI_VERSION = ~~2)~~ ==3)== PARAMETER (MPI_SUBVERSION = ~~2)~~ ==0)==

~~[[versions/v30/API/MPI_GET_VERSION|MPI_GET_VERSION]] is one of the few functions that can be called before [[versions/v30/API/MPI_INIT|MPI_INIT]] and after [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] .~~

~~Valid (`MPI_VERSION`, `MPI_SUBVERSION`) pairs in this and previous versions of the MPI standard are (2,2), (2,1), (2,0), and (1,2).~~

==[[versions/v30/API/MPI_GET_VERSION|MPI_GET_VERSION]] can be called before [[versions/v30/API/MPI_INIT|MPI_INIT]] and after [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] . Valid (`MPI_VERSION`, `MPI_SUBVERSION`) pairs in this and previous versions of the MPI standard are (3,0), (2,2), (2,1), (2,0), and (1,2).==

==![[versions/v30/API/MPI_GET_LIBRARY_VERSION]]==

==This routine returns a string representing the version of the MPI library. The version argument is a character string for maximum flexibility.==

==> [!warning] Advice to implementors==

==> An implementation of MPI should return a different string for every change to its source code or build that could be visible to the user.==

==The argument `version` must represent storage that is `MPI_MAX_LIBRARY_VERSION_STRING` characters long. [[versions/v30/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] may write up to this many characters into `version`.==

==The number of characters actually written is returned in the output argument, `resultlen`. In C, a null character is additionally stored at `version[resultlen]`. The value of `resultlen` cannot be larger than `MPI_MAX_LIBRARY_VERSION_STRING` - 1. In Fortran, `version` is padded on the right with blank characters. The value of `resultlen` cannot be larger than `MPI_MAX_LIBRARY_VERSION_STRING`.==

==[[versions/v30/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] can be called before [[versions/v30/API/MPI_INIT|MPI_INIT]] and after [[versions/v30/API/MPI_FINALIZE|MPI_FINALIZE]] .==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

#define MPI_VERSION 3 #define MPI_SUBVERSION ~~0~~ ==1==

INTEGER :: MPI_VERSION, MPI_SUBVERSION PARAMETER (MPI_VERSION = 3) PARAMETER (MPI_SUBVERSION = ~~0)~~ ==1)==

[[versions/v31/API/MPI_GET_VERSION|MPI_GET_VERSION]] can be called before [[versions/v31/API/MPI_INIT|MPI_INIT]] and after [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] ==. This function must always be thread-safe, as defined in Section [[versions/v31/sections/ei#MPI and Threads|MPI and Threads]]== . Valid (`MPI_VERSION`, `MPI_SUBVERSION`) pairs in this and previous versions of the MPI standard are ==(3,1),== (3,0), (2,2), (2,1), (2,0), and (1,2).

[[versions/v31/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] can be called before [[versions/v31/API/MPI_INIT|MPI_INIT]] and after [[versions/v31/API/MPI_FINALIZE|MPI_FINALIZE]] . ==This function must always be thread-safe, as defined in Section [[versions/v31/sections/ei#MPI and Threads|MPI and Threads]] .==

### MPI-3.1 → MPI-4.0  (4 changed paragraphs)

#define MPI_VERSION ~~3~~ ==4== #define MPI_SUBVERSION ~~1~~ ==0==

INTEGER :: MPI_VERSION, MPI_SUBVERSION PARAMETER (MPI_VERSION = ~~3)~~ ==4)== PARAMETER (MPI_SUBVERSION = ~~1)~~ ==0)==

[[versions/v40/API/MPI_GET_VERSION|MPI_GET_VERSION]] can be called ~~before [[versions/v40/API/MPI_INIT|MPI_INIT]] and after [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] .~~ ==at any time in an MPI program.== This function must always be thread-safe, as defined in Section ~~[[versions/v40/sections/ei#MPI~~ ==[[dynamic#MPI== and Threads|MPI and Threads]] . Valid (`MPI_VERSION`, `MPI_SUBVERSION`) pairs in this and previous versions of the MPI standard are ==(4,0),== (3,1), (3,0), (2,2), (2,1), (2,0), and (1,2).

[[versions/v40/API/MPI_GET_LIBRARY_VERSION|MPI_GET_LIBRARY_VERSION]] can be called ~~before [[versions/v40/API/MPI_INIT|MPI_INIT]] and after [[versions/v40/API/MPI_FINALIZE|MPI_FINALIZE]] .~~ ==at any time in an MPI program.== This function must always be thread-safe, as defined in Section ~~[[versions/v40/sections/ei#MPI~~ ==[[dynamic#MPI== and Threads|MPI and Threads]] .

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

In order to cope with changes to the MPI ~~Standard,~~ ==standard,== there are both compile-time and run-time ways to determine which version of the standard is in use in the environment one is using.

~~        #define MPI_VERSION    4         #define MPI_SUBVERSION 0~~

==(code block added)==
``` [MPI]C
#define MPI_VERSION    4
#define MPI_SUBVERSION 1
```

~~        INTEGER :: MPI_VERSION, MPI_SUBVERSION         PARAMETER (MPI_VERSION    = 4)         PARAMETER (MPI_SUBVERSION = 0)~~

==(code block added)==
``` [MPI]Fortran
INTEGER :: MPI_VERSION, MPI_SUBVERSION
PARAMETER (MPI_VERSION    = 4)
PARAMETER (MPI_SUBVERSION = 1)
```

[[versions/v41/API/MPI_GET_VERSION|MPI_GET_VERSION]] can be called at any time in an MPI program. This function must always be thread-safe, as defined in Section [[versions/v41/sections/dynamic#MPI and Threads|MPI and Threads]] . Valid (`MPI_VERSION`, `MPI_SUBVERSION`) pairs in this and previous versions of the MPI standard are ==(4,1),== (4,0), (3,1), (3,0), (2,2), (2,1), (2,0), and (1,2).

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

~~(code block removed)~~
``` [MPI]C
#define MPI_VERSION    4
#define MPI_SUBVERSION 1
```

==(code block added)==
``` [MPI]C
#define MPI_VERSION    5
#define MPI_SUBVERSION 0
```

~~(code block removed)~~
``` [MPI]Fortran
INTEGER :: MPI_VERSION, MPI_SUBVERSION
PARAMETER (MPI_VERSION    = 4)
PARAMETER (MPI_SUBVERSION = 1)
```

==(code block added)==
``` [MPI]Fortran
INTEGER :: MPI_VERSION, MPI_SUBVERSION
PARAMETER (MPI_VERSION    = 5)
PARAMETER (MPI_SUBVERSION = 0)
```

[[versions/v50/API/MPI_GET_VERSION|MPI_GET_VERSION]] can be called at any time in an MPI program. This function must always be thread-safe, as defined in Section [[versions/v50/sections/dynamic#MPI and Threads|MPI and Threads]] . Valid (`MPI_VERSION`, `MPI_SUBVERSION`) pairs in this and previous versions of the MPI standard are ==(5,0),== (4,1), (4,0), (3,1), (3,0), (2,2), (2,1), (2,0), and (1,2).

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/inquiry#Version Inquiries]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Version Inquiries]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Version Inquiries]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Version Inquiries]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Version Inquiries]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Version Inquiries]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Version Inquiries]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Version Inquiries]]

---
title: "Clock Synchronization"
chapter: inquiry
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Clock Synchronization

Chapter **inquiry** · in [[versions/v13/sections/inquiry#Clock synchronization|MPI-1.3]], [[versions/v21/sections/inquiry#Clock Synchronization|MPI-2.1]], [[versions/v22/sections/inquiry#Clock Synchronization|MPI-2.2]], [[versions/v30/sections/inquiry#Clock Synchronization|MPI-3.0]], [[versions/v31/sections/inquiry#Clock Synchronization|MPI-3.1]], [[versions/v40/sections/inquiry#Clock Synchronization|MPI-4.0]], [[versions/v41/sections/inquiry#Clock Synchronization|MPI-4.1]], [[versions/v50/sections/inquiry#Clock Synchronization|MPI-5.0]]

Heading by release: MPI-1.3: “Clock synchronization”; MPI-2.1: “Clock Synchronization”; MPI-2.2: “Clock Synchronization”; MPI-3.0: “Clock Synchronization”; MPI-3.1: “Clock Synchronization”; MPI-4.0: “Clock Synchronization”; MPI-4.1: “Clock Synchronization”; MPI-5.0: “Clock Synchronization”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

> The user must provide at least MPI_MAX_PROCESSOR_NAME space to write the processor name — processor names can be this long. The user > > should examine the ==> >== output ==> >== argument, `resultlen`, to determine the actual length of the name.

The constant MPI_BSEND_OVERHEAD provides an upper bound on the fixed overhead per message buffered by a call to [[versions/v21/API/MPI_BSEND|MPI_BSEND]] (see Section [[versions/v21/sections/pt2pt#Model ~~implementation~~ ==Implementation== of ~~buffered mode|Model implementation~~ ==Buffered Mode|Model Implementation== of ~~buffered mode]]~~ ==Buffered Mode]]== ).

### MPI-2.1 → MPI-2.2  (4 changed paragraphs)

The value returned for ~~MPI_WTIME_IS_GLOBAL~~ ==`MPI_WTIME_IS_GLOBAL`== is 1 if clocks at all processes in ~~MPI_COMM_WORLD~~ ==`MPI_COMM_WORLD`== are synchronized, 0 otherwise. A collection of clocks is considered synchronized if explicit effort has been taken to synchronize them. The expectation is that the variation in time, as measured by calls to [[versions/v22/API/MPI_WTIME|MPI_WTIME]] , will be less then one half the round-trip time for an MPI message of length zero. If time is measured at a process just before a send and at another process just after a matching receive, the second time should be always higher than the first one.

The attribute ~~MPI_WTIME_IS_GLOBAL~~ ==`MPI_WTIME_IS_GLOBAL`== need not be present when the clocks are not synchronized (however, the attribute key ~~MPI_WTIME_IS_GLOBAL~~ ==`MPI_WTIME_IS_GLOBAL`== is always valid). This attribute may be associated with communicators other then ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.==

The attribute ~~MPI_WTIME_IS_GLOBAL~~ ==`MPI_WTIME_IS_GLOBAL`== has the same value on all processes of ~~MPI_COMM_WORLD.~~ ==`MPI_COMM_WORLD`.==

This routine returns the name of the processor on which it was called at the moment of the call. The name is a character string for maximum flexibility. From this value it must be possible to identify a specific piece of hardware; possible values include “processor 9 in rack 4 of mpp.cs.org” and “231” (where 231 is the actual processor number in the running homogeneous system). The argument `name` must represent storage that is at least ~~MPI_MAX_PROCESSOR_NAME~~ ==`MPI_MAX_PROCESSOR_NAME`== characters long. `MPI_GET_PROCESSOR_NAME` may write up to this many characters into `name`.

In C, a null character is additionally stored at `name[resultlen]`. The `resultlen` cannot be larger then ~~MPI_MAX_PROCESSOR_NAME-1.~~ ==`MPI_MAX_PROCESSOR_NAME`-1.== In Fortran, name is padded on the right with blank characters. The `resultlen` cannot be larger then ~~MPI_MAX_PROCESSOR_NAME.~~ ==`MPI_MAX_PROCESSOR_NAME`.==

> The user must provide at least ~~MPI_MAX_PROCESSOR_NAME~~ ==`MPI_MAX_PROCESSOR_NAME`== space to write the processor name — processor names can be this long. The user > > should examine the > > output > > argument, `resultlen`, to determine the actual length of the name.

The constant ~~MPI_BSEND_OVERHEAD~~ ==`MPI_BSEND_OVERHEAD`== provides an upper bound on the fixed overhead per message buffered by a call to [[versions/v22/API/MPI_BSEND|MPI_BSEND]] (see Section [[versions/v22/sections/pt2pt#Model Implementation of Buffered Mode|Model Implementation of Buffered Mode]] ).

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~![[versions/v30/API/MPI_GET_PROCESSOR_NAME]]~~

~~This routine returns the name of the processor on which it was called at the moment of the call. The name is a character string for maximum flexibility. From this value it must be possible to identify a specific piece of hardware; possible values include “processor 9 in rack 4 of mpp.cs.org” and “231” (where 231 is the actual processor number in the running homogeneous system). The argument `name` must represent storage that is at least `MPI_MAX_PROCESSOR_NAME` characters long. `MPI_GET_PROCESSOR_NAME` may write up to this many characters into `name`.~~

~~The number of characters actually written is returned in the output argument, `resultlen`.~~

~~In C, a null character is additionally stored at `name[resultlen]`. The `resultlen` cannot be larger then `MPI_MAX_PROCESSOR_NAME`-1. In Fortran, name is padded on the right with blank characters. The `resultlen` cannot be larger then `MPI_MAX_PROCESSOR_NAME`.~~

~~> [!tip] Rationale~~

~~> This function allows MPI implementations that do process migration to return the current processor. Note that nothing in MPI *requires* or defines process migration; this definition of [[versions/v30/API/MPI_GET_PROCESSOR_NAME|MPI_GET_PROCESSOR_NAME]] simply allows such an implementation.~~

~~> [!note] Advice to users~~

~~> The user must provide at least `MPI_MAX_PROCESSOR_NAME` space to write the processor name — processor names can be this long. The user > > should examine the > > output > > argument, `resultlen`, to determine the actual length of the name.~~

~~The constant `MPI_BSEND_OVERHEAD` provides an upper bound on the fixed overhead per message buffered by a call to [[versions/v30/API/MPI_BSEND|MPI_BSEND]] (see Section [[versions/v30/sections/pt2pt#Model Implementation of Buffered Mode|Model Implementation of Buffered Mode]] ).~~

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The value returned for `MPI_WTIME_IS_GLOBAL` is 1 if clocks at all ==MPI== processes in `MPI_COMM_WORLD` are synchronized, 0 otherwise. A collection of clocks is considered synchronized if explicit effort has been taken to synchronize them. The expectation is that the variation in time, as measured by calls to [[versions/v50/API/MPI_WTIME|MPI_WTIME]] , will be less then one half the round-trip time for an MPI message of length zero. If time is measured at ~~a~~ ==an MPI== process just before a send and at another ==MPI== process just after a matching receive, the second time should be always higher than the first one.

The attribute `MPI_WTIME_IS_GLOBAL` has the same value on all ==MPI== processes of `MPI_COMM_WORLD`.

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/inquiry#Clock synchronization]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Clock Synchronization]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Clock Synchronization]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Clock Synchronization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Clock Synchronization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Clock Synchronization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Clock Synchronization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Clock Synchronization]]

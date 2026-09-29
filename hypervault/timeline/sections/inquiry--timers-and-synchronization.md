---
title: "Timers and Synchronization"
chapter: inquiry
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/inquiry]
---

# Timers and Synchronization

Chapter **inquiry** · in [[versions/v13/sections/inquiry#Timers and synchronization|MPI-1.3]], [[versions/v21/sections/inquiry#Timers and Synchronization|MPI-2.1]], [[versions/v22/sections/inquiry#Timers and Synchronization|MPI-2.2]], [[versions/v30/sections/inquiry#Timers and Synchronization|MPI-3.0]], [[versions/v31/sections/inquiry#Timers and Synchronization|MPI-3.1]], [[versions/v40/sections/inquiry#Timers and Synchronization|MPI-4.0]], [[versions/v41/sections/inquiry#Timers and Synchronization|MPI-4.1]], [[versions/v50/sections/inquiry#Timers and Synchronization|MPI-5.0]]

Heading by release: MPI-1.3: “Timers and synchronization”; MPI-2.1: “Timers and Synchronization”; MPI-2.2: “Timers and Synchronization”; MPI-3.0: “Timers and Synchronization”; MPI-3.1: “Timers and Synchronization”; MPI-4.0: “Timers and Synchronization”; MPI-4.1: “Timers and Synchronization”; MPI-5.0: “Timers and Synchronization”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

==See also Section [[versions/v21/sections/terms#Functions and Macros|Functions and Macros]] on page [[versions/v21/sections/terms#Functions and Macros|Functions and Macros]] .==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

The times returned are local to the node that called them. There is no requirement that different nodes return “the same time.” (But see also the discussion of ~~MPI_WTIME_IS_GLOBAL).~~ ==`MPI_WTIME_IS_GLOBAL`).==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~MPI defines a timer. A timer is specified even though it is not “message-passing,” because timing parallel programs is important in “performance debugging” and because existing timers (both in POSIX 1003.1-1988 and 1003.4D 14.1 and in Fortran 90) are either inconvenient or do not provide adequate access to high-resolution timers.~~

~~See also Section [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] on page [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] .~~

==MPI defines a timer. A timer is specified even though it is not “message-passing,” because timing parallel programs is important in “performance debugging” and because existing timers (both in POSIX 1003.1-1988 and 1003.4D 14.1 and in Fortran 90) are either inconvenient or do not provide adequate access to high resolution timers. See also Section [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] on page [[versions/v30/sections/terms#Functions and Macros|Functions and Macros]] .==

{ double starttime, endtime; starttime = MPI_Wtime(); .... stuff to be timed ... endtime = MPI_Wtime(); printf("That took %f seconds\n",endtime-starttime); }

The times returned are local to the node that called them. There is no requirement that different nodes return “the same time.” (But see also the discussion of ~~`MPI_WTIME_IS_GLOBAL`).~~ ==`MPI_WTIME_IS_GLOBAL` in Section [[versions/v30/sections/inquiry#Clock Synchronization|Clock Synchronization]] ).==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

MPI defines a timer. A timer is specified even though it is not “message-passing,” because timing parallel programs is important in “performance debugging” and because existing timers (both in POSIX 1003.1-1988 and 1003.4D 14.1 and in Fortran 90) are either inconvenient or do not provide adequate access to high resolution timers. See also ~~Section [[versions/v31/sections/terms#Functions and Macros|Functions and Macros]] on page~~ [[versions/v31/sections/terms#Functions and Macros|Functions and Macros]] .

~~`MPI_WTIME`~~ ==[[versions/v31/API/MPI_WTIME|MPI_WTIME]]== returns a floating-point number of seconds, representing elapsed wall-clock time since some time in the past.

~~`MPI_WTICK`~~ ==[[versions/v31/API/MPI_WTICK|MPI_WTICK]]== returns the resolution of [[versions/v31/API/MPI_WTIME|MPI_WTIME]] in seconds. That is, it returns, as a double precision value, the number of seconds between successive clock ticks. For example, if the clock is implemented by the hardware as a counter that is incremented every millisecond, the value returned by [[versions/v31/API/MPI_WTICK|MPI_WTICK]] should be $`10^{-3}`$.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

This function is portable (it returns seconds, not “ticks”), ==and== it allows ~~high-resolution, and carries no unnecessary baggage.~~ ==high-resolution.== One would use it like this:

{ double starttime, endtime; starttime = MPI_Wtime(); ~~....~~ ==...== stuff to be timed ... endtime = MPI_Wtime(); printf("That took %f ~~seconds\n",endtime-starttime);~~ ==seconds\n", endtime-starttime);== }

[[versions/v40/API/MPI_WTICK|MPI_WTICK]] returns the resolution of [[versions/v40/API/MPI_WTIME|MPI_WTIME]] in seconds. That is, it returns, as a double precision value, the number of seconds between successive clock ticks. For example, if the clock is implemented by the hardware as a counter that is incremented every millisecond, the value returned by [[versions/v40/API/MPI_WTICK|MPI_WTICK]] should be ~~$`10^{-3}`$.~~ ==$`(10^{-3})`$.==

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

MPI defines a timer. A timer is specified even though it is not “message-passing,” because timing parallel programs is important in “performance debugging” and because existing timers (both in POSIX 1003.1-1988 and 1003.4D 14.1 and in Fortran 90) are either inconvenient or do not provide adequate access to high resolution timers. ~~See also [[versions/v41/sections/terms#Functions and Macros|Functions and Macros]] .~~

~~    {         double starttime, endtime;         starttime = MPI_Wtime();         ...  stuff to be timed  ...         endtime   = MPI_Wtime();         printf("That took %f seconds\n", endtime-starttime);     }~~

==(code block added)==
``` [MPI]C
{
    double starttime, endtime;
    starttime = MPI_Wtime();
    ...  stuff to be timed  ...
    endtime   = MPI_Wtime();
    printf("That took %f seconds\n", endtime-starttime);
}
```

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/inquiry#Timers and synchronization]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/inquiry#Timers and Synchronization]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/inquiry#Timers and Synchronization]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/inquiry#Timers and Synchronization]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/inquiry#Timers and Synchronization]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/inquiry#Timers and Synchronization]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/inquiry#Timers and Synchronization]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/inquiry#Timers and Synchronization]]

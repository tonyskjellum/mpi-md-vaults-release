---
title: "Multiple Counting"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Multiple Counting

Chapter **tools** · in [[versions/v13/sections/prof#Multiple counting|MPI-1.3]], [[versions/v21/sections/prof#Multiple Counting|MPI-2.1]], [[versions/v22/sections/prof#Multiple Counting|MPI-2.2]], [[versions/v30/sections/tools#Multiple Counting|MPI-3.0]], [[versions/v31/sections/tools#Multiple Counting|MPI-3.1]], [[versions/v40/sections/tools#Multiple Counting|MPI-4.0]], [[versions/v41/sections/tools#Multiple Counting|MPI-4.1]], [[versions/v50/sections/tools#Multiple Counting|MPI-5.0]]

Heading by release: MPI-1.3: “Multiple counting”; MPI-2.1: “Multiple Counting”; MPI-2.2: “Multiple Counting”; MPI-3.0: “Multiple Counting”; MPI-3.1: “Multiple Counting”; MPI-4.0: “Multiple Counting”; MPI-4.1: “Multiple Counting”; MPI-5.0: “Multiple Counting”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (1 changed paragraph)

~~Since parts of the MPI library may themselves be implemented using more basic MPI functions (e.g. a portable implementation of the collective operations implemented using point to point communications), there is potential for profiling functions to be called from within an MPI function which was called from a profiling function. This could lead to “double counting” of the time spent in the inner routine. Since this effect could actually be useful under some circumstances (e.g. it might allow one to answer the question “How much time is spent in the point to point routines when they’re called from collective functions ?”), we have decided not to enforce any restrictions on the author of the MPI library which would overcome this. Therefore the author of the profiling library should be aware of this problem, and guard against it herself. In a single threaded world this is easily achieved through use of a static variable in the profiling code which remembers if you are already inside a profiling routine. It becomes more complex in a multi-threaded environment (as does the meaning of the times recorded !)~~

==Since parts of the MPI library may themselves be implemented using more basic MPI functions (e.g. a portable implementation of the collective operations implemented using point to point communications), there is potential for profiling functions to be called from within an MPI function==

==that==

==was called from a profiling function. This could lead to “double counting” of the time spent in the inner routine. Since this effect could actually be useful under some circumstances (e.g. it might allow one to answer the question “How much time is spent in the point to point routines when they’re called from collective functions ?”), we have decided not to enforce any restrictions on the author of the MPI library==

==that==

==would overcome this. Therefore the author of the profiling library should be aware of this problem, and guard against it herself. In a single threaded world this is easily achieved through use of a static variable in the profiling code==

==that==

==remembers if you are already inside a profiling routine. It becomes more complex in a multi-threaded environment (as does the meaning of the times recorded !)==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~Since parts of the MPI library may themselves be implemented using more basic MPI functions (e.g. a portable implementation of the collective operations implemented using point to point communications), there is potential for profiling functions to be called from within an MPI function~~

~~that~~

~~was called from a profiling function. This could lead to “double counting” of the time spent in the inner routine. Since this effect could actually be useful under some circumstances (e.g. it might allow one to answer the question “How much time is spent in the point to point routines when they’re called from collective functions ?”), we have decided not to enforce any restrictions on the author of the MPI library~~

~~that~~

~~would overcome this. Therefore the author of the profiling library should be aware of this problem, and guard against it herself. In a single threaded world this is easily achieved through use of a static variable in the profiling code~~

~~that~~

~~remembers if you are already inside a profiling routine. It becomes more complex in a multi-threaded environment (as does the meaning of the times recorded !)~~

==Since parts of the MPI library may themselves be implemented using more basic MPI functions (e.g., a portable implementation of the collective operations implemented using point to point communications), there is potential for profiling functions to be called from within an MPI function that was called from a profiling function. This could lead to “double counting” of the time spent in the inner routine. Since this effect could actually be useful under some circumstances (e.g., it might allow one to answer the question “How much time is spent in the point to point routines when they are called from collective functions?”), we have decided not to enforce any restrictions on the author of the MPI library that would overcome this. Therefore the author of the profiling library should be aware of this problem, and guard against it. In a single-threaded world this is easily achieved through use of a static variable in the profiling code that remembers if you are already inside a profiling routine. It becomes more complex in a multi-threaded environment (as does the meaning of the times recorded).==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Since parts of the MPI library may themselves be implemented using more basic MPI functions (e.g., a portable implementation of the collective operations implemented using ~~point to point~~ ==point-to-point== communications), there is potential for profiling functions to be called from within an MPI function that was called from a profiling function. This could lead to “double counting” of the time spent in the inner routine. Since this effect could actually be useful under some circumstances (e.g., it might allow one to answer the question “How much time is spent in the ~~point to point~~ ==point-to-point== routines when they are called from collective functions?”), we have decided not to enforce any restrictions on the author of the MPI library that would overcome this. Therefore the author of the profiling library should be aware of this problem, and guard against it. In a single-threaded world this is easily achieved through use of a static variable in the profiling code that remembers if you are already inside a profiling routine. It becomes more complex in a ~~multi-threaded~~ ==multithreaded== environment (as does the meaning of the times recorded).

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/prof#Multiple counting]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#Multiple Counting]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#Multiple Counting]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Multiple Counting]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Multiple Counting]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Multiple Counting]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Multiple Counting]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Multiple Counting]]

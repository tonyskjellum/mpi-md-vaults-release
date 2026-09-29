---
title: "Systems Without Weak Symbols"
chapter: tools
present_in: ["MPI-1.3", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1"]
tags: [mpi/section, mpi/tools]
---

# Systems Without Weak Symbols

Chapter **tools** · in [[versions/v13/sections/prof#Systems without weak symbols|MPI-1.3]], [[versions/v21/sections/prof#Systems Without Weak Symbols|MPI-2.1]], [[versions/v22/sections/prof#Systems Without Weak Symbols|MPI-2.2]], [[versions/v30/sections/tools#Systems Without Weak Symbols|MPI-3.0]], [[versions/v31/sections/tools#Systems Without Weak Symbols|MPI-3.1]]

Heading by release: MPI-1.3: “Systems without weak symbols”; MPI-2.1: “Systems Without Weak Symbols”; MPI-2.2: “Systems Without Weak Symbols”; MPI-3.0: “Systems Without Weak Symbols”; MPI-3.1: “Systems Without Weak Symbols”

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~It is required that the standard MPI library be built in such a way that the inclusion of MPI functions can be achieved one at a time. This is a somewhat unpleasant requirement, since it may mean that each external function has to be compiled from a separate file. However this is necessary so that the author of the profiling library need only define those MPI functions which she wishes to intercept, references to any others being fulfilled by the normal MPI library. Therefore the link step can look something like this~~

==It is required that the standard MPI library be built in such a way that the inclusion of MPI functions can be achieved one at a time. This is a somewhat unpleasant requirement, since it may mean that each external function has to be compiled from a separate file. However this is necessary so that the author of the profiling library need only define those MPI functions==

==that==

==she wishes to intercept, references to any others being fulfilled by the normal MPI library. Therefore the link step can look something like this==

~~Here `libmyprof.a` contains the profiler functions which intercept some of the MPI functions. `libpmpi.a` contains the “name shifted” MPI functions, and `libmpi.a` contains the normal definitions of the MPI functions.~~

==Here `libmyprof.a` contains the profiler functions==

==that==

==intercept some of the MPI functions. `libpmpi.a` contains the “name shifted” MPI functions, and `libmpi.a` contains the normal definitions of the MPI functions.==

### MPI-2.2 → MPI-3.0  (3 changed paragraphs)

In the absence of weak symbols then one possible solution would be to use the C macro ~~pre-processor thus~~ ==preprocessor as the following example shows:==

~~It is required that the standard MPI library be built in such a way that the inclusion of MPI functions can be achieved one at a time. This is a somewhat unpleasant requirement, since it may mean that each external function has to be compiled from a separate file. However this is necessary so that the author of the profiling library need only define those MPI functions~~

~~that~~

~~she wishes to intercept, references to any others being fulfilled by the normal MPI library. Therefore the link step can look something like this~~

==It is required that the standard MPI library be built in such a way that the inclusion of MPI functions can be achieved one at a time. This is a somewhat unpleasant requirement, since it may mean that each external function has to be compiled from a separate file. However this is necessary so that the author of the profiling library need only define those MPI functions that she wishes to intercept, references to any others being fulfilled by the normal MPI library. Therefore the link step can look something like this==

~~Here `libmyprof.a` contains the profiler functions~~

~~that~~

~~intercept some of the MPI functions. `libpmpi.a` contains the “name shifted” MPI functions, and `libmpi.a` contains the normal definitions of the MPI functions.~~

==Here `libmyprof.a` contains the profiler functions that intercept some of the MPI functions, `libpmpi.a` contains the “name shifted” MPI functions, and `libmpi.a` contains the normal definitions of the MPI functions.==

### MPI-3.1 → MPI-4.0

_Section absent from MPI-4.0._

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/prof#Systems without weak symbols]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/prof#Systems Without Weak Symbols]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/prof#Systems Without Weak Symbols]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Systems Without Weak Symbols]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Systems Without Weak Symbols]]

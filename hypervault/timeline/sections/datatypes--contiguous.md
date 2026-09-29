---
title: "Contiguous"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/datatypes]
---

# Contiguous

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Contiguous|MPI-2.1]], [[versions/v22/sections/datatypes#Contiguous|MPI-2.2]], [[versions/v30/sections/datatypes#Contiguous|MPI-3.0]], [[versions/v31/sections/datatypes#Contiguous|MPI-3.1]], [[versions/v40/sections/datatypes#Contiguous|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

The simplest datatype constructor is ~~`MPI_TYPE_CONTIGUOUS`~~ ==[[versions/v31/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]]== which allows replication of a datatype into contiguous locations.

~~ Let `oldtype` have type map $`\{ (\textsf{double}, 0), (\textsf{char}, 8) \} ,`$ with extent 16, and let $`\texttt{count} = 3`$. The type map of the datatype returned by `newtype` is ``` math \{ (\textsf{double}, 0), (\textsf{char}, 8), (\textsf{double}, 16), (\textsf{char}, 24), (\textsf{double}, 32), (\textsf{char}, 40) \} ; ```~~

~~i.e., alternating <span class="sans-serif">double</span> and <span class="sans-serif">char</span> elements, with displacements $`0, 8, 16, 24, 32, 40`$.~~

~~In general, assume that the type map of `oldtype` is ``` math \{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} , ```~~

~~with extent $`ex`$. Then `newtype` has a type map with $`count \cdot n`$ entries defined by: ``` math \{ (type_0, disp_0), ..., (type_{n-1}, disp_{n-1}), (type_0, disp_0 +ex), ... ,(type_{n-1}, disp_{n-1} + ex) , ```~~

~~(code block removed)~~
``` math
...,(type_0, disp_0 +ex \cdot(\textsf{count}-1) ), ... ,
(type_{n-1} , disp_{n-1} + ex \cdot (\textsf{count}-1)) \} .
```

==Let `oldtype` have type map $`\{ (\texttt{double}, 0), (\texttt{char}, 8) \} ,`$ with extent 16, and let $`\texttt{count} = 3`$. The type map of the datatype returned by `newtype` is ``` math \{ (\texttt{double}, 0), (\texttt{char}, 8), (\texttt{double}, 16),     (\texttt{char}, 24), (\texttt{double}, 32), (\texttt{char}, 40) \}; ```==

==i.e., alternating `double` and `char` elements, with displacements $`0, 8, 16, 24, 32, 40`$.==

==In general, assume that the type map of `oldtype` is ``` math \{ (type_0,disp_0), ... , (type_{n-1}, disp_{n-1}) \} , ```==

==with extent $`ex`$. Then `newtype` has a type map with $`\texttt{count} \cdot \texttt{n}`$ entries defined by: ``` math \{ (type_0, disp_0), ... , (type_{n-1}, disp_{n-1}), (type_0, disp_0 +ex), ... ,(type_{n-1}, disp_{n-1} + ex),\\ ```==

==(code block added)==
``` math
...,(type_0, disp_0 +ex \cdot(\texttt{count}-1) ), ... ,
(type_{n-1} , disp_{n-1} + ex \cdot (\texttt{count}-1)) \} .
```

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

with extent $`ex`$. Then `newtype` has a type map with $`\texttt{count} \cdot \texttt{n}`$ entries defined by: ``` math \{ (type_0, disp_0), ... , (type_{n-1}, disp_{n-1}), (type_0, disp_0 +ex), ... ,(type_{n-1}, disp_{n-1} + ex),\\ ```

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Contiguous]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Contiguous]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Contiguous]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Contiguous]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Contiguous]]

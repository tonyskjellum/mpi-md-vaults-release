---
title: "Indexed"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/datatypes]
---

# Indexed

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Indexed|MPI-2.1]], [[versions/v22/sections/datatypes#Indexed|MPI-2.2]], [[versions/v30/sections/datatypes#Indexed|MPI-3.0]], [[versions/v31/sections/datatypes#Indexed|MPI-3.1]], [[versions/v40/sections/datatypes#Indexed|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~with extent *ex*. Let `B` be the `array_of_blocklength` argument and~~

~~`D` be the~~

==with extent *ex*. Let `B` be the `array_of_blocklengths` argument and `D` be the==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~ Let `oldtype` have type map $`\{ (\textsf{double}, 0), (\textsf{char}, 8) \} ,`$ with extent 16. Let <span class="sans-serif">B = (3, 1)</span> and let <span class="sans-serif">D = (4, 0)</span>. A call to [[versions/v31/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] returns a datatype with type map, ``` math \{ (\textsf{double}, 64), (\textsf{char}, 72), (\textsf{double}, 80), (\textsf{char}, 88), (\textsf{double}, 96), (\textsf{char}, 104), ```~~

~~(code block removed)~~
``` math
(\textsf{double}, 0), (\textsf{char}, 8)
\} .
```

==Let `oldtype` have type map $`\{ (\texttt{double}, 0), (\texttt{char}, 8) \} ,`$ with extent 16. Let `B = (3, 1)` and let `D = (4, 0)`. A call to [[versions/v31/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] returns a datatype with type map, ``` math \{ (\texttt{double}, 64), (\texttt{char}, 72), (\texttt{double}, 80), (\texttt{char}, 88), (\texttt{double}, 96), (\texttt{char}, 104), ```==

==(code block added)==
``` math
(\texttt{double}, 0), (\texttt{char}, 8)
\} .
```

~~with extent *ex*. Let `B` be the `array_of_blocklengths` argument and `D` be the~~

~~`array_of_displacements` argument. The newly created datatype has $`n \cdot \sum_{i=0}^{\textsf{count}-1} \texttt{B[i]}`$ entries: ``` math \{ (type_0, disp_0 + \texttt{D[0]} \cdot ex ) , ... , (type_{n-1} , disp_{n-1} + \texttt{D[0]} \cdot ex ) , ... , ```~~

==with extent *ex*. Let `B` be the `array_of_blocklengths` argument and `D` be the `array_of_displacements` argument. The newly created datatype has $`n \cdot \sum_{i=0}^{\texttt{count}-1} \texttt{B[i]}`$ entries: ``` math \{ (type_0, disp_0 + \texttt{D[0]} \cdot ex ) , ... , (type_{n-1} , disp_{n-1} + \texttt{D[0]} \cdot ex ) , ... , ```==

A call to [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] is equivalent to a call to [[versions/v31/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] where ``` math \texttt{D[j]} = j \cdot \texttt{stride}, j=0 ,..., ~~\textsf{count}~~ ==\texttt{count}== -1 , ```

and ``` math \texttt{B[j]} = \texttt{blocklength}, j=0 ,..., ~~\textsf{count}~~ ==\texttt{count}== -1 . ```

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

~~(code block removed)~~
``` math
(type_0 , disp_0 + (\texttt{D[0]} + \texttt{B[0]} -1) \cdot ex) ,...,
(type_{n-1} , disp_{n-1} + (\texttt{D[0]} +\texttt{B[0]} -1) \cdot ex ) ,
...,
```

==(code block added)==
``` math
(type_0 , disp_0 + (\texttt{D[0]} + \texttt{B[0]} -1) \cdot ex) ,...,
```

==(code block added)==
``` math
(type_{n-1} , disp_{n-1} + (\texttt{D[0]} +\texttt{B[0]} -1) \cdot ex ) ,
...,
```

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Indexed]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Indexed]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Indexed]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Indexed]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Indexed]]

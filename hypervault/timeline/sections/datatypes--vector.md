---
title: "Vector"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/datatypes]
---

# Vector

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Vector|MPI-2.1]], [[versions/v22/sections/datatypes#Vector|MPI-2.2]], [[versions/v30/sections/datatypes#Vector|MPI-3.0]], [[versions/v31/sections/datatypes#Vector|MPI-3.1]], [[versions/v40/sections/datatypes#Vector|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

That is, two blocks with three copies each of the old type, with a stride of 4 elements ($`4 \cdot 16`$ bytes) between the ~~blocks.~~ ==the start of each block.==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~ Assume, again, that `oldtype` has type map $`\{ (\textsf{double}, 0), (\textsf{char}, 8) \} ,`$ with extent 16. A call to [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] will create the datatype with type map, ``` math \{ (\textsf{double}, 0), (\textsf{char}, 8), (\textsf{double}, 16), (\textsf{char}, 24), (\textsf{double}, 32), (\textsf{char}, 40), ```~~

~~(code block removed)~~
``` math
(\textsf{double}, 64), (\textsf{char}, 72), (\textsf{double}, 80), (\textsf{char},
88), (\textsf{double}, 96), (\textsf{char}, 104)
\} .
```

==Assume, again, that `oldtype` has type map $`\{ (\texttt{double}, 0), (\texttt{char}, 8) \} ,`$ with extent 16. A call to [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] will create the datatype with type map, ``` math \{ (\texttt{double}, 0), (\texttt{char}, 8), (\texttt{double}, 16), (\texttt{char}, 24), (\texttt{double}, 32), (\texttt{char}, 40), ```==

==(code block added)==
``` math
(\texttt{double}, 64), (\texttt{char}, 72), (\texttt{double}, 80), (\texttt{char},
88), (\texttt{double}, 96), (\texttt{char}, 104)
\} .
```

A call to [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] will create the datatype, ``` math \{ ~~(\textsf{double},~~ ==(\texttt{double},== 0), ~~(\textsf{char},~~ ==(\texttt{char},== 8), ~~(\textsf{double},~~ ==(\texttt{double},== -32), ~~(\textsf{char},~~ ==(\texttt{char},== -24), ~~(\textsf{double},~~ ==(\texttt{double},== -64), ~~(\textsf{char},~~ ==(\texttt{char},== -56) \} . ```

with extent $`ex`$. Let ~~<span class="sans-serif">bl</span>~~ ==`bl`== be the ~~<span class="sans-serif">blocklength</span>.~~ ==`blocklength`.== The newly created datatype has a type map with ~~$`\textsf{count}~~ ==$`\texttt{count}== \cdot ~~\textsf{bl}~~ ==\texttt{bl}== \cdot ~~n`$~~ ==\texttt{n}`$== entries: ``` math \{ (type_0, disp_0), ... , (type_{n-1} , disp_{n-1}), ```

~~(code block removed)~~
``` math
(type_0 , disp_0 + (\textsf{bl} -1) \cdot ex
) , ... , (type_{n-1} , disp_{n-1} + (\textsf{bl} -1) \cdot ex ) ,
```

~~(code block removed)~~
``` math
(type_0 ,disp_0 + \textsf{stride} \cdot ex ) , ... ,
(type_{n-1} , disp_{n-1} + \textsf{stride} \cdot ex ), ... ,
```

~~(code block removed)~~
``` math
(type_0 , disp_0 + (\textsf{stride} + \textsf{bl} -1) \cdot ex ) , ... ,

(type_{n-1}, disp_{n-1} + (\textsf{stride} + \textsf{bl} -1) \cdot
ex ) , ....,
```

~~(code block removed)~~
``` math
(type_0 ,disp_0 + \textsf{stride} \cdot (\textsf{count}-1) \cdot ex ) , ... ,
```

~~(code block removed)~~
``` math
(type_{n-1} , disp_{n-1} + \textsf{stride} \cdot (\textsf{count} -1) \cdot
ex )
, ... ,
```

~~(code block removed)~~
``` math
(type_0 , disp_0 + (\textsf{stride} \cdot (\textsf{count} -1)
+ \textsf{bl} -1) \cdot ex ) , ... ,
```

~~(code block removed)~~
``` math
(type_{n-1}, disp_{n-1} + (\textsf{stride} \cdot (\textsf{count} -1)
+ \textsf{bl} -1) \cdot ex )
\} .
```

~~A call to [[versions/v31/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] is equivalent to a call to [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , or to a call to [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , <span class="sans-serif">n</span> arbitrary.~~

==(code block added)==
``` math
(type_0 , disp_0 + (\texttt{bl} -1) \cdot ex
) , ... , (type_{n-1} , disp_{n-1} + (\texttt{bl} -1) \cdot ex ) ,
```

==(code block added)==
``` math
(type_0 ,disp_0 + \texttt{stride} \cdot ex ) , ... ,
(type_{n-1} , disp_{n-1} + \texttt{stride} \cdot ex ), ... ,
```

==(code block added)==
``` math
(type_0 , disp_0 + (\texttt{stride} + \texttt{bl} -1) \cdot ex ) , ... ,
(type_{n-1}, disp_{n-1} + (\texttt{stride} + \texttt{bl} -1) \cdot
ex ) , ... ,
```

==(code block added)==
``` math
(type_0 ,disp_0 + \texttt{stride} \cdot (\texttt{count}-1) \cdot ex ) , ... ,
```

==(code block added)==
``` math
(type_{n-1} , disp_{n-1} + \texttt{stride} \cdot (\texttt{count} -1) \cdot
ex )
, ... ,
```

==(code block added)==
``` math
(type_0 , disp_0 + (\texttt{stride} \cdot (\texttt{count} -1)
+ \texttt{bl} -1) \cdot ex ) , ... ,
```

==(code block added)==
``` math
(type_{n-1}, disp_{n-1} + (\texttt{stride} \cdot (\texttt{count} -1)
+ \texttt{bl} -1) \cdot ex )
\} .
```

==A call to [[versions/v31/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] is equivalent to a call to [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , or to a call to [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , `n` arbitrary.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

A call to [[versions/v40/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] is equivalent to a call to [[versions/v40/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , or to a call to [[versions/v40/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , ==where== `n` ~~arbitrary.~~ ==is an arbitrary integer value.==

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Vector]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Vector]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Vector]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Vector]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Vector]]

---
title: "Hvector"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/datatypes]
---

# Hvector

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Hvector|MPI-2.1]], [[versions/v22/sections/datatypes#Hvector|MPI-2.2]], [[versions/v30/sections/datatypes#Hvector|MPI-3.0]], [[versions/v31/sections/datatypes#Hvector|MPI-3.1]], [[versions/v40/sections/datatypes#Hvector|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~The function~~

~~[[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]]~~

~~is identical to [[versions/v30/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , except that `stride` is given in bytes, rather than in elements. The use for both types of vector constructors is illustrated in Section [[versions/v30/sections/datatypes#Examples|Examples]] . (<span class="sans-serif">H</span> stands for “heterogeneous”).~~

==The function [[versions/v30/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] is identical to [[versions/v30/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , except that `stride` is given in bytes, rather than in elements. The use for both types of vector constructors is illustrated in Section [[versions/v30/sections/datatypes#Examples|Examples]] . (<span class="sans-serif">H</span> stands for “heterogeneous”).==

~~This function replaces [[versions/v22/API/MPI_TYPE_HVECTOR|MPI_TYPE_HVECTOR]] , whose use is deprecated. See also Chapter [[versions/v30/sections/deprecated#Deprecated Functions|Deprecated Functions]] .~~

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

The function [[versions/v31/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] is identical to [[versions/v31/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , except that `stride` is given in bytes, rather than in elements. The use for both types of vector constructors is illustrated in Section [[versions/v31/sections/datatypes#Examples|Examples]] . ~~(<span class="sans-serif">H</span>~~ ==(`H`== stands for “heterogeneous”).

with extent $`ex`$. Let ~~<span class="sans-serif">bl</span>~~ ==`bl`== be the ~~<span class="sans-serif">blocklength</span>.~~ ==`blocklength`.== The newly created datatype has a type map with ~~$`\textsf{count}~~ ==$`\texttt{count}== \cdot ~~\textsf{bl}~~ ==\texttt{bl}== \cdot n`$ entries: ``` math \{ (type_0, disp_0), ... , (type_{n-1} , disp_{n-1}), ```

~~(code block removed)~~
``` math
(type_0 , disp_0 + (\textsf{bl} -1) \cdot ex
) , ... , (type_{n-1} , disp_{n-1} + (\textsf{bl} -1) \cdot ex ) ,
```

~~(code block removed)~~
``` math
(type_0 ,disp_0 + \textsf{stride}  ) , ... ,
(type_{n-1} , disp_{n-1} + \textsf{stride} ) , ... ,
```

~~(code block removed)~~
``` math
(type_0 , disp_0 + \textsf{stride} + ( \textsf{bl} -1) \cdot ex
) , ... ,
```

~~(code block removed)~~
``` math
(type_{n-1}, disp_{n-1} + \textsf{stride} + (\textsf{bl} -1) \cdot
ex ) ,
....,
```

~~(code block removed)~~
``` math
(type_0 ,disp_0 + \textsf{stride} \cdot (\textsf{count}-1) ) , ... ,

(type_{n-1} , disp_{n-1} + \textsf{stride} \cdot (\textsf{count} -1)  )
, ... ,
```

~~(code block removed)~~
``` math
(type_0 , disp_0 + \textsf{stride} \cdot (\textsf{count} -1)
+ (\textsf{bl} -1) \cdot ex ) , ... ,
```

~~(code block removed)~~
``` math
(type_{n-1}, disp_{n-1} + \textsf{stride} \cdot (\textsf{count} -1)
+ (\textsf{bl} -1) \cdot ex )
\} .
```

==(code block added)==
``` math
(type_0 , disp_0 + (\texttt{bl} -1) \cdot ex
) , ... , (type_{n-1} , disp_{n-1} + (\texttt{bl} -1) \cdot ex ) ,
```

==(code block added)==
``` math
(type_0 ,disp_0 + \texttt{stride}  ) , ... ,
(type_{n-1} , disp_{n-1} + \texttt{stride} ) , ... ,
```

==(code block added)==
``` math
(type_0 , disp_0 + \texttt{stride} + ( \texttt{bl} -1) \cdot ex
) , ... ,
```

==(code block added)==
``` math
(type_{n-1}, disp_{n-1} + \texttt{stride} + (\texttt{bl} -1) \cdot
ex ) ,
... ,
```

==(code block added)==
``` math
(type_0 ,disp_0 + \texttt{stride} \cdot (\texttt{count}-1) ) , ... ,
(type_{n-1} , disp_{n-1} + \texttt{stride} \cdot (\texttt{count} -1)  )
, ... ,
```

==(code block added)==
``` math
(type_0 , disp_0 + \texttt{stride} \cdot (\texttt{count} -1)
+ (\texttt{bl} -1) \cdot ex ) , ... ,
```

==(code block added)==
``` math
(type_{n-1}, disp_{n-1} + \texttt{stride} \cdot (\texttt{count} -1)
+ (\texttt{bl} -1) \cdot ex )
\} .
```

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Hvector]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Hvector]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Hvector]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Hvector]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Hvector]]

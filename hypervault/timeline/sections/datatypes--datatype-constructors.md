---
title: "Datatype Constructors"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Datatype Constructors

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Datatype Constructors|MPI-2.1]], [[versions/v22/sections/datatypes#Datatype Constructors|MPI-2.2]], [[versions/v30/sections/datatypes#Datatype Constructors|MPI-3.0]], [[versions/v31/sections/datatypes#Datatype Constructors|MPI-3.1]], [[versions/v40/sections/datatypes#Datatype Constructors|MPI-4.0]], [[versions/v41/sections/datatypes#Datatype Constructors|MPI-4.1]], [[versions/v50/sections/datatypes#Datatype Constructors|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

==**Contiguous.** The simplest datatype constructor is [[versions/v41/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] , which allows replication of a datatype into contiguous locations.==

==![[versions/v41/API/MPI_TYPE_CONTIGUOUS]]==

==`newtype` is the datatype obtained by concatenating `count` copies of `oldtype`. Concatenation is defined using *extent* as the size of the concatenated copies.==

==Let `oldtype` have type map $`\{ (\texttt{double}, 0), (\texttt{char}, 8) \} ,`$ with extent 16, and let $`\texttt{count} = 3`$. The type map of the datatype returned by `newtype` is ``` math \{ (\texttt{double}, 0), (\texttt{char}, 8), (\texttt{double}, 16),    (\texttt{char}, 24), (\texttt{double}, 32), (\texttt{char}, 40) \}; ```==

==i.e., alternating `double` and `char` elements, with displacements $`0, 8, 16, 24, 32, 40`$.==

==In general, assume that the type map of `oldtype` is ``` math \{ (type_0,disp_0), ... , (type_{n-1}, disp_{n-1}) \} , ```==

==with extent $`ex`$. Then `newtype` has a type map with $`\texttt{count} \cdot \texttt{n}`$ entries defined by: ``` math \{ (type_0, disp_0), ... , (type_{n-1}, disp_{n-1}),  (type_0, disp_0 +ex), ... ,(type_{n-1}, disp_{n-1} + ex),\\ ```==

==(code block added)==
``` math
...,(type_0, disp_0 +ex \cdot(\texttt{count}-1) ), ... ,
(type_{n-1} , disp_{n-1} + ex \cdot (\texttt{count}-1)) \} .
```

==**Vector.** The procedure [[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] is a more general constructor that allows replication of a datatype into locations that consist of equally spaced blocks. Each block is obtained by concatenating the same number of copies of the old datatype. The spacing between blocks is a multiple of the extent of the old datatype.==

==![[versions/v41/API/MPI_TYPE_VECTOR]]==

==Assume, again, that `oldtype` has type map $`\{ (\texttt{double}, 0), (\texttt{char}, 8) \} ,`$ with extent 16. A call to [[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] will create the datatype with type map, ``` math \{ (\texttt{double}, 0), (\texttt{char}, 8), (\texttt{double}, 16), (\texttt{char}, 24), (\texttt{double}, 32), (\texttt{char}, 40), ```==

==(code block added)==
``` math
(\texttt{double}, 64), (\texttt{char}, 72), (\texttt{double}, 80), (\texttt{char},
88), (\texttt{double}, 96), (\texttt{char}, 104)
\} .
```

==That is, two blocks with three copies each of the old type, with a stride of 4 elements ($`4 \cdot 16`$ bytes) between the the start of each block.==

==A call to [[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] will create the datatype, ``` math \{ (\texttt{double}, 0), (\texttt{char}, 8), (\texttt{double}, -32), (\texttt{char}, -24), (\texttt{double}, -64), (\texttt{char}, -56) \} . ```==

==In general, assume that `oldtype` has type map, ``` math \{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} , ```==

==with extent $`ex`$. Let `bl` be the `blocklength`. The newly created datatype has a type map with $`\texttt{count} \cdot \texttt{bl} \cdot \texttt{n}`$ entries: ``` math \{ (type_0, disp_0), ... , (type_{n-1} , disp_{n-1}), ```==

==(code block added)==
``` math
(type_0 ,disp_0 + ex) , ... ,
(type_{n-1} , disp_{n-1} + ex ), ...,
```

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

==A call to [[versions/v41/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] is equivalent to a call to [[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , or to a call to [[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , where `n` is an arbitrary integer value.==

==**Hvector.** The procedure [[versions/v41/API/MPI_TYPE_CREATE_HVECTOR|MPI_TYPE_CREATE_HVECTOR]] is identical to [[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] , except that `stride` is given in bytes, rather than in elements. The use for both types of vector constructors is illustrated in Section [[versions/v41/sections/datatypes#Examples|Examples]] . (`H` stands for “heterogeneous”).==

==![[versions/v41/API/MPI_TYPE_CREATE_HVECTOR]]==

==Assume that `oldtype` has type map, ``` math \{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} , ```==

==with extent $`ex`$. Let `bl` be the `blocklength`. The newly created datatype has a type map with $`\texttt{count} \cdot \texttt{bl} \cdot n`$ entries: ``` math \{ (type_0, disp_0), ... , (type_{n-1} , disp_{n-1}), ```==

==(code block added)==
``` math
(type_0 ,disp_0 + ex) , ... ,
(type_{n-1} , disp_{n-1} + ex ), ...,
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

==**Indexed.** The procedure [[versions/v41/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] allows replication of an old datatype into a sequence of blocks (each block is a concatenation of the old datatype), where each block can contain a different number of copies and have a different displacement. All block displacements are multiples of the old type extent.==

==![[versions/v41/API/MPI_TYPE_INDEXED]]==

==Let `oldtype` have type map $`\{ (\texttt{double}, 0), (\texttt{char}, 8) \} ,`$ with extent 16. Let `B = (3, 1)` and let `D = (4, 0)`. A call to [[versions/v41/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] returns a datatype with type map, ``` math \{ (\texttt{double}, 64), (\texttt{char}, 72), (\texttt{double}, 80), (\texttt{char}, 88), (\texttt{double}, 96), (\texttt{char}, 104), ```==

==(code block added)==
``` math
(\texttt{double}, 0), (\texttt{char}, 8)
\} .
```

==That is, three copies of the old type starting at displacement 64, and one copy starting at displacement 0.==

==In general, assume that `oldtype` has type map, ``` math \{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} , ```==

==with extent *ex*. Let `B` be the `array_of_blocklengths` argument and `D` be the `array_of_displacements` argument. The newly created datatype has $`n \cdot \sum_{i=0}^{\texttt{count}-1} \texttt{B[i]}`$ entries: ``` math \{ (type_0, disp_0 + \texttt{D[0]} \cdot ex ) , ... , (type_{n-1} , disp_{n-1} + \texttt{D[0]} \cdot ex ) , ... , ```==

==(code block added)==
``` math
(type_0 , disp_0 + (\texttt{D[0]} + \texttt{B[0]} -1) \cdot ex) ,...,
```

==(code block added)==
``` math
(type_{n-1} , disp_{n-1} + (\texttt{D[0]} +\texttt{B[0]} -1) \cdot ex ) ,
...,
```

==(code block added)==
``` math
(type_0, disp_0 + \texttt{D[count-1]} \cdot ex ) , ... ,
(type_{n-1} , disp_{n-1} + \texttt{D[count-1]} \cdot ex ) , ... ,
```

==(code block added)==
``` math
(type_0 , disp_0 + (\texttt{D[count-1]} + \texttt{B[count-1]} -1) \cdot ex)
,...,
```

==(code block added)==
``` math
(type_{n-1} , disp_{n-1} + (\texttt{D[count-1]} +\texttt{B[count-1]} -1)
\cdot ex )
\} .
```

==A call to [[versions/v41/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] is equivalent to a call to [[versions/v41/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] where ``` math \texttt{D[j]} = j \cdot \texttt{stride}, j=0 ,..., \texttt{count} -1 , ```==

==and ``` math \texttt{B[j]} = \texttt{blocklength}, j=0 ,..., \texttt{count} -1 . ```==

==**Hindexed.** The procedure [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] is identical to [[versions/v41/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] , except that block displacements in `array_of_displacements` are specified in bytes, rather than in multiples of the `oldtype` extent.==

==![[versions/v41/API/MPI_TYPE_CREATE_HINDEXED]]==

==Assume that `oldtype` has type map, ``` math \{ (type_0,disp_0), ..., (type_{n-1}, disp_{n-1}) \} , ```==

==with extent $`ex`$. Let `B` be the `array_of_blocklengths` argument and `D` be the `array_of_displacements` argument. The newly created datatype has a type map with $`n \cdot \sum_{i=0}^{\texttt{count}-1} \texttt{B[i]}`$ entries: ``` math \{ (type_0, disp_0 + \texttt{D[0]}  ) , ... , (type_{n-1} , disp_{n-1} + \texttt{D[0]} ) , ... , ```==

==(code block added)==
``` math
(type_0 , disp_0 + \texttt{D[0]} +(\texttt{B[0]} -1) \cdot ex) ,...,
```

==(code block added)==
``` math
(type_{n-1} , disp_{n-1} + \texttt{D[0]} +(\texttt{B[0]} -1) \cdot ex ) ,
...,
```

==(code block added)==
``` math
(type_0, disp_0 + \texttt{D[count-1]} ) , ... ,
(type_{n-1} , disp_{n-1} + \texttt{D[count-1]} ) , ... ,
```

==(code block added)==
``` math
(type_0 , disp_0 + \texttt{D[count-1]} +(\texttt{B[count-1]} -1) \cdot ex)
,...,
```

==(code block added)==
``` math
(type_{n-1} , disp_{n-1} + \texttt{D[count-1]} +(\texttt{B[count-1]} -1)
\cdot ex )
\} .
```

==**Indexed_block.** This procedure is the same as [[versions/v41/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] except that the blocklength is the same for all blocks. There are many codes using indirect addressing arising from unstructured grids where the blocksize is always 1 (gather/scatter). The following convenience procedure allows for constant blocksize and arbitrary displacements.==

==![[versions/v41/API/MPI_TYPE_CREATE_INDEXED_BLOCK]]==

==**Hindexed_block.** The procedure [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED_BLOCK|MPI_TYPE_CREATE_HINDEXED_BLOCK]] is identical to [[versions/v41/API/MPI_TYPE_CREATE_INDEXED_BLOCK|MPI_TYPE_CREATE_INDEXED_BLOCK]] , except that block displacements in `array_of_displacements` are specified in bytes, rather than in multiples of the `oldtype` extent.==

==![[versions/v41/API/MPI_TYPE_CREATE_HINDEXED_BLOCK]]==

==**Struct.** [[versions/v41/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] is the most general type constructor. It further generalizes [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] in that it allows each block to consist of replications of different datatypes.==

==![[versions/v41/API/MPI_TYPE_CREATE_STRUCT]]==

==Let `type1` have type map, ``` math \{ (\texttt{double}, 0), (\texttt{char}, 8) \} , ```==

==with extent 16. Let `B = (2, 1, 3)`, `D = (0, 16, 26)`, and `T = (MPI_FLOAT, type1, MPI_CHAR)`. Then a call to [[versions/v41/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] returns a datatype with type map, ``` math \{ (\texttt{float}, 0), (\texttt{float}, 4), (\texttt{double}, 16), (\texttt{char}, 24), (\texttt{char}, 26), (\texttt{char}, 27), (\texttt{char}, 28) \} . ```==

==That is, two copies of `MPI_FLOAT` starting at 0, followed by one copy of `type1` starting at 16, followed by three copies of `MPI_CHAR`, starting at 26. In this example, we assume that a float occupies four bytes.==

==In general, let `T` be the `array_of_types` argument, where `T[i]` is a handle to, ``` math typemap_i = \{ (type_0^i , disp_0^i ) , ... , (type_{n_{i}-1}^i , disp_{n_{i}-1}^i ) \} , ```==

==with extent $`ex_i`$. Let `B` be the `array_of_blocklength` argument and `D` be the `array_of_displacements` argument. Let `c` be the `count` argument. Then the newly created datatype has a type map with $`\sum_{i=0}^{\texttt{c}-1}\texttt{B[i]} \cdot n_i`$ entries: ``` math \{ (type_0^0 , disp_0^0 +\texttt{D[0]}) , ... , (type_{n_0}^0 , disp_{n_0}^0 + \texttt{D[0]} ) , ... , ```==

==(code block added)==
``` math
(type_0^0 , disp_0^0 + \texttt{D[0]} + (\texttt{B[0]}-1) \cdot ex_0 ) , ...
,
(type_{n_0}^0 , disp_{n_0}^0 + \texttt{D[0]} + (\texttt{B[0]-1)} \cdot
ex_0 )
, ... ,
```

==(code block added)==
``` math
(type_0^{\texttt{c}-1} , disp_0^{\texttt{c}-1} +\texttt{D[c-1]}) , ... ,
(type_{{n_{\texttt{c}-1}}-1}^{\texttt{c}-1} ,
disp_{{n_{\texttt{c}-1}}-1}^{\texttt{c}-1} + \texttt{D[c-1]} ) ,
... ,
```

==(code block added)==
``` math
(type_0^{\texttt{c}-1} , disp_0^{\texttt{c}-1} +
\texttt{D[c-1]} + (\texttt{B[c-1]}-1) \cdot ex_{\texttt{c}-1} ) ,
... ,
```

==(code block added)==
``` math
(type_{{n_{\texttt{c}-1}}-1}^{\texttt{c}-1} ,
disp_{{n_{\texttt{c}-1}}-1}^{\texttt{c}-1} + \texttt{D[c-1]} +
(\texttt{B[c-1]-1)} \cdot ex_{\texttt{c}-1} )
\} .
```

==A call to [[versions/v41/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] is equivalent to a call to [[versions/v41/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , where each entry of `T` is equal to `oldtype`.==

### MPI-4.1 → MPI-5.0  (6 changed paragraphs)

Assume, again, that `oldtype` has type map $`\{ (\texttt{double}, 0), (\texttt{char}, 8) \} ,`$ with extent 16. A call to [[versions/v50/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] ==`(2, 3, 4, oldtype, newtype)`== will create the datatype with type map, ``` math \{ (\texttt{double}, 0), (\texttt{char}, 8), (\texttt{double}, 16), (\texttt{char}, 24), (\texttt{double}, 32), (\texttt{char}, 40), ```

That is, two blocks with three copies each of the old type, with a stride of 4 elements ($`4 \cdot 16`$ bytes) between the ~~the~~ start of each block.

A call to [[versions/v50/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] ==`(3, 1, -2, oldtype, newtype)`== will create the datatype, ``` math \{ (\texttt{double}, 0), (\texttt{char}, 8), (\texttt{double}, -32), (\texttt{char}, -24), (\texttt{double}, -64), (\texttt{char}, -56) \} . ```

A call to [[versions/v50/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] ==`(count, oldtype, newtype)`== is equivalent to a call to [[versions/v50/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] ~~,~~ ==`(count, 1, 1, oldtype, newtype)`,== or to a call to [[versions/v50/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] ~~,~~ ==`(1, count, n, oldtype, newtype)`,== where `n` is an arbitrary integer value.

Let `oldtype` have type map $`\{ (\texttt{double}, 0), (\texttt{char}, 8) \} ,`$ with extent 16. Let `B = (3, 1)` and let `D = (4, 0)`. A call to [[versions/v50/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] ==`(2, B, D, oldtype, newtype)`== returns a datatype with type map, ``` math \{ (\texttt{double}, 64), (\texttt{char}, 72), (\texttt{double}, 80), (\texttt{char}, 88), (\texttt{double}, 96), (\texttt{char}, 104), ```

A call to [[versions/v50/API/MPI_TYPE_VECTOR|MPI_TYPE_VECTOR]] ==`(count, blocklength, stride, oldtype, newtype)`== is equivalent to a call to [[versions/v50/API/MPI_TYPE_INDEXED|MPI_TYPE_INDEXED]] ==`(count, B, D, oldtype, newtype)`== where ``` math \texttt{D[j]} = j \cdot \texttt{stride}, j=0 ,..., \texttt{count} -1 , ```

A call to [[versions/v50/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] ==`(count, B, D, oldtype, newtype)`== is equivalent to a call to [[versions/v50/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] ~~,~~ ==`(count, B, D, T, newtype)`,== where each entry of `T` is equal to `oldtype`.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Datatype Constructors]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Datatype Constructors]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Datatype Constructors]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Datatype Constructors]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Datatype Constructors]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Datatype Constructors]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Datatype Constructors]]

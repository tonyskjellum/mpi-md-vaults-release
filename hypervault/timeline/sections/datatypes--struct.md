---
title: "Struct"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/datatypes]
---

# Struct

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Struct|MPI-2.1]], [[versions/v22/sections/datatypes#Struct|MPI-2.2]], [[versions/v30/sections/datatypes#Struct|MPI-3.0]], [[versions/v31/sections/datatypes#Struct|MPI-3.1]], [[versions/v40/sections/datatypes#Struct|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~<span class="sans-serif">MPI_TYPE_STRUCT</span> is the most general type constructor. It further generalizes~~

~~[[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]]~~

~~in that it allows each block to consist of replications of different datatypes.~~

==[[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] is the most general type constructor. It further generalizes==

==[[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] in that it allows each block to consist of replications of different datatypes.==

~~This function replaces [[versions/v22/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] , whose use is deprecated. See also Chapter [[versions/v30/sections/deprecated#Deprecated Functions|Deprecated Functions]] .~~

with extent 16. Let <span class="sans-serif">B = (2, 1, 3)</span>, <span class="sans-serif">D = (0, 16, 26)</span>, and <span class="sans-serif">T = (MPI_FLOAT, type1, MPI_CHAR)</span>. Then a call to ~~[[versions/v22/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]]~~ ==[[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]]== returns a datatype with type map, ``` math \{ (\textsf{float}, 0), (\textsf{float}, 4), (\textsf{double}, 16), (\textsf{char}, 24), (\textsf{char}, 26), (\textsf{char}, 27), (\textsf{char}, 28) \} . ```

~~[[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]]~~

~~is equivalent to a call to~~

~~[[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] ,~~

~~where each entry of `T` is equal to `oldtype`.~~

==[[versions/v30/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] is equivalent to a call to==

==[[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , where each entry of `T` is equal to `oldtype`.==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~[[versions/v31/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] is the most general type constructor. It further generalizes~~

~~[[versions/v31/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] in that it allows each block to consist of replications of different datatypes.~~

==[[versions/v31/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] is the most general type constructor. It further generalizes [[versions/v31/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] in that it allows each block to consist of replications of different datatypes.==

Let `type1` have type map, ``` math \{ ~~(\textsf{double},~~ ==(\texttt{double},== 0), ~~(\textsf{char},~~ ==(\texttt{char},== 8) \} , ```

with extent 16. Let ~~<span class="sans-serif">B~~ ==`B== = (2, 1, ~~3)</span>, <span class="sans-serif">D~~ ==3)`, `D== = (0, 16, ~~26)</span>,~~ ==26)`,== and ~~<span class="sans-serif">T~~ ==`T== = (MPI_FLOAT, type1, ~~MPI_CHAR)</span>.~~ ==MPI_CHAR)`.== Then a call to [[versions/v31/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] returns a datatype with type map, ``` math \{ ~~(\textsf{float},~~ ==(\texttt{float},== 0), ~~(\textsf{float},~~ ==(\texttt{float},== 4), ~~(\textsf{double},~~ ==(\texttt{double},== 16), ~~(\textsf{char},~~ ==(\texttt{char},== 24), ~~(\textsf{char},~~ ==(\texttt{char},== 26), ~~(\textsf{char},~~ ==(\texttt{char},== 27), ~~(\textsf{char},~~ ==(\texttt{char},== 28) \} . ```

with extent $`ex_i`$. Let `B` be the `array_of_blocklength` argument and `D` be the `array_of_displacements` argument. Let ~~<span class="sans-serif">c</span>~~ ==`c`== be the ~~<span class="sans-serif">count</span>~~ ==`count`== argument. Then the newly created datatype has a type map with ~~$`\sum_{i=0}^{\textsf{c}-1}\texttt{B[i]}~~ ==$`\sum_{i=0}^{\texttt{c}-1}\texttt{B[i]}== \cdot n_i`$ entries: ``` math \{ (type_0^0 , disp_0^0 +\texttt{D[0]}) , ... , (type_{n_0}^0 , disp_{n_0}^0 + \texttt{D[0]} ) , ... , ```

~~(code block removed)~~
``` math
(type_0^{\textsf{c}-1} , disp_0^{\textsf{c}-1} +\texttt{D[c-1]}) , ... ,
(type_{{n_{\textsf{c}-1}}-1}^{\textsf{c}-1} ,
disp_{{n_{\textsf{c}-1}}-1}^{\textsf{c}-1} + \texttt{D[c-1]} ) ,
... ,
```

~~(code block removed)~~
``` math
(type_0^{\textsf{c}-1} , disp_0^{\textsf{c}-1} +
\texttt{D[c-1]} + (\texttt{B[c-1]}-1) \cdot ex_{\textsf{c}-1} ) ,
... ,
```

~~(code block removed)~~
``` math
(type_{{n_{\textsf{c}-1}}-1}^{\textsf{c}-1} ,
disp_{{n_{\textsf{c}-1}}-1}^{\textsf{c}-1} + \texttt{D[c-1]} +
(\texttt{B[c-1]-1)} \cdot ex_{\textsf{c}-1} )
\} .
```

~~A call to~~

~~[[versions/v31/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] is equivalent to a call to~~

~~[[versions/v31/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , where each entry of `T` is equal to `oldtype`.~~

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

==A call to [[versions/v31/API/MPI_TYPE_CREATE_HINDEXED|MPI_TYPE_CREATE_HINDEXED]] is equivalent to a call to [[versions/v31/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] , where each entry of `T` is equal to `oldtype`.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

That is, two copies of `MPI_FLOAT` starting at 0, followed by one copy of `type1` starting at 16, followed by three copies of `MPI_CHAR`, starting at 26. ~~(We~~ ==In this example, we== assume that a float occupies four ~~bytes.)~~ ==bytes.==

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Struct]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Struct]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Struct]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Struct]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Struct]]

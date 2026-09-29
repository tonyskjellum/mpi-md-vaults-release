---
title: "Lower-Bound and Upper-Bound Markers"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Lower-Bound and Upper-Bound Markers

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Lower-Bound and Upper-Bound Markers|MPI-2.1]], [[versions/v22/sections/datatypes#Lower-Bound and Upper-Bound Markers|MPI-2.2]], [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|MPI-3.0]], [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|MPI-3.1]], [[versions/v40/sections/datatypes#Lower-Bound and Upper-Bound Markers|MPI-4.0]], [[versions/v41/sections/datatypes#Lower-Bound and Upper-Bound Markers|MPI-4.1]], [[versions/v50/sections/datatypes#Lower-Bound and Upper-Bound Markers|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

Let <span class="sans-serif">D = (-3, 0, 6)</span>; <span class="sans-serif">T = (MPI_LB, MPI_INT, MPI_UB)</span>, and <span class="sans-serif">B = (1, 1, 1)</span>. Then a call to [[versions/v22/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] creates a new datatype that has an extent of 9 (from -3 to 5, 5 included), and contains an integer at displacement 0. This is the datatype defined by the sequence ~~{(lb,~~ ==<span class="roman">{</span>(lb,== -3), (int, 0), (ub, ~~6)}~~ ==6)<span class="roman">}</span>== . If this type is replicated twice by a call to [[versions/v22/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] then the newly created type can be described by the sequence ~~{(lb,~~ ==<span class="roman">{</span>(lb,== -3), (int, 0), (int,9), (ub, ~~15)}~~ ==15)<span class="roman">}</span>== . (An entry of type <span class="sans-serif">ub</span> can be deleted if there is another entry of type <span class="sans-serif">ub</span> with a higher displacement; an entry of type <span class="sans-serif">lb</span> can be deleted if there is another entry of type <span class="sans-serif">lb</span> with a lower displacement.)

If $`type_i`$ requires alignment to a byte address that is a multiple of $`k_i`$, then $`\epsilon`$ is the least ~~nonnegative~~ ==non-negative== increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_i k_i`$.

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~It is often convenient to define explicitly the lower bound and upper bound of a type map, and override the definition given on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] . This allows one to define a datatype that has “holes” at its beginning or its end, or a datatype with entries that extend above the upper bound or below the lower bound. Examples of such usage are provided in Section [[versions/v30/sections/datatypes#Examples|Examples]] .~~

~~Also, the user may want to overide the alignment rules that are used to compute upper bounds and extents. E.g., a C compiler may allow the user to overide default alignment rules for some of the structures within a program. The user has to specify explicitly the bounds of the datatypes that match these structures.~~

~~To achieve this, we add two additional “pseudo-datatypes,” `MPI_LB` and `MPI_UB`, that can be used, respectively, to mark the lower bound or the upper bound of a datatype. These pseudo-datatypes occupy no space ($`extent(\texttt{MPI_LB}) = extent(\texttt{MPI_UB}) =0`$). They do not affect the size or count of a datatype, and do not affect the~~

~~content of a message created with this datatype. However, they do affect the definition of the extent of a datatype and, therefore, affect the outcome of a replication of this datatype by a datatype constructor.~~

~~ Let <span class="sans-serif">D = (-3, 0, 6)</span>; <span class="sans-serif">T = (MPI_LB, MPI_INT, MPI_UB)</span>, and <span class="sans-serif">B = (1, 1, 1)</span>. Then a call to [[versions/v22/API/MPI_TYPE_STRUCT|MPI_TYPE_STRUCT]] creates a new datatype that has an extent of 9 (from -3 to 5, 5 included), and contains an integer at displacement 0. This is the datatype defined by the sequence <span class="roman">{</span>(lb, -3), (int, 0), (ub, 6)<span class="roman">}</span> . If this type is replicated twice by a call to [[versions/v30/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] then the newly created type can be described by the sequence <span class="roman">{</span>(lb, -3), (int, 0), (int,9), (ub, 15)<span class="roman">}</span> . (An entry of type <span class="sans-serif">ub</span> can be deleted if there is another entry of type <span class="sans-serif">ub</span> with a higher displacement; an entry of type <span class="sans-serif">lb</span> can be deleted if there is another entry of type <span class="sans-serif">lb</span> with a lower displacement.)~~

==It is often convenient to define explicitly the lower bound and upper bound of a type map, and override the definition given on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] . This allows one to define a datatype that has “holes” at its beginning or its end, or a datatype with entries that extend above the upper bound or below the lower bound. Examples of such usage are provided in Section [[versions/v30/sections/datatypes#Examples|Examples]] . Also, the user may want to overide the alignment rules that are used to compute upper bounds and extents. E.g., a C compiler may allow the user to overide default alignment rules for some of the structures within a program. The user has to specify explicitly the bounds of the datatypes that match these structures.==

==To achieve this, we add two additional conceptual datatypes, <span class="sans-serif">lb_marker</span> and <span class="sans-serif">ub_marker</span>, that represent the lower bound and upper bound of a datatype. These conceptual datatypes occupy no space ($`extent(\textsf{lb_marker}) = extent(\textsf{ub_marker}) =0`$) . They do not affect the size or count of a datatype, and do not affect the content of a message created with this datatype. However, they do affect the definition of the extent of a datatype and, therefore, affect the outcome of a replication of this datatype by a datatype constructor.==

== A call to [[versions/v30/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] creates a new datatype that has an extent of 9 (from -3 to 5, 5 included), and contains an integer at displacement 0. This is the datatype defined by the typemap <span class="roman">{</span>(lb_marker, -3), (int, 0), (ub_marker, 6)<span class="roman">}</span> . If this type is replicated twice by a call to [[versions/v30/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] then the newly created type can be described by the typemap <span class="roman">{</span>(lb_marker, -3), (int, 0), (int,9), (ub_marker, 15)<span class="roman">}</span> . (An entry of type <span class="sans-serif">ub_marker</span> can be deleted if there is another entry of type <span class="sans-serif">ub_marker</span> with a higher displacement; an entry of type <span class="sans-serif">lb_marker</span> can be deleted if there is another entry of type <span class="sans-serif">lb_marker</span> with a lower displacement.)==

~~then the **lower bound** of $`Typemap`$ is defined to be ``` math lb(Typemap) = \left\{ \begin{array}{ll} \min_j disp_j & if no entry has basic type \textsf{lb} \\ \min_j \{ disp_j  such that type_j = \textsf{lb} \} & otherwise \end{array} \right. ```~~

==then the **lower bound** of $`Typemap`$ is defined to be==

==(code block added)==
``` math
lb(Typemap) = \left\{ \begin{array}{ll}
\min_j disp_j & 1.5in{ if no entry has type \textsf{lb_marker}} \\
\min_j \{ disp_j  such that type_j = \textsf{lb_marker} \} & otherwise
\end{array}
\right.
```

~~(code block removed)~~
``` math
ub(Typemap) = \left\{ \begin{array}{ll}
\max_j disp_j + sizeof(type_j) + \epsilon & if no entry has basic type
\textsf{ub}
\ \max_j \{ disp_j  such that type_j = \textsf{ub} \} & otherwise
\end{array}
\right.
```

==(code block added)==
``` math
ub(Typemap) = \left\{ \begin{array}{ll}
\max_j(disp_j + sizeof(type_j)) + \epsilon & 1.4in{ if no entry has type
\textsf{ub_marker}}
\ \max_j \{ disp_j  such that type_j = \textsf{ub_marker} \} & otherwise
\end{array}
\right.
```

==In Fortran, it is implementation dependent whether the MPI implementation computes the alignments $`k_i`$ according to the alignments used by the compiler in common blocks, `SEQUENCE` derived types, `BIND(C)` derived types, or derived types that are neither `SEQUENCE` nor `BIND(C)`.==

==> [!tip] Rationale==

==> Before Fortran 2003, [[versions/v30/API/MPI_TYPE_CREATE_STRUCT|MPI_TYPE_CREATE_STRUCT]] could be applied to Fortran common blocks and `SEQUENCE` derived types. With Fortran 2003, this list was extended by `BIND(C)` derived types and MPI implementors have implemented the alignments $`k_i`$ differently, i.e., some based on the alignments used in `SEQUENCE` derived types, and others according to `BIND(C)` derived types.==

==> [!warning] Advice to implementors==

==> In Fortran, it is generally recommended to use `BIND(C)` derived types instead of common blocks or `SEQUENCE` derived types. Therefore it is recommended to calculate the alignments $`k_i`$ based on `BIND(C)` derived types.==

==> [!note] Advice to users==

==> Structures combining different basic datatypes should be defined so that there will be no gaps based on alignment rules. If such a datatype is used to create an array of structures, users should also avoid an alignment-gap at the end of the structure. In MPI communication, the content of such gaps would not be communicated into the receiver’s buffer. For example, such an alignment-gap may occur between an odd number of `float`s or `REAL`s before a `double` or `DOUBLE PRECISION` data. Such gaps may be added explicitly to both the structure and the MPI derived datatype handle because the communication of a contiguous derived datatype may be significantly faster than the communication of one that is non-contiguous because of such alignment-gaps. > > Example: Instead of > >       TYPE, BIND(C) :: my_data >         REAL, DIMENSION(3) :: x >         ! there may be a gap of the size of one REAL >         ! if the alignment of a DOUBLE PRECISION is  >         ! two times the size of a REAL >         DOUBLE PRECISION :: p >       END TYPE > > one should define > >       TYPE, BIND(C) :: my_data >         REAL, DIMENSION(3) :: x >         REAL :: gap1 >         DOUBLE PRECISION :: p >       END TYPE > > and also include `gap1` in the matching MPI derived datatype. It is required that all processes in a communication add the same gaps, i.e., defined with the same basic datatype. Both the original and the modified structures are portable, but may have different performance implications for the communication and memory accesses during computation on systems with different alignment values. > > In principle, a compiler may define an additional alignment rule for structures, e.g., to use at least 4 or 8 byte alignment, although the content may have a $`max_i k_i`$ alignment less than this structure alignment. To maintain portability, users should always resize structure derived datatype handles if used in an array of structures, see the Example in Section [[versions/v30/sections/binding#Fortran Derived Types|Fortran Derived Types]] on page [[versions/v30/sections/binding#Fortran Derived Types|Fortran Derived Types]] .==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

To achieve this, we add two additional conceptual datatypes, ~~<span class="sans-serif">lb_marker</span>~~ ==**lb_marker**== and ~~<span class="sans-serif">ub_marker</span>,~~ ==**ub_marker**,== that represent the lower bound and upper bound of a datatype. These conceptual datatypes occupy no space ~~($`extent(\textsf{lb_marker})~~ ==($`extent(\texttt{lb_marker})== = ~~extent(\textsf{ub_marker})~~ ==extent(\texttt{ub_marker})== =0`$) . They do not affect the size or count of a datatype, and do not affect the content of a message created with this datatype. However, they do affect the definition of the extent of a datatype and, therefore, affect the outcome of a replication of this datatype by a datatype constructor.

A call to [[versions/v31/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] creates a new datatype that has an extent of 9 (from -3 to 5, 5 included), and contains an integer at displacement 0. This is the datatype defined by the typemap ~~<span class="roman">{</span>(lb_marker,~~ =={(`lb_marker`,== -3), (int, 0), ~~(ub_marker, 6)<span class="roman">}</span> .~~ ==(`ub_marker`, 6)}.== If this type is replicated twice by a call to [[versions/v31/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] then the newly created type can be described by the typemap ~~<span class="roman">{</span>(lb_marker,~~ =={(`lb_marker`,== -3), (int, 0), (int,9), ~~(ub_marker, 15)<span class="roman">}</span> .~~ ==(`ub_marker`, 15)}.== (An entry of type ~~<span class="sans-serif">ub_marker</span>~~ ==`ub_marker`== can be deleted if there is another entry of type ~~<span class="sans-serif">ub_marker</span>~~ ==`ub_marker`== with a higher displacement; an entry of type ~~<span class="sans-serif">lb_marker</span>~~ ==`lb_marker`== can be deleted if there is another entry of type ~~<span class="sans-serif">lb_marker</span>~~ ==`lb_marker`== with a lower displacement.)

~~then the **lower bound** of $`Typemap`$ is defined to be~~

~~(code block removed)~~
``` math
lb(Typemap) = \left\{ \begin{array}{ll}
\min_j disp_j & 1.5in{ if no entry has type \textsf{lb_marker}} \\
\min_j \{ disp_j  such that type_j = \textsf{lb_marker} \} & otherwise
\end{array}
\right.
```

~~Similarly, the **upper bound** of $`Typemap`$ is defined to be~~

~~(code block removed)~~
``` math
ub(Typemap) = \left\{ \begin{array}{ll}
\max_j(disp_j + sizeof(type_j)) + \epsilon & 1.4in{ if no entry has type
\textsf{ub_marker}}
\ \max_j \{ disp_j  such that type_j = \textsf{ub_marker} \} & otherwise
\end{array}
\right.
```

==then the **lower bound** of $`Typemap`$ is defined to be ``` math lb(Typemap) = \left\{ \begin{array}{ll} \min_j disp_j & 1.5in{ if no entry has type  \texttt{lb_marker}} \\ \min_j \{ disp_j  such that type_j = \texttt{lb_marker} \} & otherwise \end{array} \right. ```==

==Similarly, the **upper bound** of $`Typemap`$ is defined to be ``` math ub(Typemap) = \left\{ \begin{array}{ll} \max_j(disp_j + sizeof(type_j)) + \epsilon & 1.4in{ if no entry has type \texttt{ub_marker}} \ \max_j \{ disp_j  such that type_j = \texttt{ub_marker} \} & otherwise \end{array} \right. ```==

~~If $`type_i`$ requires alignment to a byte address that is a multiple of $`k_i`$, then $`\epsilon`$ is the least non-negative increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_i k_i`$.~~

~~In Fortran, it is implementation dependent whether the MPI implementation computes the alignments $`k_i`$ according to the alignments used by the compiler in common blocks, `SEQUENCE` derived types, `BIND(C)` derived types, or derived types that are neither `SEQUENCE` nor `BIND(C)`.~~

==If $`type_i`$ requires alignment to a byte address that is a multiple of $`k_i`$, then $`\epsilon`$ is the least non-negative increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_i k_i`$. In Fortran, it is implementation dependent whether the MPI implementation computes the alignments $`k_i`$ according to the alignments used by the compiler in common blocks, `SEQUENCE` derived types, `BIND(C)` derived types, or derived types that are neither `SEQUENCE` nor `BIND(C)`.==

> Structures combining different basic datatypes should be defined so that there will be no gaps based on alignment rules. If such a datatype is used to create an array of structures, users should also avoid an alignment-gap at the end of the structure. In MPI communication, the content of such gaps would not be communicated into the receiver’s buffer. For example, such an alignment-gap may occur between an odd number of `float`s or `REAL`s before a `double` or `DOUBLE PRECISION` data. Such gaps may be added explicitly to both the structure and the MPI derived datatype handle because the communication of a contiguous derived datatype may be significantly faster than the communication of one that is non-contiguous because of such alignment-gaps. > > Example: Instead of > > TYPE, BIND(C) :: my_data > REAL, DIMENSION(3) :: x > ! there may be a gap of the size of one REAL > ! if the alignment of a DOUBLE PRECISION is > ! two times the size of a REAL > DOUBLE PRECISION :: p > END TYPE > > one should define > > TYPE, BIND(C) :: my_data > REAL, DIMENSION(3) :: x > REAL :: gap1 > DOUBLE PRECISION :: p > END TYPE > > and also include `gap1` in the matching MPI derived datatype. It is required that all processes in a communication add the same gaps, i.e., defined with the same basic datatype. Both the original and the modified structures are portable, but may have different performance implications for the communication and memory accesses during computation on systems with different alignment values. > > In principle, a compiler may define an additional alignment rule for structures, e.g., to use at least 4 or 8 byte alignment, although the content may have a $`max_i k_i`$ alignment less than this structure alignment. To maintain portability, users should always resize structure derived datatype handles if used in an array of structures, see the Example in ~~Section [[versions/v31/sections/binding#Fortran Derived Types|Fortran Derived Types]] on page~~ [[versions/v31/sections/binding#Fortran Derived Types|Fortran Derived Types]] .

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

> Structures combining different basic datatypes should be defined so that there will be no gaps based on alignment rules. If such a datatype is used to create an array of structures, users should also avoid an alignment-gap at the end of the structure. In MPI communication, the content of such gaps would not be communicated into the receiver’s buffer. For example, such an alignment-gap may occur between an odd number of `float`s or `REAL`s before a `double` or `DOUBLE PRECISION` data. Such gaps may be added explicitly to both the structure and the MPI derived datatype handle because the communication of a contiguous derived datatype may be significantly faster than the communication of one that is ~~non-contiguous~~ ==noncontiguous== because of such alignment-gaps. > > ~~Example: Instead~~ ==As an example, instead== of > > TYPE, BIND(C) :: my_data > REAL, DIMENSION(3) :: x > ! there may be a gap of the size of one REAL > ! if the alignment of a DOUBLE PRECISION is > ! two times the size of a REAL > DOUBLE PRECISION :: p > END TYPE > > one should define > > TYPE, BIND(C) :: my_data > REAL, DIMENSION(3) :: x > REAL :: gap1 > DOUBLE PRECISION :: p > END TYPE > > and also include `gap1` in the matching MPI derived datatype. It is required that all processes in a communication add the same gaps, i.e., defined with the same basic datatype. Both the original and the modified structures are portable, but may have different performance implications for the communication and memory accesses during computation on systems with different alignment values. > > In principle, a compiler may define an additional alignment rule for structures, e.g., to use at least 4 or 8 byte alignment, although the content may have a $`max_i k_i`$ alignment less than this structure alignment. To maintain portability, users should always resize structure derived datatype handles if used in an array of structures, see the Example in [[versions/v40/sections/binding#Fortran Derived Types|Fortran Derived Types]] .

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

then the **lower bound** of $`Typemap`$ is defined to be ``` math lb(Typemap) = \left\{ \begin{array}{ll} \min_j disp_j & 1.5in{ if no entry has type \texttt{lb_marker}} \\ \min_j \{ disp_j such that type_j = \texttt{lb_marker} \} & otherwise \end{array} \right. ```

Similarly, the **upper bound** of $`Typemap`$ is defined to be ``` math ub(Typemap) = \left\{ \begin{array}{ll} \max_j(disp_j + ~~sizeof(type_j))~~ ==\texttt{sizeof}(type_j))== + \epsilon & 1.4in{ if no entry has type \texttt{ub_marker}} \ \max_j \{ disp_j such that type_j = \texttt{ub_marker} \} & otherwise \end{array} \right. ```

If $`type_i`$ requires alignment to a byte address that is a multiple of $`k_i`$, then $`\epsilon`$ is the least ~~non-negative~~ ==nonnegative== increment needed to round $`extent(Typemap)`$ to the next multiple of $`\max_i k_i`$. In Fortran, it is implementation dependent whether the MPI implementation computes the alignments $`k_i`$ according to the alignments used by the compiler in common blocks, `SEQUENCE` derived types, `BIND(C)` derived types, or derived types that are neither `SEQUENCE` nor `BIND(C)`.

> Structures combining different basic datatypes should be defined so that there will be no gaps based on alignment rules. If such a datatype is used to create an array of structures, users should also avoid an alignment-gap at the end of the structure. In MPI communication, the content of such gaps would not be communicated into the receiver’s buffer. For example, such an alignment-gap may occur between an odd number of `float`s or `REAL`s before a `double` or `DOUBLE PRECISION` data. Such gaps may be added explicitly to both the structure and the MPI derived datatype handle because the communication of a contiguous derived datatype may be significantly faster than the communication of one that is noncontiguous because of such alignment-gaps. > > As an example, instead of > > ==``` [MPI08]Fortran >== TYPE, BIND(C) :: my_data > REAL, DIMENSION(3) :: x > ! there may be a gap of the size of one REAL > ! if the alignment of a DOUBLE PRECISION is > ! two times the size of a REAL > DOUBLE PRECISION :: p > END TYPE > ==``` >== > one should define > ==> ``` [MPI08]Fortran== > TYPE, BIND(C) :: my_data > REAL, DIMENSION(3) :: x > REAL :: gap1 > DOUBLE PRECISION :: p > END TYPE ==> ```== > > and also include `gap1` in the matching MPI derived datatype. It is required that all processes in a communication add the same gaps, i.e., defined with the same basic datatype. Both the original and the modified structures are portable, but may have different performance implications for the communication and memory accesses during computation on systems with different alignment values. > > In principle, a compiler may define an additional alignment rule for structures, e.g., to use at least 4 or 8 byte alignment, although the content may have a $`max_i k_i`$ alignment less than this structure alignment. To maintain portability, users should always resize structure derived datatype handles if used in an array of structures, see the Example in [[versions/v41/sections/binding#Fortran Derived Types|Fortran Derived Types]] .

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

It is often convenient to define explicitly the lower bound and upper bound of a type map, and override the definition given on page ~~[[versions/v50/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]]~~ ==[[eq-pt2pt-extent]]== . This allows one to define a datatype that has “holes” at its beginning or its end, or a datatype with entries that extend above the upper bound or below the lower bound. Examples of such usage are provided in Section [[versions/v50/sections/datatypes#Examples|Examples]] . Also, the user may want to ~~overide~~ ==override== the alignment rules that are used to compute upper bounds and extents. E.g., a C compiler may allow the user to ~~overide~~ ==override== default alignment rules for some of the structures within a program. The user has to specify explicitly the bounds of the datatypes that match these structures.

To achieve this, we add two additional conceptual datatypes, **lb_marker** and **ub_marker**, that represent the lower bound and upper bound of a datatype. These conceptual datatypes occupy no space ($`extent(\texttt{lb_marker}) = extent(\texttt{ub_marker}) ~~=0`$) .~~ ===0`$).== They do not affect the size or count of a datatype, and do not affect the content of a message created with this datatype. However, they do affect the definition of the extent of a datatype and, therefore, affect the outcome of a replication of this datatype by a datatype constructor.

A call to [[versions/v50/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] ==`(MPI_INT, -3, 9, type1)`== creates a new datatype that has an extent of 9 (from -3 to 5, 5 included), and contains an integer at displacement 0. This is the datatype defined by the typemap {(`lb_marker`, -3), (int, 0), (`ub_marker`, 6)}. If this type is replicated twice by a call to [[versions/v50/API/MPI_TYPE_CONTIGUOUS|MPI_TYPE_CONTIGUOUS]] ==`(2, type1, type2)`== then the newly created type can be described by the typemap {(`lb_marker`, -3), (int, 0), (int,9), (`ub_marker`, 15)}. (An entry of type `ub_marker` can be deleted if there is another entry of type `ub_marker` with a higher displacement; an entry of type `lb_marker` can be deleted if there is another entry of type `lb_marker` with a lower displacement.)

~~Then ``` math extent(Typemap) = ub(Typemap) - lb(Typemap) ```~~

==Then==

==(code block added)==
``` math
extent(Typemap) = ub(Typemap) - lb(Typemap)
```

> Structures combining different basic datatypes should be defined so that there will be no gaps based on alignment rules. If such a datatype is used to create an array of structures, users should also avoid an alignment-gap at the end of the structure. In MPI communication, the content of such gaps would not be communicated into the receiver’s buffer. For example, such an alignment-gap may occur between an odd number of `float`s or `REAL`s before a `double` or `DOUBLE PRECISION` data. Such gaps may be added explicitly to both the structure and the MPI derived datatype handle because the communication of a contiguous derived datatype may be significantly faster than the communication of one that is noncontiguous because of such alignment-gaps. > > As an example, instead of > > ``` [MPI08]Fortran > TYPE, BIND(C) :: my_data > REAL, DIMENSION(3) :: x > ! there may be a gap of the size of one REAL > ! if the alignment of a DOUBLE PRECISION is > ! two times the size of a REAL > DOUBLE PRECISION :: p > END TYPE > ``` > > one should define > > ``` [MPI08]Fortran > TYPE, BIND(C) :: my_data > REAL, DIMENSION(3) :: x > REAL :: gap1 > DOUBLE PRECISION :: p > END TYPE > ``` > > and also include `gap1` in the matching MPI derived datatype. It is required that all processes in a communication add the same gaps, i.e., defined with the same basic datatype. Both the original and the modified structures are portable, but may have different performance implications for the communication and memory accesses during computation on systems with different alignment values. > > In principle, a compiler may define an additional alignment rule for structures, e.g., to use at least 4 or 8 byte alignment, although the content may have a ~~$`max_i~~ ==$`\max_i== k_i`$ alignment less than this structure alignment. To maintain portability, users should always resize structure derived datatype handles if used in an array of structures, see the Example in [[versions/v50/sections/binding#Fortran Derived Types|Fortran Derived Types]] .

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Lower-Bound and Upper-Bound Markers]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Lower-Bound and Upper-Bound Markers]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Lower-Bound and Upper-Bound Markers]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Lower-Bound and Upper-Bound Markers]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Lower-Bound and Upper-Bound Markers]]

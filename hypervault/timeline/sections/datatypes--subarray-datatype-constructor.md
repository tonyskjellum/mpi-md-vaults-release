---
title: "Subarray Datatype Constructor"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Subarray Datatype Constructor

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Subarray Datatype Constructor|MPI-2.1]], [[versions/v22/sections/datatypes#Subarray Datatype Constructor|MPI-2.2]], [[versions/v30/sections/datatypes#Subarray Datatype Constructor|MPI-3.0]], [[versions/v31/sections/datatypes#Subarray Datatype Constructor|MPI-3.1]], [[versions/v40/sections/datatypes#Subarray Datatype Constructor|MPI-4.0]], [[versions/v41/sections/datatypes#Subarray Datatype Constructor|MPI-4.1]], [[versions/v50/sections/datatypes#Subarray Datatype Constructor|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

~~MPI_ORDER_C~~ ==`MPI_ORDER_C`== The ordering used by C arrays, (i.e., row-major order)

~~MPI_ORDER_FORTRAN~~ ==`MPI_ORDER_FORTRAN`== The ordering used by Fortran arrays, (i.e., column-major order)

~~where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. Then we define the Subarray() function recursively using the following three equations. Equation [[eq-subarray-base]] defines the base step. Equation [[eq-subarray-fortran]] defines the recursion step when `order` = MPI_ORDER_FORTRAN, and Equation [[eq-subarray-c]] defines the recursion step when `order` = MPI_ORDER_C.~~

~~(code block removed)~~
``` math
\begin{eqnarray}
Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
  \\
& & \quad \{(type_0,disp_0),(type_1,disp_1),...,(type_{n-1},disp_{n-1})\})  \\
& = & \{(MPI_LB,0),  \\
& & (type_0,disp_0+start_0 \times ex),...,(type_{n-1},
        disp_{n-1} + start_0 \times ex),  \\
& & (type_0,disp_0+(start_0 + 1)\times ex),...,(type_{n-1},
\\
& & \hspace{.5in}disp_{n-1} + (start_0+1) \times ex), ...  \\
& & (type_0,disp_0+(start_0 + subsize_0 - 1)\times ex),...,
 \\
& & \hspace{.5in}(type_{n-1},disp_{n-1} + (start_0+subsize_0 - 1) \times ex),
 \\
& & (MPI_UB, size_0 \times ex) \}  \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},         \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad \{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
 \\
& = & Subarray(ndims-1,\{size_1, size_2,...,size_{ndims-1}\},
 \\
& &\quad\{subsize_1, subsize_2,...,subsize_{ndims-1}\}, \\
& &\quad\{start_1, start_2,...,start_{ndims-1}\},  \\
& & \hspace{.5in}Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
        \texttt{oldtype})) \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},           \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad\{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
  \\
& = & Subarray(ndims-1,\{size_0, size_1,...,size_{ndims-2}\},
 \\
& &\quad\{subsize_0, subsize_1,...,subsize_{ndims-2}\},  \\
& &\quad\{start_0, start_1,...,start_{ndims-2}\},  \\
& & \hspace{.5in}Subarray(1,\{size_{ndims-1}\},\{subsize_{ndims-1}\},
        \{start_{ndims-1}\},\texttt{oldtype}))
\end{eqnarray}
```

==where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. Then we define the Subarray() function recursively using the following three equations. Equation [[eq-subarray-base]] defines the base step. Equation [[eq-subarray-fortran]] defines the recursion step when `order` = `MPI_ORDER_FORTRAN`, and Equation [[eq-subarray-c]] defines the recursion step when `order` = `MPI_ORDER_C`.==

==(code block added)==
``` math
\begin{eqnarray}
Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
  \\
& & \quad \{(type_0,disp_0),(type_1,disp_1),...,(type_{n-1},disp_{n-1})\})  \\
& = & \{(\texttt{MPI_LB},0),  \\
& & (type_0,disp_0+start_0 \times ex),...,(type_{n-1},
        disp_{n-1} + start_0 \times ex),  \\
& & (type_0,disp_0+(start_0 + 1)\times ex),...,(type_{n-1},
\\
& & \hspace{.5in}disp_{n-1} + (start_0+1) \times ex), ...  \\
& & (type_0,disp_0+(start_0 + subsize_0 - 1)\times ex),...,
 \\
& & \hspace{.5in}(type_{n-1},disp_{n-1} + (start_0+subsize_0 - 1) \times ex),
 \\
& & (\texttt{MPI_UB}, size_0 \times ex) \}  \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},         \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad \{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
 \\
& = & Subarray(ndims-1,\{size_1, size_2,...,size_{ndims-1}\},
 \\
& &\quad\{subsize_1, subsize_2,...,subsize_{ndims-1}\}, \\
& &\quad\{start_1, start_2,...,start_{ndims-1}\},  \\
& & \hspace{.5in}Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
        \texttt{oldtype})) \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},           \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad\{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
  \\
& = & Subarray(ndims-1,\{size_0, size_1,...,size_{ndims-2}\},
 \\
& &\quad\{subsize_0, subsize_1,...,subsize_{ndims-2}\},  \\
& &\quad\{start_0, start_1,...,start_{ndims-2}\},  \\
& & \hspace{.5in}Subarray(1,\{size_{ndims-1}\},\{subsize_{ndims-1}\},
        \{start_{ndims-1}\},\texttt{oldtype}))
\end{eqnarray}
```

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

~~$`n`$-dimensional~~

~~subarray of an~~

~~$`n`$-dimensional~~

~~array. The subarray may be situated anywhere within the full array, and may be of any nonzero size up to the size of the larger array as long as it is confined within this array.~~

~~This type constructor facilitates creating filetypes to access~~

~~arrays distributed in blocks among processes to a single file that contains the global array,~~

~~see MPI I/O, especially Section [[versions/v30/sections/io#Definitions|Definitions]] on page [[versions/v30/sections/io#Definitions|Definitions]] .~~

==$`n`$-dimensional subarray of an==

==$`n`$-dimensional array. The subarray may be situated anywhere within the full array, and may be of any nonzero size up to the size of the larger array as long as it is confined within this array. This type constructor facilitates creating filetypes to access arrays distributed in blocks among processes to a single file that contains the global array, see MPI I/O, especially Section [[versions/v30/sections/io#Definitions|Definitions]] on page [[versions/v30/sections/io#Definitions|Definitions]] .==

~~$`n`$-dimensional~~

~~array and the requested subarray are specified by `array_of_sizes` and `array_of_subsizes`, respectively. For any dimension~~

~~`i`,~~

~~it is erroneous to specify `array_of_subsizes[i]` $`<`$ 1 or `array_of_subsizes[i]` $`>`$ `array_of_sizes[i]`.~~

~~The `array_of_starts` contains the starting coordinates of each~~

~~dimension of the subarray. Arrays are assumed to be indexed starting from zero.~~

==$`n`$-dimensional array and the requested subarray are specified by `array_of_sizes` and `array_of_subsizes`, respectively. For any dimension==

==`i`, it is erroneous to specify `array_of_subsizes[i]` $`<`$ 1 or `array_of_subsizes[i]` $`>`$ `array_of_sizes[i]`.==

==The `array_of_starts` contains the starting coordinates of each dimension of the subarray. Arrays are assumed to be indexed starting from zero.==

~~The `order` argument specifies the storage order for the subarray as well as the full array.~~

~~It must be set to one of the following:~~

==The `order` argument specifies the storage order for the subarray as well as the full array. It must be set to one of the following:==

~~where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. Then we define the Subarray() function recursively using the following three equations. Equation [[eq-subarray-base]] defines the base step. Equation [[eq-subarray-fortran]] defines the recursion step when `order` = `MPI_ORDER_FORTRAN`, and Equation [[eq-subarray-c]] defines the recursion step when `order` = `MPI_ORDER_C`.~~

~~(code block removed)~~
``` math
\begin{eqnarray}
Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
  \\
& & \quad \{(type_0,disp_0),(type_1,disp_1),...,(type_{n-1},disp_{n-1})\})  \\
& = & \{(\texttt{MPI_LB},0),  \\
& & (type_0,disp_0+start_0 \times ex),...,(type_{n-1},
        disp_{n-1} + start_0 \times ex),  \\
& & (type_0,disp_0+(start_0 + 1)\times ex),...,(type_{n-1},
\\
& & \hspace{.5in}disp_{n-1} + (start_0+1) \times ex), ...  \\
& & (type_0,disp_0+(start_0 + subsize_0 - 1)\times ex),...,
 \\
& & \hspace{.5in}(type_{n-1},disp_{n-1} + (start_0+subsize_0 - 1) \times ex),
 \\
& & (\texttt{MPI_UB}, size_0 \times ex) \}  \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},         \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad \{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
 \\
& = & Subarray(ndims-1,\{size_1, size_2,...,size_{ndims-1}\},
 \\
& &\quad\{subsize_1, subsize_2,...,subsize_{ndims-1}\}, \\
& &\quad\{start_1, start_2,...,start_{ndims-1}\},  \\
& & \hspace{.5in}Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
        \texttt{oldtype})) \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},           \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad\{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
  \\
& = & Subarray(ndims-1,\{size_0, size_1,...,size_{ndims-2}\},
 \\
& &\quad\{subsize_0, subsize_1,...,subsize_{ndims-2}\},  \\
& &\quad\{start_0, start_1,...,start_{ndims-2}\},  \\
& & \hspace{.5in}Subarray(1,\{size_{ndims-1}\},\{subsize_{ndims-1}\},
        \{start_{ndims-1}\},\texttt{oldtype}))
\end{eqnarray}
```

==where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. Then we define the Subarray() function recursively using the following three equations. Equation [[eq-subarray-base]] defines the base step. Equation [[eq-subarray-fortran]] defines the recursion step when `order` = `MPI_ORDER_FORTRAN`, and Equation [[eq-subarray-c]] defines the recursion step when `order` = `MPI_ORDER_C`. These equations use the conceptual datatypes <span class="sans-serif">lb_marker</span> and <span class="sans-serif">ub_marker</span>, see Section [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] for details.==

==(code block added)==
``` math
\begin{eqnarray}
Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
  \\
& & \quad \{(type_0,disp_0),(type_1,disp_1),...,(type_{n-1},disp_{n-1})\})  \\
& = & \{( lb_marker,0),  \\
& & (type_0,disp_0+start_0 \times ex),...,(type_{n-1},
        disp_{n-1} + start_0 \times ex),  \\
& & (type_0,disp_0+(start_0 + 1)\times ex),...,(type_{n-1},
\\
& & \hspace{.5in}disp_{n-1} + (start_0+1) \times ex), ...  \\
& & (type_0,disp_0+(start_0 + subsize_0 - 1)\times ex),...,
 \\
& & \hspace{.5in}(type_{n-1},disp_{n-1} + (start_0+subsize_0 - 1) \times ex),
 \\
& & ( ub_marker, size_0 \times ex) \}  \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},         \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad \{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
 \\
& = & Subarray(ndims-1,\{size_1, size_2,...,size_{ndims-1}\},
 \\
& &\quad\{subsize_1, subsize_2,...,subsize_{ndims-1}\}, \\
& &\quad\{start_1, start_2,...,start_{ndims-1}\},  \\
& & \hspace{.5in}Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
        \texttt{oldtype})) \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},           \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad\{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
  \\
& = & Subarray(ndims-1,\{size_0, size_1,...,size_{ndims-2}\},
 \\
& &\quad\{subsize_0, subsize_1,...,subsize_{ndims-2}\},  \\
& &\quad\{start_0, start_1,...,start_{ndims-2}\},  \\
& & \hspace{.5in}Subarray(1,\{size_{ndims-1}\},\{subsize_{ndims-1}\},
        \{start_{ndims-1}\},\texttt{oldtype}))
\end{eqnarray}
```

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~The subarray type constructor creates an MPI datatype describing an~~

~~$`n`$-dimensional subarray of an~~

~~$`n`$-dimensional array. The subarray may be situated anywhere within the full array, and may be of any nonzero size up to the size of the larger array as long as it is confined within this array. This type constructor facilitates creating filetypes to access arrays distributed in blocks among processes to a single file that contains the global array, see MPI I/O, especially Section [[versions/v31/sections/io#Definitions|Definitions]] on page [[versions/v31/sections/io#Definitions|Definitions]] .~~

==The subarray type constructor creates an MPI datatype describing an $`n`$-dimensional subarray of an $`n`$-dimensional array. The subarray may be situated anywhere within the full array, and may be of any nonzero size up to the size of the larger array as long as it is confined within this array. This type constructor facilitates creating filetypes to access arrays distributed in blocks among processes to a single file that contains the global array, see MPI I/O, especially [[versions/v31/sections/io#Definitions|Definitions]] .==

~~The number of elements of type `oldtype` in each dimension of the~~

~~$`n`$-dimensional array and the requested subarray are specified by `array_of_sizes` and `array_of_subsizes`, respectively. For any dimension~~

~~`i`, it is erroneous to specify `array_of_subsizes[i]` $`<`$ 1 or `array_of_subsizes[i]` $`>`$ `array_of_sizes[i]`.~~

~~The `array_of_starts` contains the starting coordinates of each dimension of the subarray. Arrays are assumed to be indexed starting from zero.~~

~~For any dimension $`i`$, it is erroneous to specify `array_of_starts[i]` $`<`$ 0 or `array_of_starts[i]` $`>`$ (`array_of_sizes[i]` $`-`$ `array_of_subsizes[i]`).~~

==The number of elements of type `oldtype` in each dimension of the $`n`$-dimensional array and the requested subarray are specified by `array_of_sizes` and `array_of_subsizes`, respectively. For any dimension `i`, it is erroneous to specify `array_of_subsizes[i]` $`<`$ 1 or `array_of_subsizes[i]` $`>`$ `array_of_sizes[i]`.==

==The `array_of_starts` contains the starting coordinates of each dimension of the subarray. Arrays are assumed to be indexed starting from zero. For any dimension $`i`$, it is erroneous to specify `array_of_starts[i]` $`<`$ 0 or `array_of_starts[i]` $`>`$ (`array_of_sizes[i]` $`-`$ `array_of_subsizes[i]`).==

~~where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. Then we define the Subarray() function recursively using the following three equations. Equation [[eq-subarray-base]] defines the base step. Equation [[eq-subarray-fortran]] defines the recursion step when `order` = `MPI_ORDER_FORTRAN`, and Equation [[eq-subarray-c]] defines the recursion step when `order` = `MPI_ORDER_C`. These equations use the conceptual datatypes <span class="sans-serif">lb_marker</span> and <span class="sans-serif">ub_marker</span>, see Section [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] for details.~~

~~(code block removed)~~
``` math
\begin{eqnarray}
Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
  \\
& & \quad \{(type_0,disp_0),(type_1,disp_1),...,(type_{n-1},disp_{n-1})\})  \\
& = & \{( lb_marker,0),  \\
& & (type_0,disp_0+start_0 \times ex),...,(type_{n-1},
        disp_{n-1} + start_0 \times ex),  \\
& & (type_0,disp_0+(start_0 + 1)\times ex),...,(type_{n-1},
\\
& & \hspace{.5in}disp_{n-1} + (start_0+1) \times ex), ...  \\
& & (type_0,disp_0+(start_0 + subsize_0 - 1)\times ex),...,
 \\
& & \hspace{.5in}(type_{n-1},disp_{n-1} + (start_0+subsize_0 - 1) \times ex),
 \\
& & ( ub_marker, size_0 \times ex) \}  \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},         \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad \{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
 \\
& = & Subarray(ndims-1,\{size_1, size_2,...,size_{ndims-1}\},
 \\
& &\quad\{subsize_1, subsize_2,...,subsize_{ndims-1}\}, \\
& &\quad\{start_1, start_2,...,start_{ndims-1}\},  \\
& & \hspace{.5in}Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
        \texttt{oldtype})) \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},           \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad\{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
  \\
& = & Subarray(ndims-1,\{size_0, size_1,...,size_{ndims-2}\},
 \\
& &\quad\{subsize_0, subsize_1,...,subsize_{ndims-2}\},  \\
& &\quad\{start_0, start_1,...,start_{ndims-2}\},  \\
& & \hspace{.5in}Subarray(1,\{size_{ndims-1}\},\{subsize_{ndims-1}\},
        \{start_{ndims-1}\},\texttt{oldtype}))
\end{eqnarray}
```

==where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. Then we define the Subarray() function recursively using the following three equations. Equation [[eq-subarray-base]] defines the base step. Equation [[eq-subarray-fortran]] defines the recursion step when `order` = `MPI_ORDER_FORTRAN`, and Equation [[eq-subarray-c]] defines the recursion step when `order` = `MPI_ORDER_C`. These equations use the conceptual datatypes `lb_marker` and `ub_marker`, see [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] for details.==

==(code block added)==
``` math
\begin{eqnarray}
Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
  \\
& & \quad \{(type_0,disp_0),(type_1,disp_1),...,(type_{n-1},disp_{n-1})\})  \\
& = & \{(\texttt{lb_marker},0),  \\
& & (type_0,disp_0+start_0 \times ex),...,(type_{n-1},
        disp_{n-1} + start_0 \times ex),  \\
& & (type_0,disp_0+(start_0 + 1)\times ex),...,(type_{n-1},
\\
& & \hspace{.5in}disp_{n-1} + (start_0+1) \times ex), ...  \\
& & (type_0,disp_0+(start_0 + subsize_0 - 1)\times ex),...,
 \\
& & \hspace{.5in}(type_{n-1},disp_{n-1} + (start_0+subsize_0 - 1) \times ex),
 \\
& & (\texttt{ub_marker}, size_0 \times ex) \}  \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},         \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad \{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
 \\
& = & Subarray(ndims-1,\{size_1, size_2,...,size_{ndims-1}\},
 \\
& &\quad\{subsize_1, subsize_2,...,subsize_{ndims-1}\}, \\
& &\quad\{start_1, start_2,...,start_{ndims-1}\},  \\
& & \hspace{.5in}Subarray(1,\{size_0\},\{subsize_0\},\{start_0\},
        \texttt{oldtype})) \\
& &  \\
Subarray( ndims,
\{size_0, size_1,...,size_{ndims-1}\},           \\
& & \quad\{subsize_0, subsize_1,...,subsize_{ndims-1}\},  \\
& & \quad\{start_0, start_1,...,start_{ndims-1}\},\texttt{oldtype} )
  \\
& = & Subarray(ndims-1,\{size_0, size_1,...,size_{ndims-2}\},
 \\
& &\quad\{subsize_0, subsize_1,...,subsize_{ndims-2}\},  \\
& &\quad\{start_0, start_1,...,start_{ndims-2}\},  \\
& & \hspace{.5in}Subarray(1,\{size_{ndims-1}\},\{subsize_{ndims-1}\},
        \{start_{ndims-1}\},\texttt{oldtype}))
\end{eqnarray}
```

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. Then we define the Subarray() function recursively using the following three equations. Equation [[eq-subarray-base]] defines the base step. Equation [[eq-subarray-fortran]] defines the recursion step when `order` = `MPI_ORDER_FORTRAN`, and Equation [[eq-subarray-c]] defines the recursion step when `order` = `MPI_ORDER_C`. These equations use the conceptual datatypes `lb_marker` and ~~`ub_marker`,~~ ==`ub_marker`;== see [[versions/v40/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] for details.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~`MPI_ORDER_C`~~ The ordering used by C arrays, (i.e., row-major ~~order)~~ ==order).==

~~`MPI_ORDER_FORTRAN`~~ The ordering used by Fortran arrays, (i.e., column-major ~~order)~~ ==order).==

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Subarray Datatype Constructor]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Subarray Datatype Constructor]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Subarray Datatype Constructor]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Subarray Datatype Constructor]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Subarray Datatype Constructor]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Subarray Datatype Constructor]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Subarray Datatype Constructor]]

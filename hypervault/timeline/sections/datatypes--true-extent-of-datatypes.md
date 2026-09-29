---
title: "True Extent of Datatypes"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# True Extent of Datatypes

Chapter **datatypes** · in [[versions/v21/sections/datatypes#True Extent of Datatypes|MPI-2.1]], [[versions/v22/sections/datatypes#True Extent of Datatypes|MPI-2.2]], [[versions/v30/sections/datatypes#True Extent of Datatypes|MPI-3.0]], [[versions/v31/sections/datatypes#True Extent of Datatypes|MPI-3.1]], [[versions/v40/sections/datatypes#True Extent of Datatypes|MPI-4.0]], [[versions/v41/sections/datatypes#True Extent of Datatypes|MPI-4.1]], [[versions/v50/sections/datatypes#True Extent of Datatypes|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

as a spanning tree implemented on top of point-to-point routines. Since the receive buffer is only valid on the root process, one will need to allocate some temporary space for receiving data on intermediate nodes. However, the datatype extent cannot be used as an estimate of the amount of space that needs to be allocated, if the user has modified the extent using the ~~MPI_UB~~ ==`MPI_UB`== and ~~MPI_LB~~ ==`MPI_LB`== values.

`true_lb` returns the offset of the lowest unit of store which is addressed by the datatype, i.e., the lower bound of the corresponding typemap, ignoring ~~MPI_LB~~ ==`MPI_LB`== markers. `true_extent` returns the true size of the datatype, i.e., the extent of the corresponding typemap, ignoring ~~MPI_LB~~ ==`MPI_LB`== and `MPI_UB` markers, and performing no rounding for alignment. If the typemap associated with `datatype` is ``` math Typemap = \{ (type_0, disp_0), ... , (type_{n-1}, disp_{n-1})\} ```

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

~~Suppose we implement gather~~

~~(see also Section [[versions/v30/sections/coll#Gather|Gather]] on page [[versions/v30/sections/coll#Gather|Gather]] )~~

~~as a spanning tree implemented on top of point-to-point routines. Since the receive buffer is only valid on the root process, one will need to allocate some temporary space for receiving data on intermediate nodes. However, the datatype extent cannot be used as an estimate of the amount of space that needs to be allocated, if the user has modified the extent using the `MPI_UB` and `MPI_LB` values.~~

~~A~~

~~function is provided which returns the true extent of the datatype.~~

==Suppose we implement gather (see also Section [[versions/v30/sections/coll#Gather|Gather]] on page [[versions/v30/sections/coll#Gather|Gather]] ) as a spanning tree implemented on top of point-to-point routines. Since the receive buffer is only valid on the root process, one will need to allocate some temporary space for receiving data on intermediate nodes. However, the datatype extent cannot be used as an estimate of the amount of space that needs to be allocated, if the user has modified the extent, for example by using `MPI_TYPE_CREATE_RESIZED`.==

==The functions [[versions/v30/API/MPI_TYPE_GET_TRUE_EXTENT|MPI_TYPE_GET_TRUE_EXTENT]] and [[versions/v30/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI_TYPE_GET_TRUE_EXTENT_X]] are provided which return the true extent of the datatype.==

~~`true_lb` returns the offset of the lowest unit of store which is addressed by the datatype, i.e., the lower bound of the corresponding typemap, ignoring `MPI_LB` markers. `true_extent` returns the true size of the datatype, i.e., the extent of the corresponding typemap, ignoring `MPI_LB` and `MPI_UB` markers, and performing no rounding for alignment. If the typemap associated with `datatype` is ``` math Typemap = \{ (type_0, disp_0), ... , (type_{n-1}, disp_{n-1})\} ```~~

==![[versions/v30/API/MPI_TYPE_GET_TRUE_EXTENT_X]]==

==`true_lb` returns the offset of the lowest unit of store which is addressed by the datatype, i.e., the lower bound of the corresponding typemap, ignoring explicit lower bound markers. `true_extent` returns the true size of the datatype, i.e., the extent of the corresponding typemap, ignoring explicit lower bound and upper bound markers, and performing no rounding for alignment. If the typemap associated with `datatype` is ``` math Typemap = \{ (type_0, disp_0), ... , (type_{n-1}, disp_{n-1})\} ```==

~~(code block removed)~~
``` math
true_lb(Typemap) = min_j  \{ disp_j  :  type_j \ne \textbf{lb, ub} \},
```

~~(code block removed)~~
``` math
true_ub (Typemap) = max_j \{disp_j + sizeof(type_j)  :  type_j \ne
\textbf{lb, ub}\} ,
```

==(code block added)==
``` math
true_lb(Typemap) = min_j  \{ disp_j  :  type_j \ne \textsf{lb_marker, ub_marker} \},
```

==(code block added)==
``` math
true_ub (Typemap) = max_j \{disp_j + sizeof(type_j)  :  type_j \ne
\textsf{lb_marker, ub_marker}\} ,
```

~~Section [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] and Section [[versions/v30/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] on page [[versions/v30/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , which describe~~

~~the function~~

==Section [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] and Section [[versions/v30/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] on page [[versions/v30/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , which describe the function==

==For both functions, if either OUT parameter cannot express the value to be returned (e.g., if the parameter is too small to hold the output value), it is set to `MPI_UNDEFINED`.==

### MPI-3.0 → MPI-3.1  (3 changed paragraphs)

~~Suppose we implement gather (see also Section [[versions/v31/sections/coll#Gather|Gather]] on page [[versions/v31/sections/coll#Gather|Gather]] ) as a spanning tree implemented on top of point-to-point routines. Since the receive buffer is only valid on the root process, one will need to allocate some temporary space for receiving data on intermediate nodes. However, the datatype extent cannot be used as an estimate of the amount of space that needs to be allocated, if the user has modified the extent, for example by using `MPI_TYPE_CREATE_RESIZED`.~~

~~The functions [[versions/v31/API/MPI_TYPE_GET_TRUE_EXTENT|MPI_TYPE_GET_TRUE_EXTENT]] and [[versions/v31/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI_TYPE_GET_TRUE_EXTENT_X]] are provided which return the true extent of the datatype.~~

==Suppose we implement gather (see also [[versions/v31/sections/coll#Gather|Gather]] ) as a spanning tree implemented on top of point-to-point routines. Since the receive buffer is only valid on the root process, one will need to allocate some temporary space for receiving data on intermediate nodes. However, the datatype extent cannot be used as an estimate of the amount of space that needs to be allocated, if the user has modified the extent, for example by using [[versions/v31/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] . The functions [[versions/v31/API/MPI_TYPE_GET_TRUE_EXTENT|MPI_TYPE_GET_TRUE_EXTENT]] and [[versions/v31/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI_TYPE_GET_TRUE_EXTENT_X]] are provided which return the true extent of the datatype.==

~~Then~~

~~(code block removed)~~
``` math
true_lb(Typemap) = min_j  \{ disp_j  :  type_j \ne \textsf{lb_marker, ub_marker} \},
```

~~(code block removed)~~
``` math
true_ub (Typemap) = max_j \{disp_j + sizeof(type_j)  :  type_j \ne
\textsf{lb_marker, ub_marker}\} ,
```

==Then ``` math true_lb(Typemap) = min_j  \{ disp_j  :  type_j \ne \texttt{lb_marker}, \texttt{ub_marker} \}, ```==

==(code block added)==
``` math
true_ub (Typemap) = max_j \{disp_j + sizeof(type_j)  :  type_j \ne
\texttt{lb_marker}, \texttt{ub_marker}\} ,
```

~~(Readers should compare this with the definitions in~~

~~Section [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] and Section [[versions/v31/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] on page [[versions/v31/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , which describe the function~~

~~[[versions/v31/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] .)~~

==(Readers should compare this with the definitions in [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] and [[versions/v31/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , which describe the function [[versions/v31/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] .)==

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

Suppose we implement gather (see also [[versions/v41/sections/coll#Gather|Gather]] ) as a spanning tree implemented on top of point-to-point routines. Since the receive buffer is only valid on the root process, one will need to allocate some temporary space for receiving data on intermediate nodes. However, the datatype extent cannot be used as an estimate of the amount of space that needs to be allocated, if the user has modified the extent, for example by using [[versions/v41/API/MPI_TYPE_CREATE_RESIZED|MPI_TYPE_CREATE_RESIZED]] . The ~~functions~~ ==procedure== [[versions/v41/API/MPI_TYPE_GET_TRUE_EXTENT|MPI_TYPE_GET_TRUE_EXTENT]] ~~and [[versions/v41/API/MPI_TYPE_GET_TRUE_EXTENT_X|MPI_TYPE_GET_TRUE_EXTENT_X]] are provided which return~~ ==returns== the true extent of the datatype.

~~![[versions/v41/API/MPI_TYPE_GET_TRUE_EXTENT_X]]~~

~~`true_lb` returns the offset of the lowest unit of store which is addressed by the datatype, i.e., the lower bound of the corresponding typemap, ignoring explicit lower bound markers. `true_extent` returns the true size of the datatype, i.e., the extent of the corresponding typemap, ignoring explicit lower bound and upper bound markers, and performing no rounding for alignment. If the typemap associated with `datatype` is ``` math Typemap = \{ (type_0, disp_0), ... , (type_{n-1}, disp_{n-1})\} ```~~

==`true_lb` returns the offset of the lowest unit of storage that is addressed by the datatype, i.e., the lower bound of the corresponding typemap, ignoring explicit lower bound markers. `true_extent` returns the true size of the datatype, i.e., the extent of the corresponding typemap, ignoring explicit lower bound and upper bound markers, and performing no rounding for alignment. If the typemap associated with `datatype` is ``` math Typemap = \{ (type_0, disp_0), ... , (type_{n-1}, disp_{n-1})\} ```==

~~(code block removed)~~
``` math
true_ub (Typemap) = max_j \{disp_j + sizeof(type_j)  :  type_j \ne
\texttt{lb_marker}, \texttt{ub_marker}\} ,
```

~~and ``` math true_extent (Typemap) = true_ub(Typemap) - true_lb(typemap). ```~~

~~(Readers should compare this with the definitions in [[versions/v41/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] and [[versions/v41/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , which describe the function [[versions/v41/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] .)~~

==(code block added)==
``` math
true_ub (Typemap) = max_j \{disp_j + \texttt{sizeof}(type_j)  :  type_j \ne
\texttt{lb_marker}, \texttt{ub_marker}\} ,
```

==and ``` math true_extent (Typemap) = true_ub(Typemap) - true_lb(Typemap). ```==

==(Readers should compare this with the definitions in [[versions/v41/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] and [[versions/v41/sections/datatypes#Extent and Bounds of Datatypes|Extent and Bounds of Datatypes]] , which describe the procedure [[versions/v41/API/MPI_TYPE_GET_EXTENT|MPI_TYPE_GET_EXTENT]] .)==

~~For both functions, if~~ ==If== either OUT parameter cannot express the value to be returned (e.g., if the parameter is too small to hold the output value), it is set to `MPI_UNDEFINED`.

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

~~Then ``` math true_lb(Typemap) = min_j  \{ disp_j  :  type_j \ne \texttt{lb_marker}, \texttt{ub_marker} \}, ```~~

~~(code block removed)~~
``` math
true_ub (Typemap) = max_j \{disp_j + \texttt{sizeof}(type_j)  :  type_j \ne
\texttt{lb_marker}, \texttt{ub_marker}\} ,
```

==Then ``` math true_lb(Typemap) = \min_j  \{ disp_j  :  type_j \ne \texttt{lb_marker}, \texttt{ub_marker} \}, ```==

==(code block added)==
``` math
true_ub (Typemap) = \max_j \{disp_j + \texttt{sizeof}(type_j)  :  type_j \ne
\texttt{lb_marker}, \texttt{ub_marker}\} ,
```

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#True Extent of Datatypes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#True Extent of Datatypes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#True Extent of Datatypes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#True Extent of Datatypes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#True Extent of Datatypes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#True Extent of Datatypes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#True Extent of Datatypes]]

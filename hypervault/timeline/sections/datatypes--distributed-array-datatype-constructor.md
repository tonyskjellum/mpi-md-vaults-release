---
title: "Distributed Array Datatype Constructor"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/datatypes]
---

# Distributed Array Datatype Constructor

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Distributed Array Datatype Constructor|MPI-2.1]], [[versions/v22/sections/datatypes#Distributed Array Datatype Constructor|MPI-2.2]], [[versions/v30/sections/datatypes#Distributed Array Datatype Constructor|MPI-3.0]], [[versions/v31/sections/datatypes#Distributed Array Datatype Constructor|MPI-3.1]], [[versions/v40/sections/datatypes#Distributed Array Datatype Constructor|MPI-4.0]], [[versions/v41/sections/datatypes#Distributed Array Datatype Constructor|MPI-4.1]], [[versions/v50/sections/datatypes#Distributed Array Datatype Constructor|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (9 changed paragraphs)

- ~~MPI_DISTRIBUTE_BLOCK~~ ==`MPI_DISTRIBUTE_BLOCK`== - Block distribution

- ~~MPI_DISTRIBUTE_CYCLIC~~ ==`MPI_DISTRIBUTE_CYCLIC`== - Cyclic distribution

- ~~MPI_DISTRIBUTE_NONE~~ ==`MPI_DISTRIBUTE_NONE`== - Dimension not distributed.

The constant ~~MPI_DISTRIBUTE_DFLT_DARG~~ ==`MPI_DISTRIBUTE_DFLT_DARG`== specifies a default distribution argument.

in which the distribution is ~~MPI_DISTRIBUTE_BLOCK,~~ ==`MPI_DISTRIBUTE_BLOCK`,==

For example, the HPF layout `ARRAY(CYCLIC(15))` corresponds to ~~MPI_DISTRIBUTE_CYCLIC~~ ==`MPI_DISTRIBUTE_CYCLIC`== with a distribution argument of 15, and the HPF layout ARRAY(BLOCK)

corresponds to ~~MPI_DISTRIBUTE_BLOCK~~ ==`MPI_DISTRIBUTE_BLOCK`== with a distribution argument of ~~MPI_DISTRIBUTE_DFLT_DARG.~~ ==`MPI_DISTRIBUTE_DFLT_DARG`.==

Therefore, arrays described by this type constructor may be stored in Fortran (column-major) or C (row-major) order. Valid values for `order` are ~~MPI_ORDER_FORTRAN~~ ==`MPI_ORDER_FORTRAN`== and ~~MPI_ORDER_C.~~ ==`MPI_ORDER_C`.==

Without loss of generality, it suffices to define the typemap for the ~~MPI_DISTRIBUTE_CYCLIC~~ ==`MPI_DISTRIBUTE_CYCLIC`== case where ~~MPI_DISTRIBUTE_DFLT_DARG~~ ==`MPI_DISTRIBUTE_DFLT_DARG`== is not used.

~~MPI_DISTRIBUTE_BLOCK~~ ==`MPI_DISTRIBUTE_BLOCK`== and ~~MPI_DISTRIBUTE_NONE~~ ==`MPI_DISTRIBUTE_NONE`== can be reduced to the ~~MPI_DISTRIBUTE_CYCLIC~~ ==`MPI_DISTRIBUTE_CYCLIC`== case for dimension

~~MPI_DISTRIBUTE_BLOCK~~ ==`MPI_DISTRIBUTE_BLOCK`== with `array_of_dargs[i]` equal to ~~MPI_DISTRIBUTE_DFLT_DARG~~ ==`MPI_DISTRIBUTE_DFLT_DARG`== is equivalent to ~~MPI_DISTRIBUTE_CYCLIC~~ ==`MPI_DISTRIBUTE_CYCLIC`== with `array_of_dargs[i]` set to ``` math (\texttt{array_of_gsizes[i]} + \texttt{array_of_psizes[i]} - 1) / \texttt{array_of_psizes[i]}. ```

If `array_of_dargs[i]` is not ~~MPI_DISTRIBUTE_DFLT_DARG,~~ ==`MPI_DISTRIBUTE_DFLT_DARG`,== then ~~MPI_DISTRIBUTE_BLOCK~~ ==`MPI_DISTRIBUTE_BLOCK`== and ~~MPI_DISTRIBUTE_CYCLIC~~ ==`MPI_DISTRIBUTE_CYCLIC`== are equivalent.

~~MPI_DISTRIBUTE_NONE~~ ==`MPI_DISTRIBUTE_NONE`== is equivalent to ~~MPI_DISTRIBUTE_CYCLIC~~ ==`MPI_DISTRIBUTE_CYCLIC`== with `array_of_dargs[i]` set to `array_of_gsizes[i]`.

Finally, ~~MPI_DISTRIBUTE_CYCLIC~~ ==`MPI_DISTRIBUTE_CYCLIC`== with `array_of_dargs[i]` equal to ~~MPI_DISTRIBUTE_DFLT_DARG~~ ==`MPI_DISTRIBUTE_DFLT_DARG`== is equivalent to ~~MPI_DISTRIBUTE_CYCLIC~~ ==`MPI_DISTRIBUTE_CYCLIC`== with `array_of_dargs[i]` set to 1.

For ~~MPI_ORDER_FORTRAN,~~ ==`MPI_ORDER_FORTRAN`,== an `ndims`-dimensional distributed array (`newtype`) is defined by the following code fragment:

For ~~MPI_ORDER_C,~~ ==`MPI_ORDER_C`,== the code is:

Given the above, the function cyclic() is defined as follows: ``` math \begin{eqnarray*} cyclic(darg, gsize, r, psize, \texttt{oldtype}) \\ &=& \{ ~~(MPI_LB,~~ ==(\texttt{MPI_LB},== 0), \\ & & (type_0, disp_0 + r \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex), \\ & & (type_0, disp_0 + (r \times darg + 1) \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1)\times ex), \\ & & ... \\ & & (type_0, disp_0 + ((r+1) \times darg -1) \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + ((r+1) \times darg - 1)\times ex), \\ & & \\ & & (type_0, disp_0 + r \times darg \times ex + psize \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex + psize \times darg \times ex), \\ & & (type_0, disp_0 + (r \times darg + 1) \times ex + psize \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1) \times ex + psize \times darg \times ex), \\ & & ... \\ & & (type_0, disp_0 + ((r+1) \times darg -1) \times ex + psize \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + ((r+1) \times darg - 1)\times ex + psize \times darg \times ex), \\ & & \hspace{.5in}\vdots \\ & & (type_0, disp_0 + r \times darg \times ex + psize \times darg \times ex \times (count - 1)), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex + psize \times darg \times ex \times (count - 1)), \\ & & (type_0, disp_0 + (r \times darg + 1) \times ex + psize \times darg \times ex \times (count - 1)), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1) \times ex \\ & & \hspace{1in} + psize \times darg \times ex \times (count - 1)), \\ & & ... \\ & & (type_0, disp_0 + (r \times darg + darg_{last}-1) \times ex \\ & & \hspace{1in} + psize \times darg \times ex \times (count-1)), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + darg_{last} - 1) \times ex \\ & & \hspace{1in} + psize \times darg \times ex \times (count - 1)), \\ & & ~~(MPI_UB,~~ ==(\texttt{MPI_UB},== gsize * ex) \} \end{eqnarray*} ```

ndims = 3 array_of_gsizes(1) = 100 array_of_distribs(1) = MPI_DISTRIBUTE_CYCLIC array_of_dargs(1) = 10 array_of_gsizes(2) = 200 array_of_distribs(2) = MPI_DISTRIBUTE_NONE array_of_dargs(2) = 0 array_of_gsizes(3) = 300 array_of_distribs(3) = MPI_DISTRIBUTE_BLOCK array_of_dargs(3) = ~~MPI_DISTRIBUTE_DFLT_ARG~~ ==MPI_DISTRIBUTE_DFLT_DARG== array_of_psizes(1) = 2 array_of_psizes(2) = 1 array_of_psizes(3) = 3 call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierr) call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr) call MPI_TYPE_CREATE_DARRAY(size, rank, ndims, array_of_gsizes, & array_of_distribs, array_of_dargs, array_of_psizes, & MPI_ORDER_FORTRAN, oldtype, newtype, ierr)

### MPI-2.2 → MPI-3.0  (12 changed paragraphs)

> One can create an HPF-like file view using this type constructor as follows. Complementary filetypes are created by having every process of a group call this constructor with identical arguments (with the exception of `rank` which should be set appropriately). These filetypes (along with identical `disp` and `etype`) are then used to define the view (via `MPI_FILE_SET_VIEW`), ~~> >~~ see MPI I/O, especially Section [[versions/v30/sections/io#Definitions|Definitions]] on page [[versions/v30/sections/io#Definitions|Definitions]] and Section [[versions/v30/sections/io#File Views|File Views]] on page [[versions/v30/sections/io#File Views|File Views]] . ~~> >~~ Using this view, a collective data access operation (with identical offsets) will yield an HPF-like distribution pattern.

~~onto~~

~~an `ndims`-dimensional grid of logical processes.~~

~~Unused dimensions of `array_of_psizes` should be set to 1.~~

~~(See Example [[versions/v30/sections/datatypes#Distributed Array Datatype Constructor|Distributed Array Datatype Constructor]] , page [[versions/v30/sections/datatypes#Distributed Array Datatype Constructor|Distributed Array Datatype Constructor]] .)~~

~~For a call to `MPI_TYPE_CREATE_DARRAY` to be correct, the equation $`\prod_{i=0}^{ndims-1} array_of_psizes[i] = size`$ must be satisfied. The ordering of processes in the process grid is assumed to be row-major, as in the case of virtual Cartesian process topologies~~

~~.~~

==onto an `ndims`-dimensional grid of logical processes.==

==Unused dimensions of `array_of_psizes` should be set to 1. (See Example [[versions/v30/sections/datatypes#Distributed Array Datatype Constructor|Distributed Array Datatype Constructor]] , page [[versions/v30/sections/datatypes#Distributed Array Datatype Constructor|Distributed Array Datatype Constructor]] .) For a call to `MPI_TYPE_CREATE_DARRAY` to be correct, the equation $`\prod_{i=0}^{ndims-1} array_of_psizes[i] = size`$ must be satisfied. The ordering of processes in the process grid is assumed to be row-major, as in the case of virtual Cartesian process topologies .==

> For both Fortran and C arrays, the ordering of processes in the process grid is assumed to be row-major. This is consistent with the ordering used in virtual Cartesian process topologies in > > MPI. ~~> >~~ To create such virtual process topologies, or to find the coordinates of a process in the process grid, etc., users may use the corresponding > > process topology functions, ~~> >~~ see Chapter [[versions/v30/sections/topol#Process Topologies|Process Topologies]] on page [[versions/v30/sections/topol#Process Topologies|Process Topologies]] .

~~can be~~

~~distributed in one of three ways:~~

==can be distributed in one of three ways:==

~~The distribution argument for a dimension that is not distributed is ignored.~~

~~For any dimension~~

~~`i`~~

~~in which the distribution is `MPI_DISTRIBUTE_BLOCK`,~~

~~it is erroneous~~

~~to specify `array_of_dargs[i]` $`*`$ `array_of_psizes[i]` $`<`$ `array_of_gsizes[i]`.~~

~~For example, the HPF layout `ARRAY(CYCLIC(15))` corresponds to `MPI_DISTRIBUTE_CYCLIC` with a distribution argument of 15, and the HPF layout ARRAY(BLOCK)~~

~~corresponds to `MPI_DISTRIBUTE_BLOCK` with a distribution argument of `MPI_DISTRIBUTE_DFLT_DARG`.~~

~~The `order` argument is used as in `MPI_TYPE_CREATE_SUBARRAY` to specify the storage order.~~

~~Therefore, arrays described by this type constructor may be stored in Fortran (column-major) or C (row-major) order. Valid values for `order` are `MPI_ORDER_FORTRAN` and `MPI_ORDER_C`.~~

==The distribution argument for a dimension that is not distributed is ignored. For any dimension==

==`i` in which the distribution is `MPI_DISTRIBUTE_BLOCK`,==

==it is erroneous to specify `array_of_dargs[i]` $`*`$ `array_of_psizes[i]` $`<`$ `array_of_gsizes[i]`.==

==For example, the HPF layout `ARRAY(CYCLIC(15))` corresponds to `MPI_DISTRIBUTE_CYCLIC` with a distribution argument of 15, and the HPF layout ARRAY(BLOCK) corresponds to `MPI_DISTRIBUTE_BLOCK` with a distribution argument of `MPI_DISTRIBUTE_DFLT_DARG`.==

==The `order` argument is used as in `MPI_TYPE_CREATE_SUBARRAY` to specify the storage order. Therefore, arrays described by this type constructor may be stored in Fortran (column-major) or C (row-major) order. Valid values for `order` are `MPI_ORDER_FORTRAN` and `MPI_ORDER_C`.==

~~`i`~~

~~as follows.~~

==`i` as follows.==

~~oldtype[0]~~ ==oldtypes[0]== = oldtype; for ~~( i~~ ==(i== = 0; i < ndims; ~~i++ )~~ ==i++)== { ~~oldtype[i+1]~~ ==oldtypes[i+1]== = cyclic(array_of_dargs[i], array_of_gsizes[i], r[i], array_of_psizes[i], ~~oldtype[i]);~~ ==oldtypes[i]);== } newtype = ~~oldtype[ndims];~~ ==oldtypes[ndims];==

~~oldtype[0]~~ ==oldtypes[0]== = oldtype; for ~~( i~~ ==(i== = 0; i < ndims; ~~i++ )~~ ==i++)== { ~~oldtype[i~~ ==oldtypes[i== + 1] = cyclic(array_of_dargs[ndims - i - 1], array_of_gsizes[ndims - i - 1], r[ndims - i - 1], array_of_psizes[ndims - i - 1], ~~oldtype[i]);~~ ==oldtypes[i]);== } newtype = ~~oldtype[ndims];~~ ==oldtypes[ndims];==

t_rank = rank; t_size = 1; for (i = 0; i < ndims; i++) t_size *= array_of_psizes[i]; for (i = 0; i < ndims; i++) { t_size = t_size / array_of_psizes[i]; r[i] = t_rank / t_size; t_rank = t_rank % t_size; }

where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. ==The following function uses the conceptual datatypes lb_marker and ub_marker, see Section [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page [[versions/v30/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] for details.==

Given the above, the function cyclic() is defined as follows: ``` math \begin{eqnarray*} cyclic(darg, gsize, r, psize, \texttt{oldtype}) \\ &=& \{ ~~(\texttt{MPI_LB},~~ ==( lb_marker,== 0), \\ & & (type_0, disp_0 + r \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex), \\ & & (type_0, disp_0 + (r \times darg + 1) \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1)\times ex), \\ & & ... \\ & & (type_0, disp_0 + ((r+1) \times darg -1) \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + ((r+1) \times darg - 1)\times ex), \\ & & \\ & & (type_0, disp_0 + r \times darg \times ex + psize \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex + psize \times darg \times ex), \\ & & (type_0, disp_0 + (r \times darg + 1) \times ex + psize \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1) \times ex + psize \times darg \times ex), \\ & & ... \\ & & (type_0, disp_0 + ((r+1) \times darg -1) \times ex + psize \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + ((r+1) \times darg - 1)\times ex + psize \times darg \times ex), \\ & & \hspace{.5in}\vdots \\ & & (type_0, disp_0 + r \times darg \times ex + psize \times darg \times ex \times (count - 1)), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex + psize \times darg \times ex \times (count - 1)), \\ & & (type_0, disp_0 + (r \times darg + 1) \times ex + psize \times darg \times ex \times (count - 1)), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1) \times ex \\ & & \hspace{1in} + psize \times darg \times ex \times (count - 1)), \\ & & ... \\ & & (type_0, disp_0 + (r \times darg + darg_{last}-1) \times ex \\ & & \hspace{1in} + psize \times darg \times ex \times (count-1)), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + darg_{last} - 1) \times ex \\ & & \hspace{1in} + psize \times darg \times ex \times (count - 1)), \\ & & ~~(\texttt{MPI_UB},~~ ==( ub_marker,== gsize * ex) \} \end{eqnarray*} ```

nblocks = (gsize + (darg - 1)) / darg; count = nblocks / psize; left_over = nblocks - count * psize; if (r < left_over) count = count + 1;

if ((num_in_last_cyclic = gsize % (psize * darg)) == 0) darg_last = darg; else darg_last = num_in_last_cyclic - darg * r; if (darg_last > darg) darg_last = darg; if (darg_last <= 0) darg_last = darg;

### MPI-3.0 → MPI-3.1  (8 changed paragraphs)

> One can create an HPF-like file view using this type constructor as follows. Complementary filetypes are created by having every process of a group call this constructor with identical arguments (with the exception of `rank` which should be set appropriately). These filetypes (along with identical `disp` and `etype`) are then used to define the view (via ~~`MPI_FILE_SET_VIEW`),~~ ==[[versions/v31/API/MPI_FILE_SET_VIEW|MPI_FILE_SET_VIEW]] ),== see MPI I/O, especially ~~Section [[versions/v31/sections/io#Definitions|Definitions]] on page~~ [[versions/v31/sections/io#Definitions|Definitions]] and ~~Section [[versions/v31/sections/io#File Views|File Views]] on page~~ [[versions/v31/sections/io#File Views|File Views]] . Using this view, a collective data access operation (with identical offsets) will yield an HPF-like distribution pattern.

~~`MPI_TYPE_CREATE_DARRAY` can be used to generate the datatypes corresponding to the distribution of an `ndims`-dimensional array of `oldtype` elements~~

~~onto an `ndims`-dimensional grid of logical processes.~~

~~Unused dimensions of `array_of_psizes` should be set to 1. (See Example [[versions/v31/sections/datatypes#Distributed Array Datatype Constructor|Distributed Array Datatype Constructor]] , page [[versions/v31/sections/datatypes#Distributed Array Datatype Constructor|Distributed Array Datatype Constructor]] .) For a call to `MPI_TYPE_CREATE_DARRAY` to be correct, the equation $`\prod_{i=0}^{ndims-1} array_of_psizes[i] = size`$ must be satisfied. The ordering of processes in the process grid is assumed to be row-major, as in the case of virtual Cartesian process topologies .~~

==[[versions/v31/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] can be used to generate the datatypes corresponding to the distribution of an `ndims`-dimensional array of `oldtype` elements onto an `ndims`-dimensional grid of logical processes. Unused dimensions of `array_of_psizes` should be set to `1`. (See [[Example]] ex:io-hpf.) For a call to [[versions/v31/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] to be correct, the equation $`\prod_{i=0}^{ndims-1} array_of_psizes[i] = size`$ must be satisfied. The ordering of processes in the process grid is assumed to be row-major, as in the case of virtual Cartesian process topologies.==

~~> For both Fortran and C arrays, the ordering of processes in the process grid is assumed to be row-major. This is consistent with the ordering used in virtual Cartesian process topologies in > > MPI. To create such virtual process topologies, or to find the coordinates of a process in the process grid, etc., users may use the corresponding > > process topology functions, see Chapter [[versions/v31/sections/topol#Process Topologies|Process Topologies]] on page [[versions/v31/sections/topol#Process Topologies|Process Topologies]] .~~

~~Each dimension of the array~~

~~can be distributed in one of three ways:~~

==> For both Fortran and C arrays, the ordering of processes in the process grid is assumed to be row-major. This is consistent with the ordering used in virtual Cartesian process topologies in MPI. To create such virtual process topologies, or to find the coordinates of a process in the process grid, etc., users may use the corresponding process topology functions, see [[Chapter]] chap:topol.==

==Each dimension of the array can be distributed in one of three ways:==

~~The constant `MPI_DISTRIBUTE_DFLT_DARG` specifies a default distribution argument.~~

~~The distribution argument for a dimension that is not distributed is ignored. For any dimension~~

~~`i` in which the distribution is `MPI_DISTRIBUTE_BLOCK`,~~

~~it is erroneous to specify `array_of_dargs[i]` $`*`$ `array_of_psizes[i]` $`<`$ `array_of_gsizes[i]`.~~

==The constant `MPI_DISTRIBUTE_DFLT_DARG` specifies a default distribution argument. The distribution argument for a dimension that is not distributed is ignored. For any dimension `i` in which the distribution is `MPI_DISTRIBUTE_BLOCK`, it is erroneous to specify `array_of_dargs[i]` $`*`$ `array_of_psizes[i]` $`<`$ `array_of_gsizes[i]`.==

The `order` argument is used as in ~~`MPI_TYPE_CREATE_SUBARRAY`~~ ==[[versions/v31/API/MPI_TYPE_CREATE_SUBARRAY|MPI_TYPE_CREATE_SUBARRAY]]== to specify the storage order. Therefore, arrays described by this type constructor may be stored in Fortran (column-major) or C (row-major) order. Valid values for `order` are `MPI_ORDER_FORTRAN` and `MPI_ORDER_C`.

~~`MPI_DISTRIBUTE_BLOCK` and `MPI_DISTRIBUTE_NONE` can be reduced to the `MPI_DISTRIBUTE_CYCLIC` case for dimension~~

~~`i` as follows.~~

==`MPI_DISTRIBUTE_BLOCK` and `MPI_DISTRIBUTE_NONE` can be reduced to the `MPI_DISTRIBUTE_CYCLIC` case for dimension `i` as follows.==

where $`type_i`$ is a predefined MPI datatype, and let $`ex`$ be the extent of `oldtype`. The following function uses the conceptual datatypes ~~lb_marker~~ ==`lb_marker`== and ~~ub_marker,~~ ==`ub_marker`,== see ~~Section [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] on page~~ [[versions/v31/sections/datatypes#Lower-Bound and Upper-Bound Markers|Lower-Bound and Upper-Bound Markers]] for details.

Given the above, the function cyclic() is defined as follows: ``` math \begin{eqnarray*} cyclic(darg, gsize, r, psize, \texttt{oldtype}) \\ &=& \{ ~~( lb_marker,~~ ==(\texttt{lb_marker},== 0), \\ & & (type_0, disp_0 + r \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex), \\ & & (type_0, disp_0 + (r \times darg + 1) \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1)\times ex), \\ & & ... \\ & & (type_0, disp_0 + ((r+1) \times darg -1) \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + ((r+1) \times darg - 1)\times ex), \\ & & \\ & & (type_0, disp_0 + r \times darg \times ex + psize \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex + psize \times darg \times ex), \\ & & (type_0, disp_0 + (r \times darg + 1) \times ex + psize \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1) \times ex + psize \times darg \times ex), \\ & & ... \\ & & (type_0, disp_0 + ((r+1) \times darg -1) \times ex + psize \times darg \times ex), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + ((r+1) \times darg - 1)\times ex + psize \times darg \times ex), \\ & & \hspace{.5in}\vdots \\ & & (type_0, disp_0 + r \times darg \times ex + psize \times darg \times ex \times (count - 1)), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + r \times darg \times ex + psize \times darg \times ex \times (count - 1)), \\ & & (type_0, disp_0 + (r \times darg + 1) \times ex + psize \times darg \times ex \times (count - 1)), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + 1) \times ex \\ & & \hspace{1in} + psize \times darg \times ex \times (count - 1)), \\ & & ... \\ & & (type_0, disp_0 + (r \times darg + darg_{last}-1) \times ex \\ & & \hspace{1in} + psize \times darg \times ex \times (count-1)), ... , \\ & & \hspace{.5in} (type_{n-1}, disp_{n-1} + (r \times darg + darg_{last} - 1) \times ex \\ & & \hspace{1in} + psize \times darg \times ex \times (count - 1)), \\ & & ~~( ub_marker,~~ ==(\texttt{ub_marker},== gsize * ex) \} \end{eqnarray*} ```

if ((num_in_last_cyclic = gsize % (psize * darg)) == 0) darg_last = darg; else =={== darg_last = num_in_last_cyclic - darg * r; if (darg_last > darg) darg_last = darg; if (darg_last <= 0) darg_last = darg; ==}==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

[[versions/v40/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] can be used to generate the datatypes corresponding to the distribution of an `ndims`-dimensional array of `oldtype` elements onto an `ndims`-dimensional grid of logical processes. Unused dimensions of `array_of_psizes` should be set to ~~`1`. (See~~ ==`1` (see== [[Example]] ~~ex:io-hpf.)~~ ==ex:io-hpf).== For a call to [[versions/v40/API/MPI_TYPE_CREATE_DARRAY|MPI_TYPE_CREATE_DARRAY]] to be correct, the equation $`\prod_{i=0}^{ndims-1} array_of_psizes[i] = size`$ must be satisfied. The ordering of processes in the process grid is assumed to be row-major, as in the case of virtual Cartesian process topologies.

- `MPI_DISTRIBUTE_NONE` - Dimension not ~~distributed.~~ ==distributed==

where ~~$`r[i]`$~~ ==`r[i]`== is the position of the process (with rank `rank`) in the process grid at dimension ~~$`i`$.~~ ==`i`.== The values of ~~$`r[i]`$~~ ==`r[i]`== are given by the following code fragment:

Here, ~~$`nblocks`$~~ ==`nblocks`== is the number of blocks that must be distributed among the processors. Finally, $`darg_{last}`$ is defined by this code fragment:

if ((num_in_last_cyclic = gsize % (psize * darg)) == 0) darg_last = darg; else { darg_last = num_in_last_cyclic - darg * r; if (darg_last > darg) darg_last = darg; if (darg_last <= 0) darg_last = darg; }

ndims = 3 array_of_gsizes(1) = 100 array_of_distribs(1) = MPI_DISTRIBUTE_CYCLIC array_of_dargs(1) = 10 array_of_gsizes(2) = 200 array_of_distribs(2) = MPI_DISTRIBUTE_NONE array_of_dargs(2) = 0 array_of_gsizes(3) = 300 array_of_distribs(3) = MPI_DISTRIBUTE_BLOCK array_of_dargs(3) = MPI_DISTRIBUTE_DFLT_DARG array_of_psizes(1) = 2 array_of_psizes(2) = 1 array_of_psizes(3) = 3 call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierr) call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr) call MPI_TYPE_CREATE_DARRAY(size, rank, ndims, array_of_gsizes, & array_of_distribs, array_of_dargs, array_of_psizes, & MPI_ORDER_FORTRAN, oldtype, newtype, ierr)

### MPI-4.0 → MPI-4.1  (10 changed paragraphs)

> For both Fortran and C arrays, the ordering of processes in the process grid is assumed to be row-major. This is consistent with the ordering used in virtual Cartesian process topologies in MPI. To create such virtual process topologies, or to find the coordinates of a process in the process grid, etc., users may use the corresponding process topology ~~functions,~~ ==procedures,== see [[Chapter]] chap:topol.

~~- `MPI_DISTRIBUTE_BLOCK` -~~ Block ~~distribution~~ ==distribution.==

~~- `MPI_DISTRIBUTE_CYCLIC` -~~ Cyclic ~~distribution~~ ==distribution.==

~~- `MPI_DISTRIBUTE_NONE` -~~ Dimension not ~~distributed~~ ==distributed.==

For example, the HPF layout `ARRAY(CYCLIC(15))` corresponds to `MPI_DISTRIBUTE_CYCLIC` with a distribution argument of 15, and the HPF layout ~~ARRAY(BLOCK)~~ ==`ARRAY(BLOCK)`== corresponds to `MPI_DISTRIBUTE_BLOCK` with a distribution argument of `MPI_DISTRIBUTE_DFLT_DARG`.

~~        oldtypes[0] = oldtype;         for (i = 0; i < ndims; i++) {             oldtypes[i+1] = cyclic(array_of_dargs[i],                                    array_of_gsizes[i],                                    r[i],                                     array_of_psizes[i],                                    oldtypes[i]);         }         newtype = oldtypes[ndims];~~

==(code block added)==
``` objectivec
oldtypes[0] = oldtype;
for (i = 0; i < ndims; i++) {
    oldtypes[i+1] = cyclic(array_of_dargs[i],
                           array_of_gsizes[i],
                           r[i],
                           array_of_psizes[i],
                           oldtypes[i]);
}
newtype = oldtypes[ndims];
```

~~        oldtypes[0] = oldtype;         for (i = 0; i < ndims; i++) {             oldtypes[i + 1] = cyclic(array_of_dargs[ndims - i - 1],                                       array_of_gsizes[ndims - i - 1],                                      r[ndims - i - 1],                                       array_of_psizes[ndims - i - 1],                                      oldtypes[i]);         }         newtype = oldtypes[ndims];~~

==(code block added)==
``` objectivec
oldtypes[0] = oldtype;
for (i = 0; i < ndims; i++) {
    oldtypes[i+1] = cyclic(array_of_dargs[ndims - i - 1],
                           array_of_gsizes[ndims - i - 1],
                           r[ndims - i - 1],
                           array_of_psizes[ndims - i - 1],
                           oldtypes[i]);
}
newtype = oldtypes[ndims];
```

~~        t_rank = rank;         t_size = 1;         for (i = 0; i < ndims; i++)             t_size *= array_of_psizes[i];         for (i = 0; i < ndims; i++) {             t_size = t_size / array_of_psizes[i];             r[i] = t_rank / t_size;             t_rank = t_rank % t_size;         }~~

==(code block added)==
``` objectivec
t_rank = rank;
t_size = 1;
for (i = 0; i < ndims; i++)
    t_size *= array_of_psizes[i];
for (i = 0; i < ndims; i++) {
    t_size = t_size / array_of_psizes[i];
    r[i] = t_rank / t_size;
    t_rank = t_rank % t_size;
}
```

~~        nblocks = (gsize + (darg - 1)) / darg;         count = nblocks / psize;         left_over = nblocks - count * psize;         if (r < left_over)             count = count + 1;~~

==(code block added)==
``` objectivec
nblocks = (gsize + (darg - 1)) / darg;
count = nblocks / psize;
left_over = nblocks - count * psize;
if (r < left_over)
    count = count + 1;
```

~~        if ((num_in_last_cyclic = gsize % (psize * darg)) == 0)             darg_last = darg;         else {             darg_last = num_in_last_cyclic - darg * r;             if (darg_last > darg)                 darg_last = darg;             if (darg_last <= 0)                 darg_last = darg;         }~~

==(code block added)==
``` objectivec
if ((num_in_last_cyclic = gsize % (psize * darg)) == 0)
    darg_last = darg;
else {
    darg_last = num_in_last_cyclic - darg * r;
    if (darg_last > darg)
        darg_last = darg;
    if (darg_last <= 0)
        darg_last = darg;
}
```

~~          <oldtype> FILEARRAY(100, 200, 300)     !HPF$ PROCESSORS PROCESSES(2, 3)     !HPF$ DISTRIBUTE FILEARRAY(CYCLIC(10), *, BLOCK) ONTO PROCESSES~~

==(code block added)==
``` [HPF]Fortran
<oldtype> FILEARRAY(100, 200, 300)
!HPF$ PROCESSORS PROCESSES(2, 3)
!HPF$ DISTRIBUTE FILEARRAY(CYCLIC(10), *, BLOCK) ONTO PROCESSES
```

~~    ndims = 3     array_of_gsizes(1) = 100     array_of_distribs(1) = MPI_DISTRIBUTE_CYCLIC     array_of_dargs(1) = 10     array_of_gsizes(2) = 200     array_of_distribs(2) = MPI_DISTRIBUTE_NONE     array_of_dargs(2) = 0     array_of_gsizes(3) = 300     array_of_distribs(3) = MPI_DISTRIBUTE_BLOCK     array_of_dargs(3) = MPI_DISTRIBUTE_DFLT_DARG     array_of_psizes(1) = 2     array_of_psizes(2) = 1     array_of_psizes(3) = 3     call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierr)     call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)     call MPI_TYPE_CREATE_DARRAY(size, rank, ndims, array_of_gsizes, &          array_of_distribs, array_of_dargs, array_of_psizes,        &          MPI_ORDER_FORTRAN, oldtype, newtype, ierr)~~

==(code block added)==
``` [MPI]Fortran
ndims = 3
array_of_gsizes(1) = 100
array_of_distribs(1) = MPI_DISTRIBUTE_CYCLIC
array_of_dargs(1) = 10
array_of_gsizes(2) = 200
array_of_distribs(2) = MPI_DISTRIBUTE_NONE
array_of_dargs(2) = 0
array_of_gsizes(3) = 300
array_of_distribs(3) = MPI_DISTRIBUTE_BLOCK
array_of_dargs(3) = MPI_DISTRIBUTE_DFLT_DARG
array_of_psizes(1) = 2
array_of_psizes(2) = 1
array_of_psizes(3) = 3
call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierr)
call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierr)
call MPI_TYPE_CREATE_DARRAY(size, rank, ndims, array_of_gsizes, &
     array_of_distribs, array_of_dargs, array_of_psizes,        &
     MPI_ORDER_FORTRAN, oldtype, newtype, ierr)
```

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

This routine creates a new MPI datatype with a typemap defined in terms of a function called ~~“cyclic()”~~ ==“`cyclic()`”== (see below).

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Distributed Array Datatype Constructor]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Distributed Array Datatype Constructor]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Distributed Array Datatype Constructor]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Distributed Array Datatype Constructor]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Distributed Array Datatype Constructor]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/datatypes#Distributed Array Datatype Constructor]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/datatypes#Distributed Array Datatype Constructor]]

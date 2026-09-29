---
title: "Ordering"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Ordering

Chapter **one-side** · in [[versions/v30/sections/one-side#Ordering|MPI-3.0]], [[versions/v31/sections/one-side#Ordering|MPI-3.1]], [[versions/v40/sections/one-side#Ordering|MPI-4.0]], [[versions/v41/sections/one-side#Ordering|MPI-4.1]], [[versions/v50/sections/one-side#Ordering|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~Accumulate calls enable element-wise atomic read and write to remote memory locations. MPI specifies ordering between accumulate operations from one process to the same (or overlapping) memory locations at another process on a per-datatype granularity. The default ordering is strict ordering, which guarantees that overlapping updates from the same source to a remote location are committed in program order and that reads (e.g., with [[versions/v31/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] ) and writes (e.g., with [[versions/v31/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] ) are executed and committed in program order. Ordering only applies to operations originating at the same origin that access overlapping target memory regions. MPI does not provide any guarantees for accesses or updates from different origins to overlapping target memory regions.~~

~~The default strict ordering may incur a significant performance penalty. MPI specifies the info key `accumulate_ordering` to allow relaxation of the ordering semantics when specified to any window creation function.~~

~~The values for this key are as follows. If set to `none`, then no ordering will be guaranteed for accumulate calls. This was the behavior for RMA in MPI-2 but is *not* the default in MPI-3. The key can be set to a comma-separated list of required access orderings at the target. Allowed values in the comma-separated list are `rar`, `war`, `raw`, and `waw` for read-after-read, write-after-read, read-after-write, and write-after-write ordering, respectively. These indicate whether operations of the specified type complete in the order they were issued. For example, `raw` means that any writes must complete at the target before any reads. These ordering requirements apply only to operations issued by the same origin process and targeting the same target process. The default value for `accumulate_ordering` is `rar,raw,war,waw`, which implies that writes complete at the target in the order in which they were issued, reads complete at the target before any writes that are issued after the reads, and writes complete at the target before any reads that are issued after the writes. Any subset of these four orderings can be specified. For example, if only read-after-read and write-after-write ordering is required, then the value of the `accumulate_ordering` key could be set to `rar,waw`. The order of values is not significant.~~

==Accumulate calls enable element-wise atomic read and write to remote memory locations. MPI specifies ordering between accumulate operations from one process to the same (or overlapping) memory locations at another process on a per-datatype granularity. The default ordering is strict ordering, which guarantees that overlapping updates from the same source to a remote location are committed in program order and that reads (e.g., with [[versions/v31/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] ) and writes (e.g., with [[versions/v31/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] ) are executed and committed in program order. Ordering only applies to operations originating at the same origin that access overlapping target memory regions. MPI does not provide any guarantees for accesses or updates from different origin processes to overlapping target memory regions.==

==The default strict ordering may incur a significant performance penalty. MPI specifies the info key `accumulate_ordering` to allow relaxation of the ordering semantics when specified to any window creation function. The values for this key are as follows. If set to `none`, then no ordering will be guaranteed for accumulate calls. This was the behavior for RMA in MPI-2 but is *not* the default in MPI-3. The key can be set to a comma-separated list of required access orderings at the target. Allowed values in the comma-separated list are `rar`, `war`, `raw`, and `waw` for read-after-read, write-after-read, read-after-write, and write-after-write ordering, respectively. These indicate whether operations of the specified type complete in the order they were issued. For example, `raw` means that any writes must complete at the target before subsequent reads. These ordering requirements apply only to operations issued by the same origin process and targeting the same target process. The default value for `accumulate_ordering` is `rar,raw,war,waw`, which implies that writes complete at the target in the order in which they were issued, reads complete at the target before any writes that are issued after the reads, and writes complete at the target before any reads that are issued after the writes. Any subset of these four orderings can be specified. For example, if only read-after-read and write-after-write ordering is required, then the value of the `accumulate_ordering` key could be set to `rar,waw`. The order of values is not significant.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

Accumulate calls enable element-wise atomic read and write to remote memory locations. MPI specifies ordering between accumulate operations from ~~one~~ ==an origin== process to the same (or overlapping) memory locations at ~~another~~ ==a target== process on a per-datatype granularity. The default ordering is strict ordering, which guarantees that overlapping updates from the same ~~source~~ ==origin== to a remote location are committed in program order and that reads (e.g., with [[versions/v40/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] ) and writes (e.g., with [[versions/v40/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] ) are executed and committed in program order. Ordering only applies to operations originating at the same origin that access overlapping target memory regions. MPI does not provide any guarantees for accesses or updates from different origin processes to overlapping target memory regions.

The default strict ordering may incur a significant performance penalty. MPI specifies the info key `accumulate_ordering` to allow relaxation of the ordering semantics when specified to any window creation function. The values for this key are as follows. If set to `none`, then no ordering will be guaranteed for accumulate calls. This was the behavior for RMA in MPI-2 but ~~is~~ ==has== *not* ==been== the default ~~in~~ ==since== MPI-3. The key can be set to a comma-separated list of required access orderings at the target. Allowed values in the comma-separated list are `rar`, `war`, `raw`, and `waw` for read-after-read, write-after-read, read-after-write, and write-after-write ordering, respectively. These indicate whether operations of the specified type complete in the order they were issued. For example, `raw` means that any writes must complete at the target before subsequent reads. These ordering requirements apply only to operations issued by the same origin process and targeting the same target process. The default value for `accumulate_ordering` is `rar,raw,war,waw`, which implies that writes complete at the target in the order in which they were issued, reads complete at the target before any writes that are issued after the reads, and writes complete at the target before any reads that are issued after the writes. Any subset of these four orderings can be specified. For example, if only read-after-read and write-after-write ordering is required, then the value of the `accumulate_ordering` key could be set to `rar,waw`. The order of values is not significant.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

Accumulate ~~calls~~ ==operations== enable element-wise atomic read and write to ~~remote~~ ==window== memory locations. MPI specifies ordering between accumulate operations from an origin process to the same (or overlapping) memory locations at a target process on a per-datatype granularity. The default ordering is strict ordering, which guarantees that overlapping updates from the same origin to a remote location are committed in program order and that reads (e.g., with [[versions/v41/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] ) and writes (e.g., with [[versions/v41/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] ) are executed and committed in program order. Ordering only applies to operations originating at the same origin that access overlapping target memory regions. MPI does not provide any guarantees for accesses or updates from different origin processes to overlapping target memory regions.

The default strict ordering may incur a significant performance penalty. MPI specifies the info key `accumulate_ordering` to allow relaxation of the ordering semantics when specified to any window creation function. The values for this key are as follows. If set to `none`, then no ordering will be guaranteed for accumulate ~~calls.~~ ==operations.== This was the behavior for RMA in MPI-2 but has *not* been the default since MPI-3. The key can be set to a comma-separated list of required access orderings at the target. Allowed values in the comma-separated list are `rar`, `war`, `raw`, and `waw` for read-after-read, write-after-read, read-after-write, and write-after-write ordering, respectively. These indicate whether operations of the specified type complete in the order they were issued. For example, `raw` means that any writes must complete at the target before subsequent reads. These ordering requirements apply only to operations issued by the same origin process and targeting the same target process. The default value for `accumulate_ordering` is `rar,raw,war,waw`, which implies that writes complete at the target in the order in which they were issued, reads complete at the target before any writes that are issued after the reads, and writes complete at the target before any reads that are issued after the writes. Any subset of these four orderings can be specified. For example, if only read-after-read and write-after-write ordering is required, then the value of the `accumulate_ordering` key could be set to `rar,waw`. The order of values is not significant.

Note that the above ordering semantics apply only to accumulate operations, not ==to== put and ~~get.~~ ==get operations.== Put and get ==operations== within an epoch are unordered.

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Ordering]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Ordering]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Ordering]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Ordering]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Ordering]]

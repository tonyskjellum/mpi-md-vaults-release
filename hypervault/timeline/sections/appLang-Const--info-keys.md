---
title: "Info Keys"
chapter: appLang-Const
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/appLang-Const]
---

# Info Keys

Chapter **appLang-Const** · in [[versions/v21/sections/appLang-Const#Info Keys|MPI-2.1]], [[versions/v22/sections/appLang-Const#Info Keys|MPI-2.2]], [[versions/v30/sections/appLang-Const#Info Keys|MPI-3.0]], [[versions/v31/sections/appLang-Const#Info Keys|MPI-3.1]], [[versions/v40/sections/appLang-Const#Info Keys|MPI-4.0]], [[versions/v41/sections/appLang-Const#Info Keys|MPI-4.1]], [[versions/v50/sections/appLang-Const#Info Keys|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

==The following info keys are reserved. They are strings.\== access_style\ appnum\ arch\ cb_block_size\ cb_buffer_size\ cb_nodes\ chunked_item\ chunked_size\ chunked\ collective_buffering\ file_perm\ filename\ file\ host\ io_node_list\ ip_address\ ip_port\ nb_proc\ no_locks\ num_io_nodes\ path\ soft\ striping_factor\ striping_unit\ wdir\

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The following info keys are reserved. They are strings.\ access_style\ ==accumulate_ops\ accumulate_ordering\ alloc_shared_noncontig\== appnum\ arch\ cb_block_size\ cb_buffer_size\ cb_nodes\ chunked_item\ chunked_size\ chunked\ collective_buffering\ file_perm\ filename\ file\ host\ io_node_list\ ip_address\ ip_port\ nb_proc\ no_locks\ num_io_nodes\ path\ ==same_disp_unit\ same_size\== soft\ striping_factor\ striping_unit\ wdir\

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The following info keys are reserved. They are strings.\ ~~access_style\ accumulate_ops\ accumulate_ordering\ alloc_shared_noncontig\ appnum\ arch\ cb_block_size\ cb_buffer_size\ cb_nodes\ chunked_item\ chunked_size\ chunked\ collective_buffering\ file_perm\ filename\ file\ host\ io_node_list\ ip_address\ ip_port\ nb_proc\ no_locks\ num_io_nodes\ path\ same_disp_unit\ same_size\ soft\ striping_factor\ striping_unit\ wdir\~~ ==`access_style`\ `accumulate_ops`\ `accumulate_ordering`\ `alloc_shared_noncontig`\ `appnum`\ `arch`\ `argv`\ `cb_block_size`\ `cb_buffer_size`\ `cb_nodes`\ `chunked_item`\ `chunked_size`\ `chunked`\ `collective_buffering`\ `command`\ `file`\ `file_perm`\ `filename`\ `host`\ `io_node_list`\ `ip_address`\ `ip_port`\ `maxprocs`\ `mpi_assert_allow_overtaking`\ `mpi_assert_exact_length`\ `mpi_assert_no_any_source`\ `mpi_assert_no_any_tag`\ `mpi_hw_resource_type`\ `mpi_initial_errhandler`\ `mpi_minimum_memory_alignment`\ `mpi_size`\ `nb_proc`\ `no_locks`\ `num_io_nodes`\ `path`\ `same_disp_unit`\ `same_size`\ `soft`\ `striping_factor`\ `striping_unit`\ `thread_level`\ `wdir`==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The following info keys are reserved. They are strings.\ `access_style`\ `accumulate_ops`\ `accumulate_ordering`\ `alloc_shared_noncontig`\ `appnum`\ `arch`\ `argv`\ `cb_block_size`\ `cb_buffer_size`\ `cb_nodes`\ `chunked_item`\ `chunked_size`\ `chunked`\ `collective_buffering`\ `command`\ `file`\ `file_perm`\ `filename`\ `host`\ `io_node_list`\ `ip_address`\ `ip_port`\ `maxprocs`\ ==`mpi_accumulate_granularity`\== `mpi_assert_allow_overtaking`\ `mpi_assert_exact_length`\ ==`mpi_assert_memory_alloc_kinds`\== `mpi_assert_no_any_source`\ `mpi_assert_no_any_tag`\ `mpi_hw_resource_type`\ `mpi_initial_errhandler`\ ==`mpi_memory_alloc_kinds`\== `mpi_minimum_memory_alignment`\ ==`mpi_pset_name`\== `mpi_size`\ `nb_proc`\ `no_locks`\ `num_io_nodes`\ `path`\ `same_disp_unit`\ `same_size`\ `soft`\ `striping_factor`\ `striping_unit`\ `thread_level`\ `wdir`

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The following info keys are reserved. They are strings.\ `access_style`\ `accumulate_ops`\ `accumulate_ordering`\ `alloc_shared_noncontig`\ `appnum`\ `arch`\ `argv`\ `cb_block_size`\ `cb_buffer_size`\ `cb_nodes`\ ==`chunked`\== `chunked_item`\ `chunked_size`\ ~~`chunked`\~~ `collective_buffering`\ `command`\ `file`\ `file_perm`\ `filename`\ `host`\ `io_node_list`\ `ip_address`\ `ip_port`\ `maxprocs`\ `mpi_accumulate_granularity`\ ==`mpi_aint_size`\== `mpi_assert_allow_overtaking`\ `mpi_assert_exact_length`\ `mpi_assert_memory_alloc_kinds`\ `mpi_assert_no_any_source`\ `mpi_assert_no_any_tag`\ ==`mpi_complex4_supported`\ `mpi_complex8_supported`\ `mpi_complex16_supported`\ `mpi_complex32_supported`\ `mpi_count_size`\ `mpi_double_complex_supported`\ `mpi_double_precision_size`\== `mpi_hw_resource_type`\ `mpi_initial_errhandler`\ ==`mpi_integer_size`\ `mpi_integer1_supported`\ `mpi_integer2_supported`\ `mpi_integer4_supported`\ `mpi_integer8_supported`\ `mpi_integer16_supported`\ `mpi_logical_size`\ `mpi_logical1_supported`\ `mpi_logical2_supported`\ `mpi_logical4_supported`\ `mpi_logical8_supported`\ `mpi_logical16_supported`\== `mpi_memory_alloc_kinds`\ `mpi_minimum_memory_alignment`\ ==`mpi_offset_size`\== `mpi_pset_name`\ `mpi_size`\ ==`mpi_real_size`\ `mpi_real2_supported`\ `mpi_real4_supported`\ `mpi_real8_supported`\ `mpi_real16_supported`\== `nb_proc`\ `no_locks`\ `num_io_nodes`\ `path`\ `same_disp_unit`\ `same_size`\ `soft`\ `striping_factor`\ `striping_unit`\ `thread_level`\ `wdir`

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/appLang-Const#Info Keys]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/appLang-Const#Info Keys]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/appLang-Const#Info Keys]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/appLang-Const#Info Keys]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/appLang-Const#Info Keys]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/appLang-Const#Info Keys]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/appLang-Const#Info Keys]]

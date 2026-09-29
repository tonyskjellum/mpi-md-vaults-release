---
title: "Info Values"
chapter: appLang-Const
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/appLang-Const]
---

# Info Values

Chapter **appLang-Const** · in [[versions/v21/sections/appLang-Const#Info Values|MPI-2.1]], [[versions/v22/sections/appLang-Const#Info Values|MPI-2.2]], [[versions/v30/sections/appLang-Const#Info Values|MPI-3.0]], [[versions/v31/sections/appLang-Const#Info Values|MPI-3.1]], [[versions/v40/sections/appLang-Const#Info Values|MPI-4.0]], [[versions/v41/sections/appLang-Const#Info Values|MPI-4.1]], [[versions/v50/sections/appLang-Const#Info Values|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

==The following info values are reserved. They are strings.\== false\ random\ read_mostly\ read_once\ reverse_sequential\ sequential\ true\ write_mostly\ write_once\

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The following info values are reserved. They are strings.\ false\ random\ ==rar\ raw\== read_mostly\ read_once\ reverse_sequential\ ==same_op\ same_op_no_op\== sequential\ true\ ==war\ waw\== write_mostly\ ~~write_once\~~ ==write_once==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The following info values are reserved. They are strings.\ ~~false\ random\ rar\ raw\ read_mostly\ read_once\ reverse_sequential\ same_op\ same_op_no_op\ sequential\ true\ war\ waw\ write_mostly\ write_once~~ ==`false`\ `mpi_errors_abort`\ `mpi_errors_are_fatal`\ `mpi_errors_return`\ `mpi_shared_memory`\ `MPI_THREAD_FUNNELED`\ `MPI_THREAD_MULTIPLE`\ `MPI_THREAD_SERIALIZED`\ `MPI_THREAD_SINGLE`\ `none`\ `random`\ `rar`\ `raw`\ `read_mostly`\ `read_once`\ `reverse_sequential`\ `same_op`\ `same_op_no_op`\ `sequential`\ `true`\ `war`\ `waw`\ `write_mostly`\ `write_once`==

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The following info values are reserved. They are strings.\ ==`alloc_mem`\== `false`\ ==`mpi`\== `mpi_errors_abort`\ `mpi_errors_are_fatal`\ `mpi_errors_return`\ `mpi_shared_memory`\ `MPI_THREAD_FUNNELED`\ `MPI_THREAD_MULTIPLE`\ `MPI_THREAD_SERIALIZED`\ `MPI_THREAD_SINGLE`\ `none`\ `random`\ `rar`\ `raw`\ `read_mostly`\ `read_once`\ `reverse_sequential`\ `same_op`\ `same_op_no_op`\ `sequential`\ ==`system`\== `true`\ `war`\ `waw`\ ==`win_allocate`\ `win_allocate_shared`\== `write_mostly`\ `write_once`

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/appLang-Const#Info Values]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/appLang-Const#Info Values]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/appLang-Const#Info Values]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/appLang-Const#Info Values]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/appLang-Const#Info Values]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/appLang-Const#Info Values]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/appLang-Const#Info Values]]

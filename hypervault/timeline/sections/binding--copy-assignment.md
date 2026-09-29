---
title: "Copy / Assignment"
chapter: binding
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2"]
tags: [mpi/section, mpi/binding]
---

# Copy / Assignment

Chapter **binding** · in [[versions/v20/sections/binding#Copy / Assignment|MPI-2.0]], [[versions/v21/sections/binding#Copy / Assignment|MPI-2.1]], [[versions/v22/sections/binding#Copy / Assignment|MPI-2.2]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (1 changed paragraph)

Example using assignment operator. In this example, MPI::Intracomm::Dup() is *not* called for `foo_comm`. The object `foo_comm` is simply an alias for `MPI::COMM_WORLD`. But `bar_comm` is created with a call to `MPI::Intracomm::Dup()` and is therefore a different communicator than `foo_comm` (and thus different from `MPI::COMM_WORLD`). `baz_comm` becomes an alias for `bar_comm`. If one of `bar_comm` or `baz_comm` is freed with [[versions/v21/API/MPI_COMM_FREE|MPI_COMM_FREE]] it will be set to ~~`MPI::COMM_NULL` .~~ ==MPI::COMM_NULL.== The state of the other handle will be undefined — it will be invalid, but not necessarily set to ~~`MPI::COMM_NULL` .~~ ==MPI::COMM_NULL.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

Example using assignment operator. In this example, MPI::Intracomm::Dup() is *not* called for `foo_comm`. The object `foo_comm` is simply an alias for `MPI::COMM_WORLD`. But `bar_comm` is created with a call to `MPI::Intracomm::Dup()` and is therefore a different communicator than `foo_comm` (and thus different from `MPI::COMM_WORLD`). `baz_comm` becomes an alias for `bar_comm`. If one of `bar_comm` or `baz_comm` is freed with [[versions/v22/API/MPI_COMM_FREE|MPI_COMM_FREE]] it will be set to ~~MPI::COMM_NULL.~~ ==`MPI::COMM_NULL`.== The state of the other handle will be undefined — it will be invalid, but not necessarily set to ~~MPI::COMM_NULL.~~ ==`MPI::COMM_NULL`.==

### MPI-2.2 → MPI-3.0

_Section absent from MPI-3.0._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/binding#Copy / Assignment]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Copy / Assignment]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Copy / Assignment]]

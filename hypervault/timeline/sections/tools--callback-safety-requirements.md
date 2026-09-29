---
title: "Callback Safety Requirements"
chapter: tools
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Callback Safety Requirements

Chapter **tools** · in [[versions/v40/sections/tools#Callback Safety Requirements|MPI-4.0]], [[versions/v41/sections/tools#Callback Safety Requirements|MPI-4.1]], [[versions/v50/sections/tools#Callback Safety Requirements|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

| ~~Safety Requirement~~ ==**Safety Requirement**== | |:-------------------------------------| | `MPI_T_CB_REQUIRE_NONE` | | `MPI_T_CB_REQUIRE_MPI_RESTRICTED` | | `MPI_T_CB_REQUIRE_THREAD_SAFE` | | `MPI_T_CB_REQUIRE_ASYNC_SIGNAL_SAFE` |

All functions with the prefix [[MPI_T]] , except those listed in Table [[versions/v41/sections/tools#Callback Safety Requirements|Callback Safety Requirements]] , may return the ~~error~~ ==return== code `MPI_T_ERR_NOT_ACCESSIBLE` to indicate that the user may not access this function at this time. The functions (and their respective [[PMPI]] versions) listed in Table [[versions/v41/sections/tools#Callback Safety Requirements|Callback Safety Requirements]] are exceptions to this rule and shall not return `MPI_T_ERR_NOT_ACCESSIBLE`.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Callback Safety Requirements]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Callback Safety Requirements]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Callback Safety Requirements]]

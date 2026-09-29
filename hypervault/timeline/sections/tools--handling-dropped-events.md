---
title: "Handling Dropped Events"
chapter: tools
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Handling Dropped Events

Chapter **tools** · in [[versions/v40/sections/tools#Handling Dropped Events|MPI-4.0]], [[versions/v41/sections/tools#Handling Dropped Events|MPI-4.1]], [[versions/v50/sections/tools#Handling Dropped Events|MPI-5.0]]

## Changes along the time axis

### MPI-3.1 → MPI-4.0

_Section appears in MPI-4.0._

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

The argument `event_registration` corresponds to the event registration handle to which the dropped data corresponds. The argument `count` provides a best effort estimation of the number of invocations to a registered event callback corresponding to `event_registration` that were not executed since the registration of the dropped-callback handler or the last invocation of a registered dropped-callback handler. ==If the number of dropped events observed by the implementation exceeds the limit of `count`, an implementation shall set `count` to the maximum possible value for the type of `count`.== The `source_index` provides the index of the source that dropped the corresponding event information. The argument `cb_safety` describes the safety requirements the callback function must fulfill in the current invocation. The possible values for `cb_safety` are described in Table [[versions/v41/sections/tools#Callback Safety Requirements|Callback Safety Requirements]] . The argument `user_data` is the pointer to user-allocated memory that was passed to the MPI implementation during callback registration. If no event callback is registered for safety requirement levels that an implementation uses to invoke the dropped handler callback function for a specific event, the corresponding dropped handler callback function will not be invoked.

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Handling Dropped Events]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Handling Dropped Events]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Handling Dropped Events]]

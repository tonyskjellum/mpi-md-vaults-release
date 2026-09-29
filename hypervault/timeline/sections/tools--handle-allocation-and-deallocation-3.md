---
title: "Handle Allocation and Deallocation"
chapter: tools
present_in: ["MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Handle Allocation and Deallocation

Chapter **tools** · in [[versions/v40/sections/tools#Handle Allocation and Deallocation|MPI-4.0]], [[versions/v41/sections/tools#Handle Allocation and Deallocation|MPI-4.1]], [[versions/v50/sections/tools#Handle Allocation and Deallocation|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

The value of index should be in the range $`0`$ to $`\texttt{num_pvar}-1`$, where $`\texttt{num_pvar}`$ is the number of available performance variables as determined from a prior call to ~~`MPI_T_PVAR_GET_NUM`.~~ ==[[versions/v31/API/MPI_T_PVAR_GET_NUM|MPI_T_PVAR_GET_NUM]] .== The type of the MPI object it references must be consistent with the type returned in the `bind` argument in a prior call to ~~`MPI_T_PVAR_GET_INFO`.~~ ==[[versions/v31/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] .==

~~In~~ ==For all routines in== the ~~case~~ ==rest of this section that take both `handle` and `session` as IN or INOUT arguments, if== the ~~`bind`~~ ==`handle`== argument ~~equals `MPI_T_BIND_NO_OBJECT`,~~ ==passed in is not associated with== the ~~argument `obj_handle`~~ ==`session` argument, `MPI_T_ERR_INVALID_HANDLE`== is ~~ignored.~~ ==returned.==

When a handle is no longer needed, a user of the MPI tool information interface should call ~~`MPI_T_PVAR_HANDLE_FREE`~~ ==[[versions/v31/API/MPI_T_PVAR_HANDLE_FREE|MPI_T_PVAR_HANDLE_FREE]]== to free the handle in the session identified by the parameter `session` and the associated resources in the MPI implementation. On a successful return, MPI sets the handle to `MPI_T_PVAR_HANDLE_NULL`.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

~~Before using a performance variable, a user must first allocate a handle of type `MPI_T_pvar_handle` for the variable by binding it to an MPI object (see also Section [[versions/v40/sections/tools#Binding MPI Tool Information Interface Variables to MPI Objects|Binding MPI Tool Information Interface Variables to MPI Objects]] ).~~

~~![[versions/v40/API/MPI_T_PVAR_HANDLE_ALLOC]]~~

~~This routine binds the performance variable specified by the argument `index` to an MPI object in the session identified by the parameter `session`. The object is passed in the argument `obj_handle` as an address to a local variable that stores the object’s handle. The argument `obj_handle` is ignored if the [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] call for this performance variable returned `MPI_T_BIND_NO_OBJECT` in the argument `bind`. The handle allocated to reference the variable is returned in the argument `handle`. Upon successful return, `count` contains the number of elements (of the datatype returned by a previous [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] call) used to represent this variable.~~

==Before the MPI implementation calls a callback function on the occurrence of a specific event, the user needs to register a callback function to be called for that event type and obtain a handle of type `MPI_T_event_registration`.==

==![[versions/v40/API/MPI_T_EVENT_HANDLE_ALLOC]]==

==[[versions/v40/API/MPI_T_EVENT_HANDLE_ALLOC|MPI_T_EVENT_HANDLE_ALLOC]] creates a *registration handle* for the event type identified by `event_index`. Furthermore, if required by the event type, the registration handle is bound to the object referred to by the argument `obj_handle`. The argument `obj_handle` is ignored if the [[versions/v40/API/MPI_T_EVENT_GET_INFO|MPI_T_EVENT_GET_INFO]] call for this event type returned `MPI_T_BIND_NO_OBJECT` in the argument `bind`. The user can pass hints for the handle allocation to the MPI implementation via the `info` argument. The allocated event-registration handle is returned in the argument `event_registration`.==

==![[versions/v40/API/MPI_T_EVENT_HANDLE_SET_INFO]]==

==[[versions/v40/API/MPI_T_EVENT_HANDLE_SET_INFO|MPI_T_EVENT_HANDLE_SET_INFO]] updates the hints of the event-registration handle associated with `event_registration` using the hints provided in `info`. This operation has no effect on previously set or defaulted hints that are not specified by `info`. It also has no effect on previously set or defaulted hints that are specified by info, but are ignored by the MPI implementation in this call to [[versions/v40/API/MPI_T_EVENT_HANDLE_SET_INFO|MPI_T_EVENT_HANDLE_SET_INFO]] .==

~~> The `count` can be different based on the MPI object to which the performance variable was bound. For example, variables bound to communicators could have a count that matches the size of the communicator. > > It is not portable to pass references to predefined MPI object handles, such as `MPI_COMM_WORLD`, to this routine, since their implementation depends on the MPI library. Instead, such an object handle should be stored in a local variable and the address of this local variable should be passed into [[versions/v40/API/MPI_T_PVAR_HANDLE_ALLOC|MPI_T_PVAR_HANDLE_ALLOC]] .~~

~~The value of index should be in the range $`0`$ to $`\texttt{num_pvar}-1`$, where $`\texttt{num_pvar}`$ is the number of available performance variables as determined from a prior call to [[versions/v40/API/MPI_T_PVAR_GET_NUM|MPI_T_PVAR_GET_NUM]] . The type of the MPI object it references must be consistent with the type returned in the `bind` argument in a prior call to [[versions/v40/API/MPI_T_PVAR_GET_INFO|MPI_T_PVAR_GET_INFO]] .~~

~~For all routines in the rest of this section that take both `handle` and `session` as IN or INOUT arguments, if the `handle` argument passed in is not associated with the `session` argument, `MPI_T_ERR_INVALID_HANDLE` is returned.~~

~~![[versions/v40/API/MPI_T_PVAR_HANDLE_FREE]]~~

~~When a handle is no longer needed, a user of the MPI tool information interface should call [[versions/v40/API/MPI_T_PVAR_HANDLE_FREE|MPI_T_PVAR_HANDLE_FREE]] to free the handle in the session identified by the parameter `session` and the associated resources in the MPI implementation. On a successful return, MPI sets the handle to `MPI_T_PVAR_HANDLE_NULL`.~~

==> Some info items that an implementation can use when it creates an event-registration handle cannot easily be changed once the registration handle is created. Thus, an implementation may ignore hints issued in this call that it would have accepted in a handle allocation call. An implementation may also be unable to update certain info hints in a call to [[versions/v40/API/MPI_T_EVENT_HANDLE_SET_INFO|MPI_T_EVENT_HANDLE_SET_INFO]] . [[versions/v40/API/MPI_T_EVENT_HANDLE_GET_INFO|MPI_T_EVENT_HANDLE_GET_INFO]] can be used to determine whether info changes were ignored by the implementation.==

==![[versions/v40/API/MPI_T_EVENT_HANDLE_GET_INFO]]==

==[[versions/v40/API/MPI_T_EVENT_HANDLE_GET_INFO|MPI_T_EVENT_HANDLE_GET_INFO]] returns a new info object containing the hints of the event-registration handle associated with `event_registration`. The current setting of all hints related to this registration handle is returned in `info_used`. An MPI implementation is required to return all hints that are supported by the implementation and have default values specified; any user-supplied hints that were not ignored by the implementation; and any additional hints that were set by the implementation. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pairs. The user is responsible for freeing `info_used` via [[versions/v40/API/MPI_INFO_FREE|MPI_INFO_FREE]] .==

==![[versions/v40/API/MPI_T_EVENT_REGISTER_CALLBACK]]==

==[[versions/v40/API/MPI_T_EVENT_REGISTER_CALLBACK|MPI_T_EVENT_REGISTER_CALLBACK]] associates a user-defined function pointed to by `event_cb_function` with an allocated event-registration handle. The maximum callback safety level supported by the callback function is passed in the argument `cb_safety`. The safety levels are defined in Table [[versions/v40/sections/tools#Callback Safety Requirements|Callback Safety Requirements]] . A user can register multiple callback functions for a given event-registration handle, potentially specifying one for each callback safety level. Registering a callback function for a specific callback safety level overwrites any previously-registered callback function pointer and info object associated with the event registration for the specific callback safety level. If `event_cb_function` is the `NULL` pointer, an existing association of a callback function for that callback safety level is removed.==

==When an event is triggered, the implementation will select from all registered callbacks the callback with the lowest safety level valid in the context in which the callback is invoked. In situations where the required callback safety level exceeds the highest level for which a callback function is registered for a given registration handle, the event instance is dropped.==

==At callback invocation time, the implementation passes the pointer to a user-defined memory region specified during callback registration with the argument `user_data`.==

==The user can pass hints for the registration of the specified callback function to the MPI implementation via the `info` argument.==

==> [!note] Advice to users==

==> As event instances can be raised as soon as the registration handle is associated with the first callback function, the callback function with the highest callback safety guarantees should be registered before any further registrations for lower callback safety guarantees, to avoid dropped events due to insufficient callback safety guarantees.==

==The callback function passed to [[versions/v40/API/MPI_T_EVENT_REGISTER_CALLBACK|MPI_T_EVENT_REGISTER_CALLBACK]] in the argument `event_cb_function` needs to have the following type:==

==The argument `event_instance` corresponds to a handle for the opaque event-instance object of type `MPI_T_event_instance`. This handle is only valid inside the corresponding invocation of the function to which it is passed. The argument `event_registration` corresponds to the event-registration handle returned by [[versions/v40/API/MPI_T_EVENT_HANDLE_ALLOC|MPI_T_EVENT_HANDLE_ALLOC]] for the user function to the same event type and bound object combination. The handle can be used to identify the specific event registration information, such as event type and bound object, or even to deallocate the handle from within the callback invocation. The argument `cb_safety` describes the safety requirements the callback function must fulfill in the current invocation. The argument `user_data` is the pointer to user-allocated memory that was passed to the MPI implementation during callback registration.==

==![[versions/v40/API/MPI_T_EVENT_CALLBACK_SET_INFO]]==

==[[versions/v40/API/MPI_T_EVENT_CALLBACK_SET_INFO|MPI_T_EVENT_CALLBACK_SET_INFO]] updates the hints of the callback function registered for the callback safety level specified by `cb_safety` of the event-registration handle associated with `event_registration` using the hints provided in `info`. This operation has no effect on previously set or defaulted hints that are not specified by `info`. It also has no effect on previously set or defaulted hints that are specified by info, but are ignored by the MPI implementation in this call to [[versions/v40/API/MPI_T_EVENT_CALLBACK_SET_INFO|MPI_T_EVENT_CALLBACK_SET_INFO]] .==

==![[versions/v40/API/MPI_T_EVENT_CALLBACK_GET_INFO]]==

==[[versions/v40/API/MPI_T_EVENT_CALLBACK_GET_INFO|MPI_T_EVENT_CALLBACK_GET_INFO]] returns a new info object containing the hints of the callback function registered for the callback safety level specified by `cb_safety` of the event-registration handle associated with `event_registration`. The current set of all hints related to this callback safety level of the event-registration handle is returned in `info_used`. An MPI implementation is required to return all hints that are supported by the implementation and have default values specified, any user-supplied hints that were not ignored by the implementation, and any additional hints that were set by the implementation. If no such hints exist, a handle to a newly created info object is returned that contains no key/value pairs. The user is responsible for freeing `info_used` via [[versions/v40/API/MPI_INFO_FREE|MPI_INFO_FREE]] .==

==To stop the MPI implementation from raising events for a specific registration, a user needs to free the corresponding event-registration handle.==

==![[versions/v40/API/MPI_T_EVENT_HANDLE_FREE]]==

==[[versions/v40/API/MPI_T_EVENT_HANDLE_FREE|MPI_T_EVENT_HANDLE_FREE]] returns `MPI_SUCCESS` when deallocation of the handle was initiated successfully and returns `MPI_T_ERR_INVALID_HANDLE` if `event_registration` does not match a valid allocated event-registration handle at the time of the call. The callback function `free_cb_function` is called by the MPI implementation, when it is able to guarantee that no further event instances for the corresponding event-registration handle will be raised. If the pointer to `free_cb_function` is the `NULL` pointer, no user function is invoked after successful deallocation of the event registration handle. The pointer to user-controlled memory provided in the `user_data` argument will be passed to the function provided in the `free_cb_function` on invocation.==

==> [!note] Advice to users==

==> A free-callback function associated with a registration handle should always be prepared to postpone any pending actions, should the provided callback safety requirements exceed those required by the pending actions.==

==The callback function passed to [[versions/v40/API/MPI_T_EVENT_HANDLE_FREE|MPI_T_EVENT_HANDLE_FREE]] in the argument `free_cb_function` needs to have the following type:==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

[[versions/v41/API/MPI_T_EVENT_HANDLE_ALLOC|MPI_T_EVENT_HANDLE_ALLOC]] creates a ~~*registration handle*~~ ==**registration handle**== for the event type identified by `event_index`. Furthermore, if required by the event type, the registration handle is bound to the object referred to by the argument `obj_handle`. The argument `obj_handle` is ignored if the [[versions/v41/API/MPI_T_EVENT_GET_INFO|MPI_T_EVENT_GET_INFO]] call for this event type returned `MPI_T_BIND_NO_OBJECT` in the argument `bind`. The user can pass hints for the handle allocation to the MPI implementation via the `info` argument. The allocated event-registration handle is returned in the argument `event_registration`.

[[versions/v41/API/MPI_T_EVENT_HANDLE_SET_INFO|MPI_T_EVENT_HANDLE_SET_INFO]] updates the hints of the event-registration handle associated with `event_registration` using the hints provided in `info`. ~~This operation~~ ==A call to this procedure== has no effect on previously set or defaulted hints that are not specified by `info`. It also has no effect on previously set or defaulted hints that are specified by info, but are ignored by the MPI implementation in this call to [[versions/v41/API/MPI_T_EVENT_HANDLE_SET_INFO|MPI_T_EVENT_HANDLE_SET_INFO]] .

[[versions/v41/API/MPI_T_EVENT_CALLBACK_SET_INFO|MPI_T_EVENT_CALLBACK_SET_INFO]] updates the hints of the callback function registered for the callback safety level specified by `cb_safety` of the event-registration handle associated with `event_registration` using the hints provided in `info`. ~~This operation~~ ==A call to this procedure== has no effect on previously set or defaulted hints that are not specified by `info`. It also has no effect on previously set or defaulted hints that are specified by info, but are ignored by the MPI implementation in this call to [[versions/v41/API/MPI_T_EVENT_CALLBACK_SET_INFO|MPI_T_EVENT_CALLBACK_SET_INFO]] .

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Handle Allocation and Deallocation]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Handle Allocation and Deallocation]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Handle Allocation and Deallocation]]

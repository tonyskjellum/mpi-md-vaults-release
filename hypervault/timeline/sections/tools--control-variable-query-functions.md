---
title: "Control Variable Query Functions"
chapter: tools
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/tools]
---

# Control Variable Query Functions

Chapter **tools** · in [[versions/v30/sections/tools#Control Variable Query Functions|MPI-3.0]], [[versions/v31/sections/tools#Control Variable Query Functions|MPI-3.1]], [[versions/v40/sections/tools#Control Variable Query Functions|MPI-4.0]], [[versions/v41/sections/tools#Control Variable Query Functions|MPI-4.1]], [[versions/v50/sections/tools#Control Variable Query Functions|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

==If any `OUT` parameter to [[versions/v31/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.==

Returning a description is optional. If an MPI implementation does not ~~to~~ return a description, the first character for `desc` must be set to the null character and `desc_len` must be set to one at the return of this call.

==If the name of a control variable is equivalent across connected processes, the following `OUT` parameters must be identical: `verbosity`, `datatype`, `enumtype`, `bind`, and `scope`. The returned description must be equivalent.==

==![[versions/v31/API/MPI_T_CVAR_GET_INDEX]]==

==[[versions/v31/API/MPI_T_CVAR_GET_INDEX|MPI_T_CVAR_GET_INDEX]] is a function for retrieving the index of a control variable given a known variable name. The `name` parameter is provided by the caller, and `cvar_index` is returned by the MPI implementation. The `name` parameter is a string terminated with a null character.==

==This routine returns `MPI_SUCCESS` on success and returns `MPI_T_ERR_INVALID_NAME` if `name` does not match the name of any control variable provided by the implementation at the time of the call.==

==> [!tip] Rationale==

==> This routine is provided to enable fast retrieval of control variables by a tool, assuming it knows the name of the variable for which it is looking. The number of variables exposed by the implementation can change over time, so it is not possible for the tool to simply iterate over the list of variables once at initialization. Although using MPI implementation specific variable names is not portable across MPI implementations, tool developers may choose to take this route for lower overhead at runtime because the tool will not have to iterate over the entire set of variables to find a specific one.==

### MPI-3.1 → MPI-4.0  (5 changed paragraphs)

The following function can be used to query the number of control variables, ~~$`num_cvar`$:~~ ==$`\texttt{num_cvar}`$:==

If any ~~`OUT`~~ ==OUT== parameter to [[versions/v40/API/MPI_T_CVAR_GET_INFO|MPI_T_CVAR_GET_INFO]] is a `NULL` pointer, the implementation will ignore the parameter and not return a value for the parameter.

The scope of a variable determines whether changing a variable’s value is either local to the ==MPI== process or must be done by the user across multiple ==connected MPI== processes. The latter is further split into variables that require changes in a group of ==MPI== processes and those that require collective changes among all connected ==MPI== processes. Both cases can require ==variables on== all ==participating MPI== processes either to be set to consistent (but potentially different) values or to equal ~~values on every participating process.~~ ==values.== The description provided with the variable must contain an explanation about the requirements and/or restrictions for setting the particular variable.

If the name of a control variable is equivalent across connected ==MPI== processes, the following ~~`OUT`~~ ==OUT== parameters must be identical: `verbosity`, `datatype`, `enumtype`, `bind`, and `scope`. The returned description must be equivalent.

| Scope Constant | Description | ~~|:---|:---|~~ ==|:-----------------------|:---------------------------------------------------|== | `MPI_T_SCOPE_CONSTANT` | read-only, value is constant | | `MPI_T_SCOPE_READONLY` | read-only, cannot be written, but can change | | `MPI_T_SCOPE_LOCAL` | may be writeable, writing is a local operation | | `MPI_T_SCOPE_GROUP` | may be writeable, must be ~~done to a group of processes, | | | all processes in a group must be~~ set to consistent values ==| | | across a group of connected MPI processes== | | `MPI_T_SCOPE_GROUP_EQ` | may be writeable, must be ~~done~~ ==set== to ==the same value | | | across== a group of ~~processes,~~ ==connected MPI processes | | `MPI_T_SCOPE_ALL` | may be writeable, must be set to consistent values== | | | ==across== all ==connected MPI== processes ~~in a group~~ ==| | `MPI_T_SCOPE_ALL_EQ` | may be writeable,== must be set to the same value | | ~~`MPI_T_SCOPE_ALL`~~ | ~~may be writeable, must be done to all processes, | | |~~ ==across== all connected ==MPI== processes ~~must be set to consistent values~~ | ~~| `MPI_T_SCOPE_ALL_EQ` | may be writeable, must be done to all processes, | | | all connected processes must be set to the same value |~~

==Querying and printing the names of all available control variables.==

==    #include <stdio.h>     #include <stdlib.h>     #include <mpi.h>==

==    int main(int argc, char *argv[]) {       int i, err, num, namelen, bind, verbose, scope;       int threadsupport;       char name[100];       MPI_Datatype datatype;==

==      err=MPI_T_init_thread(MPI_THREAD_SINGLE,&threadsupport);       if (err!=MPI_SUCCESS)          return err;==

==      err=MPI_T_cvar_get_num(&num);       if (err!=MPI_SUCCESS)          return err;==

==      for (i=0; i<num; i++) {         namelen=100;         err=MPI_T_cvar_get_info(i, name, &namelen,                 &verbose, &datatype, NULL,                 NULL, NULL, /*no description */                 &bind, &scope);         if (err!=MPI_SUCCESS && err!=MPI_T_ERR_INVALID_INDEX) return err;         printf("Var %i: %s\n", i, name);       }==

==      err=MPI_T_finalize();       if (err!=MPI_SUCCESS)          return 1;       else         return 0;     }==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

An MPI implementation is allowed to increase the number of control variables during the execution of an MPI application when new variables become available through dynamic loading. However, MPI implementations are not allowed to change the index of a control variable or to delete a variable once it has been added to the set. When a variable becomes inactive, e.g., through dynamic unloading, accessing its value should return a corresponding ~~error~~ ==return== code.

| ~~Scope Constant~~ ==**Scope Constant**== | ~~Description~~ ==**Description**== | |:-----------------------|:---------------------------------------------------| | `MPI_T_SCOPE_CONSTANT` | read-only, value is constant | | `MPI_T_SCOPE_READONLY` | read-only, cannot be written, but can change | | `MPI_T_SCOPE_LOCAL` | may be writeable, writing ~~is a local operation~~ ==only affects the calling | | | MPI process== | | `MPI_T_SCOPE_GROUP` | may be writeable, must be set to consistent values | | | across a group of connected MPI processes | | `MPI_T_SCOPE_GROUP_EQ` | may be writeable, must be set to the same value | | | across a group of connected MPI processes | | `MPI_T_SCOPE_ALL` | may be writeable, must be set to consistent values | | | across all connected MPI processes | | `MPI_T_SCOPE_ALL_EQ` | may be writeable, must be set to the same value | | | across all connected MPI processes |

~~    #include <stdio.h>     #include <stdlib.h>     #include <mpi.h>~~

~~    int main(int argc, char *argv[]) {       int i, err, num, namelen, bind, verbose, scope;       int threadsupport;       char name[100];       MPI_Datatype datatype;~~

~~      err=MPI_T_init_thread(MPI_THREAD_SINGLE,&threadsupport);       if (err!=MPI_SUCCESS)          return err;~~

~~      err=MPI_T_cvar_get_num(&num);       if (err!=MPI_SUCCESS)          return err;~~

~~      for (i=0; i<num; i++) {         namelen=100;         err=MPI_T_cvar_get_info(i, name, &namelen,                 &verbose, &datatype, NULL,                 NULL, NULL, /*no description */                 &bind, &scope);         if (err!=MPI_SUCCESS && err!=MPI_T_ERR_INVALID_INDEX) return err;         printf("Var %i: %s\n", i, name);       }~~

~~      err=MPI_T_finalize();       if (err!=MPI_SUCCESS)          return 1;       else         return 0;     }~~

==(code block added)==
``` [MPI]C
#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>

int main(int argc, char *argv[]) {
    int  i, err, num, namelen, bind, verbose, scope;
    int  threadsupport;
    char name[100];

    MPI_Datatype datatype;

    err=MPI_T_init_thread(MPI_THREAD_SINGLE, &threadsupport);
    if (err!=MPI_SUCCESS)
        return err;

    err=MPI_T_cvar_get_num(&num);
    if (err!=MPI_SUCCESS)
        return err;

    for (i=0; i<num; i++) {
        namelen=100;
        err=MPI_T_cvar_get_info(i, name, &namelen,
                                &verbose, &datatype, NULL,
                                NULL, NULL, /*no description */
                                &bind, &scope);
        if (err!=MPI_SUCCESS && err!=MPI_T_ERR_INVALID_INDEX)
            return err;
        printf("Var %i: %s\n", i, name);
    }

    err=MPI_T_finalize();
    if (err!=MPI_SUCCESS)
        return 1;
    else
        return 0;
}
```

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/tools#Control Variable Query Functions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/tools#Control Variable Query Functions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Control Variable Query Functions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/tools#Control Variable Query Functions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/tools#Control Variable Query Functions]]

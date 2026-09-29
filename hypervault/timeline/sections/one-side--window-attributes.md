---
title: "Window Attributes"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Window Attributes

Chapter **one-side** · in [[versions/v20/sections/one-side#Window Attributes|MPI-2.0]], [[versions/v21/sections/one-side#Window Attributes|MPI-2.1]], [[versions/v22/sections/one-side#Window Attributes|MPI-2.2]], [[versions/v30/sections/one-side#Window Attributes|MPI-3.0]], [[versions/v31/sections/one-side#Window Attributes|MPI-3.1]], [[versions/v40/sections/one-side#Window Attributes|MPI-4.0]], [[versions/v41/sections/one-side#Window Attributes|MPI-4.1]], [[versions/v50/sections/one-side#Window Attributes|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

In C, calls to ~~[[versions/v21/API/MPI_WIN_GET_ATTR|MPI_Win_get_attr]] ,~~ ==`MPI_Win_get_attr(win, MPI_WIN_BASE, &base, &flag)`,==

~~[[versions/v21/API/MPI_WIN_GET_ATTR|MPI_Win_get_attr]]~~ ==`MPI_Win_get_attr(win, MPI_WIN_SIZE, &size, &flag)`== and

~~[[versions/v21/API/MPI_WIN_GET_ATTR|MPI_Win_get_attr]]~~ ==`MPI_Win_get_attr(win, MPI_WIN_DISP_UNIT, &disp_unit, &flag)`== will return in `base` a pointer to the start of the window `win`, and will return in `size` and `disp_unit` pointers to the size and displacement unit of the window, respectively. And similarly, in C++.

~~[[versions/v21/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] will return in `base, size` and `disp_unit` the (integer representation of) the base address, the size and the displacement unit of the window `win`, respectively. (The window attribute access functions are defined in Section [[versions/v21/sections/ei#New Attribute Caching Functions|New Attribute Caching Functions]] , page [[versions/v21/sections/ei#New Attribute Caching Functions|New Attribute Caching Functions]] .)~~

==[[versions/v21/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] will return in `base, size` and `disp_unit` the (integer representation of) the base address, the size and the displacement unit of the window `win`, respectively. (The window attribute access functions are defined in==

==Section [[versions/v21/sections/context#Windows|Windows]] , page [[versions/v21/sections/context#Windows|Windows]] .)==

### MPI-2.2 → MPI-3.0  (5 changed paragraphs)

The following ~~three~~ attributes are cached with a ~~window,~~ ==window== when the window is created.

==how the window was created.==

==memory model for window.==

~~`MPI_Win_get_attr(win, MPI_WIN_SIZE, &size, &flag)` and~~

~~`MPI_Win_get_attr(win, MPI_WIN_DISP_UNIT, &disp_unit, &flag)` will return in `base` a pointer to the start of the window `win`, and will return in `size` and `disp_unit` pointers to the size and displacement unit of the window, respectively. And similarly, in C++.~~

==`MPI_Win_get_attr(win, MPI_WIN_SIZE, &size, &flag)`,==

==`MPI_Win_get_attr(win, MPI_WIN_DISP_UNIT, &disp_unit, &flag)`,==

==`MPI_Win_get_attr(win, MPI_WIN_CREATE_FLAVOR, &create_kind, &flag)`, and==

==`MPI_Win_get_attr(win, MPI_WIN_MODEL, &memory_model, &flag)`==

==will return in `base` a pointer to the start of the window `win`, and will return in `size`, `disp_unit`, `create_kind`, and `memory_model` pointers to the size, displacement unit of the window, the kind of routine used to create the window, and the memory model, respectively.==

==A detailed listing of the type of the pointer in the attribute value argument to [[versions/v30/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] and [[versions/v30/API/MPI_WIN_SET_ATTR|MPI_WIN_SET_ATTR]] is shown in Table [[versions/v30/sections/one-side#Window Attributes|Window Attributes]] .==

==| **Attribute**           | **C Type**  | |:------------------------|:------------| | `MPI_WIN_BASE`          | void \*     | | `MPI_WIN_SIZE`          | MPI_Aint \* | | `MPI_WIN_DISP_UNIT`     | int \*      | | `MPI_WIN_CREATE_FLAVOR` | int \*      | | `MPI_WIN_MODEL`         | int \*      |==

==C types of attribute value argument to [[versions/v30/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] and [[versions/v30/API/MPI_WIN_SET_ATTR|MPI_WIN_SET_ATTR]] .==

~~[[versions/v30/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] and~~

~~[[versions/v30/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] will return in `base, size` and `disp_unit` the (integer representation of) the base address, the size and the displacement unit of the window `win`, respectively. (The window attribute access functions are defined in~~

~~Section [[versions/v30/sections/context#Windows|Windows]] , page [[versions/v30/sections/context#Windows|Windows]] .)~~

==[[versions/v30/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] ,==

==[[versions/v30/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] ,==

==`MPI_WIN_GET_ATTR(win, MPI_WIN_CREATE_FLAVOR, create_kind, flag, ierror)`, and==

==`MPI_WIN_GET_ATTR(win, MPI_WIN_MODEL, memory_model, flag, ierror)`==

==will return in `base`, `size`, `disp_unit`, `create_kind`, and `memory_model` the (integer representation of) the base address, the size, the displacement unit of the window `win`, the kind of routine used to create the window, and the memory model, respectively.==

==The values of `create_kind` are==

==0pt==

==Window was created with [[versions/v30/API/MPI_WIN_CREATE|MPI_WIN_CREATE]] .==

==Window was created with [[versions/v30/API/MPI_WIN_ALLOCATE|MPI_WIN_ALLOCATE]] .==

==Window was created with [[versions/v30/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] .==

==Window was created with [[versions/v30/API/MPI_WIN_ALLOCATE_SHARED|MPI_WIN_ALLOCATE_SHARED]] .==

==The values of `memory_model` are `MPI_WIN_SEPARATE` and `MPI_WIN_UNIFIED`. The meaning of these is described in Section [[versions/v30/sections/one-side#Memory Model|Memory Model]] .==

==In the case of windows created with [[versions/v30/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , the base address is `MPI_BOTTOM` and the size is $`0`$. In C, pointers are returned, and in Fortran, the values are returned, for the respective attributes.==

==(The window attribute access functions are defined in Section [[versions/v30/sections/context#Windows|Windows]] , page [[versions/v30/sections/context#Windows|Windows]] .) The value returned for an attribute on a window is constant over the lifetime of the window.==

`MPI_WIN_GET_GROUP` returns a duplicate of the group of the communicator used to create the ~~window.~~ ==window== associated with `win`. The group is returned in `group`.

### MPI-3.0 → MPI-3.1  (5 changed paragraphs)

~~`MPI_Win_get_attr(win, MPI_WIN_MODEL, &memory_model, &flag)`~~

~~will return in `base` a pointer to the start of the window `win`, and will return in `size`, `disp_unit`, `create_kind`, and `memory_model` pointers to the size, displacement unit of the window, the kind of routine used to create the window, and the memory model, respectively.~~

==`MPI_Win_get_attr(win, MPI_WIN_MODEL, &memory_model, &flag)` will return in `base` a pointer to the start of the window `win`, and will return in `size`, `disp_unit`, `create_kind`, and `memory_model` pointers to the size, displacement unit of the window, the kind of routine used to create the window, and the memory model, respectively.==

~~`MPI_WIN_GET_ATTR(win, MPI_WIN_MODEL, memory_model, flag, ierror)`~~

~~will return in `base`, `size`, `disp_unit`, `create_kind`, and `memory_model` the (integer representation of) the base address, the size, the displacement unit of the window `win`, the kind of routine used to create the window, and the memory model, respectively.~~

==`MPI_WIN_GET_ATTR(win, MPI_WIN_MODEL, memory_model, flag, ierror)` will return in `base`, `size`, `disp_unit`, `create_kind`, and `memory_model` the (integer representation of) the base address, the size, the displacement unit of the window `win`, the kind of routine used to create the window, and the memory model, respectively.==

~~0pt~~

~~In the case of windows created with [[versions/v31/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , the base address is `MPI_BOTTOM` and the size is $`0`$. In C, pointers are returned, and in Fortran, the values are returned, for the respective attributes.~~

~~(The window attribute access functions are defined in Section [[versions/v31/sections/context#Windows|Windows]] , page [[versions/v31/sections/context#Windows|Windows]] .) The value returned for an attribute on a window is constant over the lifetime of the window.~~

==In the case of windows created with [[versions/v31/API/MPI_WIN_CREATE_DYNAMIC|MPI_WIN_CREATE_DYNAMIC]] , the base address is `MPI_BOTTOM` and the size is $`0`$. In C, pointers are returned, and in Fortran, the values are returned, for the respective attributes. (The window attribute access functions are defined in [[versions/v31/sections/context#Windows|Windows]] .) The value returned for an attribute on a window is constant over the lifetime of the window.==

~~`MPI_WIN_GET_GROUP`~~ ==[[versions/v31/API/MPI_WIN_GET_GROUP|MPI_WIN_GET_GROUP]]== returns a duplicate of the group of the communicator used to create the window associated with `win`. The group is returned in `group`.

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

| **Attribute** | **C Type** | ~~|:------------------------|:------------|~~ ==|:------------------------|:-------------|== | `MPI_WIN_BASE` | ~~void \*~~ ==`void *`== | | `MPI_WIN_SIZE` | ~~MPI_Aint \*~~ ==`MPI_Aint *`== | | `MPI_WIN_DISP_UNIT` | ~~int \*~~ ==`int *`== | | `MPI_WIN_CREATE_FLAVOR` | ~~int \*~~ ==`int *`== | | `MPI_WIN_MODEL` | ~~int \*~~ ==`int *`== |

C types of attribute value argument to [[versions/v40/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] and [[versions/v40/API/MPI_WIN_SET_ATTR|MPI_WIN_SET_ATTR]] ~~.~~

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

In C, calls ~~to~~ ==such as== `MPI_Win_get_attr(win, MPI_WIN_BASE, &base, &flag)`,

`MPI_Win_get_attr(win, MPI_WIN_CREATE_FLAVOR, ~~&create_kind,~~ ==&create_flavor,== &flag)`, and

`MPI_Win_get_attr(win, MPI_WIN_MODEL, &memory_model, &flag)` will return in `base` a pointer to the start of the window ~~`win`,~~ ==`win`== and ~~will return~~ in `size`, `disp_unit`, `create_kind`, and `memory_model` pointers to the ~~size,~~ ==size of the window, the== displacement unit of the window, the ~~kind~~ ==flavor== of ~~routine used to create~~ the window, and the memory ~~model,~~ ==model of the window,== respectively.

In Fortran, calls ~~to [[versions/v41/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] ,~~ ==such as `MPI_WIN_GET_ATTR(win, MPI_WIN_BASE, base, flag, ierror)`,==

~~[[versions/v41/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] ,~~ ==`MPI_WIN_GET_ATTR(win, MPI_WIN_SIZE, size, flag, ierror)`,==

~~[[versions/v41/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] ,~~ ==`MPI_WIN_GET_ATTR(win, MPI_WIN_DISP_UNIT, disp_unit, flag, ierror)`,==

`MPI_WIN_GET_ATTR(win, MPI_WIN_CREATE_FLAVOR, ~~create_kind,~~ ==create_flavor,== flag, ierror)`, and

`MPI_WIN_GET_ATTR(win, MPI_WIN_MODEL, memory_model, flag, ierror)` will return in `base`, `size`, `disp_unit`, `create_kind`, and `memory_model` the (integer representation of) the base ~~address,~~ ==address of== the ~~size,~~ ==window, the size of the window,== the displacement unit of the ~~window `win`,~~ ==window,== the ~~kind~~ ==flavor== of ~~routine used to create~~ the window, and the memory ~~model,~~ ==model of the window,== respectively.

The other “window attribute,” namely the group of ==MPI== processes attached to the window, can be retrieved using the call below.

[[versions/v41/API/MPI_WIN_GET_GROUP|MPI_WIN_GET_GROUP]] returns ==in `group`== a duplicate of the group of the communicator used to create the window associated with `win`. ~~The group is returned in `group`.~~

### MPI-4.1 → MPI-5.0  (3 changed paragraphs)

`MPI_Win_get_attr(win, MPI_WIN_MODEL, &memory_model, &flag)` will return in `base` a pointer to the start of the window `win` and in `size`, `disp_unit`, ~~`create_kind`,~~ ==`create_flavor`,== and `memory_model` pointers to the size of the window, the displacement unit of the window, the flavor of the window, and the memory model of the window, respectively.

| **Attribute** | **C Type** | ~~|:------------------------|:-------------|~~ ==|:------------------------|:--------------|== | `MPI_WIN_BASE` | `void *` | | `MPI_WIN_SIZE` | ~~`MPI_Aint *`~~ ==`MPI_Aint``*`== | | `MPI_WIN_DISP_UNIT` | `int *` | | `MPI_WIN_CREATE_FLAVOR` | `int *` | | `MPI_WIN_MODEL` | `int *` |

`MPI_WIN_GET_ATTR(win, MPI_WIN_MODEL, memory_model, flag, ierror)` will return in `base`, `size`, `disp_unit`, ~~`create_kind`,~~ ==`create_flavor`,== and `memory_model` the (integer representation of) the base address of the window, the size of the window, the displacement unit of the window, the flavor of the window, and the memory model of the window, respectively.

The values of ~~`create_kind`~~ ==`create_flavor`== are

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Window Attributes]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Window Attributes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Window Attributes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Window Attributes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Window Attributes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Window Attributes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Window Attributes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Window Attributes]]

---
title: "Error Class for Invalid Keyval"
chapter: context
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/context]
---

# Error Class for Invalid Keyval

Chapter **context** · in [[versions/v21/sections/context#Error Class for Invalid Keyval|MPI-2.1]], [[versions/v22/sections/context#Error Class for Invalid Keyval|MPI-2.2]], [[versions/v30/sections/context#Error Class for Invalid Keyval|MPI-3.0]], [[versions/v31/sections/context#Error Class for Invalid Keyval|MPI-3.1]], [[versions/v40/sections/context#Error Class for Invalid Keyval|MPI-4.0]], [[versions/v41/sections/context#Error Class for Invalid Keyval|MPI-4.1]], [[versions/v50/sections/context#Error Class for Invalid Keyval|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

~~`MPI\_{TYPE,COMM,WIN}\_CREATE_KEYVAL`~~ ==`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_CREATE_KEYVAL`== . Only such values can be passed to the functions that use key values as input arguments. In order to signal that an erroneous key value has been passed to one of these functions, there is a new MPI error class: `MPI_ERR_KEYVAL`. It can be

~~`MPI\_{TYPE,COMM,WIN}\_DELETE_ATTR`~~ ==`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_DELETE_ATTR`== , ~~`MPI\_{TYPE,COMM,WIN}\_SET_ATTR`~~ ==`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_SET_ATTR`== , ~~`MPI\_{TYPE,COMM,WIN}\_GET_ATTR`~~ ==`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_GET_ATTR`== , ~~`MPI\_{TYPE,COMM,WIN}\_FREE_KEYVAL`~~ ==`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_FREE_KEYVAL`== ,

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_CREATE_KEYVAL` . Only such values can be passed to the functions that use key values as input arguments. In order to signal that an erroneous key value has been passed to one of these functions, there is a new MPI error class: `MPI_ERR_KEYVAL`. It can be~~

~~returned by [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] , [[versions/v30/API/MPI_ATTR_GET|MPI_ATTR_GET]] , [[versions/v30/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] , [[versions/v30/API/MPI_KEYVAL_FREE|MPI_KEYVAL_FREE]] ,~~

~~`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_DELETE_ATTR` , `MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_SET_ATTR` , `MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_GET_ATTR` , `MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_FREE_KEYVAL` ,~~

~~[[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] , [[versions/v30/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , and [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] . The last three are included~~

~~because `keyval` is an argument to the copy and delete functions for attributes.~~

==`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_CREATE_KEYVAL` . Only such values can be passed to the functions that use key values as input arguments. In order to signal that an erroneous key value has been passed to one of these functions, there is a new MPI error class: `MPI_ERR_KEYVAL`. It can be returned by [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] , [[versions/v30/API/MPI_ATTR_GET|MPI_ATTR_GET]] , [[versions/v30/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] , [[versions/v30/API/MPI_KEYVAL_FREE|MPI_KEYVAL_FREE]] ,==

==`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_DELETE_ATTR` , `MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_SET_ATTR` , `MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_GET_ATTR` , `MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_FREE_KEYVAL` , [[versions/v30/API/MPI_COMM_DUP|MPI_COMM_DUP]] , [[versions/v30/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v30/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , and [[versions/v30/API/MPI_COMM_FREE|MPI_COMM_FREE]] . The last four are included because `keyval` is an argument to the copy and delete functions for attributes.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

`MPI\_<span ~~class="roman">{</span>TYPE,COMM,WIN<span~~ ==class="roman">{</span>XXX<span== class="roman">}</span>\_CREATE_KEYVAL` . Only such values can be passed to the functions that use key values as input arguments. In order to signal that an erroneous key value has been passed to one of these functions, there is a new MPI error class: `MPI_ERR_KEYVAL`. It can be returned by [[versions/v40/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] , [[versions/v40/API/MPI_ATTR_GET|MPI_ATTR_GET]] , [[versions/v40/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] , [[versions/v40/API/MPI_KEYVAL_FREE|MPI_KEYVAL_FREE]] ,

`MPI\_<span ~~class="roman">{</span>TYPE,COMM,WIN<span~~ ==class="roman">{</span>XXX<span== class="roman">}</span>\_DELETE_ATTR` , `MPI\_<span ~~class="roman">{</span>TYPE,COMM,WIN<span~~ ==class="roman">{</span>XXX<span== class="roman">}</span>\_SET_ATTR` , `MPI\_<span ~~class="roman">{</span>TYPE,COMM,WIN<span~~ ==class="roman">{</span>XXX<span== class="roman">}</span>\_GET_ATTR` , `MPI\_<span ~~class="roman">{</span>TYPE,COMM,WIN<span~~ ==class="roman">{</span>XXX<span== class="roman">}</span>\_FREE_KEYVAL` , [[versions/v40/API/MPI_COMM_DUP|MPI_COMM_DUP]] , [[versions/v40/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] ==, [[versions/v40/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , [[versions/v40/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]]== , [[versions/v40/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , and [[versions/v40/API/MPI_COMM_FREE|MPI_COMM_FREE]] . The last ~~four~~ ==six== are included because `keyval` is an argument to the copy and delete functions for attributes.

### MPI-4.0 → MPI-4.1  (1 changed paragraph)

~~`MPI\_<span class="roman">{</span>XXX<span class="roman">}</span>\_CREATE_KEYVAL`~~ ==`MPI\_{XXX}\_CREATE_KEYVAL`== . Only such values can be passed to the functions that use key values as input arguments. In order to signal that an erroneous key value has been passed to one of these functions, there is a new MPI error class: `MPI_ERR_KEYVAL`. It can be returned by [[versions/v41/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] , [[versions/v41/API/MPI_ATTR_GET|MPI_ATTR_GET]] , [[versions/v41/API/MPI_ATTR_DELETE|MPI_ATTR_DELETE]] , [[versions/v41/API/MPI_KEYVAL_FREE|MPI_KEYVAL_FREE]] ,

~~`MPI\_<span class="roman">{</span>XXX<span class="roman">}</span>\_DELETE_ATTR`~~ ==`MPI\_{XXX}\_DELETE_ATTR`== , ~~`MPI\_<span class="roman">{</span>XXX<span class="roman">}</span>\_SET_ATTR`~~ ==`MPI\_{XXX}\_SET_ATTR`== , ~~`MPI\_<span class="roman">{</span>XXX<span class="roman">}</span>\_GET_ATTR`~~ ==`MPI\_{XXX}\_GET_ATTR`== , ~~`MPI\_<span class="roman">{</span>XXX<span class="roman">}</span>\_FREE_KEYVAL`~~ ==`MPI\_{XXX}\_FREE_KEYVAL`== , [[versions/v41/API/MPI_COMM_DUP|MPI_COMM_DUP]] , [[versions/v41/API/MPI_COMM_IDUP|MPI_COMM_IDUP]] , [[versions/v41/API/MPI_COMM_DUP_WITH_INFO|MPI_COMM_DUP_WITH_INFO]] , [[versions/v41/API/MPI_COMM_IDUP_WITH_INFO|MPI_COMM_IDUP_WITH_INFO]] , [[versions/v41/API/MPI_COMM_DISCONNECT|MPI_COMM_DISCONNECT]] , and [[versions/v41/API/MPI_COMM_FREE|MPI_COMM_FREE]] . The last six are included because `keyval` is an argument to the copy and delete functions for attributes.

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/context#Error Class for Invalid Keyval]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/context#Error Class for Invalid Keyval]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/context#Error Class for Invalid Keyval]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/context#Error Class for Invalid Keyval]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/context#Error Class for Invalid Keyval]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/context#Error Class for Invalid Keyval]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/context#Error Class for Invalid Keyval]]

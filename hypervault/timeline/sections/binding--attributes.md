---
title: "Attributes"
chapter: binding
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/binding]
---

# Attributes

Chapter **binding** · in [[versions/v21/sections/binding#Attributes|MPI-2.1]], [[versions/v22/sections/binding#Attributes|MPI-2.2]], [[versions/v30/sections/binding#Attributes|MPI-3.0]], [[versions/v31/sections/binding#Attributes|MPI-3.1]], [[versions/v40/sections/binding#Attributes|MPI-4.0]], [[versions/v41/sections/binding#Attributes|MPI-4.1]], [[versions/v50/sections/binding#Attributes|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (10 changed paragraphs)

Attribute keys can be allocated in one language and freed in another. Similarly, attribute values can be set in one language and accessed in another. To achieve this, attribute keys will be allocated in an integer range that is valid all languages. The same holds true for system-defined attribute values (such as ~~MPI_TAG_UB, MPI_WTIME_IS_GLOBAL,~~ ==`MPI_TAG_UB`, `MPI_WTIME_IS_GLOBAL`,== etc.)

(the functions provided by the ~~`MPI\_{TYPE,COMM,WIN}\_CREATE_KEYVAL`~~ ==`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_CREATE_KEYVAL`== call). When a communicator is duplicated, for each attribute, the corresponding copy function is called, using the right calling convention for the language of that function; and similarly, for the delete callback function.

MPI ~~will store,~~ ==behaves as if it stores,== internally, address sized attributes. If Fortran `INTEGER`s are smaller, then the Fortran function [[versions/v22/API/MPI_ATTR_GET|MPI_ATTR_GET]] will return the least significant part of the attribute word; the Fortran function [[versions/v22/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] will set the least significant part of the attribute word, which will be sign extended to the entire word. (These two functions may be invoked explicitly by user code, or implicitly, by attribute copying callback functions.)

~~MPI supports two types of attributes: address-valued (pointer) attributes, and integer valued attributes. C and C++ attribute functions put and get address valued attributes. Fortran attribute functions put and get integer valued attributes. When an integer valued attribute is accessed from C or C++, then `MPI_xxx_get_attr` will return the address of (a pointer to) the integer valued attribute. When an address valued attribute is accessed from Fortran, then `MPI_xxx_GET_ATTR` will convert the address into an integer and return the result of this conversion. This conversion is lossless if new~~

==MPI supports two types of attributes: address-valued (pointer) attributes, and integer valued attributes. C and C++ attribute functions put and get address valued attributes. Fortran attribute functions put and get integer valued attributes. When an integer valued attribute is accessed from C or C++, then `MPI_xxx_get_attr` will return the address of (a pointer to) the integer valued attribute, which is a pointer to==

==`MPI_Aint` if the attribute was stored with Fortran==

==[[MPI_xxx_SET_ATTR]] , and a pointer to `int` if it was stored with the deprecated Fortran [[versions/v22/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] . When an address valued attribute is accessed from==

==Fortran, then [[MPI_xxx_GET_ATTR]] will convert the address into an integer and return the result of this conversion. This conversion is lossless if new==

attribute functions are used, and an integer of kind ~~MPI_ADDRESS_KIND~~ ==`MPI_ADDRESS_KIND`== is returned. The conversion may cause truncation if

~~attribute functions are used.~~

~~A. C to Fortran~~

~~      C code~~

~~    static int i = 5;     void *p;     p = &i;     MPI_Comm_put_attr(..., p);     ....~~

~~     Fortran code~~

~~    INTEGER(kind = MPI_ADDRESS_KIND) val     CALL MPI_COMM_GET_ATTR(...,val,...)     IF(val.NE.address_of_i) THEN CALL ERROR~~

~~B. Fortran to C~~

~~       Fortran code~~

~~    INTEGER(kind=MPI_ADDRESS_KIND) val     val = 55555     CALL MPI_COMM_PUT_ATTR(...,val,ierr)~~

~~       C code~~

~~    int *p;     MPI_Comm_get_attr(...,&p, ...);     if (*p != 55555) error();~~

~~The predefined MPI attributes can be integer valued or address valued. Predefined integer valued attributes, such as MPI_TAG_UB, behave as if they were put by a Fortran call,~~

==attribute functions are used. In C, the deprecated routines==

==`MPI_Attr_put` and `MPI_Attr_get` behave identical==

==to `MPI_Comm_set_attr` and `MPI_Comm_get_attr`.==

==A. Setting an attribute value in C==

==    int set_val = 3;     struct foo set_struct;==

==    /* Set a value that is a pointer to an int */==

==    MPI_Comm_set_attr(MPI_COMM_WORLD, keyval1, &set_val);     /* Set a value that is a pointer to a struct */     MPI_Comm_set_attr(MPI_COMM_WORLD, keyval2, &set_struct);     /* Set an integer value */     MPI_Comm_set_attr(MPI_COMM_WORLD, keyval3, (void *) 17);==

==B. Reading the attribute value in C==

==    int flag, *get_val;     struct foo *get_struct;==

==    /* Upon successful return, get_val == &set_val         (and therefore *get_val == 3) */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval1, &get_val, &flag);     /* Upon successful return, get_struct == &set_struct */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval2, &get_struct, &flag);     /* Upon successful return, get_val == (void*) 17 */     /*        i.e., (MPI_Aint) get_val == 17 */      MPI_Comm_get_attr(MPI_COMM_WORLD, keyval3, &get_val, &flag);==

==C. Reading the attribute value with (deprecated) Fortran MPI-1 calls==

==    LOGICAL FLAG     INTEGER IERR, GET_VAL, GET_STRUCT ==

==    ! Upon successful return, GET_VAL == &set_val, possibly truncated     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL1, GET_VAL, FLAG, IERR)     ! Upon successful return, GET_STRUCT == &set_struct, possibly truncated     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL2, GET_STRUCT, FLAG, IERR)     ! Upon successful return, GET_VAL == 17     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL3, GET_VAL, FLAG, IERR)==

==D. Reading the attribute value with Fortran MPI-2 calls==

==    LOGICAL FLAG     INTEGER IERR     INTEGER (KIND=MPI_ADDRESS_KIND) GET_VAL, GET_STRUCT ==

==    ! Upon successful return, GET_VAL == &set_val     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL1, GET_VAL, FLAG, IERR)     ! Upon successful return, GET_STRUCT == &set_struct     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL2, GET_STRUCT, FLAG, IERR)     ! Upon successful return, GET_VAL == 17     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL3, GET_VAL, FLAG, IERR)==

==A. Setting an attribute value with the (deprecated) Fortran MPI-1 call==

==    INTEGER IERR, VAL     VAL = 7     CALL MPI_ATTR_PUT(MPI_COMM_WORLD, KEYVAL, VAL, IERR)==

==B. Reading the attribute value in C==

==    int flag;     int *value;==

==    /* Upon successful return, value points to internal MPI storage and        *value == (int) 7 */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval, &value, &flag);==

==C. Reading the attribute value with (deprecated) Fortran MPI-1 calls==

==    LOGICAL FLAG     INTEGER IERR, VALUE==

==    ! Upon successful return, VALUE == 7     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL, VALUE, FLAG, IERR)==

==D. Reading the attribute value with Fortran MPI-2 calls==

==    LOGICAL FLAG     INTEGER IERR     INTEGER (KIND=MPI_ADDRESS_KIND) VALUE==

==    ! Upon successful return, VALUE == 7 (sign extended)     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL, VALUE, FLAG, IERR)==

==A. Setting an attribute value via a Fortran MPI-2 call==

==    INTEGER IERR     INTEGER(KIND=MPI_ADDRESS_KIND) VALUE1     INTEGER(KIND=MPI_ADDRESS_KIND) VALUE2     VALUE1 = 42     VALUE2 = INT(2, KIND=MPI_ADDRESS_KIND) ** 40==

==    CALL MPI_COMM_SET_ATTR(MPI_COMM_WORLD, KEYVAL1, VALUE1, IERR)     CALL MPI_COMM_SET_ATTR(MPI_COMM_WORLD, KEYVAL2, VALUE2, IERR)==

==B. Reading the attribute value in C==

==    int flag;     MPI_Aint *value1, *value2;==

==    /* Upon successful return, value1 points to internal MPI storage and        *value1 == 42 */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval1, &value1, &flag);     /* Upon successful return, value2 points to internal MPI storage and        *value2 == 2^40 */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval2, &value2, &flag);==

==C. Reading the attribute value with (deprecated) Fortran MPI-1 calls==

==    LOGICAL FLAG     INTEGER IERR, VALUE1, VALUE2==

==    ! Upon successful return, VALUE1 == 42     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL1, VALUE1, FLAG, IERR)     ! Upon successful return, VALUE2 == 2^40, or 0 if truncation     ! needed (i.e., the least significant part of the attribute word)     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL2, VALUE2, FLAG, IERR)==

==D. Reading the attribute value with Fortran MPI-2 calls==

==    LOGICAL FLAG     INTEGER IERR     INTEGER (KIND=MPI_ADDRESS_KIND) VALUE1, VALUE2==

==    ! Upon successful return, VALUE1 == 42     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL1, VALUE1, FLAG, IERR)     ! Upon successful return, VALUE2 == 2^40     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL2, VALUE2, FLAG, IERR)==

==The predefined MPI attributes can be integer valued or address valued. Predefined integer valued attributes, such as `MPI_TAG_UB`, behave as if they were put by a call to the deprecated Fortran routine [[versions/v22/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] ,==

~~in Fortran, [[versions/v22/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] will return in val the upper bound for tag value; in C, `MPI_Comm_get_attr(MPI_COMM_WORLD, MPI_TAG_UB, &p, &flag)` will return in `p` a pointer to an int containing the upper bound for tag value.~~

~~Address valued predefined attributes, such as MPI_WIN_BASE behave as if they were put by a C call,~~

==in Fortran, [[versions/v22/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] will return in val the upper bound for tag value; in C,==

==`MPI_Comm_get_attr(MPI_COMM_WORLD, MPI_TAG_UB, &p, &flag)` will return in `p` a pointer to an int containing the upper bound for tag value.==

==Address valued predefined attributes, such as `MPI_WIN_BASE` behave as if they were put by a C call,==

~~in Fortran, [[versions/v22/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] will return in val the base address of the window, converted to an integer. In C, `MPI_Win_get_attr(win, MPI_WIN_BASE, &p, &flag)` will return in `p` a pointer to the window base, cast to `(void *)`.~~

==in Fortran, [[versions/v22/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] will return in val the base address of the window, converted to an integer. In C,==

==`MPI_Win_get_attr(win, MPI_WIN_BASE, &p, &flag)` will return in `p` a pointer to the window base, cast to `(void *)`.==

> The design is consistent with the behavior > > specified > > for predefined attributes, and ensures that no information is lost when attributes are passed from language to language. ==Because the language interoperability for predefined attributes was defined based on [[versions/v22/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] , this definition is kept for compatibility reasons although the routine itself is now deprecated.==

> Implementations should tag attributes either as ==(1)== address ==attributes, (2) as `INTEGER(KIND=MPI_ADDRESS_KIND)`== attributes or ==(3)== as ~~integer~~ ==`INTEGER`== attributes, according to whether they were set in ==(1)== C ==(with `MPI_Attr_put`== or ==> > `MPI_Xxx_set_attr`), (2)== in ~~Fortran.~~ ==Fortran with `MPI_XXX_SET_ATTR` or (3) with the deprecated Fortran > > routine `MPI_ATTR_PUT`.== Thus, the right choice can be made when the attribute is retrieved.

### MPI-2.2 → MPI-3.0  (8 changed paragraphs)

Attribute keys can be allocated in one language and freed in another. Similarly, attribute values can be set in one language and accessed in another. To achieve this, attribute keys will be allocated in an integer range that is valid all languages. The same holds true for system-defined attribute values (such as `MPI_TAG_UB`, `MPI_WTIME_IS_GLOBAL`, ~~etc.)~~ ==etc.).==

> This requires that attributes be tagged either as ~~“C,” “C++”~~ ==“C”== or ~~“Fortran,”~~ ==“Fortran”== and that the language tag be checked in order to use the right calling convention for the callback function.

~~Section [[versions/v30/sections/context#Caching|Caching]] on page [[versions/v30/sections/context#Caching|Caching]]~~

~~define attributes arguments to be of type `void*` in C, and of type `INTEGER`, in Fortran. On some systems, `INTEGER`s will have 32 bits, while C/C++ pointers will have 64 bits. This is a problem if communicator attributes are used to move information from a Fortran caller to a C/C++ callee, or vice-versa.~~

~~MPI behaves as if it stores, internally, address sized attributes. If Fortran `INTEGER`s are smaller, then the Fortran function [[versions/v30/API/MPI_ATTR_GET|MPI_ATTR_GET]] will return the least significant part of the attribute word; the Fortran function [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] will set the least significant part of the attribute word, which will be sign extended to the entire word. (These two functions may be invoked explicitly by user code, or implicitly, by attribute copying callback functions.)~~

~~As for addresses, new functions are provided that manipulate Fortran address sized attributes, and have the same functionality as the old functions in C/C++. These functions are described in~~

~~Section [[versions/v30/sections/context#Caching|Caching]] , page [[versions/v30/sections/context#Caching|Caching]] .~~

~~Users are encouraged to use these new functions.~~

~~MPI supports two types of attributes: address-valued (pointer) attributes, and integer valued attributes. C and C++ attribute functions put and get address valued attributes. Fortran attribute functions put and get integer valued attributes. When an integer valued attribute is accessed from C or C++, then `MPI_xxx_get_attr` will return the address of (a pointer to) the integer valued attribute, which is a pointer to~~

==Section [[versions/v30/sections/context#Caching|Caching]] on page [[versions/v30/sections/context#Caching|Caching]] define attributes arguments to be of type `void*` in C, and of type `INTEGER`, in Fortran. On some systems, `INTEGER`s will have 32 bits, while C pointers will have 64 bits. This is a problem if communicator attributes are used to move information from a Fortran caller to a C callee, or vice-versa.==

==MPI behaves as if it stores, internally, address sized attributes. If Fortran `INTEGER`s are smaller, then the (deprecated) Fortran function [[versions/v30/API/MPI_ATTR_GET|MPI_ATTR_GET]] will return the least significant part of the attribute word; the (deprecated) Fortran function [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] will set the least significant part of the attribute word, which will be sign extended to the entire word. (These two functions may be invoked explicitly by user code, or implicitly, by attribute copying callback functions.)==

==As for addresses, new functions are provided that manipulate Fortran address sized attributes, and have the same functionality as the old functions in C. These functions are described in==

==Section [[versions/v30/sections/context#Caching|Caching]] , page [[versions/v30/sections/context#Caching|Caching]] . Users are encouraged to use these new functions.==

==MPI supports two types of attributes: address-valued (pointer) attributes, and integer-valued attributes. C attribute functions put and get address-valued attributes. Fortran attribute functions put and get integer-valued attributes. When an integer-valued attribute is accessed from C, then `MPI_xxx_get_attr` will return the address of (a pointer to) the integer-valued attribute, which is a pointer to==

~~[[MPI_xxx_SET_ATTR]] , and a pointer to `int` if it was stored with the deprecated Fortran [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] . When an address valued attribute is accessed from~~

~~Fortran, then [[MPI_xxx_GET_ATTR]] will convert the address into an integer and return the result of this conversion. This conversion is lossless if new~~

~~style~~

==[[MPI_xxx_SET_ATTR]] , and a pointer to `int` if it was stored with the deprecated Fortran [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] . When an address-valued attribute is accessed from==

==Fortran, then [[MPI_xxx_GET_ATTR]] will convert the address into an integer and return the result of this conversion. This conversion is lossless if new style==

~~deprecated~~

~~attribute functions are used. In C, the deprecated routines~~

==deprecated attribute functions are used. In C, the deprecated routines==

~~The predefined MPI attributes can be integer valued or address valued. Predefined integer valued attributes, such as `MPI_TAG_UB`, behave as if they were put by a call to the deprecated Fortran routine [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] ,~~

~~i.e.,~~

~~in Fortran, [[versions/v30/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] will return in val the upper bound for tag value; in C,~~

==The predefined MPI attributes can be integer valued or address-valued. Predefined integer valued attributes, such as `MPI_TAG_UB`, behave as if they were put by a call to the deprecated Fortran routine [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] ,==

==i.e., in Fortran, [[versions/v30/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] will return in `val` the upper bound for tag value; in C,==

~~Address valued predefined attributes, such as `MPI_WIN_BASE` behave as if they were put by a C call,~~

~~i.e.,~~

~~in Fortran, [[versions/v30/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] will return in val the base address of the window, converted to an integer. In C,~~

==Address-valued predefined attributes, such as `MPI_WIN_BASE` behave as if they were put by a C call,==

==i.e., in Fortran, [[versions/v30/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] will return in `val` the base address of the window, converted to an integer. In C,==

> The design is consistent with the behavior > > specified ~~> >~~ for predefined attributes, and ensures that no information is lost when attributes are passed from language to language. Because the language interoperability for predefined attributes was defined based on [[versions/v30/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] , this definition is kept for compatibility reasons although the routine itself is now deprecated.

### MPI-3.0 → MPI-3.1  (7 changed paragraphs)

~~Section~~ [[versions/v31/sections/context#Caching|Caching]] ~~on page [[versions/v31/sections/context#Caching|Caching]] define~~ ==defines== attributes arguments to be of type `void*` in C, and of type `INTEGER`, in Fortran. On some systems, `INTEGER`s will have 32 bits, while C pointers will have 64 bits. This is a problem if communicator attributes are used to move information from a Fortran caller to a C callee, or vice-versa.

~~As for addresses, new functions are provided that manipulate Fortran address sized attributes, and have the same functionality as the old functions in C. These functions are described in~~

~~Section [[versions/v31/sections/context#Caching|Caching]] , page [[versions/v31/sections/context#Caching|Caching]] . Users are encouraged to use these new functions.~~

~~MPI supports two types of attributes: address-valued (pointer) attributes, and integer-valued attributes. C attribute functions put and get address-valued attributes. Fortran attribute functions put and get integer-valued attributes. When an integer-valued attribute is accessed from C, then `MPI_xxx_get_attr` will return the address of (a pointer to) the integer-valued attribute, which is a pointer to~~

==As for addresses, new functions are provided that manipulate Fortran address sized attributes, and have the same functionality as the old functions in C. These functions are described in [[versions/v31/sections/context#Caching|Caching]] . Users are encouraged to use these new functions.==

==MPI supports two types of attributes: address-valued (pointer) attributes, and integer-valued attributes. C attribute functions put and get address-valued attributes. Fortran attribute functions put and get integer-valued attributes. When an integer-valued attribute is accessed from C, then `MPI_XXX_get_attr` will return the address of (a pointer to) the integer-valued attribute, which is a pointer to==

~~[[MPI_xxx_SET_ATTR]]~~ ==`MPI_XXX_SET_ATTR`== , and a pointer to `int` if it was stored with the deprecated Fortran [[versions/v31/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] . When an address-valued attribute is accessed from

Fortran, then ~~[[MPI_xxx_GET_ATTR]]~~ ==`MPI_XXX_GET_ATTR`== will convert the address into an integer and return the result of this conversion. This conversion is lossless if new style

A. Setting an attribute value with the (deprecated) Fortran MPI-1 call

A. Setting an attribute value via a Fortran MPI-2 call

~~The predefined MPI attributes can be integer valued or address-valued. Predefined integer valued attributes, such as `MPI_TAG_UB`, behave as if they were put by a call to the deprecated Fortran routine [[versions/v31/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] ,~~

~~i.e., in Fortran, [[versions/v31/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] will return in `val` the upper bound for tag value; in C,~~

==The predefined MPI attributes can be integer valued or address-valued. Predefined integer valued attributes, such as `MPI_TAG_UB`, behave as if they were put by a call to the deprecated Fortran routine [[versions/v31/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] , i.e., in Fortran, [[versions/v31/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] will return in `val` the upper bound for tag value; in C,==

> Implementations should tag attributes either as (1) address attributes, (2) as `INTEGER(KIND=MPI_ADDRESS_KIND)` attributes or (3) as `INTEGER` attributes, according to whether they were set in (1) C (with `MPI_Attr_put` or > > ~~`MPI_Xxx_set_attr`),~~ ==`MPI_XXX_set_attr`),== (2) in Fortran with `MPI_XXX_SET_ATTR` or (3) with the deprecated Fortran > > routine `MPI_ATTR_PUT`. Thus, the right choice can be made when the attribute is retrieved.

### MPI-3.1 → MPI-4.0  (10 changed paragraphs)

(the functions provided by the ~~`MPI\_<span class="roman">{</span>TYPE,COMM,WIN<span class="roman">}</span>\_CREATE_KEYVAL`~~ ==`MPI_XXX_CREATE_KEYVAL`== call). When a communicator is duplicated, for each attribute, the corresponding copy function is called, using the right calling convention for the language of that function; and similarly, for the delete callback function.

~~The attribute manipulation functions described in~~

~~[[versions/v40/sections/context#Caching|Caching]] defines attributes arguments to be of type `void*` in C, and of type `INTEGER`, in Fortran. On some systems, `INTEGER`s will have 32 bits, while C pointers will have 64 bits. This is a problem if communicator attributes are used to move information from a Fortran caller to a C callee, or vice-versa.~~

==The attribute manipulation functions described in [[versions/v40/sections/context#Caching|Caching]] defines attributes arguments to be of type `void*` in C, and of type `INTEGER`, in Fortran. On some systems, `INTEGER`s will have 32 bits, while C pointers will have 64 bits. This is a problem if communicator attributes are used to move information from a Fortran caller to a C callee, or vice-versa.==

~~Fortran, then `MPI_XXX_GET_ATTR` will convert the address into an integer and return the result of this conversion. This conversion is lossless if new style~~

~~attribute functions are used, and an integer of kind `MPI_ADDRESS_KIND` is returned. The conversion may cause truncation if~~

~~deprecated attribute functions are used. In C, the deprecated routines~~

==Fortran, then `MPI_XXX_GET_ATTR` will convert the address into an integer and return the result of this conversion. This conversion is lossless if new style attribute functions are used, and an integer of kind `MPI_ADDRESS_KIND` is returned. The conversion may cause truncation if deprecated attribute functions are used. In C, the deprecated routines==

/* Upon successful return, get_val == &set_val (and therefore *get_val == 3) */ MPI_Comm_get_attr(MPI_COMM_WORLD, keyval1, &get_val, &flag); /* Upon successful return, get_struct == &set_struct */ MPI_Comm_get_attr(MPI_COMM_WORLD, keyval2, &get_struct, &flag); /* Upon successful return, get_val == (void*) 17 */ /* i.e., (MPI_Aint) get_val == 17 */ MPI_Comm_get_attr(MPI_COMM_WORLD, keyval3, &get_val, &flag);

LOGICAL FLAG INTEGER IERR, GET_VAL, GET_STRUCT

LOGICAL FLAG INTEGER IERR ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== GET_VAL, GET_STRUCT

LOGICAL FLAG INTEGER IERR ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== VALUE

LOGICAL FLAG INTEGER IERR ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== VALUE1, VALUE2

~~Address-valued predefined attributes, such as `MPI_WIN_BASE` behave as if they were put by a C call,~~

~~i.e., in Fortran, [[versions/v40/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] will return in `val` the base address of the window, converted to an integer. In C,~~

==Address-valued predefined attributes, such as `MPI_WIN_BASE` behave as if they were put by a C call, i.e., in Fortran, [[versions/v40/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] will return in `val` the base address of the window, converted to an integer. In C,==

> The design is consistent with the behavior ~~> >~~ specified for predefined attributes, and ensures that no information is lost when attributes are passed from language to language. Because the language interoperability for predefined attributes was defined based on [[versions/v40/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] , this definition is kept for compatibility reasons although the routine itself is now deprecated.

### MPI-4.0 → MPI-4.1  (12 changed paragraphs)

~~MPI supports two types of attributes: address-valued (pointer) attributes, and integer-valued attributes. C attribute functions put and get address-valued attributes. Fortran attribute functions put and get integer-valued attributes. When an integer-valued attribute is accessed from C, then `MPI_XXX_get_attr` will return the address of (a pointer to) the integer-valued attribute, which is a pointer to~~

~~`MPI_Aint` if the attribute was stored with Fortran~~

==MPI supports two types of attributes: address-valued (pointer) attributes, and integer-valued attributes. C attribute functions put and get address-valued attributes. Fortran attribute functions put and get integer-valued attributes. When an integer-valued attribute is accessed from C, then `MPI_XXX_get_attr` will return the address of (a pointer to) the integer-valued attribute, which is a pointer to `MPI_Aint` if the attribute was stored with Fortran==

==Setting an attribute in C and reading in C or Fortran.==

~~    int set_val = 3;     struct foo set_struct;~~

~~    /* Set a value that is a pointer to an int */~~

~~    MPI_Comm_set_attr(MPI_COMM_WORLD, keyval1, &set_val);     /* Set a value that is a pointer to a struct */     MPI_Comm_set_attr(MPI_COMM_WORLD, keyval2, &set_struct);     /* Set an integer value */     MPI_Comm_set_attr(MPI_COMM_WORLD, keyval3, (void *) 17);~~

==(code block added)==
``` [MPI]C
int set_val = 3;
struct foo set_struct;

/* Set a value that is a pointer to an int */

MPI_Comm_set_attr(MPI_COMM_WORLD, keyval1, &set_val);
/* Set a value that is a pointer to a struct */
MPI_Comm_set_attr(MPI_COMM_WORLD, keyval2, &set_struct);
/* Set an integer value */
MPI_Comm_set_attr(MPI_COMM_WORLD, keyval3, (void *) 17);
```

~~    int flag, *get_val;     struct foo *get_struct;~~

~~    /* Upon successful return, get_val == &set_val        (and therefore *get_val == 3) */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval1, &get_val, &flag);     /* Upon successful return, get_struct == &set_struct */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval2, &get_struct, &flag);     /* Upon successful return, get_val == (void*) 17 */     /*        i.e., (MPI_Aint) get_val == 17 */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval3, &get_val, &flag);~~

==(code block added)==
``` [MPI]C
int flag, *get_val;
struct foo *get_struct;

/* Upon successful return, get_val == &set_val
   (and therefore *get_val == 3) */
MPI_Comm_get_attr(MPI_COMM_WORLD, keyval1, &get_val, &flag);
/* Upon successful return, get_struct == &set_struct */
MPI_Comm_get_attr(MPI_COMM_WORLD, keyval2, &get_struct, &flag);
/* Upon successful return, get_val == (void*) 17 */
/*        i.e., (MPI_Aint) get_val == 17 */
MPI_Comm_get_attr(MPI_COMM_WORLD, keyval3, &get_val, &flag);
```

~~    LOGICAL FLAG     INTEGER IERR, GET_VAL, GET_STRUCT~~

~~    ! Upon successful return, GET_VAL == &set_val, possibly truncated     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL1, GET_VAL, FLAG, IERR)     ! Upon successful return, GET_STRUCT == &set_struct, possibly truncated     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL2, GET_STRUCT, FLAG, IERR)     ! Upon successful return, GET_VAL == 17     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL3, GET_VAL, FLAG, IERR)~~

==(code block added)==
``` [MPI]Fortran
LOGICAL FLAG
INTEGER IERR, GET_VAL, GET_STRUCT

! Upon successful return, GET_VAL == &set_val, possibly truncated
CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL1, GET_VAL, FLAG, IERR)
! Upon successful return, GET_STRUCT == &set_struct, possibly truncated
CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL2, GET_STRUCT, FLAG, IERR)
! Upon successful return, GET_VAL == 17
CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL3, GET_VAL, FLAG, IERR)
```

~~    LOGICAL FLAG     INTEGER IERR     INTEGER(KIND=MPI_ADDRESS_KIND) GET_VAL, GET_STRUCT~~

~~    ! Upon successful return, GET_VAL == &set_val     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL1, GET_VAL, FLAG, IERR)     ! Upon successful return, GET_STRUCT == &set_struct     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL2, GET_STRUCT, FLAG, IERR)     ! Upon successful return, GET_VAL == 17     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL3, GET_VAL, FLAG, IERR)~~

~~ A. Setting an attribute value with the (deprecated) Fortran MPI-1 call~~

~~    INTEGER IERR, VAL     VAL = 7     CALL MPI_ATTR_PUT(MPI_COMM_WORLD, KEYVAL, VAL, IERR)~~

==(code block added)==
``` [MPI]Fortran
LOGICAL FLAG
INTEGER IERR
INTEGER(KIND=MPI_ADDRESS_KIND) GET_VAL, GET_STRUCT

! Upon successful return, GET_VAL == &set_val
CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL1, GET_VAL, FLAG, IERR)
! Upon successful return, GET_STRUCT == &set_struct
CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL2, GET_STRUCT, FLAG, IERR)
! Upon successful return, GET_VAL == 17
CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL3, GET_VAL, FLAG, IERR)
```

== Setting an attribute in Fortran and reading in C or Fortran.==

==A. Setting an attribute value with the (deprecated) Fortran MPI-1 call==

==(code block added)==
``` [MPI]Fortran
INTEGER IERR, VAL
VAL = 7
CALL MPI_ATTR_PUT(MPI_COMM_WORLD, KEYVAL, VAL, IERR)
```

~~    int flag;     int *value;~~

~~    /* Upon successful return, value points to internal MPI storage and        *value == (int) 7 */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval, &value, &flag);~~

==(code block added)==
``` [MPI]C
int flag;
int *value;

/* Upon successful return, value points to internal MPI storage and
   *value == (int) 7 */
MPI_Comm_get_attr(MPI_COMM_WORLD, keyval, &value, &flag);
```

~~    LOGICAL FLAG     INTEGER IERR, VALUE~~

~~    ! Upon successful return, VALUE == 7     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL, VALUE, FLAG, IERR)~~

==(code block added)==
``` [MPI]Fortran
LOGICAL FLAG
INTEGER IERR, VALUE

! Upon successful return, VALUE == 7
CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL, VALUE, FLAG, IERR)
```

~~    LOGICAL FLAG     INTEGER IERR     INTEGER(KIND=MPI_ADDRESS_KIND) VALUE~~

~~    ! Upon successful return, VALUE == 7 (sign extended)     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL, VALUE, FLAG, IERR)~~

~~ A. Setting an attribute value via a Fortran MPI-2 call~~

~~    INTEGER IERR     INTEGER(KIND=MPI_ADDRESS_KIND) VALUE1     INTEGER(KIND=MPI_ADDRESS_KIND) VALUE2     VALUE1 = 42     VALUE2 = INT(2, KIND=MPI_ADDRESS_KIND) ** 40~~

~~    CALL MPI_COMM_SET_ATTR(MPI_COMM_WORLD, KEYVAL1, VALUE1, IERR)     CALL MPI_COMM_SET_ATTR(MPI_COMM_WORLD, KEYVAL2, VALUE2, IERR)~~

==(code block added)==
``` [MPI]Fortran
LOGICAL FLAG
INTEGER IERR
INTEGER(KIND=MPI_ADDRESS_KIND) VALUE

! Upon successful return, VALUE == 7 (sign extended)
CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL, VALUE, FLAG, IERR)
```

== Setting an attribute in Fortran and reading in C or Fortran.==

==A. Setting an attribute value via a Fortran MPI-2 call==

==(code block added)==
``` [MPI]Fortran
INTEGER IERR
INTEGER(KIND=MPI_ADDRESS_KIND) VALUE1
INTEGER(KIND=MPI_ADDRESS_KIND) VALUE2
VALUE1 = 42
VALUE2 = INT(2, KIND=MPI_ADDRESS_KIND) ** 40

CALL MPI_COMM_SET_ATTR(MPI_COMM_WORLD, KEYVAL1, VALUE1, IERR)
CALL MPI_COMM_SET_ATTR(MPI_COMM_WORLD, KEYVAL2, VALUE2, IERR)
```

~~    int flag;     MPI_Aint *value1, *value2;~~

~~    /* Upon successful return, value1 points to internal MPI storage and        *value1 == 42 */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval1, &value1, &flag);     /* Upon successful return, value2 points to internal MPI storage and        *value2 == 2^40 */     MPI_Comm_get_attr(MPI_COMM_WORLD, keyval2, &value2, &flag);~~

==(code block added)==
``` [MPI]C
int flag;
MPI_Aint *value1, *value2;

/* Upon successful return, value1 points to internal MPI storage and
   *value1 == 42 */
MPI_Comm_get_attr(MPI_COMM_WORLD, keyval1, &value1, &flag);
/* Upon successful return, value2 points to internal MPI storage and
   *value2 == 2^40 */
MPI_Comm_get_attr(MPI_COMM_WORLD, keyval2, &value2, &flag);
```

~~    LOGICAL FLAG     INTEGER IERR, VALUE1, VALUE2~~

~~    ! Upon successful return, VALUE1 == 42     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL1, VALUE1, FLAG, IERR)     ! Upon successful return, VALUE2 == 2^40, or 0 if truncation     ! needed (i.e., the least significant part of the attribute word)     CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL2, VALUE2, FLAG, IERR)~~

==(code block added)==
``` [MPI]Fortran
LOGICAL FLAG
INTEGER IERR, VALUE1, VALUE2

! Upon successful return, VALUE1 == 42
CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL1, VALUE1, FLAG, IERR)
! Upon successful return, VALUE2 == 2^40, or 0 if truncation
! needed (i.e., the least significant part of the attribute word)
CALL MPI_ATTR_GET(MPI_COMM_WORLD, KEYVAL2, VALUE2, FLAG, IERR)
```

~~    LOGICAL FLAG     INTEGER IERR     INTEGER(KIND=MPI_ADDRESS_KIND) VALUE1, VALUE2~~

~~    ! Upon successful return, VALUE1 == 42     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL1, VALUE1, FLAG, IERR)     ! Upon successful return, VALUE2 == 2^40     CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL2, VALUE2, FLAG, IERR)~~

==(code block added)==
``` [MPI]Fortran
LOGICAL FLAG
INTEGER IERR
INTEGER(KIND=MPI_ADDRESS_KIND) VALUE1, VALUE2

! Upon successful return, VALUE1 == 42
CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL1, VALUE1, FLAG, IERR)
! Upon successful return, VALUE2 == 2^40
CALL MPI_COMM_GET_ATTR(MPI_COMM_WORLD, KEYVAL2, VALUE2, FLAG, IERR)
```

### MPI-4.1 → MPI-5.0  (2 changed paragraphs)

The predefined MPI attributes can be integer valued or address-valued. Predefined integer valued attributes, such as `MPI_TAG_UB`, behave as if they were put by a call to the deprecated Fortran routine [[versions/v50/API/MPI_ATTR_PUT|MPI_ATTR_PUT]] , i.e., in Fortran, [[versions/v50/API/MPI_COMM_GET_ATTR|MPI_COMM_GET_ATTR]] ==`(MPI_COMM_WORLD, MPI_TAG_UB, val, flag, ierr)`== will return in `val` the upper bound for tag value; in C,

Address-valued predefined attributes, such as `MPI_WIN_BASE` behave as if they were put by a C call, i.e., in Fortran, [[versions/v50/API/MPI_WIN_GET_ATTR|MPI_WIN_GET_ATTR]] ==`(win, MPI_WIN_BASE, val, flag, ierror)`== will return in `val` the base address of the window, converted to an integer. In C,

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/binding#Attributes]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/binding#Attributes]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/binding#Attributes]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/binding#Attributes]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/binding#Attributes]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/binding#Attributes]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/binding#Attributes]]

---
title: "Procedure Specification"
chapter: terms
present_in: ["MPI-1.3", "MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Procedure Specification

Chapter **terms** · in [[versions/v13/sections/terms#Procedure Specification|MPI-1.3]], [[versions/v20/sections/terms#Procedure Specification|MPI-2.0]], [[versions/v21/sections/terms#Procedure Specification|MPI-2.1]], [[versions/v22/sections/terms#Procedure Specification|MPI-2.2]], [[versions/v30/sections/terms#Procedure Specification|MPI-3.0]], [[versions/v31/sections/terms#Procedure Specification|MPI-3.1]], [[versions/v40/sections/terms#Procedure Specification|MPI-4.0]], [[versions/v41/sections/terms#Procedure Specification|MPI-4.1]], [[versions/v50/sections/terms#Procedure Specification|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1  (2 changed paragraphs)

~~MPI procedures are specified using a language independent notation. The arguments of procedure calls are marked as `IN`, `OUT` or `INOUT`. The meanings of these are:~~

~~- the call uses but does not update an argument marked `IN`,~~

~~- the call may update an argument marked `OUT`,~~

~~- the call both uses and updates an argument marked `INOUT`.~~

~~There is one special case — if an argument is a handle to an opaque object (these terms are defined in Section [[terms-opaque-objects]] ), and the object is updated by the procedure call, then the argument is marked `OUT`. It is marked this way even though the handle itself is not modified — we use the `OUT` attribute to denote that what the handle *references* is updated.~~

~~The definition of MPI tries to avoid, to the largest possible extent, the use of `INOUT` arguments, because such use is error-prone, especially for scalar arguments.~~

~~A common occurrence for MPI functions is an argument that is used as `IN` by some processes and `OUT` by other processes. Such argument is, syntactically, an `INOUT` argument and is marked as such, although, semantically, it is not used in one call both for input and for output.~~

~~Another frequent situation arises when an argument value is needed only by a subset of the processes. When an argument is not significant at a process then an arbitrary value can be passed as argument.~~

==MPI procedures are specified using a language-independent notation. The arguments of procedure calls are marked as `IN`, `OUT` or `INOUT`. The meanings of these are:==

==- `IN`: the call may use the input value but does not update the argument,==

==- `OUT`: the call may update the argument but does not use its input value,==

==- `INOUT`: the call may both use and update the argument.==

==There is one special case — if an argument is a handle to an opaque object (these terms are defined in Section [[terms-opaque-objects]] ), and the object is updated by the procedure call, then the argument is marked==

==`INOUT` or==

==`OUT`. It is marked this way even though the handle itself is not modified — we use the==

==`INOUT` or==

==`OUT` attribute to denote that what the handle *references* is updated. Thus, in C++, `IN` arguments are==

==usually==

==either references or pointers to `const` objects.==

==> [!tip] Rationale==

==> The definition of MPI tries to avoid, to the largest possible extent, the use of `INOUT` arguments, because such use is error-prone, especially for scalar arguments.==

==MPI’s use of `IN`, `OUT` and `INOUT` is intended to indicate to the user how an argument is==

==to be used, but==

==does not provide a rigorous classification that can be translated directly into==

==all==

==language bindings (e.g., `INTENT` in Fortran 90 bindings or `const` in C bindings). For instance, the “constant” MPI_BOTTOM can usually be passed to `OUT` buffer arguments. Similarly, MPI_STATUS_IGNORE can be passed as the `OUT` status argument.==

==A common occurrence for MPI functions is an argument that is used as==

==`IN`==

==by some processes and `OUT` by other processes. Such an argument is, syntactically, an `INOUT` argument and is marked as such, although, semantically, it is not used in one call both for input and for output on a single process.==

==Another frequent situation arises when an argument value is needed only by a subset of the processes. When an argument is not significant at a process then an arbitrary value can be passed as an argument.==

~~All MPI functions are first specified in the language-independent notation. Immediately below this, the ANSI C version of the function is shown, and below this, a version of the same function in Fortran 77.~~

==All MPI functions are first specified in the language-independent notation. Immediately below this, the==

==ISO C==

==version of the function is shown followed by a version of the same function in Fortran and then the C++ binding.==

==Fortran in this document refers to Fortran 90; see Section [[versions/v21/sections/terms#Language Binding|Language Binding]] .==

### MPI-2.0 → MPI-2.1  (3 changed paragraphs)

~~- the call may use the input value but does not update an argument is marked `IN`,~~

~~- the call may update an argument but does not use its input value is marked `OUT`,~~

~~- the call may both use and update an argument is marked `INOUT`.~~

~~There is one special case — if an argument is a handle to an opaque object (these terms are defined in Section [[terms-opaque-objects]] ), and the object is updated by the procedure call, then the argument is marked `OUT`. It is marked this way even though the handle itself is not modified — we use the `OUT` attribute to denote that what the handle *references* is updated. Thus, in C++, `IN` arguments are either references or pointers to `const` objects.~~

==- `IN`: the call may use the input value but does not update the argument,==

==- `OUT`: the call may update the argument but does not use its input value,==

==- `INOUT`: the call may both use and update the argument.==

==There is one special case — if an argument is a handle to an opaque object (these terms are defined in Section [[terms-opaque-objects]] ), and the object is updated by the procedure call, then the argument is marked==

==`INOUT` or==

==`OUT`. It is marked this way even though the handle itself is not modified — we use the==

==`INOUT` or==

==`OUT` attribute to denote that what the handle *references* is updated. Thus, in C++, `IN` arguments are==

==usually==

==either references or pointers to `const` objects.==

~~A common occurrence for MPI functions is an argument that is used as `IN` by some processes and `OUT` by other processes. Such an argument is, syntactically, an `INOUT` argument and is marked as such, although, semantically, it is not used in one call both for input and for output on a single process.~~

==A common occurrence for MPI functions is an argument that is used as==

==`IN`==

==by some processes and `OUT` by other processes. Such an argument is, syntactically, an `INOUT` argument and is marked as such, although, semantically, it is not used in one call both for input and for output on a single process.==

~~All MPI functions are first specified in the language-independent notation. Immediately below this, the ANSI C version of the function is shown followed by a version of the same function in Fortran and then the C++ binding.~~

==All MPI functions are first specified in the language-independent notation. Immediately below this, the==

==ISO C==

==version of the function is shown followed by a version of the same function in Fortran and then the C++ binding.==

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

language bindings (e.g., `INTENT` in Fortran 90 bindings or `const` in C bindings). For instance, the “constant” ~~MPI_BOTTOM~~ ==`MPI_BOTTOM`== can usually be passed to `OUT` buffer arguments. Similarly, ~~MPI_STATUS_IGNORE~~ ==`MPI_STATUS_IGNORE`== can be passed as the `OUT` status argument.

### MPI-2.2 → MPI-3.0  (4 changed paragraphs)

MPI procedures are specified using a language-independent notation. The arguments of procedure calls are marked as `IN`, ~~`OUT`~~ ==`OUT`,== or `INOUT`. The meanings of these are:

- `IN`: the call may use the input value but does not update the ~~argument,~~ ==argument from the perspective of the caller at any time during the call’s execution,==

~~There is one special case — if an argument is a handle to an opaque object (these terms are defined in Section [[terms-opaque-objects]] ), and the object is updated by the procedure call, then the argument is marked~~

~~`INOUT` or~~

~~`OUT`. It is marked this way even though the handle itself is not modified — we use the~~

~~`INOUT` or~~

~~`OUT` attribute to denote that what the handle *references* is updated. Thus, in C++, `IN` arguments are~~

~~usually~~

~~either references or pointers to `const` objects.~~

==There is one special case — if an argument is a handle to an opaque object (these terms are defined in Section [[terms-opaque-objects]] ), and the object is updated by the procedure call, then the argument is marked `INOUT` or `OUT`. It is marked this way even though the handle itself is not modified — we use the `INOUT` or `OUT` attribute to denote that what the handle *references* is updated.==

~~MPI’s use of `IN`, `OUT` and `INOUT` is intended to indicate to the user how an argument is~~

~~to be used, but~~

~~does not provide a rigorous classification that can be translated directly into~~

~~all~~

~~language bindings (e.g., `INTENT` in Fortran 90 bindings or `const` in C bindings). For instance, the “constant” `MPI_BOTTOM` can usually be passed to `OUT` buffer arguments. Similarly, `MPI_STATUS_IGNORE` can be passed as the `OUT` status argument.~~

~~A common occurrence for MPI functions is an argument that is used as~~

~~`IN`~~

~~by some processes and `OUT` by other processes. Such an argument is, syntactically, an `INOUT` argument and is marked as such, although, semantically, it is not used in one call both for input and for output on a single process.~~

==MPI’s use of `IN`, `OUT`, and `INOUT` is intended to indicate to the user how an argument is to be used, but does not provide a rigorous classification that can be translated directly into all language bindings (e.g., `INTENT` in Fortran 90 bindings or `const` in C bindings). For instance, the “constant” `MPI_BOTTOM` can usually be passed to `OUT` buffer arguments. Similarly, `MPI_STATUS_IGNORE` can be passed as the `OUT` status argument.==

==A common occurrence for MPI functions is an argument that is used as `IN` by some processes and `OUT` by other processes. Such an argument is, syntactically, an `INOUT` argument and is marked as such, although, semantically, it is not used in one call both for input and for output on a single process.==

~~All MPI functions are first specified in the language-independent notation. Immediately below this, the~~

~~ISO C~~

~~version of the function is shown followed by a version of the same function in Fortran and then the C++ binding.~~

~~Fortran in this document refers to Fortran 90; see Section [[versions/v30/sections/terms#Language Binding|Language Binding]] .~~

==All MPI functions are first specified in the language-independent notation. Immediately below this, language dependent bindings follow:==

==- The ISO C version of the function.==

==- The Fortran version used with `USE mpi_f08`.==

==- The Fortran version of the same function used with `USE mpi` or `INCLUDE ’mpif.h’`.==

==“Fortran” in this document refers to Fortran 90 and higher; see Section [[versions/v30/sections/terms#Language Binding|Language Binding]] .==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~“Fortran” in this document refers to Fortran 90 and higher; see Section [[versions/v31/sections/terms#Language Binding|Language Binding]] .~~

==An exception is [[versions/v31/sections/tools#The MPI Tool Information Interface|The MPI Tool Information Interface]] “The MPI Tool Information Interface”, which only provides ISO C interfaces.==

==“Fortran” in this document refers to Fortran 90 and higher; see [[versions/v31/sections/terms#Language Binding|Language Binding]] .==

### MPI-3.1 → MPI-4.0  (7 changed paragraphs)

MPI procedures are specified using a language-independent notation. The arguments of procedure calls are marked as ~~`IN`, `OUT`,~~ ==IN, OUT,== or ~~`INOUT`.~~ ==INOUT.== The meanings of these are:

- ~~`IN`:~~ ==IN:== the call may use the input value but does not update the argument from the perspective of the caller at any time during the call’s execution,

- ~~`OUT`:~~ ==OUT:== the call may update the argument but does not use its input value,

- ~~`INOUT`:~~ ==INOUT:== the call may both use and update the argument.

There is one special ~~case — if~~ ==case—if== an argument is a handle to an opaque object (these terms are defined in Section [[terms-opaque-objects]] ), and the object is updated by the procedure call, then the argument is marked ~~`INOUT`~~ ==INOUT== or ~~`OUT`.~~ ==OUT.== It is marked this way even though the handle itself is not ~~modified — we~~ ==modified—we== use the ~~`INOUT`~~ ==INOUT== or ~~`OUT`~~ ==OUT== attribute to denote that what the handle *references* is updated.

> The definition of MPI tries to avoid, to the largest possible extent, the use of ~~`INOUT`~~ ==INOUT== arguments, because such use is error-prone, especially for scalar arguments.

MPI’s use of ~~`IN`, `OUT`,~~ ==IN, OUT,== and ~~`INOUT`~~ ==INOUT== is intended to indicate to the user how an argument is to be used, but does not provide a rigorous classification that can be translated directly into all language bindings (e.g., `INTENT` in Fortran 90 bindings or `const` in C bindings). For instance, the “constant” `MPI_BOTTOM` can usually be passed to ~~`OUT`~~ ==OUT== buffer arguments. Similarly, `MPI_STATUS_IGNORE` can be passed as the ~~`OUT`~~ ==OUT== status argument.

A common occurrence for MPI functions is an argument that is used as ~~`IN`~~ ==IN== by some processes and ~~`OUT`~~ ==OUT== by other processes. Such an argument is, syntactically, an ~~`INOUT`~~ ==INOUT== argument and is marked as such, although, semantically, it is not used in one call both for input and for output on a single process.

Unless specified otherwise, an argument of type ~~`OUT`~~ ==OUT== or type ~~`INOUT`~~ ==INOUT== cannot be aliased with any other argument passed to an MPI procedure. An example of argument aliasing in C appears below. If we define a C procedure like this,

void ~~copyIntBuffer( int~~ ==copyIntBuffer(int== *pin, int *pout, int ~~len )~~ ==len)== { int i; for (i=0; i<len; ++i) *pout++ = *pin++; }

int a[10]; ~~copyIntBuffer( a,~~ ==copyIntBuffer(a,== a+3, 7);

- The ISO C ~~version~~ ==version(s)== of the function.

- The Fortran ~~version~~ ==version(s)== used with `USE mpi_f08`.

==Some MPI procedures have two interfaces for a given language support; see Sections [[versions/v40/sections/terms#Absolute Addresses and Relative Address Displacements|Absolute Addresses and Relative Address Displacements]] and [[versions/v40/sections/terms#Counts|Counts]] .==

==The words function, routine, procedure, procedure call, and call are often used as synonyms within this standard.==

### MPI-4.0 → MPI-4.1  (5 changed paragraphs)

~~-~~ IN: the call may use the input value but does not update the argument from the perspective of the caller at any time during the call’s execution,

~~-~~ OUT: the call may update the argument but does not use its input value,

~~-~~ INOUT: the call may both use and update the argument.

~~    void copyIntBuffer(int *pin, int *pout, int len)     {   int i;         for (i=0; i<len; ++i) *pout++ = *pin++;     }~~

==(code block added)==
``` objectivec
void copyIntBuffer(int *pin, int *pout, int len)
{   int i;
    for (i=0; i<len; ++i) *pout++ = *pin++;
}
```

~~    int a[10];     copyIntBuffer(a, a+3, 7);~~

==(code block added)==
``` objectivec
int a[10];
copyIntBuffer(a, a+3, 7);
```

- The Fortran version of the same function used with `USE mpi` or ==(deprecated)== `INCLUDE ’mpif.h’`.

“Fortran” in this document refers to Fortran 90 ~~and higher;~~ ==or later;== see [[versions/v41/sections/terms#Language Binding|Language Binding]] .

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

==> [!note] Advice to users==

==> Note that the programmer is still responsible for avoiding undefined behavior in the host language by not passing uninitialized values to MPI procedure calls.==

## Text by release

> [!abstract]- MPI-1.3
> ![[versions/v13/sections/terms#Procedure Specification]]

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Procedure Specification]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Procedure Specification]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Procedure Specification]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Procedure Specification]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Procedure Specification]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Procedure Specification]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Procedure Specification]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Procedure Specification]]

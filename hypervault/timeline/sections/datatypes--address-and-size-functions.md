---
title: "Address and Size Functions"
chapter: datatypes
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/datatypes]
---

# Address and Size Functions

Chapter **datatypes** · in [[versions/v21/sections/datatypes#Address and Size Functions|MPI-2.1]], [[versions/v22/sections/datatypes#Address and Size Functions|MPI-2.2]], [[versions/v30/sections/datatypes#Address and Size Functions|MPI-3.0]], [[versions/v31/sections/datatypes#Address and Size Functions|MPI-3.1]], [[versions/v40/sections/datatypes#Address and Size Functions|MPI-4.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

The displacements in a general datatype are relative to some initial buffer address. **Absolute addresses** can be substituted for these displacements: we treat them as displacements relative to “address zero,” the start of the address space. This initial address zero is indicated by the constant ~~MPI_BOTTOM.~~ ==`MPI_BOTTOM`.== Thus, a datatype can specify the absolute address of the entries in the communication buffer, in which case the `buf` argument is passed the value ~~MPI_BOTTOM.~~ ==`MPI_BOTTOM`.==

> C users may be tempted to avoid the usage of > > [[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] > > and rely on the availability of the address operator &. Note, however, that ~~&~~ ==`&`== *cast-expression* is a pointer, not an address. > > ISO C > > does not require that the value of a pointer (or the pointer cast to ~~int)~~ ==`int`)== be the absolute address of the object pointed at — although this is commonly the case. Furthermore, referencing may not have a unique definition on machines with a segmented address space. The use of > > [[versions/v22/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] > > to “reference” C variables guarantees portability to such machines as well.

### MPI-2.2 → MPI-3.0  (6 changed paragraphs)

~~The address of a location in memory can be found by invoking the function~~

~~[[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] .~~

==The address of a location in memory can be found by invoking the function [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] .==

~~This function replaces [[versions/v22/API/MPI_ADDRESS|MPI_ADDRESS]] , whose use is deprecated. See also Chapter [[versions/v30/sections/deprecated#Deprecated Functions|Deprecated Functions]] .~~

==> [!tip] Rationale==

==> In the `mpi_f08` module, the `location` argument is not defined with `INTENT(IN)` because existing applications may use [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] as a substitute for [[versions/v30/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] that was not defined before MPI-3.0.==

> C users may be tempted to avoid the usage of ~~> >~~ [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] ~~> >~~ and rely on the availability of the address operator &. Note, however, that `&` *cast-expression* is a pointer, not an address. > > ISO C ~~> >~~ does not require that the value of a pointer (or the pointer cast to `int`) be the absolute address of the object pointed at — although this is commonly the case. Furthermore, referencing may not have a unique definition on machines with a segmented address space. The use of ~~> >~~ [[versions/v30/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] ~~> >~~ to “reference” C variables guarantees portability to such machines as well.

> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in ~~subsections “Problems Due to Data Copying and Sequence Association,” and “A Problem with Register Optimization”~~ > > ~~in Section~~ ==Sections== [[versions/v30/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] ==- [[versions/v30/sections/binding#Comparison with C|Comparison with C]] . In particular, refer to > > Sections [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] and [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]]== on pages [[versions/v30/sections/binding#Problems Due to Data Copying and Sequence ~~Association|Problems~~ ==Association with Subscript Triplets|Problems== Due to Data Copying and Sequence ~~Association]]~~ ==Association with Subscript Triplets]] - [[versions/v30/sections/binding#Problems Due to Data Copying== and ~~[[binding#A Problem~~ ==Sequence Association== with ==Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “<span class="sans-serif">Problems Due to Data Copying and Sequence Association with Subscript Triplets</span>” and “<span class="sans-serif">Vector Subscripts</span>”, > > and Sections [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] - [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v30/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] - [[versions/v30/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “<span class="sans-serif">Optimization Problems</span>”, “<span class="sans-serif">Code Movements and== Register ~~Optimization|A Problem with Register Optimization]] .~~ ==Optimization</span>”, “<span class="sans-serif">Temporary Data Movements</span>” and “<span class="sans-serif">Permanent Data Movements</span>”.==

The following auxiliary ~~function provides~~ ==functions provide== useful information on derived datatypes.

~~`MPI_TYPE_SIZE` returns the total size, in bytes, of the entries in the type signature associated with `datatype`; i.e., the total size of the data in a message that would be created with this datatype. Entries that occur multiple times in the datatype are counted with their multiplicity.~~

==![[versions/v30/API/MPI_TYPE_SIZE_X]]==

==`MPI_TYPE_SIZE` and `MPI_TYPE_SIZE_X` set the value of `size` to the total size, in bytes, of the entries in the type signature associated with `datatype`; i.e., the total size of the data in a message that would be created with this datatype. Entries that occur multiple times in the datatype are counted with their multiplicity.==

==For both functions, if the OUT parameter cannot express the value to be returned (e.g., if the parameter is too small to hold the output value), it is set to `MPI_UNDEFINED`.==

### MPI-3.0 → MPI-3.1  (6 changed paragraphs)

~~The displacements in a general datatype are relative to some initial buffer address. **Absolute addresses** can be substituted for these displacements: we treat them as displacements relative to “address zero,” the start of the address space. This initial address zero is indicated by the constant `MPI_BOTTOM`. Thus, a datatype can specify the absolute address of the entries in the communication buffer, in which case the `buf` argument is passed the value `MPI_BOTTOM`.~~

~~The address of a location in memory can be found by invoking the function [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] .~~

==The displacements in a general datatype are relative to some initial buffer address. **Absolute addresses** can be substituted for these displacements: we treat them as displacements relative to “address zero,” the start of the address space. This initial address zero is indicated by the constant `MPI_BOTTOM`. Thus, a datatype can specify the absolute address of the entries in the communication buffer, in which case the `buf` argument is passed the value `MPI_BOTTOM`. Note that in Fortran `MPI_BOTTOM` is not usable for initialization or assignment, see Section [[versions/v31/sections/terms#Named Constants|Named Constants]] .==

==The address of a location in memory can be found by invoking the function [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] . The **relative displacement** between two absolute addresses can be calculated with the function [[versions/v31/API/MPI_AINT_DIFF|MPI_AINT_DIFF]] . A new absolute address as sum of an absolute base address and a relative displacement can be calculated with the function [[versions/v31/API/MPI_AINT_ADD|MPI_AINT_ADD]] . To ensure portability, arithmetic on absolute addresses should not be performed with the intrinsic operators “-” and “+”. See also Sections [[versions/v31/sections/terms#Absolute Addresses and Relative Address Displacements|Absolute Addresses and Relative Address Displacements]] and [[versions/v31/sections/datatypes#Correct Use of Addresses|Correct Use of Addresses]] on pages [[versions/v31/sections/terms#Absolute Addresses and Relative Address Displacements|Absolute Addresses and Relative Address Displacements]] and [[versions/v31/sections/datatypes#Correct Use of Addresses|Correct Use of Addresses]] .==

==> [!tip] Rationale==

==> Address sized integer values, i.e., `MPI_Aint` or `INTEGER(KIND=MPI_ADDRESS_KIND)` values, are signed integers, while absolute addresses are unsigned quantities. Direct arithmetic on addresses stored in address sized signed variables can cause overflows, resulting in undefined behavior.==

~~> [!note] Advice to users~~

~~> Current Fortran MPI codes will run unmodified, and will port to any system. However, they may fail if addresses larger than $`2^{32} -1`$ are used in the program. New codes should be written so that they use the new functions. This provides compatibility with C/C++ and avoids errors on 64 bit architectures. However, such newly written codes may need to be (slightly) rewritten to port to old Fortran 77 environments that do not support `KIND` declarations.~~

Using ~~`MPI_GET_ADDRESS`~~ ==[[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]]== for an array.

REAL A(100,100) INTEGER(KIND=MPI_ADDRESS_KIND) I1, I2, DIFF CALL MPI_GET_ADDRESS(A(1,1), I1, IERROR) CALL MPI_GET_ADDRESS(A(10,10), I2, IERROR) DIFF = ~~I2 - I1~~ ==MPI_AINT_DIFF(I2, I1)== ! The value of DIFF is 909*sizeofreal; the values of I1 and I2 are ! implementation dependent.

> C users may be tempted to avoid the usage of [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and rely on the availability of the address operator &. Note, however, that `&` *cast-expression* is a pointer, not an address. ~~> >~~ ISO C does not require that the value of a pointer (or the pointer cast to `int`) be the absolute address of the object pointed at — although this is commonly the case. Furthermore, referencing may not have a unique definition on machines with a segmented address space. The use of [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] to “reference” C variables guarantees portability to such machines as well.

~~> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in > > Sections [[versions/v31/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] - [[versions/v31/sections/binding#Comparison with C|Comparison with C]] . In particular, refer to > > Sections [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] and [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] on pages [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Subscript Triplets|Problems Due to Data Copying and Sequence Association with Subscript Triplets]] - [[versions/v31/sections/binding#Problems Due to Data Copying and Sequence Association with Vector Subscripts|Problems Due to Data Copying and Sequence Association with Vector Subscripts]] about “<span class="sans-serif">Problems Due to Data Copying and Sequence Association with Subscript Triplets</span>” and “<span class="sans-serif">Vector Subscripts</span>”, > > and Sections [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] - [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] on pages [[versions/v31/sections/binding#Optimization Problems, an Overview|Optimization Problems, an Overview]] - [[versions/v31/sections/binding#Permanent Data Movement|Permanent Data Movement]] about “<span class="sans-serif">Optimization Problems</span>”, “<span class="sans-serif">Code Movements and Register Optimization</span>”, “<span class="sans-serif">Temporary Data Movements</span>” and “<span class="sans-serif">Permanent Data Movements</span>”.~~

==> To prevent problems with the argument copying and register optimization done by Fortran compilers, please note the hints in Sections [[versions/v31/sections/binding#Problems With Fortran Bindings for MPI|Problems With Fortran Bindings for MPI]] – [[versions/v31/sections/binding#Comparison with C|Comparison with C]] .==

==To ensure portability, arithmetic on MPI addresses must be performed using the [[versions/v31/API/MPI_AINT_ADD|MPI_AINT_ADD]] and [[versions/v31/API/MPI_AINT_DIFF|MPI_AINT_DIFF]] functions.==

==![[versions/v31/API/MPI_AINT_ADD]]==

==[[versions/v31/API/MPI_AINT_ADD|MPI_AINT_ADD]] produces a new `MPI_Aint` value that is equivalent to the sum of the `base` and `disp` arguments, where `base` represents a base address returned by a call to [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and `disp` represents a signed integer displacement. The resulting address is valid only at the process that generated `base`, and it must correspond to a location in the same object referenced by `base`, as described in Section [[versions/v31/sections/datatypes#Correct Use of Addresses|Correct Use of Addresses]] . The addition is performed in a manner that results in the correct `MPI_Aint` representation of the output address, as if the process that originally produced `base` had called:==

==    MPI_Get_address((char *) base + disp, &result);==

==![[versions/v31/API/MPI_AINT_DIFF]]==

==[[versions/v31/API/MPI_AINT_DIFF|MPI_AINT_DIFF]] produces a new `MPI_Aint` value that is equivalent to the difference between `addr1` and `addr2` arguments, where `addr1` and `addr2` represent addresses returned by calls to [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] . The resulting address is valid only at the process that generated `addr1` and `addr2`, and `addr1` and `addr2` must correspond to locations in the same object in the same process, as described in Section [[versions/v31/sections/datatypes#Correct Use of Addresses|Correct Use of Addresses]] . The difference is calculated in a manner that results in the signed difference from `addr1` to `addr2`, as if the process that originally produced the addresses had called `(char *) addr1 - (char *) addr2` on the addresses initially passed to [[versions/v31/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] .==

~~`MPI_TYPE_SIZE`~~ ==[[versions/v31/API/MPI_TYPE_SIZE|MPI_TYPE_SIZE]]== and ~~`MPI_TYPE_SIZE_X`~~ ==[[versions/v31/API/MPI_TYPE_SIZE_X|MPI_TYPE_SIZE_X]]== set the value of `size` to the total size, in bytes, of the entries in the type signature associated with `datatype`; i.e., the total size of the data in a message that would be created with this datatype. Entries that occur multiple times in the datatype are counted with their multiplicity.

### MPI-3.1 → MPI-4.0  (3 changed paragraphs)

> In the `mpi_f08` module, the `location` argument is not defined with `INTENT(IN)` because existing applications may use [[versions/v40/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] as a substitute for [[versions/v40/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] ~~that~~ ==, which== was not defined before MPI-3.0.

REAL A(100,100) INTEGER(KIND=MPI_ADDRESS_KIND) I1, I2, DIFF CALL MPI_GET_ADDRESS(A(1,1), I1, IERROR) CALL MPI_GET_ADDRESS(A(10,10), I2, IERROR) DIFF = MPI_AINT_DIFF(I2, I1) ! The value of DIFF is ~~909*sizeofreal;~~ ==909*SIZEOF(REAL);== the values of I1 and I2 are ! implementation dependent.

> C users may be tempted to avoid the usage of [[versions/v40/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] and rely on the availability of the address operator ~~&.~~ ==`&`.== Note, however, that `&` *cast-expression* is a pointer, not an address. ISO C does not require that the value of a pointer (or the pointer cast to `int`) be the absolute address of the object pointed ~~at — although~~ ==at—although== this is commonly the case. Furthermore, referencing may not have a unique definition on machines with a segmented address space. The use of [[versions/v40/API/MPI_GET_ADDRESS|MPI_GET_ADDRESS]] to “reference” C variables guarantees portability to such machines as well.

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/datatypes#Address and Size Functions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/datatypes#Address and Size Functions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/datatypes#Address and Size Functions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/datatypes#Address and Size Functions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/datatypes#Address and Size Functions]]

---
title: "Examples for Communication Calls"
chapter: one-side
present_in: ["MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Examples for Communication Calls

Chapter **one-side** · in [[versions/v30/sections/one-side#Examples for Communication Calls|MPI-3.0]], [[versions/v31/sections/one-side#Examples for Communication Calls|MPI-3.1]], [[versions/v40/sections/one-side#Examples for Communication Calls|MPI-4.0]], [[versions/v41/sections/one-side#Examples for Communication Calls|MPI-4.1]], [[versions/v50/sections/one-side#Examples for Communication Calls|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

We show how to implement the generic indirect assignment `A = B(map)`, where `A`, `B`, and `map` have the same distribution, and `map` is a permutation. To simplify, we assume a block distribution with equal size blocks.

A simpler version can be written that does not require that a datatype be built for the target buffer. But, one then needs a separate get call for each entry, as illustrated below. This code is much simpler, but usually much less efficient, for large arrays.

### MPI-3.1 → MPI-4.0  (6 changed paragraphs)

INTEGER otype(p), oindex(m), & ! used to construct origin datatypes ttype(p), tindex(m), & ! used to construct target datatypes count(p), total(p), & disp_int, win, ierr ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== lowerbound, size, realextent, disp_aint

CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound, realextent, ierr) disp_int = realextent size = m * realextent CALL MPI_WIN_CREATE(B, size, disp_int, MPI_INFO_NULL, & comm, win, ierr)

DO i=1,p count(i) = 0 END DO DO i=1,m j = map(i)/m+1 count(j) = count(j)+1 END DO

total(1) = 0 DO i=2,p total(i) = total(i-1) + count(i-1) END DO

DO i=1,p count(i) = 0 END DO

DO i=1,m j = map(i)/m+1 k = MOD(map(i),m)+1 count(j) = count(j)+1 oindex(total(j) + count(j)) = i tindex(total(j) + count(j)) = k END DO

! create origin and target datatypes for each get operation DO i=1,p CALL MPI_TYPE_CREATE_INDEXED_BLOCK(count(i), 1, & oindex(total(i)+1:total(i)+count(i)), & MPI_REAL, otype(i), ierr) CALL MPI_TYPE_COMMIT(otype(i), ierr) CALL MPI_TYPE_CREATE_INDEXED_BLOCK(count(i), 1, & tindex(total(i)+1:total(i)+count(i)), & MPI_REAL, ttype(i), ierr) CALL MPI_TYPE_COMMIT(ttype(i), ierr) END DO

! this part does the assignment itself CALL MPI_WIN_FENCE(0, win, ierr) disp_aint = 0 DO i=1,p CALL MPI_GET(A, 1, otype(i), i-1, disp_aint, 1, ttype(i), win, ierr) END DO CALL MPI_WIN_FENCE(0, win, ierr)

CALL MPI_WIN_FREE(win, ierr) DO i=1,p CALL MPI_TYPE_FREE(otype(i), ierr) CALL MPI_TYPE_FREE(ttype(i), ierr) END DO RETURN END

SUBROUTINE MAPVALS(A, B, map, m, comm, p) USE MPI INTEGER m, map(m), comm, p REAL A(m), B(m) INTEGER disp_int, win, ierr ~~INTEGER (KIND=MPI_ADDRESS_KIND)~~ ==INTEGER(KIND=MPI_ADDRESS_KIND)== lowerbound, size, realextent, disp_aint

CALL MPI_WIN_FENCE(0, win, ierr) DO i=1,m j = map(i)/m disp_aint = MOD(map(i),m) CALL MPI_GET(A(i), 1, MPI_REAL, j, disp_aint, 1, MPI_REAL, win, ierr) END DO CALL MPI_WIN_FENCE(0, win, ierr) CALL MPI_WIN_FREE(win, ierr) RETURN END

### MPI-4.0 → MPI-4.1  (4 changed paragraphs)

These examples show the use of the [[versions/v41/API/MPI_GET|MPI_GET]] ~~function.~~ ==procedure.== As all MPI RMA communication ~~functions~~ ==procedures== are nonblocking, ~~they~~ ==the associated operations== must be ~~completed.~~ ==completed by subsequent calls to synchronization procedures.== In the ~~following, this~~ ==following example, completion== is accomplished with the routine [[versions/v41/API/MPI_WIN_FENCE|MPI_WIN_FENCE]] , introduced in Section [[versions/v41/sections/one-side#Synchronization Calls|Synchronization Calls]] .

==[language={[MPI]Fortran},basicstyle=]== SUBROUTINE MAPVALS(A, B, map, m, comm, p) USE MPI INTEGER m, map(m), comm, p REAL A(m), B(m)

INTEGER otype(p), oindex(m), & ! used to construct origin datatypes ttype(p), tindex(m), & ! used to construct target datatypes count(p), total(p), & disp_int, win, ~~ierr~~ ==ierr, i, j, k== INTEGER(KIND=MPI_ADDRESS_KIND) lowerbound, size, realextent, disp_aint

! create origin and target datatypes for each get operation DO i=1,p CALL MPI_TYPE_CREATE_INDEXED_BLOCK(count(i), 1, & oindex(total(i)+1:total(i)+count(i)), & MPI_REAL, otype(i), ierr) CALL MPI_TYPE_COMMIT(otype(i), ierr) CALL MPI_TYPE_CREATE_INDEXED_BLOCK(count(i), 1, & tindex(total(i)+1:total(i)+count(i)), & MPI_REAL, ttype(i), ierr) CALL MPI_TYPE_COMMIT(ttype(i), ierr) END DO

~~A simpler version can be written that does not require that a datatype be built for the target buffer. But, one then needs a separate get call for each entry, as illustrated below. This code is much simpler, but usually much less efficient, for large arrays.~~

~~    SUBROUTINE MAPVALS(A, B, map, m, comm, p)     USE MPI     INTEGER m, map(m), comm, p     REAL A(m), B(m)     INTEGER disp_int, win, ierr     INTEGER(KIND=MPI_ADDRESS_KIND) lowerbound, size, realextent, disp_aint~~

~~    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound, realextent, ierr)     disp_int = realextent     size = m * realextent     CALL MPI_WIN_CREATE(B, size, disp_int, MPI_INFO_NULL,  &                         comm, win, ierr)~~

~~    CALL MPI_WIN_FENCE(0, win, ierr)     DO i=1,m        j = map(i)/m        disp_aint = MOD(map(i),m)        CALL MPI_GET(A(i), 1, MPI_REAL, j, disp_aint, 1, MPI_REAL, win, ierr)     END DO     CALL MPI_WIN_FENCE(0, win, ierr)     CALL MPI_WIN_FREE(win, ierr)     RETURN     END~~

==A simpler version can be written that does not require that a datatype be built for the target buffer. One then needs a separate get operation for each entry, as illustrated below. This code is much simpler, but usually much less efficient, for large arrays.==

==(code block added)==
``` [MPI]Fortran
SUBROUTINE MAPVALS(A, B, map, m, comm, p)
USE MPI
INTEGER m, map(m), comm, p
REAL A(m), B(m)
INTEGER disp_int, i, j, win, ierr
INTEGER(KIND=MPI_ADDRESS_KIND) lowerbound, size, realextent, disp_aint

CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound, realextent, ierr)
disp_int = realextent
size = m * realextent
CALL MPI_WIN_CREATE(B, size, disp_int, MPI_INFO_NULL,  &
                    comm, win, ierr)

CALL MPI_WIN_FENCE(0, win, ierr)
DO i=1,m
   j = map(i)/m
   disp_aint = MOD(map(i),m)
   CALL MPI_GET(A(i), 1, MPI_REAL, j, disp_aint, 1, MPI_REAL, win, ierr)
END DO
CALL MPI_WIN_FENCE(0, win, ierr)
CALL MPI_WIN_FREE(win, ierr)
RETURN
END
```

## Text by release

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Examples for Communication Calls]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Examples for Communication Calls]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Examples for Communication Calls]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Examples for Communication Calls]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Examples for Communication Calls]]

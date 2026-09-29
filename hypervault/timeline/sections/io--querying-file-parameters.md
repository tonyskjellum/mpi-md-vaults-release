---
title: "Querying File Parameters"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# Querying File Parameters

Chapter **io** · in [[versions/v20/sections/io#Querying File Parameters|MPI-2.0]], [[versions/v21/sections/io#Querying File Parameters|MPI-2.1]], [[versions/v22/sections/io#Querying File Parameters|MPI-2.2]], [[versions/v30/sections/io#Querying File Parameters|MPI-3.0]], [[versions/v31/sections/io#Querying File Parameters|MPI-3.1]], [[versions/v40/sections/io#Querying File Parameters|MPI-4.0]], [[versions/v41/sections/io#Querying File Parameters|MPI-4.1]], [[versions/v50/sections/io#Querying File Parameters|MPI-5.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

This routine could be called successively to decode `amode`, one bit at a time. For example, the following code fragment would check for ~~MPI_MODE_RDONLY.~~ ==`MPI_MODE_RDONLY`.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~`MPI_FILE_GET_GROUP` returns~~

~~a duplicate of~~

~~the group of the communicator used to open the file~~

~~associated with~~

==`MPI_FILE_GET_GROUP` returns a duplicate of the group of the communicator used to open the file associated with==

~~`MPI_FILE_GET_AMODE` returns, in `amode`,~~

~~the access mode of the file associated with `fh`.~~

==`MPI_FILE_GET_AMODE` returns, in `amode`, the access mode of the file associated with `fh`.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

~~`MPI_FILE_GET_GROUP` returns a duplicate of the group of the communicator used to open the file associated with~~

~~`fh`. The group is returned in `group`. The user is responsible for freeing `group`.~~

==[[versions/v31/API/MPI_FILE_GET_GROUP|MPI_FILE_GET_GROUP]] returns a duplicate of the group of the communicator used to open the file associated with `fh`. The group is returned in `group`. The user is responsible for freeing `group`.==

~~`MPI_FILE_GET_AMODE`~~ ==[[versions/v31/API/MPI_FILE_GET_AMODE|MPI_FILE_GET_AMODE]]== returns, in `amode`, the access mode of the file associated with `fh`.

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

SUBROUTINE BIT_QUERY(TEST_BIT, MAX_BIT, AMODE, BIT_FOUND) ! ! TEST IF THE INPUT TEST_BIT IS SET IN THE INPUT AMODE ! IF SET, RETURN 1 IN BIT_FOUND, 0 OTHERWISE ! INTEGER TEST_BIT, AMODE, BIT_FOUND, CP_AMODE, HIFOUND BIT_FOUND = 0 CP_AMODE = AMODE 100 CONTINUE LBIT = 0 HIFOUND = 0 DO ~~20~~ L = MAX_BIT, 0, -1 MATCHER = 2**L IF (CP_AMODE .GE. MATCHER .AND. HIFOUND .EQ. 0) THEN HIFOUND = 1 LBIT = MATCHER CP_AMODE = CP_AMODE - MATCHER END IF ~~20 CONTINUE~~ ==END DO== IF (HIFOUND .EQ. 1 .AND. LBIT .EQ. TEST_BIT) BIT_FOUND = 1 IF (BIT_FOUND .EQ. 0 .AND. HIFOUND .EQ. 1 .AND. & CP_AMODE .GT. 0) GO TO 100 END

CALL BIT_QUERY(MPI_MODE_RDONLY, 30, AMODE, BIT_FOUND) IF (BIT_FOUND .EQ. 1) THEN PRINT *, ' FOUND READ-ONLY BIT IN AMODE=', AMODE ELSE PRINT *, ' READ-ONLY BIT NOT FOUND IN AMODE=', AMODE END IF

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

~~    SUBROUTINE BIT_QUERY(TEST_BIT, MAX_BIT, AMODE, BIT_FOUND)     !     !   TEST IF THE INPUT TEST_BIT IS SET IN THE INPUT AMODE     !   IF SET, RETURN 1 IN BIT_FOUND, 0 OTHERWISE     !         INTEGER TEST_BIT, AMODE, BIT_FOUND, CP_AMODE, HIFOUND         BIT_FOUND = 0         CP_AMODE = AMODE     100 CONTINUE         LBIT = 0         HIFOUND = 0         DO L = MAX_BIT, 0, -1            MATCHER = 2**L            IF (CP_AMODE .GE. MATCHER .AND. HIFOUND .EQ. 0) THEN                HIFOUND = 1               LBIT = MATCHER               CP_AMODE = CP_AMODE - MATCHER            END IF         END DO         IF (HIFOUND .EQ. 1 .AND. LBIT .EQ. TEST_BIT) BIT_FOUND = 1         IF (BIT_FOUND .EQ. 0 .AND. HIFOUND .EQ. 1 .AND. &             CP_AMODE .GT. 0) GO TO 100     END~~

==(code block added)==
``` [MPI]Fortran
SUBROUTINE BIT_QUERY(TEST_BIT, MAX_BIT, AMODE, BIT_FOUND)
!
!   TEST IF THE INPUT TEST_BIT IS SET IN THE INPUT AMODE
!   IF SET, RETURN 1 IN BIT_FOUND, 0 OTHERWISE
!
    INTEGER TEST_BIT, AMODE, BIT_FOUND, CP_AMODE, HIFOUND
    INTEGER L, LBIT, MATCHER, MAX_BIT
    BIT_FOUND = 0
    CP_AMODE = AMODE
100 CONTINUE
    LBIT = 0
    HIFOUND = 0
    DO L = MAX_BIT, 0, -1
       MATCHER = 2**L
       IF (CP_AMODE .GE. MATCHER .AND. HIFOUND .EQ. 0) THEN
          HIFOUND = 1
          LBIT = MATCHER
          CP_AMODE = CP_AMODE - MATCHER
       END IF
    END DO
    IF (HIFOUND .EQ. 1 .AND. LBIT .EQ. TEST_BIT) BIT_FOUND = 1
    IF (BIT_FOUND .EQ. 0 .AND. HIFOUND .EQ. 1 .AND. &
       CP_AMODE .GT. 0) GO TO 100
END
```

~~    CALL BIT_QUERY(MPI_MODE_RDONLY, 30, AMODE, BIT_FOUND)     IF (BIT_FOUND .EQ. 1) THEN        PRINT *, ' FOUND READ-ONLY BIT IN AMODE=', AMODE     ELSE        PRINT *, ' READ-ONLY BIT NOT FOUND IN AMODE=', AMODE     END IF~~

==(code block added)==
``` [MPI]Fortran
CALL BIT_QUERY(MPI_MODE_RDONLY, 30, AMODE, BIT_FOUND)
IF (BIT_FOUND .EQ. 1) THEN
   PRINT *, ' FOUND READ-ONLY BIT IN AMODE=', AMODE
ELSE
   PRINT *, ' READ-ONLY BIT NOT FOUND IN AMODE=', AMODE
END IF
```

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#Querying File Parameters]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#Querying File Parameters]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#Querying File Parameters]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#Querying File Parameters]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#Querying File Parameters]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#Querying File Parameters]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#Querying File Parameters]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#Querying File Parameters]]

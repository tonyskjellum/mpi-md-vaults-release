---
title: "The `argv` argument"
chapter: dynamic
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0"]
tags: [mpi/section, mpi/dynamic]
---

# The `argv` argument

Chapter **dynamic** · in [[versions/v20/sections/dynamic#The `argv` argument|MPI-2.0]], [[versions/v21/sections/dynamic#The `argv` argument|MPI-2.1]], [[versions/v22/sections/dynamic#The `argv` argument|MPI-2.2]], [[versions/v30/sections/dynamic#The `argv` argument|MPI-3.0]], [[versions/v31/sections/dynamic#The `argv` argument|MPI-3.1]], [[versions/v40/sections/dynamic#The `argv` argument|MPI-4.0]]

## Changes along the time axis

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

`argv` is an array of strings containing arguments that are passed to the program. The first element of `argv` is the first argument passed to `command`, not, as is conventional in some contexts, the command itself. The argument list is terminated by `NULL` in C and C++ and an empty string in Fortran. In Fortran, leading and trailing spaces are always stripped, so that a string consisting of all spaces is considered an empty string. The constant ~~MPI_ARGV_NULL~~ ==`MPI_ARGV_NULL`== may be used in C, C++ and Fortran to indicate an empty argument list. In C and C++, this constant is the same as NULL.

Arguments are supplied to the program if this is allowed by the operating system. In C, the [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] argument `argv` differs from the `argv` argument of `main` in two respects. First, it is shifted by one element. Specifically, `argv[0]` of `main` is provided by the implementation and conventionally contains the name of the program (given by `command`). `argv[1]` of `main` corresponds to `argv[0]` in [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , `argv[2]` of `main` to `argv[1]` of [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , etc. Second, `argv` of [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] must be null-terminated, so that its length can be determined. Passing an `argv` of ~~MPI_ARGV_NULL~~ ==`MPI_ARGV_NULL`== to [[versions/v22/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] results in `main` receiving `argc` of 1 and an `argv` whose element 0 is (conventionally) the name of the program.

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

`argv` is an array of strings containing arguments that are passed to the program. The first element of `argv` is the first argument passed to `command`, not, as is conventional in some contexts, the command itself. The argument list is terminated by `NULL` in C and ~~C++ and~~ an empty string in Fortran. In Fortran, leading and trailing spaces are always stripped, so that a string consisting of all spaces is considered an empty string. The constant `MPI_ARGV_NULL` may be used in ~~C, C++~~ ==C== and Fortran to indicate an empty argument list. In C ~~and C++,~~ this constant is the same as NULL.

~~Arguments are supplied to the program if this is allowed by the operating system. In C, the [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] argument `argv` differs from the `argv` argument of `main` in two respects. First, it is shifted by one element. Specifically, `argv[0]` of `main` is provided by the implementation and conventionally contains the name of the program (given by `command`). `argv[1]` of `main` corresponds to `argv[0]` in [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , `argv[2]` of `main` to `argv[1]` of [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , etc. Second, `argv` of [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] must be null-terminated, so that its length can be determined. Passing an `argv` of `MPI_ARGV_NULL` to [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] results in `main` receiving `argc` of 1 and an `argv` whose element 0 is (conventionally) the name of the program.~~

==Arguments are supplied to the program if this is allowed by the operating system. In C, the [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] argument `argv` differs from the `argv` argument of `main` in two respects. First, it is shifted by one element. Specifically, `argv[0]` of `main` is provided by the implementation and conventionally contains the name of the program (given by `command`). `argv[1]` of `main` corresponds to `argv[0]` in [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , `argv[2]` of `main` to `argv[1]` of [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , etc.==

==Passing an `argv` of `MPI_ARGV_NULL` to [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] results in `main` receiving `argc` of 1 and an `argv` whose element 0 is (conventionally) the name of the program. Second, `argv` of [[versions/v30/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] must be null-terminated, so that its length can be determined.==

### MPI-3.0 → MPI-3.1  (2 changed paragraphs)

`argv` is an array of strings containing arguments that are passed to the program. The first element of `argv` is the first argument passed to `command`, not, as is conventional in some contexts, the command itself. The argument list is terminated by `NULL` in C and an empty string in Fortran. In Fortran, leading and trailing spaces are always stripped, so that a string consisting of all spaces is considered an empty string. The constant `MPI_ARGV_NULL` may be used in C and Fortran to indicate an empty argument list. In C this constant is the same as ~~NULL.~~ ==`NULL`.==

~~Arguments are supplied to the program if this is allowed by the operating system. In C, the [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] argument `argv` differs from the `argv` argument of `main` in two respects. First, it is shifted by one element. Specifically, `argv[0]` of `main` is provided by the implementation and conventionally contains the name of the program (given by `command`). `argv[1]` of `main` corresponds to `argv[0]` in [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , `argv[2]` of `main` to `argv[1]` of [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , etc.~~

~~Passing an `argv` of `MPI_ARGV_NULL` to [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] results in `main` receiving `argc` of 1 and an `argv` whose element 0 is (conventionally) the name of the program. Second, `argv` of [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] must be null-terminated, so that its length can be determined.~~

==Arguments are supplied to the program if this is allowed by the operating system. In C, the [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] argument `argv` differs from the `argv` argument of `main` in two respects. First, it is shifted by one element. Specifically, `argv[0]` of `main` is provided by the implementation and conventionally contains the name of the program (given by `command`). `argv[1]` of `main` corresponds to `argv[0]` in [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , `argv[2]` of `main` to `argv[1]` of [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] , etc. Passing an `argv` of `MPI_ARGV_NULL` to [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] results in `main` receiving `argc` of 1 and an `argv` whose element 0 is (conventionally) the name of the program. Second, `argv` of [[versions/v31/API/MPI_COMM_SPAWN|MPI_COMM_SPAWN]] must be null-terminated, so that its length can be determined.==

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

CHARACTER*25 command, argv(3) command = ~~' ocean '~~ =='ocean'== argv(1) = ~~' -gridfile '~~ =='-gridfile'== argv(2) = ~~' ocean1.grd'~~ =='ocean1.grd'== argv(3) = ' ' call MPI_COMM_SPAWN(command, argv, ...)

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/dynamic#The `argv` argument]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/dynamic#The `argv` argument]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/dynamic#The `argv` argument]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/dynamic#The `argv` argument]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/dynamic#The `argv` argument]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/dynamic#The `argv` argument]]

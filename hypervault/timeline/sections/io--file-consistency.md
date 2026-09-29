---
title: "File Consistency"
chapter: io
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/io]
---

# File Consistency

Chapter **io** · in [[versions/v20/sections/io#File Consistency|MPI-2.0]], [[versions/v21/sections/io#File Consistency|MPI-2.1]], [[versions/v22/sections/io#File Consistency|MPI-2.2]], [[versions/v30/sections/io#File Consistency|MPI-3.0]], [[versions/v31/sections/io#File Consistency|MPI-3.1]], [[versions/v40/sections/io#File Consistency|MPI-4.0]], [[versions/v41/sections/io#File Consistency|MPI-4.1]], [[versions/v50/sections/io#File Consistency|MPI-5.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~Consistency semantics define the outcome of multiple accesses to a single file. All file accesses in MPI are relative to a specific file handle created from a collective open. MPI provides three levels of consistency: sequential consistency among all accesses using a single file handle, sequential consistency among all accesses using file handles created from a single collective open with atomic mode enabled, and~~

~~user-imposed consistency among accesses other than the above.~~

~~Sequential consistency means the behavior of a set of operations will be as if the operations were performed in some serial order consistent with program order; each access appears atomic, although the exact ordering of accesses is unspecified.~~

~~User-imposed consistency may be obtained using program order and calls to `MPI_FILE_SYNC`.~~

==Consistency semantics define the outcome of multiple accesses to a single file. All file accesses in MPI are relative to a specific file handle created from a collective open. MPI provides three levels of consistency: sequential consistency among all accesses using a single file handle, sequential consistency among all accesses using file handles created from a single collective open with atomic mode enabled, and user-imposed consistency among accesses other than the above.==

==Sequential consistency means the behavior of a set of operations will be as if the operations were performed in some serial order consistent with program order; each access appears atomic, although the exact ordering of accesses is unspecified. User-imposed consistency may be obtained using program order and calls to `MPI_FILE_SYNC`.==

~~Let $`SEQ_{fh}`$ be a sequence of file operations on a single file handle, bracketed by `MPI_FILE_SYNC`s on that file handle.~~

~~(Both opening and closing a file implicitly perform an `MPI_FILE_SYNC`.)~~

~~$`SEQ_{fh}`$ is a “write sequence” if any of the data access operations in the sequence are writes or if any of the file manipulation operations in the sequence change the state of the file~~

~~(e.g., `MPI_FILE_SET_SIZE` or `MPI_FILE_PREALLOCATE`).~~

~~Given two sequences, $`SEQ_1`$ and $`SEQ_2`$, we say they~~

~~are not *concurrent*~~

==Let $`SEQ_{fh}`$ be a sequence of file operations on a single file handle, bracketed by `MPI_FILE_SYNC`s on that file handle. (Both opening and closing a file implicitly perform an `MPI_FILE_SYNC`.) $`SEQ_{fh}`$ is a “write sequence” if any of the data access operations in the sequence are writes or if any of the file manipulation operations in the sequence change the state of the file (e.g., `MPI_FILE_SET_SIZE` or `MPI_FILE_PREALLOCATE`). Given two sequences, $`SEQ_1`$ and $`SEQ_2`$, we say they are not *concurrent*==

### MPI-3.0 → MPI-3.1  (4 changed paragraphs)

~~Consistency semantics define the outcome of multiple accesses to a single file. All file accesses in MPI are relative to a specific file handle created from a collective open. MPI provides three levels of consistency: sequential consistency among all accesses using a single file handle, sequential consistency among all accesses using file handles created from a single collective open with atomic mode enabled, and user-imposed consistency among accesses other than the above.~~

~~Sequential consistency means the behavior of a set of operations will be as if the operations were performed in some serial order consistent with program order; each access appears atomic, although the exact ordering of accesses is unspecified. User-imposed consistency may be obtained using program order and calls to `MPI_FILE_SYNC`.~~

==Consistency semantics define the outcome of multiple accesses to a single file. All file accesses in MPI are relative to a specific file handle created from a collective open. MPI provides three levels of consistency: sequential consistency among all accesses using a single file handle, sequential consistency among all accesses using file handles created from a single collective open with atomic mode enabled, and user-imposed consistency among accesses other than the above. Sequential consistency means the behavior of a set of operations will be as if the operations were performed in some serial order consistent with program order; each access appears atomic, although the exact ordering of accesses is unspecified. User-imposed consistency may be obtained using program order and calls to [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] .==

~~For the purpose of consistency semantics, a matched pair (Section [[versions/v31/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] , page [[versions/v31/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] ) of split collective data access operations (e.g., `MPI_FILE_READ_ALL_BEGIN` and `MPI_FILE_READ_ALL_END`) compose a single data access operation. Similarly, a nonblocking data access routine (e.g., `MPI_FILE_IREAD`) and the routine which completes the request~~

~~(e.g., `MPI_WAIT`) also compose a single data access operation.~~

~~For all cases below, these data access operations are subject to the same constraints as blocking data access operations.~~

==For the purpose of consistency semantics, a matched pair ( [[versions/v31/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] ) of split collective data access operations (e.g., [[versions/v31/API/MPI_FILE_READ_ALL_BEGIN|MPI_FILE_READ_ALL_BEGIN]] and [[versions/v31/API/MPI_FILE_READ_ALL_END|MPI_FILE_READ_ALL_END]] ) compose a single data access operation. Similarly, a nonblocking data access routine (e.g., [[versions/v31/API/MPI_FILE_IREAD|MPI_FILE_IREAD]] ) and the routine which completes the request (e.g., [[versions/v31/API/MPI_WAIT|MPI_WAIT]] ) also compose a single data access operation. For all cases below, these data access operations are subject to the same constraints as blocking data access operations.==

> For an ~~`MPI_FILE_IREAD`~~ ==[[versions/v31/API/MPI_FILE_IREAD|MPI_FILE_IREAD]]== and ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== pair, the operation begins when ~~`MPI_FILE_IREAD`~~ ==[[versions/v31/API/MPI_FILE_IREAD|MPI_FILE_IREAD]]== is called and ends when ~~`MPI_WAIT`~~ ==[[versions/v31/API/MPI_WAIT|MPI_WAIT]]== returns.

~~Let $`SEQ_{fh}`$ be a sequence of file operations on a single file handle, bracketed by `MPI_FILE_SYNC`s on that file handle. (Both opening and closing a file implicitly perform an `MPI_FILE_SYNC`.) $`SEQ_{fh}`$ is a “write sequence” if any of the data access operations in the sequence are writes or if any of the file manipulation operations in the sequence change the state of the file (e.g., `MPI_FILE_SET_SIZE` or `MPI_FILE_PREALLOCATE`). Given two sequences, $`SEQ_1`$ and $`SEQ_2`$, we say they are not *concurrent*~~

~~if one sequence is guaranteed to completely precede the other (temporally).~~

==Let $`SEQ_{fh}`$ be a sequence of file operations on a single file handle, bracketed by [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] s on that file handle. (Both opening and closing a file implicitly perform an [[versions/v31/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] .) $`SEQ_{fh}`$ is a “write sequence” if any of the data access operations in the sequence are writes or if any of the file manipulation operations in the sequence change the state of the file (e.g., [[versions/v31/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] or [[versions/v31/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] ). Given two sequences, $`SEQ_1`$ and $`SEQ_2`$, we say they are not *concurrent* if one sequence is guaranteed to completely precede the other (temporally).==

### MPI-4.0 → MPI-4.1  (3 changed paragraphs)

For the purpose of consistency semantics, a matched pair ( [[versions/v41/sections/io#Split Collective Data Access Routines|Split Collective Data Access Routines]] ) of split collective data access operations (e.g., [[versions/v41/API/MPI_FILE_READ_ALL_BEGIN|MPI_FILE_READ_ALL_BEGIN]] and [[versions/v41/API/MPI_FILE_READ_ALL_END|MPI_FILE_READ_ALL_END]] ) compose a single data access operation. Similarly, a nonblocking data access routine (e.g., [[versions/v41/API/MPI_FILE_IREAD|MPI_FILE_IREAD]] ) and the routine ~~which~~ ==that== completes the request (e.g., [[versions/v41/API/MPI_WAIT|MPI_WAIT]] ) also compose a single data access operation. For all cases below, these data access operations are subject to the same constraints as blocking data access operations.

Assume that $`A_1`$ and $`A_2`$ are two data access operations. Let $`D_1`$ ($`D_2`$) be the set of absolute byte displacements of every byte accessed in $`A_1`$ ($`A_2`$). The two data accesses ~~*overlap*~~ ==**overlap**== if $`D_1 \cap D_2 \not= \emptyset`$. The two data accesses ~~*conflict*~~ ==**conflict**== if they overlap and at least one is a write access.

Let $`SEQ_{fh}`$ be a sequence of file operations on a single file handle, bracketed by [[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] s on that file handle. (Both opening and closing a file implicitly perform an [[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] .) $`SEQ_{fh}`$ is a “write sequence” if any of the data access operations in the sequence are writes or if any of the file manipulation operations in the sequence change the state of the file (e.g., [[versions/v41/API/MPI_FILE_SET_SIZE|MPI_FILE_SET_SIZE]] or [[versions/v41/API/MPI_FILE_PREALLOCATE|MPI_FILE_PREALLOCATE]] ). Given two sequences, $`SEQ_1`$ and $`SEQ_2`$, we say they are not ~~*concurrent*~~ ==**concurrent**== if one sequence is guaranteed to completely precede the other (temporally).

==**Case 1: $`fh_1 \in FH_1`$.** All operations on $`fh_1`$ are sequentially consistent if atomic mode is set. If nonatomic mode is set, then all operations on $`fh_1`$ are sequentially consistent if they are either nonconcurrent, nonconflicting, or both.==

==**Case 2: $`fh_{1a} \in FH_1`$ and $`fh_{1b} \in FH_1`$.**==

==Assume $`A_1`$ is a data access operation using $`fh_{1a}`$, and $`A_2`$ is a data access operation using $`fh_{1b}`$. If for any access $`A_1`$, there is no access $`A_2`$ that conflicts with $`A_1`$, then MPI guarantees sequential consistency.==

==However, unlike POSIX semantics, the default MPI semantics for conflicting accesses do not guarantee sequential consistency. If $`A_1`$ and $`A_2`$ conflict, sequential consistency can be guaranteed by either enabling atomic mode via the [[versions/v41/API/MPI_FILE_SET_ATOMICITY|MPI_FILE_SET_ATOMICITY]] routine, or meeting the condition described in Case 3 below.==

==**Case 3: $`fh_1 \in FH_1`$ and $`fh_2 \in FH_2`$.** Consider access to a single file using file handles from distinct collective opens. In order to guarantee sequential consistency, [[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] must be used (both opening and closing a file implicitly perform an [[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] ).==

==Sequential consistency is guaranteed among accesses to a single file if for any write sequence $`SEQ_1`$ to the file, there is no sequence $`SEQ_2`$ to the file that is *concurrent* with $`SEQ_1`$. To guarantee sequential consistency when there are write sequences, [[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] must be used together with a mechanism that guarantees nonconcurrency of the sequences.==

==See the examples in [[versions/v41/sections/io#Examples|Examples]] for further clarification of some of these consistency semantics.==

==![[versions/v41/API/MPI_FILE_SET_ATOMICITY]]==

==Let $`FH`$ be the set of file handles created by one collective open. The consistency semantics for data access operations using $`FH`$ is set by collectively calling [[versions/v41/API/MPI_FILE_SET_ATOMICITY|MPI_FILE_SET_ATOMICITY]] on $`FH`$. [[versions/v41/API/MPI_FILE_SET_ATOMICITY|MPI_FILE_SET_ATOMICITY]] is collective; all processes in the group must pass identical values for `fh` and `flag`. If `flag` is `true`, atomic mode is set; if `flag` is `false`, nonatomic mode is set.==

==Changing the consistency semantics for an open file only affects new data accesses. All completed data accesses are guaranteed to abide by the consistency semantics in effect during their execution. Nonblocking data accesses and split collective operations that have not completed (e.g., via [[versions/v41/API/MPI_WAIT|MPI_WAIT]] ) are only guaranteed to abide by nonatomic mode consistency semantics.==

==> [!warning] Advice to implementors==

==> Since the semantics guaranteed by atomic mode are stronger than those guaranteed by nonatomic mode, an implementation is free to adhere to the more stringent atomic mode semantics for outstanding requests.==

==![[versions/v41/API/MPI_FILE_GET_ATOMICITY]]==

==[[versions/v41/API/MPI_FILE_GET_ATOMICITY|MPI_FILE_GET_ATOMICITY]] returns the current consistency semantics for data access operations on the set of file handles created by one collective open. If `flag` is `true`, atomic mode is enabled; if `flag` is `false`, nonatomic mode is enabled.==

==![[versions/v41/API/MPI_FILE_SYNC]]==

==Calling [[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] with `fh` causes all previous writes to `fh` by the calling process to be transferred to the storage device. If other processes have made updates to the storage device, then all such updates become visible to subsequent reads of `fh` by the calling process. [[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] may be necessary to ensure sequential consistency in certain cases (see above).==

==[[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] is a collective operation.==

==The user is responsible for ensuring that all nonblocking requests and split collective operations on `fh` have been completed before calling [[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] —otherwise, the call to [[versions/v41/API/MPI_FILE_SYNC|MPI_FILE_SYNC]] is erroneous.==

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/io#File Consistency]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/io#File Consistency]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/io#File Consistency]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/io#File Consistency]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/io#File Consistency]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/io#File Consistency]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/io#File Consistency]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/io#File Consistency]]

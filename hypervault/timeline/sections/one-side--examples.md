---
title: "Examples"
chapter: one-side
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/one-side]
---

# Examples

Chapter **one-side** · in [[versions/v20/sections/one-side#Examples|MPI-2.0]], [[versions/v21/sections/one-side#Examples|MPI-2.1]], [[versions/v22/sections/one-side#Examples|MPI-2.2]], [[versions/v30/sections/one-side#Examples|MPI-3.0]], [[versions/v31/sections/one-side#Examples|MPI-3.1]], [[versions/v40/sections/one-side#Examples|MPI-4.0]], [[versions/v41/sections/one-side#Examples|MPI-4.1]], [[versions/v50/sections/one-side#Examples|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (4 changed paragraphs)

INTEGER otype(p), oindex(m), & ! used to construct origin datatypes ttype(p), tindex(m), & ! used to construct target datatypes count(p), total(p), & ~~sizeofreal,~~ win, ierr ==INTEGER (KIND=MPI_ADDRESS_KIND) lowerbound, sizeofreal==

CALL ~~MPI_TYPE_EXTENT(MPI_REAL,~~ ==MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound,== sizeofreal, ierr) CALL MPI_WIN_CREATE(B, m*sizeofreal, sizeofreal, MPI_INFO_NULL, & comm, win, ierr)

! create origin and target datatypes for each get operation DO i=1,p CALL ~~MPI_TYPE_INDEXED_BLOCK(count(i),~~ ==MPI_TYPE_CREATE_INDEXED_BLOCK(count(i),== 1, oindex(total(i)+1), & MPI_REAL, otype(i), ierr) CALL MPI_TYPE_COMMIT(otype(i), ierr) CALL ~~MPI_TYPE_INDEXED_BLOCK(count(i),~~ ==MPI_TYPE_CREATE_INDEXED_BLOCK(count(i),== 1, tindex(total(i)+1), & MPI_REAL, ttype(i), ierr) CALL MPI_TYPE_COMMIT(ttype(i), ierr) END DO

SUBROUTINE MAPVALS(A, B, map, m, comm, p) USE MPI INTEGER m, map(m), comm, p REAL A(m), B(m) INTEGER ~~sizeofreal,~~ win, ierr ==INTEGER (KIND=MPI_ADDRESS_KIND) lowerbound, sizeofreal==

CALL ~~MPI_TYPE_EXTENT(MPI_REAL,~~ ==MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound,== sizeofreal, ierr) CALL MPI_WIN_CREATE(B, m*sizeofreal, sizeofreal, MPI_INFO_NULL, & comm, win, ierr)

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

CALL MPI_WIN_FENCE(0, win, ierr) DO i=1,m j = ~~map(i)/p~~ ==map(i)/m== k = ~~MOD(map(i),p)~~ ==MOD(map(i),m)== CALL MPI_GET(A(i), 1, MPI_REAL, j, k, 1, MPI_REAL, win, ierr) END DO CALL MPI_WIN_FENCE(0, win, ierr) CALL MPI_WIN_FREE(win, ierr) RETURN END

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

~~We show how to implement the generic indirect assignment `A = B(map)`, where `A, B` and `map` have the same distribution, and `map` is a permutation. To simplify, we assume a block distribution with equal size blocks.~~

~~    SUBROUTINE MAPVALS(A, B, map, m, comm, p)     USE MPI     INTEGER m, map(m), comm, p     REAL A(m), B(m)~~

~~    INTEGER otype(p), oindex(m),   & ! used to construct origin datatypes           ttype(p), tindex(m),      & ! used to construct target datatypes          count(p), total(p),       &          win, ierr     INTEGER (KIND=MPI_ADDRESS_KIND) lowerbound, sizeofreal~~

~~    ! This part does the work that depends on the locations of B.     ! Can be reused while this does not change~~

~~    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound, sizeofreal, ierr)     CALL MPI_WIN_CREATE(B, m*sizeofreal, sizeofreal, MPI_INFO_NULL,   &                          comm, win, ierr)~~

~~    ! This part does the work that depends on the value of map and     ! the locations of the arrays.     ! Can be reused while these do not change~~

~~    ! Compute number of entries to be received from each process~~

~~    DO i=1,p       count(i) = 0     END DO     DO i=1,m       j = map(i)/m+1       count(j) = count(j)+1     END DO~~

~~    total(1) = 0     DO i=2,p       total(i) = total(i-1) + count(i-1)     END DO~~

~~    DO i=1,p       count(i) = 0     END DO~~

~~    ! compute origin and target indices of entries.     ! entry i at current process is received from location     ! k at process (j-1), where map(i) = (j-1)*m + (k-1),     ! j = 1..p and k = 1..m~~

~~    DO i=1,m       j = map(i)/m+1       k = MOD(map(i),m)+1       count(j) = count(j)+1       oindex(total(j) + count(j)) = i       tindex(total(j) + count(j)) = k     END DO~~

~~    ! create origin and target datatypes for each get operation     DO i=1,p       CALL MPI_TYPE_CREATE_INDEXED_BLOCK(count(i), 1, oindex(total(i)+1),   &                                          MPI_REAL, otype(i), ierr)       CALL MPI_TYPE_COMMIT(otype(i), ierr)       CALL MPI_TYPE_CREATE_INDEXED_BLOCK(count(i), 1, tindex(total(i)+1),   &                                          MPI_REAL, ttype(i), ierr)       CALL MPI_TYPE_COMMIT(ttype(i), ierr)     END DO~~

~~    ! this part does the assignment itself     CALL MPI_WIN_FENCE(0, win, ierr)     DO i=1,p       CALL MPI_GET(A, 1, otype(i), i-1, 0, 1, ttype(i), win, ierr)     END DO     CALL MPI_WIN_FENCE(0, win, ierr)~~

~~    CALL MPI_WIN_FREE(win, ierr)     DO i=1,p       CALL MPI_TYPE_FREE(otype(i), ierr)       CALL MPI_TYPE_FREE(ttype(i), ierr)     END DO     RETURN     END~~

~~ A simpler version can be written that does not require that a datatype be built for the target buffer. But, one then needs a separate get call for each entry, as illustrated below. This code is much simpler, but usually much less efficient, for large arrays.~~

~~    SUBROUTINE MAPVALS(A, B, map, m, comm, p)     USE MPI     INTEGER m, map(m), comm, p     REAL A(m), B(m)     INTEGER win, ierr     INTEGER (KIND=MPI_ADDRESS_KIND) lowerbound, sizeofreal~~

~~    CALL MPI_TYPE_GET_EXTENT(MPI_REAL, lowerbound, sizeofreal, ierr)     CALL MPI_WIN_CREATE(B, m*sizeofreal, sizeofreal, MPI_INFO_NULL,  &                         comm, win, ierr)~~

~~    CALL MPI_WIN_FENCE(0, win, ierr)     DO i=1,m       j = map(i)/m       k = MOD(map(i),m)       CALL MPI_GET(A(i), 1, MPI_REAL, j, k, 1, MPI_REAL, win, ierr)     END DO     CALL MPI_WIN_FENCE(0, win, ierr)     CALL MPI_WIN_FREE(win, ierr)     RETURN     END~~

==The following example shows a generic loosely synchronous, iterative code, using fence synchronization. The window at each process consists of array `A`, which contains the origin and target buffers of the put calls.==

==    ...     while(!converged(A)){       update(A);       MPI_Win_fence(MPI_MODE_NOPRECEDE, win);       for(i=0; i < toneighbors; i++)         MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i],                              todisp[i], 1, totype[i], win);       MPI_Win_fence((MPI_MODE_NOSTORE | MPI_MODE_NOSUCCEED), win);       }==

==The same code could be written with get rather than put. Note that, during the communication phase, each window is concurrently read (as origin buffer of puts) and written (as target buffer of puts). This is OK, provided that there is no overlap between the target buffer of a put and another communication buffer.==

==Same generic example, with more computation/communication overlap. We assume that the update phase is broken into two subphases: the first, where the “boundary,” which is involved in communication, is updated, and the second, where the “core,” which neither uses nor provides communicated data, is updated.==

==    ...     while(!converged(A)){       update_boundary(A);       MPI_Win_fence((MPI_MODE_NOPUT | MPI_MODE_NOPRECEDE), win);       for(i=0; i < fromneighbors; i++)         MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i],                         fromdisp[i], 1, fromtype[i], win);       update_core(A);       MPI_Win_fence(MPI_MODE_NOSUCCEED, win);       }==

==The get communication can be concurrent with the core update, since they do not access the same locations, and the local update of the origin buffer by the get call can be concurrent with the local update of the core by the `update_core` call. In order to get similar overlap with put communication we would need to use separate windows for the core and for the boundary. This is required because we do not allow local stores to be concurrent with puts on the same, or on overlapping, windows.==

==Same code as in Example [[versions/v30/sections/one-side#Examples|Examples]] , rewritten using post-start-complete-wait.==

==    ...     while(!converged(A)){       update(A);       MPI_Win_post(fromgroup, 0, win);       MPI_Win_start(togroup, 0, win);       for(i=0; i < toneighbors; i++)         MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i],                              todisp[i], 1, totype[i], win);       MPI_Win_complete(win);       MPI_Win_wait(win);       }==

==Same example, with split phases, as in Example [[versions/v30/sections/one-side#Examples|Examples]] .==

==    ...     while(!converged(A)){       update_boundary(A);       MPI_Win_post(togroup, MPI_MODE_NOPUT, win);       MPI_Win_start(fromgroup, 0, win);       for(i=0; i < fromneighbors; i++)         MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i],                        fromdisp[i], 1, fromtype[i], win);       update_core(A);       MPI_Win_complete(win);       MPI_Win_wait(win);       }==

==A checkerboard, or double buffer communication pattern, that allows more computation/communication overlap. Array `A0` is updated using values of array `A1`, and vice versa. We assume that communication is symmetric: if process A gets data from process B, then process B gets data from process A. Window `wini` consists of array `Ai`.==

==    ...     if (!converged(A0,A1))       MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0);     MPI_Barrier(comm0);     /* the barrier is needed because the start call inside the     loop uses the nocheck option */     while(!converged(A0, A1)){       /* communication on A0 and computation on A1 */       update2(A1, A0); /* local update of A1 that depends on A0 (and A1) */       MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win0);       for(i=0; i < fromneighbors; i++)         MPI_Get(&tobuf0[i], 1, totype0[i], neighbor[i],                    fromdisp0[i], 1, fromtype0[i], win0);       update1(A1); /* local update of A1 that is                       concurrent with communication that updates A0 */        MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win1);       MPI_Win_complete(win0);       MPI_Win_wait(win0);==

==      /* communication on A1 and computation on A0 */       update2(A0, A1); /* local update of A0 that depends on A1 (and A0) */       MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win1);       for(i=0; i < fromneighbors; i++)         MPI_Get(&tobuf1[i], 1, totype1[i], neighbor[i],                     fromdisp1[i], 1, fromtype1[i], win1);       update1(A0); /* local update of A0 that depends on A0 only,                      concurrent with communication that updates A1 */       if (!converged(A0,A1))         MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0);       MPI_Win_complete(win1);       MPI_Win_wait(win1);       }==

==A process posts the local window associated with `win0` before it completes RMA accesses to the remote windows associated with `win1`. When the `wait(win1`) call returns, then all neighbors of the calling process have posted the windows associated with `win0`. Conversely, when the `wait(win0)` call returns, then all neighbors of the calling process have posted the windows associated with `win1`. Therefore, the nocheck option can be used with the calls to [[versions/v30/API/MPI_WIN_START|MPI_WIN_START]] .==

==Put calls can be used, instead of get calls, if the area of array `A0` (resp. `A1`) used by the `update(A1, A0)` (resp. `update(A0, A1)`) call is disjoint from the area modified by the RMA communication. On some systems, a put call may be more efficient than a get call, as it requires information exchange only in one direction.==

==In the next several examples, for conciseness, the expression==

==    z = MPI_Get_accumulate(...)==

==means to perform an [[versions/v30/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] with the result buffer (given by `result_addr` in the description of [[versions/v30/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] ) on the left side of the assignment, in this case, `z`. This format is also used with [[versions/v30/API/MPI_COMPARE_AND_SWAP|MPI_COMPARE_AND_SWAP]] .==

==The following example implements a naive, non-scalable counting sem­a­phore. The example demonstrates the use of [[versions/v30/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] to manipulate the public copy of X, as well as [[versions/v30/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] to complete operations without ending the access epoch opened with [[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] . To avoid the rules regarding synchronization of the public and private copies of windows, [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] and [[versions/v30/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] are used to write to or read from the local public copy.==

==    Process A:                                Process B:     MPI_Win_lock_all                          MPI_Win_lock_all     window location X     X=2     MPI_Win_sync     MPI_Barrier                               MPI_Barrier==

==    MPI_Accumulate(X, MPI_SUM, -1)            MPI_Accumulate(X, MPI_SUM, -1) ==

==    stack variable z                          stack variable z     do                                        do       z = MPI_Get_accumulate(X,                 z = MPI_Get_accumulate(X,             MPI_NO_OP, 0)                             MPI_NO_OP, 0)        MPI_Win_flush(A)                          MPI_Win_flush(A)     while(z!=0)                               while(z!=0)==

==    MPI_Win_unlock_all                        MPI_Win_unlock_all==

==Implementing a critical region between two processes (Peterson’s algorithm). Despite their appearance in the following example, [[versions/v30/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] and [[versions/v30/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] are not collective calls, but it is frequently useful to start shared access epochs to all processes from all other processes in a window. Once the access epochs are established, accumulate communication operations and flush and sync synchronization operations can be used to read from or write to the public copy of the window.==

==    Process A:                            Process B:     window location X                     window location Y     window location T==

==    MPI_Win_lock_all                      MPI_Win_lock_all     X=1                                   Y=1         MPI_Win_sync                          MPI_Win_sync     MPI_Barrier                           MPI_Barrier     MPI_Accumulate(T, MPI_REPLACE, 1)     MPI_Accumulate(T, MPI_REPLACE, 0)     stack variables t,y                   stack variable t,x     t=1                                   t=0     y=MPI_Get_accumulate(Y,               x=MPI_Get_accumulate(X,         MPI_NO_OP, 0)                         MPI_NO_OP, 0)     while(y==1 && t==1) do                while(x==1 && t==0) do       y=MPI_Get_accumulate(Y,               x=MPI_Get_accumulate(X,           MPI_NO_OP, 0)                         MPI_NO_OP, 0)        t=MPI_Get_accumulate(T,               t=MPI_Get_accumulate(T,           MPI_NO_OP, 0)                         MPI_NO_OP, 0)       MPI_Win_flush_all                     MPI_Win_flush(A)     done                                  done     // critical region                    // critical region     MPI_Accumulate(X, MPI_REPLACE, 0)     MPI_Accumulate(Y, MPI_REPLACE, 0)     MPI_Win_unlock_all                    MPI_Win_unlock_all==

==Implementing a critical region between multiple processes with compare and swap. The call to [[versions/v30/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] is necessary on Process A after local initialization of `A` to guarantee the public copy has been updated with the initialization value found in the private copy. It would also be valid to call [[versions/v30/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] with `MPI_REPLACE` to directly initialize the public copy. A call to [[versions/v30/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] would be necessary to assure `A` in the public copy of Process A had been updated before the barrier.==

==    Process A:                             Process B...:     MPI_Win_lock_all                       MPI_Win_lock_all     atomic location A                           A=0     MPI_Win_sync     MPI_Barrier                            MPI_Barrier     stack variable r=1                     stack variable r=1     while(r != 0) do                       while(r != 0) do       r = MPI_Compare_and_swap(A, 0, 1)      r = MPI_Compare_and_swap(A, 0, 1)          MPI_Win_flush(A)                       MPI_Win_flush(A)     done                                   done     // critical region                     // critical region     r = MPI_Compare_and_swap(A, 1, 0)      r = MPI_Compare_and_swap(A, 1, 0)        MPI_Win_unlock_all                     MPI_Win_unlock_all==

### MPI-3.0 → MPI-3.1  (6 changed paragraphs)

... while(!converged(A)){ update(A); MPI_Win_fence(MPI_MODE_NOPRECEDE, win); for(i=0; i < toneighbors; i++) MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i], todisp[i], 1, totype[i], win); MPI_Win_fence((MPI_MODE_NOSTORE | MPI_MODE_NOSUCCEED), win); }

... while(!converged(A)){ update_boundary(A); MPI_Win_fence((MPI_MODE_NOPUT | MPI_MODE_NOPRECEDE), win); for(i=0; i < fromneighbors; i++) MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i], fromdisp[i], 1, fromtype[i], win); update_core(A); MPI_Win_fence(MPI_MODE_NOSUCCEED, win); }

... while(!converged(A)){ update(A); MPI_Win_post(fromgroup, 0, win); MPI_Win_start(togroup, 0, win); for(i=0; i < toneighbors; i++) MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i], todisp[i], 1, totype[i], win); MPI_Win_complete(win); MPI_Win_wait(win); }

... while(!converged(A)){ update_boundary(A); MPI_Win_post(togroup, MPI_MODE_NOPUT, win); MPI_Win_start(fromgroup, 0, win); for(i=0; i < fromneighbors; i++) MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i], fromdisp[i], 1, fromtype[i], win); update_core(A); MPI_Win_complete(win); MPI_Win_wait(win); }

/* communication on A1 and computation on A0 */ update2(A0, A1); /* local update of A0 that depends on A1 (and A0) */ MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win1); for(i=0; i < fromneighbors; i++) MPI_Get(&tobuf1[i], 1, totype1[i], neighbor[i], fromdisp1[i], 1, fromtype1[i], win1); update1(A0); /* local update of A0 that depends on A0 only, concurrent with communication that updates A1 */ if (!converged(A0,A1)) MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0); MPI_Win_complete(win1); MPI_Win_wait(win1); }

== The following example demonstrates the proper synchronization in the unified memory model when a data transfer is implemented with load and store in the case of windows in shared memory (instead of [[versions/v31/API/MPI_PUT|MPI_PUT]] or [[versions/v31/API/MPI_GET|MPI_GET]] ) and the synchronization between processes is performed using point-to-point communication. The synchronization between processes must be supplemented with a memory synchronization through calls to [[versions/v31/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] , which act locally as a processor-memory barrier. In Fortran, if `MPI_ASYNC_PROTECTS_NONBLOCKING` is==

==`.FALSE.` or the variable `X` is not declared as `ASYNCHRONOUS`,==

==reordering of the accesses to the variable `X` must be prevented with [[versions/v31/API/MPI_F_SYNC_REG|MPI_F_SYNC_REG]] operations. (No equivalent function is needed in C.)==

==The variable `X` is contained within a shared memory window and `X` corresponds to the same memory location at both processes. The [[versions/v31/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] operation performed by process A ensures completion of the load/store operations issued by process A. The [[versions/v31/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] operation performed by process B ensures that process A’s updates to `X` are visible to process B.==

==    Process A                        Process B==

==    MPI_WIN_LOCK_ALL(                MPI_WIN_LOCK_ALL(           MPI_MODE_NOCHECK,win)            MPI_MODE_NOCHECK,win)==

==    DO ...                           DO ...       X=...==

==      MPI_F_SYNC_REG(X)       MPI_WIN_SYNC(win)       MPI_SEND                         MPI_RECV                                        MPI_WIN_SYNC(win)                                        MPI_F_SYNC_REG(X)==

==                                       print X==

==                                       MPI_F_SYNC_REG(X)       MPI_RECV                         MPI_SEND       MPI_F_SYNC_REG(X)     END DO                           END DO==

==    MPI_WIN_UNLOCK_ALL(win)          MPI_WIN_UNLOCK_ALL(win)==

==The following example shows how request-based operations can be used to overlap communication with computation. Each process fetches, processes, and writes the result for `NSTEPS` chunks of data. Instead of a single buffer, `M` local buffers are used to allow up to `M` communication operations to overlap with computation.==

==    int         i, j;     MPI_Win     win;     MPI_Request put_req[M] = { MPI_REQUEST_NULL };     MPI_Request get_req;     double      *baseptr;     double      data[M][N];==

==    MPI_Win_allocate(NSTEPS*N*sizeof(double), sizeof(double), MPI_INFO_NULL,       MPI_COMM_WORLD, &baseptr, &win);==

==    MPI_Win_lock_all(0, win);==

==    for (i = 0; i < NSTEPS; i++) {      if (i<M)        j=i;      else        MPI_Waitany(M, put_req, &j, MPI_STATUS_IGNORE);==

==     MPI_Rget(data[j], N, MPI_DOUBLE, target, i*N, N, MPI_DOUBLE, win,               &get_req);      MPI_Wait(&get_req,MPI_STATUS_IGNORE);      compute(i, data[j], ...);      MPI_Rput(data[j], N, MPI_DOUBLE, target, i*N, N, MPI_DOUBLE, win,               &put_req[j]);     }==

==    MPI_Waitall(M, put_req, MPI_STATUSES_IGNORE);     MPI_Win_unlock_all(win);==

==The following example constructs a distributed shared linked list using dynamic windows. Initially process 0 creates the head of the list, attaches it to the window, and broadcasts the pointer to all processes. All processes then concurrently append `N` new elements to the list. When a process attempts to attach its element to the tail of the list it may discover that its tail pointer is stale and it must chase ahead to the new tail before the element can be attached. This example requires some modification to work in an environment where the layout of the structures is different on different processes.==

==    ...     #define NUM_ELEMS 10==

==    #define LLIST_ELEM_NEXT_RANK ( offsetof(llist_elem_t, next) + \                                    offsetof(llist_ptr_t, rank) )     #define LLIST_ELEM_NEXT_DISP ( offsetof(llist_elem_t, next) + \                                    offsetof(llist_ptr_t, disp) )==

==    /* Linked list pointer */     typedef struct {       MPI_Aint disp;       int      rank;     } llist_ptr_t;==

==    /* Linked list element */     typedef struct {       llist_ptr_t next;       int value;     } llist_elem_t;==

==    const llist_ptr_t nil = { (MPI_Aint) MPI_BOTTOM, -1 };==

==    /* List of locally allocated list elements. */     static llist_elem_t **my_elems = NULL;     static int my_elems_size  = 0;     static int my_elems_count = 0;==

==    /* Allocate a new shared linked list element */     MPI_Aint alloc_elem(int value, MPI_Win win) {       MPI_Aint disp;       llist_elem_t *elem_ptr;==

==      /* Allocate the new element and register it with the window */       MPI_Alloc_mem(sizeof(llist_elem_t), MPI_INFO_NULL, &elem_ptr);       elem_ptr->value = value;       elem_ptr->next  = nil;       MPI_Win_attach(win, elem_ptr, sizeof(llist_elem_t));==

==      /* Add the element to the list of local elements so we can free          it later. */       if (my_elems_size == my_elems_count) {         my_elems_size += 100;         my_elems = realloc(my_elems, my_elems_size*sizeof(void*));       }       my_elems[my_elems_count] = elem_ptr;       my_elems_count++;==

==      MPI_Get_address(elem_ptr, &disp);       return disp;     }==

==    int main(int argc, char *argv[]) {       int           procid, nproc, i;       MPI_Win       llist_win;       llist_ptr_t   head_ptr, tail_ptr;==

==      MPI_Init(&argc, &argv);==

==      MPI_Comm_rank(MPI_COMM_WORLD, &procid);       MPI_Comm_size(MPI_COMM_WORLD, &nproc);==

==      MPI_Win_create_dynamic(MPI_INFO_NULL, MPI_COMM_WORLD, &llist_win);==

==      /* Process 0 creates the head node */       if (procid == 0)         head_ptr.disp = alloc_elem(-1, llist_win);==

==      /* Broadcast the head pointer to everyone */       head_ptr.rank = 0;       MPI_Bcast(&head_ptr.disp, 1, MPI_AINT, 0, MPI_COMM_WORLD);       tail_ptr = head_ptr;==

==      /* Lock the window for shared access to all targets */       MPI_Win_lock_all(0, llist_win);==

==      /* All processes concurrently append NUM_ELEMS elements to the list */       for (i = 0; i < NUM_ELEMS; i++) {         llist_ptr_t new_elem_ptr;         int success;==

==        /* Create a new list element and attach it to the window */         new_elem_ptr.rank = procid;         new_elem_ptr.disp = alloc_elem(procid, llist_win);==

==        /* Append the new node to the list.  This might take multiple             attempts if others have already appended and our tail pointer             is stale. */         do {           llist_ptr_t next_tail_ptr = nil;==

==          MPI_Compare_and_swap((void*) &new_elem_ptr.rank, (void*) &nil.rank,               (void*)&next_tail_ptr.rank, MPI_INT, tail_ptr.rank,               MPI_Aint_add(tail_ptr.disp, LLIST_ELEM_NEXT_RANK),               llist_win);==

==          MPI_Win_flush(tail_ptr.rank, llist_win);           success = (next_tail_ptr.rank == nil.rank);==

==          if (success) {             MPI_Accumulate(&new_elem_ptr.disp, 1, MPI_AINT, tail_ptr.rank,                 MPI_Aint_add(tail_ptr.disp, LLIST_ELEM_NEXT_DISP), 1,                 MPI_AINT, MPI_REPLACE, llist_win);==

==            MPI_Win_flush(tail_ptr.rank, llist_win);             tail_ptr = new_elem_ptr;==

==          } else {             /* Tail pointer is stale, fetch the displacement.  May take                multiple tries if it is being updated. */             do {               MPI_Get_accumulate( NULL, 0, MPI_AINT, &next_tail_ptr.disp,                   1, MPI_AINT, tail_ptr.rank,                   MPI_Aint_add(tail_ptr.disp, LLIST_ELEM_NEXT_DISP),                   1, MPI_AINT, MPI_NO_OP, llist_win);==

==              MPI_Win_flush(tail_ptr.rank, llist_win);             } while (next_tail_ptr.disp == nil.disp);             tail_ptr = next_tail_ptr;           }         } while (!success);       }==

==      MPI_Win_unlock_all(llist_win);       MPI_Barrier( MPI_COMM_WORLD );==

==      /* Free all the elements in the list */       for ( ; my_elems_count > 0; my_elems_count--) {         MPI_Win_detach(llist_win,my_elems[my_elems_count-1]);         MPI_Free_mem(my_elems[my_elems_count-1]);       }       MPI_Win_free(&llist_win);     ...==

### MPI-3.1 → MPI-4.0  (9 changed paragraphs)

... ~~while(!converged(A)){~~ ==while (!converged(A)) {== update(A); MPI_Win_fence(MPI_MODE_NOPRECEDE, win); for(i=0; i < toneighbors; i++) MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i], todisp[i], 1, totype[i], win); MPI_Win_fence((MPI_MODE_NOSTORE | MPI_MODE_NOSUCCEED), win); }

... ~~while(!converged(A)){~~ ==while (!converged(A)) {== update_boundary(A); MPI_Win_fence((MPI_MODE_NOPUT | MPI_MODE_NOPRECEDE), win); for(i=0; i < fromneighbors; i++) MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i], fromdisp[i], 1, fromtype[i], win); update_core(A); MPI_Win_fence(MPI_MODE_NOSUCCEED, win); }

... ~~while(!converged(A)){~~ ==while (!converged(A)) {== update(A); MPI_Win_post(fromgroup, 0, win); MPI_Win_start(togroup, 0, win); for(i=0; i < toneighbors; i++) MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i], todisp[i], 1, totype[i], win); MPI_Win_complete(win); MPI_Win_wait(win); }

... ~~while(!converged(A)){~~ ==while (!converged(A)) {== update_boundary(A); MPI_Win_post(togroup, MPI_MODE_NOPUT, win); MPI_Win_start(fromgroup, 0, win); for(i=0; i < fromneighbors; i++) MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i], fromdisp[i], 1, fromtype[i], win); update_core(A); MPI_Win_complete(win); MPI_Win_wait(win); }

... if (!converged(A0,A1)) MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0); MPI_Barrier(comm0); /* the barrier is needed because the start call inside the loop uses the nocheck option */ ~~while(!converged(A0, A1)){~~ ==while (!converged(A0, A1)) {== /* communication on A0 and computation on A1 */ update2(A1, A0); /* local update of A1 that depends on A0 (and A1) */ MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win0); for(i=0; i < fromneighbors; i++) MPI_Get(&tobuf0[i], 1, totype0[i], neighbor[i], fromdisp0[i], 1, fromtype0[i], win0); update1(A1); /* local update of A1 that is concurrent with communication that updates A0 */ MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win1); MPI_Win_complete(win0); MPI_Win_wait(win0);

means to perform an [[versions/v40/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] with the result buffer (given by `result_addr` in the description of [[versions/v40/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] ) on the left side of the assignment, in this case, `z`. This format is also used with [[versions/v40/API/MPI_COMPARE_AND_SWAP|MPI_COMPARE_AND_SWAP]] ==and [[versions/v40/API/MPI_COMM_SIZE|MPI_COMM_SIZE]]== . ==Process B$`...`$ refers to any process other than A.==

The following example implements a naive, non-scalable counting ~~sem­a­phore.~~ ==semaphore.== The example demonstrates the use of [[versions/v40/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] to manipulate the public copy of ~~X,~~ ==`X`,== as well as [[versions/v40/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] to complete operations without ending the access epoch opened with [[versions/v40/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] . To avoid the rules regarding synchronization of the public and private copies of windows, [[versions/v40/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] and [[versions/v40/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] are used to write to or read from the local public copy.

Process A: Process ~~B:~~ ==B...:== MPI_Win_lock_all MPI_Win_lock_all window location X ~~X=2~~ ==X=MPI_Comm_size()== MPI_Win_sync MPI_Barrier MPI_Barrier

~~    Process A                        Process B~~

~~    MPI_WIN_LOCK_ALL(                MPI_WIN_LOCK_ALL(           MPI_MODE_NOCHECK,win)            MPI_MODE_NOCHECK,win)~~

==    Process A:                       Process B:     MPI_WIN_LOCK_ALL(                MPI_WIN_LOCK_ALL(           MPI_MODE_NOCHECK,win)            MPI_MODE_NOCHECK,win)==

} else { /* Tail pointer is stale, fetch the displacement. May take multiple tries if it is being updated. */ do { ~~MPI_Get_accumulate( NULL,~~ ==MPI_Get_accumulate(NULL,== 0, MPI_AINT, &next_tail_ptr.disp, 1, MPI_AINT, tail_ptr.rank, MPI_Aint_add(tail_ptr.disp, LLIST_ELEM_NEXT_DISP), 1, MPI_AINT, MPI_NO_OP, llist_win);

MPI_Win_unlock_all(llist_win); ~~MPI_Barrier( MPI_COMM_WORLD );~~ ==MPI_Barrier(MPI_COMM_WORLD);==

### MPI-4.0 → MPI-4.1  (9 changed paragraphs)

~~The following example shows a generic loosely synchronous, iterative code, using fence synchronization. The window at each process consists of array `A`, which contains the origin and target buffers of the put calls.~~

~~    ...     while (!converged(A)) {       update(A);       MPI_Win_fence(MPI_MODE_NOPRECEDE, win);       for(i=0; i < toneighbors; i++)         MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i],                              todisp[i], 1, totype[i], win);       MPI_Win_fence((MPI_MODE_NOSTORE | MPI_MODE_NOSUCCEED), win);     }~~

==The following example shows a generic loosely synchronous, iterative code, using [[MPI_FENCE]] for synchronization. The window at each MPI process consists of array `A`, which contains the origin and target buffers of the put operations.==

==(code block added)==
``` [MPI]C
...
while (!converged(A)) {
  update(A);
  MPI_Win_fence(MPI_MODE_NOPRECEDE, win);
  for(i=0; i < toneighbors; i++)
    MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i],
            todisp[i], 1, totype[i], win);
  MPI_Win_fence((MPI_MODE_NOSTORE | MPI_MODE_NOSUCCEED), win);
}
```

~~    ...     while (!converged(A)) {       update_boundary(A);       MPI_Win_fence((MPI_MODE_NOPUT | MPI_MODE_NOPRECEDE), win);       for(i=0; i < fromneighbors; i++)         MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i],                         fromdisp[i], 1, fromtype[i], win);       update_core(A);       MPI_Win_fence(MPI_MODE_NOSUCCEED, win);     }~~

~~The get communication can be concurrent with the core update, since they do not access the same locations, and the local update of the origin buffer by the get call can be concurrent with the local update of the core by the `update_core` call. In order to get similar overlap with put communication we would need to use separate windows for the core and for the boundary. This is required because we do not allow local stores to be concurrent with puts on the same, or on overlapping, windows.~~

==(code block added)==
``` [MPI]C
...
while (!converged(A)) {
  update_boundary(A);
  MPI_Win_fence((MPI_MODE_NOPUT | MPI_MODE_NOPRECEDE), win);
  for(i=0; i < fromneighbors; i++)
    MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i],
            fromdisp[i], 1, fromtype[i], win);
  update_core(A);
  MPI_Win_fence(MPI_MODE_NOSUCCEED, win);
}
```

==The get communication can be concurrent with the core update, since they do not access the same locations, and the local update of the origin buffer by the get operation can be concurrent with the local update of the core by the `update_core` call. In order to get similar overlap with put communication we would need to use separate windows for the core and for the boundary. This is required because we do not allow local stores to be concurrent with puts on the same, or on overlapping, windows.==

~~    ...     while (!converged(A)) {       update(A);       MPI_Win_post(fromgroup, 0, win);       MPI_Win_start(togroup, 0, win);       for(i=0; i < toneighbors; i++)         MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i],                 todisp[i], 1, totype[i], win);       MPI_Win_complete(win);       MPI_Win_wait(win);     }~~

~~Same example, with split phases, as in Example [[versions/v41/sections/one-side#Examples|Examples]] .~~

~~    ...     while (!converged(A)) {       update_boundary(A);       MPI_Win_post(togroup, MPI_MODE_NOPUT, win);       MPI_Win_start(fromgroup, 0, win);       for(i=0; i < fromneighbors; i++)         MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i],                 fromdisp[i], 1, fromtype[i], win);       update_core(A);       MPI_Win_complete(win);       MPI_Win_wait(win);     }~~

==(code block added)==
``` [MPI]C
...
while (!converged(A)) {
  update(A);
  MPI_Win_post(fromgroup, 0, win);
  MPI_Win_start(togroup, 0, win);
  for(i=0; i < toneighbors; i++)
    MPI_Put(&frombuf[i], 1, fromtype[i], toneighbor[i],
            todisp[i], 1, totype[i], win);
  MPI_Win_complete(win);
  MPI_Win_wait(win);
}
```

==Same example, with post-start-complete-wait, as in Example [[versions/v41/sections/one-side#Examples|Examples]] .==

==(code block added)==
``` [MPI]C
...
while (!converged(A)) {
  update_boundary(A);
  MPI_Win_post(togroup, MPI_MODE_NOPUT, win);
  MPI_Win_start(fromgroup, 0, win);
  for(i=0; i < fromneighbors; i++)
    MPI_Get(&tobuf[i], 1, totype[i], fromneighbor[i],
            fromdisp[i], 1, fromtype[i], win);
  update_core(A);
  MPI_Win_complete(win);
  MPI_Win_wait(win);
}
```

~~    ...     if (!converged(A0,A1))       MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0);     MPI_Barrier(comm0);     /* the barrier is needed because the start call inside the     loop uses the nocheck option */     while (!converged(A0, A1)) {       /* communication on A0 and computation on A1 */       update2(A1, A0); /* local update of A1 that depends on A0 (and A1) */       MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win0);       for(i=0; i < fromneighbors; i++)         MPI_Get(&tobuf0[i], 1, totype0[i], neighbor[i],                    fromdisp0[i], 1, fromtype0[i], win0);       update1(A1); /* local update of A1 that is                       concurrent with communication that updates A0 */        MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win1);       MPI_Win_complete(win0);       MPI_Win_wait(win0);~~

~~      /* communication on A1 and computation on A0 */       update2(A0, A1); /* local update of A0 that depends on A1 (and A0) */       MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win1);       for(i=0; i < fromneighbors; i++)         MPI_Get(&tobuf1[i], 1, totype1[i], neighbor[i],                     fromdisp1[i], 1, fromtype1[i], win1);       update1(A0); /* local update of A0 that depends on A0 only,                      concurrent with communication that updates A1 */       if (!converged(A0,A1))         MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0);       MPI_Win_complete(win1);       MPI_Win_wait(win1);     }~~

~~A process posts the local window associated with `win0` before it completes RMA accesses to the remote windows associated with `win1`. When the `wait(win1`) call returns, then all neighbors of the calling process have posted the windows associated with `win0`. Conversely, when the `wait(win0)` call returns, then all neighbors of the calling process have posted the windows associated with `win1`. Therefore, the nocheck option can be used with the calls to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] .~~

~~Put calls can be used, instead of get calls, if the area of array `A0` (resp. `A1`) used by the `update(A1, A0)` (resp. `update(A0, A1)`) call is disjoint from the area modified by the RMA communication. On some systems, a put call may be more efficient than a get call, as it requires information exchange only in one direction.~~

==(code block added)==
``` [MPI]C
...
if (!converged(A0,A1))
  MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0);
MPI_Barrier(comm0);
/* the barrier is needed because the start call inside the
loop uses the nocheck option */
while (!converged(A0, A1)) {
  /* communication on A0 and computation on A1 */
  update2(A1, A0); /* local update of A1 that depends on A0 (and A1) */
  MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win0);
  for(i=0; i < fromneighbors; i++)
    MPI_Get(&tobuf0[i], 1, totype0[i], neighbor[i],
            fromdisp0[i], 1, fromtype0[i], win0);
  update1(A1); /* local update of A1 that is
                  concurrent with communication that updates A0 */ 
  MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win1);
  MPI_Win_complete(win0);
  MPI_Win_wait(win0);

  /* communication on A1 and computation on A0 */
  update2(A0, A1); /* local update of A0 that depends on A1 (and A0) */
  MPI_Win_start(neighbors, MPI_MODE_NOCHECK, win1);
  for(i=0; i < fromneighbors; i++)
    MPI_Get(&tobuf1[i], 1, totype1[i], neighbor[i],
            fromdisp1[i], 1, fromtype1[i], win1);
  update1(A0); /* local update of A0 that depends on A0 only,
                 concurrent with communication that updates A1 */
  if (!converged(A0,A1))
    MPI_Win_post(neighbors, (MPI_MODE_NOCHECK | MPI_MODE_NOPUT), win0);
  MPI_Win_complete(win1);
  MPI_Win_wait(win1);
}
```

==An MPI process posts the local window associated with `win0` before it completes RMA accesses to the remote windows associated with `win1`. When the call to [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] on `win1` returns, then all neighbors of the calling MPI process have posted the windows associated with `win0`. Conversely, when the call to [[versions/v41/API/MPI_WIN_WAIT|MPI_WIN_WAIT]] on `win0` returns, then all neighbors of the calling MPI process have posted the windows associated with `win1`. Therefore, the `MPI_MODE_NOCHECK` option can be used with the calls to [[versions/v41/API/MPI_WIN_START|MPI_WIN_START]] .==

==Put operations can be used, instead of get operations, if the area of array `A0` (resp. `A1`) used by `update(A1, A0)` (resp. `update(A0, A1)`) is disjoint from the area modified by the RMA operation. On some systems, a put operation may be more efficient than a get operation, as it requires information exchange only in one direction.==

means to perform ~~an [[versions/v41/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]]~~ ==a get-accumulate operation== with the result buffer (given by `result_addr` in the description of [[versions/v41/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] ) on the left side of the assignment, in this case, `z`. This format is also used with [[versions/v41/API/MPI_COMPARE_AND_SWAP|MPI_COMPARE_AND_SWAP]] and [[versions/v41/API/MPI_COMM_SIZE|MPI_COMM_SIZE]] . Process B$`...`$ refers to any process other than A.

The following example implements a naive, ~~non-scalable~~ ==nonscalable== counting semaphore. The example demonstrates the use of [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] to manipulate the public copy of `X`, as well as [[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] to complete operations without ~~ending~~ ==closing== the access epoch opened with [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] . To avoid the rules regarding synchronization of the public and private copies of windows, [[versions/v41/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] and [[versions/v41/API/MPI_GET_ACCUMULATE|MPI_GET_ACCUMULATE]] are used to write to or read from the local public copy.

~~Process A: Process B...:~~ ==\textbf{Process A} \textbf{Process B...}== MPI_Win_lock_all MPI_Win_lock_all window location X X=MPI_Comm_size() MPI_Win_sync MPI_Barrier MPI_Barrier

MPI_Accumulate(X, MPI_SUM, -1) MPI_Accumulate(X, MPI_SUM, -1)

stack variable z stack variable z do do z = MPI_Get_accumulate(X, z = MPI_Get_accumulate(X, MPI_NO_OP, 0) MPI_NO_OP, 0) MPI_Win_flush(A) MPI_Win_flush(A) while(z!=0) while(z!=0)

Implementing a critical region between two ==MPI== processes (Peterson’s algorithm). Despite their appearance in the following example, [[versions/v41/API/MPI_WIN_LOCK_ALL|MPI_WIN_LOCK_ALL]] and [[versions/v41/API/MPI_WIN_UNLOCK_ALL|MPI_WIN_UNLOCK_ALL]] are not collective calls, but it is frequently useful to ~~start~~ ==open== shared access epochs to all ==MPI== processes from all other ==MPI== processes in a window. Once the access epochs are ~~established,~~ ==opened,== accumulate ~~communication~~ operations ~~and~~ ==as well as== flush and sync synchronization ~~operations~~ can be used to read from or write to the public copy of the window.

~~Process A: Process B:~~ ==\textbf{Process A} \textbf{Process B}== window location X window location Y window location T

MPI_Win_lock_all MPI_Win_lock_all X=1 Y=1 MPI_Win_sync MPI_Win_sync MPI_Barrier MPI_Barrier MPI_Accumulate(T, MPI_REPLACE, 1) MPI_Accumulate(T, MPI_REPLACE, 0) stack variables t,y stack variable t,x t=1 t=0 y=MPI_Get_accumulate(Y, x=MPI_Get_accumulate(X, MPI_NO_OP, 0) MPI_NO_OP, 0) while(y==1 && t==1) do while(x==1 && t==0) do y=MPI_Get_accumulate(Y, x=MPI_Get_accumulate(X, MPI_NO_OP, 0) MPI_NO_OP, 0) t=MPI_Get_accumulate(T, t=MPI_Get_accumulate(T, MPI_NO_OP, 0) MPI_NO_OP, 0) MPI_Win_flush_all MPI_Win_flush(A) done done // critical region // critical region MPI_Accumulate(X, MPI_REPLACE, 0) MPI_Accumulate(Y, MPI_REPLACE, 0) MPI_Win_unlock_all MPI_Win_unlock_all

Implementing a critical region between multiple ==MPI== processes with compare and swap. The call to [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] is necessary on Process A after local initialization of `A` to guarantee the public copy has been updated with the initialization value found in the private copy. It would also be valid to call [[versions/v41/API/MPI_ACCUMULATE|MPI_ACCUMULATE]] with `MPI_REPLACE` to directly initialize the public copy. A call to [[versions/v41/API/MPI_WIN_FLUSH|MPI_WIN_FLUSH]] would be necessary to assure `A` in the public copy of Process A had been updated before the barrier.

~~Process A: Process B...:~~ ==\textbf{Process A} \textbf{Process B...}== MPI_Win_lock_all MPI_Win_lock_all atomic location A A=0 MPI_Win_sync MPI_Barrier MPI_Barrier stack variable ~~r=1~~ ==r = 1== stack variable ~~r=1~~ ==r = 1== while(r != 0) do while(r != 0) do r = MPI_Compare_and_swap(A, 0, 1) r = MPI_Compare_and_swap(A, 0, 1) MPI_Win_flush(A) MPI_Win_flush(A) done done // critical region // critical region r = MPI_Compare_and_swap(A, 1, 0) r = MPI_Compare_and_swap(A, 1, 0) MPI_Win_unlock_all MPI_Win_unlock_all

The following example demonstrates the proper synchronization in the unified memory model when a data transfer is implemented with load and store ==accesses== in the case of windows in ~~shared memory~~ ==*shared memory*== (instead of ==using== [[versions/v41/API/MPI_PUT|MPI_PUT]] or [[versions/v41/API/MPI_GET|MPI_GET]] ) and the synchronization between ==MPI== processes is performed using point-to-point communication. The synchronization between ==MPI== processes must be supplemented with a memory synchronization through calls to [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] , which act locally as a processor-memory barrier. In Fortran, if `MPI_ASYNC_PROTECTS_NONBLOCKING` is

The variable `X` is contained within a ~~shared~~ ==*shared== memory ~~window~~ ==window*== and `X` corresponds to the same memory location at both processes. The ==first call to== [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] ~~operation~~ performed by process A ensures completion of the load/store ~~operations~~ ==accesses== issued by process A. The ==first call to== [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] ~~operation~~ performed by process B ensures that process A’s updates to `X` are visible to process B. ==Similarly, the second call to [[versions/v41/API/MPI_WIN_SYNC|MPI_WIN_SYNC]] on each process ensures correct ordering of the point-to-point communication and thus that the load/store operations on process B have completed before any subsequent load/store accesses to the variable `X` in process A.==

~~Process A: Process B:~~ ==\textbf{Process A} \textbf{Process B}== MPI_WIN_LOCK_ALL( MPI_WIN_LOCK_ALL( MPI_MODE_NOCHECK,win) MPI_MODE_NOCHECK,win)

MPI_F_SYNC_REG(X) ==MPI_WIN_SYNC(win)== MPI_RECV MPI_SEND ==MPI_WIN_SYNC(win)== MPI_F_SYNC_REG(X) END DO END DO

~~The following example shows how request-based operations can be used to overlap communication with computation. Each process fetches, processes, and writes the result for `NSTEPS` chunks of data. Instead of a single buffer, `M` local buffers are used to allow up to `M` communication operations to overlap with computation.~~

~~    int         i, j;     MPI_Win     win;     MPI_Request put_req[M] = { MPI_REQUEST_NULL };     MPI_Request get_req;     double      *baseptr;     double      data[M][N];~~

~~    MPI_Win_allocate(NSTEPS*N*sizeof(double), sizeof(double), MPI_INFO_NULL,       MPI_COMM_WORLD, &baseptr, &win);~~

~~    MPI_Win_lock_all(0, win);~~

~~    for (i = 0; i < NSTEPS; i++) {      if (i<M)        j=i;      else        MPI_Waitany(M, put_req, &j, MPI_STATUS_IGNORE);~~

~~     MPI_Rget(data[j], N, MPI_DOUBLE, target, i*N, N, MPI_DOUBLE, win,               &get_req);      MPI_Wait(&get_req,MPI_STATUS_IGNORE);      compute(i, data[j], ...);      MPI_Rput(data[j], N, MPI_DOUBLE, target, i*N, N, MPI_DOUBLE, win,               &put_req[j]);     }~~

~~    MPI_Waitall(M, put_req, MPI_STATUSES_IGNORE);     MPI_Win_unlock_all(win);~~

~~The following example constructs a distributed shared linked list using dynamic windows. Initially process 0 creates the head of the list, attaches it to the window, and broadcasts the pointer to all processes. All processes then concurrently append `N` new elements to the list. When a process attempts to attach its element to the tail of the list it may discover that its tail pointer is stale and it must chase ahead to the new tail before the element can be attached. This example requires some modification to work in an environment where the layout of the structures is different on different processes.~~

~~    ...     #define NUM_ELEMS 10~~

==The following example shows how request-based operations can be used to overlap communication with computation. Each MPI process fetches, processes, and writes the result for `NSTEPS` chunks of data. Instead of a single buffer, `M` local buffers are used to allow up to `M` communication operations to overlap with computation.==

==(code block added)==
``` [MPI]C
int         i, j;
MPI_Win     win;
MPI_Request put_req[M] = { MPI_REQUEST_NULL };
MPI_Request get_req;
double      *baseptr;
double      data[M][N];

MPI_Win_allocate(NSTEPS*N*sizeof(double), sizeof(double), MPI_INFO_NULL,
                 MPI_COMM_WORLD, &baseptr, &win);

MPI_Win_lock_all(0, win);

for (i = 0; i < NSTEPS; i++) {
 if (i<M)
   j=i;
 else
   MPI_Waitany(M, put_req, &j, MPI_STATUS_IGNORE);

 MPI_Rget(data[j], N, MPI_DOUBLE, target, i*N, N, MPI_DOUBLE, win,
          &get_req);
 MPI_Wait(&get_req,MPI_STATUS_IGNORE);
 compute(i, data[j], ...);
 MPI_Rput(data[j], N, MPI_DOUBLE, target, i*N, N, MPI_DOUBLE, win,
          &put_req[j]);
}

MPI_Waitall(M, put_req, MPI_STATUSES_IGNORE);
MPI_Win_unlock_all(win);
```

==The following example constructs a distributed shared linked list using dynamic windows. Initially process 0 creates the head of the list, attaches it to the window, and broadcasts the pointer to all MPI processes. All MPI processes then concurrently append `N` new elements to the list. When an MPI process attempts to attach its element to the tail of the list it may discover that its tail pointer is stale and it must chase ahead to the new tail before the element can be attached. This example requires some modification to work in an environment where the layout of the structures is different on different MPI processes.==

==    [language={[MPI]C},basicstyle=]     ...     #define NUM_ELEMS 10==

### MPI-4.1 → MPI-5.0  (1 changed paragraph)

The following example shows a generic loosely synchronous, iterative code, using ~~[[MPI_FENCE]]~~ ==[[versions/v50/API/MPI_WIN_FENCE|MPI_WIN_FENCE]]== for synchronization. The window at each MPI process consists of array `A`, which contains the origin and target buffers of the put operations.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/one-side#Examples]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/one-side#Examples]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/one-side#Examples]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/one-side#Examples]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/one-side#Examples]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/one-side#Examples]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/one-side#Examples]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/one-side#Examples]]

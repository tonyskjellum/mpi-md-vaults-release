---
title: "Part 3—Termination:"
chapter: tools
present_in: ["MPI-4.0"]
tags: [mpi/section, mpi/tools]
---

# Part 3—Termination:

Chapter **tools** · in [[versions/v40/sections/tools#Part 3—Termination:|MPI-4.0]]

## Changes along the time axis

### MPI-2.2 → MPI-3.0

_Section appears in MPI-3.0._

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

int ~~MPI_Finalize()~~ ==MPI_Finalize(void)== { int err; err=PMPI_T_pvar_handle_free(session, &handle); err=PMPI_T_pvar_session_free(&session); err=PMPI_T_finalize(); return PMPI_Finalize(); }

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

int MPI_Finalize(void) { int err; ~~err=PMPI_T_pvar_handle_free(session,~~ ==err=PMPI_T_pvar_handle_free(pe_session,== &handle); ~~err=PMPI_T_pvar_session_free(&session);~~ ==err=PMPI_T_pvar_session_free(&pe_session);== err=PMPI_T_finalize(); return PMPI_Finalize(); }

### MPI-4.0 → MPI-4.1

_Section absent from MPI-4.1._

## Text by release

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/tools#Part 3—Termination:]]

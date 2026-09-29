---
title: "Types"
chapter: appLang-Const
present_in: ["MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/appLang-Const]
---

# Types

Chapter **appLang-Const** · in [[versions/v21/sections/appLang-Const#Types|MPI-2.1]], [[versions/v22/sections/appLang-Const#Types|MPI-2.2]], [[versions/v30/sections/appLang-Const#Types|MPI-3.0]], [[versions/v31/sections/appLang-Const#Types|MPI-3.1]], [[versions/v40/sections/appLang-Const#Types|MPI-4.0]], [[versions/v41/sections/appLang-Const#Types|MPI-4.1]], [[versions/v50/sections/appLang-Const#Types|MPI-5.0]]

## Changes along the time axis

### MPI-1.3 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.0 → MPI-2.1

_Section appears in MPI-2.1._

### MPI-2.1 → MPI-2.2  (1 changed paragraph)

~~The following are defined C type definitions, included in the file `mpi.h`.~~

~~    /* C opaque types */     MPI_Aint     MPI_Fint     MPI_Offset     MPI_Status~~

~~    /* C handles to assorted structures */     MPI_Comm     MPI_Datatype     MPI_Errhandler     MPI_File     MPI_Group     MPI_Info     MPI_Op     MPI_Request     MPI_Win~~

~~    // C++ opaque types (all within the MPI namespace)     MPI::Aint     MPI::Offset     MPI::Status~~

~~    // C++ handles to assorted structures (classes,      // all within the MPI namespace)     MPI::Comm     MPI::Intracomm     MPI::Graphcomm     MPI::Cartcomm     MPI::Intercomm     MPI::Datatype     MPI::Errhandler     MPI::Exception     MPI::File     MPI::Group     MPI::Info     MPI::Op     MPI::Request     MPI::Prequest     MPI::Grequest     MPI::Win~~

==The following are defined C type definitions, included in the file `mpi.h`.\ `/* C opaque types */`\ `MPI_Aint`\ `MPI_Fint`\ `MPI_Offset`\ `MPI_Status`\ \ `/* C handles to assorted structures */`\ `MPI_Comm`\ `MPI_Datatype`\ `MPI_Errhandler`\ `MPI_File`\ `MPI_Group`\ `MPI_Info`\ `MPI_Op`\ `MPI_Request`\ `MPI_Win`\ \ `// C++ opaque types (all within the MPI namespace)`\ `MPI::Aint`\ `MPI::Offset`\ `MPI::Status`\ \ `// C++ handles to assorted structures (classes,`\ `// all within the MPI namespace)`\ `MPI::Comm`\ `MPI::Intracomm`\ `MPI::Graphcomm`\ `MPI::Distgraphcomm`\ `MPI::Cartcomm`\ `MPI::Intercomm`\ `MPI::Datatype`\ `MPI::Errhandler`\ `MPI::Exception`\ `MPI::File`\ `MPI::Group`\ `MPI::Info`\ `MPI::Op`\ `MPI::Request`\ `MPI::Prequest`\ `MPI::Grequest`\ `MPI::Win`\==

### MPI-2.2 → MPI-3.0  (1 changed paragraph)

The following are defined C type definitions, included in the file `mpi.h`.\ `/* C opaque types */`\ `MPI_Aint`\ ==`MPI_Count`\== `MPI_Fint`\ `MPI_Offset`\ `MPI_Status`\ ==`MPI_F08_status`\== \ `/* C handles to assorted structures */`\ `MPI_Comm`\ `MPI_Datatype`\ `MPI_Errhandler`\ `MPI_File`\ `MPI_Group`\ `MPI_Info`\ ==`MPI_Message`\== `MPI_Op`\ `MPI_Request`\ `MPI_Win`\ \ ~~`// C++~~ ==`/* Types for the MPI_T interface */`\ `MPI_T_enum`\ `MPI_T_cvar_handle`\ `MPI_T_pvar_handle`\ `MPI_T_pvar_session`\ \ The following are defined Fortran type definitions, included in the `mpi_f08` and `mpi` modules.\ `! Fortran== opaque types ~~(all within~~ ==in== the ~~MPI namespace)`\ `MPI::Aint`\ `MPI::Offset`\ `MPI::Status`\~~ ==mpi_f08 and mpi modules`\ `TYPE(MPI_Status)`\== \ ~~`// C++~~ ==`! Fortran== handles ~~to assorted structures (classes,`\ `// all within~~ ==in== the ~~MPI namespace)`\ `MPI::Comm`\ `MPI::Intracomm`\ `MPI::Graphcomm`\ `MPI::Distgraphcomm`\ `MPI::Cartcomm`\ `MPI::Intercomm`\ `MPI::Datatype`\ `MPI::Errhandler`\ `MPI::Exception`\ `MPI::File`\ `MPI::Group`\ `MPI::Info`\ `MPI::Op`\ `MPI::Request`\ `MPI::Prequest`\ `MPI::Grequest`\ `MPI::Win`\~~ ==mpi_f08 and mpi modules`\ `TYPE(MPI_Comm)`\ `TYPE(MPI_Datatype)`\ `TYPE(MPI_Errhandler)`\ `TYPE(MPI_File)`\ `TYPE(MPI_Group)`\ `TYPE(MPI_Info)`\ `TYPE(MPI_Op)`\ `TYPE(MPI_Request)`\ `TYPE(MPI_Win)`==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

The following are defined C type definitions, included in the file `mpi.h`.\ `/* C opaque types */`\ `MPI_Aint`\ `MPI_Count`\ `MPI_Fint`\ `MPI_Offset`\ `MPI_Status`\ `MPI_F08_status`\ \ `/* C handles to assorted structures */`\ `MPI_Comm`\ `MPI_Datatype`\ `MPI_Errhandler`\ `MPI_File`\ `MPI_Group`\ `MPI_Info`\ `MPI_Message`\ `MPI_Op`\ `MPI_Request`\ `MPI_Win`\ \ `/* Types for the MPI_T interface */`\ `MPI_T_enum`\ `MPI_T_cvar_handle`\ `MPI_T_pvar_handle`\ `MPI_T_pvar_session`\ \ The following are defined Fortran type definitions, included in the `mpi_f08` and `mpi` modules.\ `! Fortran opaque types in the mpi_f08 and mpi modules`\ `TYPE(MPI_Status)`\ \ `! Fortran handles in the mpi_f08 and mpi modules`\ `TYPE(MPI_Comm)`\ `TYPE(MPI_Datatype)`\ `TYPE(MPI_Errhandler)`\ `TYPE(MPI_File)`\ `TYPE(MPI_Group)`\ `TYPE(MPI_Info)`\ ==`TYPE(MPI_Message)`\== `TYPE(MPI_Op)`\ `TYPE(MPI_Request)`\ `TYPE(MPI_Win)`

### MPI-3.1 → MPI-4.0  (1 changed paragraph)

The following are defined C type ~~definitions,~~ ==definitions== included in the file `mpi.h`.\ `/* C opaque types */`\ `MPI_Aint`\ `MPI_Count`\ `MPI_Fint`\ `MPI_Offset`\ `MPI_Status`\ `MPI_F08_status`\ \ `/* C handles to assorted structures */`\ `MPI_Comm`\ `MPI_Datatype`\ `MPI_Errhandler`\ `MPI_File`\ `MPI_Group`\ `MPI_Info`\ `MPI_Message`\ `MPI_Op`\ `MPI_Request`\ ==`MPI_Session`\== `MPI_Win`\ \ `/* Types for the MPI_T interface */`\ `MPI_T_enum`\ `MPI_T_cvar_handle`\ `MPI_T_pvar_handle`\ `MPI_T_pvar_session`\ ==`MPI_T_event_instance`\ `MPI_T_event_registration`\ `MPI_T_source_order`\ `MPI_T_cb_safety`\== \ The following are defined Fortran type ~~definitions,~~ ==definitions== included in the `mpi_f08` and `mpi` modules.\ `! Fortran opaque types in the mpi_f08 and mpi modules`\ `TYPE(MPI_Status)`\ \ `! Fortran handles in the mpi_f08 and mpi modules`\ `TYPE(MPI_Comm)`\ `TYPE(MPI_Datatype)`\ `TYPE(MPI_Errhandler)`\ `TYPE(MPI_File)`\ `TYPE(MPI_Group)`\ `TYPE(MPI_Info)`\ `TYPE(MPI_Message)`\ `TYPE(MPI_Op)`\ `TYPE(MPI_Request)`\ ==`TYPE(MPI_Session)`\== `TYPE(MPI_Win)`

## Text by release

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/appLang-Const#Types]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/appLang-Const#Types]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/appLang-Const#Types]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/appLang-Const#Types]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/appLang-Const#Types]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/appLang-Const#Types]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/appLang-Const#Types]]

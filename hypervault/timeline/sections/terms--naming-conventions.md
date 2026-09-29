---
title: "Naming Conventions"
chapter: terms
present_in: ["MPI-2.0", "MPI-2.1", "MPI-2.2", "MPI-3.0", "MPI-3.1", "MPI-4.0", "MPI-4.1", "MPI-5.0"]
tags: [mpi/section, mpi/terms]
---

# Naming Conventions

Chapter **terms** · in [[versions/v20/sections/terms#Naming Conventions|MPI-2.0]], [[versions/v21/sections/terms#Naming Conventions|MPI-2.1]], [[versions/v22/sections/terms#Naming Conventions|MPI-2.2]], [[versions/v30/sections/terms#Naming Conventions|MPI-3.0]], [[versions/v31/sections/terms#Naming Conventions|MPI-3.1]], [[versions/v40/sections/terms#Naming Conventions|MPI-4.0]], [[versions/v41/sections/terms#Naming Conventions|MPI-4.1]], [[versions/v50/sections/terms#Naming Conventions|MPI-5.0]]

## Changes along the time axis

### MPI-2.0 → MPI-2.1  (2 changed paragraphs)

~~MPI-1 used informal naming conventions.~~ In many ~~cases, MPI-1~~ ==cases MPI== names for C functions are of the form [[Class_action_subset]] ~~and in Fortran of the form [[CLASS_ACTION_SUBSET]] , but this rule is not uniformly applied. In MPI-2,~~ ==. This convention originated with MPI-1. Since MPI-2== an attempt has been made to standardize ==the== names of ~~new~~ ==MPI== functions according to the following rules. ~~In addition, the~~ ==The== C++ bindings ~~for MPI-1 functions also~~ ==in particular== follow these rules (see Section [[terms-cpp]] ==on page [[terms-cpp]]== ). ~~C and Fortran function names for MPI-1 have not been changed.~~

~~C and Fortran names for MPI-1 functions violate these rules in several cases. The most common exceptions are the omission of the **Class** name from the routine and the omission of the **Action** where one can be inferred.~~

==C and Fortran names for==

==some MPI functions (that were defined during the MPI-1 process)==

==violate these rules in several cases. The most common exceptions are the omission of the **Class** name from the routine and the omission of the **Action** where one can be inferred.==

### MPI-2.1 → MPI-2.2  (2 changed paragraphs)

In many cases MPI names for C functions are of the form ~~[[Class_action_subset]] .~~ ==`MPI_Class_action_subset`.== This convention originated with MPI-1. Since MPI-2 an attempt has been made to standardize the names of MPI functions according to the following rules. The C++ bindings in particular follow these rules (see Section [[terms-cpp]] on page [[terms-cpp]] ).

1. In C, all routines associated with a particular type of MPI object should be of the form ~~[[Class_action_subset]]~~ ==`MPI_Class_action_subset`== or, if no subset exists, of the form ~~[[Class_action]] .~~ ==`MPI_Class_action`.== In Fortran, all routines associated with a particular type of MPI object should be of the form ~~[[CLASS_ACTION_SUBSET]]~~ ==`MPI_CLASS_ACTION_SUBSET`== or, if no subset exists, of the form ~~[[CLASS_ACTION]] .~~ ==`MPI_CLASS_ACTION`.== For C and Fortran we use the C++ terminology to define the ~~[[Class]] .~~ ==`Class`.== In C++, the routine is a method on **Class** and is named ~~**MPI::Class::Action_subset**.~~ ==`MPI::Class::Action_subset`.==

2. If the routine is not associated with a class, the name should be of the form ~~[[Action_subset]]~~ ==`MPI_Action_subset`== in C and ~~[[ACTION_SUBSET]]~~ ==`MPI_ACTION_SUBSET`== in Fortran, and in C++ should be scoped in the ~~**MPI**~~ ==`MPI`== namespace, ~~**MPI::Action_subset**.~~ ==`MPI::Action_subset`.==

### MPI-2.2 → MPI-3.0  (2 changed paragraphs)

~~In many cases MPI names for C functions are of the form `MPI_Class_action_subset`. This convention originated with MPI-1. Since MPI-2 an attempt has been made to standardize the names of MPI functions according to the following rules. The C++ bindings in particular follow these rules (see Section [[terms-cpp]] on page [[terms-cpp]] ).~~

~~1.  In C, all routines associated with a particular type of MPI object should be of the form `MPI_Class_action_subset` or, if no subset exists, of the form `MPI_Class_action`. In Fortran, all routines associated with a particular type of MPI object should be of the form `MPI_CLASS_ACTION_SUBSET` or, if no subset exists, of the form `MPI_CLASS_ACTION`. For C and Fortran we use the C++ terminology to define the `Class`. In C++, the routine is a method on **Class** and is named `MPI::Class::Action_subset`.~~

~~    If the routine is associated with a certain class, but does not make sense as an object method, it is a static member function of the class.~~

~~2.  If the routine is not associated with a class, the name should be of the form `MPI_Action_subset` in C and `MPI_ACTION_SUBSET` in Fortran, and in C++ should be scoped in the `MPI` namespace, `MPI::Action_subset`.~~

==In many cases MPI names for C functions are of the form `MPI_Class_action_subset`. This convention originated with MPI-1. Since MPI-2 an attempt has been made to standardize the names of MPI functions according to the following rules.==

==1.  In C, all routines associated with a particular type of MPI object should be of the form `MPI_Class_action_subset` or, if no subset exists, of the form `MPI_Class_action`. In Fortran, all routines associated with a particular type of MPI object should be of the form `MPI_CLASS_ACTION_SUBSET` or, if no subset exists, of the form `MPI_CLASS_ACTION`.==

==2.  If the routine is not associated with a class, the name should be of the form `MPI_Action_subset` in C and `MPI_ACTION_SUBSET` in Fortran.==

~~some MPI functions (that were defined during the MPI-1 process)~~

~~violate these rules in several cases. The most common exceptions are the omission of the **Class** name from the routine and the omission of the **Action** where one can be inferred.~~

==some MPI functions (that were defined during the MPI-1 process) violate these rules in several cases. The most common exceptions are the omission of the **Class** name from the routine and the omission of the **Action** where one can be inferred.==

### MPI-3.0 → MPI-3.1  (1 changed paragraph)

~~3.  The names of certain actions have been standardized. In particular, **Create** creates a new object, **Get** retrieves information about an object, **Set** sets this information, **Delete** deletes information, **Is** asks whether or not an object has a certain property.~~

~~C and Fortran names for~~

~~some MPI functions (that were defined during the MPI-1 process) violate these rules in several cases. The most common exceptions are the omission of the **Class** name from the routine and the omission of the **Action** where one can be inferred.~~

==3.  The names of certain actions have been standardized. In particular, **Create** creates a new object, **Get** retrieves information about an object, **set** sets this information, **Delete** deletes information, **Is** asks whether or not an object has a certain property.==

==C and Fortran names for some MPI functions (that were defined during the MPI-1 process) violate these rules in several cases. The most common exceptions are the omission of the **Class** name from the routine and the omission of the **Action** where one can be inferred.==

### MPI-3.1 → MPI-4.0  (2 changed paragraphs)

In many cases MPI names for C functions are of the form ~~`MPI_Class_action_subset`.~~ ==[[MPI_Class_action_subset]] .== This convention originated with MPI-1. Since MPI-2 an attempt has been made to standardize the names of MPI functions according to the following rules.

1. In ~~C,~~ ==C and the Fortran `mpi_f08` module,== all routines associated with a particular type of MPI object should be of the form ~~`MPI_Class_action_subset`~~ ==[[MPI_Class_action_subset]]== or, if no subset exists, of the form ~~`MPI_Class_action`.~~ ==[[MPI_Class_action]] .== In ~~Fortran,~~ ==the Fortran `mpi` module and `mpif.h` file,== all routines associated with a particular type of MPI object should be of the form ~~`MPI_CLASS_ACTION_SUBSET`~~ ==[[MPI_CLASS_ACTION_SUBSET]]== or, if no subset exists, of the form ~~`MPI_CLASS_ACTION`.~~ ==[[MPI_CLASS_ACTION]] .==

2. If the routine is not associated with a class, the name should be of the form ~~`MPI_Action_subset`~~ ==[[MPI_Action_subset]] or [[MPI_ACTION_SUBSET]]== in C and ~~`MPI_ACTION_SUBSET` in~~ Fortran.

3. The names of certain actions have been standardized. In particular, **Create** creates a new object, **Get** retrieves information about an object, ~~**set**~~ ==**Set**== sets this information, **Delete** deletes information, **Is** asks whether or not an object has a certain property.

~~MPI identifiers are limited to 30 characters (31 with the profiling interface). This is done to avoid exceeding the limit on some compilation systems.~~

### MPI-4.0 → MPI-4.1  (2 changed paragraphs)

1. In C and the Fortran `mpi_f08` module, all routines associated with a particular type of MPI object should be of the form [[MPI_Class_action_subset]] or, if no subset exists, of the form [[MPI_Class_action]] . In the Fortran `mpi` module and ==(deprecated)== `mpif.h` file, all routines associated with a particular type of MPI object should be of the form [[MPI_CLASS_ACTION_SUBSET]] or, if no subset exists, of the form [[MPI_CLASS_ACTION]] .

3. The names of certain actions have been standardized. In particular, ~~**Create**~~ ==**create**== creates a new object, ~~**Get**~~ ==**get**== retrieves information about an object, ~~**Set**~~ ==**set**== sets this information, ~~**Delete**~~ ==**delete**== deletes information, ~~**Is**~~ ==**is**== asks whether or not an object has a certain property.

## Text by release

> [!abstract]- MPI-2.0
> ![[versions/v20/sections/terms#Naming Conventions]]

> [!abstract]- MPI-2.1
> ![[versions/v21/sections/terms#Naming Conventions]]

> [!abstract]- MPI-2.2
> ![[versions/v22/sections/terms#Naming Conventions]]

> [!abstract]- MPI-3.0
> ![[versions/v30/sections/terms#Naming Conventions]]

> [!abstract]- MPI-3.1
> ![[versions/v31/sections/terms#Naming Conventions]]

> [!abstract]- MPI-4.0
> ![[versions/v40/sections/terms#Naming Conventions]]

> [!abstract]- MPI-4.1
> ![[versions/v41/sections/terms#Naming Conventions]]

> [!abstract]- MPI-5.0
> ![[versions/v50/sections/terms#Naming Conventions]]

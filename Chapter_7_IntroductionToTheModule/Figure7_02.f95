MODULE employee_type_def

  IMPLICIT NONE

  TYPE :: employee_type                           ! derived-type definition
    CHARACTER(20) :: name
    INTEGER       :: number
    LOGICAL       :: is_married
  END TYPE employee_type

END MODULE employee_type_def


SUBROUTINE print_struct(employee)

  USE employee_type_def                           ! Access derived-type definition.

  IMPLICIT NONE

  TYPE(employee_type), INTENT(IN) :: employee     ! derived-type dummy argument

  PRINT "(1X, A, I5, 1X, L1)", employee

END SUBROUTINE print_struct



PROGRAM demo_derived_type_def_in_module

  USE employee_type_def                           ! Access derived-type definition.

  TYPE(employee_type) :: empl                     ! actual argument of derived-type

  empl = employee_type("Ima Nerd", 1234, .TRUE.)
  CALL print_struct(empl)

END PROGRAM demo_derived_type_def_in_module

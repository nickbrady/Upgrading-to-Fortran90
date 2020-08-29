PROGRAM demo_derived_type

  IMPLICIT NONE

  TYPE :: employee_type                   ! Define a derived type named employee
    CHARACTER(75) :: name                 ! type
    INTEGER       :: age
    REAL          :: salary
    LOGICAL       :: is_married
  END TYPE

  TYPE (employee_type) :: an_employee     ! Declare a variable named an_employee
                                          ! to be of type employee_type

                                          ! Individual components of an_employee
  an_employee % name        = "John Doe"  ! can be referenced
  an_employee % age         = 56          !
  an_employee % salary      = 987.65      ! assign values to individual components
  an_employee % is_married  = .TRUE.      ! of an_employee

  PRINT "(1X, A, /, I3, F9.2, 2X, L1)", an_employee   ! the group of values can
                                                      ! be referenced collectively

                                                      ! Structure constructor used
                                                      ! to right of equal sign
  an_employee = employee_type ("Mary Roe", 32, 1234.56, .FALSE.)

                                                      ! Display values referencing
                                                      ! individual components
  PRINT "(1X, A)",                an_employee % name
  PRINT "(I3, F9.2, 2X, L1)",     an_employee % age,      &
                                  an_employee % salary,   &
                                  an_employee % is_married


END PROGRAM demo_derived_type

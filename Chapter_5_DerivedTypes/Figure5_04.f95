PROGRAM demo_structure_constructors

  TYPE :: string_type
    REAL          :: x_loc, y_loc
    CHARACTER(20) :: text
    INTEGER       :: font
  END TYPE string_type

  ! structure constructor used to initialize a variable
  TYPE(string_type) :: s_1 = string_type (2.1, 10.5, "Header String", 73)

  REAL :: y = 2.0

  PRINT "(2F8.3, 1X, A, I3)", s_1

  ! structure constructor used in an executable statement
  s_1 = string_type(3, 9, "Subheader String", 76)
  PRINT "(2F8.3, 1X, A, I3)", s_1

  ! Expr list for struct constructor may contain a variable.
  s_1 = string_type(4.0, 2.54 * y, "Annotation Goes Here", 88)
  PRINT "(2F8.3, 1X, A, I3)", s_1

END PROGRAM demo_structure_constructors

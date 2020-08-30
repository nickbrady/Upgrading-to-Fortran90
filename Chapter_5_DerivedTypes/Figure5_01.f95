PROGRAM demo_derived_type

  ! Define a derived type named student_type
  TYPE :: student_type
    CHARACTER(20) :: name           ! Define student_type as consisting of 3
    INTEGER       :: age            ! components, each of different data type
    REAL          :: gpa
  END TYPE student_type

  ! Declare a variable a_student of type student_type
  TYPE(student_type) :: a_student

  ! Assign a value to each component of a_student
  a_student%name = "Maria Johnson"
  a_student%age  = 21
  a_student%gpa  = 3.4

  ! Display the value assigned to each component
  PRINT "(1X, A, I3, F5.1)", a_student

END PROGRAM demo_derived_type

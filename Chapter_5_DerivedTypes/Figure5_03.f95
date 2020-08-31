PROGRAM demo_structure_assignment

  TYPE :: date_type
    INTEGER       :: day
    CHARACTER(9)  :: month
    INTEGER       :: year
  END TYPE date_type

  TYPE(date_type) :: date_1, date_2

  date_1%day    = 10
  date_1%month  = "September"
  date_1%year   = 1938

  date_2  = date_1          ! structure-to-structure assignment

  PRINT "(I3, 1X, A, I5)", date_2

END PROGRAM demo_structure_assignment

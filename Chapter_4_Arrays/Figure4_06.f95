PROGRAM demo_array_literal_constants

  REAL, DIMENSION(4) :: a
  REAL, DIMENSION(4) :: b = (/ 1.0, -1.0, -2.0, 3.0 /)

  a = (/ -1.0, 2.0, -3.0, 1.0 /)

  b = a * b + (/ 2.0, -1.0, -4.0, 1.0 /)

  PRINT "(4F6.1)", b

END PROGRAM demo_array_literal_constants
